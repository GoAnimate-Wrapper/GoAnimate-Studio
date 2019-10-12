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
   
   public class SearchButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _1495385070_SearchButtonSkin_BitmapImage1:BitmapImage;
      
      private var _1495385071_SearchButtonSkin_BitmapImage2:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_tray_icon_search_hover_png_1299415259:Class;
      
      private var _embed_mxml__styles_images_tray_icon_search_init_png_1095742803:Class;
      
      public function SearchButtonSkin()
      {
         this._embed_mxml__styles_images_tray_icon_search_hover_png_1299415259 = SearchButtonSkin__embed_mxml__styles_images_tray_icon_search_hover_png_1299415259;
         this._embed_mxml__styles_images_tray_icon_search_init_png_1095742803 = SearchButtonSkin__embed_mxml__styles_images_tray_icon_search_init_png_1095742803;
         super();
         mx_internal::_document = this;
         this.minWidth = 5;
         this.minHeight = 5;
         this.mxmlContent = [this._SearchButtonSkin_BitmapImage1_i(),this._SearchButtonSkin_BitmapImage2_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SearchButtonSkin_BitmapImage1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_SearchButtonSkin_BitmapImage2",
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
      
      private function _SearchButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_search_init_png_1095742803;
         _loc1_.initialized(this,"_SearchButtonSkin_BitmapImage1");
         this._SearchButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_SearchButtonSkin_BitmapImage1",this._SearchButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _SearchButtonSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_search_hover_png_1299415259;
         _loc1_.visible = false;
         _loc1_.initialized(this,"_SearchButtonSkin_BitmapImage2");
         this._SearchButtonSkin_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_SearchButtonSkin_BitmapImage2",this._SearchButtonSkin_BitmapImage2);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SearchButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._1495385070_SearchButtonSkin_BitmapImage1;
      }
      
      public function set _SearchButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1495385070_SearchButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1495385070_SearchButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SearchButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SearchButtonSkin_BitmapImage2() : BitmapImage
      {
         return this._1495385071_SearchButtonSkin_BitmapImage2;
      }
      
      public function set _SearchButtonSkin_BitmapImage2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1495385071_SearchButtonSkin_BitmapImage2;
         if(_loc2_ !== param1)
         {
            this._1495385071_SearchButtonSkin_BitmapImage2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SearchButtonSkin_BitmapImage2",_loc2_,param1));
            }
         }
      }
   }
}
