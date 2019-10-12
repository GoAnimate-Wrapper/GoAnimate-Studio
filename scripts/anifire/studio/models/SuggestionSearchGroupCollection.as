package anifire.studio.models
{
   import anifire.constant.ProductConstants;
   import anifire.studio.managers.ProductManager;
   import anifire.util.UtilDict;
   import mx.collections.ArrayCollection;
   import mx.utils.StringUtil;
   
   public class SuggestionSearchGroupCollection extends SearchGroupCollection
   {
       
      
      private var _props:SuggestionSearchPropCollection;
      
      private var _backgrounds:SuggestionSearchTemplateCollection;
      
      public function SuggestionSearchGroupCollection(param1:Array = null)
      {
         super(param1);
      }
      
      override protected function initCollections() : void
      {
         this._props = new SuggestionSearchPropCollection(SearchGroupCollection.CATEGORY_NAME_PROP);
         this._props.productFilter = this._props.isProp;
         this._backgrounds = new SuggestionSearchTemplateCollection(SearchGroupCollection.CATEGORY_NAME_TEMPLATE);
         this._backgrounds.productFilter = this._backgrounds.isStarter;
         addCollection(this._props);
         addCollection(this._backgrounds);
      }
      
      override public function search(param1:String, param2:String = null) : void
      {
         this.keyword = param1;
         if(this._props)
         {
            this._props.searchBySuggestion(param1,ProductConstants.PRODUCT_TYPE_PROP,param2);
         }
         if(this._backgrounds)
         {
            this._backgrounds.searchBySuggestion(param1,ProductConstants.PRODUCT_TYPE_TEMPLATE,param2);
         }
      }
      
      override protected function set keyword(param1:String) : void
      {
         var _loc2_:String = StringUtil.substitute(UtilDict.translate(SearchGroupCollection.EMPTY_RESULT_MESSAGE),param1);
         this._props.emptyMessage = _loc2_;
         this._backgrounds.emptyMessage = _loc2_;
      }
      
      override public function clear() : void
      {
         if(this._props)
         {
            this._props.emptyMessage = null;
            this._props.reset();
         }
         if(this._backgrounds)
         {
            this._backgrounds.emptyMessage = null;
            this._backgrounds.reset();
         }
      }
      
      override public function loadAllProducts() : void
      {
         var _loc1_:ProductManager = ProductManager.instance;
         var _loc2_:ArrayCollection = _loc1_.getProduct(ProductConstants.PRODUCT_TYPE_PROP);
         this.addProductsFromThumbList(_loc2_);
         var _loc3_:ArrayCollection = _loc1_.getProduct(ProductConstants.PRODUCT_TYPE_TEMPLATE);
         this.addProductsFromThumbList(_loc3_);
      }
   }
}
