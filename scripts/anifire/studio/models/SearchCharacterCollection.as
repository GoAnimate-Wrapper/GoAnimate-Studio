package anifire.studio.models
{
   import anifire.studio.core.Thumb;
   
   public class SearchCharacterCollection extends SearchCollection
   {
      
      public static var tagPattern:RegExp = /^\s*_?(?:cat|tag):(.+)\s*$/;
       
      
      private var searchPattern:RegExp;
      
      public function SearchCharacterCollection(param1:String)
      {
         super(param1,source);
      }
      
      override public function search(param1:String) : void
      {
         this.keyword = param1;
         this.searchPattern = new RegExp(param1,"i");
         filterFunction = this.searchFilter;
         refresh();
         completeSearch();
      }
      
      override protected function searchFilter(param1:Object) : Boolean
      {
         var _loc3_:Thumb = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:Object = null;
         var _loc2_:ThumbModel = param1 as ThumbModel;
         if(_loc2_)
         {
            _loc3_ = _loc2_.thumb;
            if(this.searchPattern.exec(_loc2_.name))
            {
               return true;
            }
            _loc5_ = _loc3_.sysTags.length;
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc3_.sysTags[_loc4_];
               if(this.searchPattern.exec(_loc6_))
               {
                  return true;
               }
               _loc4_++;
            }
            if(_loc3_.tags)
            {
               _loc7_ = _loc3_.tags.split(",");
               _loc5_ = _loc7_.length;
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  _loc8_ = tagPattern.exec(_loc7_[_loc4_]);
                  if(_loc8_)
                  {
                     _loc6_ = _loc8_[1];
                     if(this.searchPattern.exec(_loc6_))
                     {
                        return true;
                     }
                  }
                  _loc4_++;
               }
            }
         }
         return false;
      }
   }
}
