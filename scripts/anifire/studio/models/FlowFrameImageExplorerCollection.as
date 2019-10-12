package anifire.studio.models
{
   public class FlowFrameImageExplorerCollection extends ProductGroupCollection
   {
      
      private static const CATEGORY_NAME_OTHERS:String = "Others";
      
      private static const CATEGORY_NAME_PPT:String = "PPT Imports";
      
      private static const CATEGORY_NAME_SEARCH_RESULT:String = "Search Results";
       
      
      private var _searchResult:SearchPropCollection;
      
      public function FlowFrameImageExplorerCollection(param1:Array = null)
      {
         super(param1);
         var _loc2_:FlowFrameImageCollection = new FlowFrameImageCollection(CATEGORY_NAME_OTHERS);
         addCollection(_loc2_);
         var _loc3_:FolderCollection = new FolderCollection(CATEGORY_NAME_PPT);
         _loc3_.productFilter = _loc3_.isFolder;
         addCollection(_loc3_);
         this._searchResult = new SearchPropCollection(CATEGORY_NAME_SEARCH_RESULT);
         addCollection(this._searchResult);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         if(!param1.isPlaceHolder && productKeys[param1.id])
         {
            return false;
         }
         if(!param1.isFolder)
         {
            this._searchResult.addProduct(param1);
         }
         return super.addProduct(param1,param2);
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this._searchResult;
      }
   }
}
