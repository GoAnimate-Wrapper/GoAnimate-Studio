package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.event.CoreEvent;
   import anifire.studio.core.Thumb;
   import anifire.studio.events.InfiniteScrollEvent;
   import anifire.studio.managers.CommunityStuffManager;
   import anifire.studio.models.CommunitySearchGroupCollection;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.skins.SearchTextInputSkin;
   import anifire.util.UtilDict;
   import flash.events.FocusEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.StringUtil;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.layouts.VerticalLayout;
   
   use namespace mx_internal;
   
   public class CommunitySearchPanel extends spark.components.NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CommunitySearchPanel_Label1:Label;
      
      private var _1610181791keywordInput:FocusTextInput;
      
      private var _572090789resultList:SearchExplorer;
      
      private var _1479878848searchTypeList:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _searchType:String = "bg";
      
      protected var _1181599431_searchItems:ArrayCollection;
      
      protected var _1600092163_loading:Boolean = false;
      
      protected var _hasMore:Boolean = false;
      
      protected var _1668238191_displayResultCount:Boolean = false;
      
      protected var _936744704_resultCountText:String;
      
      protected var _330102010_resultCollection:CommunitySearchGroupCollection;
      
      protected var manager:CommunityStuffManager;
      
      protected var _lastKeyword:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CommunitySearchPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._330102010_resultCollection = new CommunitySearchGroupCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CommunitySearchPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CommunitySearchPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CommunitySearchPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.layout = this._CommunitySearchPanel_VerticalLayout1_c();
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CommunitySearchPanel_Array1_c);
         this.addEventListener("contentCreationComplete",this.___CommunitySearchPanel_NavigatorContent1_contentCreationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CommunitySearchPanel._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function init() : void
      {
         this.manager = CommunityStuffManager.instance;
         this.manager.addEventListener(CoreEvent.COMMUNITY_SEARCH_COMPLETE,this.onSearchComplete);
         this.manager.addEventListener(CoreEvent.COMMUNITY_SEARCH_DATA_READY,this.onSearchDataReady);
         this.resultList.hideInvalidCategories();
         this.initSearchTypeMenu();
      }
      
      private function onSearchBtnClick() : void
      {
         this.search(this.keywordInput.text);
      }
      
      public function searchByType(param1:String, param2:String) : void
      {
         this._searchType = param2;
         this.updateSearchButtonSelectedItem();
         this.search(param1);
      }
      
      private function search(param1:String) : void
      {
         this._displayResultCount = false;
         this._resultCollection.removeAllProducts();
         this._lastKeyword = StringUtil.trim(param1);
         if(this._lastKeyword == "")
         {
            return;
         }
         this._lastKeyword = param1;
         this.keywordInput.text = this._lastKeyword;
         this._hasMore = true;
         this._loading = true;
         CommunityStuffManager.instance.searchStuff(param1,this._searchType,true);
      }
      
      public function onSearchComplete(param1:CoreEvent) : void
      {
         this._displayResultCount = true;
         var _loc2_:int = int(param1.getData());
         this._resultCountText = StringUtil.substitute(UtilDict.toDisplay("go","{0} asset(s) found."),_loc2_);
      }
      
      private function onSearchDataReady(param1:CoreEvent) : void
      {
         var _loc4_:Thumb = null;
         var _loc5_:ThumbModel = null;
         var _loc6_:int = 0;
         this._resultCollection.keyword = this._lastKeyword;
         var _loc2_:int = 0;
         switch(this._searchType)
         {
            case AnimeConstants.ASSET_TYPE_PROP:
               _loc2_ = 0;
               break;
            case AnimeConstants.ASSET_TYPE_BG:
               _loc2_ = 1;
               break;
            default:
               return;
         }
         var _loc3_:int = this.manager.searchResults.length;
         this._hasMore = _loc3_ > 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = this.manager.searchResults.getItemAt(_loc6_) as Thumb;
            if(_loc4_.enable)
            {
               _loc5_ = new ThumbModel(_loc4_);
               this._resultCollection.addProduct(_loc5_);
            }
            _loc6_++;
         }
         this._resultCollection.showIndex(_loc2_);
         this.resultList.displayNaturally();
         this._loading = false;
      }
      
      protected function onKeywordInputFocus(param1:FocusEvent) : void
      {
         this.keywordInput.selectAll();
      }
      
      protected function onInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         if(!this._loading)
         {
            CommunityStuffManager.instance.searchStuff(this._lastKeyword);
            if(CommunityStuffManager.instance.isSearching)
            {
               this._loading = true;
            }
            else
            {
               this._hasMore = false;
            }
         }
      }
      
      private function initSearchTypeMenu() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Backgrounds"),AnimeConstants.ASSET_TYPE_BG));
         _loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Props"),AnimeConstants.ASSET_TYPE_PROP));
         this._searchItems = _loc1_;
         this.updateSearchButtonSelectedItem();
      }
      
      private function onSearchTypeChange(param1:IndexChangeEvent) : void
      {
         var _loc2_:MenuItemModel = this.searchTypeList.selectedItem as MenuItemModel;
         this._searchType = _loc2_.value as String;
      }
      
      private function updateSearchButtonSelectedItem() : void
      {
         var _loc1_:int = 0;
         var _loc2_:MenuItemModel = null;
         while(_loc1_ < this._searchItems.length)
         {
            _loc2_ = this._searchItems.getItemAt(_loc1_) as MenuItemModel;
            if(_loc2_.value == this._searchType)
            {
               this.searchTypeList.selectedItem = _loc2_;
               break;
            }
            _loc1_++;
         }
      }
      
      private function _CommunitySearchPanel_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _CommunitySearchPanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._CommunitySearchPanel_VGroup1_c(),this._CommunitySearchPanel_SearchExplorer1_i()];
         return _loc1_;
      }
      
      private function _CommunitySearchPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 7;
         _loc1_.paddingRight = 7;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._CommunitySearchPanel_HGroup1_c(),this._CommunitySearchPanel_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CommunitySearchPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._CommunitySearchPanel_FocusTextInput1_i(),this._CommunitySearchPanel_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CommunitySearchPanel_FocusTextInput1_i() : FocusTextInput
      {
         var _loc1_:FocusTextInput = new FocusTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.isSearching = false;
         _loc1_.setStyle("skinClass",SearchTextInputSkin);
         _loc1_.addEventListener("enter",this.__keywordInput_enter);
         _loc1_.id = "keywordInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.keywordInput = _loc1_;
         BindingManager.executeBindings(this,"keywordInput",this.keywordInput);
         return _loc1_;
      }
      
      public function __keywordInput_enter(param1:FlexEvent) : void
      {
         this.onSearchBtnClick();
      }
      
      private function _CommunitySearchPanel_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.width = 120;
         _loc1_.percentHeight = 100;
         _loc1_.requireSelection = true;
         _loc1_.addEventListener("change",this.__searchTypeList_change);
         _loc1_.id = "searchTypeList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.searchTypeList = _loc1_;
         BindingManager.executeBindings(this,"searchTypeList",this.searchTypeList);
         return _loc1_;
      }
      
      public function __searchTypeList_change(param1:IndexChangeEvent) : void
      {
         this.onSearchTypeChange(param1);
      }
      
      private function _CommunitySearchPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","right");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3355443);
         _loc1_.id = "_CommunitySearchPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CommunitySearchPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_CommunitySearchPanel_Label1",this._CommunitySearchPanel_Label1);
         return _loc1_;
      }
      
      private function _CommunitySearchPanel_SearchExplorer1_i() : SearchExplorer
      {
         var _loc1_:SearchExplorer = new SearchExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("infiniteScroll",this.__resultList_infiniteScroll);
         _loc1_.id = "resultList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.resultList = _loc1_;
         BindingManager.executeBindings(this,"resultList",this.resultList);
         return _loc1_;
      }
      
      public function __resultList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onInfiniteScroll(param1);
      }
      
      public function ___CommunitySearchPanel_NavigatorContent1_contentCreationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _CommunitySearchPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Search...");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"keywordInput.prompt");
         result[1] = new Binding(this,function():IList
         {
            return _searchItems;
         },null,"searchTypeList.dataProvider");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = _resultCountText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CommunitySearchPanel_Label1.text");
         result[3] = new Binding(this,function():Boolean
         {
            return _displayResultCount;
         },null,"_CommunitySearchPanel_Label1.visible");
         result[4] = new Binding(this,function():Boolean
         {
            return _displayResultCount;
         },null,"_CommunitySearchPanel_Label1.includeInLayout");
         result[5] = new Binding(this,function():ProductGroupCollection
         {
            return _resultCollection;
         },null,"resultList.productProvider");
         result[6] = new Binding(this,function():Boolean
         {
            return _loading;
         },null,"resultList.loading");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get keywordInput() : FocusTextInput
      {
         return this._1610181791keywordInput;
      }
      
      public function set keywordInput(param1:FocusTextInput) : void
      {
         var _loc2_:Object = this._1610181791keywordInput;
         if(_loc2_ !== param1)
         {
            this._1610181791keywordInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"keywordInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get resultList() : SearchExplorer
      {
         return this._572090789resultList;
      }
      
      public function set resultList(param1:SearchExplorer) : void
      {
         var _loc2_:Object = this._572090789resultList;
         if(_loc2_ !== param1)
         {
            this._572090789resultList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"resultList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get searchTypeList() : DropDownList
      {
         return this._1479878848searchTypeList;
      }
      
      public function set searchTypeList(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1479878848searchTypeList;
         if(_loc2_ !== param1)
         {
            this._1479878848searchTypeList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchTypeList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _searchItems() : ArrayCollection
      {
         return this._1181599431_searchItems;
      }
      
      protected function set _searchItems(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1181599431_searchItems;
         if(_loc2_ !== param1)
         {
            this._1181599431_searchItems = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_searchItems",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _loading() : Boolean
      {
         return this._1600092163_loading;
      }
      
      protected function set _loading(param1:Boolean) : void
      {
         var _loc2_:Object = this._1600092163_loading;
         if(_loc2_ !== param1)
         {
            this._1600092163_loading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loading",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _displayResultCount() : Boolean
      {
         return this._1668238191_displayResultCount;
      }
      
      protected function set _displayResultCount(param1:Boolean) : void
      {
         var _loc2_:Object = this._1668238191_displayResultCount;
         if(_loc2_ !== param1)
         {
            this._1668238191_displayResultCount = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayResultCount",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _resultCountText() : String
      {
         return this._936744704_resultCountText;
      }
      
      protected function set _resultCountText(param1:String) : void
      {
         var _loc2_:Object = this._936744704_resultCountText;
         if(_loc2_ !== param1)
         {
            this._936744704_resultCountText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_resultCountText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _resultCollection() : CommunitySearchGroupCollection
      {
         return this._330102010_resultCollection;
      }
      
      protected function set _resultCollection(param1:CommunitySearchGroupCollection) : void
      {
         var _loc2_:Object = this._330102010_resultCollection;
         if(_loc2_ !== param1)
         {
            this._330102010_resultCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_resultCollection",_loc2_,param1));
            }
         }
      }
   }
}
