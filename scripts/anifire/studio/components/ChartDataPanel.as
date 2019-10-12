package anifire.studio.components
{
   import anifire.event.WidgetEvent;
   import anifire.models.widget.WidgetPartModel;
   import anifire.studio.commands.AddWidgetDataRowCommand;
   import anifire.studio.commands.AddWidgetRangeCommand;
   import anifire.studio.commands.ChangeChartDataCommand;
   import anifire.studio.commands.ChangeWidgetAxisSwapCommand;
   import anifire.studio.commands.ChangeWidgetColorPaletteCommand;
   import anifire.studio.commands.ChangeWidgetColorSetCommand;
   import anifire.studio.commands.ChangeWidgetRangeNameCommand;
   import anifire.studio.commands.ChangeWidgetRowNameCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.MoveWidgetDataRowCommand;
   import anifire.studio.commands.MoveWidgetRangeCommand;
   import anifire.studio.commands.RemoveWidgetDataRowCommand;
   import anifire.studio.commands.RemoveWidgetRangeCommand;
   import anifire.studio.core.Widget;
   import anifire.studio.core.WidgetThumb;
   import anifire.studio.events.ChartDataGridEvent;
   import anifire.studio.models.ColorPaletteModel;
   import anifire.studio.skins.WidgetDataGridSkin;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.VGroup;
   import spark.components.gridClasses.GridColumn;
   import spark.events.GridItemEditorEvent;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ChartDataPanel extends WidgetPanelBase implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1374318561columnArrayList:ArrayList;
      
      private var _377789318dataPanel:VGroup;
      
      private var _1793852334titleInput:WidgetTitleTextInput;
      
      private var _1179499404widgetDataGrid:ChartDataGrid;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1501261589widgetDataGridModel:ArrayCollection;
      
      private var _command:ICommand;
      
      private var _selectedRowIndex:int = -1;
      
      private var _selectedColumnIndex:int = -1;
      
      private var _changeWidgetColorSetCommand:ChangeWidgetColorSetCommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ChartDataPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._1501261589widgetDataGridModel = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ChartDataPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ChartDataPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ChartDataPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ChartDataPanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ChartDataPanel._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override public function set widget(param1:Widget) : void
      {
         if(this.widgetDataGrid)
         {
            this.widgetDataGrid.selectedIndex = -1;
            this.widgetDataGrid.updateSelectedRowIndex(-1);
         }
         super.widget = param1;
         this.widgetDataGrid.supportNegativeValue = param1.supportNegativeValue;
         this.titleInput.target = param1;
      }
      
      override protected function onWidgetSwapComplete(param1:WidgetEvent) : void
      {
         this.widgetDataGrid.dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_SWAP_COMPLETE));
         this.updateUI();
      }
      
      override protected function onWidgetDataChange(param1:WidgetEvent) : void
      {
         if(this.widgetDataGrid)
         {
            this.widgetDataGrid.selectedIndex = -1;
         }
         this.updateUI();
      }
      
      override protected function onWidgetOptionChange(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      override protected function onWidgetStyleChange(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      override protected function updateUI() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:WidgetDataGridItem = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<String> = null;
         var _loc7_:WidgetRangeGridColumn = null;
         var _loc8_:int = 0;
         var _loc9_:* = false;
         var _loc10_:int = 0;
         var _loc11_:WidgetPartModel = null;
         if(initialized && _widget)
         {
            _loc1_ = _widget.styleModel.colorSet;
            _loc4_ = _widget.dataRows.length;
            _loc5_ = this.widgetDataGridModel.length;
            _loc6_ = _widget.dataRanges;
            _loc8_ = this.columnArrayList.length;
            this.widgetDataGrid.addColumnButtonVisible = _widget.supportMultipleRanges;
            this.widgetDataGrid.swapAxisButtonVisible = _widget.supportMultipleRanges;
            if(_loc6_)
            {
               _loc10_ = _loc6_.length + 1;
               if(_loc10_ > _loc8_)
               {
                  _loc2_ = _loc8_;
                  while(_loc2_ < _loc10_)
                  {
                     _loc7_ = new WidgetRangeGridColumn();
                     this.columnArrayList.addItem(_loc7_);
                     _loc2_++;
                  }
               }
               else if(_loc10_ < _loc8_)
               {
                  _loc2_ = _loc8_ - 1;
                  while(_loc2_ >= _loc10_)
                  {
                     this.columnArrayList.removeItemAt(_loc2_);
                     _loc2_--;
                  }
               }
               this.widgetDataGrid.addColumnButtonVisible = _widget.supportMultipleRanges && _loc10_ <= WidgetThumb.MAX_NUM_RANGES;
               _loc9_ = _loc6_.length > 1;
               _loc8_ = this.columnArrayList.length;
               _loc2_ = 1;
               while(_loc2_ < _loc8_)
               {
                  _loc7_ = this.columnArrayList.getItemAt(_loc2_) as WidgetRangeGridColumn;
                  _loc7_.headerText = _widget.dataRanges[_loc2_ - 1];
                  _loc7_.color = _loc1_[(_loc2_ - 1) % _loc1_.length];
                  _loc7_.colorPickerVisible = _loc9_;
                  _loc2_++;
               }
            }
            _loc2_ = 0;
            while(_loc2_ < _loc4_)
            {
               _loc11_ = _widget.dataRows[_loc2_];
               if(_loc2_ < _loc5_)
               {
                  _loc3_ = this.widgetDataGridModel.getItemAt(_loc2_) as WidgetDataGridItem;
               }
               else
               {
                  _loc3_ = new WidgetDataGridItem();
                  this.widgetDataGridModel.addItem(_loc3_);
               }
               _loc3_.label = _loc11_.labelText;
               _loc3_.value = _loc11_.rawValue;
               _loc3_.values = _loc11_.values;
               _loc3_.color = _loc1_[_loc2_ % _loc1_.length];
               _loc3_.colorPickerVisible = !_loc9_;
               _loc2_++;
            }
            _loc2_ = _loc5_ - 1;
            while(_loc2_ >= _loc4_)
            {
               this.widgetDataGridModel.removeItemAt(_loc2_);
               _loc2_--;
            }
            if(this._selectedRowIndex >= 0)
            {
               if(this._selectedRowIndex >= this.widgetDataGrid.dataProviderLength)
               {
                  this._selectedRowIndex = this.widgetDataGrid.dataProviderLength - 1;
               }
               callLater(this.widgetDataGrid.updateSelectedRowIndex,[this._selectedRowIndex]);
            }
            else if(this._selectedColumnIndex > 0)
            {
               if(this._selectedColumnIndex >= this.widgetDataGrid.columnsLength)
               {
                  this._selectedColumnIndex = this.widgetDataGrid.columnsLength - 1;
               }
               callLater(this.widgetDataGrid.updateSelectedColumnIndex,[this._selectedColumnIndex]);
            }
         }
      }
      
      private function onGridItemEditorSessionSave(param1:GridItemEditorEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:ChangeChartDataCommand = null;
         if(_widget)
         {
            if(!this.widgetDataGrid.contentChanged)
            {
               return;
            }
            _loc3_ = this.generateDataXml().toXMLString();
            _loc4_ = _widget.styleModel.colorSet;
            _loc5_ = new Array(WidgetThumb.MAX_DATA_ROWS);
            _loc2_ = 0;
            while(_loc2_ < WidgetThumb.MAX_DATA_ROWS)
            {
               if(_loc2_ < this.widgetDataGridModel.length)
               {
                  _loc5_[_loc2_] = uint(this.widgetDataGridModel[_loc2_].color);
               }
               else
               {
                  _loc5_[_loc2_] = _loc4_[_loc2_ % _loc4_.length];
               }
               _loc2_++;
            }
            _loc6_ = new ChangeChartDataCommand(_widget,_loc3_,_loc5_);
            _loc6_.execute();
         }
      }
      
      private function generateDataXml() : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc7_:int = 0;
         var _loc1_:XML = <data/>;
         var _loc4_:int = this.widgetDataGridModel.length;
         var _loc5_:int = _loc4_ > 0?int(WidgetDataGridItem(this.widgetDataGridModel[0]).values.length):0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc2_ = <row/>;
            _loc1_.appendChild(_loc2_);
            _loc3_ = <cell>{String(this.widgetDataGridModel[_loc6_].label)}</cell>;
            _loc2_.appendChild(_loc3_);
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc3_ = <cell>{String(WidgetDataGridItem(this.widgetDataGridModel[_loc6_]).values[_loc7_])}</cell>;
               _loc2_.appendChild(_loc3_);
               _loc7_++;
            }
            _loc6_++;
         }
         return _loc1_;
      }
      
      protected function changePalette(param1:ColorPaletteModel) : void
      {
         var _loc2_:ChangeWidgetColorPaletteCommand = null;
         if(param1)
         {
            _loc2_ = new ChangeWidgetColorPaletteCommand(_widget,param1);
            _loc2_.execute();
         }
      }
      
      protected function widgetDataGrid_deleteButtonClickHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:ICommand = null;
         var _loc3_:int = 0;
         if(param1.columnIndex > 0)
         {
            _loc3_ = param1.columnIndex - 1;
            _loc2_ = new RemoveWidgetRangeCommand(_widget,_loc3_);
            _loc2_.execute();
         }
         else if(param1.rowIndex >= 0)
         {
            _loc2_ = new RemoveWidgetDataRowCommand(_widget,param1.rowIndex);
            _loc2_.execute();
         }
      }
      
      protected function addGridRow() : void
      {
         var _loc1_:int = 0;
         var _loc2_:AddWidgetDataRowCommand = null;
         if(_widget && _widget.dataRows && _widget.dataRows.length < WidgetThumb.MAX_DATA_ROWS)
         {
            _loc1_ = this.widgetDataGridModel.length;
            _loc2_ = new AddWidgetDataRowCommand(_widget);
            _loc2_.execute();
            callLater(this.scrollAndStartEditorSession,[_loc1_,0]);
         }
      }
      
      protected function addGridColumn() : void
      {
         var _loc1_:AddWidgetRangeCommand = null;
         if(_widget && _widget.dataRanges && _widget.dataRanges.length < WidgetThumb.MAX_NUM_RANGES)
         {
            _loc1_ = new AddWidgetRangeCommand(_widget);
            _loc1_.execute();
         }
         callLater(this.widgetDataGrid.updateSelectedColumnIndex,[this.widgetDataGrid.columnsLength - 1]);
         callLater(this.widgetDataGrid.scrollToLastColumn);
      }
      
      protected function scrollAndStartEditorSession(param1:int, param2:int) : void
      {
         this.widgetDataGrid.startItemEditorSession(param1,param2);
         this.widgetDataGrid.scrollToLastRow();
      }
      
      protected function widgetDataGrid_addColumnClickHandler(param1:ChartDataGridEvent) : void
      {
         this.addGridColumn();
      }
      
      protected function widgetDataGrid_addRowClickHandler(param1:ChartDataGridEvent) : void
      {
         this.addGridRow();
      }
      
      protected function widgetDataGrid_columnHeaderEditorSessionSaveHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ICommand = null;
         if(_widget)
         {
            _loc2_ = param1.columnIndex - 1;
            _loc3_ = new ChangeWidgetRangeNameCommand(_widget,_loc2_,param1.text,param1.color);
            _loc3_.execute();
         }
      }
      
      protected function widgetDataGrid_rowHeaderEditorSessionSaveHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ICommand = null;
         if(_widget)
         {
            _loc2_ = param1.rowIndex;
            _loc3_ = new ChangeWidgetRowNameCommand(_widget,_loc2_,param1.text,param1.color);
            _loc3_.execute();
         }
      }
      
      protected function widgetDataGrid_columnHeaderColorChangeHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:Array = null;
         if(_widget)
         {
            _loc2_ = _widget.styleModel.colorSet.concat();
            _loc2_[param1.columnIndex - 1] = param1.color;
            this.startChangingWidgetColorSet(_loc2_);
            _widget.colorSet = _loc2_;
            this._changeWidgetColorSetCommand = null;
         }
      }
      
      protected function widgetDataGrid_columnHeaderColorPreviewHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:Array = null;
         if(_widget)
         {
            _loc2_ = _widget.styleModel.colorSet.concat();
            _loc2_[param1.columnIndex - 1] = param1.color;
            this.startChangingWidgetColorSet(_loc2_);
            _widget.colorSet = _loc2_;
         }
      }
      
      protected function widgetDataGrid_rowHeaderColorChangeHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:Array = null;
         if(_widget)
         {
            _loc2_ = _widget.styleModel.colorSet.concat();
            _loc2_[param1.rowIndex] = param1.color;
            this.startChangingWidgetColorSet(_loc2_);
            _widget.colorSet = _loc2_;
            this._changeWidgetColorSetCommand = null;
         }
      }
      
      protected function widgetDataGrid_rowHeaderColorPreviewHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:Array = null;
         if(_widget)
         {
            _loc2_ = _widget.styleModel.colorSet.concat();
            _loc2_[param1.rowIndex] = param1.color;
            this.startChangingWidgetColorSet(_loc2_);
            _widget.colorSet = _loc2_;
         }
      }
      
      protected function startChangingWidgetColorSet(param1:Array) : void
      {
         if(!this._changeWidgetColorSetCommand)
         {
            this._changeWidgetColorSetCommand = new ChangeWidgetColorSetCommand(_widget,param1);
            this._changeWidgetColorSetCommand.execute();
         }
         else
         {
            this._changeWidgetColorSetCommand.newColorSet = param1;
         }
      }
      
      protected function widgetDataGrid_swapAxisButtonClickHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:ChangeWidgetAxisSwapCommand = new ChangeWidgetAxisSwapCommand(_widget,!_widget.swapAxis);
         _loc2_.execute();
      }
      
      protected function widgetDataGrid_columnOrderChangeHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:MoveWidgetRangeCommand = new MoveWidgetRangeCommand(_widget,param1.columnIndex - 1,param1.newColumnIndex - 1);
         _loc2_.execute();
      }
      
      protected function widgetDataGrid_rowOrderChangeHandler(param1:ChartDataGridEvent) : void
      {
         var _loc2_:MoveWidgetDataRowCommand = new MoveWidgetDataRowCommand(_widget,param1.rowIndex,param1.newRowIndex);
         _loc2_.execute();
      }
      
      protected function widgetDataGrid_rowSelectionChangeHandler(param1:ChartDataGridEvent) : void
      {
         this._selectedRowIndex = param1.rowIndex;
         this._selectedColumnIndex = -1;
      }
      
      protected function widgetDataGrid_columnSelectionChangeHandler(param1:ChartDataGridEvent) : void
      {
         this._selectedColumnIndex = param1.columnIndex;
         this._selectedRowIndex = -1;
      }
      
      private function _ChartDataPanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._ChartDataPanel_Rect1_c(),this._ChartDataPanel_Line1_c(),this._ChartDataPanel_VGroup1_i(),this._ChartDataPanel_Rect2_c()];
         return _loc1_;
      }
      
      private function _ChartDataPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ChartDataPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ChartDataPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ChartDataPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 10;
         _loc1_.stroke = this._ChartDataPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ChartDataPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14737632;
         return _loc1_;
      }
      
      private function _ChartDataPanel_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 10;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ChartDataPanel_VGroup2_c(),this._ChartDataPanel_ChartDataGrid1_i()];
         _loc1_.id = "dataPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataPanel = _loc1_;
         BindingManager.executeBindings(this,"dataPanel",this.dataPanel);
         return _loc1_;
      }
      
      private function _ChartDataPanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 10;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._ChartDataPanel_WidgetTitleTextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ChartDataPanel_WidgetTitleTextInput1_i() : WidgetTitleTextInput
      {
         var _loc1_:WidgetTitleTextInput = new WidgetTitleTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.id = "titleInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleInput = _loc1_;
         BindingManager.executeBindings(this,"titleInput",this.titleInput);
         return _loc1_;
      }
      
      private function _ChartDataPanel_ChartDataGrid1_i() : ChartDataGrid
      {
         var _loc1_:ChartDataGrid = new ChartDataGrid();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.rowHeight = 20;
         _loc1_.selectionMode = "multipleCells";
         _loc1_.sortableColumns = false;
         _loc1_.resizableColumns = false;
         _loc1_.editable = true;
         _loc1_.tabFocusEnabled = false;
         _loc1_.requestedMaxRowCount = -1;
         _loc1_.columns = this._ChartDataPanel_ArrayList1_i();
         _loc1_.setStyle("skinClass",WidgetDataGridSkin);
         _loc1_.setStyle("caretColor",14335515);
         _loc1_.setStyle("rollOverColor",15457415);
         _loc1_.setStyle("selectionColor",14936045);
         _loc1_.setStyle("borderColor",15132390);
         _loc1_.addEventListener("gridItemEditorSessionSave",this.__widgetDataGrid_gridItemEditorSessionSave);
         _loc1_.addEventListener("deleteButtonClick",this.__widgetDataGrid_deleteButtonClick);
         _loc1_.addEventListener("columnHeaderEditorSessionSave",this.__widgetDataGrid_columnHeaderEditorSessionSave);
         _loc1_.addEventListener("rowHeaderEditorSessionSave",this.__widgetDataGrid_rowHeaderEditorSessionSave);
         _loc1_.addEventListener("columnHeaderColorChange",this.__widgetDataGrid_columnHeaderColorChange);
         _loc1_.addEventListener("columnHeaderColorPreview",this.__widgetDataGrid_columnHeaderColorPreview);
         _loc1_.addEventListener("rowHeaderColorChange",this.__widgetDataGrid_rowHeaderColorChange);
         _loc1_.addEventListener("rowHeaderColorPreview",this.__widgetDataGrid_rowHeaderColorPreview);
         _loc1_.addEventListener("addColumnClick",this.__widgetDataGrid_addColumnClick);
         _loc1_.addEventListener("addRowClick",this.__widgetDataGrid_addRowClick);
         _loc1_.addEventListener("swapAxisButtonClick",this.__widgetDataGrid_swapAxisButtonClick);
         _loc1_.addEventListener("columnOrderChange",this.__widgetDataGrid_columnOrderChange);
         _loc1_.addEventListener("rowOrderChange",this.__widgetDataGrid_rowOrderChange);
         _loc1_.addEventListener("rowSelectionChange",this.__widgetDataGrid_rowSelectionChange);
         _loc1_.addEventListener("columnSelectionChange",this.__widgetDataGrid_columnSelectionChange);
         _loc1_.id = "widgetDataGrid";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.widgetDataGrid = _loc1_;
         BindingManager.executeBindings(this,"widgetDataGrid",this.widgetDataGrid);
         return _loc1_;
      }
      
      private function _ChartDataPanel_ArrayList1_i() : ArrayList
      {
         var _loc1_:ArrayList = new ArrayList();
         _loc1_.source = [this._ChartDataPanel_GridColumn1_c()];
         this.columnArrayList = _loc1_;
         BindingManager.executeBindings(this,"columnArrayList",this.columnArrayList);
         return _loc1_;
      }
      
      private function _ChartDataPanel_GridColumn1_c() : GridColumn
      {
         var _loc1_:GridColumn = new GridColumn();
         _loc1_.dataField = "label";
         _loc1_.headerText = "";
         _loc1_.width = 80;
         _loc1_.editable = false;
         _loc1_.headerRenderer = this._ChartDataPanel_ClassFactory1_c();
         _loc1_.itemRenderer = this._ChartDataPanel_ClassFactory2_c();
         _loc1_.itemEditor = this._ChartDataPanel_ClassFactory3_c();
         return _loc1_;
      }
      
      private function _ChartDataPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetGridControlRenderer;
         return _loc1_;
      }
      
      private function _ChartDataPanel_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetGridLabelRenderer;
         return _loc1_;
      }
      
      private function _ChartDataPanel_ClassFactory3_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetGridLabelEditor;
         return _loc1_;
      }
      
      public function __widgetDataGrid_gridItemEditorSessionSave(param1:GridItemEditorEvent) : void
      {
         this.onGridItemEditorSessionSave(param1);
      }
      
      public function __widgetDataGrid_deleteButtonClick(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_deleteButtonClickHandler(param1);
      }
      
      public function __widgetDataGrid_columnHeaderEditorSessionSave(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_columnHeaderEditorSessionSaveHandler(param1);
      }
      
      public function __widgetDataGrid_rowHeaderEditorSessionSave(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_rowHeaderEditorSessionSaveHandler(param1);
      }
      
      public function __widgetDataGrid_columnHeaderColorChange(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_columnHeaderColorChangeHandler(param1);
      }
      
      public function __widgetDataGrid_columnHeaderColorPreview(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_columnHeaderColorPreviewHandler(param1);
      }
      
      public function __widgetDataGrid_rowHeaderColorChange(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_rowHeaderColorChangeHandler(param1);
      }
      
      public function __widgetDataGrid_rowHeaderColorPreview(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_rowHeaderColorPreviewHandler(param1);
      }
      
      public function __widgetDataGrid_addColumnClick(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_addColumnClickHandler(param1);
      }
      
      public function __widgetDataGrid_addRowClick(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_addRowClickHandler(param1);
      }
      
      public function __widgetDataGrid_swapAxisButtonClick(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_swapAxisButtonClickHandler(param1);
      }
      
      public function __widgetDataGrid_columnOrderChange(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_columnOrderChangeHandler(param1);
      }
      
      public function __widgetDataGrid_rowOrderChange(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_rowOrderChangeHandler(param1);
      }
      
      public function __widgetDataGrid_rowSelectionChange(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_rowSelectionChangeHandler(param1);
      }
      
      public function __widgetDataGrid_columnSelectionChange(param1:ChartDataGridEvent) : void
      {
         this.widgetDataGrid_columnSelectionChangeHandler(param1);
      }
      
      private function _ChartDataPanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 11;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.height = 10;
         _loc1_.fill = this._ChartDataPanel_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ChartDataPanel_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ChartDataPanel_GradientEntry1_c(),this._ChartDataPanel_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _ChartDataPanel_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _ChartDataPanel_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _ChartDataPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"widgetDataGrid.dataProvider","widgetDataGridModel");
         result[1] = new Binding(this,function():int
         {
            return WidgetThumb.MAX_DATA_ROWS;
         },null,"widgetDataGrid.maxRowCount");
         result[2] = new Binding(this,function():IFactory
         {
            return null;
         },null,"widgetDataGrid.caretIndicator");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get columnArrayList() : ArrayList
      {
         return this._1374318561columnArrayList;
      }
      
      public function set columnArrayList(param1:ArrayList) : void
      {
         var _loc2_:Object = this._1374318561columnArrayList;
         if(_loc2_ !== param1)
         {
            this._1374318561columnArrayList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnArrayList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataPanel() : VGroup
      {
         return this._377789318dataPanel;
      }
      
      public function set dataPanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._377789318dataPanel;
         if(_loc2_ !== param1)
         {
            this._377789318dataPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleInput() : WidgetTitleTextInput
      {
         return this._1793852334titleInput;
      }
      
      public function set titleInput(param1:WidgetTitleTextInput) : void
      {
         var _loc2_:Object = this._1793852334titleInput;
         if(_loc2_ !== param1)
         {
            this._1793852334titleInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get widgetDataGrid() : ChartDataGrid
      {
         return this._1179499404widgetDataGrid;
      }
      
      public function set widgetDataGrid(param1:ChartDataGrid) : void
      {
         var _loc2_:Object = this._1179499404widgetDataGrid;
         if(_loc2_ !== param1)
         {
            this._1179499404widgetDataGrid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widgetDataGrid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get widgetDataGridModel() : ArrayCollection
      {
         return this._1501261589widgetDataGridModel;
      }
      
      public function set widgetDataGridModel(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1501261589widgetDataGridModel;
         if(_loc2_ !== param1)
         {
            this._1501261589widgetDataGridModel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widgetDataGridModel",_loc2_,param1));
            }
         }
      }
   }
}
