package anifire.studio.components
{
   import mx.core.IFlexModuleFactory;
   import mx.graphics.SolidColor;
   import spark.components.gridClasses.GridItemRenderer;
   import spark.primitives.Rect;
   
   public class WidgetGridControlRenderer extends GridItemRenderer
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function WidgetGridControlRenderer()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._WidgetGridControlRenderer_Rect1_c()];
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
      
      private function _WidgetGridControlRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._WidgetGridControlRenderer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetGridControlRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
   }
}
