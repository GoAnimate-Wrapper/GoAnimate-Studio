package anifire.studio.models
{
   import anifire.studio.core.BackgroundThumb;
   
   public class StarterCollection extends BackgroundCollection
   {
       
      
      public function StarterCollection(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
      
      override protected function sortBackground(param1:Object, param2:Object, param3:Array = null) : int
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
            }
         }
         return super.sortBackground(param1,param2,param3);
      }
   }
}
