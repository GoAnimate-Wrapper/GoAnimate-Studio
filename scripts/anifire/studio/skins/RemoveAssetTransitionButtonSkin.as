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
   
   public class RemoveAssetTransitionButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["labelDisplay"];
       
      
      private var _1497358419_RemoveAssetTransitionButtonSkin_BitmapImage1:BitmapImage;
      
      private var _1497358420_RemoveAssetTransitionButtonSkin_BitmapImage2:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      private var _embed_mxml__styles_images_panel_enterexit_delete_png_1027840691:Class;
      
      private var _embed_mxml__styles_images_panel_enterexit_delete_hover_png_477646263:Class;
      
      public function RemoveAssetTransitionButtonSkin()
      {
         this._embed_mxml__styles_images_panel_enterexit_delete_png_1027840691 = RemoveAssetTransitionButtonSkin__embed_mxml__styles_images_panel_enterexit_delete_png_1027840691;
         this._embed_mxml__styles_images_panel_enterexit_delete_hover_png_477646263 = RemoveAssetTransitionButtonSkin__embed_mxml__styles_images_panel_enterexit_delete_hover_png_477646263;
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._RemoveAssetTransitionButtonSkin_BitmapImage1_i(),this._RemoveAssetTransitionButtonSkin_BitmapImage2_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RemoveAssetTransitionButtonSkin_BitmapImage1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_RemoveAssetTransitionButtonSkin_BitmapImage2",
               "name":"visible",
               "value":true
            })]
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = getStyle("cornerRadius");
         if(this.cornerRadius != _loc3_)
         {
            this.cornerRadius = _loc3_;
         }
         super.updateDisplayList(param1,param2);
      }
      
      private function _RemoveAssetTransitionButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_panel_enterexit_delete_png_1027840691;
         _loc1_.initialized(this,"_RemoveAssetTransitionButtonSkin_BitmapImage1");
         this._RemoveAssetTransitionButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_RemoveAssetTransitionButtonSkin_BitmapImage1",this._RemoveAssetTransitionButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _RemoveAssetTransitionButtonSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_panel_enterexit_delete_hover_png_477646263;
         _loc1_.visible = false;
         _loc1_.initialized(this,"_RemoveAssetTransitionButtonSkin_BitmapImage2");
         this._RemoveAssetTransitionButtonSkin_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_RemoveAssetTransitionButtonSkin_BitmapImage2",this._RemoveAssetTransitionButtonSkin_BitmapImage2);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _RemoveAssetTransitionButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._1497358419_RemoveAssetTransitionButtonSkin_BitmapImage1;
      }
      
      public function set _RemoveAssetTransitionButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1497358419_RemoveAssetTransitionButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1497358419_RemoveAssetTransitionButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RemoveAssetTransitionButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _RemoveAssetTransitionButtonSkin_BitmapImage2() : BitmapImage
      {
         return this._1497358420_RemoveAssetTransitionButtonSkin_BitmapImage2;
      }
      
      public function set _RemoveAssetTransitionButtonSkin_BitmapImage2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1497358420_RemoveAssetTransitionButtonSkin_BitmapImage2;
         if(_loc2_ !== param1)
         {
            this._1497358420_RemoveAssetTransitionButtonSkin_BitmapImage2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RemoveAssetTransitionButtonSkin_BitmapImage2",_loc2_,param1));
            }
         }
      }
   }
}
