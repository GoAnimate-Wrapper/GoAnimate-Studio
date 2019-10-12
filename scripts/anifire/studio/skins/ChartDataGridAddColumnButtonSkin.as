package anifire.studio.skins
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class ChartDataGridAddColumnButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_widget_img_add_row_png_462844951:Class;
      
      public function ChartDataGridAddColumnButtonSkin()
      {
         this._embed_mxml__styles_images_widget_img_add_row_png_462844951 = ChartDataGridAddColumnButtonSkin__embed_mxml__styles_images_widget_img_add_row_png_462844951;
         super();
         mx_internal::_document = this;
         this.width = 15;
         this.height = 21;
         this.mxmlContent = [this._ChartDataGridAddColumnButtonSkin_Rect1_c(),this._ChartDataGridAddColumnButtonSkin_BitmapImage1_c()];
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
      
      private function _ChartDataGridAddColumnButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ChartDataGridAddColumnButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ChartDataGridAddColumnButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3634584;
         return _loc1_;
      }
      
      private function _ChartDataGridAddColumnButtonSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_widget_img_add_row_png_462844951;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
   }
}
