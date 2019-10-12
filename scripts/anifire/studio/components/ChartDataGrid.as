package anifire.studio.components
{
   import anifire.studio.events.ChartDataGridEvent;
   import anifire.util.UtilDict;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import mx.collections.IList;
   import mx.core.DragSource;
   import mx.core.IFactory;
   import mx.core.IFlexDisplayObject;
   import mx.events.CollectionEvent;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.DragManager;
   import mx.utils.StringUtil;
   import spark.components.Button;
   import spark.components.DataGrid;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridSelectionMode;
   import spark.components.gridClasses.IGridItemRenderer;
   import spark.core.IViewport;
   import spark.core.NavigationUnit;
   import spark.events.GridEvent;
   
   public class ChartDataGrid extends DataGrid
   {
      
      public static const GRID_COLUMN_DRAG_FORMAT:String = "gridColumnDragFormat";
      
      public static const DATA_ROW_DRAG_FORMAT:String = "dataRowDragFormat";
      
      private static const MAX_ROW_COUNT_TEXT:String = "Maximum {0} values.";
      
      private static const DELETE_ROW_TEXT:String = "Delete Row";
      
      private static const DELETE_COLUMN_TEXT:String = "Delete Column";
      
      private static const DRAG_TIMER_DELAY:Number = 100;
      
      private static const HORIZONTAL_AUTO_SCROLL_STEP_SIZE:Number = 20;
      
      private static const VERTICAL_AUTO_SCROLL_STEP_SIZE:Number = 20;
      
      private static const HORIZONTAL_AUTO_SCROLL_THRESHOLD:Number = 30;
      
      private static const VERTICAL_AUTO_SCROLL_THRESHOLD:Number = 40;
       
      
      [SkinPart(required="false")]
      public var addColumnButton:Button;
      
      [SkinPart(required="false")]
      public var addRowButton:Button;
      
      [SkinPart(required="false")]
      public var swapAxisButton:Button;
      
      [SkinPart(required="false")]
      public var deleteButton:Button;
      
      [SkinPart(required="false")]
      public var maxRowCountLabel:Label;
      
      [SkinPart(required="false")]
      public var rowDragIndicator:Group;
      
      [SkinPart(required="false")]
      public var columnDragIndicator:Group;
      
      [SkinPart(required="false")]
      public var gridViewport:IViewport;
      
      public var contentChanged:Boolean;
      
      private var _1148456632showMaxRowCountLabel:Boolean;
      
      protected var _addColumnButtonVisible:Boolean = true;
      
      protected var _swapAxisButtonVisible:Boolean = true;
      
      private var _maxRowCount:int = -1;
      
      private var _selectedColumnIndex:int = -1;
      
      private var _selectedRowIndex:int = -1;
      
      private var _supportNegativeValue:Boolean;
      
      private var _dragColumn:GridColumn;
      
      private var _dragRowIndex:int;
      
      private var _dragItemRenderer:IGridItemRenderer;
      
      private var _dragOverItemRenderer:IGridItemRenderer;
      
      private var _dropRowIndex:int = -1;
      
      private var _dropColumnIndex:int = -1;
      
      private var _autoScrollTimer:Timer;
      
      private var _shouldOpenColorPicker:Boolean;
      
      public function ChartDataGrid()
      {
         super();
         this._autoScrollTimer = new Timer(DRAG_TIMER_DELAY,1000);
         this.addEventListener(FlexEvent.CREATION_COMPLETE,this.creationCompleteHandler);
      }
      
      public function get shouldOpenColorPicker() : Boolean
      {
         return this._shouldOpenColorPicker;
      }
      
      public function set shouldOpenColorPicker(param1:Boolean) : void
      {
         if(this._shouldOpenColorPicker != param1)
         {
            this._shouldOpenColorPicker = param1;
         }
      }
      
      public function get supportNegativeValue() : Boolean
      {
         return this._supportNegativeValue;
      }
      
      public function set supportNegativeValue(param1:Boolean) : void
      {
         this._supportNegativeValue = param1;
      }
      
      public function get addColumnButtonVisible() : Boolean
      {
         return this._addColumnButtonVisible;
      }
      
      public function set addColumnButtonVisible(param1:Boolean) : void
      {
         if(this._addColumnButtonVisible != param1)
         {
            this._addColumnButtonVisible = param1;
            if(this.addColumnButton)
            {
               this.addColumnButton.visible = param1;
            }
         }
      }
      
      public function get swapAxisButtonVisible() : Boolean
      {
         return this._swapAxisButtonVisible;
      }
      
      public function set swapAxisButtonVisible(param1:Boolean) : void
      {
         if(this._swapAxisButtonVisible != param1)
         {
            this._swapAxisButtonVisible = param1;
            if(this.swapAxisButton)
            {
               this.swapAxisButton.visible = param1;
            }
         }
      }
      
      public function get maxRowCount() : int
      {
         return this._maxRowCount;
      }
      
      public function set maxRowCount(param1:int) : void
      {
         if(this._maxRowCount != param1)
         {
            this._maxRowCount = param1;
            if(this.maxRowCountLabel)
            {
               this.maxRowCountLabel.text = StringUtil.substitute(UtilDict.toDisplay("go",MAX_ROW_COUNT_TEXT),param1);
            }
         }
      }
      
      private function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.addEventListener(GridEvent.GRID_MOUSE_DRAG,this.gridMouseDragHandler);
         this.addEventListener(GridEvent.GRID_MOUSE_DOWN,this.gridMouseDownHandler);
      }
      
      protected function gridMouseDownHandler(param1:GridEvent) : void
      {
         this._dragItemRenderer = param1.itemRenderer;
      }
      
      protected function gridMouseDragHandler(param1:GridEvent) : void
      {
         this._dropRowIndex = param1.rowIndex;
         this._dragOverItemRenderer = param1.itemRenderer;
         if(DragManager.isDragging || this._dragItemRenderer != param1.itemRenderer)
         {
            return;
         }
         if(param1.rowIndex == -1 && param1.columnIndex > 0)
         {
            this.startColumnDragDrop(param1);
         }
         else if(param1.rowIndex >= 0 && param1.columnIndex == 0)
         {
            this.startRowDragDrop(param1);
         }
      }
      
      private function startColumnDragDrop(param1:GridEvent) : void
      {
         this.updateSelectedColumnIndex(param1.columnIndex);
         this._dragColumn = param1.column;
         var _loc2_:DragSource = new DragSource();
         _loc2_.addData(this._dragColumn,GRID_COLUMN_DRAG_FORMAT);
         var _loc3_:IFactory = this._dragColumn.headerRenderer;
         if(!_loc3_)
         {
            _loc3_ = this.columnHeaderGroup.headerRenderer;
         }
         var _loc4_:IGridItemRenderer = IGridItemRenderer(_loc3_.newInstance());
         _loc4_.visible = true;
         _loc4_.column = this._dragColumn;
         _loc4_.label = this._dragColumn.headerText;
         if(_loc4_ is WidgetGridHeaderRenderer)
         {
            WidgetGridHeaderRenderer(_loc4_).setSelected(true);
            WidgetGridHeaderRenderer(_loc4_).hideColorPicker();
         }
         var _loc5_:IGridItemRenderer = this.columnHeaderGroup.getHeaderRendererAt(param1.columnIndex);
         _loc4_.width = _loc5_.width;
         _loc4_.height = _loc5_.height;
         _loc4_.prepare(false);
         var _loc6_:Point = new Point(0,0);
         _loc6_ = DisplayObject(_loc5_).localToGlobal(_loc6_);
         _loc6_ = DisplayObject(this).globalToLocal(_loc6_);
         DragManager.doDrag(this,_loc2_,param1,_loc4_ as IFlexDisplayObject,-_loc6_.x,-_loc6_.y);
         _loc4_.owner = this;
         this.columnHeaderGroup.addEventListener(DragEvent.DRAG_ENTER,this.columnHeaderGroup_dragEnterHandler);
      }
      
      protected function autoScrollTimer_timerHandler(param1:TimerEvent) : void
      {
         if(this.gridViewport)
         {
            if(this._dropColumnIndex > 0)
            {
               if(this.mouseX < HORIZONTAL_AUTO_SCROLL_THRESHOLD)
               {
                  this.gridViewport.horizontalScrollPosition = this.gridViewport.horizontalScrollPosition - HORIZONTAL_AUTO_SCROLL_STEP_SIZE;
               }
               else if(this.mouseX > this.width - HORIZONTAL_AUTO_SCROLL_THRESHOLD)
               {
                  this.gridViewport.horizontalScrollPosition = this.gridViewport.horizontalScrollPosition + HORIZONTAL_AUTO_SCROLL_STEP_SIZE;
               }
            }
            else if(this._dropRowIndex >= 0)
            {
               if(this.mouseY < this.columnHeaderGroup.height + VERTICAL_AUTO_SCROLL_THRESHOLD)
               {
                  this.gridViewport.verticalScrollPosition = this.gridViewport.verticalScrollPosition - VERTICAL_AUTO_SCROLL_STEP_SIZE;
               }
               else if(this.mouseY > this.height - VERTICAL_AUTO_SCROLL_THRESHOLD)
               {
                  this.gridViewport.verticalScrollPosition = this.gridViewport.verticalScrollPosition + VERTICAL_AUTO_SCROLL_STEP_SIZE;
               }
            }
         }
      }
      
      private function columnHeaderGroup_dragEnterHandler(param1:DragEvent) : void
      {
         var _loc3_:DataGrid = null;
         var _loc2_:DragSource = param1.dragSource;
         if(_loc2_ && _loc2_.hasFormat(GRID_COLUMN_DRAG_FORMAT))
         {
            _loc3_ = param1.dragInitiator as DataGrid;
            if(_loc3_ && _loc3_.columnHeaderGroup == this.columnHeaderGroup)
            {
               this.showColumnDropFeedback(param1);
               DragManager.acceptDragDrop(this.columnHeaderGroup);
               this.columnHeaderGroup.addEventListener(DragEvent.DRAG_OVER,this.columnHeaderGroup_dragOverHandler);
               this.columnHeaderGroup.addEventListener(DragEvent.DRAG_EXIT,this.columnHeaderGroup_dragExitHandler);
               this.columnHeaderGroup.addEventListener(DragEvent.DRAG_DROP,this.columnHeaderGroup_dragDropHandler);
               this._autoScrollTimer.reset();
               this._autoScrollTimer.addEventListener(TimerEvent.TIMER,this.autoScrollTimer_timerHandler);
               this._autoScrollTimer.start();
            }
         }
      }
      
      private function columnHeaderGroup_dragOverHandler(param1:DragEvent) : void
      {
         this.showColumnDropFeedback(param1);
      }
      
      private function columnHeaderGroup_dragExitHandler(param1:DragEvent) : void
      {
         this.removeColumnHeaderGroupListeners();
         this.removeColumnDropIndicator();
         this._dropColumnIndex = -1;
         this._autoScrollTimer.stop();
      }
      
      private function columnHeaderGroup_dragDropHandler(param1:DragEvent) : void
      {
         this.removeColumnHeaderGroupListeners();
         this.dropColumn(param1);
         this.removeColumnDropIndicator();
         this._dropColumnIndex = -1;
         this._autoScrollTimer.stop();
      }
      
      private function removeColumnHeaderGroupListeners() : void
      {
         this.columnHeaderGroup.removeEventListener(DragEvent.DRAG_OVER,this.columnHeaderGroup_dragOverHandler);
         this.columnHeaderGroup.removeEventListener(DragEvent.DRAG_EXIT,this.columnHeaderGroup_dragExitHandler);
         this.columnHeaderGroup.removeEventListener(DragEvent.DRAG_DROP,this.columnHeaderGroup_dragDropHandler);
      }
      
      private function removeColumnDropIndicator() : void
      {
         if(this.columnDragIndicator)
         {
            this.columnDragIndicator.visible = false;
         }
      }
      
      private function showColumnDropFeedback(param1:DragEvent) : void
      {
         var _loc5_:IGridItemRenderer = null;
         if(!this.columnDragIndicator)
         {
            return;
         }
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         _loc2_ = this.columnHeaderGroup.globalToLocal(_loc2_);
         var _loc3_:int = this.columnHeaderGroup.getHeaderIndexAt(_loc2_.x,_loc2_.y);
         var _loc4_:Number = 1;
         if(_loc3_ > 0)
         {
            _loc5_ = this.columnHeaderGroup.getHeaderRendererAt(_loc3_);
            this.columnDragIndicator.visible = true;
            if(_loc2_.x < _loc5_.x + _loc5_.width * 0.5)
            {
               this.columnDragIndicator.x = _loc5_.x - this.columnDragIndicator.width * 0.5 + _loc4_;
            }
            else
            {
               this.columnDragIndicator.x = _loc5_.x + _loc5_.width - this.columnDragIndicator.width * 0.5 + _loc4_;
               _loc3_++;
            }
            this._dropColumnIndex = _loc3_;
         }
         else
         {
            this._dropColumnIndex = -1;
            this.removeColumnDropIndicator();
         }
      }
      
      private function dropColumn(param1:DragEvent) : void
      {
         var _loc3_:ChartDataGridEvent = null;
         if(!this._dragColumn || this._dragColumn.columnIndex < 1 || this._dropColumnIndex < 1)
         {
            return;
         }
         var _loc2_:int = this._dragColumn.columnIndex;
         if(this._dropColumnIndex > _loc2_)
         {
            this._dropColumnIndex--;
         }
         if(this._dropColumnIndex != _loc2_)
         {
            _loc3_ = new ChartDataGridEvent(ChartDataGridEvent.COLUMN_ORDER_CHANGE);
            _loc3_.columnIndex = _loc2_;
            _loc3_.newColumnIndex = this._dropColumnIndex;
            this.dispatchEvent(_loc3_);
            callLater(this.updateSelectedColumnIndex,[this._dropColumnIndex]);
         }
      }
      
      private function startRowDragDrop(param1:GridEvent) : void
      {
         this.updateSelectedRowIndex(param1.rowIndex);
         this._dragRowIndex = param1.rowIndex;
         var _loc2_:DragSource = new DragSource();
         _loc2_.addData(this._dragRowIndex,DATA_ROW_DRAG_FORMAT);
         var _loc3_:IFactory = param1.column.itemRenderer;
         if(!_loc3_)
         {
            _loc3_ = this.itemRenderer;
         }
         var _loc4_:IGridItemRenderer = IGridItemRenderer(_loc3_.newInstance());
         _loc4_.visible = true;
         _loc4_.data = param1.item;
         _loc4_.label = param1.item.label;
         if(_loc4_ is WidgetGridLabelRenderer)
         {
            WidgetGridLabelRenderer(_loc4_).setSelected(true);
            WidgetGridLabelRenderer(_loc4_).hideColorPicker();
         }
         var _loc5_:IGridItemRenderer = param1.itemRenderer;
         _loc4_.width = _loc5_.width;
         _loc4_.height = _loc5_.height;
         _loc4_.prepare(false);
         _loc4_.owner = this;
         var _loc6_:Point = new Point(0,0);
         _loc6_ = DisplayObject(_loc5_).localToGlobal(_loc6_);
         _loc6_ = DisplayObject(this).globalToLocal(_loc6_);
         DragManager.doDrag(this,_loc2_,param1,_loc4_ as IFlexDisplayObject,-_loc6_.x,-_loc6_.y);
         this.addEventListener(DragEvent.DRAG_ENTER,this.dragEnterHandler);
      }
      
      private function dragEnterHandler(param1:DragEvent) : void
      {
         var _loc3_:DataGrid = null;
         var _loc2_:DragSource = param1.dragSource;
         if(_loc2_ && _loc2_.hasFormat(DATA_ROW_DRAG_FORMAT))
         {
            _loc3_ = param1.dragInitiator as DataGrid;
            if(_loc3_ == this)
            {
               this.showRowDropFeedback(param1);
               DragManager.acceptDragDrop(this);
               this.addEventListener(DragEvent.DRAG_OVER,this.dragOverHandler);
               this.addEventListener(DragEvent.DRAG_EXIT,this.dragExitHandler);
               this.addEventListener(DragEvent.DRAG_DROP,this.dragDropHandler);
               this._autoScrollTimer.reset();
               this._autoScrollTimer.addEventListener(TimerEvent.TIMER,this.autoScrollTimer_timerHandler);
               this._autoScrollTimer.start();
            }
         }
      }
      
      private function dragOverHandler(param1:DragEvent) : void
      {
         this.showRowDropFeedback(param1);
      }
      
      private function dragExitHandler(param1:DragEvent) : void
      {
         this.removeDragListeners();
         this.removeRowDropIndicator();
         this._dropRowIndex = -1;
         this._autoScrollTimer.stop();
      }
      
      private function dragDropHandler(param1:DragEvent) : void
      {
         this.removeDragListeners();
         this.dropRow(param1);
         this.removeRowDropIndicator();
         this._dropRowIndex = -1;
         this._autoScrollTimer.stop();
      }
      
      private function removeDragListeners() : void
      {
         this.removeEventListener(DragEvent.DRAG_OVER,this.dragOverHandler);
         this.removeEventListener(DragEvent.DRAG_EXIT,this.dragExitHandler);
         this.removeEventListener(DragEvent.DRAG_DROP,this.dragDropHandler);
      }
      
      private function removeRowDropIndicator() : void
      {
         if(this.rowDragIndicator)
         {
            this.rowDragIndicator.visible = false;
         }
      }
      
      private function showRowDropFeedback(param1:DragEvent) : void
      {
         if(!this.rowDragIndicator)
         {
            return;
         }
         var _loc2_:Number = 2;
         if(this._dropRowIndex >= 0)
         {
            this.rowDragIndicator.visible = true;
            if(this.grid.contentMouseY < this._dragOverItemRenderer.y + this._dragOverItemRenderer.height * 0.5)
            {
               this.rowDragIndicator.y = this._dragOverItemRenderer.y - this.rowDragIndicator.height * 0.5 + _loc2_;
            }
            else
            {
               this.rowDragIndicator.y = this._dragOverItemRenderer.y + this._dragOverItemRenderer.height - this.rowDragIndicator.height * 0.5 + _loc2_;
            }
         }
         else
         {
            this._dropRowIndex = -1;
            this.removeRowDropIndicator();
         }
      }
      
      private function dropRow(param1:DragEvent) : void
      {
         var _loc2_:ChartDataGridEvent = null;
         if(!this._dragOverItemRenderer || this._dropRowIndex < 0 || this._dragRowIndex < 0)
         {
            return;
         }
         if(this.grid.contentMouseY >= this._dragOverItemRenderer.y + this._dragOverItemRenderer.height * 0.5)
         {
            this._dropRowIndex++;
         }
         if(this._dropRowIndex > this._dragRowIndex)
         {
            this._dropRowIndex--;
         }
         if(this._dropRowIndex != this._dragRowIndex)
         {
            _loc2_ = new ChartDataGridEvent(ChartDataGridEvent.ROW_ORDER_CHANGE);
            _loc2_.rowIndex = this._dragRowIndex;
            _loc2_.newRowIndex = this._dropRowIndex;
            dispatchEvent(_loc2_);
            callLater(this.updateSelectedRowIndex,[this._dropRowIndex]);
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.addColumnButton)
         {
            this.addColumnButton.visible = this.addColumnButtonVisible;
            this.addColumnButton.addEventListener(MouseEvent.CLICK,this.addColumnButton_clickHandler);
         }
         else if(param2 == this.addRowButton)
         {
            this.addRowButton.addEventListener(MouseEvent.CLICK,this.addRowButton_clickHandler);
         }
         else if(param2 == this.maxRowCountLabel)
         {
            this.maxRowCountLabel.text = StringUtil.substitute(UtilDict.toDisplay("go",MAX_ROW_COUNT_TEXT),this._maxRowCount);
         }
         else if(param2 == this.swapAxisButton)
         {
            this.swapAxisButton.visible = this.swapAxisButtonVisible;
            this.swapAxisButton.addEventListener(MouseEvent.CLICK,this.swapAxisButton_clickHandler);
         }
         else if(param2 == this.deleteButton)
         {
            this.updateDeleteButton();
            this.deleteButton.addEventListener(MouseEvent.CLICK,this.deleteButton_clickHandler);
            this.deleteButton.addEventListener(DragEvent.DRAG_ENTER,this.deleteButton_dragEnterHandler);
            this.deleteButton.addEventListener(DragEvent.DRAG_DROP,this.deleteButton_dragDropHandler);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.addColumnButton)
         {
            this.addColumnButton.removeEventListener(MouseEvent.CLICK,this.addColumnButton_clickHandler);
         }
         else if(param2 == this.addRowButton)
         {
            this.addRowButton.removeEventListener(MouseEvent.CLICK,this.addRowButton_clickHandler);
         }
         else if(param2 == this.swapAxisButton)
         {
            this.swapAxisButton.removeEventListener(MouseEvent.CLICK,this.swapAxisButton_clickHandler);
         }
         else if(param2 == this.deleteButton)
         {
            this.deleteButton.removeEventListener(MouseEvent.CLICK,this.deleteButton_clickHandler);
            this.deleteButton.removeEventListener(DragEvent.DRAG_ENTER,this.deleteButton_dragEnterHandler);
            this.deleteButton.removeEventListener(DragEvent.DRAG_DROP,this.deleteButton_dragDropHandler);
         }
      }
      
      protected function addColumnButton_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new ChartDataGridEvent(ChartDataGridEvent.ADD_COLUMN_CLICK));
      }
      
      protected function addRowButton_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new ChartDataGridEvent(ChartDataGridEvent.ADD_ROW_CLICK));
      }
      
      protected function swapAxisButton_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new ChartDataGridEvent(ChartDataGridEvent.SWAP_AXIS_BUTTON_CLICK));
      }
      
      protected function deleteButton_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ChartDataGridEvent = new ChartDataGridEvent(ChartDataGridEvent.DELETE_BUTTON_CLICK);
         _loc2_.rowIndex = this._selectedRowIndex;
         _loc2_.columnIndex = this._selectedColumnIndex;
         dispatchEvent(_loc2_);
      }
      
      protected function deleteButton_dragEnterHandler(param1:DragEvent) : void
      {
         var _loc2_:DragSource = param1.dragSource;
         if(_loc2_.hasFormat(GRID_COLUMN_DRAG_FORMAT) || _loc2_.hasFormat(DATA_ROW_DRAG_FORMAT))
         {
            DragManager.acceptDragDrop(this.deleteButton);
         }
      }
      
      protected function deleteButton_dragDropHandler(param1:DragEvent) : void
      {
         var _loc3_:ChartDataGridEvent = null;
         var _loc4_:GridColumn = null;
         var _loc5_:int = 0;
         var _loc2_:DragSource = param1.dragSource;
         if(_loc2_.hasFormat(GRID_COLUMN_DRAG_FORMAT))
         {
            _loc4_ = _loc2_.dataForFormat(GRID_COLUMN_DRAG_FORMAT) as GridColumn;
            _loc3_ = new ChartDataGridEvent(ChartDataGridEvent.DELETE_BUTTON_CLICK);
            _loc3_.rowIndex = -1;
            _loc3_.columnIndex = _loc4_.columnIndex;
            dispatchEvent(_loc3_);
         }
         else if(_loc2_.hasFormat(DATA_ROW_DRAG_FORMAT))
         {
            _loc5_ = _loc2_.dataForFormat(DATA_ROW_DRAG_FORMAT) as int;
            _loc3_ = new ChartDataGridEvent(ChartDataGridEvent.DELETE_BUTTON_CLICK);
            _loc3_.rowIndex = _loc5_;
            _loc3_.columnIndex = -1;
            dispatchEvent(_loc3_);
         }
      }
      
      override public function set dataProvider(param1:IList) : void
      {
         if(this.dataProvider)
         {
            this.dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.dataProvider_collectionChangeHandler);
         }
         super.dataProvider = param1;
         if(this.dataProvider)
         {
            if(this.addRowButton)
            {
               this.addRowButton.visible = this.dataProvider.length < this._maxRowCount;
            }
            this.showMaxRowCountLabel = this.dataProvider.length == this._maxRowCount;
            this.dataProvider.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.dataProvider_collectionChangeHandler);
         }
      }
      
      private function dataProvider_collectionChangeHandler(param1:CollectionEvent) : void
      {
         if(this.dataProvider)
         {
            if(this.addRowButton)
            {
               this.addRowButton.visible = this.addRowButton.includeInLayout = this.dataProvider.length < this._maxRowCount;
            }
            this.showMaxRowCountLabel = this.dataProvider.length == this._maxRowCount;
         }
      }
      
      public function endColumnHeaderEditorSession(param1:int, param2:String, param3:uint = 4.294967295E9) : void
      {
         var _loc4_:ChartDataGridEvent = new ChartDataGridEvent(ChartDataGridEvent.COLUMN_HEADER_EDITOR_SESSION_SAVE);
         _loc4_.columnIndex = param1;
         _loc4_.text = param2;
         _loc4_.color = param3;
         this.dispatchEvent(_loc4_);
      }
      
      public function changeColumnColor(param1:int, param2:uint = 4.294967295E9) : void
      {
         var _loc3_:ChartDataGridEvent = new ChartDataGridEvent(ChartDataGridEvent.COLUMN_HEADER_COLOR_CHANGE);
         _loc3_.columnIndex = param1;
         _loc3_.color = param2;
         this.dispatchEvent(_loc3_);
      }
      
      public function previewColumnColor(param1:int, param2:uint = 4.294967295E9) : void
      {
         var _loc3_:ChartDataGridEvent = new ChartDataGridEvent(ChartDataGridEvent.COLUMN_HEADER_COLOR_PREVIEW);
         _loc3_.columnIndex = param1;
         _loc3_.color = param2;
         this.dispatchEvent(_loc3_);
      }
      
      public function changeRowHeaderColor(param1:int, param2:uint = 4.294967295E9) : void
      {
         var _loc3_:ChartDataGridEvent = new ChartDataGridEvent(ChartDataGridEvent.ROW_HEADER_COLOR_CHANGE);
         _loc3_.rowIndex = param1;
         _loc3_.color = param2;
         this.dispatchEvent(_loc3_);
      }
      
      public function previewRowHeaderColor(param1:int, param2:uint = 4.294967295E9) : void
      {
         var _loc3_:ChartDataGridEvent = new ChartDataGridEvent(ChartDataGridEvent.ROW_HEADER_COLOR_PREVIEW);
         _loc3_.rowIndex = param1;
         _loc3_.color = param2;
         this.dispatchEvent(_loc3_);
      }
      
      public function updateSelectedColumnIndex(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._selectedRowIndex = -1;
         var _loc2_:ChartDataGridEvent = new ChartDataGridEvent(ChartDataGridEvent.ROW_SELECTION_CHANGE);
         _loc2_.rowIndex = -1;
         this.dispatchEvent(_loc2_);
         if(param1 < 0 || param1 >= this.columnsLength)
         {
            param1 = -1;
         }
         this._selectedColumnIndex = param1;
         this.selectionMode = GridSelectionMode.MULTIPLE_CELLS;
         clearSelection();
         if(param1 >= 0 && param1 < this.columnsLength)
         {
            _loc3_ = this.dataProviderLength;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               addSelectedCell(_loc4_,param1);
               _loc4_++;
            }
         }
         this.updateDeleteButton();
         this.updateSwapAxisButton();
         _loc2_ = new ChartDataGridEvent(ChartDataGridEvent.COLUMN_SELECTION_CHANGE);
         _loc2_.columnIndex = param1;
         this.dispatchEvent(_loc2_);
      }
      
      public function updateSelectedRowIndex(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._selectedColumnIndex = -1;
         var _loc2_:ChartDataGridEvent = new ChartDataGridEvent(ChartDataGridEvent.COLUMN_SELECTION_CHANGE);
         _loc2_.columnIndex = -1;
         this.dispatchEvent(_loc2_);
         if(param1 < 0 || param1 >= this.dataProviderLength)
         {
            param1 = -1;
         }
         this._selectedRowIndex = param1;
         this.selectionMode = GridSelectionMode.MULTIPLE_CELLS;
         clearSelection();
         if(param1 >= 0 && param1 < this.dataProviderLength)
         {
            _loc3_ = this.columnsLength;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               addSelectedCell(param1,_loc4_);
               _loc4_++;
            }
         }
         this.updateDeleteButton();
         this.updateSwapAxisButton();
         _loc2_ = new ChartDataGridEvent(ChartDataGridEvent.ROW_SELECTION_CHANGE);
         _loc2_.rowIndex = param1;
         this.dispatchEvent(_loc2_);
      }
      
      private function updateDeleteButton() : void
      {
         if(!this.deleteButton)
         {
            return;
         }
         if(this._selectedRowIndex >= 0 || this._selectedColumnIndex >= 0)
         {
            this.deleteButton.visible = true;
            if(this._selectedRowIndex >= 0)
            {
               this.deleteButton.enabled = this.dataProviderLength > 1;
               this.deleteButton.label = UtilDict.toDisplay("go",DELETE_ROW_TEXT);
            }
            else
            {
               this.deleteButton.enabled = this.columnsLength > 2;
               this.deleteButton.label = UtilDict.toDisplay("go",DELETE_COLUMN_TEXT);
            }
         }
         else
         {
            this.deleteButton.visible = false;
         }
      }
      
      private function updateSwapAxisButton() : void
      {
         if(!this.swapAxisButton)
         {
            return;
         }
         if(this._selectedRowIndex >= 0 || this._selectedColumnIndex >= 0)
         {
            this.swapAxisButton.visible = false;
         }
         else
         {
            this.swapAxisButton.visible = this._swapAxisButtonVisible;
         }
      }
      
      public function scrollToLastColumn() : void
      {
         var _loc1_:Number = NaN;
         if(this.gridViewport)
         {
            _loc1_ = this.gridViewport.getHorizontalScrollPositionDelta(NavigationUnit.END);
            this.gridViewport.horizontalScrollPosition = this.gridViewport.horizontalScrollPosition + _loc1_;
         }
      }
      
      public function scrollToLastRow() : void
      {
         var _loc1_:Number = NaN;
         if(this.gridViewport)
         {
            _loc1_ = this.gridViewport.getVerticalScrollPositionDelta(NavigationUnit.END);
            this.gridViewport.verticalScrollPosition = this.gridViewport.verticalScrollPosition + _loc1_;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get showMaxRowCountLabel() : Boolean
      {
         return this._1148456632showMaxRowCountLabel;
      }
      
      public function set showMaxRowCountLabel(param1:Boolean) : void
      {
         var _loc2_:Object = this._1148456632showMaxRowCountLabel;
         if(_loc2_ !== param1)
         {
            this._1148456632showMaxRowCountLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showMaxRowCountLabel",_loc2_,param1));
            }
         }
      }
   }
}
