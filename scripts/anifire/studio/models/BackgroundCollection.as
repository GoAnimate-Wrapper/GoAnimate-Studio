package anifire.studio.models
{
   import anifire.constant.ThemeConstants;
   import anifire.studio.components.BackgroundThumbRenderer;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.Thumb;
   import mx.core.ClassFactory;
   import spark.collections.Sort;
   import spark.layouts.TileLayout;
   
   public class BackgroundCollection extends ProductCollection
   {
       
      
      public function BackgroundCollection(param1:String, param2:Boolean = false)
      {
         super(param1);
         var _loc3_:TileLayout = new TileLayout();
         _loc3_.useVirtualLayout = true;
         _loc3_.paddingTop = 4;
         _loc3_.paddingBottom = 4;
         _loc3_.paddingRight = 8;
         _loc3_.paddingLeft = 6;
         _loc3_.columnAlign = "justifyUsingGap";
         _loc3_.orientation = "rows";
         _loc3_.requestedColumnCount = 2;
         layout = _loc3_;
         itemRenderer = new ClassFactory(BackgroundThumbRenderer);
         productFilter = this.isBackground;
         if(param2)
         {
            _productSort = new Sort();
            _productSort.compareFunction = this.sortBackground;
         }
      }
      
      protected function sortBackground(param1:Object, param2:Object, param3:Array = null) : int
      {
         var _loc6_:Thumb = null;
         var _loc7_:Thumb = null;
         var _loc4_:ThumbModel = param1 as ThumbModel;
         var _loc5_:ThumbModel = param2 as ThumbModel;
         if(_loc4_ && _loc5_)
         {
            _loc6_ = _loc4_.thumb;
            _loc7_ = _loc5_.thumb;
            if(_loc6_ && _loc7_ && _loc6_.themeId != _loc7_.themeId)
            {
               return _loc6_.themeId == ThemeConstants.COMMON_THEME_ID?1:-1;
            }
            return _loc4_.name.toLowerCase() > _loc5_.name.toLowerCase()?1:-1;
         }
         return 0;
      }
      
      public function isBackground(param1:ThumbModel) : Boolean
      {
         var _loc2_:BackgroundThumb = param1.thumb as BackgroundThumb;
         if(_loc2_)
         {
            return true;
         }
         return false;
      }
      
      public function isCompositeBackground(param1:ThumbModel) : Boolean
      {
         var _loc2_:BackgroundThumb = param1.thumb as BackgroundThumb;
         if(_loc2_ && _loc2_.isComposite)
         {
            return true;
         }
         return false;
      }
   }
}
