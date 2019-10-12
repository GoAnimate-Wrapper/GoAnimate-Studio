package anifire.studio.models
{
   import anifire.studio.events.ProductGroupCollectionEvent;
   import flash.events.Event;
   import mx.events.PropertyChangeEvent;
   
   public class SwapPropExplorerCollection extends ProductGroupCollection
   {
      
      public static var categoryPattern:RegExp = /^cat:(.+)$/;
       
      
      public var searchResult:SearchPropCollection;
      
      private var _196131776otherProps:PropCollection;
      
      public var autoGrouping:Boolean = true;
      
      protected var categoryList:Object;
      
      protected var productCategoryLookup:Object;
      
      public function SwapPropExplorerCollection(param1:Array = null)
      {
         super(param1);
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.searchResult = new SearchPropCollection("Search Results");
         this.otherProps = new PropCollection("Others");
         this.otherProps.sortOrder = -1;
         this.otherProps.productFilter = this.otherProps.isNonSpecialProp;
         addCollection(this.searchResult);
         addCollection(this.otherProps);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:PropCollection = null;
         var _loc8_:int = 0;
         if(productKeys[param1.id])
         {
            return false;
         }
         var _loc3_:int = 0;
         if(this.autoGrouping)
         {
            _loc5_ = param1.thumb.sysTags;
            _loc8_ = 0;
            while(_loc8_ < _loc5_.length)
            {
               _loc6_ = categoryPattern.exec(_loc5_[_loc8_]);
               if(_loc6_)
               {
                  _loc7_ = this.getPropCategoryCollection(_loc6_[1]);
                  _loc7_.addProduct(param1);
                  _loc3_++;
               }
               _loc8_++;
            }
         }
         if(_loc3_ == 0)
         {
            _loc4_ = super.addProduct(param1,param2);
         }
         else
         {
            _loc4_ = true;
         }
         if(_loc4_)
         {
            this.searchResult.addProduct(param1);
            registerProduct(param1);
            dispatchEvent(new Event(Event.CHANGE));
         }
         return _loc4_;
      }
      
      protected function getPropCategoryCollection(param1:String) : PropCollection
      {
         var _loc3_:ProductGroupCollectionEvent = null;
         var _loc2_:PropCollection = this.categoryList[param1];
         if(!_loc2_)
         {
            _loc2_ = new PropCollection(param1);
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
         addCollection(this.otherProps);
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
      public function get otherProps() : PropCollection
      {
         return this._196131776otherProps;
      }
      
      public function set otherProps(param1:PropCollection) : void
      {
         var _loc2_:Object = this._196131776otherProps;
         if(_loc2_ !== param1)
         {
            this._196131776otherProps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"otherProps",_loc2_,param1));
            }
         }
      }
   }
}
