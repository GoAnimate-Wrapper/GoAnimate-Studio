package anifire.studio.components
{
   import anifire.event.WidgetEvent;
   import anifire.studio.core.Widget;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   
   public class WidgetPanelBase extends spark.components.NavigatorContent
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _widget:Widget;
      
      public function WidgetPanelBase()
      {
         super();
         mx_internal::_document = this;
         this.addEventListener("creationComplete",this.___WidgetPanelBase_NavigatorContent1_creationComplete);
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
      
      public function get widget() : Widget
      {
         return this._widget;
      }
      
      public function set widget(param1:Widget) : void
      {
         if(this._widget)
         {
            this._widget.removeEventListener(WidgetEvent.WIDGET_SWAP_START,this.onWidgetSwapStart);
            this._widget.removeEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.onWidgetSwapComplete);
            this._widget.removeEventListener(WidgetEvent.WIDGET_DATA_CHANGE,this.onWidgetDataChange);
            this._widget.removeEventListener(WidgetEvent.WIDGET_OPTION_CHANGE,this.onWidgetOptionChange);
            this._widget.removeEventListener(WidgetEvent.WIDGET_STYLE_CHANGE,this.onWidgetStyleChange);
         }
         this._widget = param1 as Widget;
         if(this._widget)
         {
            this._widget.addEventListener(WidgetEvent.WIDGET_SWAP_START,this.onWidgetSwapStart);
            this._widget.addEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.onWidgetSwapComplete);
            this._widget.addEventListener(WidgetEvent.WIDGET_DATA_CHANGE,this.onWidgetDataChange);
            this._widget.addEventListener(WidgetEvent.WIDGET_OPTION_CHANGE,this.onWidgetOptionChange);
            this._widget.addEventListener(WidgetEvent.WIDGET_STYLE_CHANGE,this.onWidgetStyleChange);
            this.updateUI();
         }
      }
      
      protected function updateUI() : void
      {
      }
      
      protected function onWidgetSwapStart(param1:WidgetEvent) : void
      {
      }
      
      protected function onWidgetSwapComplete(param1:WidgetEvent) : void
      {
      }
      
      protected function onWidgetDataChange(param1:WidgetEvent) : void
      {
      }
      
      protected function onWidgetOptionChange(param1:WidgetEvent) : void
      {
      }
      
      protected function onWidgetStyleChange(param1:WidgetEvent) : void
      {
      }
      
      protected function init() : void
      {
         this.updateUI();
      }
      
      public function ___WidgetPanelBase_NavigatorContent1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
   }
}
