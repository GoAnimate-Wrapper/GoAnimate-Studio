package anifire.studio.skins
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Image;
   import spark.skins.SparkSkin;
   
   public class OpacitySliderThumbSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_panel_opacity_slider_thumb_png_619012653:Class;
      
      private var _213507019hostComponent:Button;
      
      public function OpacitySliderThumbSkin()
      {
         this._embed_mxml__styles_images_panel_opacity_slider_thumb_png_619012653 = OpacitySliderThumbSkin__embed_mxml__styles_images_panel_opacity_slider_thumb_png_619012653;
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._OpacitySliderThumbSkin_Image1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
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
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _OpacitySliderThumbSkin_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.width = 25;
         _loc1_.height = 25;
         _loc1_.source = this._embed_mxml__styles_images_panel_opacity_slider_thumb_png_619012653;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
