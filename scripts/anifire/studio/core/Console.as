package anifire.studio.core
{
   import anifire.component.ProgressMonitor;
   import anifire.constant.AnimeConstants;
   import anifire.constant.LicenseConstants;
   import anifire.constant.ProductConstants;
   import anifire.constant.ResponseConstants;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.core.AssetLinkage;
   import anifire.effect.ZoomEffect;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.event.ServerRequestEvent;
   import anifire.event.StudioEvent;
   import anifire.interfaces.IIterator;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.managers.AppConfigManager;
   import anifire.managers.CCBodyManager;
   import anifire.managers.CCThemeManager;
   import anifire.managers.ExternalLinkManager;
   import anifire.managers.FeatureManager;
   import anifire.managers.NativeCursorManager;
   import anifire.managers.ServerConnector;
   import anifire.models.FontModel;
   import anifire.models.creator.CCBodyModel;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.models.creator.CCThemeModel;
   import anifire.studio.commands.AddSceneCommand;
   import anifire.studio.commands.AddSoundCommand;
   import anifire.studio.commands.AddSpeechCommand;
   import anifire.studio.commands.AddStarterCommand;
   import anifire.studio.commands.BringForwardCommand;
   import anifire.studio.commands.ClearSceneCommand;
   import anifire.studio.commands.CommandStack;
   import anifire.studio.commands.FlipAssetCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.RemoveAssetCollectionCommand;
   import anifire.studio.commands.SendBackwardCommand;
   import anifire.studio.components.AlertPopUp;
   import anifire.studio.components.ConfirmPopUp;
   import anifire.studio.components.DefaultToolTip;
   import anifire.studio.components.EffectTray;
   import anifire.studio.components.ExternalPreviewWindowController;
   import anifire.studio.components.FlowFrameImageEditor;
   import anifire.studio.components.KeepEditingPopUp;
   import anifire.studio.components.MainStage;
   import anifire.studio.components.PropertiesWindow;
   import anifire.studio.components.PublishWindow;
   import anifire.studio.components.SaveStarterWindow;
   import anifire.studio.components.SaveTextComponentWindow;
   import anifire.studio.components.SceneEditor;
   import anifire.studio.components.SceneView;
   import anifire.studio.components.ScreenCapTool;
   import anifire.studio.components.StarterDropLayer;
   import anifire.studio.components.StudioProgressBar;
   import anifire.studio.components.ThumbTray;
   import anifire.studio.components.Timeline;
   import anifire.studio.components.TinyEffectTray;
   import anifire.studio.components.TutorialLayer;
   import anifire.studio.components.WixPublishWindow;
   import anifire.studio.core.sound.SoundCollection;
   import anifire.studio.core.sound.SoundCollectionEvent;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.core.sound.SoundSelection;
   import anifire.studio.events.MovieEvent;
   import anifire.studio.events.SaveMovieCompleteEvent;
   import anifire.studio.events.SceneDurationEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.events.SceneViewEvent;
   import anifire.studio.events.TimelineEvent;
   import anifire.studio.events.TutorialEvent;
   import anifire.studio.events.UploadStuffEvent;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.managers.AccessRightManager;
   import anifire.studio.managers.MovieManager;
   import anifire.studio.managers.PreferenceManager;
   import anifire.studio.managers.SceneLengthController;
   import anifire.studio.managers.SceneManager;
   import anifire.studio.managers.SceneThumbnailManager;
   import anifire.studio.managers.SearchManager;
   import anifire.studio.managers.SoundCollectionController;
   import anifire.studio.managers.SoundPlaybackManager;
   import anifire.studio.managers.SpeechManager;
   import anifire.studio.managers.StudioDragManager;
   import anifire.studio.managers.StudioManager;
   import anifire.studio.managers.StudioSoundManager;
   import anifire.studio.managers.StudioStatusManager;
   import anifire.studio.managers.TeamManager;
   import anifire.studio.managers.TextComponentManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.ThemeStarterManager;
   import anifire.studio.managers.TimelineController;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.managers.WatermarkManager;
   import anifire.studio.models.TextComponentData;
   import anifire.util.ApiRequest;
   import anifire.util.FontManager;
   import anifire.util.Util;
   import anifire.util.UtilApp;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilSite;
   import anifire.util.UtilSystem;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilUser;
   import anifire.util.UtilXmlInfo;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.StageQuality;
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.NetStatusEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.net.SharedObjectFlushStatus;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import mx.collections.XMLListCollection;
   import mx.core.DragSource;
   import mx.core.FlexGlobals;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.managers.PopUpManager;
   import mx.managers.ToolTipManager;
   import mx.utils.StringUtil;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.events.PopUpEvent;
   
   public class Console extends EventDispatcher
   {
      
      private static const MOVIE_ZIP_FONT_INFO:String = "custom_font.json";
      
      private static const MOVIE_ZIP_THEMELIST:String = "themelist.xml";
      
      private static var _console:Console;
      
      public static const ACTION_TUTORIAL_RESTART:String = "actionTutorialRestart";
       
      
      private var _thumbTray:ThumbTray;
      
      private var _effectTray:EffectTray;
      
      private var _tinyEffectTray:TinyEffectTray;
      
      private var _mainStage:MainStage;
      
      private var _timeline:Timeline;
      
      private var _pptPanel:PropertiesWindow;
      
      private var _themeListXML:XML;
      
      private var _upsellHookId:String;
      
      private var _expectedUserType:Number = -1;
      
      private var _usingBusinessStudio:Boolean;
      
      private var _exceedDurationLimit:Boolean;
      
      private var _sounds:SoundCollection;
      
      private var _soundsController:SoundCollectionController;
      
      private var _voices:SoundCollection;
      
      private var _voicesController:SoundCollectionController;
      
      private var _timelineController:TimelineController;
      
      private var _changed:Boolean;
      
      private var _starterMetaData:MetaData;
      
      private var _metaData:MetaData;
      
      private var _tempPublished:Boolean = true;
      
      private var _tempPrivateShared:Boolean;
      
      private var _tempPasswordProtected:Boolean;
      
      private var _movieXML:XML;
      
      private var _movieZip:ZipFile;
      
      private var _originalId:String;
      
      private var _loadProgress:StudioProgressBar;
      
      private var _progressMonitor:ProgressMonitor;
      
      private var _initialized:Boolean;
      
      private var _capScreenLock:Boolean;
      
      private var _defaultUpdateAllTimelineImage:Boolean;
      
      private var _badTerms:Array;
      
      private var _whiteTerms:Array;
      
      public var excludedIds:UtilHashArray;
      
      private var _blacklistEnabled:Boolean;
      
      private var _currDragObject:Asset;
      
      private var _soundMute:Boolean = true;
      
      private var _watermarkManager:WatermarkManager;
      
      private var _uploadedAssetsEnabled:Boolean;
      
      private var _siteId:String;
      
      private var _initCreation:Boolean = true;
      
      private var _screenCapTool:ScreenCapTool;
      
      private var _currentLicensorName:String = "";
      
      private var _initThemeCode:String;
      
      private var _skipSceneRendering:Boolean;
      
      private var externalPreviewPlayerController:ExternalPreviewWindowController;
      
      private var _speechManager:SpeechManager;
      
      private var _movie:MovieData;
      
      private var _groupController:GroupController;
      
      private var _addBlankScene:Boolean;
      
      private var _shouldUseExternalPreviewPlayer:Number = -1;
      
      private var _linkageController:LinkageController;
      
      private var _thumbSO:SharedObject;
      
      private var _copiedAssets:CopiedAssets;
      
      private var _pasteAssetOffset:int;
      
      private var _isStudioReady:Boolean;
      
      private var _publishQuality:String = "360p";
      
      private var _screenMode:String = "normal_screen_node";
      
      private var _selectedSceneIndexBeforeCapture:int = 0;
      
      private var _initStart:Date;
      
      private var _userAssetManager:UserAssetManager;
      
      private var _thumbnailManager:SceneThumbnailManager;
      
      private var _themeManager:ThemeManager;
      
      private var _movieManager:MovieManager;
      
      private var _starterManager:MovieManager;
      
      private var _isSavingMovie:Boolean;
      
      private var _preparingMovieThumbnail:Boolean;
      
      private var _isAutoSave:Boolean;
      
      private var _statusManager:StudioStatusManager;
      
      private var _serverConnector:ServerConnector;
      
      private var _configManager:AppConfigManager;
      
      private var _tutorialLayer:TutorialLayer;
      
      private var _tutorialManager:TutorialManager;
      
      private var _starterDropLayer:StarterDropLayer;
      
      private var _publishedOnOpen:Boolean;
      
      private var _defaultHandStyle:int = -1;
      
      public var flowFrameImageEditor:FlowFrameImageEditor;
      
      private var _isScrollThumbDragging:Boolean;
      
      public var textComponentData:TextComponentData;
      
      private var _teamDraftOnly:Boolean;
      
      private var _passwordProtectedSharingEnabled:Boolean;
      
      private var _hasCollaboration:Boolean;
      
      private var _hasFeaturedCategory:Boolean;
      
      private var _featuredCategoryByURL:Array;
      
      private var _assetTagsEnabled:Boolean;
      
      private var _customFontListReady:Boolean;
      
      private var _assetTagsReady:Boolean;
      
      private var _teamMemberListReady:Boolean;
      
      private var _studioPreferenceReady:Boolean;
      
      private var _customFontListLoader:URLLoader;
      
      private var _assetTagsLoader:URLLoader;
      
      private var _skipNotifyWorkNote:Boolean;
      
      private var workNotePopUp:ConfirmPopUp;
      
      private var _workNoteSidebarVisible:Boolean = true;
      
      private var heartbeatPopUp:ConfirmPopUp;
      
      private var ignoreHeartbeatTakeover:Boolean;
      
      private var _currSceneOnlyForTemp:Boolean = false;
      
      private var _addedVoice:AnimeSound;
      
      private var _charIdForAddedVoice:String;
      
      private var _previewData:UtilHashArray;
      
      private var _sceneDeserializeIndex:int;
      
      private var _filmXML:XML;
      
      private var _hasShorterDurationLimit:Boolean;
      
      private var _isLoadingStarter:Boolean = false;
      
      private var _starterSceneIds:Array;
      
      private var _errorLoadingThemeStarter:Boolean = false;
      
      private var _insertSceneAtIndex:int = 0;
      
      private var _selectedStarterThumb:BackgroundThumb;
      
      private var _movieDuration:Number;
      
      private var _movieSceneNumber:Number;
      
      private var _forValidation:Boolean;
      
      private var _publishW:PublishWindow;
      
      private var _redirect:Boolean = false;
      
      private var _processingStarter:Boolean;
      
      private var actionAfterAutoSave:String;
      
      private var restartTutorialPopUp:ConfirmPopUp;
      
      private var _selectedThumbForTempIndex:int = 0;
      
      private var _targetStarterId:String;
      
      public function Console(param1:MainStage, param2:ThumbTray, param3:EffectTray, param4:Timeline, param5:PropertiesWindow, param6:ScreenCapTool)
      {
         var _loc7_:String = null;
         this._sounds = new SoundCollection();
         this._soundsController = new SoundCollectionController(this._sounds);
         this._voices = new SoundCollection();
         this._voicesController = new SoundCollectionController(this._voices);
         this._watermarkManager = new WatermarkManager();
         this._speechManager = new SpeechManager();
         this._copiedAssets = new CopiedAssets();
         this._movieManager = new MovieManager();
         this._starterManager = new MovieManager();
         this._statusManager = StudioStatusManager.instance;
         this._configManager = AppConfigManager.instance;
         this._tutorialManager = TutorialManager.instance;
         super();
         if(param1 && param2 && param4)
         {
            this._initStart = new Date();
            ToolTipManager.toolTipClass = DefaultToolTip;
            this._userAssetManager = UserAssetManager.instance;
            this._userAssetManager.addEventListener(UploadStuffEvent.UPLOAD_STUFF_COMPLETE,this.onUploadStuffComplete);
            this._userAssetManager.addEventListener(UploadStuffEvent.UPLOAD_STUFF_FAIL,this.onUploadStuffFail);
            Util.initLog();
            this._mainStage = param1;
            this._thumbTray = param2;
            this._timeline = param4;
            if(param3)
            {
               this._effectTray = param3;
            }
            else
            {
               this._effectTray = param5.joinEffectPanel.effectOptionPanel.effectTray;
               this._tinyEffectTray = param1.tinyEffectTray;
            }
            this.pptPanel = param5;
            this.screenCapTool = param6;
            this._progressMonitor = new ProgressMonitor();
            this._progressMonitor.addEventListener(ProgressEvent.PROGRESS,this.showProgress);
            _loc7_ = this.getIdToLoad();
            this._progressMonitor.numProgress = _loc7_ != ""?uint(4):uint(1);
            UtilErrorLogger.getInstance().addEventListener(UtilErrorLogger.FATAL_EVENT_LOGGED,this.onFatalEventLogged);
            UtilErrorLogger.getInstance().addEventListener(UtilErrorLogger.LOG_SENT_COMPLETE,this.onErrorLogSentComplete);
            UtilErrorLogger.getInstance().addEventListener(UtilErrorLogger.LOG_SENT_FAIL,this.onErrorLogSentFail);
            this._movie = new MovieData();
            this._movie.selection.addEventListener(Event.CHANGE,this.onSceneSelectionChange);
            this._movie.addEventListener(MovieEvent.SCENE_ADDED,this.onSceneAdded);
            this._movie.addEventListener(MovieEvent.SCENE_REMOVED,this.onSceneRemoved);
            this._movie.addEventListener(MovieEvent.SCENE_MOVED,this.onSceneMoved);
            this._movie.addEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
            this._voices.addEventListener(SoundCollectionEvent.SOUND_ADDED,this.voices_soundChangeHandler);
            this._voices.addEventListener(SoundCollectionEvent.SOUND_REMOVED,this.voices_soundChangeHandler);
            this._voices.addEventListener(SoundCollectionEvent.SOUND_MOVED,this.voices_soundChangeHandler);
            this._soundsController.maxSoundTrackNum = SoundCollectionController.DEFAULT_MAX_SOUND_TRACK_NUM;
            this._voicesController.maxSoundTrackNum = SoundCollectionController.DEFAULT_MAX_VOICE_TRACK_NUM;
            this._timelineController = new TimelineController(this._movie,this._soundsController,this._voicesController);
            this._timeline.soundsController = this._soundsController;
            this._timeline.voicesController = this._voicesController;
            this._timeline.timelineController = this._timelineController;
            this._timeline.addEventListener(TimelineEvent.SCENE_MOUSE_DOWN,this.onSceneDownHandler);
            this._thumbnailManager = new SceneThumbnailManager(this.mainStage.sceneEditor.view);
            this._thumbnailManager.captureSource = this.mainStage.sceneEditor.view.view;
            this._themeManager = ThemeManager.instance;
            this._previewData = new UtilHashArray();
            this._metaData = new MetaData();
            this._starterMetaData = new MetaData();
            this.processAppConfig();
            this.groupController = new GroupController();
            this.groupController.init();
            this.linkageController = new LinkageController();
            this.linkageController.eventDispatcher.addEventListener(SoundEvent.UPDATED,this.onLinkageChange);
            this.requestLoadStatus(true);
            this.initStudio();
            this._serverConnector = ServerConnector.instance;
            this._serverConnector.addEventListener(StudioEvent.UPGRADE_PENDING,this.onUpgradePending);
            this._serverConnector.addEventListener(StudioEvent.UPGRADE_COMPLETE,this.onUpgradeComplete);
            this._serverConnector.addEventListener(StudioEvent.UPGRADE_ERROR,this.onUpgradeError);
            this._serverConnector.addEventListener(StudioEvent.SELECT_SCENE_FROM_NOTE,this.onWorkNoteSelect);
            this._serverConnector.addEventListener(StudioEvent.WORK_NOTE_VISIBILITY_CHANGE,this.onWorkNoteVisiblityChange);
            this._serverConnector.addEventListener(StudioEvent.HEARTBEAT_TAKEOVER,this.onHeartbeatTakeover);
            ExternalInterface.addCallback("getSceneGuid",this.getSceneGuid);
            ExternalInterface.addCallback("getSceneInfoArray",this.getSceneInfoArray);
            UtilApp.mainAppName = UtilApp.STUDIO;
            this.screenMode = !!LicenseConstants.isWideScreen()?AnimeConstants.SCREEN_MODE_WIDE:AnimeConstants.SCREEN_MODE_NORMAL;
         }
      }
      
      public static function initializeConsole(param1:MainStage, param2:ThumbTray, param3:EffectTray, param4:Timeline, param5:PropertiesWindow, param6:ScreenCapTool) : Object
      {
         if(_console == null)
         {
            _console = new Console(param1,param2,param3,param4,param5,param6);
         }
         return _console;
      }
      
      public static function getConsole() : Console
      {
         if(_console)
         {
            return _console;
         }
         throw new Error("Console must be intialized first");
      }
      
      public static function get initialized() : Boolean
      {
         return _console != null;
      }
      
      public function resetExpectedUserType() : void
      {
         this._expectedUserType = -1;
         this._upsellHookId = null;
      }
      
      public function set usingBusinessStudio(param1:Boolean) : void
      {
         this._usingBusinessStudio = param1;
         if(this._usingBusinessStudio && !UtilUser.hasBusinessFeatures)
         {
            this._mainStage.previewSaveWarningVisible = true;
         }
      }
      
      public function get usingBusinessStudio() : Boolean
      {
         return this._usingBusinessStudio;
      }
      
      public function get exceedDurationLimit() : Boolean
      {
         return this._exceedDurationLimit;
      }
      
      public function setIsScrollThumbDragging(param1:Boolean) : void
      {
         this._isScrollThumbDragging = param1;
      }
      
      public function get isScrollThumbDragging() : Boolean
      {
         return this._isScrollThumbDragging;
      }
      
      public function get defaultHandStyle() : int
      {
         return this._defaultHandStyle;
      }
      
      public function set defaultHandStyle(param1:int) : void
      {
         this._defaultHandStyle = param1;
      }
      
      public function get publishedOnOpen() : Boolean
      {
         return this._publishedOnOpen;
      }
      
      public function get teamDraftOnly() : Boolean
      {
         return this._teamDraftOnly;
      }
      
      public function get passwordProtectedSharingEnabled() : Boolean
      {
         return this._passwordProtectedSharingEnabled;
      }
      
      public function get hasCollaboration() : Boolean
      {
         return this._hasCollaboration;
      }
      
      public function get screenMode() : String
      {
         return this._screenMode;
      }
      
      public function set screenMode(param1:String) : void
      {
         this._screenMode = param1;
         this.mainStage.sceneEditor.redrawOffStageArea();
         SceneView(this.mainStage.sceneEditor.view.view).refreshSceneBg(this._screenMode);
      }
      
      public function get starterMetaData() : MetaData
      {
         return this._starterMetaData;
      }
      
      public function set starterMetaData(param1:MetaData) : void
      {
         this._starterMetaData = param1;
      }
      
      public function get watermarkManager() : WatermarkManager
      {
         return this._watermarkManager;
      }
      
      private function set thumbSO(param1:SharedObject) : void
      {
         this._thumbSO = param1;
      }
      
      private function get thumbSO() : SharedObject
      {
         return this._thumbSO;
      }
      
      public function set screenCapTool(param1:ScreenCapTool) : void
      {
         this._screenCapTool = param1;
      }
      
      public function get screenCapTool() : ScreenCapTool
      {
         return this._screenCapTool;
      }
      
      public function set pptPanel(param1:PropertiesWindow) : void
      {
         this._pptPanel = param1;
      }
      
      public function get pptPanel() : PropertiesWindow
      {
         return this._pptPanel;
      }
      
      public function get stageScale() : Number
      {
         return Console.getConsole().mainStage.zoomContainer.zoomFactor;
      }
      
      public function set capScreenLock(param1:Boolean) : void
      {
         this._capScreenLock = param1;
      }
      
      public function get capScreenLock() : Boolean
      {
         return this._capScreenLock;
      }
      
      public function get initCreation() : Boolean
      {
         return this._initCreation;
      }
      
      public function set initCreation(param1:Boolean) : void
      {
         this._initCreation = param1;
      }
      
      public function get themeListXML() : XML
      {
         return this._themeListXML;
      }
      
      public function get currDragSource() : DragSource
      {
         return StudioDragManager.dragSource;
      }
      
      public function set currDragSource(param1:DragSource) : void
      {
         StudioDragManager.dragSource = param1;
      }
      
      public function get currDragObject() : Asset
      {
         return this._currDragObject;
      }
      
      public function set currDragObject(param1:Asset) : void
      {
         this._currDragObject = param1;
      }
      
      public function get thumbTray() : ThumbTray
      {
         return this._thumbTray;
      }
      
      public function get siteId() : String
      {
         return this._siteId;
      }
      
      public function get currentLicensorName() : String
      {
         return this._currentLicensorName;
      }
      
      public function set currentLicensorName(param1:String) : void
      {
         this._currentLicensorName = param1;
      }
      
      public function get mainStage() : MainStage
      {
         return this._mainStage;
      }
      
      public function get sceneEditor() : SceneEditor
      {
         return this._mainStage.sceneEditor;
      }
      
      public function get effectTray() : EffectTray
      {
         return this._effectTray;
      }
      
      public function get tinyEffectTray() : TinyEffectTray
      {
         return this._tinyEffectTray;
      }
      
      public function get timeline() : Timeline
      {
         return this._timeline;
      }
      
      public function set timeline(param1:Timeline) : void
      {
         this._timeline = param1;
      }
      
      public function get timelineController() : TimelineController
      {
         return this._timelineController;
      }
      
      public function get scenes() : Array
      {
         return this._movie.scenes;
      }
      
      public function get currentScene() : AnimeScene
      {
         return this._movie.selection.currentScene;
      }
      
      public function set currentScene(param1:AnimeScene) : void
      {
         this._movie.selection.currentScene = param1;
      }
      
      public function get currentSceneId() : String
      {
         if(this._movie.currentScene != null)
         {
            return this._movie.currentScene.id;
         }
         return null;
      }
      
      public function get sounds() : SoundCollection
      {
         return this._sounds;
      }
      
      public function get voices() : SoundCollection
      {
         return this._voices;
      }
      
      public function get changed() : Boolean
      {
         return this._changed;
      }
      
      public function set changed(param1:Boolean) : void
      {
         this._changed = param1;
         if(param1 && !this._capScreenLock)
         {
            this.doUpdateTimeline(null,true);
            this.updateSceneLength();
         }
      }
      
      public function get metaData() : MetaData
      {
         return this._metaData;
      }
      
      public function get tempPublished() : Boolean
      {
         return this._tempPublished;
      }
      
      public function set tempPublished(param1:Boolean) : void
      {
         this._tempPublished = param1;
      }
      
      public function get tempPrivateShared() : Boolean
      {
         return this._tempPrivateShared;
      }
      
      public function set tempPrivateShared(param1:Boolean) : void
      {
         this._tempPrivateShared = param1;
      }
      
      public function get tempPasswordProtected() : Boolean
      {
         return this._tempPasswordProtected;
      }
      
      public function set tempPasswordProtected(param1:Boolean) : void
      {
         this._tempPasswordProtected = param1;
      }
      
      public function set soundMute(param1:Boolean) : void
      {
         this._soundMute = param1;
         var _loc2_:int = 0;
         if(this.currentScene != null)
         {
            this.currentScene.muteSound(param1);
         }
      }
      
      public function get soundMute() : Boolean
      {
         return this._soundMute;
      }
      
      public function set thumbTrayActive(param1:Boolean) : void
      {
         this.thumbTray.active = param1;
      }
      
      public function get publishW() : PublishWindow
      {
         return this._publishW;
      }
      
      public function set publishW(param1:PublishWindow) : void
      {
         this._publishW = param1;
      }
      
      public function get groupController() : GroupController
      {
         return this._groupController;
      }
      
      public function set groupController(param1:GroupController) : void
      {
         this._groupController = param1;
      }
      
      public function get linkageController() : LinkageController
      {
         return this._linkageController;
      }
      
      public function set linkageController(param1:LinkageController) : void
      {
         this._linkageController = param1;
      }
      
      public function setCurrentSceneById(param1:String) : void
      {
         var _loc2_:int = this._movie.getSceneIndex(this._movie.getSceneById(param1));
         this.setCurrentScene(_loc2_);
      }
      
      public function set currentSceneIndex(param1:Number) : void
      {
         this._movie.currentIndex = param1;
      }
      
      public function get currentSceneIndex() : Number
      {
         return this._movie.currentIndex;
      }
      
      public function get movie() : MovieData
      {
         return this._movie;
      }
      
      public function get speechManager() : SpeechManager
      {
         return this._speechManager;
      }
      
      public function get publishQuality() : String
      {
         return this._publishQuality;
      }
      
      public function set publishQuality(param1:String) : void
      {
         this._publishQuality = param1;
      }
      
      public function setCurrentScene(param1:int) : void
      {
         this._movie.currentIndex = param1;
      }
      
      private function get autoSaveEnabled() : Boolean
      {
         if(UtilSite.siteId == UtilSite.GOANIMATE)
         {
            if(this._usingBusinessStudio && !UtilUser.hasBusinessFeatures)
            {
               return false;
            }
            if(this._exceedDurationLimit && UtilUser.userType == UtilUser.BASIC_USER)
            {
               return false;
            }
         }
         if(this._tutorialManager.currentTutorial)
         {
            return false;
         }
         if(StudioStatusManager.instance.isSoundAlertActive)
         {
            return false;
         }
         return true;
      }
      
      private function initAutoSave() : void
      {
         var _loc1_:Timer = new Timer(AnimeConstants.AUTOSAVE_INTERVAL * 1000);
         _loc1_.addEventListener(TimerEvent.TIMER,this.onAutoSaveTimerHandler);
         _loc1_.start();
      }
      
      private function processAppConfig() : void
      {
         if(this._configManager.getValue("upl") == "0")
         {
            this._thumbTray.disallowUploadedAssets();
         }
         this._blacklistEnabled = this._configManager.getValue("hb") == "1";
         this._siteId = this._configManager.getValue("siteId");
         this._hasShorterDurationLimit = this._configManager.getValue("newusr") == "1";
         this._hasCollaboration = this._configManager.getValue("collab") == "1";
         this._passwordProtectedSharingEnabled = this._configManager.getValue("collab") == "1";
         this._teamDraftOnly = this._configManager.getValue("goteam_draft_only") == "1";
         var _loc1_:String = this._configManager.getValue("featured_categories");
         if(_loc1_)
         {
            this._featuredCategoryByURL = _loc1_.split(",");
         }
         this._hasFeaturedCategory = _loc1_ != null && _loc1_ != "";
      }
      
      public function get assetTagsEnabled() : Boolean
      {
         return this._assetTagsEnabled;
      }
      
      private function initStudio() : void
      {
         var _loc1_:Boolean = UtilSite.isGoAnimate;
         var _loc2_:Boolean = UtilSite.isG4S;
         var _loc3_:Boolean = UtilSite.isWix;
         var _loc4_:AccessRightManager = AccessRightManager.instance;
         if(_loc1_ && _loc4_.getAccess(AccessRightManager.ACCESS_RIGHT_CUSTOM_FONT))
         {
            this.loadCustomFontList();
         }
         else
         {
            this._customFontListReady = true;
         }
         if(_loc1_ && _loc4_.getAccess(AccessRightManager.ACCESS_RIGHT_TEAM_SHARING))
         {
            this.loadTeamMemberList();
         }
         else
         {
            this._teamMemberListReady = true;
         }
         if(_loc1_ || _loc2_)
         {
            this.loadStudioPreference();
         }
         else
         {
            this._studioPreferenceReady = true;
         }
         if(_loc1_ || _loc2_ || _loc3_)
         {
            this.loadAssetTags();
         }
         else
         {
            this._assetTagsReady = true;
            this.checkInitReady();
         }
      }
      
      private function loadCustomFontList() : void
      {
         this._customFontListLoader = new URLLoader();
         var _loc1_:URLRequest = UtilNetwork.getUserFontListRequest();
         this._customFontListLoader.addEventListener(Event.COMPLETE,this.customFontListLoader_completeHandler);
         this._customFontListLoader.addEventListener(IOErrorEvent.IO_ERROR,this.customFontListLoader_errorHandler);
         this._customFontListLoader.load(_loc1_);
      }
      
      private function customFontListLoader_errorHandler(param1:Event) : void
      {
         UtilErrorLogger.getInstance().fatal("Custom Font List error: " + param1);
      }
      
      private function customFontListLoader_completeHandler(param1:Event) : void
      {
         var _loc3_:Array = null;
         this._customFontListLoader.removeEventListener(Event.COMPLETE,this.customFontListLoader_completeHandler);
         this._customFontListLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.customFontListLoader_errorHandler);
         var _loc2_:Object = com.adobe.serialization.json.JSON.decode(this._customFontListLoader.data);
         if(_loc2_[ResponseConstants.STATUS] == ResponseConstants.OK)
         {
            _loc3_ = _loc2_[ResponseConstants.RESULT] as Array;
            FontManager.getFontManager().addCustomFontList(_loc3_);
         }
         this._customFontListReady = true;
         this.checkInitReady();
      }
      
      private function loadAssetTags() : void
      {
         this._assetTagsLoader = new URLLoader();
         var _loc1_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_ASSET_TAGS);
         this._assetTagsLoader.addEventListener(Event.COMPLETE,this.loadAssetTags_completeHandler);
         this._assetTagsLoader.addEventListener(IOErrorEvent.IO_ERROR,this.loadAssetTags_errorHandler);
         this._assetTagsLoader.load(_loc1_);
      }
      
      private function loadAssetTags_completeHandler(param1:Event) : void
      {
         this._assetTagsLoader.removeEventListener(Event.COMPLETE,this.loadAssetTags_completeHandler);
         this._assetTagsLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.loadAssetTags_errorHandler);
         var _loc2_:String = this._assetTagsLoader.data;
         if(_loc2_.charAt(0) != "1")
         {
            SearchManager.instance.processAssetTags(com.adobe.serialization.json.JSON.decode(_loc2_));
            this._assetTagsEnabled = true;
         }
         else
         {
            this._assetTagsEnabled = false;
         }
         this._assetTagsReady = true;
         this.checkInitReady();
      }
      
      private function loadAssetTags_errorHandler(param1:Event) : void
      {
         UtilErrorLogger.getInstance().fatal("Asset Tags error: " + param1);
         this._assetTagsReady = true;
         this.checkInitReady();
      }
      
      private function loadStudioPreference() : void
      {
         var _loc3_:String = null;
         var _loc1_:Object = {};
         if(this._hasFeaturedCategory)
         {
            _loc3_ = this._configManager.getValue(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME);
            _loc1_[ResponseConstants.THUMB_CATEGORY_TYPE] = ProductConstants.PRODUCT_TYPE_TEMPLATE;
            _loc1_[ResponseConstants.THEME_CODE] = _loc3_;
            _loc1_[ResponseConstants.THUMB_CATEGORIES] = this._featuredCategoryByURL.join(",");
         }
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadStudioPreference_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.loadStudioPreference_failHandler);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.loadStudioPreference_failHandler);
         _loc2_.post(ServerConstants.ACTION_GET_STUDIO_PREFERENCE,_loc1_);
      }
      
      private function loadStudioPreference_completeHandler(param1:ServerRequestEvent) : void
      {
         PreferenceManager.instance.preference = param1.data[0];
         var _loc2_:String = this._configManager.getValue(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME);
         PreferenceManager.instance.moveFeaturedToTop(this._featuredCategoryByURL,_loc2_);
         this._studioPreferenceReady = true;
         this.checkInitReady();
      }
      
      private function loadStudioPreference_failHandler(param1:Event) : void
      {
         UtilErrorLogger.getInstance().fatal("Studio Preference error: " + param1);
         this._studioPreferenceReady = true;
         this.checkInitReady();
      }
      
      private function loadTeamMemberList() : void
      {
         var _loc1_:ApiRequest = new ApiRequest();
         _loc1_.addEventListener(ServerRequestEvent.COMPLETE,this.loadTeamMemberList_completeHandler);
         _loc1_.addEventListener(ServerRequestEvent.FAIL,this.loadTeamMemberList_failHandler);
         _loc1_.post(ServerConstants.ACTION_GET_TEAM_MEMBERS_V2);
      }
      
      private function loadTeamMemberList_failHandler(param1:ServerRequestEvent) : void
      {
         UtilErrorLogger.getInstance().fatal("Load team list error: " + param1.message);
         this._teamMemberListReady = true;
         this.checkInitReady();
      }
      
      private function loadTeamMemberList_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc3_:Array = null;
         var _loc2_:Object = param1.data;
         if(_loc2_)
         {
            _loc3_ = _loc2_ as Array;
            TeamManager.instance.addMemebers(_loc3_);
         }
         this._teamMemberListReady = true;
         this.checkInitReady();
      }
      
      private function checkInitReady() : void
      {
         if(this._customFontListReady && this._assetTagsReady && this._teamMemberListReady && this._studioPreferenceReady)
         {
            this.loadThemeList();
         }
      }
      
      public function initStarterDropLayer(param1:StarterDropLayer) : void
      {
         this._starterDropLayer = param1;
      }
      
      public function initTutorial(param1:TutorialLayer) : void
      {
         this._tutorialLayer = param1;
         this._tutorialManager.tutorialLayer = param1;
         this._tutorialLayer.manager = this._tutorialManager;
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_COMPLETE,this.onTutorialComplete);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_LAYER_REMOVE,this.tutorialLayerRemoveHandler);
      }
      
      private function onTutorialComplete(param1:TutorialEvent) : void
      {
         this.usingBusinessStudio = this._usingBusinessStudio;
      }
      
      private function tutorialLayerRemoveHandler(param1:TutorialEvent) : void
      {
         var _loc2_:KeepEditingPopUp = null;
         if(AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_RESTART_TUTORIAL) == "1")
         {
            _loc2_ = new KeepEditingPopUp();
            _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
         }
      }
      
      public function get workNoteSidebarVisible() : Boolean
      {
         return this._workNoteSidebarVisible;
      }
      
      private function onWorkNoteSelect(param1:StudioEvent) : void
      {
         var _loc3_:AnimeScene = null;
         var _loc2_:String = param1.data as String;
         if(this._initialized && _loc2_)
         {
            _loc3_ = this.timeline.sceneContainer.selectSceneElementByGuid(_loc2_);
            if(_loc3_ && !this._movie.selection.isSelected(_loc3_))
            {
               this._skipNotifyWorkNote = true;
               this._movie.selection.currentScene = _loc3_;
            }
         }
      }
      
      private function onWorkNoteVisiblityChange(param1:StudioEvent) : void
      {
         this._workNoteSidebarVisible = param1.data as Boolean;
         if(this.mainStage && this.mainStage.toolBar)
         {
            this.changeWorkNoteSideBarItem(this._workNoteSidebarVisible);
         }
      }
      
      private function changeWorkNoteSideBarItem(param1:Boolean) : void
      {
         this.mainStage.toolBar.updateWorkNoteSidebarItem(param1);
      }
      
      public function getSceneGuid() : String
      {
         return !!this.currentScene?this.currentScene.guid:null;
      }
      
      public function getSceneInfoArray() : Array
      {
         var _loc5_:AnimeScene = null;
         var _loc1_:Array = [];
         var _loc2_:int = this._movie.scenes.length;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = this._movie.scenes[_loc4_] as AnimeScene;
            _loc1_.push({
               "guid":_loc5_.guid,
               "duration":_loc5_.duration,
               "startFrom":_loc3_
            });
            _loc3_ = _loc3_ + _loc5_.duration;
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function showWorkNoteSidebar(param1:Boolean) : void
      {
         if(param1 && !this.metaData.movieId)
         {
            this.mainStage.toolBar.updateWorkNoteSidebarItem(false);
            this.workNotePopUp = new ConfirmPopUp();
            this.workNotePopUp.title = UtilDict.toDisplay("go","Unsaved Video");
            this.workNotePopUp.showCloseButton = false;
            this.workNotePopUp.message = UtilDict.toDisplay("go","To start adding notes, you will first need to save this video.\n\nPlease press the \"Save Video\" button below and use the gear menu again to display the notes panel.");
            this.workNotePopUp.cancelText = UtilDict.toDisplay("go","Cancel");
            this.workNotePopUp.confirmText = UtilDict.toDisplay("go","Save Video");
            this.workNotePopUp.addEventListener(PopUpEvent.CLOSE,this.onWorkNotePopUpClose);
            this.workNotePopUp.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
            return;
         }
         this._serverConnector.setWorkNoteSideBarVisible(param1);
      }
      
      private function onWorkNotePopUpClose(param1:PopUpEvent) : void
      {
         this.workNotePopUp.removeEventListener(PopUpEvent.CLOSE,this.onWorkNotePopUpClose);
         if(param1.commit)
         {
            this.showPublishWindow();
         }
         this.workNotePopUp = null;
      }
      
      private function onHeartbeatTakeover(param1:StudioEvent) : void
      {
         if(this.ignoreHeartbeatTakeover || this.ignoreHeartbeatTakeover)
         {
            return;
         }
         this.heartbeatPopUp = new ConfirmPopUp();
         this.heartbeatPopUp.title = UtilDict.toDisplay("go","Another user is editing this video");
         var _loc2_:String = UtilDict.toDisplay("go","{0} is editing this video as well.\n\nChanges made will not be merged. We advise you close the Video Maker and make sure only one person edits it at the same time.");
         _loc2_ = StringUtil.substitute(_loc2_,param1.data);
         this.heartbeatPopUp.showCloseButton = false;
         this.heartbeatPopUp.message = _loc2_;
         this.heartbeatPopUp.cancelText = UtilDict.toDisplay("go","Continue Editing");
         this.heartbeatPopUp.confirmText = UtilDict.toDisplay("go","Close Without Saving");
         this.heartbeatPopUp.addEventListener(PopUpEvent.CLOSE,this.onHeartbeatPopUpClose);
         this.heartbeatPopUp.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function onHeartbeatPopUpClose(param1:PopUpEvent) : void
      {
         this.heartbeatPopUp.removeEventListener(PopUpEvent.CLOSE,this.onHeartbeatPopUpClose);
         if(param1.commit)
         {
            this.redirectToMoviePage();
         }
         else
         {
            this.ignoreHeartbeatTakeover = true;
         }
         this.heartbeatPopUp = null;
      }
      
      private function onFatalEventLogged(param1:Event) : void
      {
         this.doAutoSave();
      }
      
      private function onErrorLogSentComplete(param1:Event) : void
      {
      }
      
      private function onErrorLogSentFail(param1:Event) : void
      {
      }
      
      public function onTestButtonClick() : void
      {
      }
      
      private function onLinkageChange(param1:SoundEvent) : void
      {
         this.refreshAllSpeechText();
      }
      
      public function refreshAllSpeechText() : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:String = null;
         var _loc4_:AnimeSound = null;
         var _loc5_:String = null;
         var _loc1_:int = 0;
         while(_loc1_ < this._movie.scenes.length)
         {
            _loc2_ = this.getScene(_loc1_);
            _loc3_ = this.linkageController.getSpeechSoundIdByScene(_loc2_);
            _loc4_ = this.speechManager.getValueByKey(_loc3_);
            _loc5_ = "";
            if(_loc4_ && _loc4_.soundThumb)
            {
               _loc5_ = _loc4_.soundThumb.displayName;
            }
            this.timeline.updateSceneSpeechByIndex(_loc1_,_loc5_,_loc4_);
            _loc1_++;
         }
      }
      
      public function edSaveAssignment(param1:String) : void
      {
         this._configManager.setValue("ed_assignment",param1);
      }
      
      public function showSaveTextComponentWindow() : void
      {
         if(!this.currentScene || this._isSavingMovie || !this._initialized)
         {
            return;
         }
         SoundPlaybackManager.stop();
         this.mainStage.currentScene.selectedAsset = null;
         this.mainStage.sceneEditor.pause();
         var _loc1_:SaveTextComponentWindow = new SaveTextComponentWindow();
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.starterWindow_closeHandler);
         _loc1_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      public function showSaveStarterWindow(param1:Boolean = true) : void
      {
         if(!this.currentScene || this._isSavingMovie || !this._initialized)
         {
            return;
         }
         this._currSceneOnlyForTemp = !param1;
         SoundPlaybackManager.stop();
         this.mainStage.currentScene.selectedAsset = null;
         this.mainStage.sceneEditor.pause();
         var _loc2_:SaveStarterWindow = new SaveStarterWindow();
         this._selectedThumbForTempIndex = !!param1?0:int(this.currentSceneIndex);
         _loc2_.initSaveStarterWindow(this.allSceneThumbnailBitmapData,param1,this._selectedThumbForTempIndex);
         _loc2_.addEventListener(PopUpEvent.CLOSE,this.starterWindow_closeHandler);
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function starterWindow_closeHandler(param1:PopUpEvent) : void
      {
         this.mainStage.sceneEditor.resume();
      }
      
      private function doShowPublishWindow(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doShowPublishWindow);
         setTimeout(this.showPublishWindow,500);
      }
      
      public function showPublishWindow() : void
      {
         if(!this.currentScene || this._isSavingMovie || !this._initialized)
         {
            return;
         }
         if(UtilSite.siteId == UtilSite.GOANIMATE)
         {
            if(this._usingBusinessStudio && !UtilUser.hasBusinessFeatures)
            {
               this._upsellHookId = "business-style";
               this._expectedUserType = UtilUser.PUBLISH_USER;
            }
            else if(this._exceedDurationLimit && UtilUser.userType == UtilUser.BASIC_USER)
            {
               this._upsellHookId = "unlimited-duration";
               this._expectedUserType = UtilUser.PLUS_USER;
            }
            else
            {
               this._expectedUserType = -1;
            }
            if(this._expectedUserType > -1)
            {
               this.requestLoadStatus(true);
               NativeCursorManager.instance.setBusyCursor();
               this._serverConnector.refreshUserType();
               return;
            }
         }
         this.showPublishWindowImpl();
      }
      
      private function showPublishWindowImpl() : void
      {
         var _loc1_:WixPublishWindow = null;
         SoundPlaybackManager.stop();
         this.mainStage.currentScene.selectedAsset = null;
         this.mainStage.sceneEditor.pause();
         this.genDefaultTags();
         if(ServerConstants.IS_WIX)
         {
            _loc1_ = new WixPublishWindow();
            _loc1_.initPublishWindow(this.movie.published,this.movie.privateShared,this.allSceneThumbnailBitmapData,this.metaData.title,this.metaData.getUgcTagString(),this.metaData.description,this.metaData.selectedThumbnailIndex);
            _loc1_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
         }
         else
         {
            this.publishW = new PublishWindow();
            this.publishW.initPublishWindow(this.movie.published,this.movie.privateShared,this.movie.passwordProtected,this.allSceneThumbnailBitmapData,this.metaData.title,this.metaData.getUgcTagString(),this.metaData.description,this.metaData.selectedThumbnailIndex);
            this.publishW.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
         }
      }
      
      private function onPublishWindowClose(param1:PopUpEvent) : void
      {
         this.mainStage.sceneEditor.resume();
      }
      
      private function onUpgradeComplete(param1:Event) : void
      {
         if(this._expectedUserType > -1)
         {
            if(UtilUser.userType >= this._expectedUserType)
            {
               this.resetExpectedUserType();
               this.updateDurationWarning();
               this.timeline.updateAllScenesLabel();
               this.showPublishWindowImpl();
            }
            else if(this._upsellHookId)
            {
               this._serverConnector.displayUpsellHook(this._upsellHookId);
            }
         }
         NativeCursorManager.instance.removeBusyCursor();
         this.requestLoadStatus(false);
      }
      
      private function onUpgradeError(param1:Event) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("Failed to refresh user type: " + param1);
         NativeCursorManager.instance.removeBusyCursor();
         this.requestLoadStatus(false);
      }
      
      private function onUpgradePending(param1:Event) : void
      {
         var _loc2_:ConfirmPopUp = new ConfirmPopUp();
         _loc2_.message = UtilDict.toDisplay("go","Once you complete your purchase, please save this video and reload the video maker in order to unlock all the features corresponding to your new plan.");
         _loc2_.title = UtilDict.toDisplay("go","Refresh to Unlock Features");
         _loc2_.confirmText = UtilDict.toDisplay("go","OK");
         _loc2_.showCancelButton = false;
         _loc2_.showCloseButton = false;
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function onSaveMovieComplete(param1:Event) : void
      {
         removeEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.redirectToMoviePage);
         removeEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.redirectToMoviePage);
         if(param1.type == CoreEvent.SAVE_MOVIE_ERROR_OCCUR)
         {
            return;
         }
         this.redirectToMoviePage();
      }
      
      private function redirectToMoviePage() : void
      {
         this.requestLoadStatus(true);
         var _loc1_:String = decodeURI(this._configManager.getValue(ServerConstants.FLASHVAR_NEXT_URL));
         var _loc2_:RegExp = new RegExp(ServerConstants.FLASHVAR_NEXT_URL_PLACEHOLDER,"g");
         _loc1_ = _loc1_.replace(_loc2_,this.metaData.movieId);
         var _loc3_:String = this._configManager.getValue("ed_assignment");
         if(_loc3_ != null)
         {
            _loc1_ = _loc1_ + "/" + _loc3_;
         }
         var _loc4_:URLVariables = new URLVariables();
         var _loc5_:URLRequest = null;
         if(this.movie.privateShared || this.movie.published)
         {
            _loc4_["goemail"] = "goemail";
         }
         _loc4_["movieId"] = this.metaData.movieId;
         ExternalLinkManager.instance.exitStudio();
         ExternalLinkManager.instance.navigateWithVariables(_loc1_,_loc4_);
      }
      
      public function onGetCustomAssetCompleteByte(param1:ByteArray, param2:XML, param3:Boolean, param4:Boolean = true) : SoundThumb
      {
         this.requestLoadStatus(true);
         return this._userAssetManager.onGetCustomSoundCompleteByte(param1,param2,param3,param4);
      }
      
      private function onUploadStuffComplete(param1:UploadStuffEvent) : void
      {
         this.mainStage.sceneEditor.resume();
         this.requestLoadStatus(false);
      }
      
      private function onUploadStuffFail(param1:UploadStuffEvent) : void
      {
         this.mainStage.sceneEditor.resume();
         this.requestLoadStatus(false);
      }
      
      public function addSoundThumbAtScene(param1:SoundThumb, param2:AnimeScene) : AnimeSound
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:AnimeSound = null;
         var _loc7_:AnimeSound = null;
         var _loc8_:String = null;
         if(param1 && param2)
         {
            if(this._tutorialManager.expectedAction == "add_sound")
            {
               _loc3_ = 1;
            }
            else
            {
               _loc3_ = this._timelineController.getGlobalStartFrame(param2);
            }
            if(_loc3_ > 0)
            {
               _loc4_ = -1;
               _loc5_ = 0;
               while(_loc5_ < this._soundsController.maxSoundTrackNum)
               {
                  if(StudioSoundManager.getSoundAtFrameOnTrack(this._sounds,_loc3_,_loc5_) == null)
                  {
                     _loc7_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._sounds,_loc3_,_loc5_);
                     if(!(_loc7_ && _loc3_ + AnimeConstants.SOUND_FRAME_MINIMUM - 1 >= _loc7_.startFrame))
                     {
                        _loc4_ = _loc5_;
                        break;
                     }
                  }
                  _loc5_++;
               }
               if(_loc4_ == -1)
               {
                  _loc8_ = StringUtil.substitute("Only {0} sounds can be played at the same time. Make sure you first select the scene where you want to add your sound.",this._soundsController.maxSoundTrackNum);
                  AlertPopUp.openDefaultPopUpWithLocale(_loc8_);
                  return null;
               }
               _loc6_ = this.addSoundThumbAt(param1,_loc3_,_loc4_);
               return _loc6_;
            }
         }
         return null;
      }
      
      public function addSpeechAtScene(param1:SoundThumb, param2:AnimeScene, param3:Character = null, param4:Boolean = true, param5:Number = 1) : AnimeSound
      {
         var _loc8_:AnimeSound = null;
         var _loc11_:String = null;
         var _loc12_:ICommand = null;
         var _loc13_:ConfirmPopUp = null;
         if(!param1 || !param1.isVoice || !param2)
         {
            return null;
         }
         var _loc6_:int = this._timelineController.getGlobalStartFrame(param2);
         if(_loc6_ < 1)
         {
            return null;
         }
         var _loc7_:int = -1;
         var _loc9_:int = 0;
         while(_loc9_ < this._voicesController.maxSoundTrackNum)
         {
            if(StudioSoundManager.getSoundAtFrameOnTrack(this._voices,_loc6_,_loc9_) == null)
            {
               _loc8_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._voices,_loc6_,_loc9_);
               if(!(_loc8_ && _loc6_ + param1.totalFrame - 1 >= _loc8_.startFrame))
               {
                  _loc7_ = _loc9_;
                  break;
               }
            }
            _loc9_++;
         }
         if(_loc7_ == -1)
         {
            _loc11_ = StringUtil.substitute("Only {0} voice clips can be played at the same time. Make sure you first select the scene where you want to add your sound.",this._voicesController.maxSoundTrackNum);
            AlertPopUp.openDefaultPopUpWithLocale(_loc11_);
            return null;
         }
         if(param3 && param1.ttsData)
         {
            param3.speechVoice = param1.ttsData.voice;
         }
         var _loc10_:AnimeSound = new AnimeSound();
         _loc10_.init(param1,_loc6_,_loc6_ + param1.totalFrame - 1,null,_loc7_);
         _loc10_.soundsController = this._voicesController;
         _loc10_.volume = param5;
         if(!param1.sound#1 && param1.downloadType == AnimeConstants.DOWNLOAD_TYPE_EMBED)
         {
            param1.initSoundFromNetwork();
         }
         if(_loc10_)
         {
            this._charIdForAddedVoice = !!param3?param3.id:null;
            this._addedVoice = _loc10_;
            if(param2.speech || !param4)
            {
               _loc12_ = new AddSpeechCommand(_loc10_,this._charIdForAddedVoice,false,false,-1,false);
               _loc12_.execute();
            }
            else if(_loc10_.defaultTotalFrame <= 240)
            {
               _loc12_ = new AddSpeechCommand(_loc10_,this._charIdForAddedVoice);
               _loc12_.execute();
            }
            else
            {
               _loc13_ = new ConfirmPopUp();
               _loc13_.message = UtilDict.toDisplay("go","The duration of scenes can automatically adjust to fit their content.\n\nDo you want to adjust this scene to fit the voice clip you just added?");
               _loc13_.title = UtilDict.toDisplay("go","Automatic Scene Duration");
               _loc13_.confirmText = UtilDict.toDisplay("go","Adjust scene");
               _loc13_.cancelText = UtilDict.toDisplay("go","Do not adjust");
               _loc13_.showCloseButton = false;
               _loc13_.addEventListener(PopUpEvent.CLOSE,this.adjustScenePopUp_closeHandler);
               _loc13_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
            }
         }
         return _loc10_;
      }
      
      private function adjustScenePopUp_closeHandler(param1:PopUpEvent) : void
      {
         var _loc2_:ICommand = null;
         (param1.target as IEventDispatcher).removeEventListener(PopUpEvent.CLOSE,this.adjustScenePopUp_closeHandler);
         if(this._addedVoice)
         {
            if(param1.commit)
            {
               _loc2_ = new AddSpeechCommand(this._addedVoice,this._charIdForAddedVoice);
               _loc2_.execute();
            }
            else
            {
               _loc2_ = new AddSpeechCommand(this._addedVoice,this._charIdForAddedVoice,false,false,-1,false);
               _loc2_.execute();
            }
         }
      }
      
      private function addSoundThumbAt(param1:SoundThumb, param2:int, param3:int) : AnimeSound
      {
         var _loc4_:AnimeSound = null;
         var _loc5_:AnimeSound = null;
         var _loc6_:ICommand = null;
         if(param1)
         {
            _loc4_ = new AnimeSound();
            _loc4_.init(param1,param2,param2 + param1.totalFrame - 1,null,param3);
            _loc4_.soundsController = this._soundsController;
            _loc5_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._sounds,_loc4_.startFrame,_loc4_.trackNum);
            if(_loc5_)
            {
               _loc4_.endFrame = Math.min(_loc4_.endFrame,_loc5_.startFrame - 1);
            }
            _loc6_ = new AddSoundCommand(_loc4_);
            _loc6_.execute();
            if(!param1.sound#1 && param1.downloadType == AnimeConstants.DOWNLOAD_TYPE_EMBED)
            {
               param1.initSoundFromNetwork();
            }
            return _loc4_;
         }
         return null;
      }
      
      public function addSound(param1:AnimeSound) : void
      {
         if(param1)
         {
            if(param1.isVoice)
            {
               this._voicesController.addSound(param1);
            }
            else
            {
               this._soundsController.addSound(param1);
            }
            this.timeline.addSound(param1);
         }
      }
      
      public function removeSoundById(param1:String) : void
      {
         var _loc2_:AnimeSound = this._soundsController.removeSoundById(param1);
         if(!_loc2_)
         {
            _loc2_ = this._voicesController.removeSoundById(param1);
         }
         this.timeline.removeSoundById(param1);
         this.linkageController.deleteLinkageById(param1);
      }
      
      public function removeAllSounds() : void
      {
         this._sounds.removeAll();
         this._voices.removeAll();
         this.timeline.removeAllSounds();
      }
      
      public function stopAllSounds() : void
      {
         SoundPlaybackManager.stop();
      }
      
      public function getSoundById(param1:String) : AnimeSound
      {
         var _loc2_:AnimeSound = this._sounds.getSoundById(param1);
         if(!_loc2_)
         {
            _loc2_ = this._voices.getSoundById(param1);
         }
         return _loc2_;
      }
      
      public function getAllSoundOverlapWithScene(param1:AnimeScene) : Array
      {
         if(!param1)
         {
            return null;
         }
         var _loc2_:int = this._movie.getSceneStartFrame(param1);
         var _loc3_:Array = this._voicesController.getAllSoundBetweenFrame(_loc2_,_loc2_ + param1.totalFrames - 1);
         if(_loc3_)
         {
            _loc3_.sort(this.orderSpeechInScene);
         }
         return _loc3_;
      }
      
      protected function orderSpeechInScene(param1:AnimeSound, param2:AnimeSound) : int
      {
         if(param1.soundThumb.ttsData && param2.soundThumb.ttsData || !param1.soundThumb.ttsData && !param2.soundThumb.ttsData)
         {
            if(param1.startFrame < param2.startFrame)
            {
               return -1;
            }
            if(param1.startFrame > param2.startFrame)
            {
               return 1;
            }
            return 0;
         }
         if(param1.soundThumb.ttsData && !param2.soundThumb.ttsData)
         {
            return -1;
         }
         if(!param1.soundThumb.ttsData && param2.soundThumb.ttsData)
         {
            return 1;
         }
         return 0;
      }
      
      private function voices_soundChangeHandler(param1:SoundCollectionEvent) : void
      {
         if(this.currentScene)
         {
            this.currentScene.updateAllCharacterDemoMouth();
         }
      }
      
      private function reloadAllCC(param1:String) : void
      {
      }
      
      public function requestLoadStatus(param1:Boolean, param2:Number = 1) : void
      {
         var _loc3_:Boolean = false;
         if(param1)
         {
            _loc3_ = this._statusManager.increaseBusyCounter(param2);
         }
         else
         {
            _loc3_ = this._statusManager.decreaseBusyCounter(param2);
         }
         if(_loc3_)
         {
            this._mainStage.setLoadingStatus(param1);
            this._timeline.setLoadingStatus(param1);
            this._thumbTray.setLoadingStatus(param1);
            this.pptPanel.setLoadingStatus(param1);
         }
      }
      
      private function loadThemeList() : void
      {
         var request:URLRequest = null;
         var urlLoader:URLLoader = null;
         UtilErrorLogger.getInstance().info("Load Theme List");
         try
         {
            this.requestLoadStatus(true);
            this.loadProgress = 0;
            request = UtilNetwork.getGetThemeListRequest();
            (request.data as URLVariables)["siteId"] = this._siteId;
            (request.data as URLVariables)["xclZip"] = 1;
            urlLoader = new URLLoader();
            urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
            urlLoader.addEventListener(Event.COMPLETE,this.onLoadThemeListComplete);
            urlLoader.addEventListener(ProgressEvent.PROGRESS,this.showProgress);
            this._progressMonitor.addProgressEventDispatcher(urlLoader);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadThemeListFailed);
            urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadThemeListFailed);
            urlLoader.load(request);
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("loadThemeList error",e);
            UtilErrorLogger.getInstance().fatal("loadThemeList error: " + e);
            return;
         }
      }
      
      private function onLoadThemeListFailed(param1:Event) : void
      {
         UtilErrorLogger.getInstance().appendCustomError("loadThemeList error");
         UtilErrorLogger.getInstance().fatal("loadThemeList error: " + param1);
      }
      
      private function onLoadThemeListComplete(param1:Event) : void
      {
         var urlLoader:URLLoader = null;
         var byteArray:ByteArray = null;
         var returnCode:String = null;
         var zip:ZipFile = null;
         var themeListXML:XML = null;
         var metaNode:XML = null;
         var BAD_TERMS_XML_NODE_NAME:String = null;
         var GOOD_TERMS_XML_NODE_NAME:String = null;
         var excludeAssetIds:Array = null;
         var aid:String = null;
         var node:XML = null;
         var i:int = 0;
         var j:int = 0;
         var errorXML:XML = null;
         var group:PublishGroup = null;
         var event:Event = param1;
         UtilErrorLogger.getInstance().info("Console::onLoadThemeListComplete");
         this.requestLoadStatus(false);
         try
         {
            urlLoader = event.target as URLLoader;
            byteArray = urlLoader.data as ByteArray;
            returnCode = byteArray.readUTFBytes(1);
            if(returnCode == "1")
            {
               errorXML = new XML(byteArray.readUTFBytes(byteArray.bytesAvailable));
               throw new Error("Cannot load theme zip file: " + errorXML.code);
            }
            byteArray.position = 0;
            zip = new ZipFile(byteArray);
            themeListXML = new XML(zip.getInput(zip.getEntry(MOVIE_ZIP_THEMELIST)).toString());
            this.currentLicensorName = themeListXML.child("theme")[0].attribute("name");
            metaNode = themeListXML.child("fvm_meta")[0];
            this.usingBusinessStudio = metaNode && metaNode.@is_biz == "1";
            UtilErrorLogger.getInstance().info("Using Business feature: " + this._usingBusinessStudio);
            BAD_TERMS_XML_NODE_NAME = "word";
            GOOD_TERMS_XML_NODE_NAME = "whiteword";
            if(this._blacklistEnabled && themeListXML.child(BAD_TERMS_XML_NODE_NAME).length() > 0)
            {
               this.setBadTerms(themeListXML.child(BAD_TERMS_XML_NODE_NAME)[0].toString());
               this.setWhiteTerms(themeListXML.child(GOOD_TERMS_XML_NODE_NAME)[0].toString());
            }
            else
            {
               this.setBadTerms("");
               this.setWhiteTerms("");
            }
            excludeAssetIds = String(themeListXML.excludeAssetIDs).split(",");
            this.excludedIds = new UtilHashArray();
            for each(aid in excludeAssetIds)
            {
               aid = StringUtil.trim(aid);
               if(aid != "")
               {
                  this.excludedIds.push(aid,aid);
               }
            }
            i = 0;
            while(i < themeListXML.child("school").length())
            {
               node = themeListXML.child("school")[i];
               this.groupController.schoolId = node.attribute("id");
               i++;
            }
            j = 0;
            while(j < themeListXML.child("group").length())
            {
               node = themeListXML.child("group")[j];
               group = new PublishGroup(node.attribute("id"),node.attribute("name"));
               this.groupController.addGroup(group);
               j++;
            }
            this.doLoadDefaultTheme(themeListXML);
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().fatal("onLoadThemeListComplete error: " + e);
            return;
         }
      }
      
      private function doLoadDefaultTheme(param1:XML) : void
      {
         var targetThemeCode:String = null;
         var trayId:String = null;
         var xmlList:XMLList = null;
         var themeList:XML = param1;
         this.requestLoadStatus(true);
         UtilErrorLogger.getInstance().info("Console::doLoadDefaultTheme");
         try
         {
            this._themeListXML = themeList;
            trayId = this._configManager.getValue(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME);
            xmlList = this._themeListXML.theme.(@id == trayId);
            if(trayId != null && xmlList.length() > 0)
            {
               targetThemeCode = trayId;
            }
            else
            {
               xmlList = this._themeListXML.theme.(@id == ThemeConstants.BUSINESS_THEME_ID);
               if(xmlList.length() > 0)
               {
                  targetThemeCode = ThemeConstants.BUSINESS_THEME_ID;
               }
               else
               {
                  targetThemeCode = this._themeListXML.child("theme")[0].attribute("id");
               }
            }
            this._thumbTray.defaultThemeId = targetThemeCode;
            this._thumbTray.addEventListener(CoreEvent.LOAD_ALL_THUMBS_COMPLETE,this.doLoadMovie);
            this._thumbTray.initThemeDropdown(targetThemeCode);
            this._thumbTray.initThemeChosenById(targetThemeCode);
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("doLoadDefaultTheme error",e);
            UtilErrorLogger.getInstance().fatal("doLoadDefaultTheme error: " + e);
            return;
         }
      }
      
      public function isThemeCcRelated(param1:String) : Boolean
      {
         var list:XMLList = null;
         var themeId:String = param1;
         list = this._themeListXML.child("theme").(attribute("id") == themeId && hasOwnProperty("@cc_theme_id") && attribute("cc_theme_id") != "");
         return list.length() > 0;
      }
      
      private function initStageQuality() : void
      {
         var so:SharedObject = null;
         var curr:Date = new Date();
         var initTime:Number = curr.time - this._initStart.time;
         UtilErrorLogger.getInstance().info("initialization time: " + initTime + "ms");
         if(initTime < 20000)
         {
            this.mainStage.stage.quality = StageQuality.BEST;
         }
         else
         {
            this.mainStage.stage.quality = StageQuality.MEDIUM;
         }
         try
         {
            so = SharedObject.getLocal("studioPreferences");
            if(so.data.stageQuality != null)
            {
               this.mainStage.stage.quality = so.data.stageQuality;
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("Console::initStageQuality",e);
            return;
         }
      }
      
      private function onStudioReady(param1:Event = null) : void
      {
         UtilErrorLogger.getInstance().info("Console::onStudioReady");
         this.mainStage.autoFitMainStage();
         this.initStageQuality();
         this._isStudioReady = true;
         this._watermarkManager.loadAllWatermarks();
         this._serverConnector.notifyEvent("ready");
      }
      
      private function newAnimation() : void
      {
         UtilErrorLogger.getInstance().info("Console::newAnimation");
         if(this.currentScene)
         {
            this.currentScene.removeSound();
         }
         this.stopAllSounds();
         if(this._movie.scenes.length > 0)
         {
            this.clearScenes();
         }
         if(this._sounds.length > 0 || this._voices.length > 0)
         {
            this.removeAllSounds();
         }
         CommandStack.getInstance().reset();
         this._metaData = new MetaData();
         this.changeWorkNoteSideBarItem(false);
         if(UtilSite.siteId == UtilSite.SCHOOL)
         {
            this.movie.published = this._tempPublished = false;
            this.movie.privateShared = this._tempPrivateShared = true;
         }
         else
         {
            this.movie.published = this._tempPublished = false;
            this.movie.privateShared = this._tempPrivateShared = false;
         }
         this.mainStage.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.sceneEditor_viewLoadCompleteHandler);
         var _loc1_:AnimeScene = this.createScene();
         this._movie.addSceneAt(_loc1_,0);
      }
      
      private function sceneEditor_viewLoadCompleteHandler(param1:Event) : void
      {
         this.mainStage.sceneEditor.removeEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.sceneEditor_viewLoadCompleteHandler);
         if(SceneManager.addDefaultAssetsToScene(ThemeManager.instance.currentTheme,this.currentScene))
         {
            this.mainStage.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.sceneEditor_starterViewLoadCompleteHandler);
         }
         else
         {
            this.onAllInitialized();
         }
         CommandStack.getInstance().reset();
      }
      
      private function sceneEditor_starterViewLoadCompleteHandler(param1:Event) : void
      {
         this.mainStage.sceneEditor.removeEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.sceneEditor_starterViewLoadCompleteHandler);
         this.onAllInitialized();
      }
      
      public function putData(param1:String, param2:Object) : void
      {
         if(this._previewData == null)
         {
            this._previewData = new UtilHashArray();
         }
         if(!this._previewData.containsKey(param1))
         {
            this._previewData.push(param1,param2,true);
         }
         else
         {
            this._previewData.replaceValueByKey(param1,param2);
         }
      }
      
      private function resetZoomEffect(param1:XML) : void
      {
         var _loc2_:XMLList = param1..effectAsset;
         var _loc3_:int = _loc2_.length() - 1;
         while(_loc3_ >= 0)
         {
            if(_loc2_[_loc3_].effect.@type == "ZOOM")
            {
               delete _loc2_[_loc3_];
            }
            _loc3_--;
         }
      }
      
      private function deSerialize(param1:XML, param2:String, param3:String = null) : void
      {
         var indexArray:Array = null;
         var shouldResetSceneGuid:Boolean = false;
         var metaNode:XML = null;
         var myMetaNode:XML = null;
         var myMetaData:MetaData = null;
         var movieXML:XML = param1;
         var movieID:String = param2;
         var originalId:String = param3;
         try
         {
            if(movieXML != null)
            {
               if(!this._isLoadingStarter)
               {
                  shouldResetSceneGuid = false;
                  metaNode = movieXML.child(MetaData.XML_NODE_NAME)[0] as XML;
                  this._metaData = new MetaData();
                  this._metaData.deSerialize(metaNode,movieID,originalId);
                  this.movie.published = this._configManager.getValue(ServerConstants.PARAM_IS_PUBLISHED) != "0";
                  this.movie.privateShared = this._configManager.getValue(ServerConstants.PARAM_IS_PRIVATESHARED) != "0";
                  this.movie.passwordProtected = this._configManager.getValue(ServerConstants.PARAM_IS_PASSWORD_PROTECTED) != "0";
                  this.movie.copyable = this._configManager.getValue(ServerConstants.FLASHVAR_IS_COPYABLE) == "1";
                  if(originalId && StringUtil.trim(originalId) != "")
                  {
                     originalId = StringUtil.trim(originalId);
                     this._metaData.title = "";
                     this._metaData.isCopy = true;
                     this.movie.published = false;
                     this.movie.privateShared = UtilSite.siteId == UtilSite.GOANIMATE;
                     shouldResetSceneGuid = true;
                  }
                  this.tempPublished = this.movie.published;
                  this.tempPrivateShared = this.movie.privateShared;
                  this._metaData.loadMovieInfo(!!this._metaData.isCopy?originalId:movieID);
                  this._publishedOnOpen = this.movie.published || this.movie.privateShared;
               }
               else
               {
                  if(this.isLoadingThemeStarter())
                  {
                     if(movieXML.scene.length() != 1)
                     {
                        movieXML.scene = movieXML.scene[0];
                        this._errorLoadingThemeStarter = true;
                     }
                  }
                  myMetaNode = movieXML.child(MetaData.XML_NODE_NAME)[0];
                  myMetaData = new MetaData();
                  myMetaData.deSerialize(myMetaNode,"","",true);
                  if(myMetaData.mver <= 3 && this.metaData.mver > 3)
                  {
                     this.resetZoomEffect(movieXML);
                  }
               }
               Console.getConsole().timeline.sceneLengthController.userPreference = SceneLengthController.FULL_MANUAL;
               try
               {
                  if(this.metaData.movieId)
                  {
                     this.thumbSO = SharedObject.getLocal("studioThumbs_" + this.metaData.movieId);
                  }
                  else if(this.metaData.originalId)
                  {
                     this.thumbSO = SharedObject.getLocal("studioThumbs_" + this.metaData.originalId);
                  }
               }
               catch(e:Error)
               {
                  thumbSO = null;
                  UtilErrorLogger.getInstance().appendCustomError("Console:deserialize",e);
               }
               this._progressMonitor.addProgressEventDispatcher(this);
               this.updateProgressStatus("Loading timeline...");
               this.addSceneOnDeserialize(shouldResetSceneGuid);
            }
            return;
         }
         catch(e:Error)
         {
            if(_isLoadingStarter)
            {
               cancelProcessingStarter();
               UtilErrorLogger.getInstance().appendCustomError("deSerialize error",e);
            }
            else
            {
               UtilErrorLogger.getInstance().fatal("deSerialize error: " + e);
            }
            return;
         }
      }
      
      private function isSceneGotoBuild(param1:XML) : Boolean
      {
         var _loc2_:Boolean = true;
         if(param1.toXMLString().toLowerCase().indexOf(AnimeConstants.MAGIC_KEY) > -1 && this._metaData.isCopy)
         {
            _loc2_ = false;
         }
         if(Number(param1.@adelay) < 4.8)
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      public function addSceneOnDeserialize(param1:Boolean = false, param2:uint = 0) : void
      {
         var movieXML:XML = null;
         var movieLength:Number = NaN;
         var progress:ProgressEvent = null;
         var sceneNode:XML = null;
         var sceneId:String = null;
         var reuseSceneId:Boolean = false;
         var scene:AnimeScene = null;
         var needRender:Boolean = false;
         var combgThemeId:String = null;
         var combgId:String = null;
         var starterCompleteEvent:SceneEvent = null;
         var resetGuid:Boolean = param1;
         var sceneIndex:uint = param2;
         try
         {
            movieXML = this._movieXML;
            movieLength = movieXML.scene.length();
            if(sceneIndex < movieLength)
            {
               this.requestLoadStatus(true);
               sceneNode = movieXML.child(AnimeScene.XML_NODE_NAME)[sceneIndex];
               if(this.isSceneGotoBuild(sceneNode))
               {
                  if(!this._isLoadingStarter)
                  {
                     sceneId = sceneNode.@id;
                  }
                  else if(this._starterSceneIds && this._starterSceneIds.length > 0)
                  {
                     sceneId = this._starterSceneIds.shift();
                     reuseSceneId = true;
                  }
                  scene = this.createScene(sceneId,"",reuseSceneId);
                  if(!resetGuid && sceneNode.hasOwnProperty("@guid"))
                  {
                     scene.guid = sceneNode.@guid;
                  }
                  scene.combgId = sceneNode.@combgId;
                  try
                  {
                     if(scene.combgId)
                     {
                        combgThemeId = scene.combgId.split(".")[0];
                        combgId = scene.combgId.split(".")[1];
                        this.addThumbToMovieTheme(ThemeManager.instance.getTheme(combgThemeId).getBackgroundThumbById(combgId));
                     }
                  }
                  catch(e:Error)
                  {
                     UtilErrorLogger.getInstance().appendCustomError("Console:addThumbToMovieTheme",e);
                  }
                  this.capScreenLock = true;
                  needRender = true;
                  if(!this._isLoadingStarter)
                  {
                     needRender = !this._thumbnailManager.loadThumbnailFromSharedObject(this.thumbSO,sceneIndex,sceneId);
                  }
                  if(movieLength > 0)
                  {
                     scene.sceneXML = sceneNode;
                     scene.deserializeSceneLength(sceneNode,true);
                     scene.deserializeSceneTransition(sceneNode);
                     this._skipSceneRendering = true;
                     if(this._isLoadingStarter)
                     {
                        if(this._forValidation)
                        {
                           needRender = false;
                           this._movie.addSceneAt(scene,this._movie.length);
                        }
                        else
                        {
                           this._movie.addSceneAt(scene,this._insertSceneAtIndex);
                           this._insertSceneAtIndex++;
                        }
                     }
                     else
                     {
                        this._movie.addSceneAt(scene,this._movie.currentIndex + 1);
                     }
                     if(this.textComponentData)
                     {
                        scene.textComponentData = this.textComponentData;
                        scene.loadTextCopiesFromTextComponent();
                        this.textComponentData = null;
                     }
                     if(needRender)
                     {
                        this._thumbnailManager.enqueueForRendering(scene);
                     }
                     sceneIndex++;
                     setTimeout(this.addSceneOnDeserialize,20,resetGuid,sceneIndex);
                  }
                  if(!scene.sizingAsset && Console.getConsole().metaData.mver > 3)
                  {
                     SceneManager.addDefaultZoomEffect(scene);
                  }
               }
               else
               {
                  sceneIndex++;
                  setTimeout(this.addSceneOnDeserialize,20,resetGuid,sceneIndex);
               }
            }
            else if(sceneIndex == movieLength)
            {
               this.capScreenLock = false;
               this.requestLoadStatus(false,movieLength);
               if(!this._isLoadingStarter)
               {
                  this.deserializeLinkage(movieXML);
                  if(movieLength > 0)
                  {
                     this.timeline._timelineScrollbar.scroll(0);
                  }
                  this.deserializeSound(movieXML);
                  this.deserializeSoundAttachment(movieXML);
                  this.initCharacterSpeechVoice();
               }
               this.refreshAllSpeechText();
               if(!this._isLoadingStarter)
               {
                  Console.getConsole().timeline.sceneLengthController.userPreference = SceneLengthController.FULL_AUTO;
               }
               if(!this.isLoadingThemeStarter())
               {
                  this.renderTimelineThumbnail();
               }
               if(this._isLoadingStarter)
               {
                  this.requestLoadStatus(false);
                  starterCompleteEvent = new SceneEvent(SceneEvent.STARTER_DESERIALIZE_COMPLETE);
                  this.dispatchEvent(starterCompleteEvent);
               }
            }
            this.loadProgress = Math.round(100 * sceneIndex / movieLength);
            progress = new ProgressEvent(ProgressEvent.PROGRESS,false,false,sceneIndex,movieLength);
            this.dispatchEvent(progress);
            return;
         }
         catch(e:Error)
         {
            if(_isLoadingStarter)
            {
               cancelProcessingStarter();
               UtilErrorLogger.getInstance().appendCustomError("addSceneOnDeserialize error",e);
            }
            else
            {
               UtilErrorLogger.getInstance().fatal("addSceneOnDeserialize error" + e.getStackTrace());
            }
            return;
         }
      }
      
      public function renderThemeStarterTimelineThumbnail() : void
      {
         this.setCurrentScene(this._insertSceneAtIndex - 1);
         this.requestLoadStatus(false);
         this.mainStage.thumbnailRenderer.library.destroyAllImages();
         this.finishProcessingStarter();
         this._isLoadingStarter = false;
         if(this._errorLoadingThemeStarter)
         {
            AlertPopUp.openDefaultPopUpWithLocale("This background seems to be broken. Please try a different one.","Error");
            this._errorLoadingThemeStarter = false;
         }
      }
      
      private function renderTimelineThumbnail() : void
      {
         this.requestLoadStatus(true);
         this._thumbnailManager.addEventListener(Event.COMPLETE,this.onRenderTimelineThumbnailComplete);
         this._thumbnailManager.addEventListener(ProgressEvent.PROGRESS,this.showProgress);
         this._progressMonitor.addProgressEventDispatcher(this._thumbnailManager);
         this._thumbnailManager.captureSource = this.mainStage.thumbnailRenderer;
         this.mainStage.thumbnailRenderer.library.enabled = true;
         this._loadProgress.updateStatus("");
         setTimeout(this._thumbnailManager.startRendering,1000);
      }
      
      private function onRenderTimelineThumbnailComplete(param1:Event) : void
      {
         this._thumbnailManager.removeEventListener(Event.COMPLETE,this.onRenderTimelineThumbnailComplete);
         this.requestLoadStatus(false);
         this._loadProgress.updateStatus("");
         this.mainStage.thumbnailRenderer.library.destroyAllImages();
         this._thumbnailManager.captureSource = this.mainStage.sceneEditor.view.view;
         if(!this._isLoadingStarter)
         {
            this.onAllInitialized();
         }
         else
         {
            this.setCurrentScene(this._insertSceneAtIndex - 1);
            this._tutorialManager.notifyTutorialAction("add_com_bg");
            this.requestLoadStatus(false);
         }
         this.finishProcessingStarter();
         this._isLoadingStarter = false;
      }
      
      public function get initialized() : Boolean
      {
         return this._initialized;
      }
      
      private function onAllInitialized() : void
      {
         this._initialized = true;
         UtilErrorLogger.getInstance().info("All initialized.");
         this._progressMonitor.removeEventListener(ProgressEvent.PROGRESS,this.showProgress);
         if(!this._processingStarter)
         {
            this.setCurrentScene(0);
         }
         this.initAutoSave();
         this.timeline.triggerAllSoundWaveFormDisplay();
         if(this.isEditMode() && this._hasCollaboration)
         {
            this._serverConnector.startHeartbeat();
         }
         this.requestLoadStatus(false);
         if(!this.isEditMode() && !this._tutorialManager.shouldSkip)
         {
            this.prepareTutorial();
         }
         this.prepareStarterDropLayer();
      }
      
      private function prepareStarterDropLayer() : void
      {
         PopUpManager.addPopUp(this._starterDropLayer,FlexGlobals.topLevelApplication as DisplayObject);
      }
      
      public function showStarterDropLayer() : void
      {
         this._starterDropLayer.showDropLayer();
      }
      
      public function hideStarterDropLayer() : void
      {
         this._starterDropLayer.hideDropLayer();
      }
      
      private function prepareTutorial() : void
      {
         this._tutorialLayer.addEventListener(FlexEvent.CREATION_COMPLETE,this.tutorialLayer_creationCompleteHandler);
         PopUpManager.addPopUp(this._tutorialLayer,FlexGlobals.topLevelApplication as DisplayObject);
      }
      
      private function tutorialLayer_creationCompleteHandler(param1:Event) : void
      {
         this._tutorialLayer.removeEventListener(FlexEvent.CREATION_COMPLETE,this.tutorialLayer_creationCompleteHandler);
         this.startTutorial();
      }
      
      private function startTutorial() : void
      {
         this._mainStage.previewSaveWarningVisible = false;
         var _loc1_:String = ThemeManager.instance.currentTheme.id;
         var _loc2_:String = "first_time_use";
         if(AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_RESTART_TUTORIAL) == "1")
         {
            _loc2_ = "manual";
         }
         else if(AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_NO_SKIP_TUTORIAL) == "true")
         {
            this._tutorialLayer.hideSkipTutorialButton();
         }
         var _loc3_:Object = {
            "trigger":_loc2_,
            "theme":_loc1_
         };
         AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_BEGIN_TUTORIAL,_loc3_);
         this._tutorialManager.startTutorialByTheme(_loc1_);
      }
      
      public function serialize(param1:Boolean = true, param2:Boolean = false, param3:Boolean = false) : XML
      {
         var xml:XML = null;
         var childXml:XML = null;
         var xmlList:XMLList = null;
         var xmlStr:String = null;
         var ex:Error = null;
         var i:int = 0;
         var userLogData:Object = null;
         var published:Boolean = false;
         var privateShared:Boolean = false;
         var passwordProtected:Boolean = false;
         var duration:Number = NaN;
         var sclen:int = 0;
         var nEx:SerializeError = null;
         var stockdata:Boolean = param1;
         var currSceneOnly:Boolean = param2;
         var isStarter:Boolean = param3;
         try
         {
            this._previewData.removeAll();
            userLogData = {"phase":"metadata"};
            published = this.movie.published;
            privateShared = this.movie.privateShared;
            passwordProtected = this.movie.passwordProtected;
            duration = this._timelineController.movieTotalDuration;
            if(duration > FeatureManager.maxMovieDuration)
            {
               published = false;
               privateShared = false;
            }
            if(UtilSite.siteId == UtilSite.YOUTUBE || UtilSite.siteId == UtilSite.SKOLETUBE)
            {
               if(published)
               {
                  privateShared = true;
               }
               published = false;
            }
            if(isStarter)
            {
               published = false;
               privateShared = false;
            }
            childXml = <film/>;
            childXml.@copyable = !!this.movie.copyable?1:0;
            childXml.@duration = duration.toFixed(1);
            childXml.@published = !!published?1:0;
            childXml.@pshare = !!privateShared?1:0;
            if(this.screenMode == AnimeConstants.SCREEN_MODE_WIDE)
            {
               childXml.@isWide = 1;
            }
            xml = new XML("<?xml version=\"1.0\" encoding=\"utf-8\"?>" + childXml.toXMLString());
            if(isStarter)
            {
               childXml = this.starterMetaData.convertToXml();
            }
            else
            {
               childXml = this.metaData.convertToXml();
            }
            xml.appendChild(childXml);
            sclen = this._movie.scenes.length;
            if(!currSceneOnly)
            {
               i = 0;
               while(i < sclen)
               {
                  userLogData.phase = "Scene " + i;
                  childXml = new XML(AnimeScene(this._movie.getSceneAt(i)).serialize(i,stockdata));
                  xml.appendChild(childXml);
                  i++;
               }
            }
            else
            {
               i = this.currentSceneIndex;
               userLogData.phase = "Scene " + i;
               childXml = new XML(AnimeScene(this._movie.getSceneAt(i)).serialize(i,stockdata));
               xml.appendChild(childXml);
            }
            userLogData.phase = "Sound";
            xmlList = new XMLList(this.serializeSound(stockdata));
            xml.appendChild(xmlList);
            userLogData.phase = "Linkage";
            xmlList = new XMLList(this.serializeLinkage());
            xml.appendChild(xmlList);
            return xml;
         }
         catch(ex:Error)
         {
            nEx = new SerializeError("Failed to serialize movie",xml.toXMLString(),ex);
            this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,nEx));
         }
         return null;
      }
      
      private function serializeLinkage() : String
      {
         return this.linkageController.serialize();
      }
      
      private function deserializeLinkage(param1:XML) : void
      {
         this.linkageController.deserialize(param1);
      }
      
      private function deserializeSoundAttachment(param1:XML) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:AnimeSound = null;
         var _loc4_:AnimeScene = null;
         var _loc5_:Array = null;
         if(this._voices)
         {
            _loc2_ = this._voices.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = _loc2_.next as AnimeSound;
               _loc5_ = this._linkageController.getSceneIdBySoundId(_loc3_.id);
               if(_loc5_ && _loc5_.length == 1)
               {
                  _loc4_ = this.getScenebyId(String(_loc5_[0]));
                  if(_loc4_)
                  {
                     _loc4_.attachSpeech(_loc3_,false,false);
                  }
               }
            }
         }
      }
      
      private function initCharacterSpeechVoice() : void
      {
         var _loc1_:IIterator = null;
         var _loc2_:AnimeSound = null;
         var _loc3_:AnimeScene = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:MovieData = null;
         var _loc7_:int = 0;
         var _loc8_:Character = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(this._voices)
         {
            _loc1_ = this._voices.iterator();
            _loc6_ = Console.getConsole().movie;
            _loc7_ = _loc6_.length;
            while(_loc1_.hasNext)
            {
               _loc2_ = _loc1_.next as AnimeSound;
               if(_loc2_ && _loc2_.soundThumb && _loc2_.soundThumb.ttsData)
               {
                  _loc10_ = _loc2_.soundThumb.ttsData.voice;
                  _loc5_ = this._linkageController.getCharIdBySoundId(_loc2_.id);
                  _loc9_ = _loc5_.length;
                  _loc11_ = 0;
                  while(_loc11_ < _loc7_)
                  {
                     _loc3_ = _loc6_.getSceneAt(_loc11_);
                     if(_loc3_)
                     {
                        _loc12_ = 0;
                        while(_loc12_ < _loc9_)
                        {
                           _loc8_ = _loc3_.getCharacterById(String(_loc5_[_loc12_]));
                           if(_loc8_)
                           {
                              _loc8_.speechVoice = _loc10_;
                           }
                           _loc12_++;
                        }
                     }
                     _loc11_++;
                  }
                  continue;
               }
            }
         }
      }
      
      public function serializeSound(param1:Boolean = true) : String
      {
         var _loc4_:AnimeSound = null;
         var _loc2_:String = "";
         var _loc3_:IIterator = this._sounds.iterator();
         if(this._sounds)
         {
            _loc3_ = this._sounds.iterator();
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AnimeSound;
               if(_loc4_)
               {
                  _loc2_ = _loc2_ + _loc4_.serialize(param1,false,new Object());
               }
            }
         }
         if(this._voices)
         {
            _loc3_ = this._voices.iterator();
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AnimeSound;
               if(_loc4_)
               {
                  _loc2_ = _loc2_ + _loc4_.serialize(param1,true,new Object());
               }
            }
         }
         return _loc2_;
      }
      
      public function deserializeSound(param1:XML) : void
      {
         var _loc2_:Array = null;
         var _loc5_:XML = null;
         var _loc6_:AnimeSound = null;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         var _loc10_:XML = null;
         var _loc11_:Sort = null;
         var _loc12_:String = null;
         var _loc13_:AnimeScene = null;
         var _loc14_:Character = null;
         var _loc15_:Boolean = false;
         var _loc16_:Number = NaN;
         this._soundsController.wrapEnabled = false;
         _loc2_ = UtilXmlInfo.getAndSortXMLattribute(param1,"index",AnimeSound.XML_NODE_NAME);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc9_:XMLListCollection = new XMLListCollection(param1.child(AnimeSound.XML_NODE_NAME));
         if(this._soundsController.wrapEnabled)
         {
            _loc11_ = new Sort();
            _loc11_.fields = [new SortField("@track",false)];
            _loc9_.sort = _loc11_;
            _loc9_.refresh();
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc9_.getItemAt(_loc4_) as XML;
            _loc6_ = new AnimeSound();
            _loc6_.deSerialize(_loc5_);
            if(_loc6_.startFrame < (this._timelineController.movieTotalDuration + 300) * AnimeConstants.FRAME_PER_SEC)
            {
               if(_loc6_.soundThumb != null)
               {
                  _loc8_ = 1;
                  if(_loc5_.attribute("vol").length() != 0)
                  {
                     _loc8_ = _loc5_.@vol;
                  }
                  _loc7_ = _loc5_.hasOwnProperty("@tts") && String(_loc5_.@tts) == "1";
                  if(_loc7_ && _loc6_.soundThumb.ttsData && _loc6_.trackNum == 0)
                  {
                     _loc12_ = Console.getConsole().linkageController.getTargetIdOfSpeech(_loc6_.getID());
                     _loc13_ = Console.getConsole().getScenebyId(AssetLinkage.getSceneIdFromLinkage(_loc12_));
                     if(_loc13_)
                     {
                        _loc14_ = _loc13_.getCharacterById(AssetLinkage.getCharIdFromLinkage(_loc12_));
                        if(_loc14_)
                        {
                           _loc14_.demoSpeech = true;
                        }
                        if(_loc6_.soundThumb.ttsData.type == "mic")
                        {
                           this.speechManager.micRecordingManager.addSoundBySound(_loc6_,false);
                        }
                        else if(_loc6_.soundThumb.ttsData.type == "file")
                        {
                           this.speechManager.voiceFileManager.addSoundBySound(_loc6_,false);
                        }
                        else
                        {
                           this.speechManager.ttsManager.addSoundBySound(_loc6_,false);
                        }
                     }
                  }
               }
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc9_.getItemAt(_loc4_) as XML;
            _loc6_ = new AnimeSound();
            _loc6_.deSerialize(_loc5_);
            if(_loc6_.startFrame < (this._timelineController.movieTotalDuration + 300) * AnimeConstants.FRAME_PER_SEC)
            {
               if(_loc6_.soundThumb != null)
               {
                  _loc8_ = 1;
                  if(_loc5_.attribute("vol").length() != 0)
                  {
                     _loc8_ = _loc5_.@vol;
                  }
                  _loc7_ = _loc5_.hasOwnProperty("@tts") && String(_loc5_.@tts) == "1";
                  if(_loc5_.attribute("track").length() == 0)
                  {
                     this.addSound(_loc6_);
                     _loc3_ = _loc3_ == 3?0:int(_loc3_ + 1);
                  }
                  else
                  {
                     _loc15_ = false;
                     _loc16_ = 0;
                     while(_loc16_ < _loc2_.length)
                     {
                        if(_loc4_ != _loc16_)
                        {
                           _loc10_ = _loc9_.getItemAt(_loc16_) as XML;
                           if(!_loc7_ && _loc10_.@tts != "1" && _loc6_.trackNum == _loc10_.@track)
                           {
                              if(Number(_loc10_.start) <= _loc6_.endFrame && Number(_loc10_.start) > _loc6_.startFrame)
                              {
                                 _loc6_.endFrame = Number(_loc10_.start) - 6;
                              }
                              if(Number(_loc10_.stop) >= _loc6_.endFrame && Number(_loc10_.start) <= _loc6_.startFrame)
                              {
                                 _loc15_ = true;
                              }
                           }
                        }
                        _loc16_++;
                     }
                     if(!_loc15_)
                     {
                        this.addSound(_loc6_);
                        if(_loc6_.trackNum == 3)
                        {
                           this._soundsController.maxSoundTrackNum = 4;
                           this._timeline.enableSoundTrackScroller();
                        }
                     }
                  }
               }
            }
            _loc4_++;
         }
         this._soundsController.wrapEnabled = true;
      }
      
      private function putFontData(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc6_:ByteArray = null;
         var _loc3_:FontManager = FontManager.getFontManager();
         var _loc4_:Number = _loc3_.getFonts().length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc3_.getFonts().getKey(_loc5_);
            if(param1.indexOf(_loc2_) > -1)
            {
               _loc6_ = new ByteArray();
               _loc6_.writeBytes(_loc3_.getFonts().getValueByKey(_loc2_) as ByteArray);
               this.putData(_loc3_.nameToFileName(_loc2_) + ".swf",_loc6_);
            }
            _loc5_++;
         }
      }
      
      public function preview(param1:Boolean = false) : void
      {
         var eventProperties:Object = null;
         var themeNodes:UtilHashArray = null;
         var themes:Vector.<Theme> = null;
         var length:int = 0;
         var i:int = 0;
         var userXml:XML = null;
         var ugcTheme:Theme = null;
         var mergedThemeXML:XML = null;
         var ccXml:XML = null;
         var previewStartFrame:int = 0;
         var modifiedSceneData:Object = null;
         var theme:Theme = null;
         var previewFromCurrentScene:Boolean = param1;
         try
         {
            UtilErrorLogger.getInstance().info("Console:preview");
            eventProperties = {};
            this.stopAllSounds();
            this.mainStage.sceneEditor.pause();
            this._filmXML = this.serialize();
            this.putFontData(this._filmXML.toXMLString());
            this.putData(MOVIE_ZIP_FONT_INFO,this.getCustomFontJSON(this._filmXML.toXMLString()));
            this.putData("watermarkUrl",this._watermarkManager.currentWatermark.url);
            themeNodes = new UtilHashArray();
            themes = this._themeManager.themes;
            length = themes.length;
            i = 0;
            while(i < length)
            {
               theme = themes[i];
               themeNodes.push(theme.id,theme.getThemeXML());
               i++;
            }
            userXml = ThemeManager.instance.userTheme.getThemeXML();
            ugcTheme = ThemeManager.instance.getTheme("ugc");
            mergedThemeXML = Theme.merge2ThemeXml(!!ugcTheme?ugcTheme.getThemeXML():null,userXml,"ugc","ugc");
            ccXml = ThemeManager.instance.ccTheme.getThemeXML();
            mergedThemeXML = Theme.merge2ThemeXml(mergedThemeXML,ccXml,"ugc","ugc",true);
            themeNodes.push(ThemeManager.instance.userTheme.id,mergedThemeXML);
            if(this.externalPreviewPlayerController)
            {
               this.externalPreviewPlayerController.removeEventListener(Event.CHANGE,this.showPublishWindow);
               this.externalPreviewPlayerController.removeEventListener(Event.CANCEL,this.doContinueEdit);
            }
            this.externalPreviewPlayerController = new ExternalPreviewWindowController();
            this.externalPreviewPlayerController.addEventListener(Event.CHANGE,this.doShowPublishWindow);
            this.externalPreviewPlayerController.addEventListener(Event.CANCEL,this.doContinueEdit);
            previewStartFrame = 1;
            if(previewFromCurrentScene)
            {
               previewStartFrame = this._movie.getSceneStartFrame(this.currentScene);
               eventProperties[AmplitudeAnalyticsManager.EVENT_PROPERTIES_PARTIAL_PREVIEW] = "1";
            }
            else
            {
               eventProperties[AmplitudeAnalyticsManager.EVENT_PROPERTIES_PARTIAL_PREVIEW] = "0";
            }
            eventProperties[AmplitudeAnalyticsManager.EVENT_PROPERTIES_NUM_SCENES] = this._movie.length;
            eventProperties[AmplitudeAnalyticsManager.EVENT_PROPERTIES_NUM_FRAMES] = this._movie.getTotalFrames();
            modifiedSceneData = this._movie.getModifiedSceneData();
            eventProperties[AmplitudeAnalyticsManager.EVENT_PROPERTIES_NUM_MODIFIED_SCENES] = modifiedSceneData["count"];
            eventProperties[AmplitudeAnalyticsManager.EVENT_PROPERTIES_NUM_MODIFIED_FRAMES] = modifiedSceneData["frame"];
            if(this.metaData.movieId != null && this.metaData.movieId != "")
            {
               eventProperties[AmplitudeAnalyticsManager.EVENT_PROPERTIES_MOVIE_ID] = this.metaData.movieId;
            }
            eventProperties[AmplitudeAnalyticsManager.EVENT_PROPERTIES_TUTORIAL] = !!this._tutorialManager.currentTutorial?"yes":"no";
            AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_PREVIEW_VIDEO,eventProperties);
            this.externalPreviewPlayerController.initExternalPreviewWindow(this._filmXML,this._previewData,themeNodes,previewStartFrame,this._movie.containsChapterBreaks,this._movie.getAssetThemes());
            this.genDefaultTags();
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("Console:preview",e);
         }
         this._tutorialManager.notifyTutorialAction("toolbar_preview");
         this.movie.clearAllSceneModifiedFlag();
      }
      
      private function getCustomFontJSON(param1:String) : Array
      {
         var _loc6_:FontModel = null;
         var _loc2_:Array = new Array();
         var _loc3_:Array = FontManager.getFontManager().customQueue;
         var _loc4_:Number = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = FontManager.getFontManager().getFontModelByFontId(_loc3_[_loc5_]);
            if(param1.indexOf(_loc6_.id))
            {
               _loc2_.push(_loc6_.serialize());
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function deleteAsset(param1:MouseEvent = null) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:ICommand = null;
         UtilErrorLogger.getInstance().info("Console::deleteAsset");
         if(this._tutorialManager.currentTutorial)
         {
            return;
         }
         if(this.currentScene.selectedAsset is ProgramEffectAsset && ProgramEffectAsset(this.currentScene.selectedAsset).effect is ZoomEffect)
         {
            if(Console.getConsole().metaData.mver > 3)
            {
               return;
            }
         }
         if(this.currentScene)
         {
            _loc2_ = this.currentScene.selection.iterator();
            _loc3_ = new RemoveAssetCollectionCommand(_loc2_);
            _loc3_.execute();
         }
      }
      
      public function showControl() : void
      {
         this.mainStage.sceneEditor.showControl();
      }
      
      public function addCutEffectonChar(param1:Character) : void
      {
         var _loc2_:EffectThumb = this._themeManager.commonTheme.effectThumbs.getValueByKey("cut") as EffectThumb;
         this.createAsset(_loc2_,param1.x,param1.y - param1.height / 4,true);
      }
      
      public function createAsset(param1:Object, param2:Number = 0, param3:Number = 0, param4:Boolean = false) : void
      {
         var _loc5_:Asset = null;
         if(this._movie.currentScene != null)
         {
            _loc5_ = this._movie.currentScene.createAsset(param1 as Thumb,param2,param3,"",param4);
            if(_loc5_)
            {
               this._movie.currentScene.addAsset(_loc5_);
            }
         }
      }
      
      public function doKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.ctrlKey)
         {
            if(param1.keyCode == Keyboard.Z)
            {
               StudioManager.instance.undo();
            }
            else if(param1.keyCode == Keyboard.Y)
            {
               StudioManager.instance.redo();
            }
         }
      }
      
      public function copyAsset() : void
      {
         UtilErrorLogger.getInstance().info("Console::copyAsset");
         if(this._movie.currentScene)
         {
            this._pasteAssetOffset = 10;
            this._movie.currentScene.copySelectedAssets(this._copiedAssets);
         }
      }
      
      public function pasteAsset() : void
      {
         UtilErrorLogger.getInstance().info("Console::pasteAsset");
         if(this._copiedAssets && this._copiedAssets.length > 0 && this._movie.currentScene)
         {
            this._movie.currentScene.pasteAssets(this._copiedAssets.assets,this._pasteAssetOffset,this._copiedAssets.assetTransitions);
            this._pasteAssetOffset = this._pasteAssetOffset + 10;
         }
      }
      
      public function showOverTray(param1:Boolean = true, param2:Object = null) : void
      {
         if(param1)
         {
            this.pptPanel.open(param2);
         }
         else
         {
            this.pptPanel.close();
         }
      }
      
      public function updateOverTray(param1:Object) : void
      {
         this.pptPanel.update(param1);
      }
      
      public function displaySwapPanel() : void
      {
         this.pptPanel.displaySwapPanel();
      }
      
      public function displaySwapInnerImagePanel() : void
      {
         this.pptPanel.displaySwapInnerImagePanel();
      }
      
      public function displayWidgetIconPanel() : void
      {
         this.pptPanel.displayWidgetIconPanel();
      }
      
      public function get propertiesWindow() : PropertiesWindow
      {
         return this.pptPanel;
      }
      
      public function flipAsset() : void
      {
         var _loc1_:Asset = null;
         var _loc2_:ICommand = null;
         if(this.currentScene)
         {
            _loc1_ = this.currentScene.selectedAsset;
            if(_loc1_ is IFlippable)
            {
               _loc2_ = new FlipAssetCommand(_loc1_);
               _loc2_.execute();
               this._tutorialManager.notifyTutorialAction("asset_flip");
            }
         }
      }
      
      public function bringForward() : void
      {
         var _loc1_:ICommand = new BringForwardCommand(this.currentScene.selectedAsset);
         _loc1_.execute();
      }
      
      public function sendBackward() : void
      {
         var _loc1_:ICommand = new SendBackwardCommand(this.currentScene.selectedAsset);
         _loc1_.execute();
      }
      
      public function getSceneIndex(param1:AnimeScene) : int
      {
         return this._movie.getSceneIndex(param1);
      }
      
      public function selectScene(param1:Number) : void
      {
         this._movie.currentIndex = param1;
      }
      
      public function getScenebyId(param1:String) : AnimeScene
      {
         return this._movie.getSceneById(param1);
      }
      
      public function getScene(param1:int) : AnimeScene
      {
         if(this._movie.getSceneAt(param1))
         {
            return this._movie.getSceneAt(param1);
         }
         return null;
      }
      
      public function getFirstCharacter(param1:String) : Character
      {
         var _loc4_:Character = null;
         var _loc2_:Number = this.scenes.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.getScene(_loc3_).getCharacterById(param1);
            if(_loc4_)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function pasteScene(param1:Boolean = true) : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:Number = NaN;
         var _loc4_:ICommand = null;
         if(SceneManager.copiedScene)
         {
            _loc2_ = this.createScene("",SceneManager.copiedScene);
            _loc2_.createGuid(true);
            _loc3_ = !!param1?Number(this._movie.currentIndex + 1):Number(this._movie.currentIndex);
            _loc4_ = new AddSceneCommand(this._movie,_loc2_,_loc3_);
            _loc4_.execute();
         }
      }
      
      private function onSceneDownHandler(param1:TimelineEvent) : void
      {
         var _loc2_:AnimeScene = this._movie.getSceneAt(param1.index);
         if(!this._movie.selection.isSelected(_loc2_))
         {
            this._movie.selection.currentScene = _loc2_;
         }
      }
      
      public function addNextScene(param1:Boolean = false) : void
      {
         var _loc2_:TutorialManager = TutorialManager.instance;
         var _loc3_:Object = {
            "blank":(!!param1?"true":"false"),
            "tutorial":(!!_loc2_.currentTutorial?"yes":"no")
         };
         AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_ADD_SCENE,_loc3_);
         UtilErrorLogger.getInstance().info("Console::addNextScene");
         this._addBlankScene = param1;
         this.mainStage.enableAddSceneEffect = true;
         this.doAddScene();
      }
      
      public function selectLastScene() : void
      {
         this.movie.selectSceneAt(this.movie.length - 1);
      }
      
      private function doAddScene() : void
      {
         if(this.currentScene)
         {
            this.currentScene.selection.clearCollection();
         }
         var _loc1_:AnimeScene = this.createScene();
         var _loc2_:ICommand = new AddSceneCommand(this._movie,_loc1_,this.movie.currentIndex + 1);
         _loc2_.execute();
      }
      
      function updateSceneLength() : void
      {
         this.currentScene.doUpdateTimelineLength();
      }
      
      public function clearScenes() : void
      {
         if(this._movie.scenes.length > 0)
         {
            this._movie.removeAllScene();
            this._timeline.removeAllScenes();
            this._timeline.removeAllSounds();
         }
      }
      
      private function createScene(param1:String = "", param2:String = "", param3:Boolean = false) : AnimeScene
      {
         var _loc4_:AnimeScene = null;
         if(this._movie.currentScene && param1 == "")
         {
            if(param2 == "" && !this._addBlankScene)
            {
               _loc4_ = this._movie.currentScene.cloneNext();
            }
         }
         else
         {
            _loc4_ = new AnimeScene(param1,param3);
         }
         if(_loc4_ == null)
         {
            _loc4_ = new AnimeScene();
         }
         _loc4_.console = this;
         if(param2 != "")
         {
            _loc4_.deSerialize(XML(param2),true,true,false);
         }
         if(!_loc4_.sizingAsset && Console.getConsole().metaData.mver > 3)
         {
            SceneManager.addDefaultZoomEffect(_loc4_);
         }
         _loc4_.createGuid();
         return _loc4_;
      }
      
      public function addScene(param1:Number = 0, param2:String = "", param3:String = "", param4:Boolean = true) : AnimeScene
      {
         var _loc5_:AnimeScene = this.createScene(param2,param3);
         this._movie.addSceneAt(_loc5_,param1);
         return _loc5_;
      }
      
      public function clearCurrentScene(param1:String) : void
      {
         var _loc4_:ICommand = null;
         var _loc2_:AnimeScene = this._movie.selection.currentScene;
         if(_loc2_)
         {
            _loc4_ = new ClearSceneCommand(_loc2_);
            _loc4_.execute();
         }
         var _loc3_:Object = {
            "action":"clear",
            "trigger":param1,
            "videoID":this.metaData.movieId
         };
         AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_DELETE_SCENE,_loc3_);
      }
      
      public function copyCurrentScene() : void
      {
         SceneManager.copyScene(this._movie.selection.currentScene);
      }
      
      public function deleteCurrentScene(param1:String) : void
      {
         this._timelineController.removeSceneAt(this._movie.currentIndex);
         var _loc2_:Object = {
            "action":"delete",
            "trigger":param1,
            "videoID":this.metaData.movieId
         };
         AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_DELETE_SCENE,_loc2_);
      }
      
      private function onSceneSelectionChange(param1:Event) : void
      {
         var _loc2_:int = this._movie.currentIndex;
         UtilErrorLogger.getInstance().info("Console::onSceneSelectionChange: " + _loc2_);
         if(_loc2_ >= 0 && this._movie.selection.length == 1)
         {
            if(!this._skipSceneRendering)
            {
               this.mainStage.sceneEditor.sceneModel = this._movie.currentScene;
               this.showOverTray(false);
            }
            if(this._initialized)
            {
               this._timeline.setCurrentSceneByIndex(this._movie.currentIndex);
            }
            if(this._initialized)
            {
               this._movie.currentScene.refreshEffectTray();
            }
            this.soundMute = this.soundMute;
            this._pasteAssetOffset = 0;
            this._skipSceneRendering = false;
            if(this._initialized && this._hasCollaboration)
            {
               if(!this._skipNotifyWorkNote && !this._preparingMovieThumbnail)
               {
                  this._serverConnector.notifySceneChange(this._movie.currentScene.guid);
               }
               this._skipNotifyWorkNote = false;
            }
            dispatchEvent(new IndexChangedEvent(IndexChangedEvent.CHANGE));
         }
      }
      
      private function onSceneAdded(param1:MovieEvent) : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:Object = null;
         if(param1.index >= 0)
         {
            _loc2_ = this._movie.getSceneAt(param1.index);
            if(this._initialized && this._hasCollaboration)
            {
               _loc3_ = {};
               _loc3_["guid"] = _loc2_.guid;
               this._serverConnector.notifyEvent("sceneAdd",_loc3_);
            }
            this._timeline.addScene(_loc2_.id,Timeline.BITMAP,0,_loc2_,param1.index);
            this.timeline.sceneLengthController.doChangeSceneLength(UtilUnitConvert.frameToPixel(_loc2_.totalFrames),param1.index);
            this._movie.selection.currentScene = _loc2_;
            if(this._initialized)
            {
               if(param1.index <= this.metaData.selectedThumbnailIndex)
               {
                  this.metaData.selectedThumbnailIndex++;
               }
               this.metaData.validateThumbnailIndex(this._movie.length);
            }
            this.updateDurationWarning();
         }
      }
      
      private function onSceneRemoved(param1:MovieEvent) : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:Object = null;
         if(param1.index >= 0)
         {
            if(this._initialized && this._hasCollaboration)
            {
               _loc2_ = param1.scene;
               _loc3_ = {};
               _loc3_["guid"] = _loc2_.guid;
               this._serverConnector.notifyEvent("sceneRemove",_loc3_);
            }
            this._timeline.removeScene(param1.index);
            if(this._processingStarter)
            {
               return;
            }
            if(param1.index == this._movie.length)
            {
               this._movie.currentIndex = param1.index - 1;
            }
            else
            {
               this._movie.currentIndex = param1.index;
            }
            if(this._initialized)
            {
               if(param1.index < this.metaData.selectedThumbnailIndex)
               {
                  this.metaData.selectedThumbnailIndex--;
               }
               this.metaData.validateThumbnailIndex(this._movie.length);
            }
            this.updateDurationWarning();
         }
      }
      
      private function onSceneMoved(param1:MovieEvent) : void
      {
         if(param1.sourceIndex >= 0 && param1.destIndex >= 0)
         {
            this._timeline.moveScene(param1.sourceIndex,param1.destIndex);
            if(this._initialized)
            {
               if(param1.sourceIndex == this.metaData.selectedThumbnailIndex)
               {
                  if(param1.destIndex < this.metaData.selectedThumbnailIndex)
                  {
                     this.metaData.selectedThumbnailIndex = param1.destIndex;
                  }
                  else
                  {
                     this.metaData.selectedThumbnailIndex = param1.destIndex - 1;
                  }
               }
               else if(param1.sourceIndex < this.metaData.selectedThumbnailIndex && param1.destIndex > this.metaData.selectedThumbnailIndex)
               {
                  this.metaData.selectedThumbnailIndex--;
               }
               else if(param1.sourceIndex > this.metaData.selectedThumbnailIndex && param1.destIndex <= this.metaData.selectedThumbnailIndex)
               {
                  this.metaData.selectedThumbnailIndex++;
               }
               this.metaData.validateThumbnailIndex(this._movie.length);
            }
            this._serverConnector.notifyEvent("reorder");
         }
      }
      
      private function onSceneDurationChange(param1:Event) : void
      {
         this.updateDurationWarning();
         var _loc2_:Object = {};
         _loc2_["guid"] = this.currentScene.guid;
         _loc2_["duration"] = this.currentScene.duration;
         this._serverConnector.notifyEvent("sceneDuration",_loc2_);
      }
      
      public function get hasShorterDurationLimit() : Boolean
      {
         return this._hasShorterDurationLimit;
      }
      
      public function get basicUserDurationLimit() : int
      {
         return !!this._hasShorterDurationLimit?30:120;
      }
      
      private function updateDurationWarning() : void
      {
         if(this._mainStage.previewSaveWarningVisible)
         {
            return;
         }
         if(this._timelineController.movieTotalDuration > this.basicUserDurationLimit)
         {
            this._exceedDurationLimit = true;
         }
         else
         {
            this._exceedDurationLimit = false;
         }
         this._mainStage.durationWarningVisible = this._exceedDurationLimit && UtilUser.userType == UtilUser.BASIC_USER;
      }
      
      public function moveScene(param1:int, param2:int) : void
      {
         this._timelineController.moveScene(param1,param2);
      }
      
      public function get isLoadingStarter() : Boolean
      {
         return this._isLoadingStarter;
      }
      
      public function isLoadingThemeStarter() : Boolean
      {
         var _loc1_:BackgroundThumb = this._selectedStarterThumb as BackgroundThumb;
         if(_loc1_)
         {
            return this.isLoadingStarter && _loc1_.isThemeStarter;
         }
         return false;
      }
      
      public function get errorLoadingThemeStarter() : Boolean
      {
         return this._errorLoadingThemeStarter;
      }
      
      public function set errorLoadingThemeStarter(param1:Boolean) : void
      {
         this._errorLoadingThemeStarter = param1;
      }
      
      public function get selectedStarterThumb() : BackgroundThumb
      {
         return this._selectedStarterThumb;
      }
      
      public function addStarter(param1:BackgroundThumb, param2:Number, param3:Boolean = true, param4:Boolean = false) : void
      {
         var _loc6_:ICommand = null;
         this._selectedStarterThumb = param1;
         this._insertSceneAtIndex = param2;
         ThemeStarterManager.instance.lastSelectedStarterId = this._selectedStarterThumb.starterId;
         var _loc5_:AnimeScene = this.getScene(param2);
         if(!param4)
         {
            addEventListener(SceneEvent.STARTER_DESERIALIZE_COMPLETE,this.starterDeserialize_completeHandler);
            this._movieDuration = this._movie.getTotalDuration();
            this._movieSceneNumber = this._movie.length;
            this.insertStarterImpl(param1,this._movie.length,null,true);
         }
         else
         {
            _loc6_ = new AddStarterCommand(this.movie,param1,param2,param3);
            _loc6_.execute();
         }
         this.hideStarterDropLayer();
         this.thumbTray.clearAllBackgroundThumbState();
      }
      
      private function starterDeserialize_completeHandler(param1:SceneEvent) : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:SoundSelection = null;
         var _loc11_:SoundSelection = null;
         var _loc13_:int = 0;
         var _loc14_:Boolean = false;
         var _loc15_:AnimeSound = null;
         var _loc16_:AnimeSound = null;
         var _loc17_:ICommand = null;
         removeEventListener(SceneEvent.STARTER_DESERIALIZE_COMPLETE,this.starterDeserialize_completeHandler);
         var _loc2_:AnimeScene = this._movie.getSceneAt(this._insertSceneAtIndex);
         var _loc3_:Number = this._movie.getTotalDuration() - this._movieDuration;
         var _loc4_:Number = this._movie.length - this._movieSceneNumber;
         this._movie.removeMultipleScene(this._movieSceneNumber,_loc4_);
         this.cancelProcessingStarter();
         var _loc5_:Number = _loc2_.duration;
         var _loc6_:Number = _loc5_ - _loc3_;
         var _loc7_:* = _loc6_ < 0;
         var _loc8_:Number = UtilUnitConvert.timeToFrame(Math.abs(_loc6_));
         _loc8_ = _loc8_ * (!!_loc7_?-1:1);
         var _loc12_:Number = this._movie.getSceneEndFrame(_loc2_) - 1;
         if(_loc6_ <= 0)
         {
            _loc9_ = true;
         }
         else
         {
            _loc13_ = 0;
            while(_loc13_ < this._soundsController.maxSoundTrackNum)
            {
               _loc16_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._sounds,_loc12_,_loc13_);
               if(_loc16_)
               {
                  _loc15_ = StudioSoundManager.getLastSoundBeforeFrameOnTrack(this._sounds,_loc16_.startFrame,_loc13_);
                  if(_loc16_ && _loc15_)
                  {
                     if(_loc16_.startFrame - _loc8_ <= _loc15_.startFrame + _loc15_.totalFrame)
                     {
                        _loc14_ = true;
                        break;
                     }
                  }
               }
               _loc13_++;
            }
            _loc13_ = 0;
            while(_loc13_ < this._voicesController.maxSoundTrackNum)
            {
               _loc16_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._voices,_loc12_,_loc13_);
               if(_loc16_)
               {
                  _loc15_ = StudioSoundManager.getLastSoundBeforeFrameOnTrack(this._voices,_loc16_.startFrame,_loc13_);
                  if(_loc16_ && _loc15_ && !_loc15_.scene)
                  {
                     if(_loc16_.startFrame - _loc8_ <= _loc15_.startFrame + _loc15_.totalFrame)
                     {
                        _loc14_ = true;
                        break;
                     }
                  }
               }
               _loc13_++;
            }
            if(_loc14_)
            {
               AlertPopUp.openDefaultPopUpWithLocale(TimelineController.LABEL_ALERT_REPLACE_SCENE);
               this.setCurrentScene(this._insertSceneAtIndex);
               this._selectedStarterThumb = null;
               this._insertSceneAtIndex = -1;
            }
            else
            {
               _loc9_ = true;
            }
         }
         if(_loc9_)
         {
            _loc10_ = StudioSoundManager.getAllSoundStartAfterFrame(this._sounds,_loc12_);
            _loc11_ = StudioSoundManager.getAllSoundStartAfterFrame(this._voices,_loc12_);
            _loc17_ = new AddStarterCommand(this.movie,this._selectedStarterThumb,this._insertSceneAtIndex,true,_loc10_,_loc11_,_loc8_);
            _loc17_.execute();
         }
      }
      
      public function insertStarterImpl(param1:BackgroundThumb, param2:int, param3:Array = null, param4:Boolean = false) : void
      {
         var _loc5_:String = null;
         var _loc6_:TutorialManager = null;
         var _loc7_:Object = null;
         if(param1 && !this._isLoadingStarter)
         {
            if(param1.themeId != ThemeConstants.UGC_THEME_ID && !param4)
            {
               if(param1.starterCategories && param1.starterCategories.length > 0)
               {
                  _loc5_ = param1.starterCategories[0];
               }
               _loc6_ = TutorialManager.instance;
               _loc7_ = {
                  "theme":param1.themeId,
                  "category":_loc5_,
                  "name":param1.name,
                  "tutorial":(!!_loc6_.currentTutorial?"yes":"no"),
                  "templateID":param1.id
               };
               AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_ADD_SCENE_TEMPLATE,_loc7_);
            }
            this._isLoadingStarter = true;
            this._starterSceneIds = param3;
            this._forValidation = param4;
            if(!this._forValidation)
            {
               this._selectedStarterThumb = param1;
               this._insertSceneAtIndex = param2;
            }
            this.mainStage.disableInteraction();
            if(param1.starterContent)
            {
               this._movieXML = param1.starterContent;
               this.deserialMovie();
            }
            else
            {
               this.loadMovieById(param1.aid);
            }
         }
      }
      
      private function loadMovieById(param1:String) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var postVariables:URLVariables = null;
         var getVariables:URLVariables = null;
         var urlLoader:URLLoader = null;
         var movieId:String = null;
         var originalId:String = null;
         var id:String = param1;
         if(this._isLoadingStarter)
         {
            UtilErrorLogger.getInstance().info("Console::loadStarter: " + id);
         }
         else
         {
            UtilErrorLogger.getInstance().info("Console::loadMovieById: " + id);
         }
         try
         {
            this._movieXML = null;
            postVariables = this._configManager.createURLVariables();
            getVariables = new URLVariables();
            if(this._isLoadingStarter)
            {
               postVariables[ServerConstants.PARAM_MOVIE_ID] = id;
            }
            getVariables[ServerConstants.PARAM_MOVIE_ID] = id;
            getVariables[ServerConstants.PARAM_USER_ID] = this._configManager.getValue(ServerConstants.PARAM_USER_ID);
            getVariables[ServerConstants.PARAM_USER_TOKEN] = this._configManager.getValue(ServerConstants.PARAM_USER_TOKEN);
            url = ServerConstants.ACTION_GET_MOVIE + "?" + getVariables.toString();
            request = new URLRequest(url);
            if(!this._isLoadingStarter)
            {
               movieId = String(postVariables[ServerConstants.PARAM_MOVIE_ID]);
               originalId = String(postVariables[ServerConstants.PARAM_ORIGINAL_ID]);
               if(movieId != null && StringUtil.trim(movieId))
               {
                  this.metaData.movieId = movieId;
               }
               else if(originalId != null && StringUtil.trim(originalId))
               {
                  postVariables[ServerConstants.PARAM_MOVIE_ID] = originalId;
                  this._originalId = originalId;
                  this.changeWorkNoteSideBarItem(false);
               }
            }
            else
            {
               delete postVariables["asId"];
               delete postVariables["loadas"];
            }
            postVariables[ServerConstants.PARAM_IS_EDIT_MODE] = "1";
            request.method = URLRequestMethod.POST;
            request.data = postVariables;
            urlLoader = new URLLoader();
            urlLoader.addEventListener(ProgressEvent.PROGRESS,this.showProgress);
            this._progressMonitor.addProgressEventDispatcher(urlLoader);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR,this.doLoadMovieFail);
            urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doLoadMovieFail);
            urlLoader.addEventListener(Event.COMPLETE,this.doLoadMovieComplete);
            urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
            this.requestLoadStatus(true);
            urlLoader.load(request);
            return;
         }
         catch(e:Error)
         {
            if(_isLoadingStarter)
            {
               cancelProcessingStarter();
               UtilErrorLogger.getInstance().appendCustomError("load starter error:",e);
            }
            else
            {
               UtilErrorLogger.getInstance().fatal("loadMovieById error" + e);
            }
            return;
         }
      }
      
      private function isEditMode() : Boolean
      {
         return this.getIdToLoad() != "";
      }
      
      private function getIdToLoad() : String
      {
         var _loc1_:String = "";
         var _loc2_:String = this._configManager.getValue(ServerConstants.PARAM_MOVIE_ID);
         var _loc3_:String = this._configManager.getValue(ServerConstants.PARAM_ORIGINAL_ID);
         var _loc4_:Boolean = false;
         if(_loc2_ != null && StringUtil.trim(_loc2_).length > 0)
         {
            _loc4_ = true;
            _loc1_ = _loc2_;
         }
         else if(_loc3_ != null && StringUtil.trim(_loc3_).length > 0)
         {
            _loc4_ = true;
            _loc1_ = _loc3_;
         }
         return _loc1_;
      }
      
      private function doLoadMovie(param1:Event) : void
      {
         var idToLoad:String = null;
         var event:Event = param1;
         UtilErrorLogger.getInstance().info("Console::doLoadMovie");
         if(event)
         {
            (event.target as IEventDispatcher).removeEventListener(event.type,this.doLoadMovie);
         }
         this.onStudioReady();
         try
         {
            idToLoad = this.getIdToLoad();
            if(idToLoad != "")
            {
               this.requestLoadStatus(true);
               addEventListener(CoreEvent.LOAD_MOVIE_COMPLETE,this.onMovieLoaded);
               this.loadMovieById(idToLoad);
            }
            else
            {
               this.trackInitialTheme();
               this.newAnimation();
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("doLoadMovie error",e);
            UtilErrorLogger.getInstance().fatal("doLoadMovie error" + e);
            return;
         }
      }
      
      private function onMovieLoaded(param1:Event) : void
      {
         this.requestLoadStatus(false);
      }
      
      private function trackInitialTheme() : void
      {
         var _loc1_:String = this._configManager.getValue(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME);
         var _loc2_:String = this._configManager.getValue(ServerConstants.FLASHVAR_THEME_ID);
         var _loc3_:String = ThemeManager.instance.currentTheme.id;
         this._initThemeCode = _loc3_;
      }
      
      private function doContinueEdit(param1:Event = null) : void
      {
         this._publishW = null;
         this._previewData.removeAll();
         this.mainStage.sceneEditor.resume();
      }
      
      public function publishStarter(param1:int, param2:String = "") : void
      {
         this._selectedThumbForTempIndex = param1;
         this._targetStarterId = param2;
         this.prepareSaveStarterThumbnailScene();
      }
      
      public function publishMovie(param1:int, param2:Boolean = false) : void
      {
         this.metaData.selectedThumbnailIndex = param1;
         this.movie.published = this.tempPublished;
         this.movie.privateShared = this.tempPrivateShared;
         this.movie.passwordProtected = this.tempPasswordProtected;
         this._redirect = param2;
         Console.getConsole().groupController.currentGroup = Console.getConsole().groupController.tempCurrentGroup;
         if(this._redirect)
         {
            addEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.onSaveMovieComplete);
            addEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.onSaveMovieComplete);
         }
         addEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.showSaveMovieError);
         addEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.showSaveMovieError);
         this.prepareSaveMovieThumbnailScene();
      }
      
      private function showSaveMovieError(param1:CoreEvent) : void
      {
         var error:Error = null;
         var errorMessage:String = null;
         var popup:AlertPopUp = null;
         var errorXml:XML = null;
         var event:CoreEvent = param1;
         this.removeEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.showSaveMovieError);
         this.removeEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.showSaveMovieError);
         if(event.type == CoreEvent.SAVE_MOVIE_ERROR_OCCUR)
         {
            error = event.getData() as Error;
            this.enableAfterSave();
            if(error.message == ServerConstants.ERROR_CODE_SAVE_MOVIE_BLOCKED_BY_VIDEO_RECORDING)
            {
               errorMessage = UtilDict.toDisplay("go","constant_save_movie_error_due_to_video_record");
            }
            else if(error is IOError)
            {
               errorMessage = UtilDict.toDisplay("go","constant_connecterr");
            }
            else
            {
               try
               {
                  errorXml = XML(error.message);
                  if(errorXml.hasOwnProperty("message"))
                  {
                     errorMessage = UtilDict.toDisplay("go",errorXml.message.text());
                  }
                  if(errorMessage == null || errorMessage == "")
                  {
                     if(errorXml.hasOwnProperty("text"))
                     {
                        errorMessage = UtilDict.toDisplay("go",errorXml.text.text());
                     }
                  }
               }
               catch(e:Error)
               {
                  UtilErrorLogger.getInstance().appendDebug("Console:autosave malformed response (expecting XML):\n" + error.message + "\n-- end --\n");
                  UtilErrorLogger.getInstance().error("Console::showSaveMovieError" + error.message);
               }
            }
            if(errorMessage == null || errorMessage == "")
            {
               errorMessage = UtilDict.toDisplay("go","An unknown error has occurred.");
            }
            popup = new AlertPopUp();
            popup.createDefaultPopUp();
            popup.message = errorMessage;
            popup.open(this.mainStage,true);
         }
      }
      
      public function prepareSaveStarterThumbnailScene() : void
      {
         if(this._selectedThumbForTempIndex != this.currentSceneIndex && this.movie.isValidIndex(this._selectedThumbForTempIndex))
         {
            this._selectedSceneIndexBeforeCapture = this.currentSceneIndex;
            this.mainStage.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onPreparedThumbnailStarterScene);
            this.currentSceneIndex = this._selectedThumbForTempIndex;
         }
         else
         {
            this.saveStarter();
         }
      }
      
      private function onPreparedThumbnailStarterScene(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onPreparedThumbnailStarterScene);
         this.saveStarter();
         this._movie.currentIndex = this._selectedSceneIndexBeforeCapture;
      }
      
      private function prepareSaveMovieThumbnailScene() : void
      {
         this._preparingMovieThumbnail = true;
         if(this.metaData.selectedThumbnailIndex != this.currentSceneIndex && this.movie.isValidIndex(this.metaData.selectedThumbnailIndex))
         {
            this._selectedSceneIndexBeforeCapture = this.currentSceneIndex;
            this.mainStage.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.onPreparedThumbnailScene);
            this.currentSceneIndex = this.metaData.selectedThumbnailIndex;
         }
         else
         {
            this.saveMovie();
         }
      }
      
      private function onPreparedThumbnailScene(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onPreparedThumbnailScene);
         this.saveMovie();
         this._movie.currentIndex = this._selectedSceneIndexBeforeCapture;
      }
      
      public function addTextComponent(param1:String, param2:String) : void
      {
         var message:Object = null;
         var request:ApiRequest = null;
         var name:String = param1;
         var thumbnail:String = param2;
         if(!this.currentScene)
         {
            return;
         }
         try
         {
            message = {
               "name":name,
               "thumbnail":thumbnail,
               "theme_code":ThemeManager.instance.currentTheme.id,
               "content":this.prepareTextComponentContent()
            };
            request = new ApiRequest();
            request.addEventListener(ServerRequestEvent.COMPLETE,this.saveTextComponent_completeHandler);
            request.addEventListener(ServerRequestEvent.FAIL,this.saveTextComponent_failHandler);
            request.addEventListener(IOErrorEvent.IO_ERROR,this.saveTextComponent_failHandler);
            request.post(ServerConstants.ACTION_TEXT_COMPONENT_ADD,message);
            return;
         }
         catch(e:Error)
         {
            dispatchEvent(new CoreEvent(CoreEvent.SAVE_TEXT_COMPONENT_ERROR,this,e.message));
            return;
         }
      }
      
      public function updateTextComponent(param1:String, param2:String, param3:String) : void
      {
         var message:Object = null;
         var request:ApiRequest = null;
         var id:String = param1;
         var name:String = param2;
         var thumbnail:String = param3;
         if(!this.currentScene)
         {
            return;
         }
         try
         {
            message = {
               "id":id,
               "name":name,
               "thumbnail":thumbnail,
               "theme_code":ThemeManager.instance.currentTheme.id,
               "content":this.prepareTextComponentContent()
            };
            request = new ApiRequest();
            request.addEventListener(ServerRequestEvent.COMPLETE,this.saveTextComponent_completeHandler);
            request.addEventListener(ServerRequestEvent.FAIL,this.saveTextComponent_failHandler);
            request.addEventListener(IOErrorEvent.IO_ERROR,this.saveTextComponent_failHandler);
            request.post(ServerConstants.ACTION_TEXT_COMPONENT_UPDATE,message);
            return;
         }
         catch(e:Error)
         {
            dispatchEvent(new CoreEvent(CoreEvent.SAVE_TEXT_COMPONENT_ERROR,this,e.message));
            return;
         }
      }
      
      private function prepareTextComponentContent() : String
      {
         var _loc4_:int = 0;
         var _loc6_:Prop = null;
         var _loc7_:BubbleAsset = null;
         var _loc1_:Object = {"assets":[]};
         var _loc2_:Theme = ThemeManager.instance.currentTheme;
         var _loc3_:int = this.currentScene.props.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = this.currentScene.props.getValueByIndex(_loc4_);
            _loc6_.componentRole = TextComponentManager.COMPONENT_ROLE_PROP;
            if(_loc6_.thumb.theme != _loc2_)
            {
               throw new Error("Text component contains assets from other themes.");
            }
            _loc1_.assets.push(_loc6_.convertToJsonObj());
            _loc4_++;
         }
         var _loc5_:int = this.currentScene.bubbles.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc7_ = this.currentScene.bubbles.getValueByIndex(_loc4_);
            if(!_loc7_.componentRole)
            {
               _loc7_.componentRole = TextComponentManager.COMPONENT_ROLE_TEXT;
            }
            _loc1_.assets.push(_loc7_.convertToJsonObj());
            _loc4_++;
         }
         _loc1_.assetTransition = this.currentScene.assetTransitions.convertToJsonArray();
         return com.adobe.serialization.json.JSON.encode(_loc1_);
      }
      
      private function saveTextComponent_completeHandler(param1:ServerRequestEvent) : void
      {
         dispatchEvent(new CoreEvent(CoreEvent.SAVE_TEXT_COMPONENT_COMPLETE,this));
      }
      
      private function saveTextComponent_failHandler(param1:ServerRequestEvent) : void
      {
         dispatchEvent(new CoreEvent(CoreEvent.SAVE_TEXT_COMPONENT_ERROR,this));
      }
      
      public function saveStarter() : void
      {
         var eventProperties:Object = null;
         var failed:Boolean = false;
         var errorMessage:String = null;
         var bitmapData:BitmapData = null;
         var largeBitmapData:BitmapData = null;
         if(!this._initialized || this._isSavingMovie)
         {
            return;
         }
         UtilErrorLogger.getInstance().info("Console::saveStarter");
         if(UtilUser.isContentAdmin && this.starterMetaData.hasTag(ThemeStarterManager.THEME_STARTER_TAG_NAME))
         {
            if(!this._currSceneOnlyForTemp && this.movie.length > 1)
            {
               errorMessage = ThemeStarterManager.SAVE_ERROR_MESSAGE_MORE_THAN_ONE_SCENE;
               failed = true;
            }
            else if(!ThemeStarterManager.instance.checkThemeStarterContent(this.currentScene,ThemeManager.instance.currentTheme.id))
            {
               errorMessage = ThemeStarterManager.SAVE_ERROR_MESSAGE_INVALID_CONTENT;
               failed = true;
            }
            if(failed)
            {
               AlertPopUp.openDefaultPopUpWithLocale(errorMessage,ThemeStarterManager.SAVE_ERROR_TITLE);
               dispatchEvent(new CoreEvent(CoreEvent.SAVE_STARTER_ERROR,this));
               return;
            }
         }
         if(this._currSceneOnlyForTemp)
         {
            eventProperties = {
               "duration":this.currentScene.duration,
               "scene_count":1
            };
         }
         else
         {
            eventProperties = {
               "duration":this._timelineController.movieTotalDuration,
               "scene_count":this._movie.length
            };
         }
         AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_SAVED_STARTER,eventProperties);
         try
         {
            this._filmXML = this.serialize(false,this._currSceneOnlyForTemp,true);
            dispatchEvent(new CoreEvent(CoreEvent.SERIALIZE_COMPLETE,this));
            bitmapData = this._thumbnailManager.captureThumbnail(AnimeConstants.STARTER_THUMBNAIL_WIDTH,AnimeConstants.STARTER_THUMBNAIL_HEIGHT,this.currentScene);
            largeBitmapData = this._thumbnailManager.captureThumbnail(AnimeConstants.MOVIE_THUMBNAIL_LARGE_WIDTH,AnimeConstants.MOVIE_THUMBNAIL_LARGE_HEIGHT,this.currentScene);
            this._starterManager.addEventListener(Event.COMPLETE,this.starterManager_completeHandler);
            this._starterManager.addEventListener(IOErrorEvent.IO_ERROR,this.starterManager_errorHandler);
            this._starterManager.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.starterManager_errorHandler);
            this._starterManager.saveStarter(this._filmXML,this._thumbnailManager.encodeWithJPG(bitmapData),this._thumbnailManager.encodeWithJPG(largeBitmapData),this._targetStarterId);
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().error("Save Starter Error.");
            dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,e));
            return;
         }
      }
      
      public function saveMovie(param1:Boolean = false) : Boolean
      {
         var variables:URLVariables = null;
         var eventProperties:Object = null;
         var bd:BitmapData = null;
         var autoSave:Boolean = param1;
         if(!this._initialized || this._isSavingMovie)
         {
            return false;
         }
         this._isAutoSave = autoSave;
         try
         {
            this._filmXML = this.serialize(false);
            dispatchEvent(new CoreEvent(CoreEvent.SERIALIZE_COMPLETE,this));
            if(this._isAutoSave && this.metaData.movieId && this._filmXML.children().toXMLString() == this._movieXML.children().toXMLString())
            {
               return false;
            }
            this._isSavingMovie = true;
            if(this._isAutoSave)
            {
               UtilErrorLogger.getInstance().info("[AUTO SAVE] Console::saveMovie");
            }
            else
            {
               UtilErrorLogger.getInstance().info("[MANUAL SAVE] Console::saveMovie");
            }
            if(!autoSave)
            {
               eventProperties = {
                  "duration":this._timelineController.movieTotalDuration,
                  "scene_count":this._movie.length,
                  "theme":this._configManager.getValue(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME),
                  "video_id":this.metaData.movieId,
                  "create_date":this._configManager.getValue(ServerConstants.FLASHVAR_MOVIE_CREATE_DATETIME)
               };
               AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_SAVED_VIDEO,eventProperties);
            }
            if(this._isAutoSave)
            {
               this._mainStage.startAutoSave();
            }
            else
            {
               this.requestLoadStatus(true);
            }
            variables = new URLVariables();
            variables = this._movieManager.addURLVariables(variables,this._filmXML,this.metaData,this._initThemeCode,this._isAutoSave,this.publishQuality);
            variables = this._movieManager.addURLVariablesForSchool(variables,this.groupController);
            if(UtilSite.siteId == UtilSite.YOUTUBE)
            {
               variables = this._movieManager.addURLVariablesForYouTube(variables,this.movie.published);
            }
            else if(UtilSite.siteId == UtilSite.SKOLETUBE)
            {
               variables = this._movieManager.addURLVariablesForSkoletube(variables,this.movie.published,this.groupController);
            }
            if(this._isAutoSave && this.metaData.movieId)
            {
               variables[ServerConstants.PARAM_SAVE_THUMBNAIL] = "0";
            }
            else
            {
               variables[ServerConstants.PARAM_SAVE_THUMBNAIL] = "1";
               bd = this._thumbnailManager.captureThumbnail(AnimeConstants.MOVIE_THUMBNAIL_WIDTH,AnimeConstants.MOVIE_THUMBNAIL_HEIGHT,this.currentScene);
               this._movieManager.addURLVariablesForThumbnail(variables,this._thumbnailManager.encodeWithJPG(bd),ServerConstants.PARAM_THUMBNAIL);
               bd = this._thumbnailManager.captureThumbnail(AnimeConstants.MOVIE_THUMBNAIL_LARGE_WIDTH,AnimeConstants.MOVIE_THUMBNAIL_LARGE_HEIGHT,this.currentScene);
               this._movieManager.addURLVariablesForThumbnail(variables,this._thumbnailManager.encodeWithJPG(bd),ServerConstants.PARAM_THUMBNAIL_LARGE);
            }
            variables["saveexit"] = !!this._redirect?"1":"0";
            this._movieManager.addEventListener(Event.COMPLETE,this.doSaveMovieComplete);
            this._movieManager.addEventListener(IOErrorEvent.IO_ERROR,this.doSaveMovieComplete);
            this._movieManager.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doSaveMovieComplete);
            this._movieManager.saveMovie(variables);
         }
         catch(exception:Error)
         {
            UtilErrorLogger.getInstance().error("saveMovie error: " + exception.message + "\n" + exception.getStackTrace());
            _isSavingMovie = false;
            _preparingMovieThumbnail = false;
            requestLoadStatus(false);
            dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,exception));
         }
         return true;
      }
      
      private function enableAfterSave() : void
      {
         this.requestLoadStatus(false);
         if(this._isAutoSave)
         {
            this._mainStage.finishAutoSave();
         }
         else if(this._publishW)
         {
            this.closePublishWindow();
         }
      }
      
      private function starterManager_completeHandler(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc4_:BitmapData = null;
         var _loc5_:ByteArray = null;
         var _loc6_:BackgroundThumb = null;
         var _loc2_:SaveMovieCompleteEvent = param1 as SaveMovieCompleteEvent;
         if(_loc2_)
         {
            if(_loc2_.status == "0")
            {
               _loc3_ = _loc2_.message;
               _loc4_ = Console.getConsole().getThumbnailCaptureBySceneIndex(this._selectedThumbForTempIndex);
               _loc5_ = this._thumbnailManager.encodeWithPNG(_loc4_);
               _loc5_.position = 0;
               _loc6_ = this._userAssetManager.getStarterById(BackgroundThumb.STARTER_UNIQUE_ID_PREFIX + _loc3_);
               if(!_loc6_)
               {
                  _loc6_ = new BackgroundThumb();
                  _loc6_.createUserStarterThumb(_loc3_,ThemeManager.instance.userTheme,!!this._currSceneOnlyForTemp?1:int(this.scenes.length));
                  _loc6_.name = this._starterMetaData.title;
                  _loc6_.tags = this._starterMetaData.getUgcTagString();
                  ThemeManager.instance.userTheme.addThumb(_loc6_);
                  this._userAssetManager.addStarterByThumb(_loc6_);
               }
               _loc6_.imageData = _loc5_;
               _loc6_.thumbImageData = _loc5_;
               this._thumbTray.displayUserStarter();
               dispatchEvent(new CoreEvent(CoreEvent.SAVE_STARTER_COMPLETE,this));
            }
            else if(_loc2_.status == "1")
            {
               if(_loc2_.message == ServerConstants.ERROR_CODE_LOGGED_OUT)
               {
                  this.showLoggedOutPopUp();
               }
               else
               {
                  dispatchEvent(new CoreEvent(CoreEvent.SAVE_STARTER_ERROR,this));
               }
            }
         }
      }
      
      private function starterManager_errorHandler(param1:Event) : void
      {
         dispatchEvent(new CoreEvent(CoreEvent.SAVE_STARTER_ERROR,this));
      }
      
      private function doSaveMovieComplete(param1:Event) : void
      {
         var saveCompleted:Boolean = false;
         var currDate:Date = null;
         var localTime:String = null;
         var data:Object = null;
         var delaySaveComplete:Boolean = false;
         var i:int = 0;
         var sid:String = null;
         var bm:BitmapData = null;
         var barr:ByteArray = null;
         var flushStatus:String = null;
         var event:Event = param1;
         var _event:SaveMovieCompleteEvent = null;
         if(event is SaveMovieCompleteEvent)
         {
            _event = event as SaveMovieCompleteEvent;
         }
         if(event.type == Event.COMPLETE)
         {
            currDate = new Date();
            localTime = UtilUnitConvert.getClockTime(currDate.getHours(),currDate.getMinutes());
            this._mainStage.updateLastAutoSaveTime(localTime);
         }
         this.enableAfterSave();
         if(event.type == Event.COMPLETE && _event)
         {
            this.metaData.movieId = _event.message;
            this._watermarkManager.saveWatermark(this.metaData.movieId);
            FlexGlobals.topLevelApplication.parameters["movieId"] = UtilErrorLogger.getInstance().movieId = this.metaData.movieId;
            if(this._hasCollaboration)
            {
               this._serverConnector.startHeartbeat(this.metaData.movieId);
            }
            data = {};
            data["movieId"] = this.metaData.movieId;
            data["autoSave"] = this._isAutoSave;
            this._serverConnector.notifyEvent("save",data);
            if(this._isAutoSave)
            {
               this.mainStage.showAutoSaveHints();
            }
            this._movieXML = this._filmXML;
            delaySaveComplete = false;
            try
            {
               this.thumbSO = SharedObject.getLocal("studioThumbs_" + this.metaData.movieId);
            }
            catch(e:Error)
            {
               thumbSO = null;
               UtilErrorLogger.getInstance().appendCustomError("Console:doSaveMovieComplete",e);
            }
            if(!UtilSystem.isLion())
            {
            }
            if(this.thumbSO)
            {
               i = 0;
               while(i < this._movie.scenes.length)
               {
                  sid = this.getScene(i).id;
                  bm = this.getThumbnailCaptureBySceneIndex(i);
                  if(bm)
                  {
                     barr = this._thumbnailManager.encodeWithPNG(bm);
                     barr.position = 0;
                     this.thumbSO.data[sid] = barr;
                  }
                  i++;
               }
               try
               {
                  flushStatus = this.thumbSO.flush();
                  if(flushStatus == SharedObjectFlushStatus.PENDING)
                  {
                     this.thumbSO.addEventListener(NetStatusEvent.NET_STATUS,this.soStatusListener);
                     delaySaveComplete = true;
                  }
                  else if(flushStatus == SharedObjectFlushStatus.FLUSHED)
                  {
                  }
               }
               catch(e:Error)
               {
               }
            }
            if(!delaySaveComplete)
            {
               saveCompleted = true;
               this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_COMPLETE,this));
            }
         }
         else if(event.type == IOErrorEvent.IO_ERROR)
         {
            this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,new IOError()));
         }
         else if(!(this._isAutoSave && event.type == IOErrorEvent.IO_ERROR) && _event)
         {
            if(_event.message == ServerConstants.ERROR_CODE_LOGGED_OUT)
            {
               this.showLoggedOutPopUp();
            }
            else
            {
               this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this,new Error(_event.message)));
            }
         }
         this._isSavingMovie = false;
         this._preparingMovieThumbnail = false;
         if(saveCompleted)
         {
            this.performActionAfterAutoSave();
         }
      }
      
      private function showLoggedOutPopUp() : void
      {
         var _loc1_:ConfirmPopUp = new ConfirmPopUp();
         _loc1_.title = UtilDict.translate("Logged out");
         _loc1_.message = UtilDict.translate("Login again to continue.\nUnsaved changes may have been lost.");
         _loc1_.confirmText = UtilDict.translate("Login");
         _loc1_.iconType = ConfirmPopUp.CONFIRM_POPUP_NO_ICON;
         _loc1_.showCancelButton = false;
         _loc1_.showCloseButton = false;
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.loggedOutPopUp_closeHandler);
         _loc1_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function loggedOutPopUp_closeHandler(param1:PopUpEvent) : void
      {
         ExternalLinkManager.instance.exitStudio();
         ExternalLinkManager.instance.navigate(ServerConstants.LOGIN_PAGE_PATH);
      }
      
      private function performActionAfterAutoSave(param1:Boolean = true) : void
      {
         if(param1)
         {
            switch(this.actionAfterAutoSave)
            {
               case ACTION_TUTORIAL_RESTART:
                  this.openRestartTutorialPopUp();
            }
         }
         this.actionAfterAutoSave = null;
      }
      
      private function soStatusListener(param1:NetStatusEvent) : void
      {
         if(param1.info.code != "SharedObject.Flush.Success")
         {
            if(param1.info.code == "SharedObject.Flush.Failed")
            {
            }
         }
         this.thumbSO.removeEventListener(NetStatusEvent.NET_STATUS,this.soStatusListener);
         this.dispatchEvent(new CoreEvent(CoreEvent.SAVE_MOVIE_COMPLETE,this));
      }
      
      public function closePublishWindow() : void
      {
         if(this._publishW != null)
         {
            this.publishW = null;
         }
      }
      
      private function doLoadMovieComplete(param1:Event) : void
      {
         var urlLoader:URLLoader = null;
         var bytesLoaded:ByteArray = null;
         var checkCode:int = 0;
         var loadMgr:UtilLoadMgr = null;
         var themeListXML:XML = null;
         var themes:XMLList = null;
         var i:int = 0;
         var fontEntry:ZipEntry = null;
         var themeId:String = null;
         var theme:Theme = null;
         var themeXML:XML = null;
         var charList:XMLList = null;
         var charThemeId:String = null;
         var charThemeModel:CCThemeModel = null;
         var jsonFile:ByteArray = null;
         var fontData:Object = null;
         var event:Event = param1;
         UtilErrorLogger.getInstance().info("Console::doLoadMovieComplete");
         try
         {
            urlLoader = event.target as URLLoader;
            bytesLoaded = urlLoader.data as ByteArray;
            checkCode = bytesLoaded.readByte();
            if(checkCode == 0)
            {
               this._movieZip = new ZipFile(bytesLoaded);
               this._movieXML = new XML(this._movieZip.getInput(this._movieZip.getEntry(AnimeConstants.MOVIE_XML_FILENAME)));
               if(this._selectedStarterThumb)
               {
                  this._selectedStarterThumb.starterContent = this._movieXML;
               }
               if(this._movieXML)
               {
                  loadMgr = new UtilLoadMgr();
                  themeListXML = new XML(this._movieZip.getInput(this._movieZip.getEntry(MOVIE_ZIP_THEMELIST)));
                  themes = themeListXML.children();
                  i = 0;
                  while(i < themes.length())
                  {
                     themeId = themes[i].text();
                     if(themeId != "common")
                     {
                        if(themeId == "ugc")
                        {
                           themeXML = new XML(this._movieZip.getInput(this._movieZip.getEntry(themeId + ".xml")));
                           theme = this._themeManager.userTheme;
                           loadMgr.addEventDispatcher(theme,CoreEvent.LOAD_THEME_COMPLETE);
                           theme.initThemeByXml(themeId,themeXML);
                           charList = themeXML.char.@cc_theme_id;
                           for each(charThemeId in charList)
                           {
                              charThemeModel = CCThemeManager.instance.getThemeModel(charThemeId);
                              if(!charThemeModel.completed)
                              {
                                 loadMgr.addEventDispatcher(charThemeModel,Event.COMPLETE);
                                 charThemeModel.load();
                              }
                           }
                        }
                        else if(!this._themeManager.getTheme(themeId))
                        {
                           theme = new Theme();
                           loadMgr.addEventDispatcher(theme,CoreEvent.LOAD_THEME_COMPLETE);
                           this._themeManager.addTheme(themeId,theme);
                           theme.initThemeByLoadThemeFile(themeId);
                        }
                     }
                     i++;
                  }
                  fontEntry = this._movieZip.getEntry(MOVIE_ZIP_FONT_INFO);
                  if(fontEntry)
                  {
                     jsonFile = this._movieZip.getInput(fontEntry);
                     fontData = com.adobe.serialization.json.JSON.decode(jsonFile.toString());
                     FontManager.getFontManager().addCustomFontList(fontData as Array,true);
                  }
                  loadMgr.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.processMovieZipImageData);
                  loadMgr.commit();
               }
            }
            else
            {
               this.doLoadMovieFail();
            }
            this.requestLoadStatus(false);
            return;
         }
         catch(e:Error)
         {
            doLoadMovieFail();
            return;
         }
      }
      
      private function processMovieZipImageData(param1:Event) : void
      {
         var _loc8_:UtilCrypto = null;
         var _loc9_:Vector.<ZipEntry> = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:ZipEntry = null;
         var _loc13_:Array = null;
         var _loc14_:* = null;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc17_:ByteArray = null;
         var _loc18_:Theme = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:BackgroundThumb = null;
         var _loc22_:* = null;
         var _loc23_:PropThumb = null;
         var _loc24_:CharThumb = null;
         var _loc25_:EffectThumb = null;
         var _loc26_:SoundThumb = null;
         var _loc27_:String = null;
         var _loc28_:Action = null;
         var _loc29_:CCBodyModel = null;
         var _loc30_:String = null;
         var _loc31_:String = null;
         var _loc32_:String = null;
         var _loc33_:String = null;
         var _loc34_:String = null;
         var _loc35_:CCBodyModel = null;
         var _loc36_:CCCharacterActionModel = null;
         var _loc37_:* = null;
         var _loc38_:PropThumb = null;
         var _loc39_:State = null;
         UtilErrorLogger.getInstance().info("Console#processMovieZipImageData");
         var _loc2_:UtilLoadMgr = new UtilLoadMgr();
         var _loc3_:Vector.<String> = new Vector.<String>();
         var _loc4_:Vector.<ByteArray> = new Vector.<ByteArray>();
         if(this._movieZip)
         {
            _loc9_ = this._movieZip.entries;
            _loc10_ = _loc9_.length;
            while(_loc11_ < _loc10_)
            {
               _loc12_ = _loc9_[_loc11_];
               _loc13_ = _loc12_.name.split(".");
               _loc15_ = _loc13_[0];
               _loc16_ = _loc13_[1];
               if(_loc13_.length > 2)
               {
                  _loc18_ = this._themeManager.getTheme(_loc15_);
                  _loc19_ = _loc13_.slice(2).join(".");
                  _loc20_ = _loc13_[2];
                  _loc17_ = this._movieZip.getInput(_loc12_);
                  if(_loc15_ != "ugc")
                  {
                     _loc8_ = new UtilCrypto();
                     _loc8_.decrypt(_loc17_);
                  }
                  switch(_loc16_)
                  {
                     case "bg":
                        _loc21_ = _loc18_.getBackgroundThumbById(_loc19_);
                        _loc21_.imageData = _loc17_;
                        _loc21_.thumbImageData = _loc17_;
                        break;
                     case "prop":
                        _loc22_ = _loc13_.length > 4?_loc20_:_loc19_;
                        if(_loc13_.length >= 4 && _loc13_[3] == "head")
                        {
                           _loc22_ = _loc22_ + ".head";
                        }
                        _loc23_ = _loc18_.getPropThumbById(_loc22_) as PropThumb;
                        if(!_loc23_)
                        {
                           _loc23_ = _loc18_.getPropThumbById(_loc20_ + ".flv") as PropThumb;
                        }
                        if(_loc23_)
                        {
                           if(_loc23_.getStateNum() > 0)
                           {
                              _loc14_ = _loc15_ + ".prop." + _loc22_ + ".";
                              _loc23_.initImageData(this._movieZip,_loc14_);
                           }
                           else
                           {
                              _loc23_.imageData = _loc17_;
                           }
                        }
                        break;
                     case "char":
                        _loc24_ = _loc18_.getCharThumbById(_loc20_);
                        if(_loc24_)
                        {
                           if(_loc24_.ccThemeId == "")
                           {
                              if(_loc13_.length == 4)
                              {
                                 _loc14_ = _loc15_ + ".char." + _loc20_ + ".";
                                 _loc2_.addEventDispatcher(_loc24_,CoreEvent.LOAD_THUMB_COMPLETE);
                                 _loc24_.initImageData(this._movieZip,_loc14_);
                              }
                              else if(_loc13_.length == 5)
                              {
                                 _loc27_ = _loc13_[3] + "." + _loc13_[4];
                                 _loc28_ = _loc24_.getActionById(_loc27_);
                                 if(_loc13_[4] == "xml")
                                 {
                                    _loc2_.addEventDispatcher(_loc28_,CoreEvent.LOAD_STATE_COMPLETE);
                                    _loc28_.loadImageDataByXml(new XML(_loc17_));
                                 }
                                 else
                                 {
                                    _loc28_.imageData = _loc17_;
                                 }
                              }
                           }
                           else if(_loc13_.length == 4)
                           {
                              _loc29_ = _loc24_.ccBodyModel;
                              if(!_loc29_.completed)
                              {
                                 _loc29_.parse(new XML(_loc17_));
                              }
                              _loc24_.getHeadPropThumb();
                           }
                        }
                        break;
                     case "effect":
                        _loc25_ = _loc18_.getEffectThumbById(_loc19_);
                        if(_loc25_ && _loc25_.getType() == EffectThumb.TYPE_ANIME)
                        {
                           _loc25_.imageData = _loc17_;
                        }
                        break;
                     case "sound":
                        _loc26_ = _loc18_.getSoundThumbById(_loc19_);
                        if(_loc26_)
                        {
                           _loc26_.initSoundByByteArray(_loc17_);
                        }
                  }
               }
               else if(_loc16_ == "swf")
               {
                  _loc3_.push(_loc15_);
                  _loc4_.push(this._movieZip.getInput(_loc12_));
               }
               _loc11_++;
            }
         }
         var _loc5_:XMLList = this._movieXML..char.head.file;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length())
         {
            _loc30_ = XML(_loc5_[_loc6_]).toString();
            _loc31_ = UtilXmlInfo.getThemeIdFromFileName(_loc30_);
            if(_loc31_ == this._themeManager.userTheme.id)
            {
               _loc32_ = UtilXmlInfo.getCharIdFromFacialFileName(_loc30_);
               if(_loc32_)
               {
                  _loc33_ = UtilXmlInfo.getFacialIdFromFileName(_loc30_);
                  _loc34_ = this._themeManager.userTheme.getCharThumbById(_loc32_).ccThemeId;
                  _loc35_ = CCBodyManager.instance.getBodyModel(_loc32_);
                  _loc36_ = CCThemeManager.instance.getThemeModel(_loc34_).getCharacterFacialModel(_loc35_,_loc33_);
                  _loc37_ = _loc32_ + ".head";
                  _loc38_ = this._themeManager.userTheme.getPropThumbById(_loc37_) as PropThumb;
                  if(_loc38_)
                  {
                     _loc39_ = _loc38_.getStateById(_loc33_);
                     if(!_loc39_.imageData)
                     {
                        _loc2_.addEventDispatcher(_loc39_,CoreEvent.LOAD_STATE_COMPLETE);
                        _loc39_.loadImageDataByCam(_loc36_);
                     }
                  }
               }
            }
            _loc6_++;
         }
         var _loc7_:FontManager = FontManager.getFontManager();
         _loc2_.addEventDispatcher(_loc7_,CoreEvent.MOVIE_FONT_LOADED);
         _loc7_.loadFontsByMovieZip(_loc3_,_loc4_);
         _loc2_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onPreparationFinish);
         _loc2_.commit();
      }
      
      private function doLoadMovieFail(param1:Event = null) : void
      {
         if(this._isLoadingStarter)
         {
            this.cancelProcessingStarter();
            UtilErrorLogger.getInstance().error("Console::doLoadStarterFail");
            AlertPopUp.openDefaultPopUpWithLocale("We could not load the starter you wanted to insert in your video. Please try again.","Starter Error");
         }
         else
         {
            UtilErrorLogger.getInstance().fatal("Console::doLoadMovieFail");
         }
         this.loadProgressVisible = false;
         this.requestLoadStatus(false);
      }
      
      private function onPreparationFinish(param1:LoadMgrEvent) : void
      {
         var metaNode:XML = null;
         var myMetaData:MetaData = null;
         var list:XMLList = null;
         var popUp:ConfirmPopUp = null;
         var event:LoadMgrEvent = param1;
         (event.target as UtilLoadMgr).removeEventListener(LoadMgrEvent.ALL_COMPLETE,this.onPreparationFinish);
         UtilErrorLogger.getInstance().appendCustomError("onPrepartionFinish, isLoadingStarter:" + this._isLoadingStarter);
         if(this._isLoadingStarter)
         {
            metaNode = this._movieXML.child(MetaData.XML_NODE_NAME)[0];
            myMetaData = new MetaData();
            myMetaData.deSerialize(metaNode,"","");
            if(myMetaData.mver <= 3 && this.metaData.mver > 3)
            {
               list = this._movieXML..effectAsset.effect.(@type == "ZOOM");
               if(list.length() > 0)
               {
                  popUp = new ConfirmPopUp();
                  popUp.showCloseButton = false;
                  popUp.title = UtilDict.toDisplay("go","Warning");
                  popUp.message = UtilDict.toDisplay("go","The starter you are adding contains old camera FXs that are now retired. You can insert the starter in your movie, but these FXs will be removed, requiring you to redo your shots.\n\nTo use this starter with these camera FXs, please copy an older movie created before our composition tool was introduced.");
                  popUp.confirmText = UtilDict.toDisplay("go","Proceed");
                  popUp.cancelText = UtilDict.toDisplay("go","Cancel");
                  popUp.addEventListener(PopUpEvent.CLOSE,this.onZoomWarningClose);
                  popUp.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
                  return;
               }
            }
         }
         this.deserialMovie();
      }
      
      private function onZoomWarningClose(param1:PopUpEvent) : void
      {
         if(param1.commit)
         {
            this.deserialMovie();
         }
         else
         {
            this.cancelProcessingStarter();
         }
      }
      
      public function startProcessingStarter(param1:Boolean) : void
      {
         this._processingStarter = true;
         this.timeline.processingStarter = true;
         this.timelineController.autoMoveSounds = param1;
      }
      
      private function cancelProcessingStarter() : void
      {
         if(this._isLoadingStarter)
         {
            this._isLoadingStarter = false;
            this.mainStage.enableInteraction();
            this.finishProcessingStarter();
         }
      }
      
      public function finishProcessingStarter() : void
      {
         this.timelineController.autoMoveSounds = true;
         this.timeline.processingStarter = false;
         this._processingStarter = false;
      }
      
      private function deserialMovie() : void
      {
         UtilErrorLogger.getInstance().info("Console::deserialMovie");
         this.mainStage.enableInteraction();
         var _loc1_:String = this._configManager.getValue(ServerConstants.PARAM_ORIGINAL_ID);
         this.deSerialize(this._movieXML,this.metaData.movieId,_loc1_);
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_MOVIE_COMPLETE,this));
      }
      
      private function genDefaultTags() : void
      {
         this.metaData.genDefaultTags(this._movie);
      }
      
      public function showProgress(param1:ProgressEvent) : void
      {
         if(!this._initialized && param1.target != this._progressMonitor)
         {
            return;
         }
         var _loc2_:Number = Math.round(param1.bytesLoaded / param1.bytesTotal * 100);
         if(this._loadProgress)
         {
            this._loadProgress.setProgress(_loc2_);
         }
         if(param1.bytesLoaded >= param1.bytesTotal)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.showProgress);
         }
      }
      
      public function initializeLoadingBar(param1:StudioProgressBar) : void
      {
         this._loadProgress = param1;
      }
      
      public function set loadProgress(param1:Number) : void
      {
         if(!this._initialized)
         {
            return;
         }
         if(this._loadProgress)
         {
            this._loadProgress.setProgress(param1);
         }
      }
      
      public function get getLoadProgress() : StudioProgressBar
      {
         return this._loadProgress as StudioProgressBar;
      }
      
      public function set loadProgressVisible(param1:Boolean) : void
      {
         this._loadProgress.visible = param1;
      }
      
      public function updateProgressStatus(param1:String) : void
      {
         if(this._loadProgress)
         {
            this._loadProgress.updateStatus(param1);
         }
      }
      
      public function get allSceneThumbnailBitmapData() : Vector.<BitmapData>
      {
         var _loc1_:Vector.<BitmapData> = new Vector.<BitmapData>();
         var _loc2_:int = 0;
         while(_loc2_ < this.scenes.length)
         {
            _loc1_.push(this.getThumbnailCaptureBySceneIndex(_loc2_));
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function getThumbnailCaptureBySceneIndex(param1:int) : BitmapData
      {
         return this.timeline.getSceneImageBitmapByIndex(param1);
      }
      
      private function onAutoSaveTimerHandler(param1:TimerEvent) : void
      {
         this.doAutoSave();
      }
      
      private function doAutoSave() : Boolean
      {
         if(!this._initialized || this._isSavingMovie || this._publishW)
         {
            return false;
         }
         if(!this.autoSaveEnabled)
         {
            return false;
         }
         if(this.metaData.movieId == null)
         {
            this.genDefaultTags();
         }
         addEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.showSaveMovieError);
         var _loc1_:Boolean = this.saveMovie(true);
         return _loc1_;
      }
      
      public function restartTutorial() : void
      {
         this.actionAfterAutoSave = ACTION_TUTORIAL_RESTART;
         var _loc1_:Boolean = this.doAutoSave();
         if(!_loc1_)
         {
            this.performActionAfterAutoSave();
         }
      }
      
      private function openRestartTutorialPopUp() : void
      {
         if(!this.restartTutorialPopUp)
         {
            this.restartTutorialPopUp = new ConfirmPopUp();
            this.restartTutorialPopUp.iconType = ConfirmPopUp.CONFIRM_POPUP_NO_ICON;
            this.restartTutorialPopUp.title = UtilDict.translate("Restart Tutorial");
            this.restartTutorialPopUp.showCloseButton = true;
            this.restartTutorialPopUp.showCancelButton = false;
            this.restartTutorialPopUp.message = UtilDict.translate("The Video Maker is going to refresh.\nDon\'t worry, your video has been auto-saved.");
            this.restartTutorialPopUp.confirmText = UtilDict.translate("Start Tutorial");
            this.restartTutorialPopUp.addEventListener(PopUpEvent.CLOSE,this.restartTutorialPopUp_closeHandler);
         }
         this.restartTutorialPopUp.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function restartTutorialPopUp_closeHandler(param1:PopUpEvent) : void
      {
         if(param1.commit)
         {
            this.restartTutorialImpl();
         }
      }
      
      private function restartTutorialImpl() : void
      {
         ExternalLinkManager.instance.exitStudio();
         var _loc1_:String = !!UtilSite.isG4S?ServerConstants.ACTION_RESTART_TUTORIAL:StringUtil.substitute(ServerConstants.HOST_PATH + "videomaker/full/{0}/tutorial",this._thumbTray.defaultThemeId);
         ExternalLinkManager.instance.navigateWithSession(_loc1_);
      }
      
      private function setBadTerms(param1:String) : void
      {
         this._badTerms = param1.split(",");
      }
      
      public function getBadTerms() : Array
      {
         if(this._badTerms != null)
         {
            return this._badTerms;
         }
         return null;
      }
      
      private function setWhiteTerms(param1:String) : void
      {
         if(param1 != "")
         {
            this._whiteTerms = param1.split(",");
         }
      }
      
      public function getWhiteTerms() : Array
      {
         if(this._whiteTerms != null)
         {
            return this._whiteTerms;
         }
         return null;
      }
      
      public function doUpdateTimelineByScene(param1:AnimeScene, param2:Boolean = false) : void
      {
         if(param2 && this.currentScene != param1)
         {
            return;
         }
         if(param1)
         {
            this.timeline.updateSceneThumbnail(this._thumbnailManager,param1,this.getSceneIndex(param1));
         }
      }
      
      private function doUpdateTimeline(param1:Event, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this._capScreenLock)
         {
            if(this._movie.currentScene != null)
            {
               if(this._defaultUpdateAllTimelineImage)
               {
                  _loc4_ = this._movie.scenes.length;
                  _loc3_ = 0;
                  while(_loc3_ < _loc4_)
                  {
                     this._movie.getSceneAt(_loc3_).unloadAllAssets();
                     _loc3_++;
                  }
                  if(_loc4_ > 1)
                  {
                     this._defaultUpdateAllTimelineImage = false;
                  }
               }
               else
               {
                  _loc3_ = this._movie.currentIndex;
                  this.doUpdateTimelineByScene(this.getScene(_loc3_));
               }
            }
         }
      }
      
      public function addThumbToMovieTheme(param1:Thumb) : void
      {
         if(param1 && param1.enable)
         {
            Console.getConsole().thumbTray.addThumbToMovieTray(param1);
            if(!ThemeManager.instance.movieTheme.isThumbExist(param1))
            {
               ThemeManager.instance.movieTheme.addThumb(param1);
            }
         }
      }
      
      public function validateThemeStarterAssetId(param1:String) : Boolean
      {
         if(this.isLoadingThemeStarter())
         {
            if(param1 != this._selectedStarterThumb.themeId)
            {
               this._errorLoadingThemeStarter = true;
               return false;
            }
         }
         return true;
      }
      
      public function openFlowFrameImageEditor(param1:FlowFrame) : void
      {
         if(!this.flowFrameImageEditor || this.flowFrameImageEditor.visible || !param1)
         {
            return;
         }
         param1.startEditMode();
         var _loc2_:Point = new Point();
         _loc2_ = this.sceneEditor.localToGlobal(_loc2_);
         this.flowFrameImageEditor.zoomAndPan(this.mainStage.zoomContainer.zoomFactor,_loc2_.x,_loc2_.y);
         this.flowFrameImageEditor.visible = true;
         this.flowFrameImageEditor.flowFrame = param1;
         this.flowFrameImageEditor.setFocus();
      }
   }
}
