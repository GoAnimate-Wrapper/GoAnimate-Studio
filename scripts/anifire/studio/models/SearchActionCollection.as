package anifire.studio.models
{
   import anifire.util.UtilText;
   import spark.collections.Sort;
   import spark.collections.SortField;
   
   public class SearchActionCollection extends SearchCollection
   {
       
      
      public var motionOnly:Boolean;
      
      public var characterThemeId:String;
      
      public function SearchActionCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         _productSort = new Sort();
         _productSort.fields = [new SortField("name")];
      }
      
      override public function search(param1:String) : void
      {
         this.keyword = param1;
         filterFunction = this.searchFilter;
         refresh();
         completeSearch();
      }
      
      override protected function searchFilter(param1:Object) : Boolean
      {
         var _loc2_:ActionThumbModel = param1 as ActionThumbModel;
         if(_loc2_ && (!this.motionOnly || _loc2_.isMotion))
         {
            return UtilText.search(keyword,_loc2_.name);
         }
         return false;
      }
      
      override public function searchBySuggestion(param1:String, param2:String, param3:String = null) : void
      {
         super.searchBySuggestion(param1,param2,this.characterThemeId);
      }
      
      override protected function searchFilterBySuggestion(param1:Object) : Boolean
      {
         if(!_resultBySuggestion)
         {
            return false;
         }
         var _loc2_:ActionThumbModel = param1 as ActionThumbModel;
         if(_loc2_)
         {
            return _resultBySuggestion[_loc2_.searchKey];
         }
         return false;
      }
   }
}
