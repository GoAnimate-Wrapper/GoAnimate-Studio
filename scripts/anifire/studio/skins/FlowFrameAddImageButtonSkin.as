package anifire.studio.skins
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkButtonSkin;
   
   public class FlowFrameAddImageButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_stage_button_flow_frame_add_image_png_807925413:Class;
      
      public function FlowFrameAddImageButtonSkin()
      {
         this._embed_mxml__styles_images_stage_button_flow_frame_add_image_png_807925413 = FlowFrameAddImageButtonSkin__embed_mxml__styles_images_stage_button_flow_frame_add_image_png_807925413;
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._FlowFrameAddImageButtonSkin_BitmapImage1_c()];
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
      
      private function _FlowFrameAddImageButtonSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_stage_button_flow_frame_add_image_png_807925413;
         _loc1_.smooth = true;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
   }
}
