package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.event.WidgetEvent;
   import anifire.studio.commands.SwapBackdropCommand;
   import anifire.studio.commands.SwapCharacterCommand;
   import anifire.studio.commands.SwapFlowFrameCommand;
   import anifire.studio.commands.SwapPropCommand;
   import anifire.studio.commands.SwapWidgetCommand;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.FlowFrameThumb;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.core.Widget;
   import anifire.studio.core.WidgetThumb;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.ProductExplorerEvent;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import anifire.studio.interfaces.IDivideExplorerProvider;
   import anifire.studio.managers.AnalyticsManager;
   import anifire.studio.managers.AssetManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.models.CharacterExplorerCollection;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.studio.models.SwapFlowFrameExplorerCollection;
   import anifire.studio.models.SwapWidgetExplorerCollection;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.models.WidgetProxy;
   import anifire.studio.skins.LinkArrowBlackButtonSkin;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SwapAssetPanel extends Group implements IBindingClient
   {
      
      public static const BASE_COLOR_BG:String = "baseColor";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1906413305backButton:LinkArrowButton;
      
      private var _426340021backdropExplorer:ProductExplorer;
      
      private var _1059602056characterExplorer:ProductExplorer;
      
      private var _809612678contentGroup:Group;
      
      private var _1680978494flowFrameExplorer:ProductExplorer;
      
      private var _1161933810headerGroup:Group;
      
      private var _74026253maskGroup:Group;
      
      private var _1287834292panelTitle:Label;
      
      private var _104484034propExplorer:ProductExplorer;
      
      private var _602107229widgetExplorer:DividedExplorer;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _asset:Asset;
      
      protected var _lastTheme:Theme;
      
      protected var _1698819536_backdropSource:ProductGroupCollection;
      
      protected var _355797251_propSource:ProductGroupCollection;
      
      protected var _626559899_flowFrameSource:SwapFlowFrameExplorerCollection;
      
      protected var _propSourceLookup:Object;
      
      protected var _876192357_characterSource:ProductGroupCollection;
      
      protected var _1000843938_widgetSource:SwapWidgetExplorerCollection;
      
      protected var _widgetSettingHolder:WidgetProxy;
      
      protected var _userCharacterSource:ProductGroupCollection;
      
      protected var _active:Boolean;
      
      private var _tutorialManager:TutorialManager;
      
      private var _themeManager:ThemeManager;
      
      private var _1972680222_suggestionEnabled:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SwapAssetPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._propSourceLookup = {};
         this._userCharacterSource = new ProductGroupCollection();
         this._tutorialManager = TutorialManager.instance;
         this._themeManager = ThemeManager.instance;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SwapAssetPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SwapAssetPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SwapAssetPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SwapAssetPanel_VGroup1_c()];
         this.addEventListener("creationComplete",this.___SwapAssetPanel_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SwapAssetPanel._watcherSetupUtil = param1;
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
      
      [Bindable(event="propertyChange")]
      public function get active() : Boolean
      {
         return this._active;
      }
      
      private function set _1422950650active(param1:Boolean) : void
      {
         if(this._active != param1)
         {
            this._active = param1;
            if(this._active)
            {
               this.updateSource();
            }
            else
            {
               if(this._characterSource is CharacterExplorerCollection)
               {
                  CharacterExplorerCollection(this._characterSource).hidePlaceHolder = false;
                  this.characterExplorer.hideInvalidCategories();
               }
               this._backdropSource = null;
               this._characterSource = null;
               this._propSource = null;
               this._widgetSource = null;
               this._flowFrameSource = null;
               this._lastTheme = null;
            }
         }
      }
      
      protected function updateUI() : void
      {
         this.propExplorer.visible = false;
         this.characterExplorer.visible = false;
         this.widgetExplorer.visible = false;
         this.flowFrameExplorer.visible = false;
         this.backdropExplorer.visible = false;
         this.panelTitle.visible = false;
         if(this._asset is Widget)
         {
            this.widgetExplorer.visible = true;
         }
         else if(this._asset is FlowFrame)
         {
            this.flowFrameExplorer.visible = true;
         }
         else if(this._asset is Prop)
         {
            this.propExplorer.visible = true;
         }
         else if(this._asset is Character)
         {
            this.characterExplorer.visible = true;
         }
         else
         {
            this.backdropExplorer.visible = true;
            this.panelTitle.visible = true;
         }
      }
      
      public function updateSource() : void
      {
         if(this._asset is Widget)
         {
            this.updateWidgetSource();
         }
         else if(this._asset is FlowFrame)
         {
            this.updateFlowFrameSource();
         }
         else if(this._asset is Prop)
         {
            this.updatePropSource();
         }
         else if(this._asset is Character)
         {
            this.updateCharacterSource();
         }
         else
         {
            this.updateBackdropSource();
         }
      }
      
      protected function updateWidgetSource() : void
      {
         var _loc1_:Theme = this._asset.thumb.theme;
         if(_loc1_ != this._lastTheme)
         {
            this._widgetSource = AssetManager.instance.getWidgetCollection(_loc1_);
         }
         var _loc2_:Widget = this._asset as Widget;
         this._widgetSettingHolder = new WidgetProxy();
         this._widgetSettingHolder.storeWidgetSetting(_loc2_);
         if(this._widgetSource)
         {
            this._widgetSource.targetCategory = this._widgetSettingHolder.dataType;
         }
         this._lastTheme = _loc1_;
      }
      
      protected function updateFlowFrameSource() : void
      {
         var _loc1_:Theme = this._asset.thumb.theme;
         if(_loc1_ != this._lastTheme)
         {
            this._flowFrameSource = AssetManager.instance.getFlowFrameCollection(_loc1_);
         }
         this._lastTheme = _loc1_;
         this.flowFrameExplorer.displayNaturally();
      }
      
      protected function updateBackdropSource() : void
      {
         var _loc3_:UserAssetManager = null;
         var _loc1_:Theme = ThemeManager.instance.currentTheme;
         var _loc2_:String = BASE_COLOR_BG;
         this._suggestionEnabled = this._themeManager.supportSearchSuggestion(_loc1_.id);
         if(_loc1_.id == "ugc" && !_loc1_.ccThemeId)
         {
            _loc3_ = UserAssetManager.instance;
            this._backdropSource = _loc3_.backgroundSource;
            if(!_loc3_.userBackgroundReady)
            {
               _loc3_.addEventListener(CoreEvent.USER_BACKGROUND_COMPLETE,this.onUserBackdropLoaded);
               this.backdropExplorer.loading = true;
               _loc3_.loadBackground();
            }
            else
            {
               this.backdropExplorer.selectProperCategoryIfNoSelection();
            }
         }
         else if(_loc1_ != this._lastTheme)
         {
            if(this._asset)
            {
               _loc2_ = this._asset.thumb.id;
            }
            this._backdropSource = AssetManager.instance.getBackdropCollection(_loc1_);
         }
         this._lastTheme = _loc1_;
         this.backdropExplorer.displayNaturally();
         this.backdropExplorer.displayByProductId(_loc2_);
      }
      
      protected function updatePropSource() : void
      {
         var _loc2_:UserAssetManager = null;
         var _loc1_:Theme = this._asset.thumb.theme;
         if(!_loc1_)
         {
            return;
         }
         this._suggestionEnabled = this._themeManager.supportSearchSuggestion(_loc1_.id);
         if(_loc1_.id == "ugc" && !_loc1_.ccThemeId)
         {
            _loc2_ = UserAssetManager.instance;
            this._propSource = _loc2_.propSource;
            if(!_loc2_.userPropReady)
            {
               _loc2_.addEventListener(CoreEvent.USER_PROP_COMPLETE,this.onUserPropLoaded);
               this.propExplorer.loading = true;
               _loc2_.loadProp();
            }
            else
            {
               this.propExplorer.selectProperCategoryIfNoSelection();
            }
         }
         else if(_loc1_ != this._lastTheme)
         {
            this._propSource = AssetManager.instance.getPropCollection(_loc1_);
         }
         this._lastTheme = _loc1_;
         this.propExplorer.displayNaturally();
      }
      
      protected function updateCharacterSource() : void
      {
         var _loc3_:CharacterExplorerCollection = null;
         var _loc1_:CharThumb = this._asset.thumb as CharThumb;
         var _loc2_:String = _loc1_.themeOrCCThemeId;
         if(_loc2_ == "family")
         {
            _loc2_ = "custom";
         }
         else if(_loc2_ == "cc2")
         {
            _loc2_ = "action";
         }
         if(_loc2_ == "ugc")
         {
            this._characterSource = this._userCharacterSource;
         }
         else
         {
            _loc3_ = Console.getConsole().thumbTray.getThemeCharacterCollection(_loc2_);
            _loc3_.hidePlaceHolder = true;
            this._characterSource = _loc3_;
            if(_loc3_ && _loc2_ && _loc3_.nextUserCharacterPage == 0)
            {
               _loc3_.addEventListener(ProductGroupCollectionEvent.THEME_CHAR_COMPLETE,this.onCharacterPageLoaded);
               this.characterExplorer.loading = true;
               _loc3_.loadNextPage();
               return;
            }
         }
         this.characterExplorer.hideInvalidCategories();
         this.characterExplorer.displayNaturally();
         this._suggestionEnabled = this._themeManager.supportSearchSuggestion(_loc2_);
      }
      
      public function set asset(param1:Asset) : void
      {
         if(this._asset)
         {
            this._asset.removeEventListener(AssetEvent.CHARACTER_SWAP_START,this.onSwapStart);
            this._asset.removeEventListener(WidgetEvent.WIDGET_SWAP_START,this.onSwapStart);
            this._asset.removeEventListener(AssetEvent.CHARACTER_SWAP_COMPLETE,this.onSwapComplete);
            this._asset.removeEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.onSwapComplete);
         }
         this._asset = param1;
         if(this._asset)
         {
            this._asset.addEventListener(AssetEvent.CHARACTER_SWAP_START,this.onSwapStart);
            this._asset.addEventListener(WidgetEvent.WIDGET_SWAP_START,this.onSwapStart);
            this._asset.addEventListener(AssetEvent.CHARACTER_SWAP_COMPLETE,this.onSwapComplete);
            this._asset.addEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.onSwapComplete);
         }
         this.updateUI();
         if(this._active)
         {
            this.updateSource();
         }
      }
      
      public function get asset() : Asset
      {
         return this._asset;
      }
      
      protected function onBackButtonClick() : void
      {
         this.maskGroup.visible = false;
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      protected function backdropExplorer_productSelectedHandler(param1:ProductExplorerEvent) : void
      {
         var _loc4_:SwapBackdropCommand = null;
         var _loc2_:Background = this._asset as Background;
         var _loc3_:ThumbModel = this.backdropExplorer.selectedProduct as ThumbModel;
         if(_loc3_)
         {
            _loc4_ = new SwapBackdropCommand(_loc2_,!!_loc3_.thumb?BackgroundThumb(_loc3_.thumb):null);
            _loc4_.execute();
            this._asset = Console.getConsole().currentScene.background;
         }
         else
         {
            this._asset = null;
         }
         this.backdropExplorer.selectedProduct = null;
      }
      
      protected function propExplorer_productSelectedHandler(param1:ProductExplorerEvent) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc4_:SwapPropCommand = null;
         var _loc2_:Prop = this._asset as Prop;
         if(_loc2_)
         {
            _loc3_ = this.propExplorer.selectedProduct as ThumbModel;
            if(_loc3_ && _loc3_.thumb is PropThumb)
            {
               _loc4_ = new SwapPropCommand(_loc2_,PropThumb(_loc3_.thumb));
               _loc4_.execute();
            }
            this.propExplorer.selectedProduct = null;
         }
      }
      
      protected function characterExplorer_productSelectedHandler(param1:ProductExplorerEvent) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc4_:SwapCharacterCommand = null;
         var _loc2_:Character = this._asset as Character;
         if(_loc2_)
         {
            _loc3_ = this.characterExplorer.selectedProduct as ThumbModel;
            if(_loc3_ && _loc3_.thumb is CharThumb)
            {
               _loc4_ = new SwapCharacterCommand(_loc2_,CharThumb(_loc3_.thumb));
               _loc4_.execute();
               this._tutorialManager.notifyTutorialAction("swap-char-complete");
            }
            this.characterExplorer.selectedProduct = null;
         }
      }
      
      protected function widgetExplorer_productSelectedHandler(param1:ProductExplorerEvent) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc4_:SwapWidgetCommand = null;
         var _loc2_:Widget = this._asset as Widget;
         if(_loc2_)
         {
            _loc3_ = param1.product as ThumbModel;
            if(_loc3_ && _loc3_.thumb is WidgetThumb)
            {
               _loc4_ = new SwapWidgetCommand(_loc2_,_loc3_.thumb as WidgetThumb,this._widgetSettingHolder);
               _loc4_.execute();
            }
            this.widgetExplorer.selectedProduct = null;
         }
      }
      
      protected function flowFrameExplorer_productSelectedHandler(param1:ProductExplorerEvent) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc4_:FlowFrameThumb = null;
         var _loc5_:SwapFlowFrameCommand = null;
         var _loc2_:FlowFrame = this._asset as FlowFrame;
         if(_loc2_)
         {
            _loc3_ = param1.product as ThumbModel;
            _loc4_ = _loc3_.thumb as FlowFrameThumb;
            if(_loc4_)
            {
               _loc5_ = new SwapFlowFrameCommand(_loc2_,_loc4_);
               _loc5_.execute();
            }
            this.flowFrameExplorer.selectedProduct = null;
         }
      }
      
      protected function onUserBackdropLoaded(param1:CoreEvent) : void
      {
         this.backdropExplorer.selectProperCategoryIfNoSelection();
         this.backdropExplorer.loading = false;
      }
      
      protected function onUserPropLoaded(param1:CoreEvent) : void
      {
         this.propExplorer.selectProperCategoryIfNoSelection();
         this.propExplorer.loading = false;
      }
      
      protected function onCharacterPageLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.currentTarget).removeEventListener(ProductGroupCollectionEvent.THEME_CHAR_COMPLETE,this.onCharacterPageLoaded);
         this.characterExplorer.hideInvalidCategories();
         this.characterExplorer.displayNaturally();
         this.characterExplorer.loading = false;
      }
      
      protected function onSwapStart(param1:Event) : void
      {
         this.maskGroup.visible = true;
      }
      
      protected function onSwapComplete(param1:Event) : void
      {
         this.maskGroup.visible = false;
         if(this._asset is Widget)
         {
            this.updateWidgetSource();
         }
      }
      
      protected function maskGroup_clickHandler(param1:MouseEvent) : void
      {
      }
      
      protected function swapAssetPanel_creationCompleteHandler(param1:FlexEvent) : void
      {
         this._tutorialManager.registerComponent("swap-char-selection",this.characterExplorer);
      }
      
      protected function propExplorer_productSearchStartHandler(param1:ProductExplorerEvent) : void
      {
         var _loc2_:String = this.propExplorer.lastSearchKeyword;
         if(_loc2_)
         {
            AnalyticsManager.instance.trackEventByUserGroup(AnalyticsManager.EVENT_ACTION_SEARCH_PROP,_loc2_.toLowerCase());
         }
      }
      
      private function _SwapAssetPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._SwapAssetPanel_Group2_i(),this._SwapAssetPanel_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SwapAssetPanel_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._SwapAssetPanel_Rect1_c(),this._SwapAssetPanel_HGroup1_c()];
         _loc1_.id = "headerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headerGroup = _loc1_;
         BindingManager.executeBindings(this,"headerGroup",this.headerGroup);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SwapAssetPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _SwapAssetPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._SwapAssetPanel_HGroup2_c(),this._SwapAssetPanel_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SwapAssetPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.width = 102;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._SwapAssetPanel_LinkArrowButton1_i(),this._SwapAssetPanel_Line1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SwapAssetPanel_LinkArrowButton1_i() : LinkArrowButton
      {
         var _loc1_:LinkArrowButton = new LinkArrowButton();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",LinkArrowBlackButtonSkin);
         _loc1_.setStyle("arrowPosition","left");
         _loc1_.setStyle("arrowDirection","left");
         _loc1_.addEventListener("click",this.__backButton_click);
         _loc1_.id = "backButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backButton = _loc1_;
         BindingManager.executeBindings(this,"backButton",this.backButton);
         return _loc1_;
      }
      
      public function __backButton_click(param1:MouseEvent) : void
      {
         this.onBackButtonClick();
      }
      
      private function _SwapAssetPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.height = 16;
         _loc1_.stroke = this._SwapAssetPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13750737;
         return _loc1_;
      }
      
      private function _SwapAssetPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "panelTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panelTitle = _loc1_;
         BindingManager.executeBindings(this,"panelTitle",this.panelTitle);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SwapAssetPanel_ProductExplorer1_i(),this._SwapAssetPanel_ProductExplorer2_i(),this._SwapAssetPanel_ProductExplorer3_i(),this._SwapAssetPanel_DividedExplorer1_i(),this._SwapAssetPanel_ProductExplorer4_i(),this._SwapAssetPanel_Group4_i()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_ProductExplorer1_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._SwapAssetPanel_ClassFactory1_c();
         _loc1_.suggestionType = "bg";
         _loc1_.addEventListener("productSelected",this.__backdropExplorer_productSelected);
         _loc1_.id = "backdropExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backdropExplorer = _loc1_;
         BindingManager.executeBindings(this,"backdropExplorer",this.backdropExplorer);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SwapBackdropRenderer;
         return _loc1_;
      }
      
      public function __backdropExplorer_productSelected(param1:ProductExplorerEvent) : void
      {
         this.backdropExplorer_productSelectedHandler(param1);
      }
      
      private function _SwapAssetPanel_ProductExplorer2_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._SwapAssetPanel_ClassFactory2_c();
         _loc1_.suggestionType = "prop";
         _loc1_.addEventListener("productSearchStart",this.__propExplorer_productSearchStart);
         _loc1_.addEventListener("productSelected",this.__propExplorer_productSelected);
         _loc1_.id = "propExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.propExplorer = _loc1_;
         BindingManager.executeBindings(this,"propExplorer",this.propExplorer);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SwapPropRenderer;
         return _loc1_;
      }
      
      public function __propExplorer_productSearchStart(param1:ProductExplorerEvent) : void
      {
         this.propExplorer_productSearchStartHandler(param1);
      }
      
      public function __propExplorer_productSelected(param1:ProductExplorerEvent) : void
      {
         this.propExplorer_productSelectedHandler(param1);
      }
      
      private function _SwapAssetPanel_ProductExplorer3_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._SwapAssetPanel_ClassFactory3_c();
         _loc1_.addEventListener("productSelected",this.__flowFrameExplorer_productSelected);
         _loc1_.id = "flowFrameExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.flowFrameExplorer = _loc1_;
         BindingManager.executeBindings(this,"flowFrameExplorer",this.flowFrameExplorer);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_ClassFactory3_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SwapPropRenderer;
         return _loc1_;
      }
      
      public function __flowFrameExplorer_productSelected(param1:ProductExplorerEvent) : void
      {
         this.flowFrameExplorer_productSelectedHandler(param1);
      }
      
      private function _SwapAssetPanel_DividedExplorer1_i() : DividedExplorer
      {
         var _loc1_:DividedExplorer = new DividedExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._SwapAssetPanel_ClassFactory4_c();
         _loc1_.addEventListener("productSelected",this.__widgetExplorer_productSelected);
         _loc1_.id = "widgetExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.widgetExplorer = _loc1_;
         BindingManager.executeBindings(this,"widgetExplorer",this.widgetExplorer);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_ClassFactory4_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SwapWidgetRenderer;
         return _loc1_;
      }
      
      public function __widgetExplorer_productSelected(param1:ProductExplorerEvent) : void
      {
         this.widgetExplorer_productSelectedHandler(param1);
      }
      
      private function _SwapAssetPanel_ProductExplorer4_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 96;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._SwapAssetPanel_ClassFactory5_c();
         _loc1_.suggestionType = "char";
         _loc1_.addEventListener("productSelected",this.__characterExplorer_productSelected);
         _loc1_.id = "characterExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.characterExplorer = _loc1_;
         BindingManager.executeBindings(this,"characterExplorer",this.characterExplorer);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_ClassFactory5_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SwapCharacterRenderer;
         return _loc1_;
      }
      
      public function __characterExplorer_productSelected(param1:ProductExplorerEvent) : void
      {
         this.characterExplorer_productSelectedHandler(param1);
      }
      
      private function _SwapAssetPanel_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.mxmlContent = [this._SwapAssetPanel_Rect2_c(),this._SwapAssetPanel_BusyIndicator1_c()];
         _loc1_.addEventListener("click",this.__maskGroup_click);
         _loc1_.id = "maskGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.maskGroup = _loc1_;
         BindingManager.executeBindings(this,"maskGroup",this.maskGroup);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SwapAssetPanel_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SwapAssetPanel_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _SwapAssetPanel_BusyIndicator1_c() : BusyIndicator
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
      
      public function __maskGroup_click(param1:MouseEvent) : void
      {
         this.maskGroup_clickHandler(param1);
      }
      
      public function ___SwapAssetPanel_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.swapAssetPanel_creationCompleteHandler(param1);
      }
      
      private function _SwapAssetPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Back");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"backButton.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Swap Backdrop");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panelTitle.text");
         result[2] = new Binding(this,function():ProductGroupCollection
         {
            return _backdropSource;
         },null,"backdropExplorer.productProvider");
         result[3] = new Binding(this,function():Boolean
         {
            return _suggestionEnabled;
         },null,"backdropExplorer.suggestionEnabled");
         result[4] = new Binding(this,function():ProductGroupCollection
         {
            return _propSource;
         },null,"propExplorer.productProvider");
         result[5] = new Binding(this,function():Boolean
         {
            return _suggestionEnabled;
         },null,"propExplorer.suggestionEnabled");
         result[6] = new Binding(this,function():ProductGroupCollection
         {
            return _flowFrameSource;
         },null,"flowFrameExplorer.productProvider");
         result[7] = new Binding(this,function():IDivideExplorerProvider
         {
            return _widgetSource;
         },null,"widgetExplorer.productProvider");
         result[8] = new Binding(this,function():ProductGroupCollection
         {
            return _characterSource;
         },null,"characterExplorer.productProvider");
         result[9] = new Binding(this,function():Boolean
         {
            return _suggestionEnabled;
         },null,"characterExplorer.suggestionEnabled");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get backButton() : LinkArrowButton
      {
         return this._1906413305backButton;
      }
      
      public function set backButton(param1:LinkArrowButton) : void
      {
         var _loc2_:Object = this._1906413305backButton;
         if(_loc2_ !== param1)
         {
            this._1906413305backButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backdropExplorer() : ProductExplorer
      {
         return this._426340021backdropExplorer;
      }
      
      public function set backdropExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._426340021backdropExplorer;
         if(_loc2_ !== param1)
         {
            this._426340021backdropExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backdropExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get characterExplorer() : ProductExplorer
      {
         return this._1059602056characterExplorer;
      }
      
      public function set characterExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1059602056characterExplorer;
         if(_loc2_ !== param1)
         {
            this._1059602056characterExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"characterExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : Group
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get flowFrameExplorer() : ProductExplorer
      {
         return this._1680978494flowFrameExplorer;
      }
      
      public function set flowFrameExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1680978494flowFrameExplorer;
         if(_loc2_ !== param1)
         {
            this._1680978494flowFrameExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flowFrameExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerGroup() : Group
      {
         return this._1161933810headerGroup;
      }
      
      public function set headerGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1161933810headerGroup;
         if(_loc2_ !== param1)
         {
            this._1161933810headerGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maskGroup() : Group
      {
         return this._74026253maskGroup;
      }
      
      public function set maskGroup(param1:Group) : void
      {
         var _loc2_:Object = this._74026253maskGroup;
         if(_loc2_ !== param1)
         {
            this._74026253maskGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panelTitle() : Label
      {
         return this._1287834292panelTitle;
      }
      
      public function set panelTitle(param1:Label) : void
      {
         var _loc2_:Object = this._1287834292panelTitle;
         if(_loc2_ !== param1)
         {
            this._1287834292panelTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panelTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get propExplorer() : ProductExplorer
      {
         return this._104484034propExplorer;
      }
      
      public function set propExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._104484034propExplorer;
         if(_loc2_ !== param1)
         {
            this._104484034propExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"propExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get widgetExplorer() : DividedExplorer
      {
         return this._602107229widgetExplorer;
      }
      
      public function set widgetExplorer(param1:DividedExplorer) : void
      {
         var _loc2_:Object = this._602107229widgetExplorer;
         if(_loc2_ !== param1)
         {
            this._602107229widgetExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widgetExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _backdropSource() : ProductGroupCollection
      {
         return this._1698819536_backdropSource;
      }
      
      protected function set _backdropSource(param1:ProductGroupCollection) : void
      {
         var _loc2_:Object = this._1698819536_backdropSource;
         if(_loc2_ !== param1)
         {
            this._1698819536_backdropSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_backdropSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _propSource() : ProductGroupCollection
      {
         return this._355797251_propSource;
      }
      
      protected function set _propSource(param1:ProductGroupCollection) : void
      {
         var _loc2_:Object = this._355797251_propSource;
         if(_loc2_ !== param1)
         {
            this._355797251_propSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_propSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _flowFrameSource() : SwapFlowFrameExplorerCollection
      {
         return this._626559899_flowFrameSource;
      }
      
      protected function set _flowFrameSource(param1:SwapFlowFrameExplorerCollection) : void
      {
         var _loc2_:Object = this._626559899_flowFrameSource;
         if(_loc2_ !== param1)
         {
            this._626559899_flowFrameSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_flowFrameSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _characterSource() : ProductGroupCollection
      {
         return this._876192357_characterSource;
      }
      
      protected function set _characterSource(param1:ProductGroupCollection) : void
      {
         var _loc2_:Object = this._876192357_characterSource;
         if(_loc2_ !== param1)
         {
            this._876192357_characterSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_characterSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _widgetSource() : SwapWidgetExplorerCollection
      {
         return this._1000843938_widgetSource;
      }
      
      protected function set _widgetSource(param1:SwapWidgetExplorerCollection) : void
      {
         var _loc2_:Object = this._1000843938_widgetSource;
         if(_loc2_ !== param1)
         {
            this._1000843938_widgetSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_widgetSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _suggestionEnabled() : Boolean
      {
         return this._1972680222_suggestionEnabled;
      }
      
      private function set _suggestionEnabled(param1:Boolean) : void
      {
         var _loc2_:Object = this._1972680222_suggestionEnabled;
         if(_loc2_ !== param1)
         {
            this._1972680222_suggestionEnabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_suggestionEnabled",_loc2_,param1));
            }
         }
      }
      
      public function set active(param1:Boolean) : void
      {
         var _loc2_:Object = this.active;
         if(_loc2_ !== param1)
         {
            this._1422950650active = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"active",_loc2_,param1));
            }
         }
      }
   }
}
