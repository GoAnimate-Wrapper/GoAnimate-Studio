package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.studio.core.Console;
   import anifire.studio.core.FolderThumb;
   import anifire.studio.events.InfiniteScrollEvent;
   import anifire.studio.events.ProductExplorerEvent;
   import anifire.studio.managers.AnalyticsManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.models.FolderCollection;
   import anifire.studio.models.ProductCollection;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.studio.models.SearchCollection;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.skins.ProductExplorerSkin;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import mx.core.IFactory;
   import mx.events.CollectionEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.StringUtil;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.List;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.components.supportClasses.TextBase;
   import spark.core.NavigationUnit;
   import spark.events.IndexChangeEvent;
   import spark.events.RendererExistenceEvent;
   import spark.events.TrackBaseEvent;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class ProductExplorer extends SkinnableComponent
   {
      
      private static const SEARCH_ERROR_MESSAGE:String = "Oh, a connection problem has occurred and your search results could not be found. Please try again later.";
      
      private static const SEARCH_EMPTY_RESULT_MESSAGE:String = "No results found for \"{0}\"";
      
      public static const FOLDER_SUBTITLE:String = "{0} Props";
      
      private static const SKIN_STATE_NORMAL:String = "normal";
      
      private static const SKIN_STATE_LOADING:String = "loading";
      
      private static const SKIN_STATE_CATEGORY_EXPANDED:String = "categoryExpanded";
      
      private static const SKIN_STATE_FOLDER_OPENED:String = "folderOpened";
       
      
      [SkinPart(required="false")]
      public var categoryList:List;
      
      [SkinPart(required="true")]
      public var productList:List;
      
      [SkinPart(required="false")]
      public var searchInput:FocusTextInput;
      
      [SkinPart(required="false")]
      public var searchInputGroup:Group;
      
      [SkinPart(required="false")]
      public var promptDisplay:TextBase;
      
      [SkinPart(required="false")]
      public var categoryListGroup:Group;
      
      [SkinPart(required="false")]
      public var folderTitle:TextBase;
      
      [SkinPart(required="false")]
      public var folderSubtitle:TextBase;
      
      [SkinPart(required="false")]
      public var folderBackButton:Button;
      
      [SkinPart(required="false")]
      public var folderProductList:List;
      
      protected var _categoryExpanded:Boolean;
      
      protected var _productProvider:ProductGroupCollection;
      
      protected var _productListSkin:Class;
      
      protected var _productLayout:LayoutBase;
      
      protected var _searchCollection:SearchCollection;
      
      protected var _productRenderer:IFactory;
      
      protected var _selectedCollection:ProductCollection;
      
      protected var lastSelectedCollection:ProductCollection;
      
      protected var lastSelectedKeywordIndex:int;
      
      protected var expandTimer:Timer;
      
      protected var _expandDelay:int = 500;
      
      protected var _collapseDelay:int = 250;
      
      protected var collapseTimer:Timer;
      
      protected var registeredCategoryListDragEvents:Boolean;
      
      protected var categoryListActive:Boolean;
      
      protected var _isSearching:Boolean;
      
      private var _1120575382categoryListWidth:Number = 98;
      
      private var _564613957searchDelay:int = 0;
      
      private var _tutorialManager:TutorialManager;
      
      protected var _loading:Boolean = false;
      
      private var _searchInputVisible:Boolean = true;
      
      private var _selectedFolder:ThumbModel;
      
      private var _folderProductCollection:ProductCollection;
      
      private var _1581674429allowSelection:Boolean;
      
      public var lastSearchKeyword:String;
      
      private var _1095294225emptyPrompt:String;
      
      private var _874357292selectedProduct:ThumbModel;
      
      protected var _alwaysExpand:Boolean;
      
      protected var _suggestionEnabled:Boolean;
      
      protected var _suggestionType:String;
      
      protected var _suggestionThemeId:String;
      
      public function ProductExplorer()
      {
         this._tutorialManager = TutorialManager.instance;
         super();
         this.expandTimer = new Timer(this._expandDelay,1);
         this.expandTimer.addEventListener(TimerEvent.TIMER,this.onExpandTimer);
         this.collapseTimer = new Timer(this._collapseDelay,1);
         this.collapseTimer.addEventListener(TimerEvent.TIMER,this.onCollapseTimer);
         setStyle("skinClass",ProductExplorerSkin);
      }
      
      public function get searchInputVisible() : Boolean
      {
         return this._searchInputVisible;
      }
      
      public function set searchInputVisible(param1:Boolean) : void
      {
         if(this._searchInputVisible != param1)
         {
            this._searchInputVisible = param1;
            if(this.searchInputGroup)
            {
               this.searchInputGroup.visible = this.searchInputGroup.includeInLayout = param1;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loading() : Boolean
      {
         return this._loading;
      }
      
      private function set _336650556loading(param1:Boolean) : void
      {
         if(this._loading != param1)
         {
            this._loading = param1;
            invalidateSkinState();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isSearching() : Boolean
      {
         return this._isSearching;
      }
      
      private function set _1338330320isSearching(param1:Boolean) : void
      {
         this._isSearching = param1;
      }
      
      public function get expandDelay() : int
      {
         return this._expandDelay;
      }
      
      public function set expandDelay(param1:int) : void
      {
         this._expandDelay = param1;
         this.expandTimer.delay = param1;
      }
      
      public function get collapseDelay() : int
      {
         return this._collapseDelay;
      }
      
      public function set collapseDelay(param1:int) : void
      {
         this._collapseDelay = param1;
         this.collapseTimer.delay = param1;
      }
      
      [Bindable(event="productSearched")]
      [Bindable(event="productCategoryChanged")]
      public function shouldDisplayPrompt() : Boolean
      {
         return !this.selectedCollection || this._searchCollection && this.selectedCollection == this._searchCollection && this._searchCollection.length == 0;
      }
      
      protected function getSearchEmptyPromptText(param1:String) : String
      {
         return StringUtil.substitute(UtilDict.toDisplay("go",SEARCH_EMPTY_RESULT_MESSAGE),param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get searchCollection() : SearchCollection
      {
         return this._searchCollection;
      }
      
      private function set _421330534searchCollection(param1:SearchCollection) : void
      {
         if(this._searchCollection != param1)
         {
            if(this._searchCollection)
            {
               this._searchCollection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.onSearchUpdate);
            }
            this._searchCollection = param1;
            if(this._searchCollection)
            {
               this._searchCollection.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onSearchUpdate);
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedCollection() : ProductCollection
      {
         return this._selectedCollection;
      }
      
      private function set _1799305113selectedCollection(param1:ProductCollection) : void
      {
         if(this._selectedCollection == param1)
         {
            return;
         }
         this._selectedCollection = param1;
         if(this._selectedCollection)
         {
            this._selectedCollection.sortProducts();
         }
         if(this.categoryList)
         {
            this.categoryList.selectedItem = this._selectedCollection;
            this.categoryList.validateNow();
         }
         if(this.productList)
         {
            if(this._selectedCollection && this._selectedCollection is FolderCollection && this._selectedCollection.listSkinClass)
            {
               this._productListSkin = this.productList.getStyle("skinClass");
               this.productList.setStyle("skinClass",this._selectedCollection.listSkinClass);
            }
            else if(this._productListSkin)
            {
               this.productList.setStyle("skinClass",this._productListSkin);
            }
            if(this._selectedCollection && this._selectedCollection is FolderCollection && this._selectedCollection.itemRenderer)
            {
               this._productRenderer = this.productList.itemRenderer;
               this.productList.itemRenderer = this._selectedCollection.itemRenderer;
            }
            else if(this._productRenderer)
            {
               this.productList.itemRenderer = this._productRenderer;
            }
            this.productList.dataProvider = this._selectedCollection;
         }
         var _loc2_:ProductExplorerEvent = new ProductExplorerEvent(ProductExplorerEvent.CATEGORY_CHANGED);
         _loc2_.collection = this._selectedCollection;
         dispatchEvent(_loc2_);
         if(this.promptDisplay)
         {
            this.promptDisplay.visible = this.shouldDisplayPrompt();
         }
         if(this._selectedCollection)
         {
            this._tutorialManager.notifyTutorialAction("prod-collection-selected");
         }
      }
      
      public function set productListSkin(param1:Class) : void
      {
         this._productListSkin = param1;
         if(this.productList)
         {
            this.productList.setStyle("skinClass",this._productListSkin);
         }
      }
      
      public function get productListSkin() : Class
      {
         return this._productListSkin;
      }
      
      public function get productRenderer() : IFactory
      {
         return this._productRenderer;
      }
      
      public function set productRenderer(param1:IFactory) : void
      {
         if(this._productRenderer != param1)
         {
            this._productRenderer = param1;
            if(this.productList)
            {
               this.productList.itemRenderer = this._productRenderer;
            }
            if(this.folderProductList)
            {
               this.folderProductList.itemRenderer = this._productRenderer;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryExpanded() : Boolean
      {
         return this._categoryExpanded;
      }
      
      private function set _827133993categoryExpanded(param1:Boolean) : void
      {
         if(this._categoryExpanded != param1)
         {
            this._categoryExpanded = param1;
            invalidateSkinState();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productProvider() : ProductGroupCollection
      {
         return this._productProvider;
      }
      
      private function set _840706048productProvider(param1:ProductGroupCollection) : void
      {
         if(this._productProvider != param1)
         {
            this.searchCollection = null;
            this.selectedCollection = null;
            this._productProvider = param1;
            if(this._productProvider)
            {
               this.searchCollection = this._productProvider.getSearchCollection();
               if(this.categoryList)
               {
                  this.categoryList.dataProvider = this._productProvider;
               }
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productLayout() : LayoutBase
      {
         return this._productLayout;
      }
      
      private function set _825623801productLayout(param1:LayoutBase) : void
      {
         if(this._productLayout != param1)
         {
            this._productLayout = param1;
            if(this.productList)
            {
               this.productList.layout = this._productLayout;
            }
         }
      }
      
      public function hideInvalidCategories() : void
      {
         if(this.productProvider)
         {
            this.productProvider.filterFunction = this.validCategoryFilter;
            this.productProvider.refresh();
         }
      }
      
      public function showAllCategories() : void
      {
         this.productProvider.filterFunction = null;
         this.productProvider.refresh();
      }
      
      public function selectFirstProperCategory() : void
      {
         var _loc1_:Boolean = false;
         var _loc4_:ProductCollection = null;
         if(!this.productProvider)
         {
            return;
         }
         var _loc2_:int = this.productProvider.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.productProvider.getItemAt(_loc3_) as ProductCollection;
            if(_loc4_.isProperCollection)
            {
               _loc1_ = true;
               this.selectedCollection = _loc4_;
               callLater(this.updateProductSelection);
               break;
            }
            _loc3_++;
         }
         if(!_loc1_)
         {
            this.selectedCollection = null;
         }
      }
      
      public function selectCategoryByName(param1:String) : void
      {
         var _loc2_:Boolean = false;
         var _loc5_:ProductCollection = null;
         if(!this.productProvider)
         {
            return;
         }
         var _loc3_:int = this.productProvider.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.productProvider.getItemAt(_loc4_) as ProductCollection;
            if(_loc5_.categoryName == param1)
            {
               _loc2_ = true;
               this.selectedCollection = _loc5_;
               callLater(this.updateProductSelection);
               break;
            }
            _loc4_++;
         }
         if(!_loc2_)
         {
            this.selectFirstProperCategory();
         }
      }
      
      public function selectProperCateogryIfCurrentIsEmpty() : void
      {
         if(this.selectedCollection && this.selectedCollection.length == 0)
         {
            this.clearSearch();
            this.hideInvalidCategories();
            this.selectFirstProperCategory();
         }
      }
      
      public function selectProperCategoryIfNoSelection() : void
      {
         if(!this.selectedCollection)
         {
            this.selectFirstProperCategory();
         }
      }
      
      private function selectCategoryIndex(param1:int) : void
      {
         if(this.productProvider && param1 < this.productProvider.length)
         {
            this.selectedCollection = this.productProvider.getItemAt(param1) as ProductCollection;
         }
      }
      
      public function selectSearchResult() : void
      {
         if(this.searchCollection)
         {
            this.productProvider.filterFunction = this.searchCategoryFilter;
            this.productProvider.refresh();
            if(this.selectedCollection != this.searchCollection)
            {
               this.lastSelectedCollection = this.selectedCollection;
            }
            this.selectedCollection = this.searchCollection;
         }
      }
      
      protected function clearSearch() : void
      {
         if(this.searchInput)
         {
            this.searchInput.clear();
         }
         if(this.promptDisplay)
         {
            this.promptDisplay.text = this.emptyPrompt;
         }
         this.isSearching = false;
         this.hideInvalidCategories();
      }
      
      private function onSearchUpdate(param1:Event) : void
      {
         dispatchEvent(new ProductExplorerEvent(ProductExplorerEvent.SEARCHED));
      }
      
      public function displayNaturally() : void
      {
         this.clearSearch();
         this.selectFirstProperCategory();
      }
      
      public function displayNaturallyWithCategoryName(param1:String) : void
      {
         this.clearSearch();
         this.selectCategoryByName(param1);
      }
      
      protected function restoreCollection() : void
      {
         if(this.lastSelectedCollection)
         {
            this.selectedCollection = this.lastSelectedCollection;
            this.lastSelectedCollection = null;
         }
         callLater(this.updateProductSelection);
      }
      
      protected function restoreCategories() : void
      {
         this.clearSearch();
         this.restoreCollection();
      }
      
      public function displayByProductId(param1:String) : void
      {
         var _loc2_:ProductCollection = null;
         this.clearSearch();
         if(param1 == SwapAssetPanel.BASE_COLOR_BG)
         {
            if(this.productProvider)
            {
               this.selectedProduct = this.productProvider.placeHolderProduct;
               _loc2_ = this.productProvider.getCategoryByProductId(this.selectedProduct.id);
               if(_loc2_)
               {
                  this.selectedCollection = _loc2_;
               }
            }
         }
         else
         {
            _loc2_ = this.productProvider.getCategoryByProductId(param1);
            if(_loc2_)
            {
               this.selectedCollection = _loc2_;
               if(this.allowSelection)
               {
                  this.selectedProduct = this.productProvider.getProductById(param1);
               }
            }
            else
            {
               this.selectFirstProperCategory();
               this.selectedProduct = null;
            }
         }
         if(this.selectedCollection)
         {
            callLater(this.updateProductSelection);
         }
      }
      
      public function clearSelection() : void
      {
         this.clearSearch();
         this.hideInvalidCategories();
         this._selectedCollection = null;
      }
      
      public function clearProductSelection() : void
      {
         if(this.productList)
         {
            this.productList.selectedIndex = -1;
         }
      }
      
      protected function validCategoryFilter(param1:Object) : Boolean
      {
         var _loc2_:ProductCollection = param1 as ProductCollection;
         var _loc3_:Boolean = _loc2_ && _loc2_ != this.searchCollection && (_loc2_.valid && (_loc2_.length > 0 || _loc2_.isLazyLoad));
         return _loc3_;
      }
      
      protected function searchCategoryFilter(param1:Object) : Boolean
      {
         return param1 && param1 == this.searchCollection;
      }
      
      public function searchProduct(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:TutorialManager = null;
         var _loc4_:Object = null;
         if(this.searchCollection)
         {
            this.lastSearchKeyword = StringUtil.trim(param1);
            if(this.lastSearchKeyword.length > 0)
            {
               this.isSearching = true;
               if(this.suggestionEnabled)
               {
                  this.searchCollection.searchBySuggestion(this.lastSearchKeyword,this.suggestionType,ThemeManager.instance.currentTheme.id);
                  switch(this.suggestionType)
                  {
                     case "prop":
                        _loc2_ = "props";
                        break;
                     case "bg":
                        _loc2_ = "backdrops";
                        break;
                     case "sound":
                        _loc2_ = "audio";
                        break;
                     default:
                        _loc2_ = this.suggestionType;
                  }
                  _loc3_ = TutorialManager.instance;
                  _loc4_ = {
                     "asset_type":_loc2_,
                     "search_term":param1,
                     "theme":(!!this._productProvider?this._productProvider.themeId:null),
                     "tutorial":(!!_loc3_.currentTutorial?"yes":"no"),
                     "action":(!!this.searchInput.searchFromList?"click_dropdown":"press_enter")
                  };
                  AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_SEARCH_ASSETS_TEMPLATES,_loc4_);
                  AnalyticsManager.instance.trackAssetSearchEvent(this.suggestionType,param1,this.searchInput.searchFromList);
               }
               else
               {
                  this.searchCollection.search(this.lastSearchKeyword);
               }
               if(this.promptDisplay)
               {
                  this.promptDisplay.text = this.getSearchEmptyPromptText(this.lastSearchKeyword);
               }
               this.searchInput.isSearching = true;
               this.selectSearchResult();
               dispatchEvent(new ProductExplorerEvent(ProductExplorerEvent.PRODUCT_SEARCH_START));
            }
         }
      }
      
      protected function searchInput_enterHandler(param1:FlexEvent) : void
      {
         this.searchProduct(this.searchInput.text);
      }
      
      protected function searchInput_cancelHandler(param1:Event) : void
      {
         this.restoreCategories();
      }
      
      protected function searchInput_keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            this.restoreCategories();
         }
      }
      
      protected function categoryList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:int = param1.newIndex;
         this.selectCategoryIndex(_loc2_);
      }
      
      public function get alwaysExpand() : Boolean
      {
         return this._alwaysExpand;
      }
      
      public function set alwaysExpand(param1:Boolean) : void
      {
         if(this._alwaysExpand != param1)
         {
            this._alwaysExpand = param1;
            if(param1)
            {
               this.unregisterCategoryListEvents();
               this.categoryExpanded = true;
               this.categoryListActive = true;
            }
            else
            {
               this.registerCategoryListEvents();
               this.categoryExpanded = false;
               this.categoryListActive = false;
            }
         }
      }
      
      protected function onCategoryRollOver(param1:MouseEvent) : void
      {
         if(this.categoryExpanded)
         {
            this.collapseTimer.reset();
         }
         else
         {
            this.expandTimer.reset();
            this.expandTimer.start();
         }
         this.registerCategoryListEvents();
      }
      
      protected function onCategoryRollOut(param1:MouseEvent) : void
      {
         if(this.categoryExpanded)
         {
            this.collapseTimer.reset();
            this.collapseTimer.start();
         }
         else
         {
            this.expandTimer.reset();
         }
      }
      
      protected function onExpandTimer(param1:TimerEvent) : void
      {
         this.categoryExpanded = true;
      }
      
      protected function onCollapseTimer(param1:TimerEvent) : void
      {
         if(!this.categoryListActive)
         {
            this.unregisterCategoryListEvents();
            this.categoryExpanded = false;
         }
      }
      
      protected function registerCategoryListEvents() : void
      {
         this.categoryList.scroller.verticalScrollBar.addEventListener(TrackBaseEvent.THUMB_PRESS,this.onCategoryListThumbPress);
         this.categoryList.scroller.verticalScrollBar.addEventListener(TrackBaseEvent.THUMB_RELEASE,this.onCategoryListThumbRelease);
         this.registeredCategoryListDragEvents = true;
      }
      
      protected function unregisterCategoryListEvents() : void
      {
         if(this.registeredCategoryListDragEvents)
         {
            this.categoryList.scroller.verticalScrollBar.removeEventListener(TrackBaseEvent.THUMB_PRESS,this.onCategoryListThumbPress);
            this.categoryList.scroller.verticalScrollBar.removeEventListener(TrackBaseEvent.THUMB_RELEASE,this.onCategoryListThumbRelease);
            this.registeredCategoryListDragEvents = false;
         }
      }
      
      protected function onCategoryListThumbPress(param1:TrackBaseEvent) : void
      {
         this.categoryListActive = true;
         this.collapseTimer.reset();
      }
      
      protected function onCategoryListThumbRelease(param1:TrackBaseEvent) : void
      {
         this.categoryListActive = false;
         this.collapseTimer.start();
      }
      
      protected function onProductListVerticalScroll(param1:Event) : void
      {
         if(this.productList && this.productList.layout.getVerticalScrollPositionDelta(NavigationUnit.END) == 0)
         {
            dispatchEvent(new InfiniteScrollEvent());
         }
      }
      
      protected function onProductSelected(param1:IndexChangeEvent) : void
      {
         var _loc4_:ProductExplorerEvent = null;
         var _loc2_:List = param1.target as List;
         var _loc3_:ThumbModel = _loc2_.selectedItem as ThumbModel;
         if(!_loc3_)
         {
            return;
         }
         if(_loc3_.isFolder)
         {
            this.selectedFolder = _loc3_;
         }
         else if(this.allowSelection)
         {
            this.selectedProduct = _loc3_;
            _loc4_ = new ProductExplorerEvent(ProductExplorerEvent.PRODUCT_SELECTED);
            _loc4_.collection = this.selectedCollection;
            _loc4_.product = this.selectedProduct;
            dispatchEvent(_loc4_);
         }
      }
      
      protected function updateProductSelection() : void
      {
         var _loc1_:int = 0;
         if(this.selectedCollection)
         {
            if(this.categoryList && this.productProvider)
            {
               _loc1_ = this.productProvider.getItemIndex(this.selectedCollection);
               this.categoryList.selectedItem = this.selectedCollection;
               this.categoryList.ensureIndexIsVisible(_loc1_);
            }
            if(this.productList)
            {
               if(this.selectedProduct)
               {
                  _loc1_ = this.selectedCollection.getItemIndex(this.selectedProduct);
                  this.productList.selectedIndex = _loc1_;
                  this.productList.ensureIndexIsVisible(_loc1_);
               }
               else
               {
                  this.productList.selectedIndex = -1;
               }
            }
            this._tutorialManager.notifyTutorialAction("search_point_complete");
         }
      }
      
      public function get suggestionEnabled() : Boolean
      {
         return this._suggestionEnabled;
      }
      
      public function set suggestionEnabled(param1:Boolean) : void
      {
         if(this._suggestionEnabled != param1)
         {
            this._suggestionEnabled = param1;
            if(this.searchInput)
            {
               this.searchInput.suggestionEnabled = param1;
            }
         }
      }
      
      public function get suggestionType() : String
      {
         return this._suggestionType;
      }
      
      public function set suggestionType(param1:String) : void
      {
         if(this._suggestionType != param1)
         {
            this._suggestionType = param1;
            if(this.searchInput)
            {
               this.searchInput.assetType = param1;
            }
         }
      }
      
      public function set suggestionThemeId(param1:String) : void
      {
         if(this._suggestionThemeId != param1)
         {
            this._suggestionThemeId = param1;
            if(this.searchInput is SearchSuggestionInput)
            {
               (this.searchInput as SearchSuggestionInput).themeId = this._suggestionThemeId;
            }
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         var _loc1_:String = SKIN_STATE_NORMAL;
         if(this.loading)
         {
            _loc1_ = SKIN_STATE_LOADING;
         }
         else if(this.selectedFolder)
         {
            _loc1_ = SKIN_STATE_FOLDER_OPENED;
         }
         else if(this.categoryExpanded)
         {
            _loc1_ = SKIN_STATE_CATEGORY_EXPANDED;
         }
         return _loc1_;
      }
      
      public function clearAllThumbState() : void
      {
         var _loc1_:int = 0;
         var _loc2_:ThumbRendererBase = null;
         if(this.productList && this.productList.dataProvider)
         {
            _loc1_ = 0;
            while(_loc1_ < this.productList.dataProvider.length)
            {
               _loc2_ = this.productList.dataGroup.getElementAt(_loc1_) as ThumbRendererBase;
               if(_loc2_)
               {
                  _loc2_.selected = false;
               }
               _loc1_++;
            }
         }
      }
      
      private function productList_rendererAddHandler(param1:RendererExistenceEvent) : void
      {
         if(param1.renderer is SoundThumbRenderer)
         {
            this._tutorialManager.notifyTutorialAction("sound_prepared");
         }
      }
      
      private function productList_scrollThumbPressEventHandler(param1:Event) : void
      {
         Console.getConsole().setIsScrollThumbDragging(true);
      }
      
      private function productList_scrollThumbReleaseEventHandler(param1:Event) : void
      {
         callLater(Console.getConsole().setIsScrollThumbDragging,[false]);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.categoryList)
         {
            this.categoryList.addEventListener(IndexChangeEvent.CHANGE,this.categoryList_changeHandler);
            this.categoryList.dataProvider = this.productProvider;
            this.categoryList.selectedItem = this.selectedCollection;
         }
         else if(param2 == this.categoryListGroup)
         {
            this.categoryListGroup.addEventListener(MouseEvent.ROLL_OVER,this.onCategoryRollOver);
            this.categoryListGroup.addEventListener(MouseEvent.ROLL_OUT,this.onCategoryRollOut);
         }
         else if(param2 == this.productList)
         {
            this.productList.addEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
            if(this._productListSkin)
            {
               this.productList.setStyle("skinClass",this._productListSkin);
            }
            this.productList.itemRenderer = this.productRenderer;
            if(this._productLayout)
            {
               this.productList.layout = this._productLayout;
            }
            this.productList.dataProvider = this.selectedCollection;
            this.productList.addEventListener(RendererExistenceEvent.RENDERER_ADD,this.productList_rendererAddHandler);
            if(this.productList.scroller && this.productList.scroller.verticalScrollBar)
            {
               this.productList.scroller.verticalScrollBar.addEventListener(Event.CHANGE,this.onProductListVerticalScroll);
               this.productList.scroller.verticalScrollBar.addEventListener(TrackBaseEvent.THUMB_RELEASE,this.productList_scrollThumbReleaseEventHandler);
               this.productList.scroller.verticalScrollBar.addEventListener(TrackBaseEvent.THUMB_PRESS,this.productList_scrollThumbPressEventHandler);
            }
         }
         else if(param2 == this.searchInput)
         {
            this.searchInput.suggestionEnabled = this._suggestionEnabled;
            this.searchInput.assetType = this._suggestionType;
            if(this.searchInput is SearchSuggestionInput)
            {
               (this.searchInput as SearchSuggestionInput).themeId = this._suggestionThemeId;
            }
            this.searchInput.addEventListener(FlexEvent.ENTER,this.searchInput_enterHandler);
            this.searchInput.addEventListener(KeyboardEvent.KEY_DOWN,this.searchInput_keyDownHandler);
            this.searchInput.addEventListener(Event.CANCEL,this.searchInput_cancelHandler);
         }
         else if(param2 == this.promptDisplay)
         {
            this.promptDisplay.text = this.emptyPrompt;
            this.promptDisplay.visible = this.shouldDisplayPrompt();
         }
         else if(param2 == this.searchInputGroup)
         {
            this.searchInputGroup.visible = this.searchInputGroup.includeInLayout = this._searchInputVisible;
         }
         else if(param2 == this.folderBackButton)
         {
            this.folderBackButton.addEventListener(MouseEvent.CLICK,this.folderBackButton_clickHandler);
         }
         else if(param2 == this.folderProductList)
         {
            this.folderProductList.itemRenderer = this.productRenderer;
            this.folderProductList.addEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.categoryList)
         {
            this.categoryList.removeEventListener(IndexChangeEvent.CHANGE,this.categoryList_changeHandler);
            this.unregisterCategoryListEvents();
         }
         else if(param2 == this.categoryListGroup)
         {
            this.categoryListGroup.removeEventListener(MouseEvent.ROLL_OVER,this.onCategoryRollOver);
            this.categoryListGroup.removeEventListener(MouseEvent.ROLL_OUT,this.onCategoryRollOut);
         }
         else if(param2 == this.productList)
         {
            this.productList.removeEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
            this.productList.removeEventListener(RendererExistenceEvent.RENDERER_ADD,this.productList_rendererAddHandler);
            if(this.productList.scroller && this.productList.scroller.verticalScrollBar)
            {
               this.productList.scroller.verticalScrollBar.removeEventListener(Event.CHANGE,this.onProductListVerticalScroll);
            }
         }
         else if(param2 == this.searchInput)
         {
            this.searchInput.removeEventListener(FlexEvent.ENTER,this.searchInput_enterHandler);
            this.searchInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.searchInput_keyDownHandler);
            this.searchInput.removeEventListener(Event.CANCEL,this.searchInput_cancelHandler);
         }
         else if(param2 == this.folderBackButton)
         {
            this.folderBackButton.removeEventListener(MouseEvent.CLICK,this.folderBackButton_clickHandler);
         }
         else if(param2 == this.folderProductList)
         {
            this.folderProductList.removeEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
         }
      }
      
      private function folderBackButton_clickHandler(param1:MouseEvent) : void
      {
         this.selectedFolder = null;
         if(this.productList)
         {
            this.productList.selectedItem = null;
         }
      }
      
      protected function get selectedFolder() : ThumbModel
      {
         return this._selectedFolder;
      }
      
      protected function set selectedFolder(param1:ThumbModel) : void
      {
         if(this._selectedFolder != param1)
         {
            this._selectedFolder = param1;
            this.updateFolderProductListingPage();
            invalidateSkinState();
         }
      }
      
      private function updateFolderProductListingPage() : void
      {
         if(!this._selectedFolder)
         {
            return;
         }
         var _loc1_:FolderThumb = this._selectedFolder.thumb as FolderThumb;
         if(!_loc1_)
         {
            return;
         }
         if(_loc1_.productCollection)
         {
            this.folderProductCollection = _loc1_.productCollection;
            this.updateFolderProductListingPageImpl(_loc1_);
         }
         else
         {
            this.loading = true;
            _loc1_.addEventListener(CoreEvent.USER_PROP_COMPLETE,this.selectedFolderThumb_userPropCompleteHandler);
            _loc1_.loadAssets();
         }
      }
      
      private function set folderProductCollection(param1:ProductCollection) : void
      {
         if(this._folderProductCollection != param1)
         {
            if(this._folderProductCollection)
            {
               this._folderProductCollection.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.folderProductCollection_collectionChangeHandler);
            }
            this._folderProductCollection = param1;
            if(this._folderProductCollection)
            {
               this._folderProductCollection.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.folderProductCollection_collectionChangeHandler);
            }
         }
      }
      
      private function folderProductCollection_collectionChangeHandler(param1:CollectionEvent) : void
      {
         if(this._folderProductCollection)
         {
            if(this.folderSubtitle)
            {
               this.folderSubtitle.text = StringUtil.substitute(UtilDict.translate(FOLDER_SUBTITLE),this._folderProductCollection.length);
            }
         }
      }
      
      private function updateFolderProductListingPageImpl(param1:FolderThumb) : void
      {
         if(this.folderTitle)
         {
            this.folderTitle.text = param1.name;
         }
         if(this.folderSubtitle)
         {
            this.folderSubtitle.text = StringUtil.substitute(UtilDict.translate(FOLDER_SUBTITLE),param1.productCollection.length);
         }
         if(this.folderProductList)
         {
            this.folderProductList.dataProvider = param1.productCollection;
         }
      }
      
      private function selectedFolderThumb_userPropCompleteHandler(param1:Event) : void
      {
         this.loading = false;
         var _loc2_:FolderThumb = param1.target as FolderThumb;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.removeEventListener(CoreEvent.USER_PROP_COMPLETE,this.selectedFolderThumb_userPropCompleteHandler);
         if(_loc2_.productCollection)
         {
            this.folderProductCollection = _loc2_.productCollection;
            this.updateFolderProductListingPageImpl(_loc2_);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryListWidth() : Number
      {
         return this._1120575382categoryListWidth;
      }
      
      public function set categoryListWidth(param1:Number) : void
      {
         var _loc2_:Object = this._1120575382categoryListWidth;
         if(_loc2_ !== param1)
         {
            this._1120575382categoryListWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryListWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get searchDelay() : int
      {
         return this._564613957searchDelay;
      }
      
      public function set searchDelay(param1:int) : void
      {
         var _loc2_:Object = this._564613957searchDelay;
         if(_loc2_ !== param1)
         {
            this._564613957searchDelay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchDelay",_loc2_,param1));
            }
         }
      }
      
      public function set loading(param1:Boolean) : void
      {
         var _loc2_:Object = this.loading;
         if(_loc2_ !== param1)
         {
            this._336650556loading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
            }
         }
      }
      
      public function set isSearching(param1:Boolean) : void
      {
         var _loc2_:Object = this.isSearching;
         if(_loc2_ !== param1)
         {
            this._1338330320isSearching = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isSearching",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowSelection() : Boolean
      {
         return this._1581674429allowSelection;
      }
      
      public function set allowSelection(param1:Boolean) : void
      {
         var _loc2_:Object = this._1581674429allowSelection;
         if(_loc2_ !== param1)
         {
            this._1581674429allowSelection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowSelection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get emptyPrompt() : String
      {
         return this._1095294225emptyPrompt;
      }
      
      public function set emptyPrompt(param1:String) : void
      {
         var _loc2_:Object = this._1095294225emptyPrompt;
         if(_loc2_ !== param1)
         {
            this._1095294225emptyPrompt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emptyPrompt",_loc2_,param1));
            }
         }
      }
      
      public function set searchCollection(param1:SearchCollection) : void
      {
         var _loc2_:Object = this.searchCollection;
         if(_loc2_ !== param1)
         {
            this._421330534searchCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchCollection",_loc2_,param1));
            }
         }
      }
      
      public function set selectedCollection(param1:ProductCollection) : void
      {
         var _loc2_:Object = this.selectedCollection;
         if(_loc2_ !== param1)
         {
            this._1799305113selectedCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedProduct() : ThumbModel
      {
         return this._874357292selectedProduct;
      }
      
      public function set selectedProduct(param1:ThumbModel) : void
      {
         var _loc2_:Object = this._874357292selectedProduct;
         if(_loc2_ !== param1)
         {
            this._874357292selectedProduct = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedProduct",_loc2_,param1));
            }
         }
      }
      
      public function set categoryExpanded(param1:Boolean) : void
      {
         var _loc2_:Object = this.categoryExpanded;
         if(_loc2_ !== param1)
         {
            this._827133993categoryExpanded = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryExpanded",_loc2_,param1));
            }
         }
      }
      
      public function set productProvider(param1:ProductGroupCollection) : void
      {
         var _loc2_:Object = this.productProvider;
         if(_loc2_ !== param1)
         {
            this._840706048productProvider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productProvider",_loc2_,param1));
            }
         }
      }
      
      public function set productLayout(param1:LayoutBase) : void
      {
         var _loc2_:Object = this.productLayout;
         if(_loc2_ !== param1)
         {
            this._825623801productLayout = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productLayout",_loc2_,param1));
            }
         }
      }
   }
}
