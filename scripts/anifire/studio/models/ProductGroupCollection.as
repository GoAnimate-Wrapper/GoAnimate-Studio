package anifire.studio.models
{
   import anifire.studio.events.ProductCollectionEvent;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.ThumbCategoryManager;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import spark.collections.Sort;
   import spark.collections.SortField;
   
   public class ProductGroupCollection extends ArrayCollection
   {
       
      
      protected var productKeys:Object;
      
      protected var collections:Vector.<ProductCollection>;
      
      protected var _placeHolderProduct:ThumbModel;
      
      protected var _favoritedCollections:ArrayCollection;
      
      protected var _themeId:String;
      
      public function ProductGroupCollection(param1:Array = null)
      {
         super(param1);
         this.productKeys = {};
         this.collections = new Vector.<ProductCollection>();
         this._favoritedCollections = new ArrayCollection();
      }
      
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      public function set themeId(param1:String) : void
      {
         this._themeId = param1;
      }
      
      public function get favoritedCollection() : ArrayCollection
      {
         return this._favoritedCollections;
      }
      
      public function reorderFavoritedCollection() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:ProductCollection = null;
         var _loc1_:ThumbCategoryManager = ThemeManager.instance.currentTheme.thumbCategoryManager;
         if(_loc1_)
         {
            _loc2_ = this._favoritedCollections.length;
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc5_ = this._favoritedCollections[_loc4_];
               _loc3_.push(_loc5_.thumbCategory.key);
               _loc4_++;
            }
            _loc1_.updateCategoryOrdering(_loc3_,_loc5_.thumbCategory.categoryType);
         }
      }
      
      public function get placeHolderProduct() : ThumbModel
      {
         return this._placeHolderProduct;
      }
      
      public function addCollection(param1:ProductCollection) : void
      {
         var _loc2_:int = 0;
         if(!param1)
         {
            return;
         }
         addItem(param1);
         this.collections.push(param1);
         if(param1.isFavorited)
         {
            _loc2_ = 0;
            while(_loc2_ < this._favoritedCollections.length)
            {
               if(param1.thumbCategory.sortOrder <= this._favoritedCollections[_loc2_].thumbCategory.sortOrder)
               {
                  break;
               }
               _loc2_++;
            }
            this._favoritedCollections.addItemAt(param1,_loc2_);
         }
         param1.addEventListener(ProductCollectionEvent.FAVORITED_CATEGORY_ADD,this.collection_favoritedCategoryAddHandler);
         param1.addEventListener(ProductCollectionEvent.FAVORITED_CATEGORY_REMOVE,this.collection_favoritedCategoryRemoveHandler);
         param1.addEventListener(ProductCollectionEvent.FEATURED_CATEGORY_ADD,this.collection_featuredCategoryAddHandler);
         param1.addEventListener(ProductCollectionEvent.FEATURED_CATEGORY_REMOVE,this.collection_featuredCategoryRemoveHandler);
         this.dispatchEvent(new ProductGroupCollectionEvent(ProductGroupCollectionEvent.FAVORITED_COLLECTION_REFRESH));
      }
      
      private function collection_favoritedCategoryAddHandler(param1:Event) : void
      {
         var _loc2_:int = this._favoritedCollections.source.indexOf(param1.currentTarget);
         if(_loc2_ == -1)
         {
            this._favoritedCollections.addItem(param1.currentTarget);
            this._favoritedCollections.refresh();
            this.dispatchEvent(new ProductGroupCollectionEvent(ProductGroupCollectionEvent.FAVORITED_COLLECTION_REFRESH));
         }
      }
      
      private function collection_favoritedCategoryRemoveHandler(param1:Event) : void
      {
         var _loc2_:int = this._favoritedCollections.source.indexOf(param1.currentTarget);
         if(_loc2_ != -1)
         {
            this._favoritedCollections.removeItemAt(_loc2_);
            this._favoritedCollections.refresh();
            this.dispatchEvent(new ProductGroupCollectionEvent(ProductGroupCollectionEvent.FAVORITED_COLLECTION_REFRESH));
         }
      }
      
      private function collection_featuredCategoryAddHandler(param1:Event) : void
      {
         this._favoritedCollections.refresh();
      }
      
      private function collection_featuredCategoryRemoveHandler(param1:Event) : void
      {
         this._favoritedCollections.refresh();
      }
      
      public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc6_:ProductCollection = null;
         var _loc7_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:int = this.collections.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = this.collections[_loc5_];
            _loc7_ = _loc6_.isMeta;
            if(_loc6_.addProductIfAppropriate(param1,param2))
            {
               dispatchEvent(new Event(Event.CHANGE));
               if(!_loc7_)
               {
                  this.registerProduct(param1);
                  this.registerProductCollection(param1,_loc6_);
                  return _loc6_.valid;
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function removeAllProducts() : void
      {
         var _loc3_:ProductCollection = null;
         var _loc1_:int = this.collections.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.collections[_loc2_];
            _loc3_.removeEventListener(ProductCollectionEvent.FAVORITED_CATEGORY_ADD,this.collection_favoritedCategoryAddHandler);
            _loc3_.removeEventListener(ProductCollectionEvent.FAVORITED_CATEGORY_REMOVE,this.collection_favoritedCategoryRemoveHandler);
            _loc3_.removeEventListener(ProductCollectionEvent.FEATURED_CATEGORY_ADD,this.collection_featuredCategoryAddHandler);
            _loc3_.removeEventListener(ProductCollectionEvent.FEATURED_CATEGORY_REMOVE,this.collection_featuredCategoryRemoveHandler);
            _loc3_.filterFunction = null;
            _loc3_.refresh();
            _loc3_.source = [];
            _loc2_++;
         }
         this.productKeys = {};
         this._favoritedCollections.removeAll();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      [Bindable(event="change")]
      public function get totalProducts() : int
      {
         var _loc3_:ProductCollection = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < length)
         {
            _loc3_ = getItemAt(_loc2_) as ProductCollection;
            if(_loc3_ && _loc3_.valid)
            {
               _loc1_ = _loc1_ + _loc3_.properProductCount;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      protected function registerProduct(param1:ThumbModel) : void
      {
         this.productKeys[param1.id] = param1;
      }
      
      protected function registerProductCollection(param1:ThumbModel, param2:ProductCollection) : void
      {
      }
      
      public function containsProduct(param1:ThumbModel) : Boolean
      {
         return this.productKeys[param1.id] != null;
      }
      
      public function removeProductById(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ProductCollection = null;
         if(this.productKeys[param1] != null)
         {
            _loc2_ = this.collections.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.collections[_loc3_];
               if(_loc4_.removeProductById(param1))
               {
                  this.productKeys[param1] = null;
               }
               _loc3_++;
            }
         }
      }
      
      public function getSearchCollection() : SearchCollection
      {
         return null;
      }
      
      public function getCategoryByProductId(param1:String) : ProductCollection
      {
         return null;
      }
      
      public function getProductById(param1:String) : ThumbModel
      {
         return this.productKeys[param1];
      }
      
      public function sortByCategoryName() : void
      {
         var _loc1_:Sort = new Sort();
         var _loc2_:Array = [];
         _loc2_.push(new SortField("categoryName"));
         _loc1_.fields = _loc2_;
         sort = _loc1_;
         refresh();
      }
   }
}
