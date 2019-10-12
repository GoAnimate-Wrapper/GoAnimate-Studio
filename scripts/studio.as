package
{
   import anifire.component.EyeDropperScreenOverlay;
   import anifire.constant.AnimeConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.components.FlowFrameImageEditor;
   import anifire.studio.components.MainStage;
   import anifire.studio.components.OverTray;
   import anifire.studio.components.ScreenCapTool;
   import anifire.studio.components.StarterDropLayer;
   import anifire.studio.components.StudioLoadingScreen;
   import anifire.studio.components.StudioProgressBar;
   import anifire.studio.components.ThumbTray;
   import anifire.studio.components.Timeline;
   import anifire.studio.components.TutorialLayer;
   import anifire.studio.core.Console;
   import anifire.studio.events.TimelineEvent;
   import anifire.studio.managers.UserExperimentManager;
   import anifire.studio.skins.BackgroundFormItemSkin;
   import anifire.studio.skins.BackgroundFormSkin;
   import anifire.studio.skins.ClosePopUpButtonSkin;
   import anifire.studio.skins.CompactFormItemSkin;
   import anifire.studio.skins.CompactFormSkin;
   import anifire.studio.skins.ConfirmPanelSkin;
   import anifire.studio.skins.DefaultButtonSkin;
   import anifire.studio.skins.DefaultComboBoxSkin;
   import anifire.studio.skins.DefaultDropDownListSkin;
   import anifire.studio.skins.DefaultFormItemSkin;
   import anifire.studio.skins.DefaultHScrollBarSkin;
   import anifire.studio.skins.DefaultTabBarSkin;
   import anifire.studio.skins.DefaultTextAreaSkin;
   import anifire.studio.skins.DefaultTextInputSkin;
   import anifire.studio.skins.DefaultToggleButtonSkin;
   import anifire.studio.skins.DefaultVScrollBarSkin;
   import anifire.studio.skins.FlatCheckBoxSkin;
   import anifire.studio.skins.FlatFormHeadingSkin;
   import anifire.studio.skins.FlatHSliderSkin;
   import anifire.studio.skins.FlatRadioButtonSkin;
   import anifire.studio.skins.FlatVSliderSkin;
   import anifire.studio.skins.GreyButtonSkin;
   import anifire.studio.skins.LinkButtonSkin;
   import anifire.studio.skins.NoFocusSkin;
   import anifire.studio.skins.PrimaryButtonSkin;
   import anifire.studio.skins.PublishFormItemSkin;
   import anifire.studio.skins.PublishFormSkin;
   import anifire.studio.skins.SecondaryButtonSkin;
   import anifire.studio.utils.UtilStudioVersion;
   import anifire.util.Util;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilNetwork;
   import anifire.utils.SecurityUtils;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.UncaughtErrorEvent;
   import flash.geom.Point;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.CSSCondition;
   import mx.styles.CSSSelector;
   import mx.styles.CSSStyleDeclaration;
   import spark.components.Application;
   
   public class studio extends Application implements IStateClient2
   {
      
      public static var CODE_VERSION:String = "a76d829cef09f7bb9bef739f686c0449acbaded8";
      
      {
         UtilStudioVersion.versionText = CODE_VERSION;
         SecurityUtils.init();
      }
      
      private var _1820782830_loadProgress:StudioProgressBar;
      
      private var _1751026874_mainStage:MainStage;
      
      private var _619629449_overTray:OverTray;
      
      private var _1149811839_screenCapTool:ScreenCapTool;
      
      private var _739375038_studioProgress:StudioLoadingScreen;
      
      private var _159139667_thumbTray:ThumbTray;
      
      private var _1986132576_timeline:Timeline;
      
      private var _2058374121eyeDropperScreenCap:EyeDropperScreenOverlay;
      
      private var _1918826569flowFrameImageEditor:FlowFrameImageEditor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var _console:Console;
      
      private var _componentInit:Boolean;
      
      private var _resourceInit:Boolean;
      
      protected var pendingStyleSheets:int;
      
      protected var localFlashVars:Boolean;
      
      protected var skipLocale:Boolean;
      
      protected var _tutorialLayer:TutorialLayer;
      
      protected var _starterDropLayer:StarterDropLayer;
      
      private var _configManager:AppConfigManager;
      
      mx_internal var _studio_StylesInit_done:Boolean = false;
      
      private var _embed_css__styles_images_tray_tab_back_hover_png_1167182327_965354953:Class;
      
      private var _embed_css__styles_images_tray_item_play_png_882156653_528047201:Class;
      
      private var _embed_css__styles_images_tray_tab_prop_hover_png__1154384525_1893021379:Class;
      
      private var _embed_css__styles_images_tray_item_play_hover_png__846119766_1355389650:Class;
      
      private var _embed_css__styles_images_tray_tab_prop_png_1820553206_781418934:Class;
      
      private var _embed_css__styles_images_tray_tab_music_png_1765060360_2099688052:Class;
      
      private var _embed_css__styles_images_tray_tab_effect_png_1422354724_1245007996:Class;
      
      private var _embed_css__styles_images_tray_tab_effect_hover_png__1774887903_171778287:Class;
      
      private var _embed_css__styles_images_tray_item_delete_png__1407679516_809607528:Class;
      
      private var _embed_css__styles_images_tray_tab_widget_hover_png__1464403692_860323412:Class;
      
      private var _embed_css__styles_images_tray_tab_music_hover_png_266839813_197843191:Class;
      
      private var _embed_css__styles_images_tray_tab_widget_png__600672169_1702529769:Class;
      
      private var _embed_css__styles_images_tray_tab_character_png__652802548_617336704:Class;
      
      private var _embed_css__styles_images_tray_item_info_png__818663193_1663389717:Class;
      
      private var _embed_css__styles_images_tray_tab_video_png__1587103138_1508577970:Class;
      
      private var _embed_css__styles_images_tray_tab_back_png_640184186_854293958:Class;
      
      private var _embed_css__styles_images_tray_tab_character_hover_png__1610241271_220198925:Class;
      
      private var _embed__font_StudioSparkMain_medium_normal_405732490:Class;
      
      private var _embed_css__styles_images_tray_item_stop_hover_png_384798712_1121191204:Class;
      
      private var _embed_css__styles_images_tray_item_stop_png_718211643_1224843935:Class;
      
      private var _embed_css__styles_images_tray_tab_text_png_1810570432_986478768:Class;
      
      private var _embed__font_StudioSparkMain_medium_italic_1855000466:Class;
      
      private var _embed_css__styles_images_tray_item_delete_hover_png_2071422689_1547776981:Class;
      
      private var _embed_css__styles_images_tray_tab_video_hover_png__2072159781_1273103551:Class;
      
      private var _embed_css__styles_images_tray_item_info_hover_png__753924700_1984525272:Class;
      
      private var _embed__font_StudioSparkMain_bold_normal_1175079360:Class;
      
      private var _embed_css__styles_images_tray_tab_text_hover_png__1093473603_1154671853:Class;
      
      public function studio()
      {
         this._embed_css__styles_images_tray_tab_back_hover_png_1167182327_965354953 = _class_embed_css__styles_images_tray_tab_back_hover_png_1167182327_965354953;
         this._embed_css__styles_images_tray_item_play_png_882156653_528047201 = _class_embed_css__styles_images_tray_item_play_png_882156653_528047201;
         this._embed_css__styles_images_tray_tab_prop_hover_png__1154384525_1893021379 = _class_embed_css__styles_images_tray_tab_prop_hover_png__1154384525_1893021379;
         this._embed_css__styles_images_tray_item_play_hover_png__846119766_1355389650 = _class_embed_css__styles_images_tray_item_play_hover_png__846119766_1355389650;
         this._embed_css__styles_images_tray_tab_prop_png_1820553206_781418934 = _class_embed_css__styles_images_tray_tab_prop_png_1820553206_781418934;
         this._embed_css__styles_images_tray_tab_music_png_1765060360_2099688052 = _class_embed_css__styles_images_tray_tab_music_png_1765060360_2099688052;
         this._embed_css__styles_images_tray_tab_effect_png_1422354724_1245007996 = _class_embed_css__styles_images_tray_tab_effect_png_1422354724_1245007996;
         this._embed_css__styles_images_tray_tab_effect_hover_png__1774887903_171778287 = _class_embed_css__styles_images_tray_tab_effect_hover_png__1774887903_171778287;
         this._embed_css__styles_images_tray_item_delete_png__1407679516_809607528 = _class_embed_css__styles_images_tray_item_delete_png__1407679516_809607528;
         this._embed_css__styles_images_tray_tab_widget_hover_png__1464403692_860323412 = _class_embed_css__styles_images_tray_tab_widget_hover_png__1464403692_860323412;
         this._embed_css__styles_images_tray_tab_music_hover_png_266839813_197843191 = _class_embed_css__styles_images_tray_tab_music_hover_png_266839813_197843191;
         this._embed_css__styles_images_tray_tab_widget_png__600672169_1702529769 = _class_embed_css__styles_images_tray_tab_widget_png__600672169_1702529769;
         this._embed_css__styles_images_tray_tab_character_png__652802548_617336704 = _class_embed_css__styles_images_tray_tab_character_png__652802548_617336704;
         this._embed_css__styles_images_tray_item_info_png__818663193_1663389717 = _class_embed_css__styles_images_tray_item_info_png__818663193_1663389717;
         this._embed_css__styles_images_tray_tab_video_png__1587103138_1508577970 = _class_embed_css__styles_images_tray_tab_video_png__1587103138_1508577970;
         this._embed_css__styles_images_tray_tab_back_png_640184186_854293958 = _class_embed_css__styles_images_tray_tab_back_png_640184186_854293958;
         this._embed_css__styles_images_tray_tab_character_hover_png__1610241271_220198925 = _class_embed_css__styles_images_tray_tab_character_hover_png__1610241271_220198925;
         this._embed__font_StudioSparkMain_medium_normal_405732490 = studio__embed__font_StudioSparkMain_medium_normal_405732490;
         this._embed_css__styles_images_tray_item_stop_hover_png_384798712_1121191204 = _class_embed_css__styles_images_tray_item_stop_hover_png_384798712_1121191204;
         this._embed_css__styles_images_tray_item_stop_png_718211643_1224843935 = _class_embed_css__styles_images_tray_item_stop_png_718211643_1224843935;
         this._embed_css__styles_images_tray_tab_text_png_1810570432_986478768 = _class_embed_css__styles_images_tray_tab_text_png_1810570432_986478768;
         this._embed__font_StudioSparkMain_medium_italic_1855000466 = studio__embed__font_StudioSparkMain_medium_italic_1855000466;
         this._embed_css__styles_images_tray_item_delete_hover_png_2071422689_1547776981 = _class_embed_css__styles_images_tray_item_delete_hover_png_2071422689_1547776981;
         this._embed_css__styles_images_tray_tab_video_hover_png__2072159781_1273103551 = _class_embed_css__styles_images_tray_tab_video_hover_png__2072159781_1273103551;
         this._embed_css__styles_images_tray_item_info_hover_png__753924700_1984525272 = _class_embed_css__styles_images_tray_item_info_hover_png__753924700_1984525272;
         this._embed__font_StudioSparkMain_bold_normal_1175079360 = studio__embed__font_StudioSparkMain_bold_normal_1175079360;
         this._embed_css__styles_images_tray_tab_text_hover_png__1093473603_1154671853 = _class_embed_css__styles_images_tray_tab_text_hover_png__1093473603_1154671853;
         super();
         mx_internal::_document = this;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._studio_Array4_c);
         this.currentState = "init";
         this.addEventListener("preinitialize",this.___studio_Application1_preinitialize);
         this.addEventListener("applicationComplete",this.___studio_Application1_applicationComplete);
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._studio_MainStage1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._studio_OverTray1_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._studio_StudioLoadingScreen1_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._studio_StudioProgressBar1_i);
         var _loc5_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._studio_ThumbTray1_i);
         var _loc6_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._studio_Timeline1_i);
         states = [new State({
            "name":"init",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "position":"after",
               "relativeTo":["_screenCapTool"]
            })]
         }),new State({
            "name":"loading",
            "stateGroups":["readyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "position":"after",
               "relativeTo":["_screenCapTool"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc6_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"_mainStage",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_thumbTray",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_timeline",
               "name":"visible",
               "value":false
            })]
         }),new State({
            "name":"completed",
            "stateGroups":["readyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc6_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "position":"first"
            })]
         })];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundColor = 15658734;
         };
         mx_internal::_studio_StylesInit();
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function initApp() : void
      {
         var _loc2_:UserExperimentManager = null;
         this._configManager = AppConfigManager.instance;
         var _loc1_:String = this._configManager.getValue(UserExperimentManager.FLASH_VARS_KEY);
         if(_loc1_)
         {
            _loc2_ = UserExperimentManager.instance;
            _loc2_.experimentId = int(_loc1_);
         }
         if(this.skipLocale)
         {
            this.resourceComplete();
         }
         else
         {
            Util.loadClientLocale("go",this.onClientLocaleComplete);
         }
      }
      
      private function onClientLocaleComplete(param1:Event) : void
      {
         this.resourceComplete();
      }
      
      private function uncaughtErrorHandler(param1:UncaughtErrorEvent) : void
      {
         UtilErrorLogger.getInstance().fatal("uncaughtErrorHandler: " + new Error().getStackTrace());
      }
      
      private function onApplicationComplete() : void
      {
         this._componentInit = true;
         if(this._resourceInit)
         {
            this.initConsole();
         }
      }
      
      private function resourceComplete() : void
      {
         this._resourceInit = true;
         if(this._componentInit)
         {
            this.initConsole();
         }
      }
      
      private function initConsole() : void
      {
         var _loc3_:ContextMenuItem = null;
         currentState = "loading";
         UtilErrorLogger.getInstance().appendCustomError("initialConsole");
         UtilNetwork.loadS3crossDomainXml();
         this._console = Console.initializeConsole(this._mainStage,this._thumbTray,null,this._timeline,this._overTray._pw,this._screenCapTool) as Console;
         this._console.initializeLoadingBar(this._loadProgress);
         this._console.flowFrameImageEditor = this.flowFrameImageEditor;
         this._tutorialLayer = new TutorialLayer();
         this._console.initTutorial(this._tutorialLayer);
         this._starterDropLayer = new StarterDropLayer();
         this._console.initStarterDropLayer(this._starterDropLayer);
         this.addEventListener(KeyboardEvent.KEY_UP,Console.getConsole().doKeyUp);
         loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.uncaughtErrorHandler);
         var _loc1_:ContextMenu = new ContextMenu();
         _loc1_.hideBuiltInItems();
         var _loc2_:String = CODE_VERSION;
         if(_loc2_ && _loc2_.length > 0)
         {
            _loc3_ = new ContextMenuItem("Version: " + _loc2_);
            _loc3_.enabled = false;
            _loc3_.separatorBefore = true;
            _loc1_.customItems.push(_loc3_);
         }
         this.contextMenu = _loc1_;
         this.resizeContentContainer(stage.stageWidth,stage.stageHeight);
         addEventListener(ResizeEvent.RESIZE,this.onApplicationResize);
      }
      
      private function displayStudio() : void
      {
         if(this._timeline.initialized && this._mainStage.initialized && this._thumbTray.initialized)
         {
            currentState = "completed";
         }
      }
      
      protected function onApplicationResize(param1:ResizeEvent) : void
      {
         this.resizeContentContainer(stage.stageWidth,stage.stageHeight);
      }
      
      protected function onTimelineDisplayChange(param1:TimelineEvent) : void
      {
         this.resizeContentContainer(stage.stageWidth,stage.stageHeight);
      }
      
      protected function resizeContentContainer(param1:int, param2:int) : void
      {
         param1 = Math.max(param1,AnimeConstants.STUDIO_WIDTH_MIN);
         param2 = Math.max(param2,AnimeConstants.STUDIO_HEIGHT_MIN);
         this._timeline.width = param1;
         this._timeline.y = param2 - this._timeline.height;
         this._mainStage.width = param1 - this._thumbTray.width;
         this._mainStage.height = param2 - this._timeline.height;
         this._thumbTray.height = param2 - this._timeline.height;
         this._overTray.height = param2 - this._timeline.height;
         this._tutorialLayer.width = param1;
         this._tutorialLayer.height = param2;
         this._studioProgress.width = param1;
         this._studioProgress.height = param2;
         this._screenCapTool.width = param1;
         this._screenCapTool.height = param2;
         this.eyeDropperScreenCap.width = param1;
         this.eyeDropperScreenCap.height = param2;
         this._loadProgress.x = (param1 + this._thumbTray.width - this._loadProgress.width) / 2;
         this.updateFlowFrameImageEditor();
      }
      
      private function updateFlowFrameImageEditor() : void
      {
         if(!this.flowFrameImageEditor.visible)
         {
            return;
         }
         var _loc1_:Point = new Point();
         _loc1_ = this._mainStage.sceneEditor.localToGlobal(_loc1_);
         this.flowFrameImageEditor.zoomAndPan(this._mainStage.zoomContainer.zoomFactor,_loc1_.x,_loc1_.y);
      }
      
      private function _studio_Array4_c() : Array
      {
         var _loc1_:Array = [this._studio_ScreenCapTool1_i(),this._studio_EyeDropperScreenOverlay1_i(),this._studio_FlowFrameImageEditor1_i()];
         return _loc1_;
      }
      
      private function _studio_MainStage1_i() : MainStage
      {
         var _loc1_:MainStage = new MainStage();
         _loc1_.x = 310;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("creationComplete",this.___mainStage_creationComplete);
         _loc1_.id = "_mainStage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._mainStage = _loc1_;
         BindingManager.executeBindings(this,"_mainStage",this._mainStage);
         return _loc1_;
      }
      
      public function ___mainStage_creationComplete(param1:FlexEvent) : void
      {
         this.displayStudio();
      }
      
      private function _studio_ThumbTray1_i() : ThumbTray
      {
         var _loc1_:ThumbTray = new ThumbTray();
         _loc1_.addEventListener("creationComplete",this.___thumbTray_creationComplete);
         _loc1_.id = "_thumbTray";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._thumbTray = _loc1_;
         BindingManager.executeBindings(this,"_thumbTray",this._thumbTray);
         return _loc1_;
      }
      
      public function ___thumbTray_creationComplete(param1:FlexEvent) : void
      {
         this.displayStudio();
      }
      
      private function _studio_Timeline1_i() : Timeline
      {
         var _loc1_:Timeline = new Timeline();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("creationComplete",this.___timeline_creationComplete);
         _loc1_.addEventListener("displayModeChange",this.___timeline_displayModeChange);
         _loc1_.id = "_timeline";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._timeline = _loc1_;
         BindingManager.executeBindings(this,"_timeline",this._timeline);
         return _loc1_;
      }
      
      public function ___timeline_creationComplete(param1:FlexEvent) : void
      {
         this.displayStudio();
      }
      
      public function ___timeline_displayModeChange(param1:TimelineEvent) : void
      {
         this.onTimelineDisplayChange(param1);
      }
      
      private function _studio_OverTray1_i() : OverTray
      {
         var _loc1_:OverTray = new OverTray();
         _loc1_.id = "_overTray";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._overTray = _loc1_;
         BindingManager.executeBindings(this,"_overTray",this._overTray);
         return _loc1_;
      }
      
      private function _studio_StudioProgressBar1_i() : StudioProgressBar
      {
         var _loc1_:StudioProgressBar = new StudioProgressBar();
         _loc1_.y = 60;
         _loc1_.id = "_loadProgress";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._loadProgress = _loc1_;
         BindingManager.executeBindings(this,"_loadProgress",this._loadProgress);
         return _loc1_;
      }
      
      private function _studio_ScreenCapTool1_i() : ScreenCapTool
      {
         var _loc1_:ScreenCapTool = new ScreenCapTool();
         _loc1_.id = "_screenCapTool";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._screenCapTool = _loc1_;
         BindingManager.executeBindings(this,"_screenCapTool",this._screenCapTool);
         return _loc1_;
      }
      
      private function _studio_StudioLoadingScreen1_i() : StudioLoadingScreen
      {
         var _loc1_:StudioLoadingScreen = new StudioLoadingScreen();
         _loc1_.id = "_studioProgress";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._studioProgress = _loc1_;
         BindingManager.executeBindings(this,"_studioProgress",this._studioProgress);
         return _loc1_;
      }
      
      private function _studio_EyeDropperScreenOverlay1_i() : EyeDropperScreenOverlay
      {
         var _loc1_:EyeDropperScreenOverlay = new EyeDropperScreenOverlay();
         _loc1_.id = "eyeDropperScreenCap";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.eyeDropperScreenCap = _loc1_;
         BindingManager.executeBindings(this,"eyeDropperScreenCap",this.eyeDropperScreenCap);
         return _loc1_;
      }
      
      private function _studio_FlowFrameImageEditor1_i() : FlowFrameImageEditor
      {
         var _loc1_:FlowFrameImageEditor = new FlowFrameImageEditor();
         _loc1_.visible = false;
         _loc1_.id = "flowFrameImageEditor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.flowFrameImageEditor = _loc1_;
         BindingManager.executeBindings(this,"flowFrameImageEditor",this.flowFrameImageEditor);
         return _loc1_;
      }
      
      public function ___studio_Application1_preinitialize(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      public function ___studio_Application1_applicationComplete(param1:FlexEvent) : void
      {
         this.onApplicationComplete();
      }
      
      mx_internal function _studio_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_studio_StylesInit_done)
         {
            return;
         }
         mx_internal::_studio_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("global",conditions,selector);
         style = styleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.modalTransparency = 0.7;
               this.modalTransparencyColor = 0;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Application",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Application");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.supportClasses.SkinnableComponent",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.supportClasses.SkinnableComponent");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.focusSkin = NoFocusSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.HScrollBar",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.HScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultHScrollBarSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.VScrollBar",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.VScrollBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultVScrollBarSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 5331305;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","compact");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.compact");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = CompactFormSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","backgroundform");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.backgroundform");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = BackgroundFormSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","publish");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.publish");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = PublishFormSkin;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.supportClasses.TextBase",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.supportClasses.TextBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 5331305;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.supportClasses.SkinnableTextBase",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.supportClasses.SkinnableTextBase");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 5331305;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 5331305;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.skins.spark.DefaultGridItemRenderer",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.skins.spark.DefaultGridItemRenderer");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 5331305;
               this.fontFamily = "StudioSparkMain";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("id","promptDisplay");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label#promptDisplay");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 13421772;
               this.fontStyle = "normal";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("id","errorTextDisplay");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichText#errorTextDisplay");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontSize = 11;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultButtonSkin;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","primary");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.primary");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = PrimaryButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","secondary");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.secondary");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = SecondaryButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","grey");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.grey");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = GreyButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","link");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.link");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = LinkButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","closePopUp");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.closePopUp");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ClosePopUpButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultToggleButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.TabBar",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TabBar");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultTabBarSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","character");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButtonBarButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButtonBarButton.character");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.iconNormal = _embed_css__styles_images_tray_tab_character_png__652802548_617336704;
               this.iconOver = _embed_css__styles_images_tray_tab_character_hover_png__1610241271_220198925;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","prop");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButtonBarButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButtonBarButton.prop");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.iconNormal = _embed_css__styles_images_tray_tab_prop_png_1820553206_781418934;
               this.iconOver = _embed_css__styles_images_tray_tab_prop_hover_png__1154384525_1893021379;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","widget");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButtonBarButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButtonBarButton.widget");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.iconNormal = _embed_css__styles_images_tray_tab_widget_png__600672169_1702529769;
               this.iconOver = _embed_css__styles_images_tray_tab_widget_hover_png__1464403692_860323412;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","background");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButtonBarButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButtonBarButton.background");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.iconNormal = _embed_css__styles_images_tray_tab_back_png_640184186_854293958;
               this.iconOver = _embed_css__styles_images_tray_tab_back_hover_png_1167182327_965354953;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","text");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButtonBarButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButtonBarButton.text");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.iconNormal = _embed_css__styles_images_tray_tab_text_png_1810570432_986478768;
               this.iconOver = _embed_css__styles_images_tray_tab_text_hover_png__1093473603_1154671853;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","music");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButtonBarButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButtonBarButton.music");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.iconNormal = _embed_css__styles_images_tray_tab_music_png_1765060360_2099688052;
               this.iconOver = _embed_css__styles_images_tray_tab_music_hover_png_266839813_197843191;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effect");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButtonBarButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButtonBarButton.effect");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.iconNormal = _embed_css__styles_images_tray_tab_effect_png_1422354724_1245007996;
               this.iconOver = _embed_css__styles_images_tray_tab_effect_hover_png__1774887903_171778287;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","video");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButtonBarButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButtonBarButton.video");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.iconNormal = _embed_css__styles_images_tray_tab_video_png__1587103138_1508577970;
               this.iconOver = _embed_css__styles_images_tray_tab_video_hover_png__2072159781_1273103551;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","playSmall");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButton.playSmall");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__styles_images_tray_item_play_png_882156653_528047201;
               this.iconOver = _embed_css__styles_images_tray_item_play_hover_png__846119766_1355389650;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","stopSmall");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButton.stopSmall");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__styles_images_tray_item_stop_png_718211643_1224843935;
               this.iconOver = _embed_css__styles_images_tray_item_stop_hover_png_384798712_1121191204;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","infoSmall");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButton.infoSmall");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__styles_images_tray_item_info_png__818663193_1663389717;
               this.iconOver = _embed_css__styles_images_tray_item_info_hover_png__753924700_1984525272;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","deleteSmall");
         conditions.push(condition);
         selector = new CSSSelector("anifire.studio.components.IconButton",conditions,selector);
         style = styleManager.getStyleDeclaration("anifire.studio.components.IconButton.deleteSmall");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.icon = _embed_css__styles_images_tray_item_delete_png__1407679516_809607528;
               this.iconOver = _embed_css__styles_images_tray_item_delete_hover_png_2071422689_1547776981;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Panel",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Panel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = ConfirmPanelSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = FlatRadioButtonSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.CheckBox",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.CheckBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = FlatCheckBoxSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.HSlider",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.HSlider");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = FlatHSliderSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.VSlider",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.VSlider");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = FlatVSliderSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.FormHeading",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.FormHeading");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "bold";
               this.color = 5200489;
               this.skinClass = FlatFormHeadingSkin;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.FormItem",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.FormItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.errorColor = 16736613;
               this.skinClass = DefaultFormItemSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","compact");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         conditions = null;
         selector = new CSSSelector("spark.components.FormItem",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.compact spark.components.FormItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 5200489;
               this.skinClass = CompactFormItemSkin;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","backgroundform");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         conditions = null;
         selector = new CSSSelector("spark.components.FormItem",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.backgroundform spark.components.FormItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 5200489;
               this.skinClass = BackgroundFormItemSkin;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","publish");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Form",conditions,selector);
         conditions = null;
         selector = new CSSSelector("spark.components.FormItem",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Form.publish spark.components.FormItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.errorColor = 16147048;
               this.skinClass = PublishFormItemSkin;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultDropDownListSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.ComboBox",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ComboBox");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = DefaultComboBoxSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.TextInput",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderColor = 13290196;
               this.skinClass = DefaultTextInputSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.TextArea",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextArea");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderColor = 13290196;
               this.skinClass = DefaultTextAreaSkin;
            };
         }
         styleManager.initProtoChainRoots();
      }
      
      [Bindable(event="propertyChange")]
      public function get _loadProgress() : StudioProgressBar
      {
         return this._1820782830_loadProgress;
      }
      
      public function set _loadProgress(param1:StudioProgressBar) : void
      {
         var _loc2_:Object = this._1820782830_loadProgress;
         if(_loc2_ !== param1)
         {
            this._1820782830_loadProgress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadProgress",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _mainStage() : MainStage
      {
         return this._1751026874_mainStage;
      }
      
      public function set _mainStage(param1:MainStage) : void
      {
         var _loc2_:Object = this._1751026874_mainStage;
         if(_loc2_ !== param1)
         {
            this._1751026874_mainStage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_mainStage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _overTray() : OverTray
      {
         return this._619629449_overTray;
      }
      
      public function set _overTray(param1:OverTray) : void
      {
         var _loc2_:Object = this._619629449_overTray;
         if(_loc2_ !== param1)
         {
            this._619629449_overTray = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_overTray",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _screenCapTool() : ScreenCapTool
      {
         return this._1149811839_screenCapTool;
      }
      
      public function set _screenCapTool(param1:ScreenCapTool) : void
      {
         var _loc2_:Object = this._1149811839_screenCapTool;
         if(_loc2_ !== param1)
         {
            this._1149811839_screenCapTool = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_screenCapTool",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _studioProgress() : StudioLoadingScreen
      {
         return this._739375038_studioProgress;
      }
      
      public function set _studioProgress(param1:StudioLoadingScreen) : void
      {
         var _loc2_:Object = this._739375038_studioProgress;
         if(_loc2_ !== param1)
         {
            this._739375038_studioProgress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_studioProgress",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _thumbTray() : ThumbTray
      {
         return this._159139667_thumbTray;
      }
      
      public function set _thumbTray(param1:ThumbTray) : void
      {
         var _loc2_:Object = this._159139667_thumbTray;
         if(_loc2_ !== param1)
         {
            this._159139667_thumbTray = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_thumbTray",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _timeline() : Timeline
      {
         return this._1986132576_timeline;
      }
      
      public function set _timeline(param1:Timeline) : void
      {
         var _loc2_:Object = this._1986132576_timeline;
         if(_loc2_ !== param1)
         {
            this._1986132576_timeline = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_timeline",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get eyeDropperScreenCap() : EyeDropperScreenOverlay
      {
         return this._2058374121eyeDropperScreenCap;
      }
      
      public function set eyeDropperScreenCap(param1:EyeDropperScreenOverlay) : void
      {
         var _loc2_:Object = this._2058374121eyeDropperScreenCap;
         if(_loc2_ !== param1)
         {
            this._2058374121eyeDropperScreenCap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eyeDropperScreenCap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get flowFrameImageEditor() : FlowFrameImageEditor
      {
         return this._1918826569flowFrameImageEditor;
      }
      
      public function set flowFrameImageEditor(param1:FlowFrameImageEditor) : void
      {
         var _loc2_:Object = this._1918826569flowFrameImageEditor;
         if(_loc2_ !== param1)
         {
            this._1918826569flowFrameImageEditor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flowFrameImageEditor",_loc2_,param1));
            }
         }
      }
   }
}
