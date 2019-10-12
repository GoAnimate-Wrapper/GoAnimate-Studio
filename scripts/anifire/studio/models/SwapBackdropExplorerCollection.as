package anifire.studio.models
{
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import flash.events.Event;
   import mx.events.PropertyChangeEvent;
   
   public class SwapBackdropExplorerCollection extends ProductGroupCollection
   {
       
      
      public var searchResult:SearchBackgroundCollection;
      
      private var _1894790573otherBackdrops:BackgroundCollection;
      
      public var autoGrouping:Boolean = true;
      
      protected var categoryList:Object;
      
      protected var productCategoryLookup:Object;
      
      public function SwapBackdropExplorerCollection(param1:Array = null)
      {
         super(param1);
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.searchResult = new SearchBackgroundCollection("Search Results");
         this.otherBackdrops = new BackgroundCollection("Backdrops",true);
         this.otherBackdrops.sortOrder = -1;
         addCollection(this.searchResult);
         addCollection(this.otherBackdrops);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:BackgroundCollection = null;
         if(productKeys[param1.id])
         {
            return false;
         }
         if(this.autoGrouping)
         {
            _loc4_ = this.otherBackdrops;
            if(param1 && param1.thumb)
            {
               _loc3_ = BackgroundThumb(param1.thumb).category;
               if(_loc3_)
               {
                  _loc4_ = this.getBackdropCategoryCollection(_loc3_);
               }
            }
            if(param1.isPlaceHolder)
            {
               _loc4_ = this.getBackdropCategoryCollection("patterns");
            }
            _loc4_.addProduct(param1);
         }
         if(param1.isPlaceHolder)
         {
            _placeHolderProduct = param1;
         }
         this.searchResult.addProduct(param1);
         registerProduct(param1);
         this.registerProductCollection(param1,_loc4_);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      protected function getBackdropCategoryCollection(param1:String) : BackgroundCollection
      {
         var _loc3_:ProductGroupCollectionEvent = null;
         var _loc2_:BackgroundCollection = this.categoryList[param1];
         if(!_loc2_)
         {
            _loc2_ = new BackgroundCollection(param1,true);
            _loc2_.sortOrder = 1;
            this.categoryList[param1] = _loc2_;
            addCollection(_loc2_);
            _loc3_ = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_ADDED);
            _loc3_.collection = _loc2_;
            dispatchEvent(_loc3_);
         }
         return _loc2_;
      }
      
      override public function removeAllProducts() : void
      {
         super.removeAllProducts();
         source = [];
         collections = new Vector.<ProductCollection>();
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.searchResult.reset();
         addCollection(this.searchResult);
         addCollection(this.otherBackdrops);
         var _loc1_:ProductGroupCollectionEvent = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH);
         dispatchEvent(_loc1_);
      }
      
      override protected function registerProductCollection(param1:ThumbModel, param2:ProductCollection) : void
      {
         this.productCategoryLookup[param1.id] = param2;
      }
      
      override public function getCategoryByProductId(param1:String) : ProductCollection
      {
         return this.productCategoryLookup[param1];
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
      
      [Bindable(event="propertyChange")]
      public function get otherBackdrops() : BackgroundCollection
      {
         return this._1894790573otherBackdrops;
      }
      
      public function set otherBackdrops(param1:BackgroundCollection) : void
      {
         var _loc2_:Object = this._1894790573otherBackdrops;
         if(_loc2_ !== param1)
         {
            this._1894790573otherBackdrops = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"otherBackdrops",_loc2_,param1));
            }
         }
      }
   }
}
