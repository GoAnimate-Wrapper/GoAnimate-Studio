package anifire.studio.models
{
   import anifire.constant.ThemeConstants;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.core.Thumb;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import flash.events.Event;
   import spark.collections.Sort;
   import spark.collections.SortField;
   
   public class BackgroundExplorerCollection extends ProductGroupCollection
   {
      
      public static const COLLECTION_NAME_SEARCH_RESULT:String = "Search Results";
      
      public static const COLLECTION_NAME_BACKDROP:String = "backdrops";
      
      public static const COLLECTION_NAME_STARTER:String = "Starters";
      
      public static const COLLECTION_NAME_SEPARATOR:String = "separator";
      
      public static const THEME_ID_BUSINESS_FRIENDLY:String = "business";
      
      public static const DEFAULT_CATEGORY_NAME:String = "_default";
      
      private static const SEPARATOR_SORT_ORDER:int = 1;
      
      private static const BACKDROPS_SORT_ORDER:int = 2;
      
      public static var categoryPattern:RegExp = /^cat:(.+)$/;
       
      
      public var autoGrouping:Boolean;
      
      public var autoSort:Boolean;
      
      protected var categoryList:Object;
      
      protected var _backgrounds:BackgroundCollection;
      
      protected var _starters:BackgroundCollection;
      
      protected var _separator:ProductCollection;
      
      public var searchResult:SearchBackgroundCollection;
      
      protected var productCategoryLookup:Object;
      
      private var _useCustomCategorySort:Boolean;
      
      private var _forTutorial:Boolean;
      
      private var _isUserTheme:Boolean;
      
      private var _customBgCategoryOrder:Vector.<String>;
      
      public function BackgroundExplorerCollection(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false)
      {
         this._customBgCategoryOrder = new <String>["text","office","hr","marketing","training","concepts","charts","layouts","logos","education","finance","government","healthcare","holidays","home","industrial","leisure","news","screens","shopping","travel","pirate","others"];
         super();
         this.autoGrouping = param2;
         this.autoSort = param1;
         this._forTutorial = param4;
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.searchResult = new SearchBackgroundCollection(COLLECTION_NAME_SEARCH_RESULT);
         this._backgrounds = new BackgroundCollection(COLLECTION_NAME_BACKDROP,param1);
         this._backgrounds.sortOrder = int.MAX_VALUE;
         addCollection(this.searchResult);
         addCollection(this._backgrounds);
         this._isUserTheme = param3;
         if(param3)
         {
            this._starters = new BackgroundCollection(COLLECTION_NAME_STARTER,param1);
            this._starters.isLazyLoad = true;
            this._starters.sortOrder = int.MAX_VALUE;
            addCollection(this._starters);
         }
      }
      
      public function get starterCollection() : BackgroundCollection
      {
         return this._starters;
      }
      
      public function disableStarterCollection() : void
      {
         if(this._starters)
         {
            this._starters.valid = false;
         }
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:BackgroundCollection = null;
         if(productKeys[param1.id])
         {
            return false;
         }
         var _loc4_:BackgroundThumb = param1.thumb as BackgroundThumb;
         if(this.autoGrouping)
         {
            if(_loc4_ && !_loc4_.isPlainBackdrop)
            {
               if(_loc4_.isStarter)
               {
                  _loc5_ = _loc4_.starterCategories;
               }
               else
               {
                  _loc5_ = [_loc4_.category];
               }
               _loc6_ = _loc5_.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc8_ = _loc5_[_loc7_];
                  if(_loc8_ != null && _loc8_ != "")
                  {
                     _loc9_ = this.getStarterCategoryCollection(_loc8_,_loc4_.theme);
                     if(_loc9_)
                     {
                        if(this._forTutorial)
                        {
                           _loc9_.addProductIfAppropriate(param1);
                        }
                        else
                        {
                           _loc9_.addProduct(param1);
                        }
                        _loc3_ = true;
                     }
                  }
                  _loc7_++;
               }
            }
         }
         if(!_loc3_ && (_loc4_.isComposite || this._isUserTheme))
         {
            this._backgrounds.addProduct(param1,param2);
         }
         this.searchResult.addProduct(param1);
         registerProduct(param1);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      protected function getStarterCategoryCollection(param1:String, param2:Theme) : StarterCollection
      {
         var _loc4_:ProductGroupCollectionEvent = null;
         var _loc3_:StarterCollection = this.categoryList[param1];
         if(!_loc3_)
         {
            _loc3_ = new StarterCollection(param1,this.autoSort);
            if(param2 && param2.thumbCategoryManager)
            {
               _loc3_.thumbCategory = param2.thumbCategoryManager.getCategory("template",param1);
            }
            if(ThemeConstants.isThumbCategorySupported(param2.id) && !_loc3_.thumbCategory)
            {
               return null;
            }
            if(this._forTutorial)
            {
               _loc3_.filterFunction = this.filterBackgroundForTutorial;
            }
            _loc3_.sortOrder = _loc3_.thumbCategory.sortOrder;
            this.categoryList[param1] = _loc3_;
            addCollection(_loc3_);
            _loc4_ = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_ADDED);
            _loc4_.collection = _loc3_;
            dispatchEvent(_loc4_);
         }
         return _loc3_;
      }
      
      private function filterBackgroundForTutorial(param1:ThumbModel) : Boolean
      {
         var _loc2_:BackgroundThumb = param1.thumb as BackgroundThumb;
         if(_loc2_ && !_loc2_.shouldBeHiddenInTutorial)
         {
            return true;
         }
         return false;
      }
      
      public function addStarter(param1:ThumbModel, param2:Boolean = true) : void
      {
         this._starters.addItemAt(param1,!!param2?int(this._starters.length):0);
      }
      
      public function removeStarterById(param1:String) : void
      {
         if(this._starters)
         {
            this._starters.removeProductById(param1);
         }
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
         addCollection(this._backgrounds);
         this._useCustomCategorySort = false;
         this._separator = null;
         if(this._starters)
         {
            addCollection(this._starters);
         }
         var _loc1_:ProductGroupCollectionEvent = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH);
         dispatchEvent(_loc1_);
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
      
      public function getCollectionByKey(param1:String) : BackgroundCollection
      {
         var _loc2_:int = 0;
         var _loc3_:BackgroundCollection = null;
         while(_loc2_ < length)
         {
            _loc3_ = getItemAt(_loc2_) as BackgroundCollection;
            if(_loc3_ && _loc3_.thumbCategory.key == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function useCustomCategorySort() : void
      {
         if(this._useCustomCategorySort)
         {
            return;
         }
         this._useCustomCategorySort = true;
         this.sortByCategoryName();
      }
      
      public function addSeparator() : void
      {
         if(this._separator)
         {
            return;
         }
         this._separator = new ProductCollection(COLLECTION_NAME_SEPARATOR);
         this._separator.isSeparator = true;
         this._separator.addProduct(new ThumbModel(new Thumb()));
         addCollection(this._separator);
      }
      
      override public function sortByCategoryName() : void
      {
         var _loc1_:Sort = null;
         var _loc2_:Array = null;
         if(this._useCustomCategorySort)
         {
            _loc1_ = new Sort();
            _loc2_ = [];
            _loc2_.push(new SortField("sortOrder",false,true));
            _loc2_.push(new SortField("categoryName"));
            _loc1_.fields = _loc2_;
            sort = _loc1_;
            refresh();
         }
         else
         {
            super.sortByCategoryName();
         }
      }
   }
}
