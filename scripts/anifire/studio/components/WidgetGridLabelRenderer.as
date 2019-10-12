package anifire.studio.components
{
   import anifire.studio.events.ChartDataGridEvent;
   import anifire.studio.skins.DataGridRowToggleButtonSkin;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.ToggleButton;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridItemRenderer;
   import spark.events.GridItemEditorEvent;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class WidgetGridLabelRenderer extends GridItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static const BG_COLOR:uint = 16777215;
      
      private static const SELECTED_BG_COLOR:uint = 16772042;
      
      private static const TEXT_COLOR:uint = 5265775;
      
      private static const FONT_SIZE:Number = 10;
      
      private static const COLOR_DISPLAY_WIDTH:Number = 7;
      
      private static const COLOR_DISPLAY_WIDTH_ON_ROLL_OVER:Number = 10;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _WidgetGridLabelRenderer_Rect2:Rect;
      
      public var _WidgetGridLabelRenderer_SolidColor1:SolidColor;
      
      public var _WidgetGridLabelRenderer_SolidColor2:SolidColor;
      
      private var _358089761colorDisplay:ColorDisplayGroup;
      
      private var _3237038info:Group;
      
      private var _2117038804selectionHandle:ToggleButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1282089978_selected:Boolean;
      
      protected var _chartDataGrid:ChartDataGrid;
      
      private var _1526791168_colorPickerVisible:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WidgetGridLabelRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._WidgetGridLabelRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WidgetGridLabelRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WidgetGridLabelRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._WidgetGridLabelRenderer_Rect1_c(),this._WidgetGridLabelRenderer_Rect2_i(),this._WidgetGridLabelRenderer_HGroup1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"selected",
            "overrides":[]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WidgetGridLabelRenderer._watcherSetupUtil = param1;
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
      
      public function setSelected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function hideColorPicker() : void
      {
         this._colorPickerVisible = false;
      }
      
      protected function get chartDataGrid() : ChartDataGrid
      {
         return this._chartDataGrid;
      }
      
      protected function set chartDataGrid(param1:ChartDataGrid) : void
      {
         if(this._chartDataGrid != param1)
         {
            if(this._chartDataGrid)
            {
               this._chartDataGrid.removeEventListener(ChartDataGridEvent.ROW_SELECTION_CHANGE,this.dataGrid_rowSelectionChangeHandler);
               this._chartDataGrid.removeEventListener(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_START,this.dataGrid_gridItemEditorSessionStartHandler);
            }
            this._chartDataGrid = param1;
            if(this._chartDataGrid)
            {
               this._chartDataGrid.addEventListener(ChartDataGridEvent.ROW_SELECTION_CHANGE,this.dataGrid_rowSelectionChangeHandler);
               this._chartDataGrid.addEventListener(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_START,this.dataGrid_gridItemEditorSessionStartHandler);
            }
         }
      }
      
      override public function set column(param1:GridColumn) : void
      {
         super.column = param1;
         if(param1 && param1.grid)
         {
            this.chartDataGrid = column.grid.dataGrid as ChartDataGrid;
         }
         else
         {
            this.chartDataGrid = null;
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1)
         {
            this._colorPickerVisible = param1.colorPickerVisible;
         }
      }
      
      protected function selectionHandle_clickHandler(param1:MouseEvent) : void
      {
         if(this._selected)
         {
            this.deselectRow();
         }
         else
         {
            this.selectRow();
         }
      }
      
      private function selectRow() : void
      {
         if(this.grid && this.grid.dataGrid is ChartDataGrid)
         {
            ChartDataGrid(this.grid.dataGrid).updateSelectedRowIndex(this.rowIndex);
         }
      }
      
      private function deselectRow() : void
      {
         if(this.grid && this.grid.dataGrid is ChartDataGrid)
         {
            ChartDataGrid(this.grid.dataGrid).updateSelectedRowIndex(-1);
         }
      }
      
      protected function info_clickHandler(param1:MouseEvent) : void
      {
         this.grid.dataGrid.startItemEditorSession(this.rowIndex,this.columnIndex);
      }
      
      private function dataGrid_rowSelectionChangeHandler(param1:ChartDataGridEvent) : void
      {
         if(param1.rowIndex == this.rowIndex)
         {
            if(!this._selected)
            {
               this._selected = true;
            }
         }
         else if(this._selected)
         {
            this._selected = false;
         }
      }
      
      private function dataGrid_gridItemEditorSessionStartHandler(param1:GridItemEditorEvent) : void
      {
         this.deselectRow();
      }
      
      protected function colorDisplay_rollOverHandler(param1:MouseEvent) : void
      {
         this.colorDisplay.width = COLOR_DISPLAY_WIDTH_ON_ROLL_OVER;
      }
      
      protected function colorDisplay_rollOutHandler(param1:MouseEvent) : void
      {
         this.colorDisplay.width = COLOR_DISPLAY_WIDTH;
      }
      
      protected function colorDisplay_mouseDownHandler(param1:MouseEvent) : void
      {
         if(this.grid && this.grid.dataGrid is ChartDataGrid)
         {
            ChartDataGrid(this.grid.dataGrid).shouldOpenColorPicker = true;
         }
      }
      
      private function _WidgetGridLabelRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._WidgetGridLabelRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._WidgetGridLabelRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridLabelRenderer_SolidColor1",this._WidgetGridLabelRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._WidgetGridLabelRenderer_SolidColor2_i();
         _loc1_.initialized(this,"_WidgetGridLabelRenderer_Rect2");
         this._WidgetGridLabelRenderer_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridLabelRenderer_Rect2",this._WidgetGridLabelRenderer_Rect2);
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this._WidgetGridLabelRenderer_SolidColor2 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetGridLabelRenderer_SolidColor2",this._WidgetGridLabelRenderer_SolidColor2);
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._WidgetGridLabelRenderer_ToggleButton1_i(),this._WidgetGridLabelRenderer_Group1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.percentHeight = 100;
         _loc1_.width = 10;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",DataGridRowToggleButtonSkin);
         _loc1_.addEventListener("click",this.__selectionHandle_click);
         _loc1_.id = "selectionHandle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectionHandle = _loc1_;
         BindingManager.executeBindings(this,"selectionHandle",this.selectionHandle);
         return _loc1_;
      }
      
      public function __selectionHandle_click(param1:MouseEvent) : void
      {
         this.selectionHandle_clickHandler(param1);
      }
      
      private function _WidgetGridLabelRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._WidgetGridLabelRenderer_Rect3_c(),this._WidgetGridLabelRenderer_HGroup2_c()];
         _loc1_.addEventListener("click",this.__info_click);
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._WidgetGridLabelRenderer_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.gap = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._WidgetGridLabelRenderer_Label1_i(),this._WidgetGridLabelRenderer_ColorDisplayGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _WidgetGridLabelRenderer_ColorDisplayGroup1_i() : ColorDisplayGroup
      {
         var _loc1_:ColorDisplayGroup = new ColorDisplayGroup();
         _loc1_.height = 10;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("rollOver",this.__colorDisplay_rollOver);
         _loc1_.addEventListener("rollOut",this.__colorDisplay_rollOut);
         _loc1_.addEventListener("mouseDown",this.__colorDisplay_mouseDown);
         _loc1_.id = "colorDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorDisplay = _loc1_;
         BindingManager.executeBindings(this,"colorDisplay",this.colorDisplay);
         return _loc1_;
      }
      
      public function __colorDisplay_rollOver(param1:MouseEvent) : void
      {
         this.colorDisplay_rollOverHandler(param1);
      }
      
      public function __colorDisplay_rollOut(param1:MouseEvent) : void
      {
         this.colorDisplay_rollOutHandler(param1);
      }
      
      public function __colorDisplay_mouseDown(param1:MouseEvent) : void
      {
         this.colorDisplay_mouseDownHandler(param1);
      }
      
      public function __info_click(param1:MouseEvent) : void
      {
         this.info_clickHandler(param1);
      }
      
      private function _WidgetGridLabelRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return BG_COLOR;
         },null,"_WidgetGridLabelRenderer_SolidColor1.color");
         result[1] = new Binding(this,function():Boolean
         {
            return _selected;
         },null,"_WidgetGridLabelRenderer_Rect2.visible");
         result[2] = new Binding(this,function():uint
         {
            return SELECTED_BG_COLOR;
         },null,"_WidgetGridLabelRenderer_SolidColor2.color");
         result[3] = new Binding(this,function():Boolean
         {
            return _selected;
         },null,"selectionHandle.selected");
         result[4] = new Binding(this,function():uint
         {
            return TEXT_COLOR;
         },function(param1:uint):void
         {
            labelDisplay.setStyle("color",param1);
         },"labelDisplay.color");
         result[5] = new Binding(this,function():Number
         {
            return FONT_SIZE;
         },function(param1:Number):void
         {
            labelDisplay.setStyle("fontSize",param1);
         },"labelDisplay.fontSize");
         result[6] = new Binding(this,function():Number
         {
            return COLOR_DISPLAY_WIDTH;
         },null,"colorDisplay.width");
         result[7] = new Binding(this,function():uint
         {
            return data.color;
         },null,"colorDisplay.color");
         result[8] = new Binding(this,function():Boolean
         {
            return _colorPickerVisible;
         },null,"colorDisplay.visible");
         result[9] = new Binding(this,function():Boolean
         {
            return _colorPickerVisible;
         },null,"colorDisplay.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorDisplay() : ColorDisplayGroup
      {
         return this._358089761colorDisplay;
      }
      
      public function set colorDisplay(param1:ColorDisplayGroup) : void
      {
         var _loc2_:Object = this._358089761colorDisplay;
         if(_loc2_ !== param1)
         {
            this._358089761colorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get info() : Group
      {
         return this._3237038info;
      }
      
      public function set info(param1:Group) : void
      {
         var _loc2_:Object = this._3237038info;
         if(_loc2_ !== param1)
         {
            this._3237038info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionHandle() : ToggleButton
      {
         return this._2117038804selectionHandle;
      }
      
      public function set selectionHandle(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._2117038804selectionHandle;
         if(_loc2_ !== param1)
         {
            this._2117038804selectionHandle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionHandle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _selected() : Boolean
      {
         return this._1282089978_selected;
      }
      
      private function set _selected(param1:Boolean) : void
      {
         var _loc2_:Object = this._1282089978_selected;
         if(_loc2_ !== param1)
         {
            this._1282089978_selected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_selected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _colorPickerVisible() : Boolean
      {
         return this._1526791168_colorPickerVisible;
      }
      
      private function set _colorPickerVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1526791168_colorPickerVisible;
         if(_loc2_ !== param1)
         {
            this._1526791168_colorPickerVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_colorPickerVisible",_loc2_,param1));
            }
         }
      }
   }
}
