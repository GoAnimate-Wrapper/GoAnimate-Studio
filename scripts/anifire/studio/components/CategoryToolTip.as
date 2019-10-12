package anifire.studio.components
{
   import flash.display.Bitmap;
   import flashx.textLayout.elements.InlineGraphicElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.TextFlow;
   
   public class CategoryToolTip extends ArrowToolTipGroup
   {
      
      private static var StarImageClass:Class = CategoryToolTip_StarImageClass;
       
      
      public function CategoryToolTip()
      {
         super();
      }
      
      override protected function createTextFlow(param1:String) : TextFlow
      {
         var _loc2_:TextFlow = null;
         var _loc3_:Array = null;
         var _loc4_:ParagraphElement = null;
         var _loc5_:SpanElement = null;
         var _loc6_:InlineGraphicElement = null;
         var _loc7_:Bitmap = null;
         var _loc8_:SpanElement = null;
         if(param1)
         {
            _loc2_ = new TextFlow();
            _loc3_ = param1.split("{0}");
            _loc4_ = new ParagraphElement();
            _loc5_ = new SpanElement();
            _loc5_.text = _loc3_[0];
            _loc4_.addChild(_loc5_);
            if(_loc3_.length > 1)
            {
               _loc6_ = new InlineGraphicElement();
               _loc7_ = new StarImageClass();
               _loc6_.source = _loc7_;
               _loc4_.addChild(_loc6_);
               _loc8_ = new SpanElement();
               _loc8_.text = _loc3_[1];
               _loc4_.addChild(_loc8_);
            }
            _loc2_.fontFamily = "StudioSparkMain";
            _loc2_.addChild(_loc4_);
            return _loc2_;
         }
         return null;
      }
   }
}
