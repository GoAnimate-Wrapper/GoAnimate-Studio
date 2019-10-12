package anifire.studio.core
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.bubble.BubbleMgr;
   import anifire.color.SelectedColor;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.core.AssetLinkage;
   import anifire.effect.EffectMgr;
   import anifire.effect.ZoomEffect;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IXmlConvertable;
   import anifire.iterators.ArrayIterator;
   import anifire.iterators.NullIterator;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.managers.AppConfigManager;
   import anifire.managers.CCBodyManager;
   import anifire.managers.CCThemeManager;
   import anifire.managers.FeatureManager;
   import anifire.models.creator.CCBodyModel;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.studio.assets.commands.AddTransitionCommand;
   import anifire.studio.assets.controllers.AssetTransitionController;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetOrdering;
   import anifire.studio.assets.models.AssetSelection;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.assets.models.AssetTransitionCollection;
   import anifire.studio.assets.models.HandDrawnTransitionSetting;
   import anifire.studio.commands.AddAssetCommand;
   import anifire.studio.commands.AddSceneTransitionCommand;
   import anifire.studio.commands.ApplyTextComponentCommand;
   import anifire.studio.commands.ChangeBackgroundCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.PasteAssetCollectionCommand;
   import anifire.studio.commands.RemoveAssetCommand;
   import anifire.studio.commands.RemoveSceneTransitionCommand;
   import anifire.studio.components.AlertPopUp;
   import anifire.studio.components.ConfirmPopUp;
   import anifire.studio.core.sound.AnimeSoundEvent;
   import anifire.studio.core.sound.ProgressiveSound;
   import anifire.studio.events.AssetTransitionEvent;
   import anifire.studio.events.SceneDurationEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.managers.AnalyticsManager;
   import anifire.studio.managers.ColorManager;
   import anifire.studio.managers.StudioFontManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.models.TextComponentData;
   import anifire.studio.models.TextComponentThumb;
   import anifire.studio.utils.UtilGUID;
   import anifire.util.FontManager;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilLicense;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilString;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilXmlInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.collections.XMLListCollection;
   import mx.events.CollectionEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.StringUtil;
   import spark.events.PopUpEvent;
   
   public class AnimeScene extends EventDispatcher
   {
      
      private static const ASSET_CREATION_MODE_NEW_INSTANCE:String = "new instance";
      
      private static const ASSET_CREATION_MODE_OLD_INSTANCE:String = "old instance";
      
      private static const ASSET_CREATION_MODE_NULL:String = "nothing";
      
      public static var XML_NODE_NAME:String = "scene";
      
      public static const XML_NODE_CHAPTER_BREAK:String = "pmb";
      
      private static var _existIDs:UtilHashArray = new UtilHashArray();
      
      private static var _sceneNum:int = 0;
      
      public static const DURATION_MODE_AUTO:uint = 0;
      
      public static const DURATION_MODE_CUSTOM:uint = 1;
      
      public static const DEFAULT_BASE_COLOR:int = 16777215;
      
      private static var _isInitBizTheme:Boolean;
       
      
      private var _console:Console;
      
      private var _id:String;
      
      private var _name:String;
      
      private var _background:Background;
      
      private var _transition:GoTransition;
      
      private var _assetTransitions:AssetTransitionCollection;
      
      private var _assetTransitionController:AssetTransitionController;
      
      private var _characters:UtilHashArray;
      
      private var _bubbles:UtilHashArray;
      
      private var _props:UtilHashArray;
      
      private var _effects:UtilHashArray;
      
      private var _cloneableAssetsInfo:UtilHashArray;
      
      private var _assetOrdering:AssetOrdering;
      
      private var _effectOrdering:AssetOrdering;
      
      private var _sceneZoomEffect:ProgramEffectAsset;
      
      private var _totalFrames:int;
      
      private var _speech:AnimeSound;
      
      private var _durationMode:uint = 0;
      
      private var _countMinimumDuration:Boolean = true;
      
      private var _countTransitionDuration:Boolean = true;
      
      private var _countActionDuration:Boolean = true;
      
      private var _countBubbleDuration:Boolean = true;
      
      private var _countSpeechDuration:Boolean = true;
      
      private var _customTotalFrames:int;
      
      private var _systemTotalFrames:int;
      
      private var _endFrameBySpeech:int;
      
      private var _totalFrameOfTransitionBeforeNarration:int;
      
      private var _modified:Boolean = true;
      
      private var _isDragEnter:Boolean;
      
      private var _sizingAsset:Asset;
      
      private const MOTION_TIME:Number = UtilUnitConvert.secToPixel(AnimeConstants.MOTION_DURATION);
      
      private const BACKGROUND_INDEX:int = 0;
      
      private var _eventDispatcher:EventDispatcher;
      
      private var _oldMousePoint:Point;
      
      private var _sceneXML:XML;
      
      private var _combgId:String = "";
      
      private var _selection:AssetSelection;
      
      private var _addTransitionForCompositeBg:Boolean;
      
      private var _baseColor:uint = 16777215;
      
      private var _textComponentData:TextComponentData;
      
      private var _guid:String;
      
      protected var _chapterBreak:Boolean;
      
      private var _videoPropToBeAdded:VideoProp;
      
      public function AnimeScene(param1:String = "", param2:Boolean = false)
      {
         this._assetOrdering = new AssetOrdering();
         this._effectOrdering = new AssetOrdering();
         this._totalFrames = AnimeConstants.SCENE_FRAME_DEFAULT;
         this._customTotalFrames = AnimeConstants.SCENE_FRAME_DEFAULT;
         this._systemTotalFrames = AnimeConstants.SCENE_FRAME_DEFAULT;
         this._endFrameBySpeech = AnimeConstants.SCENE_FRAME_DEFAULT;
         this._eventDispatcher = new EventDispatcher();
         this._selection = new AssetSelection();
         super();
         _sceneNum++;
         if(param1 != "" && param2)
         {
            this._id = param1;
         }
         else
         {
            this._id = this.generateNewID(param1);
         }
         this._name = param1;
         this._characters = new UtilHashArray();
         this._bubbles = new UtilHashArray();
         this._props = new UtilHashArray();
         this._effects = new UtilHashArray();
         this._cloneableAssetsInfo = new UtilHashArray();
         this._assetTransitions = new AssetTransitionCollection();
         this._assetTransitions.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onAssetTransitionChange);
         this._assetTransitions.addEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onAssetTransitionChange);
         this._assetTransitions.addEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.onAssetTransitionChange);
         this._assetTransitions.addEventListener(AssetTransitionEvent.TYPE_CHANGE,this.onAssetTransitionTypeChange);
         this._assetTransitionController = new AssetTransitionController();
         this._assetTransitionController.collection = this._assetTransitions;
         this.addEventListener(SceneEvent.ASSET_ADDED,this.onAssetAdded);
      }
      
      private static function get isInitBizTheme() : Boolean
      {
         if(!_isInitBizTheme)
         {
            _isInitBizTheme = UtilLicense.isInitBizTheme();
         }
         return _isInitBizTheme;
      }
      
      public function get textComponentData() : TextComponentData
      {
         return this._textComponentData;
      }
      
      public function set textComponentData(param1:TextComponentData) : void
      {
         if(param1 != this._textComponentData)
         {
            this._textComponentData = param1;
         }
      }
      
      public function get baseColor() : uint
      {
         return this._baseColor;
      }
      
      public function set baseColor(param1:uint) : void
      {
         if(param1 >= 0)
         {
            this._baseColor = param1;
            Console.getConsole().changed = true;
         }
         dispatchEvent(new SceneEvent(SceneEvent.BASE_COLOR_CHANGE));
      }
      
      public function restoreBaseColor() : void
      {
         this.baseColor = DEFAULT_BASE_COLOR;
      }
      
      public function get guid() : String
      {
         return this._guid;
      }
      
      public function set guid(param1:String) : void
      {
         this._guid = param1;
      }
      
      public function createGuid(param1:Boolean = false) : void
      {
         if(!this._guid || param1)
         {
            this._guid = UtilGUID.create();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chapterBreak() : Boolean
      {
         return this._chapterBreak;
      }
      
      private function set _1684171598chapterBreak(param1:Boolean) : void
      {
         if(this._chapterBreak != param1)
         {
            this._chapterBreak = param1;
            dispatchEvent(new SceneEvent(SceneEvent.CHAPTER_BREAK_CHANGE));
         }
      }
      
      public function get selection() : AssetSelection
      {
         return this._selection;
      }
      
      public function get transition() : GoTransition
      {
         return this._transition;
      }
      
      public function set transition(param1:GoTransition) : void
      {
         if(this._transition)
         {
            this._transition.removeEventListener(Event.CHANGE,this.onTransitionChange);
            this.removeCloneableAssetInfo(this._transition.id);
         }
         this._transition = param1;
         if(this._transition)
         {
            this.addCloneableAssetInfo(this._transition.id,"transition");
            this._transition.addEventListener(Event.CHANGE,this.onTransitionChange);
         }
         this.updateDuration();
         this.dispatchEvent(new SceneEvent(SceneEvent.TRANSITION_CHANGE));
      }
      
      private function onTransitionChange(param1:Event) : void
      {
         this.dispatchEvent(new SceneEvent(SceneEvent.TRANSITION_CHANGE));
         this.updateDuration();
      }
      
      public function get assetTransitions() : AssetTransitionCollection
      {
         return this._assetTransitions;
      }
      
      public function get assetTransitionController() : AssetTransitionController
      {
         return this._assetTransitionController;
      }
      
      public function get duration() : Number
      {
         return UtilUnitConvert.frameToDuration(this.totalFrames);
      }
      
      public function get customDuration() : Number
      {
         return UtilUnitConvert.frameToDuration(this._customTotalFrames);
      }
      
      public function get totalFrames() : int
      {
         return this._totalFrames;
      }
      
      public function set totalFrames(param1:int) : void
      {
         var _loc2_:int = 0;
         param1 = Math.round(param1 / AnimeConstants.SCENE_FRAME_INTERVAL) * AnimeConstants.SCENE_FRAME_INTERVAL;
         if(param1 < AnimeConstants.SCENE_FRAME_MINIMUM)
         {
            param1 = AnimeConstants.SCENE_FRAME_MINIMUM;
         }
         else if(param1 > AnimeConstants.SCENE_FRAME_MAXIMUM)
         {
            param1 = AnimeConstants.SCENE_FRAME_MAXIMUM;
         }
         if(this._totalFrames != param1)
         {
            this.updateAllEffectTiming(param1,this._totalFrames);
            _loc2_ = param1 - this._totalFrames;
            this._totalFrames = param1;
            this.updateSceneTransitionDuration();
            this.updateSpeechDuration();
            this.dispatchEvent(new SceneEvent(SceneEvent.DURATION_CHANGE));
            this.dispatchEvent(new SceneDurationEvent(SceneDurationEvent.SCENE_DURATION_CHANGE,this,_loc2_));
         }
      }
      
      private function updateSceneTransitionDuration() : void
      {
         if(this._transition && this._transition.duration > this._totalFrames)
         {
            this._transition.duration = this._totalFrames;
         }
      }
      
      private function updateAllEffectTiming(param1:int, param2:int) : void
      {
         var _loc3_:EffectAsset = null;
         var _loc4_:uint = 0;
         while(_loc4_ < this._effects.length)
         {
            _loc3_ = this._effects.getValueByIndex(_loc4_) as EffectAsset;
            if(_loc3_)
            {
               _loc3_.updateTiming(param1,param2);
            }
            _loc4_++;
         }
      }
      
      public function get durationMode() : uint
      {
         return this._durationMode;
      }
      
      public function set durationMode(param1:uint) : void
      {
         if(param1 != this._durationMode)
         {
            this._durationMode = param1;
            this.updateDuration();
            this.dispatchEvent(new SceneEvent(SceneEvent.DURATION_MODE_CHANGE));
         }
      }
      
      public function get countMinimumDuration() : Boolean
      {
         return this._countMinimumDuration;
      }
      
      public function set countMinimumDuration(param1:Boolean) : void
      {
         if(this._countMinimumDuration != param1)
         {
            this._countMinimumDuration = param1;
            this.dispatchEvent(new SceneEvent(SceneEvent.DURATION_OPTION_CHANGE));
         }
      }
      
      public function get countTransitionDuration() : Boolean
      {
         return this._countTransitionDuration;
      }
      
      public function set countTransitionDuration(param1:Boolean) : void
      {
         if(this._countTransitionDuration != param1)
         {
            this._countTransitionDuration = param1;
            this.dispatchEvent(new SceneEvent(SceneEvent.DURATION_OPTION_CHANGE));
         }
      }
      
      public function get countActionDuration() : Boolean
      {
         return this._countActionDuration;
      }
      
      public function set countActionDuration(param1:Boolean) : void
      {
         if(this._countActionDuration != param1)
         {
            this._countActionDuration = param1;
            this.dispatchEvent(new SceneEvent(SceneEvent.DURATION_OPTION_CHANGE));
         }
      }
      
      public function get countBubbleDuration() : Boolean
      {
         return this._countBubbleDuration;
      }
      
      public function set countBubbleDuration(param1:Boolean) : void
      {
         if(this._countBubbleDuration != param1)
         {
            this._countBubbleDuration = param1;
            this.dispatchEvent(new SceneEvent(SceneEvent.DURATION_OPTION_CHANGE));
         }
      }
      
      public function get countSpeechDuration() : Boolean
      {
         return this._countSpeechDuration;
      }
      
      public function set countSpeechDuration(param1:Boolean) : void
      {
         if(this._countSpeechDuration != param1)
         {
            this._countSpeechDuration = param1;
            this.dispatchEvent(new SceneEvent(SceneEvent.DURATION_OPTION_CHANGE));
         }
      }
      
      public function get customTotalFrames() : int
      {
         return this._customTotalFrames;
      }
      
      public function set customTotalFrames(param1:int) : void
      {
         param1 = Math.round(param1 / AnimeConstants.SCENE_FRAME_INTERVAL) * AnimeConstants.SCENE_FRAME_INTERVAL;
         if(param1 < AnimeConstants.SCENE_FRAME_MINIMUM)
         {
            param1 = AnimeConstants.SCENE_FRAME_MINIMUM;
         }
         else if(param1 > AnimeConstants.SCENE_FRAME_MAXIMUM)
         {
            param1 = AnimeConstants.SCENE_FRAME_MAXIMUM;
         }
         if(this._customTotalFrames != param1)
         {
            this._customTotalFrames = param1;
            if(this._durationMode == AnimeScene.DURATION_MODE_CUSTOM)
            {
               this.totalFrames = this._customTotalFrames;
            }
         }
         dispatchEvent(new SceneEvent(SceneEvent.CUSTOM_DURATION_CHANGE));
      }
      
      public function updateDuration() : void
      {
         if(!Console.getConsole().initialized)
         {
            return;
         }
         switch(this._durationMode)
         {
            case DURATION_MODE_AUTO:
               this.updateSystemTotalFrames();
               this.totalFrames = this._systemTotalFrames;
               break;
            case DURATION_MODE_CUSTOM:
               this.totalFrames = this._customTotalFrames;
         }
      }
      
      private function get systemTotalFrames() : int
      {
         return this._systemTotalFrames;
      }
      
      private function updateSystemTotalFrames() : void
      {
         var _loc1_:int = 0;
         var _loc8_:BubbleAsset = null;
         var _loc9_:Character = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this._countMinimumDuration)
         {
            _loc2_ = AnimeConstants.SCENE_FRAME_DEFAULT;
         }
         if(this._countBubbleDuration)
         {
            _loc1_ = 0;
            while(_loc1_ < this._bubbles.length)
            {
               _loc8_ = this._bubbles.getValueByIndex(_loc1_) as BubbleAsset;
               if(_loc8_)
               {
                  _loc3_ = _loc3_ + (AnimeConstants.FRAME_PER_SEC + AnimeConstants.FRAME_PER_BUBBLE_WORD * UtilString.countWord(_loc8_.text));
               }
               _loc1_++;
            }
         }
         if(this._countActionDuration)
         {
            _loc1_ = 0;
            while(_loc1_ < this._characters.length)
            {
               _loc9_ = this._characters.getValueByIndex(_loc1_) as Character;
               if(_loc9_)
               {
                  _loc4_ = Math.max(_loc4_,_loc9_.getActionDefaultTotalFrame());
               }
               _loc1_++;
            }
         }
         if(this._countTransitionDuration)
         {
            if(this.transition)
            {
               _loc5_ = this.transition.duration;
            }
            _loc6_ = AssetTransitionHelper.totalFramesByAssetTransition(this);
         }
         if(this._countSpeechDuration && this._speech)
         {
            _loc7_ = this._totalFrameOfTransitionBeforeNarration + this._speech.defaultTotalFrame;
         }
         _loc2_ = Math.max(_loc2_,_loc4_,_loc3_,_loc7_,_loc5_,_loc6_);
         _loc2_ = Math.round(_loc2_ / AnimeConstants.SCENE_FRAME_INTERVAL) * AnimeConstants.SCENE_FRAME_INTERVAL;
         this._systemTotalFrames = _loc2_;
      }
      
      public function get speech() : AnimeSound
      {
         return this._speech;
      }
      
      public function attachSpeech(param1:AnimeSound, param2:Boolean = true, param3:Boolean = true) : AnimeSound
      {
         var _loc5_:int = 0;
         var _loc6_:AnimeSound = null;
         var _loc7_:Console = null;
         var _loc8_:int = 0;
         var _loc9_:AssetLinkage = null;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc4_:AnimeSound = this._speech;
         if(this._speech != param1)
         {
            _loc7_ = Console.getConsole();
            if(this._speech)
            {
               this._speech.scene = null;
               this._speech.waveformDelay = 0;
               _loc5_ = this._speech.soundsController.resizeSound(this._speech,this._speech.startFrame,this._speech.startFrame + this._speech.defaultTotalFrame - 1,false,true);
               _loc6_ = this._speech;
               _loc7_.linkageController.removeLinkageToAnyScene(this._speech.id);
               this._speech.removeEventListener(AnimeSoundEvent.DEFAULT_TOTAL_FRAME_CHANGE,this.speech_defaultTotalFrameChangeHandler);
            }
            this._speech = param1;
            if(this._speech)
            {
               _loc9_ = new AssetLinkage();
               _loc9_.addLinkage(this._speech.id);
               _loc10_ = this.id + AssetLinkage.LINK;
               _loc9_.addLinkage(_loc10_);
               _loc7_.linkageController.addLinkage(_loc9_);
               this._speech.scene = this;
               this._speech.trackNum = 0;
               _loc11_ = _loc7_.timelineController.getGlobalStartFrame(this);
               _loc5_ = this._speech.soundsController.resizeSound(this._speech,_loc11_,_loc11_ + this._totalFrames - 1,false,true);
               _loc6_ = this._speech;
               this._speech.waveformDelay = this._totalFrameOfTransitionBeforeNarration;
               this._speech.addEventListener(AnimeSoundEvent.DEFAULT_TOTAL_FRAME_CHANGE,this.speech_defaultTotalFrameChangeHandler);
            }
            _loc8_ = this.totalFrames;
            if(param2)
            {
               this.updateDuration();
            }
            if(param3 && _loc5_ > 0 && _loc6_ && _loc8_ == this.totalFrames)
            {
               _loc6_.soundsController.showOverlapConfirmation();
            }
            this.dispatchEvent(new SceneEvent(SceneEvent.SPEECH_CHANGE));
         }
         return _loc4_;
      }
      
      private function speech_defaultTotalFrameChangeHandler(param1:AnimeSoundEvent) : void
      {
         this.updateDuration();
      }
      
      private function get endFrameBySpeech() : int
      {
         return this._endFrameBySpeech;
      }
      
      private function updateSpeechDuration() : void
      {
         if(this._speech)
         {
            this._speech.totalFrame = this._totalFrames;
         }
      }
      
      public function get combgId() : String
      {
         return this._combgId;
      }
      
      public function set combgId(param1:String) : void
      {
         this._combgId = param1;
      }
      
      public function set sceneXML(param1:XML) : void
      {
         this._sceneXML = param1;
      }
      
      public function get sceneXML() : XML
      {
         return this._sceneXML;
      }
      
      public function get sizingAsset() : Asset
      {
         return this._sizingAsset;
      }
      
      public function get camera() : Asset
      {
         return this._sizingAsset;
      }
      
      public function set dragEnter(param1:Boolean) : void
      {
         this._isDragEnter = param1;
      }
      
      private function onAssetTransitionChange(param1:Event) : void
      {
         this._totalFrameOfTransitionBeforeNarration = AssetTransitionHelper.getTotalFrameOfTransitionBeforeNarration(this._assetTransitions);
         if(this._speech)
         {
            this._speech.waveformDelay = this._totalFrameOfTransitionBeforeNarration;
         }
         AssetTransitionHelper.checkAssetTransitionConflict(this);
         this.updateDuration();
      }
      
      public function get totalFrameOfTransitionBeforeNarration() : int
      {
         return this._totalFrameOfTransitionBeforeNarration;
      }
      
      private function onAssetTransitionTypeChange(param1:AssetTransitionEvent) : void
      {
         var _loc3_:Asset = null;
         AssetTransitionHelper.checkAssetTransitionConflict(this);
         var _loc2_:AssetTransition = param1.assetTransition;
         if(_loc2_)
         {
            _loc3_ = this.getAssetById(_loc2_.assetId);
            if(_loc3_)
            {
               if(_loc3_ is BubbleAsset)
               {
                  AssetTransitionHelper.checkConflictWithFontFamily((_loc3_ as BubbleAsset).textFont,_loc2_);
               }
            }
         }
      }
      
      public function doUpdateTimelineLength(param1:Number = -1, param2:Boolean = false) : void
      {
         this.updateDuration();
      }
      
      public function get console() : Console
      {
         return this._console;
      }
      
      public function set console(param1:Console) : void
      {
         this._console = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
         _existIDs.push(param1,param1);
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get background() : Background
      {
         return this._background;
      }
      
      public function set background(param1:Background) : void
      {
         this._background = param1;
      }
      
      public function get modified() : Boolean
      {
         return this._modified;
      }
      
      public function set modified(param1:Boolean) : void
      {
         if(this._modified != param1)
         {
            this._modified = param1;
         }
      }
      
      public function get characters() : UtilHashArray
      {
         return this._characters;
      }
      
      public function get props() : UtilHashArray
      {
         return this._props;
      }
      
      public function get effects() : UtilHashArray
      {
         return this._effects;
      }
      
      public function get bubbles() : UtilHashArray
      {
         return this._bubbles;
      }
      
      public function removeSound() : void
      {
      }
      
      public function muteSound(param1:Boolean) : void
      {
      }
      
      public function getNumberOfAssets() : int
      {
         if(this._background == null)
         {
            return this._characters.length + this._bubbles.length + this._props.length + this._effects.length + 0;
         }
         return this._characters.length + this._bubbles.length + this._props.length + this._effects.length + 1;
      }
      
      public function getCharacterById(param1:String) : Character
      {
         var _loc2_:Character = this._characters.getValueByKey(param1) as Character;
         if(_loc2_)
         {
            return _loc2_;
         }
         return this._assetOrdering.getAssetByID(param1) as Character;
      }
      
      public function getCharacterInNextSceneById(param1:String) : Character
      {
         var _loc2_:int = this._console.getSceneIndex(this);
         var _loc3_:AnimeScene = Console.getConsole().getScene(_loc2_ + 1);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getCharacterById(param1);
      }
      
      public function getCharacterInPrevSceneById(param1:String) : Character
      {
         var _loc2_:int = this._console.getSceneIndex(this);
         var _loc3_:AnimeScene = Console.getConsole().getScene(_loc2_ - 1);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getCharacterById(param1);
      }
      
      public function getBubbleAssetById(param1:String) : BubbleAsset
      {
         return BubbleAsset(this._bubbles.getValueByKey(param1));
      }
      
      public function getPropById(param1:String) : Prop
      {
         return Prop(this._props.getValueByKey(param1));
      }
      
      public function getPropInNextSceneById(param1:String) : Prop
      {
         var _loc2_:int = this._console.getSceneIndex(this);
         var _loc3_:AnimeScene = Console.getConsole().getScene(_loc2_ + 1);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getPropById(param1);
      }
      
      public function getPropInPrevSceneById(param1:String) : Prop
      {
         var _loc2_:int = this._console.getSceneIndex(this);
         var _loc3_:AnimeScene = Console.getConsole().getScene(_loc2_ - 1);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getPropById(param1);
      }
      
      private function getEffectAssetByType(param1:String) : EffectAsset
      {
         var _loc2_:EffectAsset = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.effects.length)
         {
            _loc2_ = this.effects.getValueByIndex(_loc3_) as EffectAsset;
            if(_loc2_.getExactType() == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getEffectAssetById(param1:String, param2:Number = 0) : EffectAsset
      {
         var _loc3_:int = this._console.getSceneIndex(this);
         var _loc4_:AnimeScene = Console.getConsole().getScene(_loc3_ + param2);
         if(_loc4_ == null)
         {
            return null;
         }
         return EffectAsset(_loc4_.effects.getValueByKey(param1));
      }
      
      public function getAssetById(param1:String) : Asset
      {
         if(param1.indexOf("BG") != -1)
         {
            return this._background;
         }
         if(param1.indexOf("AVATOR") != -1)
         {
            return this.getCharacterById(param1);
         }
         if(param1.indexOf("BUBBLE") != -1)
         {
            return this.getBubbleAssetById(param1);
         }
         if(param1.indexOf("EFFECT") != -1)
         {
            return this.getEffectAssetById(param1);
         }
         if(param1.indexOf("PROP") != -1)
         {
            return this.getPropById(param1);
         }
         return null;
      }
      
      public function getWhiteboardHandTransitions() : Array
      {
         var _loc3_:AssetTransition = null;
         var _loc4_:HandDrawnTransitionSetting = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this._assetTransitions.length)
         {
            _loc3_ = this._assetTransitions[_loc2_];
            _loc4_ = _loc3_.setting as HandDrawnTransitionSetting;
            if(_loc4_ != null)
            {
               _loc1_.push(_loc3_);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function addCharacter(param1:String, param2:Character) : void
      {
         this._characters.push(param1,param2);
      }
      
      private function addBubble(param1:String, param2:BubbleAsset) : void
      {
         this._bubbles.push(param1,param2);
      }
      
      private function addProp(param1:String, param2:Prop) : void
      {
         this._props.push(param1,param2);
      }
      
      private function addEffect(param1:String, param2:EffectAsset) : void
      {
         this._effects.push(param1,param2);
         this.refreshEffectTray();
      }
      
      private function getCloeableAssetInfo(param1:String) : String
      {
         return this._cloneableAssetsInfo.getValueByKey(param1);
      }
      
      private function getCloneableAssetIndex(param1:String) : int
      {
         return this._cloneableAssetsInfo.getIndex(param1);
      }
      
      private function addCloneableAssetInfo(param1:String, param2:String, param3:int = -1) : void
      {
         var _loc4_:UtilHashArray = null;
         if(param3 == -1)
         {
            this._cloneableAssetsInfo.push(param1,param2);
         }
         else
         {
            _loc4_ = new UtilHashArray();
            _loc4_.push(param1,param2);
            this._cloneableAssetsInfo.insert(param3,_loc4_);
         }
      }
      
      private function removeCloneableAssetInfo(param1:String) : void
      {
         var _loc2_:int = this._cloneableAssetsInfo.getIndex(param1);
         if(_loc2_ != -1)
         {
            this._cloneableAssetsInfo.remove(_loc2_,1);
         }
      }
      
      private function removeAllCharacters() : void
      {
         this._characters.removeAll();
      }
      
      private function removeCharacter(param1:Character) : void
      {
         this._characters.remove(this._characters.getIndex(param1.id),1);
      }
      
      private function removeAllBubbles() : void
      {
         this._bubbles.removeAll();
      }
      
      private function removeBubble(param1:BubbleAsset) : void
      {
         var _loc2_:int = this._bubbles.getIndex(param1.id);
         if(_loc2_ != -1)
         {
            this._bubbles.remove(_loc2_,1);
         }
      }
      
      private function removeAllAttachedAssets() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Prop = null;
         var _loc3_:BubbleAsset = null;
         var _loc4_:EffectAsset = null;
         _loc1_ = this._props.length - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = Prop(this._props.getValueByIndex(_loc1_));
            if(_loc2_.attachedBg)
            {
               this.removeAsset(_loc2_);
               _loc2_.deleteAsset();
            }
            _loc1_--;
         }
         _loc1_ = this._bubbles.length - 1;
         while(_loc1_ >= 0)
         {
            _loc3_ = BubbleAsset(this._bubbles.getValueByIndex(_loc1_));
            if(_loc3_.attachedBg)
            {
               this.removeAsset(_loc3_);
               _loc3_.deleteAsset();
            }
            _loc1_--;
         }
         _loc1_ = this._effects.length - 1;
         while(_loc1_ >= 0)
         {
            _loc4_ = EffectAsset(this._effects.getValueByIndex(_loc1_));
            if(_loc4_.attachedBg)
            {
               this.removeAsset(_loc4_);
               _loc4_.deleteAsset();
            }
            _loc1_--;
         }
      }
      
      public function get allBgAttachedAssets() : IIterator
      {
         var _loc2_:int = 0;
         var _loc3_:Prop = null;
         var _loc4_:BubbleAsset = null;
         var _loc5_:EffectAsset = null;
         var _loc1_:Array = [];
         if(this._background)
         {
            _loc1_.push(this._background);
         }
         _loc2_ = this._props.length - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = Prop(this._props.getValueByIndex(_loc2_));
            if(_loc3_.attachedBg)
            {
               _loc1_.push(_loc3_);
            }
            _loc2_--;
         }
         _loc2_ = this._bubbles.length - 1;
         while(_loc2_ >= 0)
         {
            _loc4_ = BubbleAsset(this._bubbles.getValueByIndex(_loc2_));
            if(_loc4_.attachedBg)
            {
               _loc1_.push(_loc3_);
            }
            _loc2_--;
         }
         _loc2_ = this._effects.length - 1;
         while(_loc2_ >= 0)
         {
            _loc5_ = EffectAsset(this._effects.getValueByIndex(_loc2_));
            if(_loc5_.attachedBg)
            {
               _loc1_.push(_loc5_);
            }
            _loc2_--;
         }
         return new ArrayIterator(_loc1_);
      }
      
      private function removeAllProps() : void
      {
         this._props.removeAll();
      }
      
      private function removeProp(param1:Prop) : void
      {
         var _loc2_:int = this._props.getIndex(param1.id);
         if(_loc2_ != -1)
         {
            this._props.remove(_loc2_,1);
         }
      }
      
      private function removeAllEffects() : void
      {
         this._effects.removeAll();
      }
      
      private function removeEffect(param1:EffectAsset) : void
      {
         var _loc2_:int = this._effects.getIndex(param1.id);
         if(_loc2_ != -1)
         {
            this._effects.remove(_loc2_,1);
            this.refreshEffectTray();
         }
         if(param1.getExactType() == EffectThumb.TYPE_ZOOM)
         {
            this._sizingAsset = null;
            this.dispatchEvent(new SceneEvent(SceneEvent.CAMERA_REMOVED,param1));
         }
      }
      
      public function deleteBackground() : void
      {
         this.removeAsset(this._background);
      }
      
      private function removeBackground() : void
      {
         this._background = null;
      }
      
      private function removeTransition() : void
      {
         this.transition = null;
      }
      
      private function doDeserialize(param1:LoadMgrEvent) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc6_:Object = _loc2_.getExtraData();
         _loc3_ = _loc6_["xml"];
         _loc4_ = _loc6_["removeAll"];
         _loc5_ = _loc4_ == "false"?false:true;
         this.deSerialize(_loc3_,_loc5_,true,false);
         this._addTransitionForCompositeBg = false;
      }
      
      public function addCharacterPlaceHolder(param1:Asset) : void
      {
         this._assetOrdering.addAsset(param1);
      }
      
      public function addAsset(param1:Asset, param2:Boolean = false, param3:UtilHashSelectedColor = null, param4:Boolean = false) : void
      {
         var onAddedHandler:Function = null;
         var movieThumb:Thumb = null;
         var customColor:UtilHashSelectedColor = null;
         var key:String = null;
         var color:uint = 0;
         var loadMgr:UtilLoadMgr = null;
         var needToLoad:Boolean = false;
         var extraData:Object = null;
         var assetThemeId:String = null;
         var assetTheme:Theme = null;
         var bgUsedThumbs:UtilHashArray = null;
         var i:int = 0;
         var curThumb:Thumb = null;
         var j:int = 0;
         var state:State = null;
         var bubbleAsset:BubbleAsset = null;
         var fontManager:FontManager = null;
         var fontId:String = null;
         var themeId:String = null;
         var popUp:ConfirmPopUp = null;
         var widget:Widget = null;
         var needAdd:Boolean = false;
         var skipOrder:Boolean = false;
         var programEffAsset:ProgramEffectAsset = null;
         var prevAsset:EffectAsset = null;
         var shadow:ProgramEffectAsset = null;
         var asset:Asset = param1;
         var forceAtBottom:Boolean = param2;
         var appliedColor:UtilHashSelectedColor = param3;
         var setBgBaseInvisible:Boolean = param4;
         if(asset == null)
         {
            return;
         }
         try
         {
            if(!(asset is EffectAsset))
            {
               this.selectedAsset = null;
            }
            if(asset is Background)
            {
               if(!Background(asset).isComposite)
               {
                  if(this._background != null)
                  {
                     this.removeBackground();
                  }
                  if(appliedColor)
                  {
                     asset.customColor = appliedColor;
                     asset.updateColor();
                  }
                  else if(asset.thumb.defaultColor)
                  {
                     customColor = new UtilHashSelectedColor();
                     for(key in asset.thumb.defaultColor)
                     {
                        if(ColorManager.instance.hasColorKey(key))
                        {
                           color = ColorManager.instance.getColorByKey(key);
                           customColor.push(key,new SelectedColor(key,uint.MAX_VALUE,color));
                        }
                     }
                     asset.customColor = customColor;
                     asset.updateColor();
                  }
                  this._background = Background(asset);
                  if(setBgBaseInvisible)
                  {
                     this._background.baseVisible = false;
                  }
                  this.addCloneableAssetInfo(asset.id,"background");
                  this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_ADDED,asset));
               }
               else
               {
                  if(this._background != null)
                  {
                     this.removeAsset(this._background);
                  }
                  else
                  {
                     this.removeAllAttachedAssets();
                  }
                  this.combgId = asset.thumb.themeId + "." + asset.thumb.id;
                  loadMgr = new UtilLoadMgr();
                  needToLoad = false;
                  extraData = new Object();
                  assetThemeId = asset.thumb.theme.id;
                  assetTheme = ThemeManager.instance.getTheme(assetThemeId);
                  extraData["xml"] = asset.thumb.xml;
                  extraData["removeAll"] = "false";
                  loadMgr.setExtraData(extraData);
                  loadMgr.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.doDeserialize);
                  bgUsedThumbs = asset.thumb.theme.doOutputThumbs(asset.thumb.xml);
                  i = 0;
                  while(i < bgUsedThumbs.length)
                  {
                     curThumb = bgUsedThumbs.getValueByIndex(i);
                     if(curThumb is BackgroundThumb && !BackgroundThumb(curThumb).isThumbReady())
                     {
                        needToLoad = true;
                        loadMgr.addEventDispatcher(curThumb,CoreEvent.LOAD_THUMB_COMPLETE);
                        curThumb.loadImageData();
                     }
                     else if(!(curThumb is CharThumb))
                     {
                        if(curThumb is PropThumb)
                        {
                           if(PropThumb(curThumb).states.length > 0)
                           {
                              j = 0;
                              while(j < PropThumb(curThumb).states.length)
                              {
                                 state = PropThumb(curThumb).states[j];
                                 if(state.imageData == null && asset.thumb.theme.isStateExists(asset.thumb.xml,state))
                                 {
                                    needToLoad = true;
                                    loadMgr.addEventDispatcher(state,CoreEvent.LOAD_STATE_COMPLETE);
                                    PropThumb(curThumb).loadState(state);
                                 }
                                 j++;
                              }
                           }
                           else if(curThumb.imageData == null)
                           {
                              needToLoad = true;
                              loadMgr.addEventDispatcher(curThumb,CoreEvent.LOAD_THUMB_COMPLETE);
                              curThumb.loadImageData();
                           }
                        }
                        else if(!(curThumb is BubbleThumb))
                        {
                           if(curThumb is EffectThumb && !EffectThumb(curThumb).isThumbReady())
                           {
                              needToLoad = true;
                              loadMgr.addEventDispatcher(curThumb,CoreEvent.LOAD_THUMB_COMPLETE);
                              curThumb.loadImageData();
                           }
                        }
                     }
                     i++;
                  }
                  if(needToLoad)
                  {
                     loadMgr.commit();
                  }
                  else
                  {
                     this.deSerialize(asset.thumb.xml,false,true,false);
                     this._addTransitionForCompositeBg = false;
                  }
               }
            }
            else if(asset is Character)
            {
               this.addCharacter(asset.id,Character(asset));
               this.addCloneableAssetInfo(asset.id,"char");
               if(this._assetOrdering.getOrdering(asset) == -1)
               {
                  this._assetOrdering.addAsset(asset);
               }
               this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_ADDED,asset));
            }
            else if(asset is BubbleAsset)
            {
               bubbleAsset = asset as BubbleAsset;
               if(bubbleAsset.fromTray)
               {
                  fontManager = FontManager.getFontManager();
                  if(!fontManager.isFontLoaded(bubbleAsset.bubble.textFont) && bubbleAsset.bubble.textEmbed)
                  {
                     fontManager.loadFont(bubbleAsset.bubble.textFont,bubbleAsset.bubble.addedToStageHandler);
                  }
                  this.console.sceneEditor.preSelectedAssetIds = [bubbleAsset.id];
               }
               this.addBubble(asset.id,bubbleAsset);
               if(bubbleAsset.bubble.type == BubbleMgr.BLANK)
               {
                  this.addCloneableAssetInfo(asset.id,"bubble");
               }
               this._assetOrdering.addAsset(asset);
               bubbleAsset.bubble.buttonMode = true;
               asset.isLoadded = false;
               this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_ADDED,asset));
               if(bubbleAsset.thumb)
               {
                  if(bubbleAsset.thumb.themeId == ThemeConstants.UGC_THEME_ID)
                  {
                     fontId = bubbleAsset.thumb.id;
                     themeId = bubbleAsset.thumb.themeId;
                  }
                  else
                  {
                     fontId = bubbleAsset.textFont;
                  }
                  StudioFontManager.instance.addRecentFont(fontId,themeId);
               }
            }
            else if(asset is Prop)
            {
               if(asset is VideoProp && this.isVideoTypeExist())
               {
                  this._videoPropToBeAdded = asset as VideoProp;
                  popUp = new ConfirmPopUp();
                  popUp.title = "";
                  popUp.message = UtilDict.toDisplay("go","goalert_confirmreplacevideo");
                  popUp.confirmText = UtilDict.toDisplay("go","goalert_confirmreplacevideoyes");
                  popUp.cancelText = UtilDict.toDisplay("go","goalert_confirmreplacevideono");
                  popUp.addEventListener(PopUpEvent.CLOSE,this.onReplaceExistingVideoPopUpClose);
                  popUp.open(Console.getConsole().mainStage,true);
                  return;
               }
               this._assetOrdering.addAsset(asset);
               if(Prop(asset).attachedBg && forceAtBottom)
               {
                  this.addProp(asset.id,Prop(asset));
                  this.addCloneableAssetInfo(asset.id,"prop",0);
                  this._assetOrdering.sendToBack(asset);
               }
               else
               {
                  this.addProp(asset.id,Prop(asset));
                  this.addCloneableAssetInfo(asset.id,"prop");
               }
               asset.isLoadded = false;
               this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_ADDED,asset));
               if(asset is Widget)
               {
                  widget = asset as Widget;
                  if(widget.styleModel)
                  {
                     if(FontManager.getFontManager().isUserFont(widget.styleModel.font))
                     {
                        StudioFontManager.instance.addRecentFont(widget.styleModel.font,ThemeConstants.UGC_THEME_ID);
                     }
                     else
                     {
                        StudioFontManager.instance.addRecentFont(widget.styleModel.font,ThemeManager.instance.movieTheme.id);
                     }
                  }
               }
            }
            else if(asset is EffectAsset)
            {
               skipOrder = false;
               if(asset is AnimeEffectAsset)
               {
                  needAdd = true;
               }
               else
               {
                  programEffAsset = asset as ProgramEffectAsset;
                  if(this.isProgramEffectTypeExist(programEffAsset.getExactType()))
                  {
                     needAdd = false;
                  }
                  else
                  {
                     needAdd = true;
                  }
                  if(programEffAsset.getExactType() == EffectThumb.TYPE_ZOOM)
                  {
                     programEffAsset.needControl = true;
                     if(!needAdd)
                     {
                        EffectAsset(this.getEffectAssetByType(EffectThumb.TYPE_ZOOM)).deleteAsset();
                        needAdd = true;
                     }
                     this._sceneZoomEffect = programEffAsset;
                     skipOrder = true;
                  }
                  if(programEffAsset.getExactType() == EffectThumb.TYPE_FADING)
                  {
                     if(!needAdd)
                     {
                        EffectAsset(this.getEffectAssetByType(EffectThumb.TYPE_FADING)).deleteAsset();
                        needAdd = true;
                     }
                  }
               }
               if(needAdd && !skipOrder)
               {
                  this._effectOrdering.addAsset(asset);
               }
               if(needAdd)
               {
                  this.addEffect(asset.id,EffectAsset(asset));
                  if(EffectAsset(asset).effect is ZoomEffect)
                  {
                     EffectAsset(asset).effect.buttonMode = true;
                     this._sizingAsset = asset;
                     prevAsset = this.getEffectAssetById(asset.id,-1);
                     if(prevAsset && !EffectAsset(asset).fromSpeech && EffectAsset(asset).fromTray)
                     {
                        asset.width = prevAsset.width;
                        asset.height = prevAsset.height;
                        asset.move(prevAsset.x,prevAsset.y);
                        if(prevAsset is ProgramEffectAsset)
                        {
                           shadow = (prevAsset as ProgramEffectAsset).motionShadow;
                           if(shadow)
                           {
                              asset.width = shadow.width;
                              asset.height = shadow.height;
                              asset.move(shadow.x,shadow.y);
                           }
                           if(ProgramEffectAsset(asset).motionShadow)
                           {
                              ProgramEffectAsset(asset).motionShadow.width = asset.width;
                              ProgramEffectAsset(asset).motionShadow.height = asset.height;
                              ProgramEffectAsset(asset).motionShadow.move(asset.x,asset.y);
                           }
                        }
                     }
                     this.dispatchEvent(new SceneEvent(SceneEvent.CAMERA_ADDED,asset));
                  }
               }
               if(Thumb(asset.thumb).shouldBeCopyToNextScene)
               {
                  this.addCloneableAssetInfo(asset.id,"effect");
               }
               this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_ADDED,asset));
            }
            movieThumb = asset.thumb;
            if(asset is Character && asset.mThumbId)
            {
               movieThumb = Theme(asset.thumb.theme).getCharThumbById(asset.mThumbId);
            }
            if(!(movieThumb is BubbleThumb))
            {
               Console.getConsole().addThumbToMovieTheme(movieThumb as Thumb);
            }
            if(this._addTransitionForCompositeBg)
            {
               this.addAssetTransition(asset,forceAtBottom);
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AnimeScene:AddAsset",e);
         }
         this.updateDuration();
      }
      
      public function set addTransitionForCompositeBg(param1:Boolean) : void
      {
         this._addTransitionForCompositeBg = param1;
      }
      
      private function addAssetTransition(param1:Asset, param2:Boolean) : void
      {
         var _loc3_:AssetTransition = null;
         var _loc4_:AddTransitionCommand = null;
         if(param1.isWhiteboardAsset && param1 is Prop)
         {
            _loc3_ = this.assetTransitionController.createTransition(param1);
            if(_loc3_)
            {
               _loc4_ = new AddTransitionCommand(_loc3_,false,param2);
               _loc4_.execute();
            }
         }
         if(param1.isInfographicAsset && param1 is Prop)
         {
            _loc3_ = this.assetTransitionController.createTransition(param1);
            if(_loc3_)
            {
               _loc4_ = new AddTransitionCommand(_loc3_,false,param2);
               _loc4_.execute();
            }
         }
      }
      
      private function deleteAllVideos() : void
      {
         var _loc1_:VideoProp = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.props.length)
         {
            _loc1_ = this.props.getValueByIndex(_loc2_) as VideoProp;
            if(_loc1_)
            {
               _loc1_.deleteAsset();
               this.removeAsset(_loc1_);
            }
            _loc2_++;
         }
      }
      
      public function deleteAllAssets() : void
      {
         var _loc1_:int = 0;
         if(this._background != null)
         {
            this._background.deleteAsset();
         }
         _loc1_ = this._characters.length - 1;
         while(_loc1_ >= 0)
         {
            Character(this._characters.getValueByIndex(_loc1_)).deleteAsset();
            _loc1_--;
         }
         _loc1_ = this._props.length - 1;
         while(_loc1_ >= 0)
         {
            Prop(this._props.getValueByIndex(_loc1_)).deleteAsset();
            _loc1_--;
         }
         _loc1_ = this._bubbles.length - 1;
         while(_loc1_ >= 0)
         {
            BubbleAsset(this._bubbles.getValueByIndex(_loc1_)).deleteAsset();
            _loc1_--;
         }
         _loc1_ = this._effects.length - 1;
         while(_loc1_ >= 0)
         {
            EffectAsset(this._effects.getValueByIndex(_loc1_)).deleteAsset();
            _loc1_--;
         }
      }
      
      public function removeAllAssets() : void
      {
         this.removeSound();
         this.removeBackground();
         this.removeAllCharacters();
         this.removeAllBubbles();
         this.removeAllProps();
         this.removeAllEffects();
      }
      
      public function destroy(param1:String = "rip") : void
      {
         this.deleteAllAssets();
         this.removeAllAssets();
      }
      
      public function removeAsset(param1:Asset) : void
      {
         if(param1)
         {
            if(!(param1 is EffectAsset))
            {
               this._selection.clearCollection();
            }
            if(param1 is Background)
            {
               this.removeBackground();
               this.removeAllAttachedAssets();
               this.removeCloneableAssetInfo(param1.id);
            }
            else if(param1 is Character)
            {
               this.removeCharacter(Character(param1));
               this.removeCloneableAssetInfo(param1.id);
            }
            else if(param1 is BubbleAsset)
            {
               this.removeBubble(BubbleAsset(param1));
               this.removeCloneableAssetInfo(param1.id);
            }
            else if(param1 is Prop)
            {
               this.removeProp(Prop(param1));
               this.removeCloneableAssetInfo(param1.id);
            }
            else if(param1 is EffectAsset)
            {
               this.removeEffect(EffectAsset(param1));
            }
            this._assetOrdering.removeAsset(param1);
            this._effectOrdering.removeAsset(param1);
            this._assetTransitionController.removeByAssetId(param1.id);
            this.updateDuration();
            this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_REMOVED,param1));
         }
      }
      
      public function reorderAsset(param1:Asset, param2:int) : Boolean
      {
         var _loc3_:AssetOrdering = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1)
         {
            _loc3_ = param1 is EffectAsset?this._effectOrdering:this._assetOrdering;
            _loc4_ = _loc3_.getOrdering(param1);
            _loc5_ = _loc3_.reorder(param1,param2);
            if(_loc5_ != -1 && _loc5_ != _loc4_)
            {
               this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_ORDER_CHANGE,param1 as Asset));
               return true;
            }
         }
         return false;
      }
      
      public function bringForward(param1:Asset) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1)
         {
            _loc2_ = this._assetOrdering.getOrdering(param1);
            _loc3_ = this._assetOrdering.bringForward(param1);
            if(_loc3_ != -1 && _loc3_ != _loc2_)
            {
               this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_ORDER_CHANGE,param1 as Asset));
               return true;
            }
         }
         return false;
      }
      
      public function compareAssetOrdering(param1:Asset, param2:Asset) : int
      {
         var _loc3_:int = this.getAssetOrdering(param1);
         var _loc4_:int = this.getAssetOrdering(param2);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      public function getAssetOrdering(param1:Asset) : int
      {
         if(param1 is EffectAsset)
         {
            return this._effectOrdering.getOrdering(param1);
         }
         return this._assetOrdering.getOrdering(param1);
      }
      
      public function getOverallOrdering(param1:Asset) : int
      {
         if(param1 is EffectAsset)
         {
            return this._effectOrdering.getOrdering(param1) + this._assetOrdering.length + 1;
         }
         return this._assetOrdering.getOrdering(param1) + 1;
      }
      
      public function getOverallOrderingLength() : int
      {
         return this._effectOrdering.length + this._assetOrdering.length;
      }
      
      public function sendBackward(param1:Asset) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1)
         {
            _loc2_ = this._assetOrdering.getOrdering(param1);
            _loc3_ = this._assetOrdering.sendBackward(param1);
            if(_loc3_ != -1 && _loc3_ != _loc2_)
            {
               this.dispatchEvent(new SceneEvent(SceneEvent.ASSET_ORDER_CHANGE,param1 as Asset));
               return true;
            }
         }
         return false;
      }
      
      private function getFacingFromThemeXMLByThumbId(param1:XML, param2:String) : String
      {
         var charXML:XML = null;
         var themeXML:XML = param1;
         var thumbId:String = param2;
         try
         {
            charXML = themeXML.char.(@id == thumbId)[0];
            if(charXML != null)
            {
               return charXML.@facing;
            }
         }
         catch(e:Error)
         {
         }
         return AnimeConstants.FACING_UNKNOW;
      }
      
      private function putDataBySceneXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Theme = null;
         var _loc8_:BackgroundThumb = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:CharThumb = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc15_:PropThumb = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:PropThumb = null;
         var _loc20_:EffectThumb = null;
         var _loc21_:int = 0;
         var _loc22_:String = null;
         for each(_loc2_ in param1.children())
         {
            _loc3_ = _loc2_.name();
            _loc4_ = _loc3_ == Character.XML_NODE_NAME?_loc2_.action:_loc2_.file;
            _loc5_ = UtilXmlInfo.getThemeIdFromFileName(_loc4_);
            _loc6_ = UtilXmlInfo.getThumbIdFromFileName(_loc4_);
            _loc7_ = ThemeManager.instance.getTheme(_loc5_);
            if(_loc7_ != null)
            {
               switch(_loc3_)
               {
                  case Background.XML_NODE_NAME:
                     _loc8_ = _loc7_.getBackgroundThumbById(_loc6_);
                     this.console.putData(_loc8_.theme.id + ".bg." + _loc8_.id,ByteArray(_loc8_.imageData));
                     continue;
                  case Character.XML_NODE_NAME:
                     _loc9_ = UtilXmlInfo.getZipFileNameOfBehaviour(_loc2_.action,true);
                     _loc10_ = UtilXmlInfo.getThumbIdFromFileName(_loc9_);
                     _loc11_ = UtilXmlInfo.getCharIdFromFileName(_loc9_);
                     _loc12_ = _loc7_.getCharThumbById(_loc11_);
                     this.console.putData(_loc12_.theme.id + ".char." + _loc12_.id + "." + _loc10_,_loc12_.getActionById(_loc10_).imageData);
                     _loc21_ = 0;
                     while(_loc21_ < _loc12_.getLibraryNum())
                     {
                        _loc22_ = _loc12_.getLibraryIdByIndex(_loc21_);
                        this.console.putData(_loc22_,_loc12_.getLibraryById(_loc22_));
                        _loc21_++;
                     }
                     this.putDataBySceneXML(_loc2_);
                     continue;
                  case Prop.XML_NODE_NAME:
                  case Prop.XML_NODE_NAME_WEAR:
                     _loc13_ = UtilXmlInfo.getThumbIdFromFileName(_loc4_);
                     _loc14_ = _loc4_.split(".").length == 3?_loc13_:UtilXmlInfo.getCharIdFromFileName(_loc4_);
                     _loc15_ = _loc7_.getPropThumbById(_loc14_) as PropThumb;
                     if(_loc15_.getStateNum() == 0)
                     {
                        this.console.putData(_loc15_.theme.id + ".prop." + _loc15_.id,ByteArray(_loc15_.imageData));
                     }
                     else
                     {
                        this.console.putData(_loc15_.theme.id + ".prop." + _loc15_.id + "." + _loc15_.getStateById(_loc13_).id,ByteArray(_loc15_.getStateById(_loc13_).imageData));
                     }
                     continue;
                  case Prop.XML_NODE_NAME_HEAD:
                     _loc16_ = UtilXmlInfo.getZipFileNameOfProp(_loc4_);
                     _loc17_ = UtilXmlInfo.getThumbIdFromFileName(_loc16_);
                     _loc18_ = UtilXmlInfo.getCharIdFromFileName(_loc16_);
                     if(_loc17_.indexOf(".head.") != -1)
                     {
                        _loc18_ = UtilXmlInfo.getFacialThumbIdFromFileName(_loc17_);
                        _loc17_ = UtilXmlInfo.getFacialIdFromFileName(_loc17_);
                     }
                     else
                     {
                        _loc18_ = _loc17_;
                     }
                     _loc19_ = _loc7_.getPropThumbById(_loc18_) as PropThumb;
                     if(_loc19_.getStateNum() == 0)
                     {
                        this.console.putData(_loc19_.theme.id + ".prop." + _loc19_.id,_loc19_.imageData);
                     }
                     else
                     {
                        this.console.putData(_loc19_.theme.id + ".prop." + _loc19_.id + "." + _loc19_.getStateById(_loc17_).id,_loc19_.getStateById(_loc17_).imageData);
                     }
                     continue;
                  case EffectAsset.XML_NODE_NAME:
                     _loc20_ = _loc7_.getEffectThumbById(_loc6_);
                     this.console.putData(_loc20_.theme.id + ".effect." + _loc20_.id,ByteArray(_loc20_.imageData));
                     continue;
                  default:
                     continue;
               }
            }
            else
            {
               continue;
            }
         }
      }
      
      public function deSerialize(param1:XML, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Theme = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:XMLListCollection = null;
         var _loc11_:Sort = null;
         var _loc12_:XML = null;
         var _loc17_:Boolean = false;
         var _loc18_:int = 0;
         var _loc19_:XMLList = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         if(param1.hasOwnProperty("@combgId"))
         {
            this.combgId = param1.@combgId;
         }
         if(param1.hasOwnProperty("@color"))
         {
            this.baseColor = param1.@color;
         }
         else
         {
            this.baseColor = 16777215;
         }
         if(!this._guid && param1.hasOwnProperty("@guid"))
         {
            this._guid = param1.@guid;
         }
         var _loc13_:XMLList = param1.child(XML_NODE_CHAPTER_BREAK);
         if(_loc13_.length() > 0)
         {
            this.chapterBreak = true;
         }
         else
         {
            this.chapterBreak = false;
         }
         if(param2)
         {
            this._cloneableAssetsInfo = new UtilHashArray();
            this.deleteAllAssets();
            this.removeAllAssets();
         }
         else
         {
            _loc10_ = new XMLListCollection(param1.children());
            _loc11_ = new Sort();
            _loc11_.fields = [new SortField("@index",true,false,true)];
            _loc10_.sort = _loc11_;
            _loc10_.refresh();
            param1.setChildren(_loc10_.copy());
            _loc17_ = true;
            _loc12_ = param1.child("bg")[0];
            if(_loc12_)
            {
               _loc12_.@newIndex = 0;
            }
            else
            {
               _loc17_ = false;
            }
            _loc18_ = !!_loc17_?1:0;
            _loc19_ = param1.children();
            _loc20_ = _loc19_.length();
            _loc21_ = _loc20_ - 1;
            while(_loc21_ >= 0)
            {
               _loc12_ = _loc19_[_loc21_];
               _loc12_.@newIndex = _loc18_;
               _loc18_++;
               _loc21_--;
            }
         }
         var _loc14_:UtilLoadMgr = new UtilLoadMgr();
         var _loc15_:Object = new Object();
         _loc15_["unloadAfterFinish"] = param4;
         _loc15_["doLoadBytes"] = param3;
         _loc14_.setExtraData(_loc15_);
         _loc14_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onDeserializeAndAddComplete);
         _loc10_ = new XMLListCollection(param1.children());
         _loc11_ = new Sort();
         _loc11_.fields = [new SortField(!!param2?"@index":"@newIndex",true,false,true)];
         _loc10_.sort = _loc11_;
         _loc10_.refresh();
         param1.setChildren(_loc10_.copy());
         var _loc16_:int = 0;
         while(_loc16_ < param1.children().length())
         {
            _loc12_ = param1.children()[_loc16_];
            this.deserializeAsset(_loc12_,param2,true,param3,_loc14_);
            _loc16_++;
         }
         _loc14_.commit();
         this.deserializeSceneTransition(param1);
         this.deserializeAssetTransition(param1);
         if(param2)
         {
            this.deserializeSceneLength(param1,true);
         }
      }
      
      public function deserializeSceneLength(param1:XML, param2:Boolean = false) : void
      {
         var _loc3_:XML = null;
         if(param1.hasOwnProperty("@adelay"))
         {
            this._totalFrames = int(param1.@adelay);
         }
         if(param1.hasOwnProperty("@lock"))
         {
            if(param1.@lock == "Y")
            {
               this._durationMode = AnimeScene.DURATION_MODE_CUSTOM;
               this._countMinimumDuration = false;
               this._countTransitionDuration = false;
               this._countActionDuration = false;
               this._countBubbleDuration = false;
               this._countSpeechDuration = false;
               this._customTotalFrames = this._totalFrames;
            }
            else if(param1.@lock == "S")
            {
               this._durationMode = AnimeScene.DURATION_MODE_AUTO;
               this._countMinimumDuration = false;
               this._countTransitionDuration = false;
               this._countActionDuration = false;
               this._countBubbleDuration = false;
               this._countSpeechDuration = true;
               this._customTotalFrames = this._totalFrames;
            }
            else
            {
               this._durationMode = AnimeScene.DURATION_MODE_AUTO;
               this._countMinimumDuration = true;
               this._countTransitionDuration = true;
               this._countActionDuration = true;
               this._countBubbleDuration = true;
               this._countSpeechDuration = true;
               if(param1.hasOwnProperty("durationSetting"))
               {
                  _loc3_ = param1.durationSetting[0];
                  this._countMinimumDuration = String(_loc3_.@countMinimum) == "1";
                  this._countTransitionDuration = String(_loc3_.@countTransition) == "1";
                  this._countActionDuration = String(_loc3_.@countAction) == "1";
                  this._countBubbleDuration = String(_loc3_.@countBubble) == "1";
                  this._countSpeechDuration = String(_loc3_.@countSpeech) == "1";
               }
               this._customTotalFrames = AnimeConstants.SCENE_FRAME_DEFAULT;
            }
         }
         this.dispatchEvent(new SceneEvent(SceneEvent.DURATION_CHANGE));
      }
      
      public function deserializeSceneTransition(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:GoTransition = null;
         if(param1.hasOwnProperty(GoTransition.XML_NODE_NAME))
         {
            _loc2_ = param1.child(GoTransition.XML_NODE_NAME)[0];
            _loc3_ = new GoTransition();
            _loc3_.deserialize(_loc2_);
            _loc3_.scene = this;
            if(this._transition)
            {
               this._transition.removeEventListener(Event.CHANGE,this.onTransitionChange);
               this.removeCloneableAssetInfo(this._transition.id);
            }
            this._transition = _loc3_;
            if(this._transition)
            {
               this.addCloneableAssetInfo(this._transition.id,"transition");
               this._transition.addEventListener(Event.CHANGE,this.onTransitionChange);
            }
         }
      }
      
      private function deserializeAssetTransition(param1:XML) : void
      {
         if(param1.hasOwnProperty(AssetTransitionConstants.TAG_NAME_TRANSITION_LIST))
         {
            this._assetTransitions.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this.onAssetTransitionChange);
            this._assetTransitions.removeEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onAssetTransitionChange);
            this._assetTransitions.convertFromXml(param1.child(AssetTransitionConstants.TAG_NAME_TRANSITION_LIST)[0]);
            AssetTransitionHelper.validateTransitions(this._assetTransitions,this);
            this.updateCharactersTransitions();
            this._assetTransitions.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onAssetTransitionChange);
            this._assetTransitions.addEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onAssetTransitionChange);
            this._totalFrameOfTransitionBeforeNarration = AssetTransitionHelper.getTotalFrameOfTransitionBeforeNarration(this._assetTransitions);
         }
      }
      
      private function updateCharactersTransitions() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Character = null;
         if(this._characters)
         {
            _loc1_ = this._characters.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this._characters.getValueByIndex(_loc2_) as Character;
               if(_loc3_)
               {
                  _loc3_.updateTransitionsCharacterActionName();
               }
               _loc2_++;
            }
         }
      }
      
      private function onDeserializeAndAddComplete(param1:LoadMgrEvent) : void
      {
         var _loc2_:Object = UtilLoadMgr(param1.currentTarget).getExtraData();
         var _loc3_:Boolean = _loc2_["unloadAfterFinish"];
         var _loc4_:Boolean = _loc2_["doLoadBytes"];
         setTimeout(this.dispatchDeserializeComplete,300,_loc3_,_loc4_);
      }
      
      public function dispatchDeserializeComplete(param1:Boolean, param2:Boolean) : void
      {
         if(param1)
         {
            this.unloadAllAssets(false);
         }
         else
         {
            this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ALL_ASSETS_COMPLETE,this));
         }
         this.dispatchEvent(new CoreEvent(CoreEvent.DESERIALIZE_SCENE_COMPLETE,this));
         if(Console.getConsole().isLoadingThemeStarter())
         {
            Console.getConsole().renderThemeStarterTimelineThumbnail();
         }
         var _loc3_:TutorialManager = TutorialManager.instance;
         if(_loc3_.currentTutorial)
         {
            _loc3_.notifyTutorialAction("add_com_bg");
         }
      }
      
      public function isAssetAlreadyExist(param1:XML) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Character = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Prop = null;
         var _loc2_:String = param1.name();
         if(_loc2_ == Character.XML_NODE_NAME)
         {
            _loc3_ = 0;
            while(_loc3_ < this._characters.length)
            {
               _loc4_ = Character(this._characters.getValueByIndex(_loc3_));
               if(param1.children() == XML(_loc4_.serialize()).children())
               {
                  return true;
               }
               _loc3_++;
            }
         }
         else if(_loc2_ == BubbleAsset.XML_NODE_NAME)
         {
            _loc5_ = 0;
            while(_loc5_ < this._bubbles.length)
            {
               if(param1.children() == XML(BubbleAsset(this._bubbles.getValueByIndex(_loc5_)).serialize()).children())
               {
                  return true;
               }
               _loc5_++;
            }
         }
         else if(_loc2_ == Prop.XML_NODE_NAME)
         {
            _loc6_ = 0;
            while(_loc6_ < this._props.length)
            {
               _loc7_ = Prop(this._props.getValueByIndex(_loc6_));
               if(param1.children() == XML(_loc7_.serialize()).children())
               {
                  return true;
               }
               _loc6_++;
            }
         }
         return false;
      }
      
      private function checkLinkWithComBg(param1:Asset) : void
      {
         var combgThemeId:String = null;
         var combgId:String = null;
         var bgThumb:BackgroundThumb = null;
         var xmlList:XMLList = null;
         var fxId:String = null;
         var asset:Asset = param1;
         try
         {
            if(this.combgId && this.combgId != "")
            {
               combgThemeId = this.combgId.split(".")[0];
               combgId = this.combgId.split(".")[1];
               bgThumb = ThemeManager.instance.getTheme(combgThemeId).getBackgroundThumbById(combgId);
               if(asset is Prop)
               {
                  xmlList = bgThumb.xml.prop.(hasOwnProperty("file") && file == Prop(asset).fileId);
               }
               else if(asset is BubbleAsset)
               {
                  xmlList = bgThumb.xml.bubbleAsset.bubble.(text == BubbleAsset(asset).text);
               }
               else if(asset is EffectAsset)
               {
                  fxId = bgThumb.xml.effectAsset.effect.@id;
                  if(fxId == EffectAsset(asset).effect.id)
                  {
                     asset.attachedBg = true;
                  }
               }
               if(xmlList && xmlList.length() > 0)
               {
                  asset.attachedBg = true;
               }
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AnimeScene:checkLinkWithBg",e);
            return;
         }
      }
      
      public function deserializeAsset(param1:XML, param2:Boolean = true, param3:Boolean = true, param4:Boolean = true, param5:UtilLoadMgr = null) : Asset
      {
         var _loc8_:Asset = null;
         var _loc9_:Widget = null;
         var _loc11_:Background = null;
         var _loc12_:BubbleAsset = null;
         var _loc13_:Prop = null;
         var _loc14_:PropThumb = null;
         var _loc15_:FlowFrame = null;
         var _loc16_:FlowFrameThumb = null;
         var _loc17_:EffectAsset = null;
         var _loc18_:String = null;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:String = null;
         var _loc22_:Theme = null;
         var _loc23_:CharThumb = null;
         var _loc24_:Character = null;
         var _loc25_:Array = null;
         var _loc26_:Array = null;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Array = null;
         var _loc30_:Number = NaN;
         var _loc31_:Array = null;
         var _loc32_:Array = null;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Array = null;
         var _loc36_:Number = NaN;
         var _loc37_:MotionData = null;
         var _loc38_:Object = null;
         var _loc39_:int = 0;
         var _loc40_:int = 0;
         var _loc41_:XML = null;
         var _loc42_:Character = null;
         var _loc43_:Boolean = false;
         var _loc44_:UtilLoadMgr = null;
         var _loc45_:Object = null;
         var _loc46_:Action = null;
         var _loc47_:CCCharacterActionModel = null;
         var _loc6_:String = param1.name();
         var _loc7_:Boolean = false;
         var _loc10_:Console = Console.getConsole();
         switch(_loc6_)
         {
            case Background.XML_NODE_NAME:
               _loc11_ = new Background(param1.@id);
               if(param5)
               {
                  param5.addEventDispatcher(_loc11_,CoreEvent.LOAD_ASSET_COMPLETE);
               }
               _loc11_.deSerialize(param1,this,param4);
               if(!param2)
               {
                  _loc11_.fromTray = true;
               }
               if(_loc11_.thumb && _loc11_.baseVisible)
               {
                  this.addAsset(_loc11_,false,_loc11_.customColor);
               }
               else
               {
                  _loc11_.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,_loc11_));
               }
               _loc8_ = _loc11_;
               break;
            case Character.XML_NODE_NAME:
               if(_loc10_.isLoadingThemeStarter())
               {
                  _loc18_ = Character.getActionFileNameFromXML(param1);
                  _loc19_ = UtilXmlInfo.getThumbIdFromFileName(_loc18_);
                  _loc20_ = UtilXmlInfo.getCharIdFromFileName(_loc18_);
                  _loc21_ = UtilXmlInfo.getThemeIdFromFileName(_loc18_);
                  _loc22_ = _loc21_ == ThemeManager.UGC_THEME_ID?ThemeManager.instance.ccTheme:ThemeManager.instance.getTheme(_loc21_);
                  if(!_loc22_)
                  {
                     _loc10_.errorLoadingThemeStarter = true;
                     return null;
                  }
                  _loc23_ = new CharThumb();
                  _loc23_.deSerializeForThemeStarter(param1,_loc22_,_loc20_,_loc19_);
                  _loc24_ = new Character(param1.@starter_char_id);
                  this.addCharacterPlaceHolder(_loc24_);
                  if(param5)
                  {
                     param5.addEventDispatcher(_loc23_,CoreEvent.LOAD_ASSET_COMPLETE);
                  }
                  _loc25_ = param1.x.toString().split(",");
                  _loc26_ = param1.y.toString().split(",");
                  _loc27_ = parseInt(_loc25_[0]);
                  _loc28_ = parseInt(_loc26_[0]);
                  _loc29_ = param1.rotation.toString().split(",");
                  _loc30_ = parseFloat(_loc29_[0]);
                  _loc31_ = param1.xscale.toString().split(",");
                  _loc32_ = param1.yscale.toString().split(",");
                  _loc33_ = parseFloat(_loc31_[0]);
                  _loc34_ = parseFloat(_loc32_[0]);
                  _loc35_ = String(param1.action.@face).split(",");
                  _loc36_ = Number(param1.action.@motionface);
                  _loc38_ = new Object();
                  _loc38_[Character.KEY_SCALE_X] = _loc33_;
                  _loc38_[Character.KEY_SCALE_Y] = _loc34_;
                  _loc38_[Character.KEY_ROTATION] = _loc30_;
                  _loc38_[Character.KEY_FACING] = parseInt(_loc35_[0]);
                  _loc38_[Character.KEY_PLACEHOLDER] = _loc24_;
                  if(_loc25_.length > 1 && _loc26_.length > 1 && _loc31_.length > 1 && _loc32_.length > 1 && _loc29_.length > 1)
                  {
                     _loc37_ = new MotionData();
                     _loc37_.moveStartPoint(_loc27_,_loc28_);
                     _loc37_.moveEndPoint(parseInt(_loc25_[_loc25_.length - 1]),parseInt(_loc26_[_loc26_.length - 1]));
                     _loc37_.startRotation = _loc30_;
                     _loc37_.endRotation = parseFloat(_loc29_[_loc29_.length - 1]);
                     _loc37_.motionFace = _loc36_;
                     _loc38_[Character.KEY_END_SCALE_X] = _loc31_[_loc31_.length - 1];
                     _loc38_[Character.KEY_END_SCALE_Y] = _loc32_[_loc32_.length - 1];
                  }
                  if(_loc37_)
                  {
                     _loc38_[Character.KEY_MOTION_DATA] = _loc37_;
                  }
                  _loc39_ = param1.head.length();
                  _loc40_ = 0;
                  if(_loc40_ < _loc39_)
                  {
                     _loc41_ = param1.head[_loc40_];
                     _loc38_[Character.KEY_HEAD] = _loc41_;
                  }
                  _loc8_ = this.createAsset(_loc23_,_loc27_,_loc28_,"",false,false,_loc38_);
               }
               else
               {
                  _loc42_ = new Character(!!param3?param1.@id:"");
                  _loc43_ = this.isAssetAlreadyExist(param1);
                  if(param5 != null)
                  {
                     param5.addEventDispatcher(_loc42_,CoreEvent.LOAD_ASSET_COMPLETE);
                  }
                  _loc42_.deSerialize(param1,this,param4);
                  if(_loc43_ && _loc42_.actionSequence)
                  {
                     _loc42_.actionSequence.randomize();
                  }
                  if(_loc42_.thumb != null)
                  {
                     if(_loc42_.imageData)
                     {
                        this.addAsset(_loc42_);
                     }
                     else if(CharThumb(_loc42_.thumb).ccThemeId == "")
                     {
                        _loc42_.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,_loc42_));
                     }
                     else
                     {
                        _loc44_ = new UtilLoadMgr();
                        _loc45_ = new Object();
                        _loc45_["nodeXML"] = param1;
                        _loc45_["char"] = _loc42_;
                        _loc45_["doLoadBytes"] = param4;
                        _loc44_.setExtraData(_loc45_);
                        _loc44_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onLoadActionComplete);
                        _loc46_ = CharThumb(_loc42_.thumb).getActionById(_loc42_.actionId);
                        _loc47_ = CCThemeManager.instance.getThemeModel(CharThumb(_loc42_.thumb).ccThemeId).getCharacterActionModel(CharThumb(_loc42_.thumb).ccBodyModel,_loc42_.actionId);
                        _loc44_.addEventDispatcher(_loc46_,CoreEvent.LOAD_STATE_COMPLETE);
                        _loc46_.loadImageDataByCam(_loc47_);
                        _loc44_.commit();
                        this.addAsset(_loc42_);
                     }
                  }
                  _loc8_ = _loc42_;
               }
               break;
            case BubbleAsset.XML_NODE_NAME:
               _loc12_ = new BubbleAsset(!!param3?param1.@id:"");
               _loc12_.deSerialize(param1,this);
               if(_loc10_.isLoadingThemeStarter() && _loc12_.thumb.themeId == ThemeConstants.UGC_THEME_ID)
               {
                  _loc10_.errorLoadingThemeStarter = true;
                  return null;
               }
               if(!param2)
               {
                  _loc12_.attachedBg = true;
                  _loc7_ = true;
               }
               this.checkLinkWithComBg(_loc12_);
               this.addAsset(_loc12_,_loc7_);
               _loc8_ = _loc12_;
               break;
            case Widget.XML_NODE_NAME:
               _loc9_ = new Widget(!!param3?param1.@id:"");
               if(param5)
               {
                  param5.addEventDispatcher(_loc9_,CoreEvent.LOAD_ASSET_COMPLETE);
               }
               _loc9_.deSerialize(param1,null,this,param3,param4);
               if(!param2)
               {
                  _loc9_.attachedBg = true;
                  _loc7_ = true;
               }
               this.addAsset(_loc9_,_loc7_);
               _loc8_ = _loc9_;
               break;
            case Prop.XML_NODE_NAME:
               if(param1.@subtype == AnimeConstants.ASSET_TYPE_PROP_VIDEO)
               {
                  _loc13_ = new VideoProp();
               }
               else
               {
                  _loc13_ = new Prop(!!param3?param1.@id:"");
               }
               if(param5 && !(_loc13_ is VideoProp))
               {
                  param5.addEventDispatcher(_loc13_,CoreEvent.LOAD_ASSET_COMPLETE);
               }
               _loc13_.deSerialize(param1,null,this,param3,param4);
               if(!param2)
               {
                  _loc13_.attachedBg = true;
                  _loc7_ = true;
               }
               this.checkLinkWithComBg(_loc13_);
               _loc14_ = _loc13_.thumb as PropThumb;
               if(_loc14_)
               {
                  this.addAsset(_loc13_,_loc7_);
                  if(_loc13_.state)
                  {
                     if(!_loc13_.state.loading && !_loc13_.state.imageData)
                     {
                        param5.addEventDispatcher(_loc14_,CoreEvent.LOAD_STATE_COMPLETE);
                        _loc14_.loadState(_loc13_.state);
                     }
                     _loc13_.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,_loc13_));
                  }
               }
               else
               {
                  _loc13_.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,_loc13_));
               }
               _loc8_ = _loc13_;
               break;
            case FlowFrame.XML_NODE_NAME:
               _loc15_ = new FlowFrame(!!param3?String(param1.@id):"");
               if(param5)
               {
                  param5.addEventDispatcher(_loc15_,CoreEvent.LOAD_ASSET_COMPLETE);
               }
               _loc15_.deSerialize(param1,null,this,param3,param4);
               if(!param2)
               {
                  _loc15_.attachedBg = true;
                  _loc7_ = true;
               }
               this.checkLinkWithComBg(_loc15_);
               _loc16_ = _loc15_.thumb as FlowFrameThumb;
               if(_loc16_)
               {
                  this.addAsset(_loc15_,_loc7_);
               }
               else
               {
                  _loc15_.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,_loc15_));
               }
               _loc8_ = _loc15_;
               break;
            case EffectAsset.XML_NODE_NAME:
               if(EffectAsset.getEffectType(param1) == EffectMgr.TYPE_ANIME)
               {
                  _loc17_ = new AnimeEffectAsset(!!param3?param1.@id:null);
               }
               else
               {
                  _loc17_ = new ProgramEffectAsset(!!param3?param1.@id:null);
               }
               _loc17_.deSerialize(param1,this,true);
               if(!param2)
               {
                  _loc17_.attachedBg = true;
               }
               this.checkLinkWithComBg(_loc17_);
               this.addAsset(_loc17_);
               _loc8_ = _loc17_;
         }
         return _loc8_;
      }
      
      private function onLoadActionComplete(param1:LoadMgrEvent) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         _loc2_.removeEventListener(LoadMgrEvent.ALL_COMPLETE,this.onLoadActionComplete);
         var _loc3_:Object = _loc2_.getExtraData();
         var _loc4_:Character = _loc3_["char"] as Character;
         _loc4_.removeAction();
         _loc4_.deSerialize(_loc3_["nodeXML"],this,_loc3_["doLoadBytes"]);
         if(_loc4_.shadow)
         {
            Character(_loc4_.shadow).removeAction();
            Character(_loc4_.shadow).action = CharThumb(_loc4_.thumb).getActionById(_loc4_.actionId);
         }
      }
      
      public function convertToXml() : XML
      {
         var xml:XML = null;
         var index:int = 0;
         var lock:String = null;
         var roundedTotalFrames:Number = NaN;
         var combgString:String = null;
         var i:int = 0;
         var asset:IXmlConvertable = null;
         var bgThemeId:String = null;
         var bgId:String = null;
         var durationXml:XML = null;
         var chapterBreakXml:XML = null;
         xml = <scene/>;
         try
         {
            index = Console.getConsole().getSceneIndex(this);
            if(this.sceneXML)
            {
               this.sceneXML.@index = index;
               return this.sceneXML;
            }
            lock = "N";
            if(this.durationMode == AnimeScene.DURATION_MODE_CUSTOM)
            {
               lock = "Y";
            }
            xml.@id = this._id;
            roundedTotalFrames = Util.roundNum(this._totalFrames);
            xml.@adelay = roundedTotalFrames;
            xml.@lock = lock;
            xml.@index = index;
            xml.@color = this._baseColor;
            if(this._guid)
            {
               xml.@guid = this._guid;
            }
            combgString = this.combgId != ""?" combgId=\"" + this.combgId + "\" ":"";
            if(this.combgId != "")
            {
               bgThemeId = this.combgId.split(".")[0];
               bgId = this.combgId.split(".")[1];
               try
               {
                  if(ThemeManager.instance.getTheme(bgThemeId).getBackgroundThumbById(bgId).getFileName() != this._background.thumb.themeId + "." + this._background.thumb.id)
                  {
                     combgString = "";
                  }
               }
               catch(e:Error)
               {
                  combgString = "";
                  UtilErrorLogger.getInstance().appendCustomError("AnimeScene:convertToXML",e);
               }
            }
            if(combgString != "")
            {
               xml.@combgId = this.combgId;
            }
            if(this.durationMode == AnimeScene.DURATION_MODE_AUTO)
            {
               durationXml = <durationSetting></durationSetting>;
               durationXml.@countMinimum = !!this.countMinimumDuration?"1":"0";
               durationXml.@countTransition = !!this.countTransitionDuration?"1":"0";
               durationXml.@countAction = !!this.countActionDuration?"1":"0";
               durationXml.@countBubble = !!this.countBubbleDuration?"1":"0";
               durationXml.@countSpeech = !!this.countSpeechDuration?"1":"0";
               xml.appendChild(durationXml);
            }
            if(this._chapterBreak)
            {
               chapterBreakXml = new XML("<" + XML_NODE_CHAPTER_BREAK + "/>");
               chapterBreakXml.appendChild(roundedTotalFrames.toString());
               xml.appendChild(chapterBreakXml);
            }
            if(this._background)
            {
               xml.appendChild(this._background.convertToXml());
            }
            i = 0;
            i = 0;
            while(i < this._characters.length)
            {
               asset = this._characters.getValueByIndex(i) as IXmlConvertable;
               if(asset)
               {
                  xml.appendChild(asset.convertToXml());
               }
               i++;
            }
            i = 0;
            while(i < this._bubbles.length)
            {
               asset = this._bubbles.getValueByIndex(i) as IXmlConvertable;
               if(asset)
               {
                  xml.appendChild(asset.convertToXml());
               }
               i++;
            }
            i = 0;
            while(i < this._props.length)
            {
               asset = this._props.getValueByIndex(i) as IXmlConvertable;
               if(asset)
               {
                  xml.appendChild(asset.convertToXml());
               }
               i++;
            }
            i = 0;
            while(i < this._effects.length)
            {
               asset = this._effects.getValueByIndex(i) as IXmlConvertable;
               if(asset)
               {
                  xml.appendChild(asset.convertToXml());
               }
               i++;
            }
            if(this._transition)
            {
               xml.appendChild(this._transition.convertToXml());
            }
            xml.appendChild(this._assetTransitions.convertToXml());
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize scene, broken xml: " + xml.toXMLString() + e.message);
            UtilErrorLogger.getInstance().appendCustomError("AnimeScene:convertToXml",e);
         }
         return xml;
      }
      
      public function serialize(param1:int = -1, param2:Boolean = true) : String
      {
         var xmlStr:String = null;
         var index:int = param1;
         var stockdata:Boolean = param2;
         xmlStr = this.convertToXml().toXMLString();
         try
         {
            if(index < 0)
            {
               index = Console.getConsole().getSceneIndex(this);
            }
            if(this.sceneXML != null)
            {
               if(stockdata)
               {
                  this.putDataBySceneXML(this.sceneXML);
               }
               this.sceneXML.@index = index;
               return this.sceneXML.toString();
            }
            if(stockdata)
            {
               this.stockData();
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AnimeScene:serialize",e);
            throw new SerializeError("Failed to serialize scene " + this.id,xmlStr,e);
         }
         return xmlStr;
      }
      
      private function stockData() : void
      {
         var i:int = 0;
         var k:int = 0;
         var effectAsset:EffectAsset = null;
         var char:Character = null;
         var charData:UtilHashArray = null;
         var prop:Prop = null;
         var propData:UtilHashArray = null;
         try
         {
            if(this.console)
            {
               if(this._background && this._background.thumb && this._background.thumb.theme)
               {
                  this.console.putData(this._background.thumb.theme.id + ".bg." + this._background.thumb.id,this._background.thumb.imageData as ByteArray);
               }
               i = 0;
               k = 0;
               i = 0;
               while(i < this._characters.length)
               {
                  char = this._characters.getValueByIndex(i) as Character;
                  if(char)
                  {
                     charData = char.getDataAndKey();
                     if(charData)
                     {
                        k = 0;
                        while(k < charData.length)
                        {
                           this.console.putData(charData.getKey(k),charData.getValueByIndex(k));
                           k++;
                        }
                     }
                     if(CCBodyManager.instance.getBodyModel(char.thumb.id).completed)
                     {
                        this.console.putData(char.thumb.theme.id + ".char." + char.thumb.id + ".xml",CCBodyManager.instance.getBodyModel(char.thumb.id).source);
                     }
                  }
                  i++;
               }
               i = 0;
               while(i < this._props.length)
               {
                  prop = this._props.getValueByIndex(i) as Prop;
                  if(prop && prop.thumb && prop.thumb.theme)
                  {
                     if(PropThumb(prop.thumb).getStateNum() == 0)
                     {
                        this.console.putData(prop.thumb.theme.id + ".prop." + prop.thumb.id,prop.thumb.imageData as ByteArray);
                     }
                     else
                     {
                        propData = prop.getDataAndKey();
                        if(propData)
                        {
                           k = 0;
                           while(k < propData.length)
                           {
                              this.console.putData(propData.getKey(k),propData.getValueByIndex(k));
                              k++;
                           }
                        }
                     }
                  }
                  i++;
               }
               i = 0;
               while(i < this._effects.length)
               {
                  effectAsset = this._effects.getValueByIndex(i) as EffectAsset;
                  if(effectAsset && effectAsset.thumb && effectAsset.thumb.theme)
                  {
                     this.console.putData(effectAsset.thumb.theme.id + ".effect." + effectAsset.thumb.id,effectAsset.thumb.imageData as ByteArray);
                  }
                  i++;
               }
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AnimeScene:stockData",e);
            return;
         }
      }
      
      public function get selectedAsset() : Asset
      {
         return this.selection.selectedAsset as Asset;
      }
      
      public function set selectedAsset(param1:Asset) : void
      {
         this.selection.selectedAsset = param1;
      }
      
      public function refreshEffectTray() : void
      {
         if(this._console && this._console.effectTray)
         {
            this._console.effectTray.activeScene = this;
            this._console.tinyEffectTray.activeScene = this;
         }
      }
      
      public function showEffect(param1:EffectAsset) : void
      {
         this._console.mainStage.sceneEditor.view.showEffect(param1);
         param1.status = EffectAsset.STATUS_SHOW;
      }
      
      public function hideEffect(param1:EffectAsset) : void
      {
         this._console.mainStage.sceneEditor.view.hideEffect(param1);
         param1.status = EffectAsset.STATUS_HIDE;
      }
      
      public function deleteEffect(param1:EffectAsset) : void
      {
         var _loc2_:RemoveAssetCommand = new RemoveAssetCommand(param1);
         _loc2_.execute();
      }
      
      public function editEffect(param1:EffectAsset) : void
      {
         this.selectedAsset = param1;
         this._console.mainStage.sceneEditor.showControl();
      }
      
      public function applyColor(param1:uint) : void
      {
         if(this._background)
         {
            this.deleteBackground();
         }
         this.baseColor = param1;
      }
      
      public function cloneNext() : AnimeScene
      {
         var _loc2_:Asset = null;
         var _loc3_:Asset = null;
         var _loc4_:IIterator = null;
         var _loc1_:AnimeScene = new AnimeScene();
         _loc1_.console = this.console;
         _loc1_.baseColor = this.baseColor;
         if(this._background)
         {
            _loc2_ = this._background.cloneNext();
            _loc2_.scene = _loc1_;
            _loc1_.addAsset(_loc2_,false,_loc2_.customColor);
         }
         _loc4_ = this._assetOrdering.iterator();
         while(_loc4_.hasNext)
         {
            _loc2_ = _loc4_.next as Asset;
            if(_loc2_ && _loc2_.shouldBeCopyToNextScene)
            {
               if(!AssetTransitionHelper.isAlreadyOut(_loc2_.id,this._assetTransitions))
               {
                  _loc3_ = _loc2_.cloneNext();
                  _loc3_.scene = _loc1_;
                  _loc1_.addAsset(_loc3_);
               }
            }
         }
         _loc4_ = this._effectOrdering.iterator();
         while(_loc4_.hasNext)
         {
            _loc2_ = _loc4_.next as Asset;
            if(_loc2_ && _loc2_.shouldBeCopyToNextScene)
            {
               _loc3_ = _loc2_.cloneNext();
               _loc3_.scene = _loc1_;
               _loc1_.addAsset(_loc3_);
            }
         }
         if(this._sceneZoomEffect)
         {
            _loc3_ = this._sceneZoomEffect.cloneNext();
            _loc3_.scene = _loc1_;
            _loc1_.addAsset(_loc3_);
         }
         return _loc1_;
      }
      
      public function clone() : AnimeScene
      {
         var _loc2_:Asset = null;
         var _loc3_:Asset = null;
         var _loc4_:IIterator = null;
         var _loc1_:AnimeScene = new AnimeScene();
         _loc1_.console = this.console;
         _loc1_.combgId = this.combgId;
         _loc1_.baseColor = this.baseColor;
         _loc1_.guid = this.guid;
         if(this._background)
         {
            _loc2_ = this._background.clone(true);
            _loc2_.scene = _loc1_;
            _loc1_.addAsset(_loc2_);
         }
         _loc4_ = this._assetOrdering.iterator();
         while(_loc4_.hasNext)
         {
            _loc2_ = _loc4_.next as Asset;
            if(_loc2_)
            {
               _loc3_ = _loc2_.clone(true);
               _loc3_.scene = _loc1_;
               _loc1_.addAsset(_loc3_);
            }
         }
         _loc4_ = this._effectOrdering.iterator();
         while(_loc4_.hasNext)
         {
            _loc2_ = _loc4_.next as Asset;
            if(_loc2_)
            {
               _loc3_ = _loc2_.clone(true);
               _loc3_.scene = _loc1_;
               _loc1_.addAsset(_loc3_);
            }
         }
         if(this._sceneZoomEffect)
         {
            _loc3_ = this._sceneZoomEffect.clone(true);
            _loc3_.scene = _loc1_;
            _loc1_.addAsset(_loc3_);
         }
         if(this._textComponentData)
         {
            _loc1_._textComponentData = this._textComponentData.clone();
         }
         return _loc1_;
      }
      
      private function getAssetId(param1:Thumb) : AssetLocation
      {
         var _loc5_:int = 0;
         var _loc6_:UtilHashArray = null;
         var _loc7_:Asset = null;
         var _loc8_:UtilHashArray = null;
         var _loc9_:Asset = null;
         var _loc10_:UtilHashArray = null;
         var _loc11_:Prop = null;
         var _loc12_:UtilHashArray = null;
         var _loc13_:Prop = null;
         var _loc14_:UtilHashArray = null;
         var _loc15_:EffectAsset = null;
         var _loc2_:String = param1.id;
         var _loc3_:AnimeScene = Console.getConsole().movie.getPrevScene(this);
         var _loc4_:AnimeScene = Console.getConsole().movie.getNextScene(this);
         if(param1 is CharThumb)
         {
            if(_loc3_ != null)
            {
               _loc6_ = _loc3_.characters;
               _loc5_ = 0;
               while(_loc5_ < _loc6_.length)
               {
                  _loc7_ = _loc6_.getValueByIndex(_loc5_);
                  if(_loc2_ == _loc7_.thumb.id)
                  {
                     if(this.getAssetById(_loc7_.id) == null)
                     {
                        return new AssetLocation(_loc7_.id,_loc3_.id);
                     }
                  }
                  _loc5_++;
               }
            }
            if(_loc4_ != null)
            {
               _loc8_ = _loc4_.characters;
               _loc5_ = 0;
               while(_loc5_ < _loc8_.length)
               {
                  _loc9_ = _loc8_.getValueByIndex(_loc5_);
                  if(_loc2_ == _loc9_.thumb.id)
                  {
                     if(this.getAssetById(_loc9_.id) == null)
                     {
                        return new AssetLocation(_loc9_.id,_loc4_.id);
                     }
                  }
                  _loc5_++;
               }
            }
         }
         else if(param1 is PropThumb)
         {
            if(_loc3_ != null)
            {
               _loc10_ = _loc3_.props;
               _loc5_ = 0;
               while(_loc5_ < _loc10_.length)
               {
                  _loc11_ = _loc10_.getValueByIndex(_loc5_);
                  if(_loc2_ == _loc11_.thumb.id)
                  {
                     if(this.getAssetById(_loc11_.id) == null)
                     {
                        return new AssetLocation(_loc11_.id,_loc3_.id);
                     }
                  }
                  _loc5_++;
               }
            }
            if(_loc4_ != null)
            {
               _loc12_ = _loc4_.props;
               _loc5_ = 0;
               while(_loc5_ < _loc12_.length)
               {
                  _loc13_ = _loc12_.getValueByIndex(_loc5_);
                  if(_loc2_ == _loc13_.thumb.id)
                  {
                     if(this.getAssetById(_loc13_.id) == null)
                     {
                        return new AssetLocation(_loc13_.id,_loc4_.id);
                     }
                  }
                  _loc5_++;
               }
            }
         }
         else if(param1 is EffectThumb)
         {
            if(_loc3_ != null)
            {
               if(EffectThumb(param1).getExactType() == EffectThumb.TYPE_ZOOM && EffectAsset(this.getEffectAssetByType(EffectThumb.TYPE_ZOOM)) != null)
               {
                  EffectAsset(this.getEffectAssetByType(EffectThumb.TYPE_ZOOM)).deleteAsset();
               }
               _loc14_ = _loc3_.effects;
               _loc5_ = 0;
               while(_loc5_ < _loc14_.length)
               {
                  _loc15_ = _loc14_.getValueByIndex(_loc5_);
                  if(EffectThumb(param1).getExactType() == EffectThumb(_loc15_.thumb).getExactType())
                  {
                     if(this.getAssetById(_loc15_.id) == null)
                     {
                        return new AssetLocation(_loc15_.id,_loc3_.id);
                     }
                  }
                  _loc5_++;
               }
            }
         }
         return null;
      }
      
      public function pasteAssets(param1:Vector.<Asset>, param2:int, param3:Vector.<AssetTransition>) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Asset = null;
         var _loc6_:PasteAssetCollectionCommand = null;
         var _loc7_:Vector.<Asset> = null;
         if(param1 && param1.length > 0)
         {
            _loc4_ = 0;
            for each(_loc5_ in param1)
            {
               if(_loc5_ is Character)
               {
                  _loc4_++;
               }
            }
            if(this._characters.length + _loc4_ > FeatureManager.maxCharacterPerScene)
            {
               this.displayCharacterLimitPopUp();
               return;
            }
            _loc6_ = new PasteAssetCollectionCommand(param1,param2,param3);
            _loc6_.execute();
            _loc7_ = _loc6_.assets;
            this.selection.clearCollection();
            this.selection.addAssets(_loc7_);
         }
      }
      
      private function doCreateAssetAtSceneAgain(param1:LoadMgrEvent) : void
      {
         var loadMgr:UtilLoadMgr = null;
         var params:Array = null;
         var thumb:Thumb = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var colorSetId:String = null;
         var fromSpeech:Boolean = false;
         var fromCommand:Boolean = false;
         var additionalProps:Object = null;
         var asset:Asset = null;
         var command:ICommand = null;
         var event:LoadMgrEvent = param1;
         try
         {
            loadMgr = event.target as UtilLoadMgr;
            params = loadMgr.getExtraData() as Array;
            thumb = params[0] as Thumb;
            dx = params[1];
            dy = params[2];
            colorSetId = params[3];
            fromSpeech = params[4];
            fromCommand = params[5];
            additionalProps = params[6];
            asset = this.createAsset(thumb,dx,dy,colorSetId,fromSpeech,fromCommand,additionalProps);
            if(asset)
            {
               if(fromCommand)
               {
                  if(asset is Background)
                  {
                     command = new ChangeBackgroundCommand(asset as Background);
                  }
                  else if(!(thumb is SoundThumb))
                  {
                     command = new AddAssetCommand(asset);
                  }
                  if(command)
                  {
                     command.execute();
                  }
               }
               else
               {
                  this.addAsset(asset);
               }
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AnimeScene:doCreateAssetAtSceneAgain",e);
            return;
         }
      }
      
      private function onReplaceExistingVideoPopUpClose(param1:PopUpEvent) : void
      {
         if(param1.commit && this._videoPropToBeAdded)
         {
            this.deleteAllVideos();
            this.addAsset(this._videoPropToBeAdded);
         }
      }
      
      public function doCreateAsset(param1:Thumb, param2:Number = 0, param3:Number = 0, param4:String = "", param5:Boolean = false) : void
      {
         var myThumb:Thumb = null;
         var thumbType:String = null;
         var themeId:String = null;
         var tutorialManager:TutorialManager = null;
         var eventProperties:Object = null;
         var asset:Asset = null;
         var _propXML:Vector.<XML> = null;
         var command:ICommand = null;
         var thumb:Thumb = param1;
         var dx:Number = param2;
         var dy:Number = param3;
         var colorSetId:String = param4;
         var fromSpeech:Boolean = param5;
         if(thumb == null)
         {
            return;
         }
         try
         {
            myThumb = thumb;
            if(thumb is CharThumb)
            {
               if(this._characters.length >= FeatureManager.maxCharacterPerScene)
               {
                  this.displayCharacterLimitPopUp();
                  return;
               }
               if(thumb.path)
               {
                  _propXML = new Vector.<XML>();
                  if(CharThumb(thumb).propXML.length > 0)
                  {
                     _propXML = CharThumb(thumb).propXML.concat();
                  }
                  myThumb = Theme(thumb.theme).getCharThumbById(thumb.path);
                  CharThumb(myThumb).propXML = _propXML.concat();
                  CharThumb(myThumb).mThumbId = thumb.id;
               }
            }
            themeId = thumb.themeId;
            if(thumb is CharThumb)
            {
               thumbType = "character";
               if(themeId == ThemeConstants.UGC_THEME_ID)
               {
                  themeId = CharThumb(thumb).ccThemeId;
               }
            }
            else if(thumb is PropThumb)
            {
               thumbType = "prop";
               if(PropThumb(thumb).subType == WidgetThumb.XML_NODE_NAME)
               {
                  thumbType = "widget";
               }
               else if(thumb is VideoPropThumb)
               {
                  thumbType = "video";
               }
            }
            else if(thumb is BubbleThumb)
            {
               thumbType = "text";
            }
            else if(thumb is BackgroundThumb)
            {
               thumbType = "backdrop";
               if(BackgroundThumb(thumb).isStarter)
               {
                  thumbType = "starter";
               }
            }
            else if(thumb is SoundThumb)
            {
               thumbType = "audio";
            }
            tutorialManager = TutorialManager.instance;
            eventProperties = {
               "theme":themeId,
               "type":thumbType,
               "name":thumb.name,
               "ugc":(thumb.themeId == ThemeConstants.UGC_THEME_ID?"true":"false"),
               "asset_id":thumb.id,
               "asset_category":thumb.categoryName,
               "tutorial":(!!tutorialManager.currentTutorial?"yes":"no")
            };
            AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_ADD_ASSET_TO_STAGE,eventProperties);
            asset = this.createAsset(myThumb,dx,dy,colorSetId,fromSpeech,true);
            if(asset)
            {
               if(asset is Background)
               {
                  command = new ChangeBackgroundCommand(asset as Background);
               }
               else if(!(thumb is SoundThumb))
               {
                  command = new AddAssetCommand(asset);
               }
               if(command)
               {
                  command.execute();
               }
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AnimeScene:doCreateAsset",e);
            return;
         }
      }
      
      private function displayCharacterLimitPopUp() : void
      {
         var _loc1_:String = UtilDict.toDisplay("go","At this time, each scene may only have a maximum of {0} characters.");
         _loc1_ = StringUtil.substitute(_loc1_,FeatureManager.maxCharacterPerScene);
         AlertPopUp.openDefaultPopUp(_loc1_);
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         var _loc2_:Array = null;
         if(param1 == "bg")
         {
            return new ArrayIterator([this._background]);
         }
         if(param1 == "asset")
         {
            _loc2_ = this._characters.getArray();
            if(_loc2_)
            {
               _loc2_ = _loc2_.concat(this._props.getArray());
            }
            if(_loc2_)
            {
               _loc2_ = _loc2_.concat(this._bubbles.getArray());
            }
            return new ArrayIterator(_loc2_);
         }
         if(param1 == "effect")
         {
            return new ArrayIterator(this._effects.getArray());
         }
         return new NullIterator();
      }
      
      public function createAsset(param1:Thumb, param2:Number = 0, param3:Number = 0, param4:String = "", param5:Boolean = false, param6:Boolean = false, param7:Object = null) : Asset
      {
         var asset:Asset = null;
         var loadMgr:UtilLoadMgr = null;
         var params:Array = null;
         var charThumb:CharThumb = null;
         var oldInstanceLocation:AssetLocation = null;
         var oldInstanceId:String = null;
         var char:Character = null;
         var bodyModel:CCBodyModel = null;
         var motionData:MotionData = null;
         var bgThumb:BackgroundThumb = null;
         var bubbleThumb:BubbleThumb = null;
         var sThumb:SoundThumb = null;
         var targetScene:AnimeScene = null;
         var widgetThumb:WidgetThumb = null;
         var propThumb:PropThumb = null;
         var oldPropLocation:AssetLocation = null;
         var oldPropId:String = null;
         var EffThumb:EffectThumb = null;
         var oldEffectLocation:AssetLocation = null;
         var oldEffectId:String = null;
         var thumb:Thumb = param1;
         var dx:Number = param2;
         var dy:Number = param3;
         var colorSetId:String = param4;
         var fromSpeech:Boolean = param5;
         var fromCommand:Boolean = param6;
         var additionalParams:Object = param7;
         if(thumb == null)
         {
            return null;
         }
         try
         {
            if(Console.getConsole().initCreation == true)
            {
               Console.getConsole().initCreation = false;
            }
            if(dy >= 0)
            {
               if(thumb is CharThumb)
               {
                  charThumb = thumb as CharThumb;
                  if(!charThumb.isThumbReady())
                  {
                     loadMgr = new UtilLoadMgr();
                     params = new Array();
                     params.push(thumb);
                     params.push(dx);
                     params.push(dy);
                     params.push(colorSetId);
                     params.push(fromSpeech);
                     params.push(fromCommand);
                     params.push(additionalParams);
                     loadMgr.setExtraData(params);
                     loadMgr.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.doCreateAssetAtSceneAgain);
                     if(charThumb.theme.id == ThemeManager.UGC_THEME_ID && CharThumb(thumb).isSWFCharacter())
                     {
                        loadMgr.addEventDispatcher(charThumb,CoreEvent.LOAD_THUMB_COMPLETE);
                        charThumb.loadActionsAndMotions();
                     }
                     else
                     {
                        loadMgr.addEventDispatcher(charThumb,CoreEvent.LOAD_STATE_COMPLETE);
                        charThumb.loadAction();
                     }
                     loadMgr.commit();
                  }
                  else
                  {
                     oldInstanceLocation = this.getAssetId(thumb);
                     if(oldInstanceLocation != null)
                     {
                        oldInstanceId = oldInstanceLocation.assetId;
                     }
                     else
                     {
                        oldInstanceId = "";
                     }
                     if(additionalParams)
                     {
                        char = additionalParams[Character.KEY_PLACEHOLDER];
                     }
                     if(!char)
                     {
                        char = new Character(oldInstanceId);
                     }
                     char.applyThumbFromThemeStarter(charThumb);
                     char.setReferencePoint(dx,dy);
                     char.move(dx,dy);
                     char.facing = charThumb.facing;
                     char.fromTray = true;
                     if(charThumb.mThumbId)
                     {
                        char.mThumbId = charThumb.mThumbId;
                     }
                     if(additionalParams)
                     {
                        char.scaleX = additionalParams[Character.KEY_SCALE_X];
                        char.scaleY = additionalParams[Character.KEY_SCALE_Y];
                        char.rotation = additionalParams[Character.KEY_ROTATION];
                        char.facing = additionalParams[Character.KEY_FACING] == 1?AnimeConstants.FACING_LEFT:AnimeConstants.FACING_RIGHT;
                        motionData = additionalParams[Character.KEY_MOTION_DATA];
                        if(motionData)
                        {
                           motionData.assetFace = additionalParams[Character.KEY_FACING];
                           char.motionData = motionData;
                           char.motionShadow.scaleX = additionalParams[Character.KEY_END_SCALE_X];
                           char.motionShadow.scaleY = additionalParams[Character.KEY_END_SCALE_Y];
                        }
                        char.deserializeHeadFromStarter(additionalParams[Character.KEY_HEAD]);
                     }
                     if(Console.getConsole().isLoadingThemeStarter())
                     {
                        char.thumb.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,char.thumb));
                     }
                     bodyModel = CCBodyManager.instance.getBodyModel(thumb.id);
                     if(bodyModel)
                     {
                        if(!Console.getConsole().validateThemeStarterAssetId(bodyModel.themeId))
                        {
                           return null;
                        }
                     }
                     asset = char;
                  }
               }
               else if(thumb is BackgroundThumb)
               {
                  bgThumb = thumb as BackgroundThumb;
                  if(!bgThumb.isThumbReady())
                  {
                     loadMgr = new UtilLoadMgr();
                     params = new Array();
                     params.push(thumb);
                     params.push(dx);
                     params.push(dy);
                     params.push(colorSetId);
                     params.push(fromCommand);
                     loadMgr.setExtraData(params);
                     loadMgr.addEventDispatcher(bgThumb,CoreEvent.LOAD_THUMB_COMPLETE);
                     loadMgr.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.doCreateAssetAtSceneAgain);
                     loadMgr.commit();
                     bgThumb.loadImageData();
                  }
                  else
                  {
                     asset = new Background();
                     asset.x = AnimeConstants.SCREEN_X;
                     asset.y = AnimeConstants.SCREEN_Y;
                     asset.width = AnimeConstants.SCREEN_WIDTH;
                     asset.height = AnimeConstants.SCREEN_HEIGHT;
                     asset.imageData = bgThumb.imageData;
                     Background(asset).fromTray = true;
                     Background(asset).isComposite = bgThumb.isComposite;
                  }
               }
               else if(thumb is BubbleThumb)
               {
                  asset = new BubbleAsset();
                  asset.setReferencePoint(dx,dy);
                  asset.move(dx,dy);
                  BubbleAsset(asset).fromTray = true;
                  BubbleAsset(asset).componentRole = (thumb as BubbleThumb).componentRole;
                  bubbleThumb = thumb as BubbleThumb;
                  asset.type = bubbleThumb.type;
               }
               else if(thumb is SoundThumb)
               {
                  sThumb = thumb as SoundThumb;
                  targetScene = this;
                  if(!sThumb.isLoading)
                  {
                     if(sThumb.isVoice)
                     {
                        Console.getConsole().addSpeechAtScene(sThumb,targetScene,null,false);
                     }
                     else
                     {
                        Console.getConsole().addSoundThumbAtScene(sThumb,targetScene);
                     }
                  }
               }
               else if(thumb is WidgetThumb)
               {
                  widgetThumb = thumb as WidgetThumb;
                  asset = new Widget("",widgetThumb.chartType);
                  asset.setReferencePoint(dx,dy);
                  asset.move(dx,dy);
                  asset.scene = this;
                  asset.thumb = thumb;
               }
               else if(thumb is FlowFrameThumb)
               {
                  asset = new FlowFrame();
                  asset.setReferencePoint(dx,dy);
                  asset.move(dx,dy);
                  asset.scene = this;
                  asset.thumb = thumb;
               }
               else if(thumb is PropThumb)
               {
                  propThumb = thumb as PropThumb;
                  if(!propThumb.isThumbReady())
                  {
                     loadMgr = new UtilLoadMgr();
                     params = new Array();
                     params.push(thumb);
                     params.push(dx);
                     params.push(dy);
                     params.push(colorSetId);
                     params.push(fromCommand);
                     loadMgr.setExtraData(params);
                     loadMgr.addEventDispatcher(propThumb,CoreEvent.LOAD_STATE_COMPLETE);
                     loadMgr.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.doCreateAssetAtSceneAgain);
                     loadMgr.commit();
                     propThumb.loadState();
                  }
                  else if(propThumb.placeable != false)
                  {
                     oldPropLocation = this.getAssetId(thumb);
                     if(oldPropLocation != null)
                     {
                        oldPropId = oldPropLocation.assetId;
                     }
                     else
                     {
                        oldPropId = "";
                     }
                     if(thumb is VideoPropThumb)
                     {
                        asset = new VideoProp();
                     }
                     else
                     {
                        asset = new Prop(oldPropId);
                     }
                     asset.setReferencePoint(dx,dy);
                     asset.move(dx,dy);
                     Prop(asset).facing = PropThumb(thumb).facing;
                     Prop(asset).fromTray = true;
                  }
               }
               else if(thumb is EffectThumb)
               {
                  EffThumb = thumb as EffectThumb;
                  if(EffThumb.getType() == EffectThumb.TYPE_ANIME)
                  {
                     asset = new AnimeEffectAsset();
                  }
                  else if(EffThumb.getType() == EffectThumb.TYPE_PROGRAM)
                  {
                     oldEffectLocation = this.getAssetId(thumb);
                     if(oldEffectLocation != null)
                     {
                        oldEffectId = oldEffectLocation.assetId;
                     }
                     else
                     {
                        oldEffectId = "";
                     }
                     asset = new ProgramEffectAsset(oldEffectId);
                  }
                  asset.x = dx - asset.width / 2;
                  asset.y = dy - asset.height / 2;
                  asset.isResize = EffThumb.getResize() == "true"?true:false;
                  if(!asset.isResize)
                  {
                     asset.x = AnimeConstants.SCREEN_WIDTH / 2 + AnimeConstants.SCREEN_X;
                     asset.y = AnimeConstants.SCREEN_HEIGHT / 2 + AnimeConstants.SCREEN_Y;
                  }
                  EffectAsset(asset).fromTray = true;
                  EffectAsset(asset).fromSpeech = fromSpeech;
               }
               if(asset != null)
               {
                  asset.scene = this;
                  asset.thumb = thumb;
                  if(colorSetId != "")
                  {
                     asset.defaultColorSetId = colorSetId;
                     asset.defaultColorSet = thumb.getColorSetById(colorSetId);
                     asset.restoreColor();
                  }
                  return asset;
               }
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AnimeScene:CreateAsset",e);
         }
         return null;
      }
      
      private function isProgramEffectTypeExist(param1:String) : Boolean
      {
         var _loc2_:EffectAsset = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.effects.length)
         {
            _loc2_ = this.effects.getValueByIndex(_loc3_) as EffectAsset;
            if(_loc2_.getExactType() == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      private function isEffectTypeExist(param1:String) : Boolean
      {
         var _loc2_:EffectAsset = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.effects.length)
         {
            _loc2_ = this.effects.getValueByIndex(_loc3_) as EffectAsset;
            if(_loc2_.getType() == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      private function isVideoTypeExist() : Boolean
      {
         var _loc1_:Prop = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.props.length)
         {
            _loc1_ = this.props.getValueByIndex(_loc2_) as Prop;
            if(_loc1_ is VideoProp)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function generateNewID(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         if(param1 == null)
         {
            _loc4_ = true;
         }
         else if(param1 == "")
         {
            _loc4_ = true;
         }
         else if(_existIDs.containsKey(param1))
         {
            _loc4_ = true;
         }
         else
         {
            _loc4_ = false;
         }
         if(_loc4_)
         {
            _loc3_ = _existIDs.length;
            do
            {
               _loc2_ = "SCENE" + _loc3_;
               _loc3_++;
            }
            while(_existIDs.containsKey(_loc2_));
            
         }
         else
         {
            _loc2_ = param1;
         }
         _existIDs.push(_loc2_,_loc2_);
         return _loc2_;
      }
      
      public function unloadAllAssets(param1:Boolean = true) : void
      {
      }
      
      public function loadAllAssets() : void
      {
         var _loc1_:UtilLoadMgr = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Character = null;
         var _loc7_:String = null;
         var _loc8_:AnimeSound = null;
         var _loc9_:String = null;
         var _loc10_:BubbleAsset = null;
         var _loc11_:Prop = null;
         var _loc12_:EffectAsset = null;
         if(this.sceneXML != null)
         {
            this.deSerialize(this.sceneXML,true,true,false);
            this.sceneXML = null;
            return;
         }
         this.console.capScreenLock = true;
         _loc1_ = new UtilLoadMgr();
         _loc1_.setExtraData(new Date());
         _loc1_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onLoadAllAssetsComplete);
         if(this._background != null)
         {
            _loc1_.addEventDispatcher(this._background,CoreEvent.LOAD_ASSET_COMPLETE);
            this._background.imageData = this._background.thumb.imageData;
         }
         _loc2_ = 0;
         while(_loc2_ < this._characters.length)
         {
            _loc6_ = Character(this._characters.getValueByIndex(_loc2_));
            _loc1_.addEventDispatcher(_loc6_,CoreEvent.LOAD_ASSET_COMPLETE);
            _loc7_ = Console.getConsole().linkageController.getSpeechSoundIdByScene(this);
            _loc8_ = Console.getConsole().speechManager.getValueByKey(_loc7_);
            if(_loc8_ is ProgressiveSound)
            {
               _loc9_ = Console.getConsole().linkageController.getTargetIdOfSpeech(_loc7_);
               _loc6_.demoSpeech = AssetLinkage.getCharIdFromLinkage(_loc9_) == _loc6_.id?true:false;
            }
            _loc6_.imageData = _loc6_.action.imageData;
            if(_loc6_.prop)
            {
               if(_loc6_.prop.state != null)
               {
                  _loc6_.prop.imageData = _loc6_.prop.state.imageData;
               }
               else
               {
                  _loc6_.prop.imageData = _loc6_.prop.thumb.imageData;
               }
            }
            if(_loc6_.head)
            {
               if(_loc6_.head.state != null)
               {
                  _loc6_.head.imageData = _loc6_.head.state.imageData;
               }
               else
               {
                  _loc6_.head.imageData = _loc6_.head.thumb.imageData;
               }
            }
            if(_loc6_.wear)
            {
               if(_loc6_.wear.state != null)
               {
                  _loc6_.wear.imageData = _loc6_.wear.state.imageData;
               }
               else
               {
                  _loc6_.wear.imageData = _loc6_.wear.thumb.imageData;
               }
            }
            _loc2_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this._bubbles.length)
         {
            _loc10_ = BubbleAsset(this._bubbles.getValueByIndex(_loc3_));
            _loc3_++;
         }
         _loc4_ = 0;
         while(_loc4_ < this._props.length)
         {
            _loc11_ = Prop(this._props.getValueByIndex(_loc4_));
            _loc1_.addEventDispatcher(_loc11_,CoreEvent.LOAD_ASSET_COMPLETE);
            if(_loc11_.state != null)
            {
               _loc11_.imageData = _loc11_.state.imageData;
            }
            else
            {
               _loc11_.imageData = _loc11_.thumb.imageData;
            }
            _loc4_++;
         }
         _loc5_ = 0;
         while(_loc5_ < this._effects.length)
         {
            _loc12_ = this._effects.getValueByIndex(_loc5_) as EffectAsset;
            if(_loc12_ is AnimeEffectAsset)
            {
               _loc1_.addEventDispatcher(_loc12_,CoreEvent.LOAD_ASSET_COMPLETE);
               AnimeEffectAsset(_loc12_).imageData = AnimeEffectAsset(_loc12_).thumb.imageData;
            }
            _loc5_++;
         }
         _loc1_.commit();
      }
      
      private function onLoadAllAssetsComplete(param1:Event) : void
      {
         this._console.capScreenLock = false;
         dispatchEvent(new CoreEvent(CoreEvent.LOAD_ALL_ASSETS_COMPLETE,this));
         this.refreshEffectTray();
      }
      
      public function isCharacterTalkingWithLinkage(param1:Character) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         if(!(param1.isInDefaultTalkAction() || param1.isInDefaultTalkFacial()))
         {
            return false;
         }
         var _loc2_:String = Console.getConsole().linkageController.getSpeechIdOfAsset(param1);
         if(_loc2_ != "")
         {
            _loc3_ = "";
            _loc4_ = Console.getConsole().linkageController.isLinkageExist(_loc2_);
            if(_loc4_ != null)
            {
               _loc8_ = _loc4_.concat();
               _loc8_.splice(_loc8_.indexOf(_loc2_),1);
               _loc3_ = _loc8_.join("");
            }
            _loc5_ = _loc3_.split(AssetLinkage.LINK);
            _loc6_ = _loc5_[0];
            _loc7_ = _loc5_[1];
            if(param1.scene.id == _loc6_ && param1.id == _loc7_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function copySelectedAssets(param1:CopiedAssets) : void
      {
         var asset:Asset = null;
         var assetCopy:Asset = null;
         var transitionCopy:AssetTransition = null;
         var transition:AssetTransition = null;
         var _copiedAssets:CopiedAssets = param1;
         if(!_copiedAssets)
         {
            return;
         }
         _copiedAssets.reset();
         var iterator:IIterator = this.selection.iterator();
         var copyableAssets:Array = new Array();
         if(iterator)
         {
            while(iterator.hasNext)
            {
               asset = iterator.next as Asset;
               if(asset && asset.isCopyable)
               {
                  copyableAssets.push(asset);
               }
            }
         }
         copyableAssets.sort(this.compareAssetOrdering);
         for each(asset in copyableAssets)
         {
            if(asset)
            {
               try
               {
                  assetCopy = asset.clone();
                  _copiedAssets.addAsset(assetCopy);
               }
               catch(e:Error)
               {
                  UtilErrorLogger.getInstance().error("AnimeScene::copySelectedAssets");
                  continue;
               }
            }
         }
         iterator = this.assetTransitions.iterator();
         if(iterator)
         {
            while(iterator.hasNext)
            {
               transition = iterator.next as AssetTransition;
               if(transition)
               {
                  asset = this.getAssetById(transition.assetId);
                  if(asset && copyableAssets.indexOf(asset) >= 0)
                  {
                     transitionCopy = transition.clone();
                     _copiedAssets.addAssetTransition(transitionCopy);
                  }
               }
            }
         }
      }
      
      public function addTransitionByType(param1:String) : void
      {
         var _loc2_:ICommand = null;
         var _loc3_:GoTransition = null;
         var _loc4_:Array = null;
         if(param1)
         {
            _loc3_ = new GoTransition();
            _loc3_.id = "GoTrans";
            _loc3_.type = param1;
            if(param1 == "FadeDark")
            {
               _loc3_.pack = "anifire";
            }
            else if(param1 == "WipeHand" || param1 == "CleanHand" || param1 == "CleanBrush")
            {
               _loc3_.pack = "animated";
            }
            else if(param1 == "InfoBlinds" || param1 == "InfoIris" || param1 == "InfoSplit")
            {
               _loc3_.pack = "animated";
            }
            else if(param1.indexOf("FES") == 0)
            {
               _loc3_.pack = "flashEff";
            }
            else
            {
               _loc3_.pack = "fl";
            }
            _loc3_.direction = "out";
            _loc3_.scene = this;
            _loc4_ = new Array();
            _loc3_.params = _loc4_;
            _loc2_ = new AddSceneTransitionCommand(_loc3_);
            _loc2_.execute();
         }
         else if(this.transition)
         {
            _loc2_ = new RemoveSceneTransitionCommand(this.transition);
            _loc2_.execute();
         }
      }
      
      public function updateAllCharacterDemoMouth() : void
      {
         var _loc1_:Character = null;
         var _loc4_:Array = null;
         var _loc6_:Boolean = false;
         var _loc7_:uint = 0;
         var _loc9_:int = 0;
         var _loc2_:uint = this._characters.length;
         var _loc3_:LinkageController = Console.getConsole().linkageController;
         var _loc5_:Array = Console.getConsole().getAllSoundOverlapWithScene(this);
         var _loc8_:int = 0;
         while(_loc8_ < _loc2_)
         {
            _loc1_ = this._characters.getValueByIndex(_loc8_) as Character;
            if(_loc1_)
            {
               _loc6_ = false;
               _loc4_ = _loc3_.getSoundIdByCharId(_loc1_.id);
               if(_loc4_ && _loc4_.length > 0)
               {
                  if(_loc5_ && _loc5_.length > 0)
                  {
                     _loc7_ = _loc5_.length;
                     _loc9_ = 0;
                     while(_loc9_ < _loc7_)
                     {
                        if(_loc4_.indexOf(AnimeSound(_loc5_[_loc9_]).id) >= 0)
                        {
                           _loc6_ = true;
                           break;
                        }
                        _loc9_++;
                     }
                  }
               }
               _loc1_.demoSpeech = _loc6_;
            }
            _loc8_++;
         }
      }
      
      private function onAssetAdded(param1:SceneEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:* = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:Asset = param1.asset;
         if(isInitBizTheme && _loc2_.thumb.theme && !_loc2_.thumb.theme.isBusinessTheme)
         {
            _loc3_ = "Theme Mixing - " + AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME);
            _loc6_ = _loc2_.thumb.themeId;
            _loc7_ = _loc2_.thumb.name;
            if(_loc2_ is Background)
            {
               if(Background(_loc2_).fromTray)
               {
                  _loc4_ = _loc6_ + " - Background";
                  _loc5_ = _loc7_;
               }
            }
            else if(_loc2_ is Prop && !_loc2_.attachedBg)
            {
               if(Prop(_loc2_).fromTray)
               {
                  _loc4_ = _loc6_ + " - Prop";
                  _loc5_ = _loc7_;
               }
            }
            else if(_loc2_ is Character)
            {
               if(Character(_loc2_).fromTray && !CharThumb(_loc2_.thumb).isBusinessTheme)
               {
                  _loc4_ = CharThumb(_loc2_.thumb).themeOrCCThemeId + " - Character";
                  _loc5_ = _loc7_;
               }
            }
            if(_loc3_ && _loc4_ && _loc5_)
            {
               AnalyticsManager.instance.trackEvent(_loc3_,_loc4_,_loc5_);
            }
         }
      }
      
      public function applyTextComponent(param1:TextComponentThumb) : void
      {
         var _loc2_:ApplyTextComponentCommand = null;
         if(!param1)
         {
            return;
         }
         if(param1.isAllComponentImageDataReady)
         {
            _loc2_ = new ApplyTextComponentCommand(param1);
            _loc2_.execute();
         }
         else
         {
            param1.addEventListener(TextComponentThumb.LOAD_COMPONENTS_IMAGE_DATA_COMPLETE,this.textComponent_loadComponentsImageDataCompleteHandler);
            param1.loadComponentsImageData();
         }
      }
      
      private function textComponent_loadComponentsImageDataCompleteHandler(param1:Event) : void
      {
         var _loc2_:TextComponentThumb = param1.target as TextComponentThumb;
         _loc2_.removeEventListener(TextComponentThumb.LOAD_COMPONENTS_IMAGE_DATA_COMPLETE,this.textComponent_loadComponentsImageDataCompleteHandler);
         var _loc3_:ApplyTextComponentCommand = new ApplyTextComponentCommand(_loc2_);
         _loc3_.execute();
      }
      
      public function saveTextCopiesFromTextComponent() : void
      {
         if(!this._textComponentData)
         {
            this._textComponentData = new TextComponentData();
         }
         this._textComponentData.saveTextCopies(this);
      }
      
      public function loadTextCopiesFromTextComponent() : void
      {
         if(this._textComponentData)
         {
            this._textComponentData.loadTextCopies(this);
         }
      }
      
      public function createAssetsFromTextComponent(param1:TextComponentThumb) : Array
      {
         var _loc6_:Object = null;
         var _loc7_:Prop = null;
         var _loc8_:BubbleAsset = null;
         if(!param1 || !param1.content)
         {
            return null;
         }
         var _loc2_:Array = param1.content.assets;
         if(!_loc2_)
         {
            return null;
         }
         _loc2_.sortOn(["index"],[Array.NUMERIC]);
         var _loc3_:Array = [];
         var _loc4_:int = _loc2_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc2_[_loc5_];
            switch(_loc6_.type)
            {
               case Prop.ASSET_TYPE:
                  _loc7_ = new Prop();
                  _loc7_.deSerializeJsonObj(_loc6_,null,this,true,true);
                  _loc3_.push(_loc7_);
                  break;
               case BubbleAsset.ASSET_TYPE:
                  _loc8_ = new BubbleAsset();
                  _loc8_.deSerializeJsonObj(_loc6_,this);
                  _loc3_.push(_loc8_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function createAssetTransitionsFromTextComponent(param1:TextComponentThumb, param2:Array) : Vector.<AssetTransition>
      {
         var _loc6_:AssetTransition = null;
         var _loc7_:Asset = null;
         var _loc10_:int = 0;
         var _loc11_:Asset = null;
         if(!param1 || !param1.content || !param1.content.assetTransition)
         {
            return null;
         }
         var _loc3_:AssetTransitionCollection = new AssetTransitionCollection();
         _loc3_.convertFromJsonObj(param1.content.assetTransition);
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = param2.length;
         var _loc8_:Vector.<AssetTransition> = new Vector.<AssetTransition>();
         var _loc9_:int = 0;
         while(_loc9_ < _loc4_)
         {
            _loc6_ = _loc3_.getItemAt(_loc9_) as AssetTransition;
            if(_loc6_)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc5_)
               {
                  _loc11_ = param2[_loc10_];
                  if(_loc11_.idFromTextComponent == _loc6_.assetId)
                  {
                     _loc6_.assetId = _loc11_.id;
                     _loc8_.push(_loc6_);
                     break;
                  }
                  _loc10_++;
               }
            }
            _loc9_++;
         }
         return _loc8_;
      }
      
      public function getAssetsFromTextComponent() : Array
      {
         var _loc1_:Array = [];
         _loc1_ = _loc1_.concat(this.getAssetsFromTextComponentFunc(this._props));
         _loc1_ = _loc1_.concat(this.getAssetsFromTextComponentFunc(this._bubbles));
         return _loc1_;
      }
      
      private function getAssetsFromTextComponentFunc(param1:UtilHashArray) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Asset = null;
         if(!param1 || param1.length == 0)
         {
            return [];
         }
         var _loc4_:Array = [];
         _loc2_ = param1.length - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = param1.getValueByIndex(_loc2_) as Asset;
            if(_loc3_ && _loc3_.componentRole)
            {
               _loc4_.push(_loc3_);
            }
            _loc2_--;
         }
         return _loc4_;
      }
      
      public function appendAssetThemes(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Character = null;
         var _loc5_:CharThumb = null;
         var _loc6_:Prop = null;
         var _loc7_:String = null;
         _loc3_ = this._characters.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._characters.getValueByIndex(_loc2_) as Character;
            if(_loc4_)
            {
               _loc5_ = _loc4_.thumb as CharThumb;
               if(_loc5_)
               {
                  param1[_loc5_.themeOrCCThemeId] = true;
               }
            }
            _loc2_++;
         }
         _loc3_ = this._props.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc6_ = this._props.getValueByIndex(_loc2_) as Prop;
            if(_loc6_)
            {
               _loc7_ = _loc6_.thumb.themeId;
               if(_loc7_ != ThemeConstants.UGC_THEME_ID)
               {
                  param1[_loc7_] = true;
               }
            }
            _loc2_++;
         }
      }
      
      public function set chapterBreak(param1:Boolean) : void
      {
         var _loc2_:Object = this.chapterBreak;
         if(_loc2_ !== param1)
         {
            this._1684171598chapterBreak = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chapterBreak",_loc2_,param1));
            }
         }
      }
   }
}

class AssetLocation
{
    
   
   private var _assetId:String;
   
   private var _sceneId:String;
   
   function AssetLocation(param1:String, param2:String)
   {
      super();
      this._assetId = param1;
      this._sceneId = param2;
   }
   
   public function get assetId() : String
   {
      return this._assetId;
   }
   
   public function get sceneId() : String
   {
      return this._sceneId;
   }
}
