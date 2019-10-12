package anifire.studio.components
{
   import anifire.event.WidgetEvent;
   import anifire.studio.core.Widget;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.State;
   
   public class WidgetStylePanel extends spark.components.NavigatorContent implements IStateClient2
   {
       
      
      private var _550782129calendarStylePanel:CalendarStylePanel;
      
      private var _1151719761chartStylePanel:ChartStylePanel;
      
      private var _119589359counterStylePanel:CounterStylePanel;
      
      private var _578126544iconWidgetStylePanel:IconWidgetStylePanel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _widget:Widget;
      
      public function WidgetStylePanel()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._WidgetStylePanel_Array2_c);
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetStylePanel_CalendarStylePanel1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetStylePanel_ChartStylePanel1_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetStylePanel_CounterStylePanel1_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WidgetStylePanel_IconWidgetStylePanel1_i);
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
            "name":"icon",
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
            case "barCounter":
            case "hBarCounter":
            case "pieCounter":
            case "ringCounter":
            default:
               currentState = "normal";
               this.chartStylePanel.widget = this._widget;
               break;
            case "plainCounter":
               currentState = "counter";
               this.counterStylePanel.widget = this._widget;
               break;
            case "fillIcon":
            case "repeatIcon":
               currentState = "icon";
               this.iconWidgetStylePanel.widget = this._widget;
               break;
            case "date":
            case "calendar":
               currentState = "calendar";
               this.calendarStylePanel.widget = this._widget;
         }
      }
      
      public function reset() : void
      {
         if(this.iconWidgetStylePanel)
         {
            this.iconWidgetStylePanel.reset();
         }
      }
      
      public function displayIconTray() : void
      {
         if(this.iconWidgetStylePanel)
         {
            this.iconWidgetStylePanel.displayIconTray();
         }
      }
      
      private function _WidgetStylePanel_Array2_c() : Array
      {
         var _loc1_:Array = [];
         return _loc1_;
      }
      
      private function _WidgetStylePanel_ChartStylePanel1_i() : ChartStylePanel
      {
         var _loc1_:ChartStylePanel = new ChartStylePanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "chartStylePanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chartStylePanel = _loc1_;
         BindingManager.executeBindings(this,"chartStylePanel",this.chartStylePanel);
         return _loc1_;
      }
      
      private function _WidgetStylePanel_CounterStylePanel1_i() : CounterStylePanel
      {
         var _loc1_:CounterStylePanel = new CounterStylePanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "counterStylePanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counterStylePanel = _loc1_;
         BindingManager.executeBindings(this,"counterStylePanel",this.counterStylePanel);
         return _loc1_;
      }
      
      private function _WidgetStylePanel_IconWidgetStylePanel1_i() : IconWidgetStylePanel
      {
         var _loc1_:IconWidgetStylePanel = new IconWidgetStylePanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "iconWidgetStylePanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconWidgetStylePanel = _loc1_;
         BindingManager.executeBindings(this,"iconWidgetStylePanel",this.iconWidgetStylePanel);
         return _loc1_;
      }
      
      private function _WidgetStylePanel_CalendarStylePanel1_i() : CalendarStylePanel
      {
         var _loc1_:CalendarStylePanel = new CalendarStylePanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "calendarStylePanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.calendarStylePanel = _loc1_;
         BindingManager.executeBindings(this,"calendarStylePanel",this.calendarStylePanel);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get calendarStylePanel() : CalendarStylePanel
      {
         return this._550782129calendarStylePanel;
      }
      
      public function set calendarStylePanel(param1:CalendarStylePanel) : void
      {
         var _loc2_:Object = this._550782129calendarStylePanel;
         if(_loc2_ !== param1)
         {
            this._550782129calendarStylePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"calendarStylePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chartStylePanel() : ChartStylePanel
      {
         return this._1151719761chartStylePanel;
      }
      
      public function set chartStylePanel(param1:ChartStylePanel) : void
      {
         var _loc2_:Object = this._1151719761chartStylePanel;
         if(_loc2_ !== param1)
         {
            this._1151719761chartStylePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chartStylePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get counterStylePanel() : CounterStylePanel
      {
         return this._119589359counterStylePanel;
      }
      
      public function set counterStylePanel(param1:CounterStylePanel) : void
      {
         var _loc2_:Object = this._119589359counterStylePanel;
         if(_loc2_ !== param1)
         {
            this._119589359counterStylePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"counterStylePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconWidgetStylePanel() : IconWidgetStylePanel
      {
         return this._578126544iconWidgetStylePanel;
      }
      
      public function set iconWidgetStylePanel(param1:IconWidgetStylePanel) : void
      {
         var _loc2_:Object = this._578126544iconWidgetStylePanel;
         if(_loc2_ !== param1)
         {
            this._578126544iconWidgetStylePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconWidgetStylePanel",_loc2_,param1));
            }
         }
      }
   }
}
