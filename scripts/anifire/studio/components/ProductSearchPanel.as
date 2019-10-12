package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.studio.managers.AnalyticsManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.studio.models.SearchGroupCollection;
   import anifire.studio.models.SuggestionSearchGroupCollection;
   import anifire.studio.skins.SearchTextInputSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import anifire.util.UtilString;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.utils.StringUtil;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.layouts.TileLayout;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class ProductSearchPanel extends spark.components.NavigatorContent implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ProductSearchPanel_Label1:Label;
      
      public var _ProductSearchPanel_ThemeSelectButton1:ThemeSelectButton;
      
      public var _ProductSearchPanel_VGroup1:VGroup;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _1610181791keywordInput:FocusTextInput;
      
      private var _1389660835loadingGroup:Group;
      
      private var _227539463searchExplorer:SearchExplorer;
      
      private var _18406468themePopUpGroup:Group;
      
      private var _1296669498themeSelectAnchor:PopUpAnchor;
      
      private var _645236390themeSelectGroup:Group;
      
      private var _637432609themeSelectPanel:VGroup;
      
      private var _94801579themeTileList:List;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _init:Boolean;
      
      protected var _1124276074_selectedThemeId:String = null;
      
      protected var _1123160699_themeSource:ArrayCollection;
      
      protected var _330102010_resultCollection:SearchGroupCollection;
      
      protected var _themeManager:ThemeManager;
      
      private var _1962106683_showThemeSelectButton:Boolean;
      
      private var _searchBySuggestion:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ProductSearchPanel()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ProductSearchPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ProductSearchPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProductSearchPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ProductSearchPanel_Array2_c);
         this.currentState = "loading";
         var _ProductSearchPanel_Group4_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductSearchPanel_Group4_i);
         states = [new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductSearchPanel_Group4_factory,
               "destination":null,
               "position":"after",
               "relativeTo":["_ProductSearchPanel_VGroup1"]
            })]
         }),new State({
            "name":"ready",
            "overrides":[]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ProductSearchPanel._watcherSetupUtil = param1;
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
      
      public function init() : void
      {
         var _loc1_:Array = null;
         if(!this._init)
         {
            this._init = true;
            this._searchBySuggestion = UtilSite.isGoAnimate || UtilSite.isG4S || UtilSite.isWix;
            if(this._searchBySuggestion)
            {
               this._resultCollection = new SuggestionSearchGroupCollection();
            }
            else
            {
               this._resultCollection = new SearchGroupCollection();
               this._showThemeSelectButton = true;
            }
            this._themeManager = ThemeManager.instance;
            this._themeManager.addEventListener(CoreEvent.LOAD_ALL_THEME_COMPLETE,this.onLoadAllThemeComplete);
            this._themeManager.loadAllThemes();
            _loc1_ = this._themeManager.themeList;
            this.themeTileList.dataProvider = new ArrayCollection(_loc1_);
            this._themeSource = new ArrayCollection(_loc1_);
            this.searchExplorer.displayNaturally();
            this.displayPrompt();
         }
      }
      
      private function onLoadAllThemeComplete(param1:CoreEvent) : void
      {
         currentState = "ready";
         this._themeManager.removeEventListener(CoreEvent.LOAD_ALL_THEME_COMPLETE,this.onLoadAllThemeComplete);
         this._resultCollection.loadAllProducts();
      }
      
      private function onSearchBtnClick() : void
      {
         this.search(this.keyword);
      }
      
      private function removePlural(param1:String) : String
      {
         return UtilString.trimBack(StringUtil.trim(param1),"s");
      }
      
      private function get keyword() : String
      {
         return !!this._searchBySuggestion?this.keywordInput.text:this.removePlural(this.keywordInput.text);
      }
      
      public function searchProduct(param1:String, param2:String = null) : void
      {
         this.keywordInput.text = param1;
         this._selectedThemeId = param2;
         this.search(param1);
      }
      
      private function search(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1 = StringUtil.trim(param1);
         if(param1 == "")
         {
            return;
         }
         AnalyticsManager.instance.trackEventByUserGroup("Search All",param1.toLowerCase());
         this.searchExplorer.emptyPrompt = null;
         this._resultCollection.search(param1,this._selectedThemeId);
         this.keywordInput.isSearching = true;
      }
      
      protected function onSearchCancel() : void
      {
         this.keywordInput.clear();
         this._resultCollection.clear();
         this.displayPrompt();
      }
      
      private function allThemeButton_clickHandler() : void
      {
         this._selectedThemeId = null;
         this.themeTileList.selectedItem = null;
         this.search(this.keyword);
      }
      
      protected function displayPrompt() : void
      {
         this.searchExplorer.emptyPrompt = UtilDict.translate("Enter your keywords and press enter.\nResults will be shown here.");
      }
      
      protected function themeTileList_changeHandler(param1:IndexChangeEvent) : void
      {
         this._selectedThemeId = this.themeTileList.selectedItem.id;
         this.search(this.keyword);
      }
      
      private function themeSelectButton_clickHandler() : void
      {
         this.themeSelectAnchor.displayPopUp = true;
      }
      
      protected function keywordInput_focusInHandler(param1:FocusEvent) : void
      {
         this.keywordInput.selectAll();
      }
      
      public function clearAllBackgroundThumbState() : void
      {
         if(this._searchBySuggestion)
         {
            this.searchExplorer.clearAllBackgroundThumbState();
         }
      }
      
      private function _ProductSearchPanel_Array2_c() : Array
      {
         var _loc1_:Array = [this._ProductSearchPanel_Rect1_c(),this._ProductSearchPanel_VGroup1_i()];
         return _loc1_;
      }
      
      private function _ProductSearchPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 5;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ProductSearchPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15659768;
         return _loc1_;
      }
      
      private function _ProductSearchPanel_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.paddingTop = 5;
         _loc1_.mxmlContent = [this._ProductSearchPanel_HGroup1_c(),this._ProductSearchPanel_SearchExplorer1_i()];
         _loc1_.id = "_ProductSearchPanel_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductSearchPanel_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductSearchPanel_VGroup1",this._ProductSearchPanel_VGroup1);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingBottom = 14;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingTop = 14;
         _loc1_.mxmlContent = [this._ProductSearchPanel_FocusTextInput1_i(),this._ProductSearchPanel_Group1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductSearchPanel_FocusTextInput1_i() : FocusTextInput
      {
         var _loc1_:FocusTextInput = new FocusTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.height = 36;
         _loc1_.setStyle("skinClass",SearchTextInputSkin);
         _loc1_.addEventListener("focusIn",this.__keywordInput_focusIn);
         _loc1_.addEventListener("enter",this.__keywordInput_enter);
         _loc1_.addEventListener("cancel",this.__keywordInput_cancel);
         _loc1_.id = "keywordInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.keywordInput = _loc1_;
         BindingManager.executeBindings(this,"keywordInput",this.keywordInput);
         return _loc1_;
      }
      
      public function __keywordInput_focusIn(param1:FocusEvent) : void
      {
         this.keywordInput_focusInHandler(param1);
      }
      
      public function __keywordInput_enter(param1:FlexEvent) : void
      {
         this.onSearchBtnClick();
      }
      
      public function __keywordInput_cancel(param1:Event) : void
      {
         this.onSearchCancel();
      }
      
      private function _ProductSearchPanel_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ProductSearchPanel_ThemeSelectButton1_i(),this._ProductSearchPanel_PopUpAnchor1_i()];
         _loc1_.id = "themeSelectGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeSelectGroup = _loc1_;
         BindingManager.executeBindings(this,"themeSelectGroup",this.themeSelectGroup);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_ThemeSelectButton1_i() : ThemeSelectButton
      {
         var _loc1_:ThemeSelectButton = new ThemeSelectButton();
         _loc1_.addEventListener("click",this.___ProductSearchPanel_ThemeSelectButton1_click);
         _loc1_.id = "_ProductSearchPanel_ThemeSelectButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductSearchPanel_ThemeSelectButton1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductSearchPanel_ThemeSelectButton1",this._ProductSearchPanel_ThemeSelectButton1);
         return _loc1_;
      }
      
      public function ___ProductSearchPanel_ThemeSelectButton1_click(param1:MouseEvent) : void
      {
         this.themeSelectButton_clickHandler();
      }
      
      private function _ProductSearchPanel_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "belowRight";
         _loc1_.popUp = this._ProductSearchPanel_Group2_i();
         _loc1_.id = "themeSelectAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeSelectAnchor = _loc1_;
         BindingManager.executeBindings(this,"themeSelectAnchor",this.themeSelectAnchor);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ProductSearchPanel_RectangularDropShadow1_i(),this._ProductSearchPanel_Rect2_i(),this._ProductSearchPanel_VGroup2_i()];
         _loc1_.id = "themePopUpGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themePopUpGroup = _loc1_;
         BindingManager.executeBindings(this,"themePopUpGroup",this.themePopUpGroup);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0.45;
         _loc1_.distance = 7;
         _loc1_.blRadius = 3;
         _loc1_.brRadius = 3;
         _loc1_.tlRadius = 3;
         _loc1_.trRadius = 3;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.stroke = this._ProductSearchPanel_SolidColorStroke1_i();
         _loc1_.fill = this._ProductSearchPanel_SolidColor2_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10526623;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 7;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingTop = 8;
         _loc1_.paddingBottom = 8;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ProductSearchPanel_List1_i(),this._ProductSearchPanel_Line1_c(),this._ProductSearchPanel_Group3_c()];
         _loc1_.id = "themeSelectPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeSelectPanel = _loc1_;
         BindingManager.executeBindings(this,"themeSelectPanel",this.themeSelectPanel);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.itemRenderer = this._ProductSearchPanel_ClassFactory1_c();
         _loc1_.layout = this._ProductSearchPanel_TileLayout1_c();
         _loc1_.setStyle("borderVisible",false);
         _loc1_.addEventListener("change",this.__themeTileList_change);
         _loc1_.id = "themeTileList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeTileList = _loc1_;
         BindingManager.executeBindings(this,"themeTileList",this.themeTileList);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ThemeItemRenderer;
         return _loc1_;
      }
      
      private function _ProductSearchPanel_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.horizontalGap = 2;
         _loc1_.verticalGap = 2;
         _loc1_.requestedColumnCount = 4;
         _loc1_.paddingLeft = 2;
         _loc1_.paddingRight = 2;
         _loc1_.paddingTop = 2;
         _loc1_.paddingBottom = 2;
         _loc1_.columnAlign = "justifyUsingGap";
         return _loc1_;
      }
      
      public function __themeTileList_change(param1:IndexChangeEvent) : void
      {
         this.themeTileList_changeHandler(param1);
      }
      
      private function _ProductSearchPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ProductSearchPanel_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14936045;
         return _loc1_;
      }
      
      private function _ProductSearchPanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 20;
         _loc1_.buttonMode = true;
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.mxmlContent = [this._ProductSearchPanel_Label1_i()];
         _loc1_.addEventListener("click",this.___ProductSearchPanel_Group3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductSearchPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.mouseEnabled = false;
         _loc1_.setStyle("color",4439205);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("paddingLeft",6);
         _loc1_.id = "_ProductSearchPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductSearchPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductSearchPanel_Label1",this._ProductSearchPanel_Label1);
         return _loc1_;
      }
      
      public function ___ProductSearchPanel_Group3_click(param1:MouseEvent) : void
      {
         this.allThemeButton_clickHandler();
      }
      
      private function _ProductSearchPanel_SearchExplorer1_i() : SearchExplorer
      {
         var _loc1_:SearchExplorer = new SearchExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "searchExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.searchExplorer = _loc1_;
         BindingManager.executeBindings(this,"searchExplorer",this.searchExplorer);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._ProductSearchPanel_Rect3_c(),this._ProductSearchPanel_BusyIndicator1_c()];
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ProductSearchPanel_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductSearchPanel_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _ProductSearchPanel_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductSearchPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Search props or templates");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"keywordInput.prompt");
         result[1] = new Binding(this,function():Boolean
         {
            return _showThemeSelectButton;
         },null,"themeSelectGroup.visible");
         result[2] = new Binding(this,function():Boolean
         {
            return _showThemeSelectButton;
         },null,"themeSelectGroup.includeInLayout");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = _selectedThemeId;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ProductSearchPanel_ThemeSelectButton1.themeId");
         result[4] = new Binding(this,function():IList
         {
            return _themeSource;
         },null,"themeTileList.dataProvider");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Search all themes");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ProductSearchPanel_Label1.text");
         result[6] = new Binding(this,function():ProductGroupCollection
         {
            return _resultCollection;
         },null,"searchExplorer.productProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderStroke() : SolidColorStroke
      {
         return this._1395787140borderStroke;
      }
      
      public function set borderStroke(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1395787140borderStroke;
         if(_loc2_ !== param1)
         {
            this._1395787140borderStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropShadow() : RectangularDropShadow
      {
         return this._906978543dropShadow;
      }
      
      public function set dropShadow(param1:RectangularDropShadow) : void
      {
         var _loc2_:Object = this._906978543dropShadow;
         if(_loc2_ !== param1)
         {
            this._906978543dropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
            }
         }
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
      public function get loadingGroup() : Group
      {
         return this._1389660835loadingGroup;
      }
      
      public function set loadingGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1389660835loadingGroup;
         if(_loc2_ !== param1)
         {
            this._1389660835loadingGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get searchExplorer() : SearchExplorer
      {
         return this._227539463searchExplorer;
      }
      
      public function set searchExplorer(param1:SearchExplorer) : void
      {
         var _loc2_:Object = this._227539463searchExplorer;
         if(_loc2_ !== param1)
         {
            this._227539463searchExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themePopUpGroup() : Group
      {
         return this._18406468themePopUpGroup;
      }
      
      public function set themePopUpGroup(param1:Group) : void
      {
         var _loc2_:Object = this._18406468themePopUpGroup;
         if(_loc2_ !== param1)
         {
            this._18406468themePopUpGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themePopUpGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeSelectAnchor() : PopUpAnchor
      {
         return this._1296669498themeSelectAnchor;
      }
      
      public function set themeSelectAnchor(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1296669498themeSelectAnchor;
         if(_loc2_ !== param1)
         {
            this._1296669498themeSelectAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeSelectAnchor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeSelectGroup() : Group
      {
         return this._645236390themeSelectGroup;
      }
      
      public function set themeSelectGroup(param1:Group) : void
      {
         var _loc2_:Object = this._645236390themeSelectGroup;
         if(_loc2_ !== param1)
         {
            this._645236390themeSelectGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeSelectGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeSelectPanel() : VGroup
      {
         return this._637432609themeSelectPanel;
      }
      
      public function set themeSelectPanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._637432609themeSelectPanel;
         if(_loc2_ !== param1)
         {
            this._637432609themeSelectPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeSelectPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeTileList() : List
      {
         return this._94801579themeTileList;
      }
      
      public function set themeTileList(param1:List) : void
      {
         var _loc2_:Object = this._94801579themeTileList;
         if(_loc2_ !== param1)
         {
            this._94801579themeTileList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeTileList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _selectedThemeId() : String
      {
         return this._1124276074_selectedThemeId;
      }
      
      protected function set _selectedThemeId(param1:String) : void
      {
         var _loc2_:Object = this._1124276074_selectedThemeId;
         if(_loc2_ !== param1)
         {
            this._1124276074_selectedThemeId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_selectedThemeId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeSource() : ArrayCollection
      {
         return this._1123160699_themeSource;
      }
      
      protected function set _themeSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1123160699_themeSource;
         if(_loc2_ !== param1)
         {
            this._1123160699_themeSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _resultCollection() : SearchGroupCollection
      {
         return this._330102010_resultCollection;
      }
      
      protected function set _resultCollection(param1:SearchGroupCollection) : void
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
      
      [Bindable(event="propertyChange")]
      private function get _showThemeSelectButton() : Boolean
      {
         return this._1962106683_showThemeSelectButton;
      }
      
      private function set _showThemeSelectButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1962106683_showThemeSelectButton;
         if(_loc2_ !== param1)
         {
            this._1962106683_showThemeSelectButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showThemeSelectButton",_loc2_,param1));
            }
         }
      }
   }
}
