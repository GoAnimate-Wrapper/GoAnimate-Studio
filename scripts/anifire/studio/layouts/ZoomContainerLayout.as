package anifire.studio.layouts
{
   import spark.components.supportClasses.GroupBase;
   import spark.core.NavigationUnit;
   import spark.layouts.BasicLayout;
   
   public class ZoomContainerLayout extends BasicLayout
   {
      
      public static const HORIZONTAL_PAGE_RATIO:Number = 0.1;
      
      public static const VERTICAL_PAGE_RATIO:Number = 0.1;
       
      
      public function ZoomContainerLayout()
      {
         super();
      }
      
      override public function getVerticalScrollPositionDelta(param1:uint) : Number
      {
         var _loc2_:GroupBase = target;
         if(!_loc2_)
         {
            return 0;
         }
         switch(param1)
         {
            case NavigationUnit.UP:
            case NavigationUnit.PAGE_UP:
            case NavigationUnit.DOWN:
            case NavigationUnit.PAGE_DOWN:
               return _loc2_.contentHeight * VERTICAL_PAGE_RATIO;
            default:
               return super.getVerticalScrollPositionDelta(param1);
         }
      }
      
      override public function getHorizontalScrollPositionDelta(param1:uint) : Number
      {
         var _loc2_:GroupBase = target;
         if(!_loc2_)
         {
            return 0;
         }
         switch(param1)
         {
            case NavigationUnit.LEFT:
            case NavigationUnit.PAGE_LEFT:
            case NavigationUnit.RIGHT:
            case NavigationUnit.PAGE_RIGHT:
               return _loc2_.contentWidth * HORIZONTAL_PAGE_RATIO;
            default:
               return super.getHorizontalScrollPositionDelta(param1);
         }
      }
   }
}
