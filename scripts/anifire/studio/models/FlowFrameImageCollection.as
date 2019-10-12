package anifire.studio.models
{
   import anifire.studio.core.PropThumb;
   import spark.collections.Sort;
   import spark.collections.SortField;
   
   public class FlowFrameImageCollection extends PropCollection
   {
       
      
      public function FlowFrameImageCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         this.addPlaceHolders();
         this.initSort();
      }
      
      protected function addPlaceHolders() : void
      {
         var _loc1_:ThumbModel = new ThumbModel(null);
         _loc1_.isPlaceHolder = true;
         _loc1_.placeHolderValue = ThumbModel.PLACE_HOLDER_ADD_INNER_IMAGE;
         addProduct(_loc1_);
         var _loc2_:ThumbModel = new ThumbModel(null);
         _loc2_.isPlaceHolder = true;
         _loc2_.placeHolderValue = ThumbModel.PLACE_HOLDER_REMOVE_INNER_IMAGE;
         addProduct(_loc2_);
         _placeHolderCount = length;
      }
      
      protected function initSort() : void
      {
         var _loc1_:Sort = new Sort();
         _loc1_.fields = [new SortField("placeHolderValue",true),new SortField("id",true)];
         this.sort = _loc1_;
      }
      
      override public function addProductIfAppropriate(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc3_:PropThumb = param1.thumb as PropThumb;
         if(_loc3_ && !_loc3_.isSwf)
         {
            addProduct(param1,param2);
            return true;
         }
         return false;
      }
   }
}
