package anifire.studio.components
{
   import anifire.constant.ThemeConstants;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.UserChangeActionCommand;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.ProductExplorerEvent;
   import anifire.studio.events.TutorialEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IEye;
   import anifire.studio.managers.AnalyticsManager;
   import anifire.studio.managers.ImageDataManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.models.ActionExplorerCollection;
   import anifire.studio.models.ActionThumbModel;
   import anifire.studio.models.tutorial.BasicTutorial;
   import anifire.studio.models.tutorial.SceneTemplateTutorial;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ActionPanel extends spark.components.NavigatorContent implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1843223403actionExplorer:ProductExplorer;
      
      private var _1569328494actionPanel:VGroup;
      
      private var _2070242892expressionPanel:CharacterExpressionPanel;
      
      private var _2119202638handPropPanel:CharacterPropPanel;
      
      private var _1202839150headGearPropPanel:CharacterPropPanel;
      
      private var _282659425headPropPanel:CharacterPropPanel;
      
      private var _1389660835loadingGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _tutorialManager:TutorialManager;
      
      private var _themeManager:ThemeManager;
      
      private var _character:Character;
      
      private var _view:IAssetView;
      
      private var actionCollection:ActionExplorerCollection;
      
      private var tutorialSearchKeyword:String = "";
      
      private var _1972680222_suggestionEnabled:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ActionPanel()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._tutorialManager = TutorialManager.instance;
         this._themeManager = ThemeManager.instance;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ActionPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ActionPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ActionPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ActionPanel_Array2_c);
         this.currentState = "loading";
         this.addEventListener("creationComplete",this.___ActionPanel_NavigatorContent1_creationComplete);
         var _ActionPanel_Group1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ActionPanel_Group1_i);
         states = [new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ActionPanel_Group1_factory,
               "destination":null,
               "position":"after",
               "relativeTo":["actionPanel"]
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
         ActionPanel._watcherSetupUtil = param1;
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
      
      public function get target() : Object
      {
         return this._view;
      }
      
      public function set target(param1:Object) : void
      {
         this._view = param1 as IAssetView;
         if(this._view && this._view.asset)
         {
            if(this._character)
            {
               this._character.removeEventListener(AssetEvent.ACTION_CHANGE,this.character_actionChangeHandler);
               this._character.removeEventListener(AssetEvent.CHARACTER_SWAP_COMPLETE,this.character_characterSwapCompleteHandler);
            }
            this._character = this._view.asset as Character;
            if(this._character)
            {
               createDeferredContent();
               this._character.addEventListener(AssetEvent.ACTION_CHANGE,this.character_actionChangeHandler);
               this._character.addEventListener(AssetEvent.CHARACTER_SWAP_COMPLETE,this.character_characterSwapCompleteHandler);
               this.setUpActionPanel();
            }
         }
         else if(this.actionExplorer)
         {
            this.actionExplorer.clearSelection();
            this.actionExplorer.suggestionEnabled = false;
         }
      }
      
      private function removeHandProp() : void
      {
         this._character.removeHandHeld();
         this.handPropPanel.visible = false;
         this.handPropPanel.includeInLayout = false;
      }
      
      private function removeHeadGearProp() : void
      {
         this._character.removeHeadGear();
         this.headGearPropPanel.visible = false;
         this.headGearPropPanel.includeInLayout = false;
      }
      
      private function removeHeadProp() : void
      {
         this._character.restoreHead();
         this.headPropPanel.visible = false;
         this.headPropPanel.includeInLayout = false;
         this.expressionPanel.withoutHeadProp = true;
      }
      
      protected function setUpActionPanel() : void
      {
         var _loc1_:CharThumb = null;
         _loc1_ = this._character.thumb as CharThumb;
         if(_loc1_)
         {
            this.actionCollection = ImageDataManager.instance.getCharacterActionCollection(_loc1_.themeId,_loc1_.id);
            if(this.actionCollection)
            {
               this.processActionCollection();
            }
            else
            {
               currentState = "loading";
               this.actionCollection = new ActionExplorerCollection();
               this.actionCollection.addEventListener(Event.COMPLETE,this.actionCollection_completeHandler,false,0,true);
               this.actionCollection.createFromCharacterThumb(_loc1_);
            }
            this._suggestionEnabled = this._themeManager.supportSearchSuggestion(_loc1_.ccThemeId);
            this.actionExplorer.searchInputVisible = this._themeManager.supportActionSearch(_loc1_.themeOrCCThemeId);
            this.actionExplorer.suggestionThemeId = _loc1_.themeOrCCThemeId;
         }
      }
      
      private function actionCollection_completeHandler(param1:Event) : void
      {
         this.actionCollection.removeEventListener(Event.COMPLETE,this.actionCollection_completeHandler);
         this.actionCollection.sortByCategoryName();
         var _loc2_:CharThumb = this._character.thumb as CharThumb;
         ImageDataManager.instance.setCharacterActionCollection(_loc2_.themeId,_loc2_.id,this.actionCollection);
         this.processActionCollection();
      }
      
      private function processActionCollection() : void
      {
         this.actionExplorer.productProvider = null;
         this.actionExplorer.productProvider = this.actionCollection;
         this.updateActionPanel();
         this.actionExplorer.displayByProductId(this._character.actionId);
         var _loc1_:ActionThumbModel = this.actionExplorer.selectedProduct as ActionThumbModel;
         if(_loc1_)
         {
            this.expressionPanel.updateAutoFacial(_loc1_.defaultFacialId);
         }
         currentState = "ready";
      }
      
      private function updateActionPanel() : void
      {
         var _loc1_:IEye = null;
         var _loc2_:CharThumb = null;
         if(this._character)
         {
            this.expressionPanel.character = this._character;
            if(this._view)
            {
               _loc1_ = this._view.assetImage as IEye;
            }
            this.expressionPanel.eye = _loc1_;
            if(this._character.prop)
            {
               this.handPropPanel.prop = this._character.prop;
               this.handPropPanel.visible = true;
               this.handPropPanel.includeInLayout = true;
            }
            else
            {
               this.handPropPanel.visible = false;
               this.handPropPanel.includeInLayout = false;
            }
            this.headGearPropPanel.visible = false;
            this.headGearPropPanel.includeInLayout = false;
            _loc2_ = this._character.thumb as CharThumb;
            if(_loc2_ && this._character.wear)
            {
               if(_loc2_.themeId != ThemeConstants.STICKLY_BIZ_THEME_ID && _loc2_.themeId != ThemeConstants.BIZ_MODEL_THEME_ID)
               {
                  this.headGearPropPanel.prop = this._character.wear;
                  this.headGearPropPanel.visible = true;
                  this.headGearPropPanel.includeInLayout = true;
               }
            }
            if(this._character.head && this._character.head.thumb.id != this._character.thumb.id + ".head")
            {
               this.expressionPanel.withoutHeadProp = false;
               this.headPropPanel.prop = this._character.head;
               this.headPropPanel.visible = true;
               this.headPropPanel.includeInLayout = true;
            }
            else
            {
               this.expressionPanel.withoutHeadProp = true;
               this.headPropPanel.visible = false;
               this.headPropPanel.includeInLayout = false;
            }
         }
      }
      
      protected function character_actionChangeHandler(param1:AssetEvent) : void
      {
         if(!this.actionExplorer.isSearching)
         {
            this.actionExplorer.displayByProductId(this._character.actionId);
         }
         this.updateActionPanel();
      }
      
      protected function character_characterSwapCompleteHandler(param1:AssetEvent) : void
      {
         this.setUpActionPanel();
      }
      
      protected function actionExplorer_actionSelectedHandler(param1:ProductExplorerEvent) : void
      {
         var _loc3_:TutorialManager = null;
         var _loc4_:Object = null;
         var _loc5_:ICommand = null;
         var _loc6_:SceneEditor = null;
         var _loc2_:ActionThumbModel = param1.product as ActionThumbModel;
         if(this._character && _loc2_)
         {
            _loc3_ = TutorialManager.instance;
            _loc4_ = {
               "action":_loc2_.name,
               "tutorial":(!!_loc3_.currentTutorial?"yes":"no")
            };
            AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_SWITCH_CHAR_ACTION,_loc4_);
            _loc5_ = new UserChangeActionCommand(this._character,_loc2_.actionId,_loc2_.isMotion);
            _loc5_.execute();
            _loc6_ = Console.getConsole().sceneEditor;
            _loc6_.hideControl();
            _loc6_.updateControl();
            _loc6_.showMotionControl();
            this.expressionPanel.updateAutoFacial(_loc2_.defaultFacialId);
            this._tutorialManager.notifyTutorialAction("action_update");
            if(_loc2_.isMotion)
            {
               this._tutorialManager.notifyTutorialAction("movement_add");
            }
         }
      }
      
      protected function init() : void
      {
         this._tutorialManager.registerComponent("action_explorer",this.actionExplorer);
         this._tutorialManager.registerComponent("action_explorer_product_list",this.actionExplorer.productList);
         this._tutorialManager.registerComponent("action_explorer_search",this.actionExplorer.searchInput);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_STEP_START,this.tutorialManager_tutorialStepStartHandler);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_STEP_COMPLETE,this.tutorialManager_tutorialStepCompleteHandler);
      }
      
      protected function tutorialManager_tutorialStepStartHandler(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.tutorialId;
         var _loc3_:String = param1.data;
         if(_loc2_ == TutorialManager.DEFAULT_TUTORIAL_ID)
         {
            this.tutorialSearchKeyword = BasicTutorial.DEFAULT_SEARCH_KEYWORD;
            switch(_loc3_)
            {
               case "search_action":
                  this.actionExplorer.alwaysExpand = true;
                  break;
               case "search_walk_action":
                  this.actionCollection.motionOnly = true;
                  this.actionExplorer.searchProduct(this.tutorialSearchKeyword);
            }
         }
         else if(_loc2_ == TutorialManager.STARTER_TUTORIAL_ID)
         {
            this.tutorialSearchKeyword = SceneTemplateTutorial.DEFAULT_SEARCH_KEYWORD;
            if(_loc3_ == "search_action")
            {
               this.actionExplorer.alwaysExpand = true;
            }
         }
      }
      
      protected function tutorialManager_tutorialStepCompleteHandler(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.tutorialId;
         var _loc3_:String = param1.data;
         if(_loc2_ == TutorialManager.DEFAULT_TUTORIAL_ID)
         {
            switch(_loc3_)
            {
               case "search_action":
                  this.actionExplorer.alwaysExpand = false;
                  break;
               case "search_walk_action":
                  this.actionCollection.motionOnly = false;
                  callLater(this.overwriteSearchTerm);
            }
         }
         else if(_loc2_ == TutorialManager.STARTER_TUTORIAL_ID)
         {
            if(_loc3_ == "search_action")
            {
               this.actionExplorer.alwaysExpand = false;
            }
         }
      }
      
      protected function actionExplorer_productSearchedHandler(param1:ProductExplorerEvent) : void
      {
         if(this._tutorialManager.expectedAction == "search_point_complete" && this.actionExplorer.searchInput.text != this.tutorialSearchKeyword)
         {
            this.overwriteSearchTerm();
            this.actionExplorer.searchProduct(this.tutorialSearchKeyword);
            return;
         }
         this._tutorialManager.notifyTutorialAction("search_complete");
         this._tutorialManager.notifyTutorialAction("search_walk_complete");
         if(this._tutorialManager.expectedAction == "search_point_complete")
         {
            if(this.actionExplorer.searchCollection.length == 0)
            {
               this.actionExplorer.displayNaturally();
            }
            else
            {
               this._tutorialManager.notifyTutorialAction("search_point_complete");
            }
         }
      }
      
      protected function overwriteSearchTerm() : void
      {
         this.actionExplorer.searchInput.text = this.tutorialSearchKeyword;
         Mouse.cursor = MouseCursor.AUTO;
      }
      
      protected function actionExplorer_productSearchStartHandler(param1:ProductExplorerEvent) : void
      {
         if(!this._tutorialManager.currentTutorial)
         {
            AnalyticsManager.instance.trackEventByUserGroup("Search Action",this.actionExplorer.lastSearchKeyword);
         }
      }
      
      private function _ActionPanel_Array2_c() : Array
      {
         var _loc1_:Array = [this._ActionPanel_Rect1_c(),this._ActionPanel_VGroup1_i()];
         return _loc1_;
      }
      
      private function _ActionPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.top = 0;
         _loc1_.height = 10;
         _loc1_.fill = this._ActionPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ActionPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ActionPanel_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = -1;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._ActionPanel_ProductExplorer1_i(),this._ActionPanel_CharacterExpressionPanel1_i(),this._ActionPanel_CharacterPropPanel1_i(),this._ActionPanel_CharacterPropPanel2_i(),this._ActionPanel_CharacterPropPanel3_i()];
         _loc1_.id = "actionPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionPanel = _loc1_;
         BindingManager.executeBindings(this,"actionPanel",this.actionPanel);
         return _loc1_;
      }
      
      private function _ActionPanel_ProductExplorer1_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._ActionPanel_ClassFactory1_c();
         _loc1_.suggestionType = "action";
         _loc1_.addEventListener("productSelected",this.__actionExplorer_productSelected);
         _loc1_.addEventListener("productSearched",this.__actionExplorer_productSearched);
         _loc1_.addEventListener("productSearchStart",this.__actionExplorer_productSearchStart);
         _loc1_.id = "actionExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionExplorer = _loc1_;
         BindingManager.executeBindings(this,"actionExplorer",this.actionExplorer);
         return _loc1_;
      }
      
      private function _ActionPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ActionExplorerRenderer;
         return _loc1_;
      }
      
      public function __actionExplorer_productSelected(param1:ProductExplorerEvent) : void
      {
         this.actionExplorer_actionSelectedHandler(param1);
      }
      
      public function __actionExplorer_productSearched(param1:ProductExplorerEvent) : void
      {
         this.actionExplorer_productSearchedHandler(param1);
      }
      
      public function __actionExplorer_productSearchStart(param1:ProductExplorerEvent) : void
      {
         this.actionExplorer_productSearchStartHandler(param1);
      }
      
      private function _ActionPanel_CharacterExpressionPanel1_i() : CharacterExpressionPanel
      {
         var _loc1_:CharacterExpressionPanel = new CharacterExpressionPanel();
         _loc1_.percentWidth = 100;
         _loc1_.id = "expressionPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.expressionPanel = _loc1_;
         BindingManager.executeBindings(this,"expressionPanel",this.expressionPanel);
         return _loc1_;
      }
      
      private function _ActionPanel_CharacterPropPanel1_i() : CharacterPropPanel
      {
         var _loc1_:CharacterPropPanel = new CharacterPropPanel();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.addEventListener("change",this.__handPropPanel_change);
         _loc1_.id = "handPropPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.handPropPanel = _loc1_;
         BindingManager.executeBindings(this,"handPropPanel",this.handPropPanel);
         return _loc1_;
      }
      
      public function __handPropPanel_change(param1:Event) : void
      {
         this.removeHandProp();
      }
      
      private function _ActionPanel_CharacterPropPanel2_i() : CharacterPropPanel
      {
         var _loc1_:CharacterPropPanel = new CharacterPropPanel();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.addEventListener("change",this.__headGearPropPanel_change);
         _loc1_.id = "headGearPropPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headGearPropPanel = _loc1_;
         BindingManager.executeBindings(this,"headGearPropPanel",this.headGearPropPanel);
         return _loc1_;
      }
      
      public function __headGearPropPanel_change(param1:Event) : void
      {
         this.removeHeadGearProp();
      }
      
      private function _ActionPanel_CharacterPropPanel3_i() : CharacterPropPanel
      {
         var _loc1_:CharacterPropPanel = new CharacterPropPanel();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.addEventListener("change",this.__headPropPanel_change);
         _loc1_.id = "headPropPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headPropPanel = _loc1_;
         BindingManager.executeBindings(this,"headPropPanel",this.headPropPanel);
         return _loc1_;
      }
      
      public function __headPropPanel_change(param1:Event) : void
      {
         this.removeHeadProp();
      }
      
      private function _ActionPanel_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ActionPanel_Rect2_c(),this._ActionPanel_BusyIndicator1_c()];
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
         return _loc1_;
      }
      
      private function _ActionPanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ActionPanel_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ActionPanel_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ActionPanel_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ActionPanel_NavigatorContent1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _ActionPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return _suggestionEnabled;
         },null,"actionExplorer.suggestionEnabled");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Handheld");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"handPropPanel.title");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Headgear");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"headGearPropPanel.title");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Head");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"headPropPanel.title");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get actionExplorer() : ProductExplorer
      {
         return this._1843223403actionExplorer;
      }
      
      public function set actionExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1843223403actionExplorer;
         if(_loc2_ !== param1)
         {
            this._1843223403actionExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actionPanel() : VGroup
      {
         return this._1569328494actionPanel;
      }
      
      public function set actionPanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._1569328494actionPanel;
         if(_loc2_ !== param1)
         {
            this._1569328494actionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get expressionPanel() : CharacterExpressionPanel
      {
         return this._2070242892expressionPanel;
      }
      
      public function set expressionPanel(param1:CharacterExpressionPanel) : void
      {
         var _loc2_:Object = this._2070242892expressionPanel;
         if(_loc2_ !== param1)
         {
            this._2070242892expressionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"expressionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get handPropPanel() : CharacterPropPanel
      {
         return this._2119202638handPropPanel;
      }
      
      public function set handPropPanel(param1:CharacterPropPanel) : void
      {
         var _loc2_:Object = this._2119202638handPropPanel;
         if(_loc2_ !== param1)
         {
            this._2119202638handPropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"handPropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headGearPropPanel() : CharacterPropPanel
      {
         return this._1202839150headGearPropPanel;
      }
      
      public function set headGearPropPanel(param1:CharacterPropPanel) : void
      {
         var _loc2_:Object = this._1202839150headGearPropPanel;
         if(_loc2_ !== param1)
         {
            this._1202839150headGearPropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headGearPropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headPropPanel() : CharacterPropPanel
      {
         return this._282659425headPropPanel;
      }
      
      public function set headPropPanel(param1:CharacterPropPanel) : void
      {
         var _loc2_:Object = this._282659425headPropPanel;
         if(_loc2_ !== param1)
         {
            this._282659425headPropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headPropPanel",_loc2_,param1));
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
   }
}
