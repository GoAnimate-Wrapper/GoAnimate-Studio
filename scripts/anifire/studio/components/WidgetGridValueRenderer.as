package anifire.studio.components
{
   import anifire.event.WidgetEvent;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Label;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridItemRenderer;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class WidgetGridValueRenderer extends GridItemRenderer implements IBindingClient, IStateClient2
   {
      
      protected static const BG_COLOR_WARNING:uint = 16768726;
      
      protected static const BORDER_COLOR_WARNING:uint = 14430749;
      
      protected static const BG_COLOR:uint = 16777215;
      
      protected static const SELECTED_BG_COLOR:uint = 16772042;
      
      protected static const TEXT_COLOR:uint = 5265775;
      
      protected static const FONT_SIZE:Number = 10;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _303621166_WidgetGridValueRenderer_SetProperty1:SetProperty;
      
      private var _204859874bgColor:SolidColor;
      
      private var _205643538gridBorder:SolidColorStroke;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _chartDataGrid:ChartDataGrid;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WidgetGridValueRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._WidgetGridValueRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WidgetGridValueRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WidgetGridValueRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._WidgetGridValueRenderer_Rect1_c(),this._WidgetGridValueRenderer_Label1_i()];
         this.currentState = "normal";
         this.addEventListener("click",this.___WidgetGridValueRenderer_GridItemRenderer1_click);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"selected",
            "overrides":[this._WidgetGridValueRenderer_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"bgColor",
               "name":"color",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_WidgetGridValueRenderer_SetProperty1",this._WidgetGridValueRenderer_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WidgetGridValueRenderer._watcherSetupUtil = param1;
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
               this._chartDataGrid.removeEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.chartDataGrid_widgetSwapCompleteHandler);
            }
            this._chartDataGrid = param1;
            if(this._chartDataGrid)
            {
               this._chartDataGrid.addEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.chartDataGrid_widgetSwapCompleteHandler);
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
      
      protected function updateColor() : void
      {
         if(!(this._chartDataGrid && this._chartDataGrid.supportNegativeValue) && Number(labelDisplay.text) < 0)
         {
            this.bgColor.color = BG_COLOR_WARNING;
            this.gridBorder.alpha = 1;
         }
         else
         {
            this.bgColor.color = BG_COLOR;
            this.gridBorder.alpha = 0;
         }
      }
      
      protected function chartDataGrid_widgetSwapCompleteHandler(param1:WidgetEvent) : void
      {
         this.updateColor();
      }
      
      protected function labelDisplay_valueCommitHandler(param1:FlexEvent) : void
      {
         this.updateColor();
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         this.grid.dataGrid.startItemEditorSession(this.rowIndex,this.columnIndex);
      }
      
      private function _WidgetGridValueRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 1;
         _loc1_.bottom = 0;
         _loc1_.left = 1;
         _loc1_.right = 0;
         _loc1_.stroke = this._WidgetGridValueRenderer_SolidColorStroke1_i();
         _loc1_.fill = this._WidgetGridValueRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridValueRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.alpha = 0;
         this.gridBorder = _loc1_;
         BindingManager.executeBindings(this,"gridBorder",this.gridBorder);
         return _loc1_;
      }
      
      private function _WidgetGridValueRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         this.bgColor = _loc1_;
         BindingManager.executeBindings(this,"bgColor",this.bgColor);
         return _loc1_;
      }
      
      private function _WidgetGridValueRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.verticalCenter = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("textAlign","right");
         _loc1_.addEventListener("updateComplete",this.__labelDisplay_updateComplete);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      public function __labelDisplay_updateComplete(param1:FlexEvent) : void
      {
         this.labelDisplay_valueCommitHandler(param1);
      }
      
      public function ___WidgetGridValueRenderer_GridItemRenderer1_click(param1:MouseEvent) : void
      {
         this.clickHandler(param1);
      }
      
      private function _WidgetGridValueRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return BORDER_COLOR_WARNING;
         },null,"gridBorder.color");
         result[1] = new Binding(this,function():uint
         {
            return BG_COLOR;
         },null,"bgColor.color");
         result[2] = new Binding(this,function():*
         {
            return SELECTED_BG_COLOR;
         },null,"_WidgetGridValueRenderer_SetProperty1.value");
         result[3] = new Binding(this,function():uint
         {
            return TEXT_COLOR;
         },function(param1:uint):void
         {
            labelDisplay.setStyle("color",param1);
         },"labelDisplay.color");
         result[4] = new Binding(this,function():Number
         {
            return FONT_SIZE;
         },function(param1:Number):void
         {
            labelDisplay.setStyle("fontSize",param1);
         },"labelDisplay.fontSize");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _WidgetGridValueRenderer_SetProperty1() : SetProperty
      {
         return this._303621166_WidgetGridValueRenderer_SetProperty1;
      }
      
      public function set _WidgetGridValueRenderer_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._303621166_WidgetGridValueRenderer_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._303621166_WidgetGridValueRenderer_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_WidgetGridValueRenderer_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgColor() : SolidColor
      {
         return this._204859874bgColor;
      }
      
      public function set bgColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._204859874bgColor;
         if(_loc2_ !== param1)
         {
            this._204859874bgColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gridBorder() : SolidColorStroke
      {
         return this._205643538gridBorder;
      }
      
      public function set gridBorder(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._205643538gridBorder;
         if(_loc2_ !== param1)
         {
            this._205643538gridBorder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gridBorder",_loc2_,param1));
            }
         }
      }
   }
}
