package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ThemeConstants;
   import anifire.event.CoreEvent;
   import anifire.event.FontEvent;
   import anifire.event.StudioEvent;
   import anifire.managers.AppConfigManager;
   import anifire.managers.ServerConnector;
   import anifire.studio.commands.ChangeFlowFrameImageCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.BubbleThumb;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Console;
   import anifire.studio.core.EffectThumb;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.core.Thumb;
   import anifire.studio.core.WidgetThumb;
   import anifire.studio.events.ImporterEvent;
   import anifire.studio.events.InfiniteScrollEvent;
   import anifire.studio.events.ProductExplorerEvent;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import anifire.studio.events.TextComponentEvent;
   import anifire.studio.events.ThemeChangeEvent;
   import anifire.studio.events.TutorialEvent;
   import anifire.studio.managers.AccessRightManager;
   import anifire.studio.managers.AnalyticsManager;
   import anifire.studio.managers.ImporterManager;
   import anifire.studio.managers.SharedAssetManager;
   import anifire.studio.managers.SoundPlaybackManager;
   import anifire.studio.managers.StudioFontManager;
   import anifire.studio.managers.StudioManager;
   import anifire.studio.managers.StudioStatusManager;
   import anifire.studio.managers.TextComponentManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.models.BackgroundCollection;
   import anifire.studio.models.BackgroundExplorerCollection;
   import anifire.studio.models.CharacterExplorerCollection;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.studio.models.PropExplorerCollection;
   import anifire.studio.models.SoundGroupCollection;
   import anifire.studio.models.TextComponentThumb;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.models.WidgetExplorerCollection;
   import anifire.studio.models.tutorial.SceneTemplateTutorial;
   import anifire.studio.skins.BubbleListSkin;
   import anifire.studio.skins.CategorizedProductExplorerSkin;
   import anifire.studio.skins.SimpleProductExplorerSkin;
   import anifire.studio.skins.SoundExplorerProductListSkin;
   import anifire.studio.skins.StarterListSkin;
   import anifire.studio.skins.TextComponentListSkin;
   import anifire.studio.skins.ThemeBubbleListSkin;
   import anifire.studio.skins.WidgetProductExplorerSkin;
   import anifire.util.FontManager;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilLicense;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.containers.ViewStack;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Scroller;
   import spark.components.TabBar;
   import spark.components.VGroup;
   import spark.events.RendererExistenceEvent;
   import spark.layouts.TileLayout;
   import spark.layouts.VerticalLayout;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ThumbTray extends Group implements IBindingClient, IStateClient2
   {
      
      public static const TRAY_MAX_HEIGHT:Number = 800;
      
      public static const COMMON_THEME:String = "Common";
      
      public static const USER_THEME:String = "UserLibrary";
      
      public static const TEAM_THEME:String = "TeamLibrary";
      
      public static const SHARED_THEME:String = "SharedLibrary";
      
      public static const COMMUNITY_THEME:String = "CommunityLibrary";
      
      public static const MOVIE_THEME:String = "MovieLibrary";
      
      public static const CROSS_THEME_SEARCH:String = "Search";
      
      public static const LABEL_TEMPLATES:String = "Templates";
      
      public static const LABEL_BACKDROP_STARTER:String = "Backdrop & Starters";
      
      public static const PRODUCT_EXPLORER_SOUND:String = "sound_explorer";
      
      public static const PRODUCT_EXPLORER_PROP:String = "prop_explorer";
      
      public static const PRODUCT_EXPLORER_BACKGROUND:String = "background_explorer";
      
      public static const DEFAULT_BACKGROUND_CATEGORY:String = "text";
      
      private static var SOUND_BLOCKING_LIST:Array = ["11087","11093","11081","11099","11084","11101","11095","11097","11090"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ThumbTray_Button1:Button;
      
      public var _ThumbTray_Button2:Button;
      
      public var _ThumbTray_Button3:Button;
      
      public var _ThumbTray_Button4:Button;
      
      public var _ThumbTray_Button5:Button;
      
      public var _ThumbTray_Button6:Button;
      
      public var _ThumbTray_DecoratedList1:DecoratedList;
      
      public var _ThumbTray_DecoratedList12:DecoratedList;
      
      public var _ThumbTray_DecoratedList2:DecoratedList;
      
      public var _ThumbTray_Group10:Group;
      
      public var _ThumbTray_Group11:Group;
      
      public var _ThumbTray_Group12:Group;
      
      public var _ThumbTray_Group13:Group;
      
      public var _ThumbTray_Group14:Group;
      
      public var _ThumbTray_Group15:Group;
      
      public var _ThumbTray_Group16:Group;
      
      public var _ThumbTray_Group17:Group;
      
      public var _ThumbTray_Group18:Group;
      
      public var _ThumbTray_Group19:Group;
      
      public var _ThumbTray_Group2:Group;
      
      public var _ThumbTray_Group20:Group;
      
      public var _ThumbTray_Group21:Group;
      
      public var _ThumbTray_Group22:Group;
      
      public var _ThumbTray_Group23:Group;
      
      public var _ThumbTray_Group3:Group;
      
      public var _ThumbTray_Group4:Group;
      
      public var _ThumbTray_Group5:Group;
      
      public var _ThumbTray_Group6:Group;
      
      public var _ThumbTray_Group7:Group;
      
      public var _ThumbTray_Group8:Group;
      
      public var _ThumbTray_Group9:Group;
      
      public var _ThumbTray_TextComponentCreationPanel1:TextComponentCreationPanel;
      
      private var _1429652035commonSoundExplorer:ProductExplorer;
      
      private var _827224987communityPanel:CommunityPanel;
      
      private var _402532580importerButton:ImporterButton;
      
      private var _215411260movieBackgroundList:DecoratedList;
      
      private var _1908734938movieBackgroundPanel:spark.components.NavigatorContent;
      
      private var _1958123640movieBubblePanel:spark.components.NavigatorContent;
      
      private var _1634419223movieCharacterList:DecoratedList;
      
      private var _869161045movieCharacterPanel:spark.components.NavigatorContent;
      
      private var _1989410602movieContentGroup:spark.components.NavigatorContent;
      
      private var _450458337movieEffectList:DecoratedList;
      
      private var _1075855965movieEffectPanel:spark.components.NavigatorContent;
      
      private var _960045319movieNavigator:ViewStack;
      
      private var _1600428050moviePropExplorer:ProductExplorer;
      
      private var _535293167moviePropPanel:spark.components.NavigatorContent;
      
      private var _1211127922movieTabBar:TabBar;
      
      private var _1251916392navigatorGroup:ViewStack;
      
      private var _553648836searchPanel:ProductSearchPanel;
      
      private var _1687225134sharedBackgroundExplorer:UserBackgroundExplorer;
      
      private var _989193809sharedBackgroundPanel:anifire.studio.components.NavigatorContent;
      
      private var _1409466767sharedBubbleList:DecoratedList;
      
      private var _747247411sharedBubblePanel:anifire.studio.components.NavigatorContent;
      
      private var _272713355sharedContentGroup:spark.components.NavigatorContent;
      
      private var _1146634382sharedNavigator:ViewStack;
      
      private var _432415289sharedPropExplorer:ProductExplorer;
      
      private var _1652994428sharedPropPanel:anifire.studio.components.NavigatorContent;
      
      private var _445027849sharedSoundExplorer:ProductExplorer;
      
      private var _889499770sharedSoundPanel:anifire.studio.components.NavigatorContent;
      
      private var _1029400317sharedTabBar:TabBar;
      
      private var _385898354sharedVideoPanel:anifire.studio.components.NavigatorContent;
      
      private var _724780073sharedVideoPropList:DecoratedList;
      
      private var _926155978teamBackgroundExplorer:UserBackgroundExplorer;
      
      private var _1815519577teamBackgroundPanel:anifire.studio.components.NavigatorContent;
      
      private var _1114325383teamBubbleList:DecoratedList;
      
      private var _187799099teamBubblePanel:anifire.studio.components.NavigatorContent;
      
      private var _109684867teamContentGroup:spark.components.NavigatorContent;
      
      private var _783507578teamNavigator:ViewStack;
      
      private var _595443777teamPropExplorer:ProductExplorer;
      
      private var _711830908teamPropPanel:anifire.studio.components.NavigatorContent;
      
      private var _313887983teamSoundExplorer:ProductExplorer;
      
      private var _594358386teamSoundPanel:anifire.studio.components.NavigatorContent;
      
      private var _1485056773teamTabBar:TabBar;
      
      private var _681039738teamVideoPanel:anifire.studio.components.NavigatorContent;
      
      private var _1483695905teamVideoPropList:DecoratedList;
      
      private var _2029430893themeBackgroundPanel:spark.components.NavigatorContent;
      
      private var _319134071themeBackgroundProductExplorer:ProductExplorer;
      
      private var _73906353themeBubblePanel:spark.components.NavigatorContent;
      
      private var _1690888190themeCategorizedBackgroundProductExplorer:CategorizedProductExplorer;
      
      private var _1097059393themeCharacterExplorer:ProductExplorer;
      
      private var _920444548themeCharacterPanel:spark.components.NavigatorContent;
      
      private var _586750447themeContentGroup:spark.components.NavigatorContent;
      
      private var _1317321074themeNavigator:ViewStack;
      
      private var _1017536394themePropList:ProductExplorer;
      
      private var _1482307736themePropPanel:spark.components.NavigatorContent;
      
      private var _1091963704themeSelector:ThemeSelector;
      
      private var _106820386themeSoundPanel:spark.components.NavigatorContent;
      
      private var _486029465themeTabBar:TabBar;
      
      private var _57399381themeWidgetList:ProductExplorer;
      
      private var _1775930217themeWidgetPanel:spark.components.NavigatorContent;
      
      private var _284323512userBackgroundExplorer:UserBackgroundExplorer;
      
      private var _1537462741userBackgroundPanel:anifire.studio.components.NavigatorContent;
      
      private var _917600629userBubbleList:DecoratedList;
      
      private var _1615700979userBubblePanel:anifire.studio.components.NavigatorContent;
      
      private var _9885348userCharacterList:DecoratedList;
      
      private var _302995194userCharacterPanel:spark.components.NavigatorContent;
      
      private var _35757297userContentGroup:spark.components.NavigatorContent;
      
      private var _1578143028userNavigator:ViewStack;
      
      private var _669371347userPropExplorer:ProductExplorer;
      
      private var _1221485782userPropPanel:anifire.studio.components.NavigatorContent;
      
      private var _1689324643userSoundExplorer:ProductExplorer;
      
      private var _397633632userSoundPanel:anifire.studio.components.NavigatorContent;
      
      private var _1602696169userTabBar:TabBar;
      
      private var _877764492userVideoPanel:anifire.studio.components.NavigatorContent;
      
      private var _519516721userVideoPropList:DecoratedList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1895618663_userAssetManager:UserAssetManager;
      
      private var _1563661844_userSharedAssetManager:SharedAssetManager;
      
      private var _1531677706_adminTeamAssetManager:SharedAssetManager;
      
      private var _themeManager:ThemeManager;
      
      public var defaultThemeId:String;
      
      private var _tutorialManager:TutorialManager;
      
      private var _importerManager:ImporterManager;
      
      private var _assetTheme:String = "Common";
      
      private var _lastUserPanel:anifire.studio.components.NavigatorContent;
      
      private var _lastTeamPanel:anifire.studio.components.NavigatorContent;
      
      private var _lastSharedPanel:anifire.studio.components.NavigatorContent;
      
      private var _lastClickedThumb:Thumb;
      
      private var _userAssetsReady:Boolean;
      
      private var _userCharReady:Boolean;
      
      private var _1719104757_userBackgroundReady:Boolean;
      
      private var _607690290_userVideoReady:Boolean;
      
      private var _1425113453_userBubbleReady:Boolean;
      
      private var _191677886_hasMoreUserProp:Boolean;
      
      private var _1883088414_userSoundReady:Boolean;
      
      private var _1649734164_hasMoreUserSound:Boolean;
      
      private var _890362286_hasMoreUserCharacter:Boolean;
      
      private var _1327204778_themePropReady:Boolean;
      
      private var _430393044_loadingThemeCC:Boolean;
      
      private var _userEffectReady:Boolean;
      
      private var _userStarterReady:Boolean;
      
      private var _teamStarterReady:Boolean;
      
      private var _1633877561_teamBackgroundReady:Boolean;
      
      private var _movieCharacterReady:Boolean;
      
      private var _movieBackgroundReady:Boolean;
      
      private var _moviePropReady:Boolean;
      
      private var _movieEffectReady:Boolean;
      
      private var _active:Boolean = true;
      
      private var _serverConnector:ServerConnector;
      
      protected var _974242435_themeCharacterCollection:CharacterExplorerCollection;
      
      private var _characterCollectionLookup:Object;
      
      protected var _1823316531_movieCharacterSource:ArrayCollection;
      
      protected var _887474534_userCharacterSource:ArrayCollection;
      
      protected var _36509533_commonSoundCollection:SoundGroupCollection;
      
      protected var _222288294_bubbleSource:ArrayCollection;
      
      private var _1298423756_textComponentSource:ArrayCollection;
      
      protected var _705846120_movieBubbleSource:ArrayCollection;
      
      protected var _417104470_themeBackgroundCollection:BackgroundExplorerCollection;
      
      protected var _1525190345_tutorialBackgroundCollection:BackgroundExplorerCollection;
      
      protected var _715977530_movieBackgroundSource:ArrayCollection;
      
      protected var _1476654645_themePropCollection:PropExplorerCollection;
      
      protected var _1464653588_themeWidgetCollection:WidgetExplorerCollection;
      
      protected var _1028707058_moviePropCollection:PropExplorerCollection;
      
      protected var _844158218_themeEffectSource:ArrayCollection;
      
      protected var _874648029_movieEffectSource:ArrayCollection;
      
      protected var _1433812300_useSearchSuggestion:Boolean;
      
      private var _680717041_showTextComponentCreationPanel:Boolean;
      
      private var _1111861614_showTextComponentList:Boolean;
      
      private var _themeStarterVisible:Boolean = true;
      
      private var _themeWidgetVisible:Boolean = true;
      
      private var _themeBackgroundVisible:Boolean = true;
      
      private var _1207892066_hasTemplates:Boolean = false;
      
      private var _userStarterVisible:Boolean = true;
      
      private var _oldMouseDown:Point;
      
      private var _assetStageOffset:int = -10;
      
      private var _uploadedSoundThumb:Thumb;
      
      private var _720238056_gettingAssets:Boolean = false;
      
      private var _204093661_loadingThemeStarter:Boolean;
      
      private var _461614585_loadingUserStarter:Boolean;
      
      private var _760754358_loadingUserBackground:Boolean;
      
      private var _957479112_loadingTeamBackground:Boolean;
      
      private var _1692675275_loadingTeamStarter:Boolean;
      
      private var _backgroundThumbFactory:ClassFactory;
      
      private var _backgroundLargeThumbFactory:ClassFactory;
      
      private var _22368616_useExtraLargeBackgroundThumbnails:Boolean;
      
      private var _oldThemeId:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ThumbTray()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._themeManager = ThemeManager.instance;
         this._tutorialManager = TutorialManager.instance;
         this._importerManager = ImporterManager.instance;
         this._characterCollectionLookup = {};
         this._1823316531_movieCharacterSource = new ArrayCollection();
         this._887474534_userCharacterSource = new ArrayCollection();
         this._36509533_commonSoundCollection = new SoundGroupCollection();
         this._222288294_bubbleSource = new ArrayCollection();
         this._1298423756_textComponentSource = new ArrayCollection();
         this._705846120_movieBubbleSource = new ArrayCollection();
         this._417104470_themeBackgroundCollection = new BackgroundExplorerCollection(true,true);
         this._1525190345_tutorialBackgroundCollection = new BackgroundExplorerCollection(true,true,false,true);
         this._715977530_movieBackgroundSource = new ArrayCollection();
         this._1476654645_themePropCollection = new PropExplorerCollection();
         this._1464653588_themeWidgetCollection = new WidgetExplorerCollection();
         this._1028707058_moviePropCollection = new PropExplorerCollection();
         this._844158218_themeEffectSource = new ArrayCollection();
         this._874648029_movieEffectSource = new ArrayCollection();
         this._oldMouseDown = new Point();
         this._backgroundThumbFactory = new ClassFactory(BackgroundThumbRenderer);
         this._backgroundLargeThumbFactory = new ClassFactory(BackgroundLargeThumbRenderer);
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ThumbTray_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ThumbTrayWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ThumbTray[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 310;
         this.percentHeight = 100;
         this.mxmlContent = [this._ThumbTray_Rect1_c(),this._ThumbTray_VGroup1_c(),this._ThumbTray_Line2_c(),this._ThumbTray_Line3_c(),this._ThumbTray_Group23_i()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.___ThumbTray_Group1_creationComplete);
         var _ThumbTray_CommunityPanel1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ThumbTray_CommunityPanel1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"school",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ThumbTray_CommunityPanel1_factory,
               "destination":"navigatorGroup",
               "position":"after",
               "relativeTo":["searchPanel"]
            })]
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
         ThumbTray._watcherSetupUtil = param1;
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
      
      private function get lastClickedThumb() : Thumb
      {
         return this._lastClickedThumb;
      }
      
      private function set lastClickedThumb(param1:Thumb) : void
      {
         this._lastClickedThumb = param1;
         setTimeout(this.flushLastClickedThumb,500);
      }
      
      private function flushLastClickedThumb() : void
      {
         this._lastClickedThumb = null;
      }
      
      private function themePropNotLoaded() : Boolean
      {
         return this._themePropCollection.totalProducts == 0;
      }
      
      public function get assetTheme() : String
      {
         return this._assetTheme;
      }
      
      public function set assetTheme(param1:String) : void
      {
         this._assetTheme = param1;
      }
      
      public function setLoadingStatus(param1:Boolean) : void
      {
         this.active = !param1;
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
         }
      }
      
      public function set themeBackgroundVisible(param1:Boolean) : void
      {
         if(this._themeBackgroundVisible != param1)
         {
            this._themeBackgroundVisible = param1;
            this.themeBackgroundPanel.enabled = param1;
            if(this.themeNavigator.selectedChild == this.themeBackgroundPanel)
            {
               this.themeNavigator.selectedChild = this.themeCharacterPanel;
            }
         }
      }
      
      public function set themeWidgetVisible(param1:Boolean) : void
      {
         if(this._themeWidgetVisible != param1)
         {
            this._themeWidgetVisible = param1;
            this.themeWidgetPanel.enabled = param1;
            if(this.themeNavigator.selectedChild == this.themeWidgetPanel)
            {
               this.themeNavigator.selectedChild = this.themeCharacterPanel;
            }
         }
      }
      
      public function get userStarterVisible() : Boolean
      {
         return this._userStarterVisible;
      }
      
      public function set userStarterVisible(param1:Boolean) : void
      {
         if(this._userStarterVisible != param1)
         {
            this._userStarterVisible = param1;
            if(!param1)
            {
               this._userAssetManager.backgroundSource.disableStarterCollection();
            }
         }
      }
      
      public function stopAllSounds() : void
      {
         SoundPlaybackManager.stop();
      }
      
      public function displayUserStarter() : void
      {
         if(this._assetTheme != ThumbTray.USER_THEME)
         {
            this._assetTheme = ThumbTray.USER_THEME;
            this.themeSelector.setThemeById("User");
            this.navigatorGroup.selectedChild = this.userContentGroup;
            this.onUserTabChange();
         }
      }
      
      private function onLoadThemeComplete(param1:Event) : void
      {
         var _loc2_:BackgroundCollection = null;
         var _loc3_:Theme = null;
         var _loc4_:String = null;
         var _loc5_:ThumbModel = null;
         var _loc6_:BackgroundThumb = null;
         UtilErrorLogger.getInstance().info("Tray theme ready: " + this.getCurrentThemeId());
         Console.getConsole().requestLoadStatus(false);
         if(this._assetTheme == COMMON_THEME)
         {
            this.onThemeTabChange();
            this._tutorialManager.notifyTutorialAction("theme_change_common");
         }
         if(this._themeBackgroundCollection.length > 0)
         {
            _loc3_ = ThemeManager.instance.currentTheme;
            if(_loc3_.thumbCategoryManager)
            {
               _loc4_ = _loc3_.thumbCategoryManager.getFirstFeatureCategoryKey();
               if(_loc4_)
               {
                  _loc2_ = this._themeBackgroundCollection.getCollectionByKey(_loc4_);
               }
            }
            if(!_loc2_)
            {
               _loc2_ = this._themeBackgroundCollection.getItemAt(0) as BackgroundCollection;
            }
            if(_loc2_)
            {
               _loc2_.sortProducts();
               _loc5_ = _loc2_.getItemAt(0) as ThumbModel;
               if(_loc5_ && _loc5_.thumb)
               {
                  _loc6_ = _loc5_.thumb as BackgroundThumb;
                  if(_loc6_.isStarter)
                  {
                     ThemeManager.instance.currentTheme.defaultBgThumb = _loc6_;
                  }
               }
            }
         }
         this.themeBackgroundVisible = ThemeManager.instance.currentTheme.numOfStarterPlusCompositeBackground() > 0;
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_ALL_THUMBS_COMPLETE,this));
      }
      
      public function initThumbTrayDefaultTab() : void
      {
         var _loc1_:AppConfigManager = AppConfigManager.instance;
         this.userCharacterPanel.enabled = _loc1_.getValue("has_asset_char") == "1";
         if(UtilUser.userType == UtilUser.BASIC_USER)
         {
            this.userVideoPanel.enabled = false;
         }
      }
      
      private function initThumbTray() : void
      {
         if(UtilSite.siteId == UtilSite.SKOLETUBE || UtilSite.siteId == UtilSite.SCHOOL)
         {
            currentState = "school";
         }
         this._userAssetManager = UserAssetManager.instance;
         this._userAssetManager.addEventListener(CoreEvent.USER_SOUND_COMPLETE,this.onUserSoundLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_SOUND_ADDED,this.onUserSoundAdded);
         this._userAssetManager.addEventListener(CoreEvent.USER_SOUND_REMOVED,this.onUserSoundRemoved);
         this._userAssetManager.addEventListener(CoreEvent.USER_PROP_COMPLETE,this.onUserPropLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_PROP_ADDED,this.onUserPropAdded);
         this._userAssetManager.addEventListener(CoreEvent.USER_PROP_REMOVED,this.onUserPropRemoved);
         this._userAssetManager.addEventListener(CoreEvent.USER_VIDEO_COMPLETE,this.onUserVideoLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_BUBBLE_COMPLETE,this.onUserBubbleLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_CHAR_COMPLETE,this.onUserCharacterLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_BACKGROUND_ADDED,this.onUserBackgroundAdded);
         this._userAssetManager.addEventListener(CoreEvent.USER_BACKGROUND_REMOVED,this.onUserBackgroundRemoved);
         this._userAssetManager.addEventListener(CoreEvent.USER_BACKGROUND_COMPLETE,this.onUserBackgroundLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_STARTER_COMPLETE,this.onUserStarterLoaded);
         this._userAssetManager.addEventListener(CoreEvent.USER_STARTER_ADDED,this.userAssetManager_userStarterAddedHandler);
         this._userSharedAssetManager = SharedAssetManager.userSharedInstance;
         this._userSharedAssetManager.addEventListener(CoreEvent.SHARED_BACKGROUND_COMPLETE,this.sharedAssetManager_loadBackgroundCompleteHandler);
         this._userSharedAssetManager.addEventListener(CoreEvent.SHARED_PROP_COMPLETE,this.sharedAssetManager_loadPropCompleteHandler);
         this._userSharedAssetManager.addEventListener(CoreEvent.SHARED_SOUND_COMPLETE,this.sharedAssetManager_loadSoundCompleteHandler);
         this._userSharedAssetManager.addEventListener(CoreEvent.SHARED_VIDEO_COMPLETE,this.sharedAssetManager_loadVideoCompleteHandler);
         this._userSharedAssetManager.addEventListener(CoreEvent.SHARED_BUBBLE_COMPLETE,this.sharedAssetManager_loadBubbleCompleteHandler);
         this._userSharedAssetManager.addEventListener(CoreEvent.SHARED_STARTER_COMPLETE,this.sharedAssetManager_loadStarterCompleteHandler);
         this._adminTeamAssetManager = SharedAssetManager.adminTeamInstance;
         this._adminTeamAssetManager.addEventListener(CoreEvent.SHARED_BACKGROUND_COMPLETE,this.sharedAssetManager_loadBackgroundCompleteHandler);
         this._adminTeamAssetManager.addEventListener(CoreEvent.SHARED_PROP_COMPLETE,this.sharedAssetManager_loadPropCompleteHandler);
         this._adminTeamAssetManager.addEventListener(CoreEvent.SHARED_SOUND_COMPLETE,this.sharedAssetManager_loadSoundCompleteHandler);
         this._adminTeamAssetManager.addEventListener(CoreEvent.SHARED_VIDEO_COMPLETE,this.sharedAssetManager_loadVideoCompleteHandler);
         this._adminTeamAssetManager.addEventListener(CoreEvent.SHARED_BUBBLE_COMPLETE,this.sharedAssetManager_loadBubbleCompleteHandler);
         this._adminTeamAssetManager.addEventListener(CoreEvent.SHARED_STARTER_COMPLETE,this.sharedAssetManager_loadStarterCompleteHandler);
         this._themeManager.addEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.onLoadThemeComplete);
         this.initThumbTrayDefaultTab();
         this._moviePropCollection.autoGrouping = false;
         this.userPropExplorer.hideInvalidCategories();
         this.userSoundExplorer.hideInvalidCategories();
         if(!UtilLicense.isSoundUploadable)
         {
            this.userNavigator.removeChild(this.userSoundPanel);
         }
         this.userStarterVisible = UtilUser.hasPlusFeatures();
         if(UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            this.userVideoPanel.enabled = false;
            this.userVideoPanel.includeInLayout = false;
         }
         if(!AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_CUSTOM_FONT))
         {
            this.userBubblePanel.enabled = false;
            this.userBubblePanel.includeInLayout = false;
         }
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this._tutorialManager.registerComponent("theme_char_explorer",this.themeCharacterExplorer);
         this._tutorialManager.registerComponent("theme_bg_explorer",this.themeBackgroundProductExplorer);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_STEP_START,this.tutorialManager_tutorialStepStartHandler);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_COMPLETE,this.tutorialManager_tutorialCompleteHandler);
         this._importerManager.addEventListener(ImporterEvent.IMPORTER_STATUS,this.onImporterStatus);
         this._importerManager.addEventListener(ImporterEvent.IMPORTER_ASSET_READY,this.onImporterAssetReady);
         this._importerManager.addEventListener(ImporterEvent.IMPORTER_ADD_ASSET,this.onImporterAddAsset);
         StudioFontManager.instance.addEventListener(FontEvent.FONT_FAMILY_USED,this.studioFontManager_fontFamilyUsedHandler);
         this._serverConnector = ServerConnector.instance;
         this._serverConnector.addEventListener(StudioEvent.OPEN_YOUR_LIBRARY,this.openYourLibrary);
         if(UtilUser.isContentAdmin)
         {
            this._showTextComponentCreationPanel = true;
         }
      }
      
      private function studioFontManager_fontFamilyUsedHandler(param1:FontEvent) : void
      {
         var _loc4_:BubbleThumb = null;
         var _loc6_:Object = null;
         var _loc2_:String = param1.fontId;
         var _loc3_:String = param1.themeId;
         var _loc5_:Theme = ThemeManager.instance.movieTheme;
         if(_loc3_ == ThemeConstants.UGC_THEME_ID)
         {
            _loc6_ = FontManager.CUSTOM_FONT_ID_REGEXP.exec(_loc2_);
            if(_loc6_)
            {
               _loc2_ = _loc6_[1];
            }
            _loc4_ = UserAssetManager.instance.createBubbleThumb(_loc2_);
         }
         else
         {
            _loc4_ = new BubbleThumb();
            _loc4_.id = _loc2_;
            _loc4_.aid = _loc2_;
            _loc4_.theme = _loc5_;
            _loc4_.enable = true;
            _loc4_.imageData = _loc4_.getDefaultBubbleBody(_loc2_);
         }
         _loc4_.type = "BLANK";
         if(_loc5_.isThumbExist(_loc4_))
         {
            return;
         }
         _loc5_.addThumb(_loc4_);
         this.addThumbToMovieTray(_loc4_);
      }
      
      private function onThemeTabBarRendererAdd(param1:RendererExistenceEvent) : void
      {
         var _loc4_:String = null;
         var _loc2_:UIComponent = param1.renderer as UIComponent;
         var _loc3_:int = this.themeTabBar.dataGroup.getElementIndex(_loc2_);
         if(param1.data == this.themeBackgroundPanel)
         {
            _loc4_ = "theme_bg_tab";
         }
         else if(param1.data == this.themeCharacterPanel)
         {
            _loc4_ = "theme_char_tab";
         }
         else if(param1.data == this.themeSoundPanel)
         {
            _loc4_ = "theme_sound_tab";
         }
         if(_loc4_)
         {
            this._tutorialManager.registerComponent(_loc4_,_loc2_);
         }
      }
      
      private function tutorialManager_tutorialStepStartHandler(param1:TutorialEvent) : void
      {
         switch(param1.tutorialId)
         {
            case TutorialManager.DEFAULT_TUTORIAL_ID:
               this.handleBasicTutorial(param1);
               break;
            case TutorialManager.NO_MOTION_TUTORIAL_ID:
               this.handleWithoutMotionTutorial(param1);
               break;
            case TutorialManager.STARTER_TUTORIAL_ID:
               this.handleStarterTutorial(param1);
         }
      }
      
      private function tutorialManager_tutorialCompleteHandler(param1:TutorialEvent) : void
      {
         if(param1.tutorialId == TutorialManager.STARTER_TUTORIAL_ID)
         {
            if(this.themeBackgroundExplorer.productProvider != this._themeBackgroundCollection)
            {
               this.themeBackgroundExplorer.productProvider = this._themeBackgroundCollection;
               this.themeBackgroundExplorer.displayNaturally();
            }
         }
      }
      
      private function handleBasicTutorial(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.data as String;
         switch(_loc2_)
         {
            case "change_common_theme":
               if(this._themeManager.isStaticTheme(this.defaultThemeId))
               {
                  this._tutorialManager.setFlag("static_theme");
               }
               this.themeSelector.setThemeById(this.defaultThemeId);
               this.doSwitchTheme(this.defaultThemeId);
               break;
            case "change_bg_tab":
               if(this.themeNavigator.selectedChild != this.themeBackgroundPanel)
               {
                  this.themeNavigator.selectedChild = this.themeBackgroundPanel;
               }
               this.onThemeTabChange();
         }
      }
      
      private function handleWithoutMotionTutorial(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.data as String;
         switch(_loc2_)
         {
            case "change_common_theme":
               if(this._themeManager.isStaticTheme(this.defaultThemeId))
               {
                  this._tutorialManager.setFlag("static_theme");
               }
               this.themeSelector.setThemeById(this.defaultThemeId);
               this.doSwitchTheme(this.defaultThemeId);
               break;
            case "change_bg_tab":
               if(this.themeNavigator.selectedChild != this.themeBackgroundPanel)
               {
                  this.themeNavigator.selectedChild = this.themeBackgroundPanel;
               }
               this.onThemeTabChange();
         }
      }
      
      private function handleStarterTutorial(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.data as String;
         switch(_loc2_)
         {
            case "change_common_theme":
               if(this._themeManager.isStaticTheme(this.defaultThemeId))
               {
                  this._tutorialManager.setFlag("static_theme");
               }
               this.themeSelector.setThemeById(this.defaultThemeId);
               this.doSwitchTheme(this.defaultThemeId);
               break;
            case "change_bg_tab":
               if(this.themeNavigator.selectedChild != this.themeBackgroundPanel)
               {
                  this.themeNavigator.selectedChild = this.themeBackgroundPanel;
               }
               this.onThemeTabChange();
               break;
            case SceneTemplateTutorial.STEP_ID_SHOW_TUTORIAL_BACKGROUND:
               this.themeBackgroundExplorer.productProvider = this._tutorialBackgroundCollection;
               this.themeBackgroundExplorer.displayNaturally();
               this._tutorialManager.notifyTutorialAction(SceneTemplateTutorial.EXPECTED_ACTION_SHOW_TUTORIAL_BACKGROUND);
               break;
            case "select_category":
               this.themeBackgroundExplorer.displayNaturally();
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._oldMouseDown.x = param1.stageX;
         this._oldMouseDown.y = param1.stageY;
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         var _loc3_:Thumb = null;
         var _loc4_:String = null;
         this.clearAllBackgroundThumbState();
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         var _loc2_:Console = Console.getConsole();
         if(Math.abs(this._oldMouseDown.x - param1.stageX) < 5 && Math.abs(this._oldMouseDown.y - param1.stageY) < 5)
         {
            if(_loc2_.currDragSource && _loc2_.currentScene)
            {
               _loc3_ = Thumb(_loc2_.currDragSource.dataForFormat(Thumb.DRAG_DATA_FORMAT));
               if(_loc3_ != this.lastClickedThumb)
               {
                  this.lastClickedThumb = _loc3_;
                  _loc4_ = "";
                  if(_loc2_.currDragSource.hasFormat("colorSetId"))
                  {
                     _loc4_ = String(_loc2_.currDragSource.dataForFormat("colorSetId"));
                  }
                  if(_loc3_ is TextComponentThumb)
                  {
                     _loc2_.currentScene.applyTextComponent(_loc3_ as TextComponentThumb);
                  }
                  else if(_loc3_.isStarter)
                  {
                     _loc2_.addStarter(_loc3_ as BackgroundThumb,_loc2_.currentSceneIndex);
                  }
                  else
                  {
                     this.addAssetToStage(_loc3_,_loc4_);
                  }
               }
            }
         }
         _loc2_.currDragSource = null;
      }
      
      private function addUserAssetToStage(param1:String, param2:String) : void
      {
         var _loc3_:ThumbModel = null;
         switch(param1)
         {
            case "bg":
               _loc3_ = this._userAssetManager.getBackgroundByAssetId(param2);
               break;
            case "prop":
               _loc3_ = this._userAssetManager.getPropByAssetId(param2);
               break;
            case "sound":
               _loc3_ = this._userAssetManager.getSoundByAssetId(param2);
               break;
            case "video":
               _loc3_ = this._userAssetManager.getVideoByAssetId(param2);
               break;
            case "font":
               _loc3_ = this._userAssetManager.getBubbleByAssetId(ThemeConstants.UGC_THEME_ID + "." + param2);
         }
         if(_loc3_ && _loc3_.thumb)
         {
            this.addAssetToStage(_loc3_.thumb);
         }
      }
      
      private function addUserAssetToFlowFrame(param1:FlowFrame, param2:String) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc3_:ThumbModel = this._userAssetManager.getPropByAssetId(param2);
         if(!_loc3_ || !_loc3_.thumb)
         {
            return;
         }
         var _loc4_:ICommand = new ChangeFlowFrameImageCommand(param1,_loc3_.thumb.themeId + "." + _loc3_.thumb.id);
         _loc4_.execute();
      }
      
      public function addAssetToStage(param1:Thumb, param2:String = "") : void
      {
         var _loc3_:Console = Console.getConsole();
         var _loc4_:MainStage = _loc3_.mainStage;
         var _loc5_:Point = _loc4_.zoomContainer.viewCenter;
         var _loc6_:Number = _loc3_.stageScale;
         this._assetStageOffset = this._assetStageOffset + 10;
         if(this._assetStageOffset > 10)
         {
            this._assetStageOffset = -10;
         }
         var _loc7_:Number = _loc5_.x - AnimeConstants.STAGE_PADDING + this._assetStageOffset / _loc6_;
         var _loc8_:Number = _loc5_.y - AnimeConstants.STAGE_PADDING;
         _loc7_ = Math.max(_loc7_,AnimeConstants.SCREEN_X);
         _loc7_ = Math.min(_loc7_,AnimeConstants.STAGE_WIDTH - AnimeConstants.SCREEN_X);
         _loc8_ = Math.max(_loc8_,AnimeConstants.SCREEN_Y);
         _loc8_ = Math.min(_loc8_,AnimeConstants.STAGE_HEIGHT - AnimeConstants.SCREEN_Y);
         _loc3_.currentScene.doCreateAsset(param1,_loc7_,_loc8_,param2);
      }
      
      public function switchTheme(param1:String) : void
      {
         this.stopAllSounds();
         this._assetTheme = param1;
         if(param1 == COMMON_THEME)
         {
            this._loadingThemeCC = true;
         }
         else if(param1 == USER_THEME)
         {
            this.onUserTabChange();
            dispatchEvent(new CoreEvent(CoreEvent.SWITCH_TO_USER_THEME_COMPLETE,this));
         }
         else if(param1 == TEAM_THEME)
         {
            this.onTeamTabChange();
            dispatchEvent(new CoreEvent(CoreEvent.SWITCH_TO_TEAM_THEME_COMPLETE,this));
         }
         else if(param1 == SHARED_THEME)
         {
            this.onSharedTabChange();
            dispatchEvent(new CoreEvent(CoreEvent.SWITCH_TO_SHARED_THEME_COMPLETE,this));
         }
         else if(param1 == COMMUNITY_THEME)
         {
            this.communityPanel.showPanel();
            dispatchEvent(new CoreEvent(CoreEvent.SWITCH_TO_COMMUNITY_THEME_COMPLETE,this));
         }
         else if(param1 == MOVIE_THEME)
         {
            this.onMovieTabChange();
            dispatchEvent(new CoreEvent(CoreEvent.SWITCH_TO_MOVIE_THEME_COMPLETE,this));
         }
         else if(param1 == CROSS_THEME_SEARCH)
         {
            this.searchPanel.init();
         }
      }
      
      public function loadCharThumbs(param1:Theme) : void
      {
         var _loc4_:CharThumb = null;
         var _loc2_:int = param1.charThumbs.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.charThumbs.getValueByIndex(_loc3_) as CharThumb;
            if(_loc4_.enable)
            {
               this.addCharThumbToTheme(_loc4_,"",true);
            }
            _loc3_++;
         }
      }
      
      private function addCharThumbToTheme(param1:Thumb, param2:String = "", param3:Boolean = true) : void
      {
         var _loc4_:ThumbModel = new ThumbModel(param1,param2);
         if(this._assetTheme == USER_THEME)
         {
            this.addCharacterThumbToUserLibrary(new ThumbModel(param1),true);
         }
         else if(this._assetTheme == MOVIE_THEME)
         {
            this.addCharacterThumbToMovieTray(new ThumbModel(param1));
         }
      }
      
      private function clearAllCharThumbs() : void
      {
      }
      
      private function loadBubbleThumbs() : void
      {
         if(this._bubbleSource.length == 0)
         {
            this.loadBubbleThumbsFromTheme(this._themeManager.commonTheme);
         }
      }
      
      private function loadBubbleThumbsFromTheme(param1:Theme) : void
      {
         var _loc3_:BubbleThumb = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.bubbleThumbs.length)
         {
            _loc3_ = BubbleThumb(param1.bubbleThumbs.getValueByIndex(_loc2_));
            if(_loc3_.enable)
            {
               this._bubbleSource.addItem(new ThumbModel(_loc3_));
            }
            _loc2_++;
         }
      }
      
      private function loadTextComponents() : void
      {
         var _loc1_:TextComponentManager = null;
         if(this._textComponentSource.length == 0)
         {
            _loc1_ = TextComponentManager.instance;
            if(_loc1_.textComponents)
            {
               this.loadTextComponentThumbs();
            }
            else
            {
               _loc1_.addEventListener(CoreEvent.TEXT_COMPONENT_LIST_LOADED,this.textComponentManager_textComponentListLoadedHandler);
               _loc1_.loadTextComponentList();
            }
         }
      }
      
      private function textComponentManager_textComponentListLoadedHandler(param1:CoreEvent) : void
      {
         var _loc2_:TextComponentManager = TextComponentManager.instance;
         _loc2_.removeEventListener(CoreEvent.TEXT_COMPONENT_LIST_LOADED,this.textComponentManager_textComponentListLoadedHandler);
         this.loadTextComponentThumbs();
      }
      
      private function loadTextComponentThumbs() : void
      {
         var _loc3_:Thumb = null;
         var _loc1_:TextComponentManager = TextComponentManager.instance;
         if(!_loc1_.textComponents)
         {
            return;
         }
         _loc1_.addEventListener(TextComponentEvent.TEXT_COMPONENT_DELETED,this.textComponentManager_textComponentDeletedHandler);
         var _loc2_:int = _loc1_.textComponents.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = _loc1_.textComponents[_loc4_] as Thumb;
            if(_loc3_)
            {
               this._textComponentSource.addItem(new ThumbModel(_loc3_));
            }
            _loc4_++;
         }
      }
      
      private function textComponentManager_textComponentDeletedHandler(param1:TextComponentEvent) : void
      {
         var _loc4_:ThumbModel = null;
         var _loc2_:TextComponentThumb = param1.thumb;
         var _loc3_:int = this._textComponentSource.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this._textComponentSource.getItemAt(_loc5_) as ThumbModel;
            if(_loc4_ && _loc4_.thumb && _loc4_.thumb.id == _loc2_.id)
            {
               this._textComponentSource.removeItemAt(_loc5_);
               break;
            }
            _loc5_++;
         }
      }
      
      public function loadPropThumbs(param1:Theme) : void
      {
         var _loc4_:Thumb = null;
         var _loc2_:int = param1.propThumbs.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.propThumbs.getValueByIndex(_loc3_) as Thumb;
            if(_loc4_.enable)
            {
               this.addPropThumbToTheme(_loc4_,_loc4_.firstColorSetId);
            }
            _loc3_++;
         }
      }
      
      private function addPropThumbToTheme(param1:Thumb, param2:String = "") : Boolean
      {
         var _loc3_:ThumbModel = new ThumbModel(param1,param2);
         var _loc4_:Boolean = true;
         if(this._assetTheme == COMMON_THEME)
         {
            if(param1 is WidgetThumb)
            {
               _loc4_ = this._themeWidgetCollection.addProduct(_loc3_);
            }
            else
            {
               _loc4_ = this._themePropCollection.addProduct(_loc3_);
            }
         }
         else if(this._assetTheme == MOVIE_THEME)
         {
            this.addPropThumbToMovieTray(_loc3_);
         }
         return _loc4_;
      }
      
      private function clearThemePropThumbs() : void
      {
         this._themePropReady = false;
         this._themePropCollection = new PropExplorerCollection();
         this._themeWidgetCollection = new WidgetExplorerCollection();
         this.themePropList.hideInvalidCategories();
      }
      
      public function loadBackgroundThumbs(param1:Theme, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BackgroundThumb = null;
         var _loc3_:int = param1.backgroundThumbs.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.backgroundThumbs.getValueByIndex(_loc4_) as BackgroundThumb;
            if(_loc5_.enable)
            {
               this.addBackgroundThumbToTheme(_loc5_,_loc5_.firstColorSetId,param2);
            }
            _loc4_++;
         }
         _loc3_ = param1.starterThumbs.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.starterThumbs.getValueByIndex(_loc4_) as BackgroundThumb;
            if(_loc5_.enable)
            {
               this._themeBackgroundCollection.addProduct(new ThumbModel(_loc5_),param2);
               this._tutorialBackgroundCollection.addProduct(new ThumbModel(_loc5_),param2);
            }
            _loc4_++;
         }
      }
      
      private function addBackgroundThumbToTheme(param1:Thumb, param2:String = "", param3:Boolean = false) : void
      {
         var _loc5_:ArrayCollection = null;
         var _loc4_:ThumbModel = new ThumbModel(param1,param2);
         switch(this._assetTheme)
         {
            case COMMON_THEME:
               this._themeBackgroundCollection.addProduct(_loc4_,true);
               this._tutorialBackgroundCollection.addProduct(_loc4_,true);
               break;
            case MOVIE_THEME:
               this.addBackgroundThumbToMovieTray(_loc4_);
         }
         if(_loc5_)
         {
            if(param3)
            {
               _loc5_.addItemAt(_loc4_,0);
            }
            else
            {
               _loc5_.addItem(_loc4_);
            }
         }
      }
      
      private function loadSoundThumbs(param1:Theme) : void
      {
         var _loc3_:SoundThumb = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.soundThumbs.length)
         {
            _loc3_ = param1.soundThumbs.getValueByIndex(_loc2_) as SoundThumb;
            if(_loc3_.enable && !_loc3_.isVariation)
            {
               this.addSoundTileCell(_loc3_);
            }
            _loc2_++;
         }
      }
      
      public function loadEffectThumbs(param1:Theme) : void
      {
         var _loc3_:EffectThumb = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.effectThumbs.length)
         {
            _loc3_ = EffectThumb(param1.effectThumbs.getValueByIndex(_loc2_));
            if(_loc3_.enable)
            {
               this.addEffectThumbToTheme(_loc3_);
            }
            _loc2_++;
         }
      }
      
      private function addEffectThumbToTheme(param1:EffectThumb) : void
      {
         if(param1.invisibleFX)
         {
            return;
         }
         var _loc2_:ThumbModel = new ThumbModel(param1);
         switch(this._assetTheme)
         {
            case COMMON_THEME:
               this._themeEffectSource.addItem(_loc2_);
               break;
            case MOVIE_THEME:
               this.addEffectThumbToMovieTray(_loc2_);
         }
      }
      
      private function clearAllEffectThumbs() : void
      {
         this._themeEffectSource.removeAll();
      }
      
      private function clearThemeBackgroundThumbs() : void
      {
         this._themeBackgroundCollection.removeAllProducts();
         this._tutorialBackgroundCollection.removeAllProducts();
      }
      
      public function set uploadedSoundThumb(param1:SoundThumb) : void
      {
         this._uploadedSoundThumb = param1;
      }
      
      public function addSoundTileCell(param1:SoundThumb, param2:Boolean = true) : void
      {
         var _loc4_:ArrayCollection = null;
         if(SOUND_BLOCKING_LIST.indexOf(param1.aid) > -1)
         {
            return;
         }
         if(this._uploadedSoundThumb && param1 && param1.id == this._uploadedSoundThumb.id)
         {
            return;
         }
         var _loc3_:ThumbModel = new ThumbModel(param1);
         if(this._assetTheme == COMMON_THEME)
         {
            this._commonSoundCollection.addProduct(_loc3_);
         }
      }
      
      private function addCommonSound(param1:SoundThumb) : void
      {
         this._commonSoundCollection.addProduct(new ThumbModel(param1));
      }
      
      private function clearThemeSoundThumbs() : void
      {
         this._commonSoundCollection.removeAllProducts();
      }
      
      public function clearTheme() : void
      {
         this.clearAllCharThumbs();
         this.clearAllEffectThumbs();
         this.clearThemeBackgroundThumbs();
         this.clearThemePropThumbs();
         this.clearThemeSoundThumbs();
      }
      
      private function openYourLibrary(param1:StudioEvent) : void
      {
         this._assetTheme = ThumbTray.USER_THEME;
         this.themeSelector.setThemeById("User");
         this.navigatorGroup.selectedChild = this.userContentGroup;
         this.onUserTabChange();
      }
      
      private function onImporterButtonClick(param1:MouseEvent) : void
      {
         ImporterManager.instance.showImporter();
      }
      
      private function onUserTabChange() : void
      {
         if(this._lastUserPanel && this._lastUserPanel != this.userNavigator.selectedChild)
         {
            this._lastUserPanel.clearNotification();
         }
         if(this.userNavigator.selectedChild == this.userCharacterPanel)
         {
            if(!this._userCharReady)
            {
               UserAssetManager.instance.loadCharacter();
            }
         }
         else if(this.userNavigator.selectedChild == this.userBackgroundPanel)
         {
            if(!this._userBackgroundReady)
            {
               this._loadingUserBackground = true;
               UserAssetManager.instance.loadBackground();
            }
            this.userBackgroundPanel.clearNotification();
         }
         else if(this.userNavigator.selectedChild == this.userPropPanel)
         {
            this._userAssetManager.loadPropIfNeeded();
            this.userPropPanel.clearNotification();
         }
         else if(this.userNavigator.selectedChild == this.userSoundPanel)
         {
            if(!this._userSoundReady)
            {
               UserAssetManager.instance.loadSound();
            }
            this.userSoundPanel.clearNotification();
         }
         else if(this.userNavigator.selectedChild == this.userVideoPanel)
         {
            if(!this._userVideoReady)
            {
               UserAssetManager.instance.loadVideo();
            }
            this.userVideoPanel.clearNotification();
         }
         else if(this.userNavigator.selectedChild == this.userBubblePanel)
         {
            if(!this._userBubbleReady)
            {
               UserAssetManager.instance.loadBubble();
            }
         }
         this._lastUserPanel = this.userNavigator.selectedChild as anifire.studio.components.NavigatorContent;
      }
      
      private function onTeamTabChange() : void
      {
         var _loc1_:SharedAssetManager = this.getCurrentSharedAssetManager();
         if(this.teamNavigator.selectedChild == this.teamBackgroundPanel)
         {
            if(!_loc1_.backgroundReady)
            {
               _loc1_.loadingBackground = true;
               _loc1_.loadBackground();
            }
         }
         else if(this.teamNavigator.selectedChild == this.teamPropPanel)
         {
            _loc1_.loadPropIfNeeded();
         }
         else if(this.teamNavigator.selectedChild == this.teamSoundPanel)
         {
            if(!_loc1_.soundReady)
            {
               _loc1_.loadSound();
            }
         }
         else if(this.teamNavigator.selectedChild == this.teamVideoPanel)
         {
            if(!_loc1_.videoReady)
            {
               _loc1_.loadVideo();
            }
         }
         else if(this.teamNavigator.selectedChild == this.teamBubblePanel)
         {
            if(!_loc1_.bubbleReady)
            {
               _loc1_.loadBubble();
            }
         }
         this._lastTeamPanel = this.teamNavigator.selectedChild as anifire.studio.components.NavigatorContent;
      }
      
      private function onSharedTabChange() : void
      {
         var _loc1_:SharedAssetManager = this.getCurrentSharedAssetManager();
         if(this.sharedNavigator.selectedChild == this.sharedBackgroundPanel)
         {
            if(!_loc1_.backgroundReady)
            {
               _loc1_.loadingBackground = true;
               _loc1_.loadBackground();
            }
         }
         else if(this.sharedNavigator.selectedChild == this.sharedPropPanel)
         {
            _loc1_.loadPropIfNeeded();
         }
         else if(this.sharedNavigator.selectedChild == this.sharedSoundPanel)
         {
            if(!_loc1_.soundReady)
            {
               _loc1_.loadSound();
            }
         }
         else if(this.sharedNavigator.selectedChild == this.sharedVideoPanel)
         {
            if(!_loc1_.videoReady)
            {
               _loc1_.loadVideo();
            }
         }
         else if(this.sharedNavigator.selectedChild == this.sharedBubblePanel)
         {
            if(!_loc1_.bubbleReady)
            {
               _loc1_.loadBubble();
            }
         }
         this._lastSharedPanel = this.sharedNavigator.selectedChild as anifire.studio.components.NavigatorContent;
      }
      
      private function onThemeTabChange() : void
      {
         var _loc1_:String = null;
         StudioManager.instance.closeSuggestionPopUp();
         if(this.themeNavigator.selectedChild == this.themeCharacterPanel)
         {
            this.onShowThemeCharacter();
            this._tutorialManager.notifyTutorialAction("theme_char_panel_select");
         }
         else if(this.themeNavigator.selectedChild == this.themeBubblePanel)
         {
            this.loadBubbleThumbs();
            this.loadTextComponents();
         }
         else if(this.themeNavigator.selectedChild == this.themeBackgroundPanel)
         {
            this.onShowThemeBackground();
            this._tutorialManager.notifyTutorialAction("theme_bg_panel_select");
         }
         else if(this.themeNavigator.selectedChild == this.themePropPanel)
         {
            this.onShowThemeProp();
         }
         else if(this.themeNavigator.selectedChild == this.themeWidgetPanel)
         {
            this.onShowThemeWidget();
         }
         else if(this.themeNavigator.selectedChild == this.themeSoundPanel)
         {
            if(this._commonSoundCollection.totalProducts == 0)
            {
               _loc1_ = ThemeManager.instance.currentTheme.id;
               if(_loc1_ != "common" || _loc1_ == "common" && UtilLicense.isCommonSoundShouldBeShown(_loc1_))
               {
                  this._commonSoundCollection.themeId = _loc1_;
                  this.loadSoundThumbs(ThemeManager.instance.currentTheme);
                  if(UtilLicense.isCommonSoundShouldBeShown(_loc1_))
                  {
                     this.loadSoundThumbs(this._themeManager.commonTheme);
                  }
                  this.commonSoundExplorer.displayNaturally();
               }
            }
            this._tutorialManager.notifyTutorialAction("theme_sound_panel_select");
         }
      }
      
      private function onMovieTabChange() : void
      {
         var _loc1_:Theme = this._themeManager.movieTheme;
         if(this.movieNavigator.selectedChild == this.movieCharacterPanel)
         {
            if(!this._movieCharacterReady)
            {
               this.loadCharThumbs(_loc1_);
               this._movieCharacterReady = true;
            }
         }
         else if(this.movieNavigator.selectedChild == this.movieBackgroundPanel)
         {
            if(!this._movieBackgroundReady)
            {
               this.loadBackgroundThumbs(_loc1_);
               this._movieBackgroundReady = true;
            }
         }
         else if(this.movieNavigator.selectedChild == this.moviePropPanel)
         {
            if(!this._moviePropReady)
            {
               this.loadPropThumbs(_loc1_);
               this._movieEffectReady = true;
            }
            this.moviePropExplorer.hideInvalidCategories();
            this.moviePropExplorer.displayNaturally();
         }
         else if(this.movieNavigator.selectedChild == this.movieEffectPanel)
         {
            if(!this._movieEffectReady)
            {
               this.loadEffectThumbs(_loc1_);
               this._movieEffectReady = true;
            }
         }
         else if(this.movieNavigator.selectedChild == this.movieBubblePanel)
         {
            this.loadBubbleThumbs();
         }
      }
      
      public function initThemeDropdown(param1:String) : void
      {
         var _loc2_:Number = NaN;
         var _loc8_:XML = null;
         var _loc9_:UtilHashArray = null;
         var _loc3_:XML = Console.getConsole().themeListXML;
         var _loc4_:Array = new Array();
         var _loc5_:UtilHashArray = new UtilHashArray();
         var _loc6_:int = 0;
         var _loc7_:Array = new Array();
         _loc2_ = 0;
         while(_loc2_ < _loc3_.child("theme").length())
         {
            _loc8_ = _loc3_.child("theme")[_loc2_];
            if(_loc8_.attribute("id") != "common")
            {
               if(_loc8_.hasOwnProperty("@cc_theme_id") && _loc8_.@cc_theme_id != "")
               {
                  _loc4_.unshift({
                     "label":_loc8_.attribute("name"),
                     "data":_loc8_.attribute("id")
                  });
                  _loc9_ = new UtilHashArray();
                  _loc9_.push(_loc8_.attribute("id"),_loc8_.attribute("name"));
                  _loc5_.insert(0,_loc9_);
                  _loc6_++;
               }
               else
               {
                  _loc4_.push({
                     "label":_loc8_.attribute("name"),
                     "data":_loc8_.attribute("id")
                  });
                  _loc5_.push(_loc8_.attribute("id"),_loc8_.attribute("name"));
               }
               _loc7_.push({
                  "id":String(_loc8_.attribute("id")),
                  "label":String(_loc8_.attribute("name"))
               });
            }
            _loc2_++;
         }
         this.themeSelector.buildMenu(_loc5_,_loc6_);
         ThemeManager.instance.themeList = _loc7_;
      }
      
      public function getCurrentThemeId() : String
      {
         return this.themeSelector.currentThemeId;
      }
      
      private function onThemeCharacterInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         if(this.themeCharacterExplorer.selectedCollection == this._themeCharacterCollection.userCharacters && this._themeCharacterCollection.hasMore)
         {
            this._loadingThemeCC = true;
            this._themeCharacterCollection.addEventListener(ProductGroupCollectionEvent.THEME_CHAR_COMPLETE,this.onUserCCLoaded);
            this._themeCharacterCollection.loadNextPage();
         }
      }
      
      private function onUserCharacterInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         if(!this._gettingAssets)
         {
            _loc2_ = AnimeConstants.ASSET_TYPE_CHAR;
            _loc3_ = this._userAssetManager.hasMoreCharacter;
            if(_loc3_)
            {
               this._gettingAssets = true;
               UserAssetManager.instance.loadCharacter();
            }
         }
      }
      
      private function onUserBackgroundInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         if(this._gettingAssets || this.userBackgroundExplorer.isSearching)
         {
            return;
         }
         if(this.userBackgroundExplorer.selectedCollection.categoryName == BackgroundExplorerCollection.COLLECTION_NAME_STARTER)
         {
            if(this._userAssetManager.hasMoreStarter)
            {
               this._gettingAssets = true;
               this._loadingUserStarter = true;
               this._userAssetManager.loadStarter();
            }
         }
         else if(this.userBackgroundExplorer.selectedCollection.categoryName == BackgroundExplorerCollection.COLLECTION_NAME_BACKDROP)
         {
            if(this._userAssetManager.hasMoreBackground)
            {
               this._gettingAssets = true;
               this._loadingUserBackground = true;
               this._userAssetManager.loadBackground();
            }
         }
      }
      
      private function onSharedBackgroundInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         var _loc2_:SharedAssetManager = this.getCurrentSharedAssetManager();
         var _loc3_:ProductExplorer = this.getCurrentProductExplorer(PRODUCT_EXPLORER_BACKGROUND);
         if(this._gettingAssets || _loc3_.isSearching)
         {
            return;
         }
         if(_loc3_.selectedCollection.categoryName == BackgroundExplorerCollection.COLLECTION_NAME_STARTER)
         {
            if(_loc2_.hasMoreStarter)
            {
               this._gettingAssets = true;
               _loc2_.loadingStarter = true;
               _loc2_.loadStarter();
            }
         }
         else if(_loc3_.selectedCollection.categoryName == BackgroundExplorerCollection.COLLECTION_NAME_BACKDROP)
         {
            if(_loc2_.hasMoreBackground)
            {
               this._gettingAssets = true;
               _loc2_.loadingBackground = true;
               _loc2_.loadBackground();
            }
         }
      }
      
      private function onUserPropInfiniteScroll() : void
      {
         if(!this._gettingAssets && this._userAssetManager.hasMoreProp)
         {
            this._gettingAssets = true;
            this._userAssetManager.loadProp();
         }
      }
      
      private function onSharedPropInfiniteScroll() : void
      {
         var _loc1_:SharedAssetManager = this.getCurrentSharedAssetManager();
         if(!this._gettingAssets && _loc1_.hasMoreProp)
         {
            this._gettingAssets = true;
            _loc1_.loadProp();
         }
      }
      
      private function onUserPropLoaded(param1:CoreEvent) : void
      {
         this.userPropExplorer.hideInvalidCategories();
         this.userPropExplorer.selectProperCategoryIfNoSelection();
         this._hasMoreUserProp = this._userAssetManager.hasMoreProp;
         this._gettingAssets = false;
      }
      
      private function onUserPropAdded(param1:CoreEvent) : void
      {
         this.userPropExplorer.hideInvalidCategories();
         this.userPropExplorer.selectProperCategoryIfNoSelection();
      }
      
      private function onUserPropRemoved(param1:CoreEvent) : void
      {
         this.userPropExplorer.selectProperCateogryIfCurrentIsEmpty();
      }
      
      private function onUserVideoLoaded(param1:CoreEvent) : void
      {
         this._gettingAssets = false;
         this._userVideoReady = true;
      }
      
      private function onUserBubbleLoaded(param1:CoreEvent) : void
      {
         this._gettingAssets = false;
         this._userBubbleReady = true;
      }
      
      private function onVideoPropInfiniteScroll(param1:InfiniteScrollEvent) : void
      {
         var _loc2_:String = null;
         if(!this._gettingAssets)
         {
            if(UserAssetManager.instance.hasMoreVideo)
            {
               this._gettingAssets = true;
               _loc2_ = AnimeConstants.ASSET_TYPE_PROP_VIDEO;
               UserAssetManager.instance.loadVideo();
            }
         }
      }
      
      private function onUserSoundInfiniteScroll() : void
      {
         if(!this._gettingAssets)
         {
            this._gettingAssets = true;
            UserAssetManager.instance.loadSound();
         }
      }
      
      private function onSharedSoundInfiniteScroll() : void
      {
         if(!this._gettingAssets)
         {
            this._gettingAssets = true;
            this._userSharedAssetManager.loadSound();
         }
      }
      
      private function onUserSoundAdded(param1:CoreEvent) : void
      {
         this.userSoundExplorer.hideInvalidCategories();
         this.userSoundExplorer.selectProperCategoryIfNoSelection();
      }
      
      private function onUserSoundRemoved(param1:CoreEvent) : void
      {
         this.userSoundExplorer.selectProperCateogryIfCurrentIsEmpty();
      }
      
      private function onUserSoundLoaded(param1:CoreEvent) : void
      {
         this.userSoundExplorer.hideInvalidCategories();
         if(!this._userSoundReady)
         {
            this._userSoundReady = true;
            this.userSoundExplorer.displayNaturally();
         }
         this._hasMoreUserSound = this._userAssetManager.hasMoreSound;
         this._gettingAssets = false;
      }
      
      private function onUserCharacterLoaded(param1:CoreEvent) : void
      {
         this._hasMoreUserCharacter = this._userAssetManager.hasMoreCharacter;
         this._gettingAssets = false;
      }
      
      private function onUserBackgroundAdded(param1:CoreEvent) : void
      {
         this.userBackgroundExplorer.hideInvalidCategories();
         this.userBackgroundExplorer.selectProperCategoryIfNoSelection();
      }
      
      private function onUserBackgroundRemoved(param1:CoreEvent) : void
      {
         this.userBackgroundExplorer.selectProperCateogryIfCurrentIsEmpty();
      }
      
      private function onUserBackgroundLoaded(param1:CoreEvent) : void
      {
         this.userBackgroundExplorer.hideInvalidCategories();
         if(!this._userBackgroundReady)
         {
            this._userBackgroundReady = true;
            this.userBackgroundExplorer.displayNaturally();
         }
         this._loadingUserBackground = false;
         this._gettingAssets = false;
      }
      
      private function onUserStarterLoaded(param1:CoreEvent) : void
      {
         this._userStarterReady = true;
         this._loadingUserStarter = false;
         this._gettingAssets = false;
      }
      
      private function userAssetManager_userStarterAddedHandler(param1:CoreEvent) : void
      {
         this.userBackgroundPanel.addNotification();
      }
      
      private function onThemeStarterLoaded(param1:CoreEvent) : void
      {
         this._loadingThemeStarter = false;
         this._gettingAssets = false;
      }
      
      public function disallowUploadedAssets() : void
      {
      }
      
      public function getThemeCharacterCollection(param1:String) : CharacterExplorerCollection
      {
         var _loc2_:Theme = this._themeManager.getTheme(param1);
         if(!(_loc2_ && _loc2_.id != "ugc"))
         {
            return null;
         }
         var _loc3_:CharacterExplorerCollection = this._characterCollectionLookup[_loc2_.id];
         if(!_loc3_)
         {
            _loc3_ = this.createThemeCharacterCollection(_loc2_);
         }
         return _loc3_;
      }
      
      private function createThemeCharacterCollection(param1:Theme) : CharacterExplorerCollection
      {
         var _loc5_:CharThumb = null;
         var _loc6_:ThumbModel = null;
         var _loc2_:CharacterExplorerCollection = new CharacterExplorerCollection(param1);
         var _loc3_:int = param1.charThumbs.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.charThumbs.getValueByIndex(_loc4_) as CharThumb;
            if(_loc5_.enable)
            {
               _loc6_ = new ThumbModel(_loc5_,_loc5_.firstColorSetId);
               _loc6_.isStoreCharacter = true;
               _loc2_.addProduct(_loc6_);
            }
            _loc4_++;
         }
         _loc2_.sortByCategoryName();
         this._characterCollectionLookup[param1.id] = _loc2_;
         return _loc2_;
      }
      
      private function onShowThemeCharacter() : void
      {
         var _loc1_:Theme = this._themeManager.currentTheme;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:CharacterExplorerCollection = this._characterCollectionLookup[_loc1_.id];
         var _loc3_:Boolean = _loc2_ != this._themeCharacterCollection || !_loc2_;
         if(!_loc2_)
         {
            _loc2_ = this.createThemeCharacterCollection(_loc1_);
         }
         this._themeCharacterCollection = _loc2_;
         this.themeCharacterExplorer.hideInvalidCategories();
         if(_loc1_.ccThemeId && this._themeCharacterCollection.nextUserCharacterPage == 0)
         {
            this._loadingThemeCC = true;
            this._themeCharacterCollection.addEventListener(ProductGroupCollectionEvent.THEME_CHAR_COMPLETE,this.onUserCCLoaded);
            this._themeCharacterCollection.loadNextPage();
         }
         else
         {
            this._loadingThemeCC = false;
            if(_loc3_)
            {
               this.themeCharacterExplorer.displayNaturally();
            }
         }
      }
      
      private function onUserCCLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.currentTarget).removeEventListener(ProductGroupCollectionEvent.THEME_CHAR_COMPLETE,this.onUserCCLoaded);
         this._loadingThemeCC = false;
         this.themeCharacterExplorer.displayNaturally();
      }
      
      private function onShowThemeBackground() : void
      {
         if(this._themeBackgroundCollection.totalProducts > 0)
         {
            return;
         }
         var _loc1_:Theme = this._themeManager.currentTheme;
         if(this._themeManager.useExtraLargeBackgroundThumbnails(_loc1_.id))
         {
            this._useExtraLargeBackgroundThumbnails = true;
         }
         else
         {
            this.themeBackgroundProductExplorer.setStyle("skinClass",SimpleProductExplorerSkin);
            this.themeBackgroundProductExplorer.productRenderer = this._backgroundThumbFactory;
            this._useExtraLargeBackgroundThumbnails = false;
         }
         this._tutorialManager.registerComponent("theme_bg_explorer",this.themeBackgroundProductExplorer);
         this._tutorialManager.registerComponent(SceneTemplateTutorial.COMPONENT_ID_BACKGROUND_EXPLORER_PRODUCT_LIST,this.themeBackgroundExplorer.productList);
         this._themeBackgroundCollection.themeId = _loc1_.id;
         this.loadBackgroundThumbs(_loc1_);
         if(_loc1_.shouldLoadCommonAsset)
         {
            this.loadBackgroundThumbs(this._themeManager.commonTheme);
         }
         if(ThemeConstants.isThumbCategorySupported(_loc1_.id))
         {
            this._themeBackgroundCollection.useCustomCategorySort();
            this._tutorialBackgroundCollection.useCustomCategorySort();
            this._themeBackgroundCollection.sortByCategoryName();
            this._tutorialBackgroundCollection.sortByCategoryName();
            this._themeBackgroundCollection.searchResult.starterOnly = true;
            this.themeBackgroundExplorer.displayNaturallyWithCategoryName(DEFAULT_BACKGROUND_CATEGORY);
         }
         else
         {
            this._themeBackgroundCollection.sortByCategoryName();
            this._tutorialBackgroundCollection.sortByCategoryName();
            this._themeBackgroundCollection.searchResult.starterOnly = false;
            this.themeBackgroundExplorer.displayNaturally();
         }
      }
      
      private function initThemePropSource() : void
      {
         var _loc1_:Theme = null;
         if(!this._themePropReady)
         {
            _loc1_ = this._themeManager.currentTheme;
            this._themePropCollection.themeId = _loc1_.id;
            this.loadPropThumbs(_loc1_);
            if(_loc1_.shouldLoadCommonAsset)
            {
               this.loadPropThumbs(this._themeManager.commonTheme);
            }
            this.themePropList.displayNaturally();
            this.themeWidgetList.selectedCollection = this._themeWidgetCollection.widgets;
            this._themePropReady = true;
         }
      }
      
      private function onShowThemeProp() : void
      {
         this.initThemePropSource();
         this._themePropCollection.sortByCategoryName();
      }
      
      private function onShowThemeWidget() : void
      {
         this.initThemePropSource();
      }
      
      public function initThemeChosenById(param1:String) : void
      {
         this.themeSelector.setThemeById(param1,true);
         this.doSwitchTheme(param1);
      }
      
      private function onThemeChosen(param1:ThemeChangeEvent) : void
      {
         this.doSwitchTheme(param1.themeId,true);
      }
      
      private function filterPropByThemeId(param1:String) : void
      {
         var _loc2_:Boolean = true;
         var _loc3_:Boolean = true;
         var _loc4_:Boolean = true;
         if(Console.getConsole().siteId != "0")
         {
            _loc3_ = false;
         }
         if(param1 == ThemeConstants.POLITIC_2_THEME_ID || param1 == ThemeConstants.BUSINESS_THEME_ID || param1 == ThemeConstants.STICKLY_BIZ_THEME_ID || param1 == ThemeConstants.SPACE_CITIZEN_THEME_ID || param1 == ThemeConstants.BIZ_MODEL_THEME_ID)
         {
            _loc3_ = false;
            _loc4_ = false;
         }
         if(param1 == ThemeConstants.BUSINESS_THEME_ID || param1 == ThemeConstants.STICKLY_BIZ_THEME_ID || param1 == ThemeConstants.BIZ_MODEL_THEME_ID)
         {
            _loc2_ = false;
         }
         if(Console.getConsole().isThemeCcRelated(param1))
         {
            _loc3_ = false;
            _loc4_ = false;
         }
         this._themePropCollection.filterPropCategory(_loc2_,_loc4_,_loc3_);
      }
      
      public function doSwitchTheme(param1:String, param2:Boolean = false) : void
      {
         if(param1 == MOVIE_THEME)
         {
            this.navigatorGroup.selectedChild = this.movieContentGroup;
            this.switchTheme(MOVIE_THEME);
         }
         else if(param1 == ThemeConstants.USER_THEME_ID)
         {
            this.navigatorGroup.selectedChild = this.userContentGroup;
            this.switchTheme(USER_THEME);
         }
         else if(param1 == ThemeConstants.TEAM_THEME_ID)
         {
            this.navigatorGroup.selectedChild = this.teamContentGroup;
            this.switchTheme(TEAM_THEME);
         }
         else if(param1 == ThemeConstants.SHARED_THEME_ID)
         {
            this.navigatorGroup.selectedChild = this.sharedContentGroup;
            this.switchTheme(SHARED_THEME);
         }
         else if(param1 == ThemeConstants.COMMUNITY_THEME_ID)
         {
            this.navigatorGroup.selectedChild = this.communityPanel;
            this.switchTheme(COMMUNITY_THEME);
         }
         else if(param1 == CROSS_THEME_SEARCH)
         {
            this.navigatorGroup.selectedChild = this.searchPanel;
            this.switchTheme(CROSS_THEME_SEARCH);
         }
         else
         {
            this._oldThemeId = param1;
            this.assetTheme = COMMON_THEME;
            this.clearTheme();
            this.filterPropByThemeId(param1);
            this.navigatorGroup.selectedChild = this.themeContentGroup;
            this.switchTheme(COMMON_THEME);
            this._useSearchSuggestion = this._themeManager.supportSearchSuggestion(param1);
            this.themeCharacterExplorer.searchInputVisible = this._themeManager.supportCharacterSearch(param1);
            if(param2)
            {
               Console.getConsole().requestLoadStatus(true);
            }
            this._themeManager.loadTheme(param1,false);
         }
         this.themeWidgetVisible = param1 == ThemeConstants.INFOGRAPHICS_THEME_ID || param1 == ThemeConstants.BUSINESS_THEME_ID;
         this._hasTemplates = ThemeConstants.isThumbCategorySupported(param1);
         this._showTextComponentList = UtilSite.isGoAnimate && param1 == ThemeConstants.BUSINESS_THEME_ID;
      }
      
      public function addThumbToMovieTray(param1:Thumb) : void
      {
         var _loc2_:ThumbModel = new ThumbModel(param1);
         if(param1 is CharThumb)
         {
            this.addCharacterThumbToMovieTray(_loc2_);
         }
         else if(param1 is PropThumb)
         {
            this.addPropThumbToMovieTray(_loc2_);
         }
         else if(param1 is BackgroundThumb)
         {
            this.addBackgroundThumbToMovieTray(_loc2_);
         }
         else if(param1 is BubbleThumb)
         {
            this.addBubbleThumbToMovieTray(_loc2_);
         }
         else if(param1 is EffectThumb)
         {
            this.addEffectThumbToMovieTray(_loc2_);
         }
         else if(param1 is SoundThumb)
         {
         }
      }
      
      private function addCharacterThumbToUserLibrary(param1:ThumbModel, param2:Boolean = false) : void
      {
         var _loc3_:int = !!param2?int(this._userCharacterSource.length):0;
         param1.thumb.editable = true;
         this._userCharacterSource.addItemAt(param1,_loc3_);
      }
      
      private function addCharacterThumbToMovieTray(param1:ThumbModel) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc2_:int = this._movieCharacterSource.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this._movieCharacterSource.getItemAt(_loc4_) as ThumbModel;
            if(_loc3_.id == param1.id)
            {
               return;
            }
            _loc4_++;
         }
         param1.editable = false;
         param1.copyable = (param1.thumb as CharThumb).ccThemeId != ThemeConstants.SPACE_CITIZEN_THEME_ID;
         this._movieCharacterSource.addItemAt(param1,0);
      }
      
      private function addBackgroundThumbToMovieTray(param1:ThumbModel) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc2_:int = this._movieBackgroundSource.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this._movieBackgroundSource.getItemAt(_loc4_) as ThumbModel;
            if(_loc3_.id == param1.id)
            {
               return;
            }
            _loc4_++;
         }
         param1.editable = false;
         this._movieBackgroundSource.addItemAt(param1,0);
      }
      
      private function addBubbleThumbToMovieTray(param1:ThumbModel) : void
      {
         var _loc3_:ThumbModel = null;
         var _loc2_:int = this._movieBubbleSource.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this._movieBubbleSource.getItemAt(_loc4_) as ThumbModel;
            if(_loc3_.id == param1.id)
            {
               return;
            }
            _loc4_++;
         }
         param1.editable = false;
         this._movieBubbleSource.addItemAt(param1,0);
      }
      
      private function addPropThumbToMovieTray(param1:ThumbModel) : void
      {
         if(this._moviePropCollection.containsProduct(param1))
         {
            return;
         }
         param1.editable = false;
         this._moviePropCollection.addProduct(param1,false);
         this.moviePropExplorer.hideInvalidCategories();
         this.moviePropExplorer.selectProperCategoryIfNoSelection();
      }
      
      private function addEffectThumbToMovieTray(param1:ThumbModel) : void
      {
         var _loc3_:ThumbModel = null;
         if((param1.thumb as EffectThumb).invisibleFX)
         {
            return;
         }
         var _loc2_:int = this._movieEffectSource.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this._movieEffectSource.getItemAt(_loc4_) as ThumbModel;
            if(_loc3_.id == param1.id)
            {
               return;
            }
            _loc4_++;
         }
         param1.editable = false;
         this._movieEffectSource.addItemAt(param1,0);
      }
      
      private function onImporterStatus(param1:ImporterEvent) : void
      {
         this.importerButton.status = param1.status;
      }
      
      private function onImporterAssetReady(param1:ImporterEvent) : void
      {
         switch(param1.assetType)
         {
            case "bg":
               this.userBackgroundPanel.addNotification();
               break;
            case "prop":
               this.userPropPanel.addNotification();
               break;
            case "sound":
               this.userSoundPanel.addNotification();
               break;
            case "video":
               this.userVideoPanel.addNotification();
               break;
            case "font":
               this.userBubblePanel.addNotification();
         }
      }
      
      private function onImporterAddAsset(param1:ImporterEvent) : void
      {
         if(StudioStatusManager.instance.isBusy)
         {
            return;
         }
         var _loc2_:AnimeScene = Console.getConsole().currentScene;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:FlowFrame = _loc2_.selectedAsset as FlowFrame;
         if(_loc3_ && param1.assetType == AnimeConstants.ASSET_TYPE_PROP)
         {
            this.addUserAssetToFlowFrame(_loc3_,param1.assetId);
         }
         else
         {
            this.addUserAssetToStage(param1.assetType,param1.assetId);
         }
      }
      
      protected function themePropList_productSearchedHandler(param1:ProductExplorerEvent) : void
      {
         var _loc2_:String = this.themePropList.lastSearchKeyword;
         if(_loc2_)
         {
            AnalyticsManager.instance.trackEventByUserGroup(AnalyticsManager.EVENT_ACTION_SEARCH_PROP,_loc2_.toLowerCase());
         }
      }
      
      protected function themeCharacterExplorer_productSearchStartHandler(param1:ProductExplorerEvent) : void
      {
         var _loc2_:String = this.themeCharacterExplorer.lastSearchKeyword;
         if(_loc2_)
         {
            AnalyticsManager.instance.trackEventByUserGroup(AnalyticsManager.EVENT_ACTION_SEARCH_CHARACTER,_loc2_.toLowerCase());
         }
      }
      
      protected function commonSoundExplorer_productSearchStartHandler(param1:ProductExplorerEvent) : void
      {
         var _loc2_:String = this.commonSoundExplorer.lastSearchKeyword;
         if(_loc2_)
         {
            AnalyticsManager.instance.trackEventByUserGroup(AnalyticsManager.EVENT_ACTION_SEARCH_SOUND,_loc2_.toLowerCase());
         }
      }
      
      protected function userBackgroundExplorer_productCategoryChangedHandler(param1:ProductExplorerEvent) : void
      {
         if(param1.collection.categoryName == BackgroundExplorerCollection.COLLECTION_NAME_STARTER)
         {
            if(!this._userStarterReady)
            {
               this._loadingUserStarter = true;
               UserAssetManager.instance.loadStarter();
            }
         }
      }
      
      protected function isInSharedTheme() : Boolean
      {
         return this.navigatorGroup.selectedChild == this.sharedContentGroup;
      }
      
      public function isInTeamTheme() : Boolean
      {
         return this.navigatorGroup.selectedChild == this.teamContentGroup;
      }
      
      protected function getCurrentProductExplorer(param1:String) : ProductExplorer
      {
         var _loc2_:Boolean = false;
         if(this.isInTeamTheme())
         {
            _loc2_ = true;
         }
         else if(this.isInSharedTheme())
         {
            _loc2_ = false;
         }
         else
         {
            return null;
         }
         switch(param1)
         {
            case PRODUCT_EXPLORER_PROP:
               return !!_loc2_?this.teamPropExplorer:this.sharedPropExplorer;
            case PRODUCT_EXPLORER_SOUND:
               return !!_loc2_?this.teamSoundExplorer:this.sharedSoundExplorer;
            case PRODUCT_EXPLORER_BACKGROUND:
               return !!_loc2_?this.teamBackgroundExplorer:this.sharedBackgroundExplorer;
            default:
               return null;
         }
      }
      
      private function sharedAssetManager_loadBackgroundCompleteHandler(param1:CoreEvent) : void
      {
         var _loc2_:SharedAssetManager = this.getCurrentSharedAssetManager();
         var _loc3_:ProductExplorer = this.getCurrentProductExplorer(PRODUCT_EXPLORER_BACKGROUND);
         _loc3_.hideInvalidCategories();
         if(!_loc2_.backgroundReady)
         {
            _loc2_.backgroundReady = true;
            _loc3_.displayNaturally();
         }
         _loc2_.loadingBackground = false;
         this._gettingAssets = false;
      }
      
      private function sharedAssetManager_loadStarterCompleteHandler(param1:CoreEvent) : void
      {
         var _loc2_:SharedAssetManager = this.getCurrentSharedAssetManager();
         _loc2_.starterReady = true;
         _loc2_.loadingStarter = false;
         this._gettingAssets = false;
      }
      
      private function sharedAssetManager_loadPropCompleteHandler(param1:CoreEvent) : void
      {
         var _loc2_:ProductExplorer = this.getCurrentProductExplorer(PRODUCT_EXPLORER_PROP);
         _loc2_.hideInvalidCategories();
         _loc2_.selectProperCategoryIfNoSelection();
         this._gettingAssets = false;
      }
      
      private function sharedAssetManager_loadSoundCompleteHandler(param1:CoreEvent) : void
      {
         var _loc2_:SharedAssetManager = this.getCurrentSharedAssetManager();
         var _loc3_:ProductExplorer = this.getCurrentProductExplorer(PRODUCT_EXPLORER_SOUND);
         _loc3_.hideInvalidCategories();
         if(!_loc2_.soundReady)
         {
            _loc2_.soundReady = true;
            _loc3_.displayNaturally();
         }
         this._gettingAssets = false;
      }
      
      private function sharedAssetManager_loadVideoCompleteHandler(param1:CoreEvent) : void
      {
         this._gettingAssets = false;
      }
      
      private function sharedAssetManager_loadBubbleCompleteHandler(param1:CoreEvent) : void
      {
         this._gettingAssets = false;
      }
      
      protected function getCurrentSharedAssetManager() : SharedAssetManager
      {
         if(this.isInTeamTheme())
         {
            return this._adminTeamAssetManager;
         }
         if(this.isInSharedTheme())
         {
            return this._userSharedAssetManager;
         }
         return null;
      }
      
      protected function sharedBackgroundExplorer_productCategoryChangedHandler(param1:ProductExplorerEvent) : void
      {
         var _loc2_:SharedAssetManager = this.getCurrentSharedAssetManager();
         if(param1.collection.categoryName == BackgroundExplorerCollection.COLLECTION_NAME_STARTER)
         {
            if(!_loc2_.starterReady)
            {
               _loc2_.loadingStarter = true;
               _loc2_.loadStarter();
            }
         }
      }
      
      protected function themeBackgroundExplorer_creationCompleteHandler(param1:FlexEvent) : void
      {
         this._tutorialManager.registerComponent(SceneTemplateTutorial.COMPONENT_ID_BACKGROUND_EXPLORER_PRODUCT_LIST,this.themeBackgroundExplorer.productList);
      }
      
      protected function commonSoundExplorer_creationCompleteHandler(param1:FlexEvent) : void
      {
         this._tutorialManager.registerComponent(SceneTemplateTutorial.COMPONENT_ID_SOUND_EXPLORER_PRODUCT_LIST,this.commonSoundExplorer.productList);
      }
      
      private function get themeBackgroundExplorer() : ProductExplorer
      {
         if(this._useExtraLargeBackgroundThumbnails)
         {
            return this.themeCategorizedBackgroundProductExplorer;
         }
         return this.themeBackgroundProductExplorer;
      }
      
      public function selectBackgroundTab() : void
      {
         switch(this.navigatorGroup.selectedChild)
         {
            case this.themeContentGroup:
               if(this.themeBackgroundPanel.enabled)
               {
                  this.themeNavigator.selectedChild = this.themeBackgroundPanel;
               }
               break;
            case this.userContentGroup:
               if(this.userBackgroundPanel.enabled)
               {
                  this.userNavigator.selectedChild = this.userBackgroundPanel;
               }
               break;
            case this.teamContentGroup:
               if(this.teamBackgroundPanel.enabled)
               {
                  this.teamNavigator.selectedChild = this.teamBackgroundPanel;
               }
               break;
            case this.sharedContentGroup:
               if(this.sharedBackgroundPanel.enabled)
               {
                  this.sharedNavigator.selectedChild = this.sharedBackgroundPanel;
               }
               break;
            case this.movieContentGroup:
               if(this.movieBackgroundPanel.enabled)
               {
                  this.movieNavigator.selectedChild = this.movieBackgroundPanel;
               }
         }
      }
      
      public function clearAllBackgroundThumbState() : void
      {
         this.themeBackgroundProductExplorer.clearAllThumbState();
         this.themeCategorizedBackgroundProductExplorer.clearAllThumbState();
         this.userBackgroundExplorer.clearAllThumbState();
         this.teamBackgroundExplorer.clearAllThumbState();
         this.sharedBackgroundExplorer.clearAllThumbState();
         if(this.searchPanel)
         {
            this.searchPanel.clearAllBackgroundThumbState();
         }
      }
      
      private function _ThumbTray_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ThumbTray_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2239558;
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_HGroup1_c(),this._ThumbTray_ViewStack1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.height = 45;
         _loc1_.gap = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ThumbTray_ImporterButton1_i(),this._ThumbTray_Line1_c(),this._ThumbTray_ThemeSelector1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ImporterButton1_i() : ImporterButton
      {
         var _loc1_:ImporterButton = new ImporterButton();
         _loc1_.width = 52;
         _loc1_.percentHeight = 100;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__importerButton_click);
         _loc1_.id = "importerButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.importerButton = _loc1_;
         BindingManager.executeBindings(this,"importerButton",this.importerButton);
         return _loc1_;
      }
      
      public function __importerButton_click(param1:MouseEvent) : void
      {
         this.onImporterButtonClick(param1);
      }
      
      private function _ThumbTray_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.height = 25;
         _loc1_.stroke = this._ThumbTray_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4607351;
         return _loc1_;
      }
      
      private function _ThumbTray_ThemeSelector1_i() : ThemeSelector
      {
         var _loc1_:ThemeSelector = new ThemeSelector();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("themeChange",this.__themeSelector_themeChange);
         _loc1_.id = "themeSelector";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeSelector = _loc1_;
         BindingManager.executeBindings(this,"themeSelector",this.themeSelector);
         return _loc1_;
      }
      
      public function __themeSelector_themeChange(param1:ThemeChangeEvent) : void
      {
         this.onThemeChosen(param1);
      }
      
      private function _ThumbTray_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.creationPolicy = "all";
         temp.id = "navigatorGroup";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"navigatorGroup",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"themeContentGroup",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "layout":_ThumbTray_VerticalLayout1_c(),
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array5_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"userContentGroup",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "layout":_ThumbTray_VerticalLayout3_c(),
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array18_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"teamContentGroup",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "layout":_ThumbTray_VerticalLayout4_c(),
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array33_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"sharedContentGroup",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "layout":_ThumbTray_VerticalLayout5_c(),
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array47_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ProductSearchPanel,
                  "id":"searchPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieContentGroup",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "layout":_ThumbTray_VerticalLayout6_c(),
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array61_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.navigatorGroup = temp;
         BindingManager.executeBindings(this,"navigatorGroup",this.navigatorGroup);
         return temp;
      }
      
      private function _ThumbTray_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _ThumbTray_Array5_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_TabBar1_i(),this._ThumbTray_ViewStack2_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_TabBar1_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.percentWidth = 100;
         _loc1_.height = 70;
         _loc1_.addEventListener("rendererAdd",this.__themeTabBar_rendererAdd);
         _loc1_.id = "themeTabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeTabBar = _loc1_;
         BindingManager.executeBindings(this,"themeTabBar",this.themeTabBar);
         return _loc1_;
      }
      
      public function __themeTabBar_rendererAdd(param1:RendererExistenceEvent) : void
      {
         this.onThemeTabBarRendererAdd(param1);
      }
      
      private function _ThumbTray_ViewStack2_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.mouseEnabled = false;
         temp.addEventListener("change",this.__themeNavigator_change);
         temp.id = "themeNavigator";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"themeNavigator",
            "events":{"change":"__themeNavigator_change"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"themeBackgroundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"background",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array6_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"themeCharacterPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"character",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array7_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"themePropPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"prop",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array9_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"themeBubblePanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"text",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array11_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"themeWidgetPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"widget",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array15_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"themeSoundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"music",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array17_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.themeNavigator = temp;
         BindingManager.executeBindings(this,"themeNavigator",this.themeNavigator);
         return temp;
      }
      
      public function __themeNavigator_change(param1:IndexChangedEvent) : void
      {
         this.onThemeTabChange();
      }
      
      private function _ThumbTray_Array6_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_ProductExplorer1_i(),this._ThumbTray_CategorizedProductExplorer1_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer1_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory1_c();
         _loc1_.searchInputVisible = false;
         _loc1_.setStyle("skinClass",SimpleProductExplorerSkin);
         _loc1_.addEventListener("creationComplete",this.__themeBackgroundProductExplorer_creationComplete);
         _loc1_.id = "themeBackgroundProductExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeBackgroundProductExplorer = _loc1_;
         BindingManager.executeBindings(this,"themeBackgroundProductExplorer",this.themeBackgroundProductExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BackgroundThumbRenderer;
         return _loc1_;
      }
      
      public function __themeBackgroundProductExplorer_creationComplete(param1:FlexEvent) : void
      {
         this.themeBackgroundExplorer_creationCompleteHandler(param1);
      }
      
      private function _ThumbTray_CategorizedProductExplorer1_i() : CategorizedProductExplorer
      {
         var _loc1_:CategorizedProductExplorer = new CategorizedProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory2_c();
         _loc1_.suggestionType = "template";
         _loc1_.setStyle("skinClass",CategorizedProductExplorerSkin);
         _loc1_.addEventListener("creationComplete",this.__themeCategorizedBackgroundProductExplorer_creationComplete);
         _loc1_.id = "themeCategorizedBackgroundProductExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeCategorizedBackgroundProductExplorer = _loc1_;
         BindingManager.executeBindings(this,"themeCategorizedBackgroundProductExplorer",this.themeCategorizedBackgroundProductExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BackgroundExtraLargeThumbRenderer;
         return _loc1_;
      }
      
      public function __themeCategorizedBackgroundProductExplorer_creationComplete(param1:FlexEvent) : void
      {
         this.themeBackgroundExplorer_creationCompleteHandler(param1);
      }
      
      private function _ThumbTray_Array7_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_ProductExplorer2_i(),this._ThumbTray_Group2_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer2_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 96;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory3_c();
         _loc1_.suggestionType = "char";
         _loc1_.addEventListener("productSearchStart",this.__themeCharacterExplorer_productSearchStart);
         _loc1_.addEventListener("infiniteScroll",this.__themeCharacterExplorer_infiniteScroll);
         _loc1_.id = "themeCharacterExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeCharacterExplorer = _loc1_;
         BindingManager.executeBindings(this,"themeCharacterExplorer",this.themeCharacterExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory3_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = CharacterThumbRenderer;
         return _loc1_;
      }
      
      public function __themeCharacterExplorer_productSearchStart(param1:ProductExplorerEvent) : void
      {
         this.themeCharacterExplorer_productSearchStartHandler(param1);
      }
      
      public function __themeCharacterExplorer_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onThemeCharacterInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect2_c(),this._ThumbTray_BusyIndicator1_c()];
         _loc1_.id = "_ThumbTray_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group2",this._ThumbTray_Group2);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array9_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_ProductExplorer3_i(),this._ThumbTray_Group3_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer3_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory4_c();
         _loc1_.suggestionType = "prop";
         _loc1_.addEventListener("productSearchStart",this.__themePropList_productSearchStart);
         _loc1_.id = "themePropList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themePropList = _loc1_;
         BindingManager.executeBindings(this,"themePropList",this.themePropList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory4_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      public function __themePropList_productSearchStart(param1:ProductExplorerEvent) : void
      {
         this.themePropList_productSearchedHandler(param1);
      }
      
      private function _ThumbTray_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect3_c(),this._ThumbTray_BusyIndicator2_c()];
         _loc1_.id = "_ThumbTray_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group3",this._ThumbTray_Group3);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator2_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array11_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_Rect4_c(),this._ThumbTray_Scroller1_c(),this._ThumbTray_Rect5_c(),this._ThumbTray_Rect6_c()];
         return _loc1_;
      }
      
      private function _ThumbTray_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ThumbTray_SolidColorStroke2_c();
         _loc1_.fill = this._ThumbTray_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14737632;
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15594230;
         return _loc1_;
      }
      
      private function _ThumbTray_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 0;
         _loc1_.viewport = this._ThumbTray_VGroup2_c();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","on");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_TextComponentCreationPanel1_i(),this._ThumbTray_DecoratedList1_i(),this._ThumbTray_DecoratedList2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_TextComponentCreationPanel1_i() : TextComponentCreationPanel
      {
         var _loc1_:TextComponentCreationPanel = new TextComponentCreationPanel();
         _loc1_.id = "_ThumbTray_TextComponentCreationPanel1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_TextComponentCreationPanel1 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_TextComponentCreationPanel1",this._ThumbTray_TextComponentCreationPanel1);
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList1_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("skinClass",TextComponentListSkin);
         _loc1_.id = "_ThumbTray_DecoratedList1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_DecoratedList1 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_DecoratedList1",this._ThumbTray_DecoratedList1);
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList2_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("skinClass",ThemeBubbleListSkin);
         _loc1_.id = "_ThumbTray_DecoratedList2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_DecoratedList2 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_DecoratedList2",this._ThumbTray_DecoratedList2);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 16;
         _loc1_.height = 10;
         _loc1_.fill = this._ThumbTray_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ThumbTray_GradientEntry1_c(),this._ThumbTray_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _ThumbTray_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _ThumbTray_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _ThumbTray_Rect6_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 16;
         _loc1_.height = 10;
         _loc1_.fill = this._ThumbTray_LinearGradient2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._ThumbTray_GradientEntry3_c(),this._ThumbTray_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _ThumbTray_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _ThumbTray_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _ThumbTray_Array15_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_ProductExplorer4_i(),this._ThumbTray_Group4_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer4_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory5_c();
         _loc1_.setStyle("skinClass",WidgetProductExplorerSkin);
         _loc1_.id = "themeWidgetList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeWidgetList = _loc1_;
         BindingManager.executeBindings(this,"themeWidgetList",this.themeWidgetList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory5_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect7_c(),this._ThumbTray_BusyIndicator3_c()];
         _loc1_.id = "_ThumbTray_Group4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group4 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group4",this._ThumbTray_Group4);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect7_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator3_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array17_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_ProductExplorer5_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer5_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productListSkin = SoundExplorerProductListSkin;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory6_c();
         _loc1_.suggestionType = "sound";
         _loc1_.productLayout = this._ThumbTray_VerticalLayout2_c();
         _loc1_.addEventListener("productSearchStart",this.__commonSoundExplorer_productSearchStart);
         _loc1_.addEventListener("creationComplete",this.__commonSoundExplorer_creationComplete);
         _loc1_.id = "commonSoundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.commonSoundExplorer = _loc1_;
         BindingManager.executeBindings(this,"commonSoundExplorer",this.commonSoundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory6_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SoundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_VerticalLayout2_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         return _loc1_;
      }
      
      public function __commonSoundExplorer_productSearchStart(param1:ProductExplorerEvent) : void
      {
         this.commonSoundExplorer_productSearchStartHandler(param1);
      }
      
      public function __commonSoundExplorer_creationComplete(param1:FlexEvent) : void
      {
         this.commonSoundExplorer_creationCompleteHandler(param1);
      }
      
      private function _ThumbTray_VerticalLayout3_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _ThumbTray_Array18_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_TabBar2_i(),this._ThumbTray_ViewStack3_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_TabBar2_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.percentWidth = 100;
         _loc1_.height = 70;
         _loc1_.id = "userTabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userTabBar = _loc1_;
         BindingManager.executeBindings(this,"userTabBar",this.userTabBar);
         return _loc1_;
      }
      
      private function _ThumbTray_ViewStack3_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.mouseEnabled = false;
         temp.setStyle("paddingTop",0);
         temp.addEventListener("change",this.__userNavigator_change);
         temp.id = "userNavigator";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"userNavigator",
            "events":{"change":"__userNavigator_change"},
            "stylesFactory":function():void
            {
               this.paddingTop = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"userBackgroundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"background",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array19_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"userCharacterPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"character",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array20_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"userPropPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"prop",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array21_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"userBubblePanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"text",
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array25_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"userSoundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"music",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array27_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"userVideoPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"video",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array31_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.userNavigator = temp;
         BindingManager.executeBindings(this,"userNavigator",this.userNavigator);
         return temp;
      }
      
      public function __userNavigator_change(param1:IndexChangedEvent) : void
      {
         this.onUserTabChange();
      }
      
      private function _ThumbTray_Array19_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_UserBackgroundExplorer1_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_UserBackgroundExplorer1_i() : UserBackgroundExplorer
      {
         var _loc1_:UserBackgroundExplorer = new UserBackgroundExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory7_c();
         _loc1_.addEventListener("infiniteScroll",this.__userBackgroundExplorer_infiniteScroll);
         _loc1_.addEventListener("productCategoryChanged",this.__userBackgroundExplorer_productCategoryChanged);
         _loc1_.id = "userBackgroundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userBackgroundExplorer = _loc1_;
         BindingManager.executeBindings(this,"userBackgroundExplorer",this.userBackgroundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory7_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BackgroundLargeThumbRenderer;
         return _loc1_;
      }
      
      public function __userBackgroundExplorer_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onUserBackgroundInfiniteScroll(param1);
      }
      
      public function __userBackgroundExplorer_productCategoryChanged(param1:ProductExplorerEvent) : void
      {
         this.userBackgroundExplorer_productCategoryChangedHandler(param1);
      }
      
      private function _ThumbTray_Array20_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_DecoratedList3_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList3_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory8_c();
         _loc1_.layout = this._ThumbTray_TileLayout1_c();
         _loc1_.addEventListener("infiniteScroll",this.__userCharacterList_infiniteScroll);
         _loc1_.id = "userCharacterList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userCharacterList = _loc1_;
         BindingManager.executeBindings(this,"userCharacterList",this.userCharacterList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory8_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = CharacterThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.horizontalGap = 8;
         _loc1_.orientation = "rows";
         _loc1_.requestedColumnCount = 4;
         _loc1_.useVirtualLayout = true;
         _loc1_.verticalGap = 8;
         return _loc1_;
      }
      
      public function __userCharacterList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onUserCharacterInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Array21_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_VGroup3_c(),this._ThumbTray_Group6_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_ProductExplorer6_i(),this._ThumbTray_Group5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer6_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory9_c();
         _loc1_.id = "userPropExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userPropExplorer = _loc1_;
         BindingManager.executeBindings(this,"userPropExplorer",this.userPropExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory9_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Button1_i()];
         _loc1_.id = "_ThumbTray_Group5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group5 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group5",this._ThumbTray_Group5);
         return _loc1_;
      }
      
      private function _ThumbTray_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.horizontalCenter = 0;
         _loc1_.addEventListener("click",this.___ThumbTray_Button1_click);
         _loc1_.id = "_ThumbTray_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Button1",this._ThumbTray_Button1);
         return _loc1_;
      }
      
      public function ___ThumbTray_Button1_click(param1:MouseEvent) : void
      {
         this.onUserPropInfiniteScroll();
      }
      
      private function _ThumbTray_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect8_c(),this._ThumbTray_BusyIndicator4_c()];
         _loc1_.id = "_ThumbTray_Group6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group6 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group6",this._ThumbTray_Group6);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect8_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator4_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array25_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_DecoratedList4_i(),this._ThumbTray_Group7_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList4_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",BubbleListSkin);
         _loc1_.id = "userBubbleList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userBubbleList = _loc1_;
         BindingManager.executeBindings(this,"userBubbleList",this.userBubbleList);
         return _loc1_;
      }
      
      private function _ThumbTray_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect9_c(),this._ThumbTray_BusyIndicator5_c()];
         _loc1_.id = "_ThumbTray_Group7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group7 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group7",this._ThumbTray_Group7);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect9_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor7_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor7_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator5_c() : BusyIndicator
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
      
      private function _ThumbTray_Array27_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_VGroup4_c(),this._ThumbTray_Group9_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_ProductExplorer7_i(),this._ThumbTray_Group8_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer7_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productListSkin = SoundExplorerProductListSkin;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory10_c();
         _loc1_.id = "userSoundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userSoundExplorer = _loc1_;
         BindingManager.executeBindings(this,"userSoundExplorer",this.userSoundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory10_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SoundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Button2_i()];
         _loc1_.id = "_ThumbTray_Group8";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group8 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group8",this._ThumbTray_Group8);
         return _loc1_;
      }
      
      private function _ThumbTray_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.horizontalCenter = 0;
         _loc1_.addEventListener("click",this.___ThumbTray_Button2_click);
         _loc1_.id = "_ThumbTray_Button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Button2 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Button2",this._ThumbTray_Button2);
         return _loc1_;
      }
      
      public function ___ThumbTray_Button2_click(param1:MouseEvent) : void
      {
         this.onUserSoundInfiniteScroll();
      }
      
      private function _ThumbTray_Group9_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect10_c(),this._ThumbTray_BusyIndicator6_c()];
         _loc1_.id = "_ThumbTray_Group9";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group9 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group9",this._ThumbTray_Group9);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect10_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor8_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor8_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator6_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array31_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_DecoratedList5_i(),this._ThumbTray_Group10_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList5_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory11_c();
         _loc1_.setStyle("skinClass",StarterListSkin);
         _loc1_.addEventListener("infiniteScroll",this.__userVideoPropList_infiniteScroll);
         _loc1_.id = "userVideoPropList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userVideoPropList = _loc1_;
         BindingManager.executeBindings(this,"userVideoPropList",this.userVideoPropList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory11_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = VideoThumbRenderer;
         return _loc1_;
      }
      
      public function __userVideoPropList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onVideoPropInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Group10_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect11_c(),this._ThumbTray_BusyIndicator7_c()];
         _loc1_.id = "_ThumbTray_Group10";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group10 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group10",this._ThumbTray_Group10);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect11_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor9_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor9_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator7_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_VerticalLayout4_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _ThumbTray_Array33_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_TabBar3_i(),this._ThumbTray_ViewStack4_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_TabBar3_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.percentWidth = 100;
         _loc1_.height = 70;
         _loc1_.id = "teamTabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.teamTabBar = _loc1_;
         BindingManager.executeBindings(this,"teamTabBar",this.teamTabBar);
         return _loc1_;
      }
      
      private function _ThumbTray_ViewStack4_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.mouseEnabled = false;
         temp.setStyle("paddingTop",0);
         temp.addEventListener("change",this.__teamNavigator_change);
         temp.id = "teamNavigator";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"teamNavigator",
            "events":{"change":"__teamNavigator_change"},
            "stylesFactory":function():void
            {
               this.paddingTop = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"teamBackgroundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"background",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array34_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"teamPropPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"prop",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array35_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"teamBubblePanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"text",
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array39_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"teamSoundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"music",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array41_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"teamVideoPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"video",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array45_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.teamNavigator = temp;
         BindingManager.executeBindings(this,"teamNavigator",this.teamNavigator);
         return temp;
      }
      
      public function __teamNavigator_change(param1:IndexChangedEvent) : void
      {
         this.onTeamTabChange();
      }
      
      private function _ThumbTray_Array34_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_UserBackgroundExplorer2_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_UserBackgroundExplorer2_i() : UserBackgroundExplorer
      {
         var _loc1_:UserBackgroundExplorer = new UserBackgroundExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory12_c();
         _loc1_.addEventListener("infiniteScroll",this.__teamBackgroundExplorer_infiniteScroll);
         _loc1_.addEventListener("productCategoryChanged",this.__teamBackgroundExplorer_productCategoryChanged);
         _loc1_.id = "teamBackgroundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.teamBackgroundExplorer = _loc1_;
         BindingManager.executeBindings(this,"teamBackgroundExplorer",this.teamBackgroundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory12_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = BackgroundLargeThumbRenderer;
         return _loc1_;
      }
      
      public function __teamBackgroundExplorer_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onSharedBackgroundInfiniteScroll(param1);
      }
      
      public function __teamBackgroundExplorer_productCategoryChanged(param1:ProductExplorerEvent) : void
      {
         this.sharedBackgroundExplorer_productCategoryChangedHandler(param1);
      }
      
      private function _ThumbTray_Array35_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_VGroup5_c(),this._ThumbTray_Group12_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup5_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_ProductExplorer8_i(),this._ThumbTray_Group11_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer8_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory13_c();
         _loc1_.id = "teamPropExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.teamPropExplorer = _loc1_;
         BindingManager.executeBindings(this,"teamPropExplorer",this.teamPropExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory13_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group11_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Button3_i()];
         _loc1_.id = "_ThumbTray_Group11";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group11 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group11",this._ThumbTray_Group11);
         return _loc1_;
      }
      
      private function _ThumbTray_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.horizontalCenter = 0;
         _loc1_.addEventListener("click",this.___ThumbTray_Button3_click);
         _loc1_.id = "_ThumbTray_Button3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Button3 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Button3",this._ThumbTray_Button3);
         return _loc1_;
      }
      
      public function ___ThumbTray_Button3_click(param1:MouseEvent) : void
      {
         this.onSharedPropInfiniteScroll();
      }
      
      private function _ThumbTray_Group12_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect12_c(),this._ThumbTray_BusyIndicator8_c()];
         _loc1_.id = "_ThumbTray_Group12";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group12 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group12",this._ThumbTray_Group12);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect12_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor10_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor10_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator8_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array39_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_DecoratedList6_i(),this._ThumbTray_Group13_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList6_i() : DecoratedList
      {
         var _loc1_:DecoratedList = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",BubbleListSkin);
         _loc1_.id = "teamBubbleList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.teamBubbleList = _loc1_;
         BindingManager.executeBindings(this,"teamBubbleList",this.teamBubbleList);
         return _loc1_;
      }
      
      private function _ThumbTray_Group13_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect13_c(),this._ThumbTray_BusyIndicator9_c()];
         _loc1_.id = "_ThumbTray_Group13";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group13 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group13",this._ThumbTray_Group13);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect13_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor11_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor11_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator9_c() : BusyIndicator
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
      
      private function _ThumbTray_Array41_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_VGroup6_c(),this._ThumbTray_Group15_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup6_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_ProductExplorer9_i(),this._ThumbTray_Group14_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer9_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productListSkin = SoundExplorerProductListSkin;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory14_c();
         _loc1_.id = "teamSoundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.teamSoundExplorer = _loc1_;
         BindingManager.executeBindings(this,"teamSoundExplorer",this.teamSoundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory14_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SoundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group14_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Button4_i()];
         _loc1_.id = "_ThumbTray_Group14";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group14 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group14",this._ThumbTray_Group14);
         return _loc1_;
      }
      
      private function _ThumbTray_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.horizontalCenter = 0;
         _loc1_.addEventListener("click",this.___ThumbTray_Button4_click);
         _loc1_.id = "_ThumbTray_Button4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Button4 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Button4",this._ThumbTray_Button4);
         return _loc1_;
      }
      
      public function ___ThumbTray_Button4_click(param1:MouseEvent) : void
      {
         this.onSharedSoundInfiniteScroll();
      }
      
      private function _ThumbTray_Group15_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect14_c(),this._ThumbTray_BusyIndicator10_c()];
         _loc1_.id = "_ThumbTray_Group15";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group15 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group15",this._ThumbTray_Group15);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect14_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor12_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor12_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator10_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array45_c() : Array
      {
         var _loc1_:Array = [this._ThumbTray_DecoratedList7_i(),this._ThumbTray_Group16_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList7_i() : DecoratedList
      {
         var _loc1_:DecoratedList = null;
         _loc1_ = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory15_c();
         _loc1_.setStyle("skinClass",StarterListSkin);
         _loc1_.addEventListener("infiniteScroll",this.__teamVideoPropList_infiniteScroll);
         _loc1_.id = "teamVideoPropList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.teamVideoPropList = _loc1_;
         BindingManager.executeBindings(this,"teamVideoPropList",this.teamVideoPropList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory15_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = VideoThumbRenderer;
         return _loc1_;
      }
      
      public function __teamVideoPropList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onVideoPropInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Group16_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect15_c(),this._ThumbTray_BusyIndicator11_c()];
         _loc1_.id = "_ThumbTray_Group16";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group16 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group16",this._ThumbTray_Group16);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect15_c() : Rect
      {
         var _loc1_:Rect = null;
         _loc1_ = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor13_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor13_c() : SolidColor
      {
         var _loc1_:SolidColor = null;
         _loc1_ = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator11_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = null;
         _loc1_ = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_VerticalLayout5_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = null;
         _loc1_ = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _ThumbTray_Array47_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_TabBar4_i(),this._ThumbTray_ViewStack5_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_TabBar4_i() : TabBar
      {
         var _loc1_:TabBar = null;
         _loc1_ = new TabBar();
         _loc1_.percentWidth = 100;
         _loc1_.height = 70;
         _loc1_.id = "sharedTabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sharedTabBar = _loc1_;
         BindingManager.executeBindings(this,"sharedTabBar",this.sharedTabBar);
         return _loc1_;
      }
      
      private function _ThumbTray_ViewStack5_i() : ViewStack
      {
         var temp:ViewStack = null;
         temp = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.mouseEnabled = false;
         temp.setStyle("paddingTop",0);
         temp.addEventListener("change",this.__sharedNavigator_change);
         temp.id = "sharedNavigator";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"sharedNavigator",
            "events":{"change":"__sharedNavigator_change"},
            "stylesFactory":function():void
            {
               this.paddingTop = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"sharedBackgroundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"background",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array48_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"sharedPropPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"prop",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array49_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"sharedBubblePanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"text",
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array53_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"sharedSoundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"music",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array55_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"sharedVideoPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"video",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array59_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.sharedNavigator = temp;
         BindingManager.executeBindings(this,"sharedNavigator",this.sharedNavigator);
         return temp;
      }
      
      public function __sharedNavigator_change(param1:IndexChangedEvent) : void
      {
         this.onSharedTabChange();
      }
      
      private function _ThumbTray_Array48_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_UserBackgroundExplorer3_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_UserBackgroundExplorer3_i() : UserBackgroundExplorer
      {
         var _loc1_:UserBackgroundExplorer = null;
         _loc1_ = new UserBackgroundExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory16_c();
         _loc1_.addEventListener("infiniteScroll",this.__sharedBackgroundExplorer_infiniteScroll);
         _loc1_.addEventListener("productCategoryChanged",this.__sharedBackgroundExplorer_productCategoryChanged);
         _loc1_.id = "sharedBackgroundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sharedBackgroundExplorer = _loc1_;
         BindingManager.executeBindings(this,"sharedBackgroundExplorer",this.sharedBackgroundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory16_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = BackgroundLargeThumbRenderer;
         return _loc1_;
      }
      
      public function __sharedBackgroundExplorer_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onSharedBackgroundInfiniteScroll(param1);
      }
      
      public function __sharedBackgroundExplorer_productCategoryChanged(param1:ProductExplorerEvent) : void
      {
         this.sharedBackgroundExplorer_productCategoryChangedHandler(param1);
      }
      
      private function _ThumbTray_Array49_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_VGroup7_c(),this._ThumbTray_Group18_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup7_c() : VGroup
      {
         var _loc1_:VGroup = null;
         _loc1_ = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_ProductExplorer10_i(),this._ThumbTray_Group17_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer10_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = null;
         _loc1_ = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory17_c();
         _loc1_.id = "sharedPropExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sharedPropExplorer = _loc1_;
         BindingManager.executeBindings(this,"sharedPropExplorer",this.sharedPropExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory17_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group17_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Button5_i()];
         _loc1_.id = "_ThumbTray_Group17";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group17 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group17",this._ThumbTray_Group17);
         return _loc1_;
      }
      
      private function _ThumbTray_Button5_i() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.horizontalCenter = 0;
         _loc1_.addEventListener("click",this.___ThumbTray_Button5_click);
         _loc1_.id = "_ThumbTray_Button5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Button5 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Button5",this._ThumbTray_Button5);
         return _loc1_;
      }
      
      public function ___ThumbTray_Button5_click(param1:MouseEvent) : void
      {
         this.onSharedPropInfiniteScroll();
      }
      
      private function _ThumbTray_Group18_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect16_c(),this._ThumbTray_BusyIndicator12_c()];
         _loc1_.id = "_ThumbTray_Group18";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group18 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group18",this._ThumbTray_Group18);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect16_c() : Rect
      {
         var _loc1_:Rect = null;
         _loc1_ = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor14_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor14_c() : SolidColor
      {
         var _loc1_:SolidColor = null;
         _loc1_ = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator12_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = null;
         _loc1_ = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array53_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_DecoratedList8_i(),this._ThumbTray_Group19_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList8_i() : DecoratedList
      {
         var _loc1_:DecoratedList = null;
         _loc1_ = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",BubbleListSkin);
         _loc1_.id = "sharedBubbleList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sharedBubbleList = _loc1_;
         BindingManager.executeBindings(this,"sharedBubbleList",this.sharedBubbleList);
         return _loc1_;
      }
      
      private function _ThumbTray_Group19_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect17_c(),this._ThumbTray_BusyIndicator13_c()];
         _loc1_.id = "_ThumbTray_Group19";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group19 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group19",this._ThumbTray_Group19);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect17_c() : Rect
      {
         var _loc1_:Rect = null;
         _loc1_ = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor15_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor15_c() : SolidColor
      {
         var _loc1_:SolidColor = null;
         _loc1_ = new SolidColor();
         _loc1_.color = 6710886;
         _loc1_.alpha = 0.2;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator13_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = null;
         _loc1_ = new BusyIndicator();
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
      
      private function _ThumbTray_Array55_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_VGroup8_c(),this._ThumbTray_Group21_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_VGroup8_c() : VGroup
      {
         var _loc1_:VGroup = null;
         _loc1_ = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ThumbTray_ProductExplorer11_i(),this._ThumbTray_Group20_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer11_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = null;
         _loc1_ = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productListSkin = SoundExplorerProductListSkin;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory18_c();
         _loc1_.id = "sharedSoundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sharedSoundExplorer = _loc1_;
         BindingManager.executeBindings(this,"sharedSoundExplorer",this.sharedSoundExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory18_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = SoundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Group20_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Button6_i()];
         _loc1_.id = "_ThumbTray_Group20";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group20 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group20",this._ThumbTray_Group20);
         return _loc1_;
      }
      
      private function _ThumbTray_Button6_i() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button();
         _loc1_.top = 7;
         _loc1_.bottom = 7;
         _loc1_.horizontalCenter = 0;
         _loc1_.addEventListener("click",this.___ThumbTray_Button6_click);
         _loc1_.id = "_ThumbTray_Button6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Button6 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Button6",this._ThumbTray_Button6);
         return _loc1_;
      }
      
      public function ___ThumbTray_Button6_click(param1:MouseEvent) : void
      {
         this.onSharedSoundInfiniteScroll();
      }
      
      private function _ThumbTray_Group21_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect18_c(),this._ThumbTray_BusyIndicator14_c()];
         _loc1_.id = "_ThumbTray_Group21";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group21 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group21",this._ThumbTray_Group21);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect18_c() : Rect
      {
         var _loc1_:Rect = null;
         _loc1_ = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor16_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor16_c() : SolidColor
      {
         var _loc1_:SolidColor = null;
         _loc1_ = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator14_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = null;
         _loc1_ = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_Array59_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_DecoratedList9_i(),this._ThumbTray_Group22_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList9_i() : DecoratedList
      {
         var _loc1_:DecoratedList = null;
         _loc1_ = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory19_c();
         _loc1_.setStyle("skinClass",StarterListSkin);
         _loc1_.addEventListener("infiniteScroll",this.__sharedVideoPropList_infiniteScroll);
         _loc1_.id = "sharedVideoPropList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sharedVideoPropList = _loc1_;
         BindingManager.executeBindings(this,"sharedVideoPropList",this.sharedVideoPropList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory19_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = VideoThumbRenderer;
         return _loc1_;
      }
      
      public function __sharedVideoPropList_infiniteScroll(param1:InfiniteScrollEvent) : void
      {
         this.onVideoPropInfiniteScroll(param1);
      }
      
      private function _ThumbTray_Group22_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect19_c(),this._ThumbTray_BusyIndicator15_c()];
         _loc1_.id = "_ThumbTray_Group22";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group22 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group22",this._ThumbTray_Group22);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect19_c() : Rect
      {
         var _loc1_:Rect = null;
         _loc1_ = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor17_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor17_c() : SolidColor
      {
         var _loc1_:SolidColor = null;
         _loc1_ = new SolidColor();
         _loc1_.alpha = 0.2;
         _loc1_.color = 6710886;
         return _loc1_;
      }
      
      private function _ThumbTray_BusyIndicator15_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = null;
         _loc1_ = new BusyIndicator();
         _loc1_.width = 80;
         _loc1_.height = 80;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThumbTray_CommunityPanel1_i() : CommunityPanel
      {
         var _loc1_:CommunityPanel = null;
         _loc1_ = new CommunityPanel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "communityPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.communityPanel = _loc1_;
         BindingManager.executeBindings(this,"communityPanel",this.communityPanel);
         return _loc1_;
      }
      
      private function _ThumbTray_VerticalLayout6_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = null;
         _loc1_ = new VerticalLayout();
         _loc1_.gap = 0;
         return _loc1_;
      }
      
      private function _ThumbTray_Array61_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_TabBar5_i(),this._ThumbTray_ViewStack6_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_TabBar5_i() : TabBar
      {
         var _loc1_:TabBar = null;
         _loc1_ = new TabBar();
         _loc1_.percentWidth = 100;
         _loc1_.height = 70;
         _loc1_.id = "movieTabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieTabBar = _loc1_;
         BindingManager.executeBindings(this,"movieTabBar",this.movieTabBar);
         return _loc1_;
      }
      
      private function _ThumbTray_ViewStack6_i() : ViewStack
      {
         var temp:ViewStack = null;
         temp = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         temp.mouseEnabled = false;
         temp.addEventListener("change",this.__movieNavigator_change);
         temp.id = "movieNavigator";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"movieNavigator",
            "events":{"change":"__movieNavigator_change"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieBackgroundPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"background",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array62_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieCharacterPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"character",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array63_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"moviePropPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"prop",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array64_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieBubblePanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"text",
                        "percentWidth":100,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array65_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"movieEffectPanel",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "styleName":"effect",
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_ThumbTray_Array66_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.movieNavigator = temp;
         BindingManager.executeBindings(this,"movieNavigator",this.movieNavigator);
         return temp;
      }
      
      public function __movieNavigator_change(param1:IndexChangedEvent) : void
      {
         this.onMovieTabChange();
      }
      
      private function _ThumbTray_Array62_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_DecoratedList10_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList10_i() : DecoratedList
      {
         var _loc1_:DecoratedList = null;
         _loc1_ = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory20_c();
         _loc1_.setStyle("skinClass",StarterListSkin);
         _loc1_.id = "movieBackgroundList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieBackgroundList = _loc1_;
         BindingManager.executeBindings(this,"movieBackgroundList",this.movieBackgroundList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory20_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = BackgroundThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Array63_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_DecoratedList11_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList11_i() : DecoratedList
      {
         var _loc1_:DecoratedList = null;
         _loc1_ = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory21_c();
         _loc1_.layout = this._ThumbTray_TileLayout2_c();
         _loc1_.id = "movieCharacterList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieCharacterList = _loc1_;
         BindingManager.executeBindings(this,"movieCharacterList",this.movieCharacterList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory21_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = CharacterThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_TileLayout2_c() : TileLayout
      {
         var _loc1_:TileLayout = null;
         _loc1_ = new TileLayout();
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.horizontalGap = 8;
         _loc1_.orientation = "rows";
         _loc1_.useVirtualLayout = true;
         _loc1_.verticalGap = 8;
         return _loc1_;
      }
      
      private function _ThumbTray_Array64_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_ProductExplorer12_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_ProductExplorer12_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = null;
         _loc1_ = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.productRenderer = this._ThumbTray_ClassFactory22_c();
         _loc1_.id = "moviePropExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.moviePropExplorer = _loc1_;
         BindingManager.executeBindings(this,"moviePropExplorer",this.moviePropExplorer);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory22_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_Array65_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_DecoratedList12_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList12_i() : DecoratedList
      {
         var _loc1_:DecoratedList = null;
         _loc1_ = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",BubbleListSkin);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.id = "_ThumbTray_DecoratedList12";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_DecoratedList12 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_DecoratedList12",this._ThumbTray_DecoratedList12);
         return _loc1_;
      }
      
      private function _ThumbTray_Array66_c() : Array
      {
         var _loc1_:Array = null;
         _loc1_ = [this._ThumbTray_DecoratedList13_i()];
         return _loc1_;
      }
      
      private function _ThumbTray_DecoratedList13_i() : DecoratedList
      {
         var _loc1_:DecoratedList = null;
         _loc1_ = new DecoratedList();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ThumbTray_ClassFactory23_c();
         _loc1_.layout = this._ThumbTray_TileLayout3_c();
         _loc1_.id = "movieEffectList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieEffectList = _loc1_;
         BindingManager.executeBindings(this,"movieEffectList",this.movieEffectList);
         return _loc1_;
      }
      
      private function _ThumbTray_ClassFactory23_c() : ClassFactory
      {
         var _loc1_:ClassFactory = null;
         _loc1_ = new ClassFactory();
         _loc1_.generator = EffectThumbRenderer;
         return _loc1_;
      }
      
      private function _ThumbTray_TileLayout3_c() : TileLayout
      {
         var _loc1_:TileLayout = null;
         _loc1_ = new TileLayout();
         _loc1_.columnAlign = "justifyUsingGap";
         _loc1_.horizontalGap = 6;
         _loc1_.requestedColumnCount = 4;
         _loc1_.useVirtualLayout = true;
         _loc1_.verticalGap = 6;
         return _loc1_;
      }
      
      private function _ThumbTray_Line2_c() : Line
      {
         var _loc1_:Line = null;
         _loc1_ = new Line();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.height = 50;
         _loc1_.stroke = this._ThumbTray_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = null;
         _loc1_ = new SolidColorStroke();
         _loc1_.color = 2042177;
         return _loc1_;
      }
      
      private function _ThumbTray_Line3_c() : Line
      {
         var _loc1_:Line = null;
         _loc1_ = new Line();
         _loc1_.right = 0;
         _loc1_.top = 50;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ThumbTray_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = null;
         _loc1_ = new SolidColorStroke();
         _loc1_.color = 12698049;
         return _loc1_;
      }
      
      private function _ThumbTray_Group23_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ThumbTray_Rect20_c()];
         _loc1_.id = "_ThumbTray_Group23";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ThumbTray_Group23 = _loc1_;
         BindingManager.executeBindings(this,"_ThumbTray_Group23",this._ThumbTray_Group23);
         return _loc1_;
      }
      
      private function _ThumbTray_Rect20_c() : Rect
      {
         var _loc1_:Rect = null;
         _loc1_ = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ThumbTray_SolidColor18_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ThumbTray_SolidColor18_c() : SolidColor
      {
         var _loc1_:SolidColor = null;
         _loc1_ = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function ___ThumbTray_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.initThumbTray();
      }
      
      private function _ThumbTray_bindingsSetup() : Array
      {
         var result:Array = null;
         result = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,"Import media");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"importerButton.label");
         result[1] = new Binding(this,null,null,"themeTabBar.dataProvider","themeNavigator");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.translate(LABEL_TEMPLATES);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"themeBackgroundPanel.label");
         result[3] = new Binding(this,function():ProductGroupCollection
         {
            return _themeBackgroundCollection;
         },null,"themeBackgroundProductExplorer.productProvider");
         result[4] = new Binding(this,function():Boolean
         {
            return !_useExtraLargeBackgroundThumbnails;
         },null,"themeBackgroundProductExplorer.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return !_useExtraLargeBackgroundThumbnails;
         },null,"themeBackgroundProductExplorer.includeInLayout");
         result[6] = new Binding(this,function():ProductGroupCollection
         {
            return _themeBackgroundCollection;
         },null,"themeCategorizedBackgroundProductExplorer.productProvider");
         result[7] = new Binding(this,function():Boolean
         {
            return _useSearchSuggestion;
         },null,"themeCategorizedBackgroundProductExplorer.suggestionEnabled");
         result[8] = new Binding(this,function():Boolean
         {
            return _useExtraLargeBackgroundThumbnails;
         },null,"themeCategorizedBackgroundProductExplorer.visible");
         result[9] = new Binding(this,function():Boolean
         {
            return _useExtraLargeBackgroundThumbnails;
         },null,"themeCategorizedBackgroundProductExplorer.includeInLayout");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Characters");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"themeCharacterPanel.label");
         result[11] = new Binding(this,function():ProductGroupCollection
         {
            return _themeCharacterCollection;
         },null,"themeCharacterExplorer.productProvider");
         result[12] = new Binding(this,function():Boolean
         {
            return _useSearchSuggestion;
         },null,"themeCharacterExplorer.suggestionEnabled");
         result[13] = new Binding(this,function():Boolean
         {
            return _loadingThemeCC;
         },null,"_ThumbTray_Group2.visible");
         result[14] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Props");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"themePropPanel.label");
         result[15] = new Binding(this,function():ProductGroupCollection
         {
            return _themePropCollection;
         },null,"themePropList.productProvider");
         result[16] = new Binding(this,function():Boolean
         {
            return _useSearchSuggestion;
         },null,"themePropList.suggestionEnabled");
         result[17] = new Binding(this,function():Boolean
         {
            return !_themePropReady;
         },null,"_ThumbTray_Group3.visible");
         result[18] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.translate("Text");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"themeBubblePanel.label");
         result[19] = new Binding(this,function():Boolean
         {
            return _showTextComponentCreationPanel;
         },null,"_ThumbTray_TextComponentCreationPanel1.visible");
         result[20] = new Binding(this,function():Boolean
         {
            return _showTextComponentCreationPanel;
         },null,"_ThumbTray_TextComponentCreationPanel1.includeInLayout");
         result[21] = new Binding(this,function():Boolean
         {
            return _showTextComponentList;
         },null,"_ThumbTray_DecoratedList1.visible");
         result[22] = new Binding(this,function():Boolean
         {
            return _showTextComponentList;
         },null,"_ThumbTray_DecoratedList1.includeInLayout");
         result[23] = new Binding(this,function():IList
         {
            return _textComponentSource;
         },null,"_ThumbTray_DecoratedList1.dataProvider");
         result[24] = new Binding(this,function():IList
         {
            return _bubbleSource;
         },null,"_ThumbTray_DecoratedList2.dataProvider");
         result[25] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Vidgets");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"themeWidgetPanel.label");
         result[26] = new Binding(this,function():ProductGroupCollection
         {
            return _themeWidgetCollection;
         },null,"themeWidgetList.productProvider");
         result[27] = new Binding(this,function():Boolean
         {
            return !_themePropReady;
         },null,"_ThumbTray_Group4.visible");
         result[28] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Sound");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"themeSoundPanel.label");
         result[29] = new Binding(this,function():ProductGroupCollection
         {
            return _commonSoundCollection;
         },null,"commonSoundExplorer.productProvider");
         result[30] = new Binding(this,function():Boolean
         {
            return _useSearchSuggestion;
         },null,"commonSoundExplorer.suggestionEnabled");
         result[31] = new Binding(this,null,null,"userTabBar.dataProvider","userNavigator");
         result[32] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.translate(LABEL_BACKDROP_STARTER);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userBackgroundPanel.label");
         result[33] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userBackgroundExplorer.emptyPrompt");
         result[34] = new Binding(this,function():Boolean
         {
            return _loadingUserBackground || _loadingUserStarter;
         },null,"userBackgroundExplorer.loading");
         result[35] = new Binding(this,function():ProductGroupCollection
         {
            return _userAssetManager.backgroundSource;
         },null,"userBackgroundExplorer.productProvider");
         result[36] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Characters");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userCharacterPanel.label");
         result[37] = new Binding(this,function():IList
         {
            return _userAssetManager.characterSource;
         },null,"userCharacterList.dataProvider");
         result[38] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userCharacterList.emptyPrompt");
         result[39] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"userCharacterList.loading");
         result[40] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Props");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userPropPanel.label");
         result[41] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userPropExplorer.emptyPrompt");
         result[42] = new Binding(this,function():ProductGroupCollection
         {
            return _userAssetManager.propSource;
         },null,"userPropExplorer.productProvider");
         result[43] = new Binding(this,function():Boolean
         {
            return _hasMoreUserProp;
         },null,"_ThumbTray_Group5.visible");
         result[44] = new Binding(this,function():Boolean
         {
            return _hasMoreUserProp;
         },null,"_ThumbTray_Group5.includeInLayout");
         result[45] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Load more Props");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ThumbTray_Button1.label");
         result[46] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userAssetManager.userPropReady;
         },null,"_ThumbTray_Group6.visible");
         result[47] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Text");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userBubblePanel.label");
         result[48] = new Binding(this,function():IList
         {
            return _userAssetManager.bubbleSource;
         },null,"userBubbleList.dataProvider");
         result[49] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userBubbleList.emptyPrompt");
         result[50] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"userBubbleList.loading");
         result[51] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userBubbleReady;
         },null,"_ThumbTray_Group7.visible");
         result[52] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Sound");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userSoundPanel.label");
         result[53] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userSoundExplorer.emptyPrompt");
         result[54] = new Binding(this,function():ProductGroupCollection
         {
            return _userAssetManager.soundSource;
         },null,"userSoundExplorer.productProvider");
         result[55] = new Binding(this,function():Boolean
         {
            return _hasMoreUserSound;
         },null,"_ThumbTray_Group8.visible");
         result[56] = new Binding(this,function():Boolean
         {
            return _hasMoreUserSound;
         },null,"_ThumbTray_Group8.includeInLayout");
         result[57] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Load more Sound");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ThumbTray_Button2.label");
         result[58] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userSoundReady;
         },null,"_ThumbTray_Group9.visible");
         result[59] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Videos");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userVideoPanel.label");
         result[60] = new Binding(this,function():IList
         {
            return _userAssetManager.videoSource;
         },null,"userVideoPropList.dataProvider");
         result[61] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userVideoPropList.emptyPrompt");
         result[62] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"userVideoPropList.loading");
         result[63] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userVideoReady;
         },null,"_ThumbTray_Group10.visible");
         result[64] = new Binding(this,null,null,"teamTabBar.dataProvider","teamNavigator");
         result[65] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.translate(LABEL_BACKDROP_STARTER);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamBackgroundPanel.label");
         result[66] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamBackgroundExplorer.emptyPrompt");
         result[67] = new Binding(this,function():Boolean
         {
            return _adminTeamAssetManager.loadingBackground || _adminTeamAssetManager.loadingStarter;
         },null,"teamBackgroundExplorer.loading");
         result[68] = new Binding(this,function():ProductGroupCollection
         {
            return _adminTeamAssetManager.backgroundSource;
         },null,"teamBackgroundExplorer.productProvider");
         result[69] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Props");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamPropPanel.label");
         result[70] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamPropExplorer.emptyPrompt");
         result[71] = new Binding(this,function():ProductGroupCollection
         {
            return _adminTeamAssetManager.propSource;
         },null,"teamPropExplorer.productProvider");
         result[72] = new Binding(this,function():Boolean
         {
            return _adminTeamAssetManager.hasMoreProp;
         },null,"_ThumbTray_Group11.visible");
         result[73] = new Binding(this,function():Boolean
         {
            return _adminTeamAssetManager.hasMoreProp;
         },null,"_ThumbTray_Group11.includeInLayout");
         result[74] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Load more Props");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ThumbTray_Button3.label");
         result[75] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_adminTeamAssetManager.sharedPropReady;
         },null,"_ThumbTray_Group12.visible");
         result[76] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Text");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamBubblePanel.label");
         result[77] = new Binding(this,function():IList
         {
            return _adminTeamAssetManager.bubbleSource;
         },null,"teamBubbleList.dataProvider");
         result[78] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamBubbleList.emptyPrompt");
         result[79] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"teamBubbleList.loading");
         result[80] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_adminTeamAssetManager.bubbleReady;
         },null,"_ThumbTray_Group13.visible");
         result[81] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Sound");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamSoundPanel.label");
         result[82] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamSoundExplorer.emptyPrompt");
         result[83] = new Binding(this,function():ProductGroupCollection
         {
            return _adminTeamAssetManager.soundSource;
         },null,"teamSoundExplorer.productProvider");
         result[84] = new Binding(this,function():Boolean
         {
            return _adminTeamAssetManager.hasMoreSound;
         },null,"_ThumbTray_Group14.visible");
         result[85] = new Binding(this,function():Boolean
         {
            return _adminTeamAssetManager.hasMoreSound;
         },null,"_ThumbTray_Group14.includeInLayout");
         result[86] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Load more Sound");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ThumbTray_Button4.label");
         result[87] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_adminTeamAssetManager.soundReady;
         },null,"_ThumbTray_Group15.visible");
         result[88] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Videos");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamVideoPanel.label");
         result[89] = new Binding(this,function():IList
         {
            return _adminTeamAssetManager.videoSource;
         },null,"teamVideoPropList.dataProvider");
         result[90] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"teamVideoPropList.emptyPrompt");
         result[91] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"teamVideoPropList.loading");
         result[92] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_adminTeamAssetManager.videoReady;
         },null,"_ThumbTray_Group16.visible");
         result[93] = new Binding(this,null,null,"sharedTabBar.dataProvider","sharedNavigator");
         result[94] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.translate(LABEL_BACKDROP_STARTER);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedBackgroundPanel.label");
         result[95] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedBackgroundExplorer.emptyPrompt");
         result[96] = new Binding(this,function():Boolean
         {
            return _userSharedAssetManager.loadingBackground || _userSharedAssetManager.loadingStarter;
         },null,"sharedBackgroundExplorer.loading");
         result[97] = new Binding(this,function():ProductGroupCollection
         {
            return _userSharedAssetManager.backgroundSource;
         },null,"sharedBackgroundExplorer.productProvider");
         result[98] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Props");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedPropPanel.label");
         result[99] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedPropExplorer.emptyPrompt");
         result[100] = new Binding(this,function():ProductGroupCollection
         {
            return _userSharedAssetManager.propSource;
         },null,"sharedPropExplorer.productProvider");
         result[101] = new Binding(this,function():Boolean
         {
            return _userSharedAssetManager.hasMoreProp;
         },null,"_ThumbTray_Group17.visible");
         result[102] = new Binding(this,function():Boolean
         {
            return _userSharedAssetManager.hasMoreProp;
         },null,"_ThumbTray_Group17.includeInLayout");
         result[103] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Load more Props");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ThumbTray_Button5.label");
         result[104] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userSharedAssetManager.sharedPropReady;
         },null,"_ThumbTray_Group18.visible");
         result[105] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Text");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedBubblePanel.label");
         result[106] = new Binding(this,function():IList
         {
            return _userSharedAssetManager.bubbleSource;
         },null,"sharedBubbleList.dataProvider");
         result[107] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedBubbleList.emptyPrompt");
         result[108] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"sharedBubbleList.loading");
         result[109] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userSharedAssetManager.bubbleReady;
         },null,"_ThumbTray_Group19.visible");
         result[110] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Sound");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedSoundPanel.label");
         result[111] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedSoundExplorer.emptyPrompt");
         result[112] = new Binding(this,function():ProductGroupCollection
         {
            return _userSharedAssetManager.soundSource;
         },null,"sharedSoundExplorer.productProvider");
         result[113] = new Binding(this,function():Boolean
         {
            return _userSharedAssetManager.hasMoreSound;
         },null,"_ThumbTray_Group20.visible");
         result[114] = new Binding(this,function():Boolean
         {
            return _userSharedAssetManager.hasMoreSound;
         },null,"_ThumbTray_Group20.includeInLayout");
         result[115] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Load more Sound");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ThumbTray_Button6.label");
         result[116] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userSharedAssetManager.soundReady;
         },null,"_ThumbTray_Group21.visible");
         result[117] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Videos");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedVideoPanel.label");
         result[118] = new Binding(this,function():IList
         {
            return _userSharedAssetManager.videoSource;
         },null,"sharedVideoPropList.dataProvider");
         result[119] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"sharedVideoPropList.emptyPrompt");
         result[120] = new Binding(this,function():Boolean
         {
            return _gettingAssets;
         },null,"sharedVideoPropList.loading");
         result[121] = new Binding(this,function():Boolean
         {
            return _gettingAssets || !_userSharedAssetManager.videoReady;
         },null,"_ThumbTray_Group22.visible");
         result[122] = new Binding(this,null,null,"movieTabBar.dataProvider","movieNavigator");
         result[123] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.translate(LABEL_TEMPLATES);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"movieBackgroundPanel.label");
         result[124] = new Binding(this,function():IList
         {
            return _movieBackgroundSource;
         },null,"movieBackgroundList.dataProvider");
         result[125] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Characters");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"movieCharacterPanel.label");
         result[126] = new Binding(this,function():IList
         {
            return _movieCharacterSource;
         },null,"movieCharacterList.dataProvider");
         result[127] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Props");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"moviePropPanel.label");
         result[128] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","No item to display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"moviePropExplorer.emptyPrompt");
         result[129] = new Binding(this,function():ProductGroupCollection
         {
            return _moviePropCollection;
         },null,"moviePropExplorer.productProvider");
         result[130] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Text");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"movieBubblePanel.label");
         result[131] = new Binding(this,function():IList
         {
            return _movieBubbleSource;
         },null,"_ThumbTray_DecoratedList12.dataProvider");
         result[132] = new Binding(this,function():String
         {
            var _loc1_:* = undefined;
            _loc1_ = UtilDict.toDisplay("go","Effects");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"movieEffectPanel.label");
         result[133] = new Binding(this,function():IList
         {
            return _movieEffectSource;
         },null,"movieEffectList.dataProvider");
         result[134] = new Binding(this,function():Boolean
         {
            return !active;
         },null,"_ThumbTray_Group23.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get commonSoundExplorer() : ProductExplorer
      {
         return this._1429652035commonSoundExplorer;
      }
      
      public function set commonSoundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1429652035commonSoundExplorer;
         if(_loc2_ !== param1)
         {
            this._1429652035commonSoundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"commonSoundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get communityPanel() : CommunityPanel
      {
         return this._827224987communityPanel;
      }
      
      public function set communityPanel(param1:CommunityPanel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._827224987communityPanel;
         if(_loc2_ !== param1)
         {
            this._827224987communityPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"communityPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get importerButton() : ImporterButton
      {
         return this._402532580importerButton;
      }
      
      public function set importerButton(param1:ImporterButton) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._402532580importerButton;
         if(_loc2_ !== param1)
         {
            this._402532580importerButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"importerButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieBackgroundList() : DecoratedList
      {
         return this._215411260movieBackgroundList;
      }
      
      public function set movieBackgroundList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._215411260movieBackgroundList;
         if(_loc2_ !== param1)
         {
            this._215411260movieBackgroundList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieBackgroundList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieBackgroundPanel() : spark.components.NavigatorContent
      {
         return this._1908734938movieBackgroundPanel;
      }
      
      public function set movieBackgroundPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1908734938movieBackgroundPanel;
         if(_loc2_ !== param1)
         {
            this._1908734938movieBackgroundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieBackgroundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieBubblePanel() : spark.components.NavigatorContent
      {
         return this._1958123640movieBubblePanel;
      }
      
      public function set movieBubblePanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1958123640movieBubblePanel;
         if(_loc2_ !== param1)
         {
            this._1958123640movieBubblePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieBubblePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieCharacterList() : DecoratedList
      {
         return this._1634419223movieCharacterList;
      }
      
      public function set movieCharacterList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1634419223movieCharacterList;
         if(_loc2_ !== param1)
         {
            this._1634419223movieCharacterList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieCharacterList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieCharacterPanel() : spark.components.NavigatorContent
      {
         return this._869161045movieCharacterPanel;
      }
      
      public function set movieCharacterPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._869161045movieCharacterPanel;
         if(_loc2_ !== param1)
         {
            this._869161045movieCharacterPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieCharacterPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieContentGroup() : spark.components.NavigatorContent
      {
         return this._1989410602movieContentGroup;
      }
      
      public function set movieContentGroup(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1989410602movieContentGroup;
         if(_loc2_ !== param1)
         {
            this._1989410602movieContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieEffectList() : DecoratedList
      {
         return this._450458337movieEffectList;
      }
      
      public function set movieEffectList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._450458337movieEffectList;
         if(_loc2_ !== param1)
         {
            this._450458337movieEffectList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieEffectList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieEffectPanel() : spark.components.NavigatorContent
      {
         return this._1075855965movieEffectPanel;
      }
      
      public function set movieEffectPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1075855965movieEffectPanel;
         if(_loc2_ !== param1)
         {
            this._1075855965movieEffectPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieEffectPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieNavigator() : ViewStack
      {
         return this._960045319movieNavigator;
      }
      
      public function set movieNavigator(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._960045319movieNavigator;
         if(_loc2_ !== param1)
         {
            this._960045319movieNavigator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieNavigator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moviePropExplorer() : ProductExplorer
      {
         return this._1600428050moviePropExplorer;
      }
      
      public function set moviePropExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1600428050moviePropExplorer;
         if(_loc2_ !== param1)
         {
            this._1600428050moviePropExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moviePropExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get moviePropPanel() : spark.components.NavigatorContent
      {
         return this._535293167moviePropPanel;
      }
      
      public function set moviePropPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._535293167moviePropPanel;
         if(_loc2_ !== param1)
         {
            this._535293167moviePropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"moviePropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieTabBar() : TabBar
      {
         return this._1211127922movieTabBar;
      }
      
      public function set movieTabBar(param1:TabBar) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1211127922movieTabBar;
         if(_loc2_ !== param1)
         {
            this._1211127922movieTabBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieTabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get navigatorGroup() : ViewStack
      {
         return this._1251916392navigatorGroup;
      }
      
      public function set navigatorGroup(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1251916392navigatorGroup;
         if(_loc2_ !== param1)
         {
            this._1251916392navigatorGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"navigatorGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get searchPanel() : ProductSearchPanel
      {
         return this._553648836searchPanel;
      }
      
      public function set searchPanel(param1:ProductSearchPanel) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._553648836searchPanel;
         if(_loc2_ !== param1)
         {
            this._553648836searchPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedBackgroundExplorer() : UserBackgroundExplorer
      {
         return this._1687225134sharedBackgroundExplorer;
      }
      
      public function set sharedBackgroundExplorer(param1:UserBackgroundExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1687225134sharedBackgroundExplorer;
         if(_loc2_ !== param1)
         {
            this._1687225134sharedBackgroundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedBackgroundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedBackgroundPanel() : anifire.studio.components.NavigatorContent
      {
         return this._989193809sharedBackgroundPanel;
      }
      
      public function set sharedBackgroundPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._989193809sharedBackgroundPanel;
         if(_loc2_ !== param1)
         {
            this._989193809sharedBackgroundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedBackgroundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedBubbleList() : DecoratedList
      {
         return this._1409466767sharedBubbleList;
      }
      
      public function set sharedBubbleList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1409466767sharedBubbleList;
         if(_loc2_ !== param1)
         {
            this._1409466767sharedBubbleList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedBubbleList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedBubblePanel() : anifire.studio.components.NavigatorContent
      {
         return this._747247411sharedBubblePanel;
      }
      
      public function set sharedBubblePanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._747247411sharedBubblePanel;
         if(_loc2_ !== param1)
         {
            this._747247411sharedBubblePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedBubblePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedContentGroup() : spark.components.NavigatorContent
      {
         return this._272713355sharedContentGroup;
      }
      
      public function set sharedContentGroup(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._272713355sharedContentGroup;
         if(_loc2_ !== param1)
         {
            this._272713355sharedContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedNavigator() : ViewStack
      {
         return this._1146634382sharedNavigator;
      }
      
      public function set sharedNavigator(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1146634382sharedNavigator;
         if(_loc2_ !== param1)
         {
            this._1146634382sharedNavigator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedNavigator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedPropExplorer() : ProductExplorer
      {
         return this._432415289sharedPropExplorer;
      }
      
      public function set sharedPropExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._432415289sharedPropExplorer;
         if(_loc2_ !== param1)
         {
            this._432415289sharedPropExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedPropExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedPropPanel() : anifire.studio.components.NavigatorContent
      {
         return this._1652994428sharedPropPanel;
      }
      
      public function set sharedPropPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1652994428sharedPropPanel;
         if(_loc2_ !== param1)
         {
            this._1652994428sharedPropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedPropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedSoundExplorer() : ProductExplorer
      {
         return this._445027849sharedSoundExplorer;
      }
      
      public function set sharedSoundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._445027849sharedSoundExplorer;
         if(_loc2_ !== param1)
         {
            this._445027849sharedSoundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedSoundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedSoundPanel() : anifire.studio.components.NavigatorContent
      {
         return this._889499770sharedSoundPanel;
      }
      
      public function set sharedSoundPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._889499770sharedSoundPanel;
         if(_loc2_ !== param1)
         {
            this._889499770sharedSoundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedSoundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedTabBar() : TabBar
      {
         return this._1029400317sharedTabBar;
      }
      
      public function set sharedTabBar(param1:TabBar) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1029400317sharedTabBar;
         if(_loc2_ !== param1)
         {
            this._1029400317sharedTabBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedTabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedVideoPanel() : anifire.studio.components.NavigatorContent
      {
         return this._385898354sharedVideoPanel;
      }
      
      public function set sharedVideoPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._385898354sharedVideoPanel;
         if(_loc2_ !== param1)
         {
            this._385898354sharedVideoPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedVideoPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sharedVideoPropList() : DecoratedList
      {
         return this._724780073sharedVideoPropList;
      }
      
      public function set sharedVideoPropList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._724780073sharedVideoPropList;
         if(_loc2_ !== param1)
         {
            this._724780073sharedVideoPropList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharedVideoPropList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamBackgroundExplorer() : UserBackgroundExplorer
      {
         return this._926155978teamBackgroundExplorer;
      }
      
      public function set teamBackgroundExplorer(param1:UserBackgroundExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._926155978teamBackgroundExplorer;
         if(_loc2_ !== param1)
         {
            this._926155978teamBackgroundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamBackgroundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamBackgroundPanel() : anifire.studio.components.NavigatorContent
      {
         return this._1815519577teamBackgroundPanel;
      }
      
      public function set teamBackgroundPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1815519577teamBackgroundPanel;
         if(_loc2_ !== param1)
         {
            this._1815519577teamBackgroundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamBackgroundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamBubbleList() : DecoratedList
      {
         return this._1114325383teamBubbleList;
      }
      
      public function set teamBubbleList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1114325383teamBubbleList;
         if(_loc2_ !== param1)
         {
            this._1114325383teamBubbleList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamBubbleList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamBubblePanel() : anifire.studio.components.NavigatorContent
      {
         return this._187799099teamBubblePanel;
      }
      
      public function set teamBubblePanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._187799099teamBubblePanel;
         if(_loc2_ !== param1)
         {
            this._187799099teamBubblePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamBubblePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamContentGroup() : spark.components.NavigatorContent
      {
         return this._109684867teamContentGroup;
      }
      
      public function set teamContentGroup(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._109684867teamContentGroup;
         if(_loc2_ !== param1)
         {
            this._109684867teamContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamNavigator() : ViewStack
      {
         return this._783507578teamNavigator;
      }
      
      public function set teamNavigator(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._783507578teamNavigator;
         if(_loc2_ !== param1)
         {
            this._783507578teamNavigator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamNavigator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamPropExplorer() : ProductExplorer
      {
         return this._595443777teamPropExplorer;
      }
      
      public function set teamPropExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._595443777teamPropExplorer;
         if(_loc2_ !== param1)
         {
            this._595443777teamPropExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamPropExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamPropPanel() : anifire.studio.components.NavigatorContent
      {
         return this._711830908teamPropPanel;
      }
      
      public function set teamPropPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._711830908teamPropPanel;
         if(_loc2_ !== param1)
         {
            this._711830908teamPropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamPropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamSoundExplorer() : ProductExplorer
      {
         return this._313887983teamSoundExplorer;
      }
      
      public function set teamSoundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._313887983teamSoundExplorer;
         if(_loc2_ !== param1)
         {
            this._313887983teamSoundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamSoundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamSoundPanel() : anifire.studio.components.NavigatorContent
      {
         return this._594358386teamSoundPanel;
      }
      
      public function set teamSoundPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._594358386teamSoundPanel;
         if(_loc2_ !== param1)
         {
            this._594358386teamSoundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamSoundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamTabBar() : TabBar
      {
         return this._1485056773teamTabBar;
      }
      
      public function set teamTabBar(param1:TabBar) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1485056773teamTabBar;
         if(_loc2_ !== param1)
         {
            this._1485056773teamTabBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamTabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamVideoPanel() : anifire.studio.components.NavigatorContent
      {
         return this._681039738teamVideoPanel;
      }
      
      public function set teamVideoPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._681039738teamVideoPanel;
         if(_loc2_ !== param1)
         {
            this._681039738teamVideoPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamVideoPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get teamVideoPropList() : DecoratedList
      {
         return this._1483695905teamVideoPropList;
      }
      
      public function set teamVideoPropList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1483695905teamVideoPropList;
         if(_loc2_ !== param1)
         {
            this._1483695905teamVideoPropList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamVideoPropList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeBackgroundPanel() : spark.components.NavigatorContent
      {
         return this._2029430893themeBackgroundPanel;
      }
      
      public function set themeBackgroundPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._2029430893themeBackgroundPanel;
         if(_loc2_ !== param1)
         {
            this._2029430893themeBackgroundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeBackgroundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeBackgroundProductExplorer() : ProductExplorer
      {
         return this._319134071themeBackgroundProductExplorer;
      }
      
      public function set themeBackgroundProductExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._319134071themeBackgroundProductExplorer;
         if(_loc2_ !== param1)
         {
            this._319134071themeBackgroundProductExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeBackgroundProductExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeBubblePanel() : spark.components.NavigatorContent
      {
         return this._73906353themeBubblePanel;
      }
      
      public function set themeBubblePanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._73906353themeBubblePanel;
         if(_loc2_ !== param1)
         {
            this._73906353themeBubblePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeBubblePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeCategorizedBackgroundProductExplorer() : CategorizedProductExplorer
      {
         return this._1690888190themeCategorizedBackgroundProductExplorer;
      }
      
      public function set themeCategorizedBackgroundProductExplorer(param1:CategorizedProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1690888190themeCategorizedBackgroundProductExplorer;
         if(_loc2_ !== param1)
         {
            this._1690888190themeCategorizedBackgroundProductExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeCategorizedBackgroundProductExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeCharacterExplorer() : ProductExplorer
      {
         return this._1097059393themeCharacterExplorer;
      }
      
      public function set themeCharacterExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1097059393themeCharacterExplorer;
         if(_loc2_ !== param1)
         {
            this._1097059393themeCharacterExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeCharacterExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeCharacterPanel() : spark.components.NavigatorContent
      {
         return this._920444548themeCharacterPanel;
      }
      
      public function set themeCharacterPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._920444548themeCharacterPanel;
         if(_loc2_ !== param1)
         {
            this._920444548themeCharacterPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeCharacterPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeContentGroup() : spark.components.NavigatorContent
      {
         return this._586750447themeContentGroup;
      }
      
      public function set themeContentGroup(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._586750447themeContentGroup;
         if(_loc2_ !== param1)
         {
            this._586750447themeContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeNavigator() : ViewStack
      {
         return this._1317321074themeNavigator;
      }
      
      public function set themeNavigator(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1317321074themeNavigator;
         if(_loc2_ !== param1)
         {
            this._1317321074themeNavigator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeNavigator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themePropList() : ProductExplorer
      {
         return this._1017536394themePropList;
      }
      
      public function set themePropList(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1017536394themePropList;
         if(_loc2_ !== param1)
         {
            this._1017536394themePropList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themePropList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themePropPanel() : spark.components.NavigatorContent
      {
         return this._1482307736themePropPanel;
      }
      
      public function set themePropPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1482307736themePropPanel;
         if(_loc2_ !== param1)
         {
            this._1482307736themePropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themePropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeSelector() : ThemeSelector
      {
         return this._1091963704themeSelector;
      }
      
      public function set themeSelector(param1:ThemeSelector) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1091963704themeSelector;
         if(_loc2_ !== param1)
         {
            this._1091963704themeSelector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeSelector",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeSoundPanel() : spark.components.NavigatorContent
      {
         return this._106820386themeSoundPanel;
      }
      
      public function set themeSoundPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._106820386themeSoundPanel;
         if(_loc2_ !== param1)
         {
            this._106820386themeSoundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeSoundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeTabBar() : TabBar
      {
         return this._486029465themeTabBar;
      }
      
      public function set themeTabBar(param1:TabBar) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._486029465themeTabBar;
         if(_loc2_ !== param1)
         {
            this._486029465themeTabBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeTabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeWidgetList() : ProductExplorer
      {
         return this._57399381themeWidgetList;
      }
      
      public function set themeWidgetList(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._57399381themeWidgetList;
         if(_loc2_ !== param1)
         {
            this._57399381themeWidgetList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeWidgetList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeWidgetPanel() : spark.components.NavigatorContent
      {
         return this._1775930217themeWidgetPanel;
      }
      
      public function set themeWidgetPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1775930217themeWidgetPanel;
         if(_loc2_ !== param1)
         {
            this._1775930217themeWidgetPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeWidgetPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userBackgroundExplorer() : UserBackgroundExplorer
      {
         return this._284323512userBackgroundExplorer;
      }
      
      public function set userBackgroundExplorer(param1:UserBackgroundExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._284323512userBackgroundExplorer;
         if(_loc2_ !== param1)
         {
            this._284323512userBackgroundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userBackgroundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userBackgroundPanel() : anifire.studio.components.NavigatorContent
      {
         return this._1537462741userBackgroundPanel;
      }
      
      public function set userBackgroundPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1537462741userBackgroundPanel;
         if(_loc2_ !== param1)
         {
            this._1537462741userBackgroundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userBackgroundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userBubbleList() : DecoratedList
      {
         return this._917600629userBubbleList;
      }
      
      public function set userBubbleList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._917600629userBubbleList;
         if(_loc2_ !== param1)
         {
            this._917600629userBubbleList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userBubbleList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userBubblePanel() : anifire.studio.components.NavigatorContent
      {
         return this._1615700979userBubblePanel;
      }
      
      public function set userBubblePanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1615700979userBubblePanel;
         if(_loc2_ !== param1)
         {
            this._1615700979userBubblePanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userBubblePanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userCharacterList() : DecoratedList
      {
         return this._9885348userCharacterList;
      }
      
      public function set userCharacterList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._9885348userCharacterList;
         if(_loc2_ !== param1)
         {
            this._9885348userCharacterList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userCharacterList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userCharacterPanel() : spark.components.NavigatorContent
      {
         return this._302995194userCharacterPanel;
      }
      
      public function set userCharacterPanel(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._302995194userCharacterPanel;
         if(_loc2_ !== param1)
         {
            this._302995194userCharacterPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userCharacterPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userContentGroup() : spark.components.NavigatorContent
      {
         return this._35757297userContentGroup;
      }
      
      public function set userContentGroup(param1:spark.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._35757297userContentGroup;
         if(_loc2_ !== param1)
         {
            this._35757297userContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userNavigator() : ViewStack
      {
         return this._1578143028userNavigator;
      }
      
      public function set userNavigator(param1:ViewStack) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1578143028userNavigator;
         if(_loc2_ !== param1)
         {
            this._1578143028userNavigator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userNavigator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userPropExplorer() : ProductExplorer
      {
         return this._669371347userPropExplorer;
      }
      
      public function set userPropExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._669371347userPropExplorer;
         if(_loc2_ !== param1)
         {
            this._669371347userPropExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userPropExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userPropPanel() : anifire.studio.components.NavigatorContent
      {
         return this._1221485782userPropPanel;
      }
      
      public function set userPropPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1221485782userPropPanel;
         if(_loc2_ !== param1)
         {
            this._1221485782userPropPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userPropPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userSoundExplorer() : ProductExplorer
      {
         return this._1689324643userSoundExplorer;
      }
      
      public function set userSoundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1689324643userSoundExplorer;
         if(_loc2_ !== param1)
         {
            this._1689324643userSoundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userSoundExplorer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userSoundPanel() : anifire.studio.components.NavigatorContent
      {
         return this._397633632userSoundPanel;
      }
      
      public function set userSoundPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._397633632userSoundPanel;
         if(_loc2_ !== param1)
         {
            this._397633632userSoundPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userSoundPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userTabBar() : TabBar
      {
         return this._1602696169userTabBar;
      }
      
      public function set userTabBar(param1:TabBar) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1602696169userTabBar;
         if(_loc2_ !== param1)
         {
            this._1602696169userTabBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userTabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userVideoPanel() : anifire.studio.components.NavigatorContent
      {
         return this._877764492userVideoPanel;
      }
      
      public function set userVideoPanel(param1:anifire.studio.components.NavigatorContent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._877764492userVideoPanel;
         if(_loc2_ !== param1)
         {
            this._877764492userVideoPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userVideoPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userVideoPropList() : DecoratedList
      {
         return this._519516721userVideoPropList;
      }
      
      public function set userVideoPropList(param1:DecoratedList) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._519516721userVideoPropList;
         if(_loc2_ !== param1)
         {
            this._519516721userVideoPropList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userVideoPropList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userAssetManager() : UserAssetManager
      {
         return this._1895618663_userAssetManager;
      }
      
      private function set _userAssetManager(param1:UserAssetManager) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1895618663_userAssetManager;
         if(_loc2_ !== param1)
         {
            this._1895618663_userAssetManager = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userAssetManager",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userSharedAssetManager() : SharedAssetManager
      {
         return this._1563661844_userSharedAssetManager;
      }
      
      private function set _userSharedAssetManager(param1:SharedAssetManager) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1563661844_userSharedAssetManager;
         if(_loc2_ !== param1)
         {
            this._1563661844_userSharedAssetManager = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userSharedAssetManager",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _adminTeamAssetManager() : SharedAssetManager
      {
         return this._1531677706_adminTeamAssetManager;
      }
      
      private function set _adminTeamAssetManager(param1:SharedAssetManager) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1531677706_adminTeamAssetManager;
         if(_loc2_ !== param1)
         {
            this._1531677706_adminTeamAssetManager = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_adminTeamAssetManager",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userBackgroundReady() : Boolean
      {
         return this._1719104757_userBackgroundReady;
      }
      
      private function set _userBackgroundReady(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1719104757_userBackgroundReady;
         if(_loc2_ !== param1)
         {
            this._1719104757_userBackgroundReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userBackgroundReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userVideoReady() : Boolean
      {
         return this._607690290_userVideoReady;
      }
      
      private function set _userVideoReady(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._607690290_userVideoReady;
         if(_loc2_ !== param1)
         {
            this._607690290_userVideoReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userVideoReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userBubbleReady() : Boolean
      {
         return this._1425113453_userBubbleReady;
      }
      
      private function set _userBubbleReady(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1425113453_userBubbleReady;
         if(_loc2_ !== param1)
         {
            this._1425113453_userBubbleReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userBubbleReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasMoreUserProp() : Boolean
      {
         return this._191677886_hasMoreUserProp;
      }
      
      private function set _hasMoreUserProp(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._191677886_hasMoreUserProp;
         if(_loc2_ !== param1)
         {
            this._191677886_hasMoreUserProp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasMoreUserProp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userSoundReady() : Boolean
      {
         return this._1883088414_userSoundReady;
      }
      
      private function set _userSoundReady(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1883088414_userSoundReady;
         if(_loc2_ !== param1)
         {
            this._1883088414_userSoundReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userSoundReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasMoreUserSound() : Boolean
      {
         return this._1649734164_hasMoreUserSound;
      }
      
      private function set _hasMoreUserSound(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1649734164_hasMoreUserSound;
         if(_loc2_ !== param1)
         {
            this._1649734164_hasMoreUserSound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasMoreUserSound",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasMoreUserCharacter() : Boolean
      {
         return this._890362286_hasMoreUserCharacter;
      }
      
      private function set _hasMoreUserCharacter(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._890362286_hasMoreUserCharacter;
         if(_loc2_ !== param1)
         {
            this._890362286_hasMoreUserCharacter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasMoreUserCharacter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _themePropReady() : Boolean
      {
         return this._1327204778_themePropReady;
      }
      
      private function set _themePropReady(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1327204778_themePropReady;
         if(_loc2_ !== param1)
         {
            this._1327204778_themePropReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themePropReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _loadingThemeCC() : Boolean
      {
         return this._430393044_loadingThemeCC;
      }
      
      private function set _loadingThemeCC(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._430393044_loadingThemeCC;
         if(_loc2_ !== param1)
         {
            this._430393044_loadingThemeCC = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadingThemeCC",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _teamBackgroundReady() : Boolean
      {
         return this._1633877561_teamBackgroundReady;
      }
      
      private function set _teamBackgroundReady(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1633877561_teamBackgroundReady;
         if(_loc2_ !== param1)
         {
            this._1633877561_teamBackgroundReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_teamBackgroundReady",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeCharacterCollection() : CharacterExplorerCollection
      {
         return this._974242435_themeCharacterCollection;
      }
      
      protected function set _themeCharacterCollection(param1:CharacterExplorerCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._974242435_themeCharacterCollection;
         if(_loc2_ !== param1)
         {
            this._974242435_themeCharacterCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeCharacterCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _movieCharacterSource() : ArrayCollection
      {
         return this._1823316531_movieCharacterSource;
      }
      
      protected function set _movieCharacterSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1823316531_movieCharacterSource;
         if(_loc2_ !== param1)
         {
            this._1823316531_movieCharacterSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_movieCharacterSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _userCharacterSource() : ArrayCollection
      {
         return this._887474534_userCharacterSource;
      }
      
      protected function set _userCharacterSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._887474534_userCharacterSource;
         if(_loc2_ !== param1)
         {
            this._887474534_userCharacterSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userCharacterSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _commonSoundCollection() : SoundGroupCollection
      {
         return this._36509533_commonSoundCollection;
      }
      
      protected function set _commonSoundCollection(param1:SoundGroupCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._36509533_commonSoundCollection;
         if(_loc2_ !== param1)
         {
            this._36509533_commonSoundCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_commonSoundCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _bubbleSource() : ArrayCollection
      {
         return this._222288294_bubbleSource;
      }
      
      protected function set _bubbleSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._222288294_bubbleSource;
         if(_loc2_ !== param1)
         {
            this._222288294_bubbleSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bubbleSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _textComponentSource() : ArrayCollection
      {
         return this._1298423756_textComponentSource;
      }
      
      private function set _textComponentSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1298423756_textComponentSource;
         if(_loc2_ !== param1)
         {
            this._1298423756_textComponentSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_textComponentSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _movieBubbleSource() : ArrayCollection
      {
         return this._705846120_movieBubbleSource;
      }
      
      protected function set _movieBubbleSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._705846120_movieBubbleSource;
         if(_loc2_ !== param1)
         {
            this._705846120_movieBubbleSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_movieBubbleSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeBackgroundCollection() : BackgroundExplorerCollection
      {
         return this._417104470_themeBackgroundCollection;
      }
      
      protected function set _themeBackgroundCollection(param1:BackgroundExplorerCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._417104470_themeBackgroundCollection;
         if(_loc2_ !== param1)
         {
            this._417104470_themeBackgroundCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeBackgroundCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _tutorialBackgroundCollection() : BackgroundExplorerCollection
      {
         return this._1525190345_tutorialBackgroundCollection;
      }
      
      protected function set _tutorialBackgroundCollection(param1:BackgroundExplorerCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1525190345_tutorialBackgroundCollection;
         if(_loc2_ !== param1)
         {
            this._1525190345_tutorialBackgroundCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tutorialBackgroundCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _movieBackgroundSource() : ArrayCollection
      {
         return this._715977530_movieBackgroundSource;
      }
      
      protected function set _movieBackgroundSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._715977530_movieBackgroundSource;
         if(_loc2_ !== param1)
         {
            this._715977530_movieBackgroundSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_movieBackgroundSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themePropCollection() : PropExplorerCollection
      {
         return this._1476654645_themePropCollection;
      }
      
      protected function set _themePropCollection(param1:PropExplorerCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1476654645_themePropCollection;
         if(_loc2_ !== param1)
         {
            this._1476654645_themePropCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themePropCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeWidgetCollection() : WidgetExplorerCollection
      {
         return this._1464653588_themeWidgetCollection;
      }
      
      protected function set _themeWidgetCollection(param1:WidgetExplorerCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1464653588_themeWidgetCollection;
         if(_loc2_ !== param1)
         {
            this._1464653588_themeWidgetCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeWidgetCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _moviePropCollection() : PropExplorerCollection
      {
         return this._1028707058_moviePropCollection;
      }
      
      protected function set _moviePropCollection(param1:PropExplorerCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1028707058_moviePropCollection;
         if(_loc2_ !== param1)
         {
            this._1028707058_moviePropCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_moviePropCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _themeEffectSource() : ArrayCollection
      {
         return this._844158218_themeEffectSource;
      }
      
      protected function set _themeEffectSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._844158218_themeEffectSource;
         if(_loc2_ !== param1)
         {
            this._844158218_themeEffectSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeEffectSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _movieEffectSource() : ArrayCollection
      {
         return this._874648029_movieEffectSource;
      }
      
      protected function set _movieEffectSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._874648029_movieEffectSource;
         if(_loc2_ !== param1)
         {
            this._874648029_movieEffectSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_movieEffectSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _useSearchSuggestion() : Boolean
      {
         return this._1433812300_useSearchSuggestion;
      }
      
      protected function set _useSearchSuggestion(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1433812300_useSearchSuggestion;
         if(_loc2_ !== param1)
         {
            this._1433812300_useSearchSuggestion = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_useSearchSuggestion",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showTextComponentCreationPanel() : Boolean
      {
         return this._680717041_showTextComponentCreationPanel;
      }
      
      private function set _showTextComponentCreationPanel(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._680717041_showTextComponentCreationPanel;
         if(_loc2_ !== param1)
         {
            this._680717041_showTextComponentCreationPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showTextComponentCreationPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showTextComponentList() : Boolean
      {
         return this._1111861614_showTextComponentList;
      }
      
      private function set _showTextComponentList(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1111861614_showTextComponentList;
         if(_loc2_ !== param1)
         {
            this._1111861614_showTextComponentList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showTextComponentList",_loc2_,param1));
            }
         }
      }
      
      public function set active(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this.active;
         if(_loc2_ !== param1)
         {
            this._1422950650active = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"active",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasTemplates() : Boolean
      {
         return this._1207892066_hasTemplates;
      }
      
      private function set _hasTemplates(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1207892066_hasTemplates;
         if(_loc2_ !== param1)
         {
            this._1207892066_hasTemplates = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasTemplates",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _gettingAssets() : Boolean
      {
         return this._720238056_gettingAssets;
      }
      
      private function set _gettingAssets(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._720238056_gettingAssets;
         if(_loc2_ !== param1)
         {
            this._720238056_gettingAssets = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_gettingAssets",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _loadingThemeStarter() : Boolean
      {
         return this._204093661_loadingThemeStarter;
      }
      
      private function set _loadingThemeStarter(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._204093661_loadingThemeStarter;
         if(_loc2_ !== param1)
         {
            this._204093661_loadingThemeStarter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadingThemeStarter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _loadingUserStarter() : Boolean
      {
         return this._461614585_loadingUserStarter;
      }
      
      private function set _loadingUserStarter(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._461614585_loadingUserStarter;
         if(_loc2_ !== param1)
         {
            this._461614585_loadingUserStarter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadingUserStarter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _loadingUserBackground() : Boolean
      {
         return this._760754358_loadingUserBackground;
      }
      
      private function set _loadingUserBackground(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._760754358_loadingUserBackground;
         if(_loc2_ !== param1)
         {
            this._760754358_loadingUserBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadingUserBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _loadingTeamBackground() : Boolean
      {
         return this._957479112_loadingTeamBackground;
      }
      
      private function set _loadingTeamBackground(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._957479112_loadingTeamBackground;
         if(_loc2_ !== param1)
         {
            this._957479112_loadingTeamBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadingTeamBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _loadingTeamStarter() : Boolean
      {
         return this._1692675275_loadingTeamStarter;
      }
      
      private function set _loadingTeamStarter(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._1692675275_loadingTeamStarter;
         if(_loc2_ !== param1)
         {
            this._1692675275_loadingTeamStarter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadingTeamStarter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _useExtraLargeBackgroundThumbnails() : Boolean
      {
         return this._22368616_useExtraLargeBackgroundThumbnails;
      }
      
      private function set _useExtraLargeBackgroundThumbnails(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._22368616_useExtraLargeBackgroundThumbnails;
         if(_loc2_ !== param1)
         {
            this._22368616_useExtraLargeBackgroundThumbnails = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_useExtraLargeBackgroundThumbnails",_loc2_,param1));
            }
         }
      }
   }
}
