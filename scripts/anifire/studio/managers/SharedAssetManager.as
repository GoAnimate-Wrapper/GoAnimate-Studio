package anifire.studio.managers
{
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.event.FontEvent;
   import anifire.event.ServerRequestEvent;
   import anifire.managers.AppConfigManager;
   import anifire.managers.ServerConnector;
   import anifire.models.FontModel;
   import anifire.studio.components.AlertPopUp;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.BubbleThumb;
   import anifire.studio.core.Console;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.core.VideoPropThumb;
   import anifire.studio.models.BackgroundExplorerCollection;
   import anifire.studio.models.PropExplorerCollection;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.models.UserSoundGroupCollection;
   import anifire.studio.models.VoiceTabSoundGroupCollection;
   import anifire.util.ApiRequest;
   import anifire.util.FontManager;
   import anifire.util.UtilDict;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.core.FlexGlobals;
   import mx.events.PropertyChangeEvent;
   
   public class SharedAssetManager extends EventDispatcher
   {
      
      private static var _userSharedInstance:SharedAssetManager;
      
      private static var _adminTeamInstance:SharedAssetManager;
      
      public static const ASSET_MANAGER_TYPE_SHARED:String = "shared";
      
      public static const ASSET_MANAGER_TYPE_TEAM:String = "team";
      
      protected static const PROP_PAGE_SIZE:int = 1000;
      
      protected static const BACKGROUND_PAGE_SIZE:int = 50;
      
      protected static const BUBBLE_PAGE_SIZE:int = 50;
      
      protected static const STARTER_PAGE_SIZE:int = 50;
      
      protected static const SOUND_PAGE_SIZE:int = 1000;
      
      protected static const VIDEO_PAGE_SIZE:int = 50;
      
      protected static const ERROR_CHECK_BYTE:int = 49;
       
      
      protected var actionGetAssets:String;
      
      protected var _nextBackgroundPage:int;
      
      protected var _nextSoundPage:int;
      
      protected var _nextPropPage:int;
      
      protected var _nextBubblePage:int;
      
      protected var _nextCharacterPage:int;
      
      protected var _nextVideoPage:int;
      
      protected var _nextStarterPage:int;
      
      protected var _hasMoreBackground:Boolean = true;
      
      protected var _hasMoreProp:Boolean = true;
      
      protected var _hasMoreBubble:Boolean = true;
      
      protected var _hasMoreCharacter:Boolean = true;
      
      protected var _hasMoreVideo:Boolean = true;
      
      protected var _hasMoreSound:Boolean = true;
      
      protected var _hasMoreStarter:Boolean = true;
      
      protected var _themeManager:ThemeManager;
      
      protected var _configManager:AppConfigManager;
      
      protected var _propCollection:PropExplorerCollection;
      
      protected var _soundCollection:UserSoundGroupCollection;
      
      protected var _voiceTabSoundCollection:VoiceTabSoundGroupCollection;
      
      protected var _characters:ArrayCollection;
      
      protected var _videos:ArrayCollection;
      
      protected var _videoLookup:Object;
      
      protected var _starterLookup:Object;
      
      protected var _bubbles:ArrayCollection;
      
      protected var _bubbleLookup:Object;
      
      protected var _backgroundCollection:BackgroundExplorerCollection;
      
      private var _starterReady:Boolean;
      
      private var _isAssetEditable:Boolean;
      
      private var _loadingStarter:Boolean;
      
      private var _backgroundReady:Boolean;
      
      private var _loadingBackground:Boolean;
      
      private var _soundReady:Boolean;
      
      private var _loadingSound:Boolean;
      
      private var _videoReady:Boolean;
      
      private var _loadingVideo:Boolean;
      
      private var _bubbleReady:Boolean;
      
      private var _loadingBubble:Boolean;
      
      public function SharedAssetManager(param1:String)
      {
         super();
         this.init(param1);
      }
      
      public static function get userSharedInstance() : SharedAssetManager
      {
         if(_userSharedInstance == null)
         {
            _userSharedInstance = new SharedAssetManager(SharedAssetManager.ASSET_MANAGER_TYPE_SHARED);
         }
         return _userSharedInstance;
      }
      
      public static function get adminTeamInstance() : SharedAssetManager
      {
         if(_adminTeamInstance == null)
         {
            _adminTeamInstance = new SharedAssetManager(SharedAssetManager.ASSET_MANAGER_TYPE_TEAM);
         }
         return _adminTeamInstance;
      }
      
      public function get isAssetEditable() : Boolean
      {
         return this._isAssetEditable;
      }
      
      [Bindable(event="propertyChange")]
      public function get starterReady() : Boolean
      {
         return this._starterReady;
      }
      
      private function set _987015764starterReady(param1:Boolean) : void
      {
         this._starterReady = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingStarter() : Boolean
      {
         return this._loadingStarter;
      }
      
      private function set _1833589683loadingStarter(param1:Boolean) : void
      {
         this._loadingStarter = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundReady() : Boolean
      {
         return this._backgroundReady;
      }
      
      private function set _1300668693backgroundReady(param1:Boolean) : void
      {
         this._backgroundReady = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingBackground() : Boolean
      {
         return this._loadingBackground;
      }
      
      private function set _1311750026loadingBackground(param1:Boolean) : void
      {
         this._loadingBackground = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get soundReady() : Boolean
      {
         return this._soundReady;
      }
      
      private function set _354913836soundReady(param1:Boolean) : void
      {
         this._soundReady = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingSound() : Boolean
      {
         return this._loadingSound;
      }
      
      private function set _1400659251loadingSound(param1:Boolean) : void
      {
         this._loadingSound = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get videoReady() : Boolean
      {
         return this._videoReady;
      }
      
      private function set _1630311960videoReady(param1:Boolean) : void
      {
         this._videoReady = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingVideo() : Boolean
      {
         return this._loadingVideo;
      }
      
      private function set _1403234463loadingVideo(param1:Boolean) : void
      {
         this._loadingVideo = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleReady() : Boolean
      {
         return this._bubbleReady;
      }
      
      private function set _766520439bubbleReady(param1:Boolean) : void
      {
         this._bubbleReady = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingBubble() : Boolean
      {
         return this._loadingBubble;
      }
      
      private function set _10967832loadingBubble(param1:Boolean) : void
      {
         this._loadingBubble = param1;
      }
      
      [Bindable(event="sharedBackgroundComplete")]
      public function get backgroundSource() : BackgroundExplorerCollection
      {
         return this._backgroundCollection;
      }
      
      [Bindable(event="sharedPropComplete")]
      public function get propSource() : PropExplorerCollection
      {
         return this._propCollection;
      }
      
      [Bindable(event="sharedSoundComplete")]
      public function get soundSource() : UserSoundGroupCollection
      {
         return this._soundCollection;
      }
      
      [Bindable(event="sharedSoundComplete")]
      public function get voiceTabSoundSource() : VoiceTabSoundGroupCollection
      {
         return this._voiceTabSoundCollection;
      }
      
      [Bindable(event="sharedBubbleComplete")]
      public function get bubbleSource() : ArrayCollection
      {
         return this._bubbles;
      }
      
      [Bindable(event="sharedVideoComplete")]
      public function get videoSource() : ArrayCollection
      {
         return this._videos;
      }
      
      [Bindable(event="sharedStarterComplete")]
      public function get hasMoreStarter() : Boolean
      {
         return this._hasMoreStarter;
      }
      
      [Bindable(event="sharedSoundComplete")]
      public function get hasMoreSound() : Boolean
      {
         return this._hasMoreSound;
      }
      
      [Bindable(event="sharedBackgroundComplete")]
      public function get hasMoreBackground() : Boolean
      {
         return this._hasMoreBackground;
      }
      
      [Bindable(event="sharedPropComplete")]
      public function get sharedPropReady() : Boolean
      {
         return this._nextPropPage > 0;
      }
      
      [Bindable(event="sharedPropComplete")]
      public function get hasMoreProp() : Boolean
      {
         return this._hasMoreProp;
      }
      
      [Bindable(event="sharedCharacterComplete")]
      public function get hasMoreCharacter() : Boolean
      {
         return this._hasMoreCharacter;
      }
      
      [Bindable(event="sharedVideoComplete")]
      public function get hasMoreVideo() : Boolean
      {
         return this._hasMoreVideo;
      }
      
      protected function init(param1:String) : void
      {
         this._themeManager = ThemeManager.instance;
         this._configManager = AppConfigManager.instance;
         this._backgroundCollection = new BackgroundExplorerCollection(false,false,true);
         this._propCollection = new PropExplorerCollection();
         this._soundCollection = new UserSoundGroupCollection();
         this._voiceTabSoundCollection = new VoiceTabSoundGroupCollection();
         this._videos = new ArrayCollection();
         this._videoLookup = {};
         this._starterLookup = {};
         this._bubbles = new ArrayCollection();
         this._bubbleLookup = {};
         if(param1 == ASSET_MANAGER_TYPE_SHARED)
         {
            this.actionGetAssets = ServerConstants.ACTION_GET_SHARED_ASSETS_V2;
            this._isAssetEditable = AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_TEAM_ADMIN);
         }
         else if(param1 == ASSET_MANAGER_TYPE_TEAM)
         {
            this.actionGetAssets = ServerConstants.ACTION_GET_TEAM_ASSETS_V2;
            this._isAssetEditable = true;
         }
      }
      
      protected function startLoading() : void
      {
         Console.getConsole().loadProgress = 0;
         Console.getConsole().requestLoadStatus(true);
      }
      
      protected function finishLoading() : void
      {
         Console.getConsole().loadProgressVisible = false;
         Console.getConsole().requestLoadStatus(false);
      }
      
      protected function displayErrorPopUp(param1:String) : void
      {
         var _loc2_:AlertPopUp = new AlertPopUp();
         _loc2_.createDefaultPopUp();
         _loc2_.title = UtilDict.toDisplay("go","Shared Library Error");
         _loc2_.message = param1;
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      protected function checkXmlError(param1:XML) : Boolean
      {
         var _loc2_:String = null;
         if(param1.name() == "error")
         {
            _loc2_ = param1.code;
            this.displayErrorPopUp(param1.code);
            this.finishLoading();
            return true;
         }
         return false;
      }
      
      protected function common_errorHandler(param1:Event) : void
      {
         this.displayErrorPopUp(UtilDict.toDisplay("go","Cannot connect to server."));
         this.finishLoading();
      }
      
      public function addSoundByThumb(param1:SoundThumb) : void
      {
         param1.editable = this.isAssetEditable;
         var _loc2_:ThumbModel = new ThumbModel(param1);
         this._soundCollection.addProduct(_loc2_,false);
         this._voiceTabSoundCollection.addProduct(_loc2_,false);
      }
      
      public function removeSoundByAssetId(param1:String) : void
      {
         this._soundCollection.removeProductById(param1);
         ServerConnector.instance.notifyAssetDelete("sound",param1);
      }
      
      public function getSoundByAssetId(param1:String) : ThumbModel
      {
         return this._soundCollection.getProductById(param1);
      }
      
      public function loadSound() : void
      {
         this.startLoading();
         var _loc1_:Object = {};
         _loc1_["type"] = "sound";
         _loc1_["page"] = this._nextSoundPage;
         _loc1_["count"] = SOUND_PAGE_SIZE;
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadSound_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.common_errorHandler);
         _loc2_.post(this.actionGetAssets,_loc1_);
      }
      
      protected function loadSound_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc5_:SoundThumb = null;
         var _loc6_:XML = null;
         var _loc9_:ThumbModel = null;
         var _loc2_:XML = new XML(param1.data.xml);
         if(this.checkXmlError(_loc2_))
         {
            return;
         }
         this._hasMoreSound = _loc2_.@more == "1";
         var _loc3_:XMLList = _loc2_.children();
         var _loc4_:int = _loc3_.length();
         var _loc7_:Theme = ThemeManager.instance.userTheme;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc8_];
            _loc5_ = new SoundThumb();
            _loc5_.deSerialize(_loc6_,_loc7_);
            _loc5_.xml = _loc6_;
            _loc5_.editable = this.isAssetEditable;
            _loc7_.addThumb(_loc5_);
            _loc9_ = new ThumbModel(_loc5_);
            this._soundCollection.addProduct(_loc9_);
            this._voiceTabSoundCollection.addProduct(_loc9_);
            _loc8_++;
         }
         this._nextSoundPage++;
         this.finishLoading();
         dispatchEvent(new CoreEvent(CoreEvent.SHARED_SOUND_COMPLETE,this));
      }
      
      public function addBackgroundByThumb(param1:BackgroundThumb) : void
      {
         param1.editable = true;
         this._backgroundCollection.addProduct(new ThumbModel(param1),false);
      }
      
      public function removeBackgroundByAssetId(param1:String) : void
      {
         this._backgroundCollection.removeProductById(param1);
         ServerConnector.instance.notifyAssetDelete("bg",param1);
      }
      
      public function getBackgroundByAssetId(param1:String) : ThumbModel
      {
         return this._backgroundCollection.getProductById(param1);
      }
      
      public function loadBackground() : void
      {
         this.startLoading();
         var _loc1_:Object = {};
         _loc1_["type"] = "bg";
         _loc1_["page"] = this._nextBackgroundPage;
         _loc1_["count"] = BACKGROUND_PAGE_SIZE;
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadBackground_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.common_errorHandler);
         _loc2_.post(this.actionGetAssets,_loc1_);
      }
      
      protected function loadBackground_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc5_:BackgroundThumb = null;
         var _loc6_:XML = null;
         var _loc2_:XML = new XML(param1.data.xml);
         if(this.checkXmlError(_loc2_))
         {
            return;
         }
         this._hasMoreBackground = _loc2_.@more == "1";
         var _loc3_:XMLList = _loc2_.children();
         var _loc4_:int = _loc3_.length();
         var _loc7_:Theme = ThemeManager.instance.userTheme;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc8_];
            _loc5_ = new BackgroundThumb();
            _loc5_.deSerialize(_loc6_,_loc7_);
            _loc5_.editable = this.isAssetEditable;
            _loc7_.addThumb(_loc5_);
            this._backgroundCollection.addProduct(new ThumbModel(_loc5_));
            _loc8_++;
         }
         this._nextBackgroundPage++;
         this.finishLoading();
         dispatchEvent(new CoreEvent(CoreEvent.SHARED_BACKGROUND_COMPLETE,this));
      }
      
      public function addPropByThumb(param1:PropThumb) : void
      {
         param1.editable = this.isAssetEditable;
         this._propCollection.addProduct(new ThumbModel(param1),false);
      }
      
      public function removePropByAssetId(param1:String) : void
      {
         this.propSource.removeProductById(param1);
         ServerConnector.instance.notifyAssetDelete("prop",param1);
      }
      
      public function getPropByAssetId(param1:String) : ThumbModel
      {
         return this._propCollection.getProductById(param1);
      }
      
      public function loadPropIfNeeded() : void
      {
         if(this._nextPropPage == 0)
         {
            this.loadProp();
         }
      }
      
      public function loadProp() : void
      {
         this.startLoading();
         var _loc1_:Object = {};
         _loc1_["type"] = "prop";
         _loc1_["page"] = this._nextPropPage;
         _loc1_["count"] = PROP_PAGE_SIZE;
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadProp_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.common_errorHandler);
         _loc2_.post(this.actionGetAssets,_loc1_);
      }
      
      protected function loadProp_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc5_:PropThumb = null;
         var _loc6_:XML = null;
         var _loc2_:XML = new XML(param1.data.xml);
         if(this.checkXmlError(_loc2_))
         {
            return;
         }
         this._hasMoreProp = _loc2_.@more == "1";
         var _loc3_:XMLList = _loc2_.children();
         var _loc4_:int = _loc3_.length();
         var _loc7_:Theme = ThemeManager.instance.userTheme;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc8_];
            _loc5_ = new PropThumb();
            _loc5_.deSerialize(_loc6_,_loc7_);
            _loc5_.xml = _loc6_;
            _loc5_.editable = this.isAssetEditable;
            _loc7_.addThumb(_loc5_);
            this._propCollection.addProduct(new ThumbModel(_loc5_));
            _loc8_++;
         }
         this._nextPropPage++;
         this.finishLoading();
         dispatchEvent(new CoreEvent(CoreEvent.SHARED_PROP_COMPLETE,this));
      }
      
      public function addBubbleByThumb(param1:BubbleThumb, param2:Boolean = false) : void
      {
         if(this.getBubbleByAssetId(param1.id) || !param1.enable)
         {
            return;
         }
         var _loc3_:ThumbModel = new ThumbModel(param1);
         this._bubbleLookup[param1.id] = _loc3_;
         if(param2)
         {
            this._bubbles.addItem(_loc3_);
         }
         else
         {
            this._bubbles.addItemAt(_loc3_,0);
         }
      }
      
      public function removeBubbleByAssetId(param1:String) : void
      {
         var _loc4_:ThumbModel = null;
         var _loc2_:int = this._bubbles.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._bubbles.getItemAt(_loc3_) as ThumbModel;
            if(_loc4_ && _loc4_.id == param1)
            {
               this._bubbleLookup[_loc4_.id] = null;
               this._bubbles.removeItemAt(_loc3_);
               break;
            }
            _loc3_++;
         }
         ServerConnector.instance.notifyAssetDelete(ServerConnector.TYPE_FONT,param1);
      }
      
      public function addVideoByThumb(param1:VideoPropThumb, param2:Boolean = false) : void
      {
         if(this.getVideoByAssetId(param1.id))
         {
            return;
         }
         var _loc3_:ThumbModel = new ThumbModel(param1);
         this._videoLookup[param1.id] = _loc3_;
         if(param2)
         {
            this._videos.addItem(_loc3_);
         }
         else
         {
            this._videos.addItemAt(_loc3_,0);
         }
      }
      
      public function removeVideoByAssetId(param1:String) : void
      {
         var _loc4_:ThumbModel = null;
         var _loc2_:int = this._videos.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._videos.getItemAt(_loc3_) as ThumbModel;
            if(_loc4_ && _loc4_.id == param1)
            {
               this._videoLookup[_loc4_.id] = null;
               this._videos.removeItemAt(_loc3_);
               break;
            }
            _loc3_++;
         }
         ServerConnector.instance.notifyAssetDelete("video",param1);
      }
      
      public function getVideoByAssetId(param1:String) : ThumbModel
      {
         return this._videoLookup[param1];
      }
      
      public function getBubbleByAssetId(param1:String) : ThumbModel
      {
         return this._bubbleLookup[param1];
      }
      
      public function loadVideo() : void
      {
         this.startLoading();
         var _loc1_:Object = {};
         _loc1_["type"] = "prop";
         _loc1_["subtype"] = "video";
         _loc1_["page"] = this._nextVideoPage;
         _loc1_["count"] = VIDEO_PAGE_SIZE;
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadVideo_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.common_errorHandler);
         _loc2_.post(this.actionGetAssets,_loc1_);
      }
      
      private function loadVideo_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc5_:VideoPropThumb = null;
         var _loc6_:XML = null;
         var _loc2_:XML = new XML(param1.data.xml);
         if(this.checkXmlError(_loc2_))
         {
            return;
         }
         this._hasMoreVideo = _loc2_.@more == "1";
         var _loc3_:XMLList = _loc2_.children();
         var _loc4_:int = _loc3_.length();
         var _loc7_:Theme = ThemeManager.instance.userTheme;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc8_];
            _loc5_ = new VideoPropThumb();
            _loc5_.deSerialize(_loc6_,_loc7_);
            _loc5_.xml = _loc6_;
            _loc5_.editable = this.isAssetEditable;
            _loc7_.addThumb(_loc5_,_loc6_);
            this.addVideoByThumb(_loc5_,true);
            _loc8_++;
         }
         this._nextVideoPage++;
         this.finishLoading();
         this.videoReady = true;
         dispatchEvent(new CoreEvent(CoreEvent.SHARED_VIDEO_COMPLETE,this));
      }
      
      public function loadBubble() : void
      {
         this.startLoading();
         var _loc1_:Object = {};
         _loc1_["type"] = "font";
         _loc1_["page"] = this._nextBubblePage;
         _loc1_["count"] = BUBBLE_PAGE_SIZE;
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadBubble_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.common_errorHandler);
         _loc2_.post(this.actionGetAssets,_loc1_);
      }
      
      protected function loadBubble_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc5_:XML = null;
         var _loc6_:BubbleThumb = null;
         var _loc2_:XML = new XML(param1.data.xml);
         if(this.checkXmlError(_loc2_))
         {
            return;
         }
         this._hasMoreBubble = _loc2_.@more == "1";
         var _loc3_:XMLList = _loc2_.children();
         var _loc4_:int = _loc3_.length();
         FontManager.getFontManager().addCustomFontListByXML(_loc3_,true);
         var _loc7_:Theme = ThemeManager.instance.userTheme;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc8_];
            _loc6_ = this.createBubbleThumb(_loc5_.@id);
            _loc6_.editable = this.isAssetEditable;
            this.addBubbleByThumb(_loc6_,true);
            dispatchEvent(new FontEvent(FontEvent.USER_FONT_ADDED,_loc6_.aid,ThemeManager.instance.userTheme.id));
            _loc8_++;
         }
         this._nextBubblePage++;
         this.bubbleReady = true;
         this.finishLoading();
         dispatchEvent(new CoreEvent(CoreEvent.SHARED_BUBBLE_COMPLETE,this));
      }
      
      public function createBubbleThumb(param1:String) : BubbleThumb
      {
         var _loc3_:BubbleThumb = null;
         var _loc2_:Theme = ThemeManager.instance.userTheme;
         _loc3_ = new BubbleThumb();
         var _loc4_:FontModel = FontManager.getFontManager().getFontModelByFontId(param1);
         _loc3_.id = _loc4_.value;
         _loc3_.aid = _loc4_.id;
         _loc3_.encAssetId = _loc4_.encAssetId;
         _loc3_.tags = _loc4_.tags;
         _loc3_.name = _loc4_.label;
         _loc3_.enable = true;
         _loc3_.editable = this.isAssetEditable;
         _loc3_.setFileName(_loc4_.id + ".swf");
         _loc3_.imageData = _loc3_.getDefaultBubbleBody(_loc4_.value);
         _loc3_.type = "BLANK";
         _loc3_.theme = _loc2_;
         _loc2_.addThumb(_loc3_);
         return _loc3_;
      }
      
      public function addStarterByThumb(param1:BackgroundThumb) : void
      {
         var _loc2_:ThumbModel = null;
         param1.editable = this.isAssetEditable;
         if(!this._starterLookup[param1.id])
         {
            _loc2_ = new ThumbModel(param1);
            this._starterLookup[param1.id] = _loc2_;
            this._backgroundCollection.addStarter(_loc2_,false);
         }
      }
      
      public function removeStarterByAssetId(param1:String) : void
      {
         this._backgroundCollection.removeStarterById(param1);
      }
      
      public function loadStarter() : void
      {
         this.startLoading();
         var _loc1_:Object = {};
         _loc1_["type"] = "movie";
         _loc1_["page"] = this._nextStarterPage;
         _loc1_["count"] = STARTER_PAGE_SIZE;
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadStarter_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.common_errorHandler);
         _loc2_.post(this.actionGetAssets,_loc1_);
      }
      
      protected function loadStarter_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc5_:BackgroundThumb = null;
         var _loc6_:XML = null;
         var _loc9_:ThumbModel = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.loadStarter_completeHandler);
         var _loc2_:XML = new XML(param1.data.xml);
         if(this.checkXmlError(_loc2_))
         {
            return;
         }
         this._hasMoreStarter = _loc2_.@more == "1";
         var _loc3_:XMLList = _loc2_.children();
         var _loc4_:int = _loc3_.length();
         var _loc7_:Theme = ThemeManager.instance.userTheme;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc8_];
            _loc5_ = new BackgroundThumb();
            _loc5_.deserializeStarter(_loc6_,_loc7_);
            _loc5_.editable = this.isAssetEditable;
            if(!this._starterLookup[_loc5_.id])
            {
               _loc9_ = new ThumbModel(_loc5_);
               this._starterLookup[_loc5_.id] = _loc9_;
               _loc7_.addThumb(_loc5_);
               this._backgroundCollection.addStarter(_loc9_);
            }
            _loc8_++;
         }
         this._nextStarterPage++;
         this.finishLoading();
         this.starterReady = true;
         this.loadingStarter = false;
         dispatchEvent(new CoreEvent(CoreEvent.SHARED_STARTER_COMPLETE,this));
      }
      
      public function set starterReady(param1:Boolean) : void
      {
         var _loc2_:Object = this.starterReady;
         if(_loc2_ !== param1)
         {
            this._987015764starterReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starterReady",_loc2_,param1));
            }
         }
      }
      
      public function set loadingSound(param1:Boolean) : void
      {
         var _loc2_:Object = this.loadingSound;
         if(_loc2_ !== param1)
         {
            this._1400659251loadingSound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingSound",_loc2_,param1));
            }
         }
      }
      
      public function set loadingBubble(param1:Boolean) : void
      {
         var _loc2_:Object = this.loadingBubble;
         if(_loc2_ !== param1)
         {
            this._10967832loadingBubble = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingBubble",_loc2_,param1));
            }
         }
      }
      
      public function set soundReady(param1:Boolean) : void
      {
         var _loc2_:Object = this.soundReady;
         if(_loc2_ !== param1)
         {
            this._354913836soundReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundReady",_loc2_,param1));
            }
         }
      }
      
      public function set backgroundReady(param1:Boolean) : void
      {
         var _loc2_:Object = this.backgroundReady;
         if(_loc2_ !== param1)
         {
            this._1300668693backgroundReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundReady",_loc2_,param1));
            }
         }
      }
      
      public function set loadingVideo(param1:Boolean) : void
      {
         var _loc2_:Object = this.loadingVideo;
         if(_loc2_ !== param1)
         {
            this._1403234463loadingVideo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingVideo",_loc2_,param1));
            }
         }
      }
      
      public function set loadingBackground(param1:Boolean) : void
      {
         var _loc2_:Object = this.loadingBackground;
         if(_loc2_ !== param1)
         {
            this._1311750026loadingBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingBackground",_loc2_,param1));
            }
         }
      }
      
      public function set videoReady(param1:Boolean) : void
      {
         var _loc2_:Object = this.videoReady;
         if(_loc2_ !== param1)
         {
            this._1630311960videoReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"videoReady",_loc2_,param1));
            }
         }
      }
      
      public function set loadingStarter(param1:Boolean) : void
      {
         var _loc2_:Object = this.loadingStarter;
         if(_loc2_ !== param1)
         {
            this._1833589683loadingStarter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingStarter",_loc2_,param1));
            }
         }
      }
      
      public function set bubbleReady(param1:Boolean) : void
      {
         var _loc2_:Object = this.bubbleReady;
         if(_loc2_ !== param1)
         {
            this._766520439bubbleReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleReady",_loc2_,param1));
            }
         }
      }
   }
}
