package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkButtonSkin;
   
   public class ClearSearchButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _1307730303_ClearSearchButtonSkin_BitmapImage1:BitmapImage;
      
      private var _1307730304_ClearSearchButtonSkin_BitmapImage2:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_tray_icon_reset_hover_png_1991266197:Class;
      
      private var _embed_mxml__styles_images_tray_icon_reset_init_png_301109143:Class;
      
      public function ClearSearchButtonSkin()
      {
         this._embed_mxml__styles_images_tray_icon_reset_hover_png_1991266197 = ClearSearchButtonSkin__embed_mxml__styles_images_tray_icon_reset_hover_png_1991266197;
         this._embed_mxml__styles_images_tray_icon_reset_init_png_301109143 = ClearSearchButtonSkin__embed_mxml__styles_images_tray_icon_reset_init_png_301109143;
         super();
         mx_internal::_document = this;
         this.minWidth = 5;
         this.minHeight = 5;
         this.mxmlContent = [this._ClearSearchButtonSkin_BitmapImage1_i(),this._ClearSearchButtonSkin_BitmapImage2_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ClearSearchButtonSkin_BitmapImage1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_ClearSearchButtonSkin_BitmapImage2",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
      
      private function _ClearSearchButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_reset_init_png_301109143;
         _loc1_.initialized(this,"_ClearSearchButtonSkin_BitmapImage1");
         this._ClearSearchButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_ClearSearchButtonSkin_BitmapImage1",this._ClearSearchButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _ClearSearchButtonSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_reset_hover_png_1991266197;
         _loc1_.visible = false;
         _loc1_.initialized(this,"_ClearSearchButtonSkin_BitmapImage2");
         this._ClearSearchButtonSkin_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_ClearSearchButtonSkin_BitmapImage2",this._ClearSearchButtonSkin_BitmapImage2);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ClearSearchButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._1307730303_ClearSearchButtonSkin_BitmapImage1;
      }
      
      public function set _ClearSearchButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1307730303_ClearSearchButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1307730303_ClearSearchButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ClearSearchButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ClearSearchButtonSkin_BitmapImage2() : BitmapImage
      {
         return this._1307730304_ClearSearchButtonSkin_BitmapImage2;
      }
      
      public function set _ClearSearchButtonSkin_BitmapImage2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1307730304_ClearSearchButtonSkin_BitmapImage2;
         if(_loc2_ !== param1)
         {
            this._1307730304_ClearSearchButtonSkin_BitmapImage2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ClearSearchButtonSkin_BitmapImage2",_loc2_,param1));
            }
         }
      }
   }
}
