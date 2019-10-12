package anifire.studio.components
{
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.models.ProductCollection;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.events.DragEvent;
   import mx.utils.StringUtil;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.List;
   import spark.components.ToggleButton;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.components.supportClasses.TextBase;
   import spark.events.IndexChangeEvent;
   
   public class CategorizedProductExplorer extends ProductExplorer
   {
      
      private static const SELECTED_CATEGORY_SUBTITLE:String = "{0} Templates";
      
      private static const SEARCH_RESULT_SUBTITLE:String = "{0} results";
      
      private static const SINGLE_SEARCH_RESULT_SUBTITLE:String = "{0} result";
       
      
      [SkinPart(required="false")]
      public var favoritedCategoryList:List;
      
      [SkinPart(required="false")]
      public var favoritedCategoryGroup:Group;
      
      [SkinPart(required="false")]
      public var categoryTitle:TextBase;
      
      [SkinPart(required="false")]
      public var categorySubtitle:TextBase;
      
      [SkinPart(required="false")]
      public var backButton:Button;
      
      [SkinPart(required="false")]
      public var favoriteButton:ToggleButton;
      
      [SkinPart(required="false")]
      public var categoryGroup:SkinnableComponent;
      
      private var _productListingSearch:Boolean;
      
      private var _preSelectedCollection:ProductCollection;
      
      public function CategorizedProductExplorer()
      {
         super();
      }
      
      override protected function getCurrentSkinState() : String
      {
         if(this._productListingSearch)
         {
            return "productListingSearch";
         }
         if(this.selectedCollection)
         {
            return !!this.isSearching?"resultListing":"productListing";
         }
         if(loading)
         {
            return "loading";
         }
         return "normal";
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.backButton)
         {
            this.backButton.addEventListener(MouseEvent.CLICK,this.backButton_clickHandler);
         }
         else if(param2 == this.categoryTitle)
         {
            this.updateCategoryTitle();
         }
         else if(param2 == this.categorySubtitle)
         {
            this.updateCategorySubtitle();
         }
         else if(param2 == this.favoritedCategoryList)
         {
            this.favoritedCategoryList.addEventListener(IndexChangeEvent.CHANGE,this.favoritedCategoryList_changeHandler);
            this.favoritedCategoryList.addEventListener(MouseEvent.CLICK,this.favoritedCategoryList_clickHandler);
            this.favoritedCategoryList.addEventListener(DragEvent.DRAG_COMPLETE,this.categoryList_dragCompleteHandler);
            if(_productProvider)
            {
               this.favoritedCategoryList.dataProvider = _productProvider.favoritedCollection;
            }
         }
         else if(param2 == categoryList)
         {
            categoryList.addEventListener(MouseEvent.CLICK,this.categoryList_clickHandler);
         }
         else if(param2 == this.favoritedCategoryGroup)
         {
            this.updateFavoritedCategoryGroup();
         }
         else if(param2 == this.favoriteButton)
         {
            this.updateFavoriteButton();
            this.favoriteButton.addEventListener(Event.CHANGE,this.favoriteButton_changeHandler);
         }
         else if(param2 == this.categoryGroup)
         {
            TutorialManager.instance.registerComponent("bg-cat",this.categoryGroup);
         }
         else if(param2 == productList)
         {
            TutorialManager.instance.registerComponent("categorized-template-selection",productList);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.backButton)
         {
            this.backButton.removeEventListener(MouseEvent.CLICK,this.backButton_clickHandler);
         }
         else if(param2 == this.favoritedCategoryList)
         {
            this.favoritedCategoryList.removeEventListener(IndexChangeEvent.CHANGE,this.favoritedCategoryList_changeHandler);
            this.favoritedCategoryList.removeEventListener(MouseEvent.CLICK,this.favoritedCategoryList_clickHandler);
            this.favoritedCategoryList.removeEventListener(DragEvent.DRAG_COMPLETE,this.categoryList_dragCompleteHandler);
            this.favoritedCategoryList.dataProvider = null;
         }
         else if(param2 == categoryList)
         {
            categoryList.removeEventListener(MouseEvent.CLICK,this.categoryList_clickHandler);
         }
         else if(param2 == this.favoriteButton)
         {
            this.favoriteButton.removeEventListener(Event.CHANGE,this.favoriteButton_changeHandler);
         }
      }
      
      protected function categoryList_dragCompleteHandler(param1:DragEvent) : void
      {
         _productProvider.reorderFavoritedCollection();
      }
      
      private function backButton_clickHandler(param1:MouseEvent) : void
      {
         this.selectedCollection = null;
      }
      
      protected function favoriteButton_changeHandler(param1:Event) : void
      {
         if(_selectedCollection)
         {
            _selectedCollection.isFavorited = this.favoriteButton.selected;
         }
      }
      
      private function updateFavoriteButton() : void
      {
         if(this.favoriteButton && _selectedCollection)
         {
            this.favoriteButton.selected = _selectedCollection.isFavorited;
         }
      }
      
      override public function set productProvider(param1:ProductGroupCollection) : void
      {
         if(_productProvider == param1)
         {
            return;
         }
         if(_productProvider)
         {
            _productProvider.removeEventListener(ProductGroupCollectionEvent.FAVORITED_COLLECTION_REFRESH,this.productProvider_favoritedCollectionRefreshHandler);
         }
         super.productProvider = param1;
         if(_productProvider)
         {
            if(this.favoritedCategoryList)
            {
               this.favoritedCategoryList.dataProvider = _productProvider.favoritedCollection;
            }
            _productProvider.addEventListener(ProductGroupCollectionEvent.FAVORITED_COLLECTION_REFRESH,this.productProvider_favoritedCollectionRefreshHandler);
         }
         this.updateFavoritedCategoryGroup();
      }
      
      private function productProvider_favoritedCollectionRefreshHandler(param1:ProductGroupCollectionEvent) : void
      {
         this.updateFavoritedCategoryGroup();
      }
      
      private function updateFavoritedCategoryGroup() : void
      {
         if(this.favoritedCategoryGroup && _productProvider && _productProvider.favoritedCollection)
         {
            this.favoritedCategoryGroup.visible = this.favoritedCategoryGroup.includeInLayout = _productProvider.favoritedCollection.length > 0;
         }
      }
      
      override protected function categoryList_changeHandler(param1:IndexChangeEvent) : void
      {
         this._preSelectedCollection = categoryList.selectedItem as ProductCollection;
      }
      
      protected function favoritedCategoryList_changeHandler(param1:IndexChangeEvent) : void
      {
         this._preSelectedCollection = this.favoritedCategoryList.selectedItem as ProductCollection;
      }
      
      protected function favoritedCategoryList_clickHandler(param1:MouseEvent) : void
      {
         this.selectPreSelectedCollection();
      }
      
      private function selectPreSelectedCollection() : void
      {
         var _loc1_:TutorialManager = null;
         var _loc2_:Object = null;
         if(this._preSelectedCollection)
         {
            this.selectedCollection = this._preSelectedCollection;
            _loc1_ = TutorialManager.instance;
            _loc2_ = {
               "category":this._preSelectedCollection.categoryName,
               "tutorial":(!!_loc1_.currentTutorial?"yes":"no")
            };
            AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_CHOSE_TEMPLATE_CATEGORY,_loc2_);
         }
      }
      
      protected function categoryList_clickHandler(param1:MouseEvent) : void
      {
         this.selectPreSelectedCollection();
      }
      
      private function set productListingSearch(param1:Boolean) : void
      {
         if(this._productListingSearch != param1)
         {
            this._productListingSearch = param1;
            this.invalidateSkinState();
         }
      }
      
      override public function set selectedCollection(param1:ProductCollection) : void
      {
         if(_selectedCollection == param1)
         {
            return;
         }
         super.selectedCollection = param1;
         this.updateCategoryTitle();
         this.updateCategorySubtitle();
         this.updateFavoriteButton();
         if(this.favoritedCategoryList)
         {
            this.favoritedCategoryList.selectedItem = _selectedCollection;
         }
         this.invalidateSkinState();
      }
      
      private function updateCategorySubtitle() : void
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         if(this.categorySubtitle && _selectedCollection)
         {
            _loc1_ = SELECTED_CATEGORY_SUBTITLE;
            _loc2_ = _selectedCollection.length;
            if(this.isSearching)
            {
               _loc1_ = _loc2_ > 1?SEARCH_RESULT_SUBTITLE:SINGLE_SEARCH_RESULT_SUBTITLE;
            }
            _loc1_ = StringUtil.substitute(UtilDict.translate(_loc1_),_loc2_);
            this.categorySubtitle.text = _loc1_;
         }
      }
      
      private function updateCategoryTitle() : void
      {
         if(this.categoryTitle && _selectedCollection)
         {
            this.categoryTitle.text = _selectedCollection.label;
         }
      }
      
      override protected function restoreCategories() : void
      {
         if(this._productListingSearch)
         {
            this.clearSearch();
            restoreCollection();
            this.productListingSearch = false;
         }
         else
         {
            this.clearSearch();
         }
      }
      
      override protected function clearSearch() : void
      {
         super.clearSearch();
         this.selectedCollection = null;
      }
      
      override public function displayNaturally() : void
      {
         this.clearSearch();
      }
      
      override public function displayNaturallyWithCategoryName(param1:String) : void
      {
         this.clearSearch();
      }
      
      override public function selectSearchResult() : void
      {
         super.selectSearchResult();
         this.updateCategorySubtitle();
      }
   }
}
