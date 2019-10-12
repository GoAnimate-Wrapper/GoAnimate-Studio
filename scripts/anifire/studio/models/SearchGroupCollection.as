package anifire.studio.models
{
   import anifire.constant.ProductConstants;
   import anifire.studio.core.Thumb;
   import anifire.studio.managers.ProductManager;
   import anifire.util.UtilDict;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.events.CollectionEvent;
   import mx.utils.StringUtil;
   
   public class SearchGroupCollection extends ProductGroupCollection
   {
      
      public static const EMPTY_RESULT_MESSAGE:String = "No results for \'{0}\'";
      
      public static const CATEGORY_NAME_PROP:String = "Props";
      
      public static const CATEGORY_NAME_TEMPLATE:String = "Templates";
       
      
      private var _props:PropCollection;
      
      private var _backgrounds:BackgroundCollection;
      
      protected var _isSearching:Boolean;
      
      public function SearchGroupCollection(param1:Array = null)
      {
         super(param1);
         this.initCollections();
      }
      
      protected function initCollections() : void
      {
         this._props = new PropCollection(CATEGORY_NAME_PROP);
         this._props.productFilter = this._props.isProp;
         this._backgrounds = new BackgroundCollection(CATEGORY_NAME_TEMPLATE);
         this._backgrounds.productFilter = this._backgrounds.isCompositeBackground;
         addCollection(this._props);
         addCollection(this._backgrounds);
         this._props.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         this._backgrounds.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
      }
      
      protected function set keyword(param1:String) : void
      {
         var _loc2_:String = StringUtil.substitute(UtilDict.translate(EMPTY_RESULT_MESSAGE),param1);
         this._props.emptyMessage = _loc2_;
         this._backgrounds.emptyMessage = _loc2_;
         this._isSearching = true;
         this.changeLabel(this._props);
         this.changeLabel(this._backgrounds);
      }
      
      public function clear() : void
      {
         this._isSearching = false;
         this._props.emptyMessage = null;
         this._backgrounds.emptyMessage = null;
         removeAllProducts();
      }
      
      private function onCollectionChange(param1:CollectionEvent) : void
      {
         this.changeLabel(param1.currentTarget as ProductCollection);
      }
      
      private function changeLabel(param1:ProductCollection) : void
      {
         if(this._isSearching)
         {
            param1.label = StringUtil.substitute("{0} ({1})",param1.categoryName,param1.length);
         }
         else
         {
            param1.label = param1.categoryName;
         }
      }
      
      public function loadAllProducts() : void
      {
      }
      
      public function search(param1:String, param2:String = null) : void
      {
         if(!param1)
         {
            return;
         }
         this.removeAllProducts();
         this.keyword = param1;
         var _loc3_:ProductManager = ProductManager.instance;
         var _loc4_:ArrayCollection = _loc3_.searchProduct(param1,ProductConstants.PRODUCT_TYPE_PROP,param2);
         this.addProductsFromThumbList(_loc4_);
         var _loc5_:ArrayCollection = _loc3_.searchProduct(param1,ProductConstants.PRODUCT_TYPE_BACKGROUND,param2);
         this.addProductsFromThumbList(_loc5_);
      }
      
      protected function addProductsFromThumbList(param1:IList, param2:Boolean = true) : void
      {
         var _loc3_:Thumb = null;
         var _loc4_:int = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1.getItemAt(_loc5_) as Thumb;
            if(_loc3_ && _loc3_.enable)
            {
               addProduct(new ThumbModel(_loc3_),param2);
            }
            _loc5_++;
         }
      }
   }
}
