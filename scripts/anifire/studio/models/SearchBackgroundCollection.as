package anifire.studio.models
{
   import anifire.constant.ThemeConstants;
   import anifire.studio.core.BackgroundThumb;
   import spark.collections.Sort;
   
   public class SearchBackgroundCollection extends SearchCollection
   {
       
      
      public var starterOnly:Boolean;
      
      public function SearchBackgroundCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         _productSort = new Sort();
         _productSort.compareFunction = this.sortBackground;
      }
      
      protected function sortBackground(param1:Object, param2:Object, param3:Array = null) : int
      {
         var _loc6_:BackgroundThumb = null;
         var _loc7_:BackgroundThumb = null;
         var _loc4_:ThumbModel = param1 as ThumbModel;
         var _loc5_:ThumbModel = param2 as ThumbModel;
         if(_loc4_ && _loc5_)
         {
            _loc6_ = _loc4_.thumb as BackgroundThumb;
            _loc7_ = _loc5_.thumb as BackgroundThumb;
            if(_loc6_ && _loc7_)
            {
               if(_loc6_.starterSubCategory && _loc7_.starterSubCategory && _loc6_.starterSubCategory != _loc7_.starterSubCategory)
               {
                  return _loc6_.starterSubCategory > _loc7_.starterSubCategory?1:-1;
               }
               if(!_loc6_.starterSubCategory && _loc7_.starterSubCategory)
               {
                  return 1;
               }
               if(_loc6_.starterSubCategory && !_loc7_.starterSubCategory)
               {
                  return -1;
               }
               if(_loc6_ && _loc7_ && _loc6_.themeId != _loc7_.themeId)
               {
                  return _loc6_.themeId == ThemeConstants.COMMON_THEME_ID?1:-1;
               }
            }
            return _loc4_.name.toLowerCase() > _loc5_.name.toLowerCase()?1:-1;
         }
         return 0;
      }
      
      override protected function postSuggestionFilter(param1:ThumbModel) : Boolean
      {
         var _loc2_:BackgroundThumb = null;
         if(this.starterOnly)
         {
            _loc2_ = param1.thumb as BackgroundThumb;
            return _loc2_ && _loc2_.isStarter;
         }
         return true;
      }
      
      override public function reset() : void
      {
         super.reset();
         filterFunction = null;
         refresh();
      }
   }
}
