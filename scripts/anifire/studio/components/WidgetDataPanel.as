package anifire.studio.components
{
   import anifire.component.widgets.WidgetConstants;
   import anifire.event.WidgetEvent;
   import anifire.studio.core.Widget;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.State;
   
   public class WidgetDataPanel extends spark.components.NavigatorContent implements IStateClient2
   {
       
      
      private var _1056813348calendarDataPanel:CalendarDataPanel;
      
      private var _2007259588chartDataPanel:ChartDataPanel;
      
      private var _1284581854counterDataPanel:CounterDataPanel;
      
      private var _94855542proportionChartDataPanel:ProportionChartDataPanel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _widget:Widget;
      
      public function WidgetDataPanel()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._WidgetDataPanel_Array2_c);
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetDataPanel_CalendarDataPanel1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetDataPanel_ChartDataPanel1_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetDataPanel_CounterDataPanel1_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetDataPanel_ProportionChartDataPanel1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "position":"first"
            })]
         }),new State({
            "name":"counter",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "position":"first"
            })]
         }),new State({
            "name":"proportion",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "position":"first"
            })]
         }),new State({
            "name":"calendar",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "position":"first"
            })]
         })];
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
      
      public function set target(param1:Widget) : void
      {
         if(this._widget != param1)
         {
            if(this._widget)
            {
               this._widget.removeEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.onWidgetSwap);
            }
            this._widget = param1;
            if(this._widget)
            {
               this._widget.addEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.onWidgetSwap);
               this.updateUI();
            }
         }
      }
      
      protected function onWidgetSwap(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      protected function updateUI() : void
      {
         switch(this._widget.chartType)
         {
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
               currentState = "counter";
               this.counterDataPanel.widget = this._widget;
               break;
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
            case WidgetConstants.CHART_TYPE_FILL_ICON:
               currentState = "proportion";
               this.proportionChartDataPanel.widget = this._widget;
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               currentState = "calendar";
               this.calendarDataPanel.widget = this._widget;
               break;
            default:
               currentState = "normal";
               this.chartDataPanel.widget = this._widget;
         }
      }
      
      private function _WidgetDataPanel_Array2_c() : Array
      {
         var _loc1_:Array = [];
         return _loc1_;
      }
      
      private function _WidgetDataPanel_ChartDataPanel1_i() : ChartDataPanel
      {
         var _loc1_:ChartDataPanel = new ChartDataPanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "chartDataPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chartDataPanel = _loc1_;
         BindingManager.executeBindings(this,"chartDataPanel",this.chartDataPanel);
         return _loc1_;
      }
      
      private function _WidgetDataPanel_CounterDataPanel1_i() : CounterDataPanel
      {
         var _loc1_:CounterDataPanel = new CounterDataPanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "counterDataPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counterDataPanel = _loc1_;
         BindingManager.executeBindings(this,"counterDataPanel",this.counterDataPanel);
         return _loc1_;
      }
      
      private function _WidgetDataPanel_ProportionChartDataPanel1_i() : ProportionChartDataPanel
      {
         var _loc1_:ProportionChartDataPanel = new ProportionChartDataPanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "proportionChartDataPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.proportionChartDataPanel = _loc1_;
         BindingManager.executeBindings(this,"proportionChartDataPanel",this.proportionChartDataPanel);
         return _loc1_;
      }
      
      private function _WidgetDataPanel_CalendarDataPanel1_i() : CalendarDataPanel
      {
         var _loc1_:CalendarDataPanel = new CalendarDataPanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "calendarDataPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.calendarDataPanel = _loc1_;
         BindingManager.executeBindings(this,"calendarDataPanel",this.calendarDataPanel);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get calendarDataPanel() : CalendarDataPanel
      {
         return this._1056813348calendarDataPanel;
      }
      
      public function set calendarDataPanel(param1:CalendarDataPanel) : void
      {
         var _loc2_:Object = this._1056813348calendarDataPanel;
         if(_loc2_ !== param1)
         {
            this._1056813348calendarDataPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"calendarDataPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chartDataPanel() : ChartDataPanel
      {
         return this._2007259588chartDataPanel;
      }
      
      public function set chartDataPanel(param1:ChartDataPanel) : void
      {
         var _loc2_:Object = this._2007259588chartDataPanel;
         if(_loc2_ !== param1)
         {
            this._2007259588chartDataPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chartDataPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get counterDataPanel() : CounterDataPanel
      {
         return this._1284581854counterDataPanel;
      }
      
      public function set counterDataPanel(param1:CounterDataPanel) : void
      {
         var _loc2_:Object = this._1284581854counterDataPanel;
         if(_loc2_ !== param1)
         {
            this._1284581854counterDataPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"counterDataPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get proportionChartDataPanel() : ProportionChartDataPanel
      {
         return this._94855542proportionChartDataPanel;
      }
      
      public function set proportionChartDataPanel(param1:ProportionChartDataPanel) : void
      {
         var _loc2_:Object = this._94855542proportionChartDataPanel;
         if(_loc2_ !== param1)
         {
            this._94855542proportionChartDataPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"proportionChartDataPanel",_loc2_,param1));
            }
         }
      }
   }
}
