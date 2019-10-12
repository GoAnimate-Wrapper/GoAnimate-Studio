package anifire.studio.models
{
   import anifire.studio.components.PropThumbRenderer;
   import anifire.studio.core.FlowFrameThumb;
   import anifire.studio.core.FolderThumb;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.WidgetThumb;
   import mx.core.ClassFactory;
   import spark.layouts.TileLayout;
   
   public class PropCollection extends ProductCollection
   {
       
      
      public function PropCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         var _loc3_:TileLayout = new TileLayout();
         _loc3_.useVirtualLayout = true;
         _loc3_.horizontalGap = 2;
         _loc3_.verticalGap = 5;
         _loc3_.paddingRight = 3;
         _loc3_.columnAlign = "justifyUsingGap";
         _loc3_.orientation = "rows";
         layout = _loc3_;
         itemRenderer = new ClassFactory(PropThumbRenderer);
      }
      
      public function isHandProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_ && _loc2_.holdable)
         {
            return true;
         }
         return false;
      }
      
      public function isHeadProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_ && _loc2_.headable)
         {
            return true;
         }
         return false;
      }
      
      public function isHeadGearProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_ && _loc2_.wearable)
         {
            return true;
         }
         return false;
      }
      
      public function isProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_)
         {
            return true;
         }
         return false;
      }
      
      public function isWidget(param1:ThumbModel) : Boolean
      {
         return param1.thumb is WidgetThumb;
      }
      
      public function isFlowFrame(param1:ThumbModel) : Boolean
      {
         return param1.thumb is FlowFrameThumb;
      }
      
      public function isNonSpecialProp(param1:ThumbModel) : Boolean
      {
         var _loc2_:PropThumb = param1.thumb as PropThumb;
         if(_loc2_)
         {
            return !(_loc2_ is FlowFrameThumb || _loc2_ is WidgetThumb || _loc2_ is FolderThumb || _loc2_.wearable || _loc2_.holdable || _loc2_.headable);
         }
         return false;
      }
      
      override public function sortProducts() : void
      {
      }
   }
}
