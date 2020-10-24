package anifire.studio.managers
{
	import anifire.constant.ResponseConstants;
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
	import anifire.studio.core.CharThumb;
	import anifire.studio.core.Console;
	import anifire.studio.core.FolderThumb;
	import anifire.studio.core.PropThumb;
	import anifire.studio.core.SoundThumb;
	import anifire.studio.core.Theme;
	import anifire.studio.core.Thumb;
	import anifire.studio.core.VideoPropThumb;
	import anifire.studio.events.UploadStuffEvent;
	import anifire.studio.models.BackgroundExplorerCollection;
	import anifire.studio.models.FlowFrameImageExplorerCollection;
	import anifire.studio.models.PropExplorerCollection;
	import anifire.studio.models.ThumbModel;
	import anifire.studio.models.UserSoundGroupCollection;
	import anifire.studio.models.VoiceTabSoundGroupCollection;
	import anifire.util.ApiRequest;
	import anifire.util.FontManager;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import anifire.util.UtilURLStream;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import mx.collections.ArrayCollection;
	import mx.core.FlexGlobals;
	import mx.utils.StringUtil;
	
	public class UserAssetManager extends EventDispatcher
	{
		
		private static var __instance:UserAssetManager;
		
		private static const PROP_PAGE_SIZE:int = 1000;
		
		private static const BACKGROUND_PAGE_SIZE:int = 50;
		
		private static const STARTER_PAGE_SIZE:int = 50;
		
		private static const CHARACTER_PAGE_SIZE:int = 1000;
		
		private static const SOUND_PAGE_SIZE:int = 1000;
		
		private static const VIDEO_PAGE_SIZE:int = 50;
		
		private static const ERROR_CHECK_BYTE:int = 49;
		 
		
		protected var _nextBackgroundPage:int;
		
		protected var _nextSoundPage:int;
		
		protected var _nextPropPage:int;
		
		protected var _nextCharacterPage:int;
		
		protected var _nextVideoPage:int;
		
		protected var _nextStarterPage:int;
		
		protected var _hasMoreBackground:Boolean = true;
		
		protected var _hasMoreProp:Boolean = true;
		
		protected var _hasMoreCharacter:Boolean = true;
		
		protected var _hasMoreVideo:Boolean = true;
		
		protected var _hasMoreUserChar:Boolean = true;
		
		protected var _hasMoreSound:Boolean = true;
		
		protected var _hasMoreStarter:Boolean = true;
		
		protected var _themeManager:ThemeManager;
		
		protected var _configManager:AppConfigManager;
		
		protected var _propCollection:PropExplorerCollection;
		
		protected var _flowFrameImageCollection:FlowFrameImageExplorerCollection;
		
		protected var _soundCollection:UserSoundGroupCollection;
		
		protected var _voiceTabSoundCollection:VoiceTabSoundGroupCollection;
		
		protected var _characters:ArrayCollection;
		
		protected var _videos:ArrayCollection;
		
		protected var _videoLookup:Object;
		
		protected var _starterLookup:Object;
		
		protected var _bubbles:ArrayCollection;
		
		protected var _bubbleLookup:Object;
		
		protected var _backgroundCollection:BackgroundExplorerCollection;
		
		private var _uploadedAssetXML:XML;
		
		private var _newlyAddedAssetIds:String = "";
		
		public function UserAssetManager()
		{
			super();
			this.init();
		}
		
		public static function get instance() : UserAssetManager
		{
			if(!__instance)
			{
				if(UtilSite.isGoAnimate)
				{
					__instance = new UserAssetManager();
				}
				else
				{
					__instance = new LegacyUserAssetManager();
				}
			}
			return __instance;
		}
		
		[Bindable(event="userBackgroundComplete")]
		[Bindable(event="userBackgroundRemoved")]
		[Bindable(event="userBackgroundAdded")]
		public function get backgroundSource() : BackgroundExplorerCollection
		{
			return this._backgroundCollection;
		}
		
		[Bindable(event="userPropComplete")]
		[Bindable(event="userPropRemoved")]
		[Bindable(event="userPropAdded")]
		public function get propSource() : PropExplorerCollection
		{
			return this._propCollection;
		}
		
		[Bindable(event="userPropComplete")]
		[Bindable(event="userPropRemoved")]
		[Bindable(event="userPropAdded")]
		public function get flowFrameImageSource() : FlowFrameImageExplorerCollection
		{
			return this._flowFrameImageCollection;
		}
		
		[Bindable(event="userSoundComplete")]
		[Bindable(event="userSoundRemoved")]
		[Bindable(event="userSoundAdded")]
		public function get soundSource() : UserSoundGroupCollection
		{
			return this._soundCollection;
		}
		
		[Bindable(event="userSoundComplete")]
		[Bindable(event="userSoundRemoved")]
		[Bindable(event="userSoundAdded")]
		public function get voiceTabSoundSource() : VoiceTabSoundGroupCollection
		{
			return this._voiceTabSoundCollection;
		}
		
		[Bindable(event="userCharacterComplete")]
		public function get characterSource() : ArrayCollection
		{
			return this._characters;
		}
		
		[Bindable(event="userBubbleComplete")]
		[Bindable(event="userBubbleRemoved")]
		[Bindable(event="userBubbleAdded")]
		public function get bubbleSource() : ArrayCollection
		{
			return this._bubbles;
		}
		
		[Bindable(event="userVideoComplete")]
		[Bindable(event="userVideoRemoved")]
		[Bindable(event="userVideoAdded")]
		public function get videoSource() : ArrayCollection
		{
			return this._videos;
		}
		
		[Bindable(event="userStarterComplete")]
		public function get hasMoreStarter() : Boolean
		{
			return this._hasMoreStarter;
		}
		
		[Bindable(event="userSoundComplete")]
		public function get hasMoreSound() : Boolean
		{
			return this._hasMoreSound;
		}
		
		[Bindable(event="userBackgroundComplete")]
		public function get userBackgroundReady() : Boolean
		{
			return this._nextBackgroundPage > 0;
		}
		
		[Bindable(event="userBackgroundComplete")]
		public function get hasMoreBackground() : Boolean
		{
			return this._hasMoreBackground;
		}
		
		[Bindable(event="userPropComplete")]
		public function get userPropReady() : Boolean
		{
			return this._nextPropPage > 0;
		}
		
		[Bindable(event="userPropComplete")]
		public function get hasMoreProp() : Boolean
		{
			return this._hasMoreProp;
		}
		
		[Bindable(event="userCharacterComplete")]
		public function get hasMoreCharacter() : Boolean
		{
			return this._hasMoreCharacter;
		}
		
		[Bindable(event="userVideoComplete")]
		public function get hasMoreVideo() : Boolean
		{
			return this._hasMoreVideo;
		}
		
		public function get hasMoreUserChar() : Boolean
		{
			return this._hasMoreUserChar;
		}
		
		protected function init() : void
		{
			this._themeManager = ThemeManager.instance;
			this._configManager = AppConfigManager.instance;
			this._backgroundCollection = new BackgroundExplorerCollection(false,false,true);
			this._propCollection = new PropExplorerCollection();
			this._flowFrameImageCollection = new FlowFrameImageExplorerCollection();
			this._soundCollection = new UserSoundGroupCollection();
			this._voiceTabSoundCollection = new VoiceTabSoundGroupCollection();
			this._characters = new ArrayCollection();
			this._videos = new ArrayCollection();
			this._videoLookup = {};
			this._starterLookup = {};
			this._bubbles = new ArrayCollection();
			this._bubbleLookup = {};
		}
		
		public function updateAsset(param1:String, param2:String, param3:String, param4:String, param5:Boolean, param6:Object = null) : void
		{
			var _loc7_:Object = {};
			_loc7_[ResponseConstants.ASSETID] = param1;
			_loc7_[ResponseConstants.ID] = param2;
			_loc7_[ResponseConstants.TITLE] = param3;
			_loc7_[ResponseConstants.TAGS] = param4;
			_loc7_[ResponseConstants.ASSET_PUBLISHED] = !!param5?ResponseConstants.VALUE_ISPUBLISHED_TRUE:ResponseConstants.VALUE_ISPUBLISHED_FALSE;
			if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_TEAM_SHARING))
			{
				_loc7_[ResponseConstants.ASSET_SHARING_SHARE] = param6;
			}
			var _loc8_:ApiRequest = new ApiRequest();
			_loc8_.addEventListener(ServerRequestEvent.COMPLETE,this.asset_updateCompleteHandler);
			_loc8_.post(ServerConstants.ACTION_UPDATE_ASSET_V2,_loc7_);
		}
		
		private function asset_updateCompleteHandler(param1:ServerRequestEvent) : void
		{
			dispatchEvent(new CoreEvent(CoreEvent.UPDATE_ASSET_COMPLETE,this));
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
			_loc2_.title = UtilDict.translate("Your Library Error");
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
		
		protected function displayErrorCode(param1:int) : void
		{
			this.displayErrorPopUp(StringUtil.substitute(UtilDict.translate("Error loading user library.\nError code: {0}"),param1));
			this.finishLoading();
		}
		
		protected function common_errorHandler(param1:Event) : void
		{
			this.displayErrorPopUp(UtilDict.translate("Cannot connect to server."));
			this.finishLoading();
		}
		
		protected function errorMessageHandler(param1:ByteArray) : void
		{
			var _loc2_:XML = null;
			var _loc3_:String = new String();
			while(param1.bytesAvailable)
			{
				_loc3_ = _loc3_ + param1.readUTFBytes(1);
			}
			_loc2_ = new XML(_loc3_);
			if(!this.checkXmlError(_loc2_))
			{
				this.displayErrorPopUp("");
				this.finishLoading();
			}
		}
		
		public function addSoundByThumb(param1:SoundThumb) : void
		{
			param1.editable = true;
			var _loc2_:ThumbModel = new ThumbModel(param1);
			this._soundCollection.addProduct(_loc2_,false);
			this._voiceTabSoundCollection.addProduct(_loc2_,false);
			dispatchEvent(new CoreEvent(CoreEvent.USER_SOUND_ADDED,this,param1));
		}
		
		public function removeSoundByAssetId(param1:String) : void
		{
			this._soundCollection.removeProductById(param1);
			dispatchEvent(new CoreEvent(CoreEvent.USER_SOUND_REMOVED,this));
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
			_loc2_.post(ServerConstants.ACTION_GET_USER_ASSETS_V2,_loc1_);
		}
		
		private function loadSound_completeHandler(param1:ServerRequestEvent) : void
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
				_loc5_.editable = true;
				_loc7_.addThumb(_loc5_);
				_loc9_ = new ThumbModel(_loc5_);
				this._soundCollection.addProduct(_loc9_);
				this._voiceTabSoundCollection.addProduct(_loc9_);
				_loc8_++;
			}
			this._nextSoundPage++;
			this.finishLoading();
			dispatchEvent(new CoreEvent(CoreEvent.USER_SOUND_COMPLETE,this));
		}
		
		public function addBackgroundByThumb(param1:BackgroundThumb) : void
		{
			param1.editable = true;
			this._backgroundCollection.addProduct(new ThumbModel(param1),false);
			dispatchEvent(new CoreEvent(CoreEvent.USER_BACKGROUND_ADDED,this,param1));
		}
		
		public function removeBackgroundByAssetId(param1:String) : void
		{
			this._backgroundCollection.removeProductById(param1);
			dispatchEvent(new CoreEvent(CoreEvent.USER_BACKGROUND_REMOVED,this));
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
			_loc2_.post(ServerConstants.ACTION_GET_USER_ASSETS_V2,_loc1_);
		}
		
		private function loadBackground_completeHandler(param1:ServerRequestEvent) : void
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
				_loc5_.editable = true;
				_loc7_.addThumb(_loc5_);
				this._backgroundCollection.addProduct(new ThumbModel(_loc5_));
				_loc8_++;
			}
			this._nextBackgroundPage++;
			this.finishLoading();
			dispatchEvent(new CoreEvent(CoreEvent.USER_BACKGROUND_COMPLETE,this));
		}
		
		public function addPropByThumb(param1:PropThumb) : void
		{
			param1.editable = true;
			this._propCollection.addProduct(new ThumbModel(param1),false);
			this._flowFrameImageCollection.addProduct(new ThumbModel(param1,"",false),false);
			dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_ADDED,this,param1));
		}
		
		public function removePropByAssetId(param1:String) : void
		{
			this.propSource.removeProductById(param1);
			dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_REMOVED,this));
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
			_loc2_.post(ServerConstants.ACTION_GET_USER_ASSETS_V2,_loc1_);
		}
		
		private function loadProp_completeHandler(param1:ServerRequestEvent) : void
		{
			var _loc5_:Thumb = null;
			var _loc6_:PropThumb = null;
			var _loc7_:XML = null;
			var _loc8_:String = null;
			var _loc2_:XML = new XML(param1.data.xml);
			if(this.checkXmlError(_loc2_))
			{
				return;
			}
			this._hasMoreProp = _loc2_.@more == "1";
			var _loc3_:XMLList = _loc2_.children();
			var _loc4_:int = _loc3_.length();
			var _loc9_:Theme = ThemeManager.instance.userTheme;
			var _loc10_:int = 0;
			for(; _loc10_ < _loc4_; _loc10_++)
			{
				_loc7_ = _loc3_[_loc10_];
				_loc8_ = String(_loc7_.name());
				_loc5_ = _loc8_ == FolderThumb.XML_NODE_NAME?new FolderThumb():new PropThumb();
				_loc5_.deSerialize(_loc7_,_loc9_);
				_loc5_.xml = _loc7_;
				_loc5_.editable = true;
				if(_loc5_ is PropThumb)
				{
					_loc6_ = _loc5_ as PropThumb;
					if(_loc6_.headable)
					{
						continue;
					}
				}
				_loc9_.addThumb(_loc5_);
				this._propCollection.addProduct(new ThumbModel(_loc5_));
				this._flowFrameImageCollection.addProduct(new ThumbModel(_loc5_,"",false));
			}
			this._nextPropPage++;
			this.finishLoading();
			dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_COMPLETE,this));
		}
		
		public function addBubbleByImporter(param1:BubbleThumb) : void
		{
			if(!param1)
			{
				return;
			}
			this.addBubbleByThumb(param1);
			dispatchEvent(new FontEvent(FontEvent.USER_FONT_ADDED,param1.aid,ThemeManager.instance.userTheme.id));
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
			dispatchEvent(new CoreEvent(CoreEvent.USER_BUBBLE_REMOVED,this));
			dispatchEvent(new FontEvent(FontEvent.USER_FONT_REMOVED,param1,ThemeManager.instance.userTheme.id));
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
				dispatchEvent(new CoreEvent(CoreEvent.USER_VIDEO_ADDED,this));
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
			dispatchEvent(new CoreEvent(CoreEvent.USER_VIDEO_REMOVED,this));
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
			_loc2_.post(ServerConstants.ACTION_GET_USER_ASSETS_V2,_loc1_);
		}
		
		private function loadVideo_completeHandler(param1:ServerRequestEvent) : void
		{
			var _loc5_:VideoPropThumb = null;
			var _loc6_:XML = null;
			var _loc8_:String = null;
			var _loc2_:XML = new XML(param1.data.xml);
			if(this.checkXmlError(_loc2_))
			{
				return;
			}
			this._hasMoreVideo = _loc2_.@moreVideoProp == "1";
			var _loc3_:XMLList = _loc2_.children();
			var _loc4_:int = _loc3_.length();
			var _loc7_:Theme = ThemeManager.instance.userTheme;
			var _loc9_:int = 0;
			while(_loc9_ < _loc4_)
			{
				_loc6_ = _loc3_[_loc9_];
				_loc8_ = String(_loc6_.name());
				if(_loc8_ == PropThumb.XML_NODE_NAME)
				{
					_loc5_ = new VideoPropThumb();
					_loc5_.deSerialize(_loc6_,_loc7_);
					_loc5_.xml = _loc6_;
					_loc5_.editable = true;
					_loc7_.addThumb(_loc5_,_loc6_);
					this.addVideoByThumb(_loc5_,true);
				}
				_loc9_++;
			}
			this._nextVideoPage++;
			this.finishLoading();
			dispatchEvent(new CoreEvent(CoreEvent.USER_VIDEO_COMPLETE,this));
		}
		
		public function loadBubble() : void
		{
			var _loc3_:BubbleThumb = null;
			var _loc1_:Array = FontManager.getFontManager().customQueue;
			var _loc2_:int = _loc1_.length;
			var _loc4_:int = 0;
			while(_loc4_ < _loc2_)
			{
				_loc3_ = this.createBubbleThumb(_loc1_[_loc4_]);
				this.addBubbleByThumb(_loc3_,true);
				_loc4_++;
			}
			dispatchEvent(new CoreEvent(CoreEvent.USER_BUBBLE_COMPLETE,this));
		}
		
		public function createBubbleThumb(param1:String) : BubbleThumb
		{
			var _loc3_:BubbleThumb = null;
			var _loc4_:FontModel = null;
			var _loc2_:Theme = ThemeManager.instance.userTheme;
			_loc3_ = new BubbleThumb();
			_loc4_ = FontManager.getFontManager().getFontModelByFontId(param1);
			_loc3_.id = _loc4_.value;
			_loc3_.encAssetId = _loc4_.encAssetId;
			_loc3_.aid = _loc4_.id;
			_loc3_.tags = _loc4_.tags;
			_loc3_.name = _loc4_.label;
			_loc3_.enable = _loc4_.enabled;
			_loc3_.editable = true;
			_loc3_.setFileName(_loc4_.id + ".swf");
			_loc3_.imageData = _loc3_.getDefaultBubbleBody(_loc4_.value);
			_loc3_.type = "BLANK";
			_loc3_.theme = _loc2_;
			_loc2_.addThumb(_loc3_);
			return _loc3_;
		}
		
		public function getStarterById(param1:String) : BackgroundThumb
		{
			return this._starterLookup[param1];
		}
		
		public function addStarterByThumb(param1:BackgroundThumb) : void
		{
			var _loc2_:ThumbModel = null;
			param1.editable = true;
			if(!this._starterLookup[param1.id])
			{
				_loc2_ = new ThumbModel(param1);
				this._starterLookup[param1.id] = _loc2_;
				this._backgroundCollection.addStarter(_loc2_,false);
			}
			dispatchEvent(new CoreEvent(CoreEvent.USER_STARTER_ADDED,this));
		}
		
		public function removeStarterByAssetId(param1:String) : void
		{
			this._backgroundCollection.removeStarterById(param1);
			dispatchEvent(new CoreEvent(CoreEvent.USER_STARTER_REMOVED,this));
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
			_loc2_.post(ServerConstants.ACTION_GET_USER_ASSETS_V2,_loc1_);
		}
		
		private function loadStarter_completeHandler(param1:ServerRequestEvent) : void
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
				_loc5_.editable = true;
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
			dispatchEvent(new CoreEvent(CoreEvent.USER_STARTER_COMPLETE,this));
		}
		
		public function loadCharacter() : void
		{
			this.startLoading();
			var _loc1_:URLVariables = this._configManager.createURLVariables();
			var _loc2_:UtilURLStream = new UtilURLStream();
			_loc2_.addEventListener(Event.COMPLETE,this.loadCharacter_completeHandler);
			_loc2_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
			_loc2_.addEventListener(UtilURLStream.TIME_OUT,this.common_errorHandler);
			_loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.common_errorHandler);
			_loc2_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.common_errorHandler);
			_loc1_["count"] = CHARACTER_PAGE_SIZE;
			_loc1_["page"] = this._nextCharacterPage;
			_loc1_["type"] = "char";
			var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_USER_ASSETS_XML);
			_loc3_.data = _loc1_;
			_loc3_.method = URLRequestMethod.POST;
			_loc2_.load(_loc3_);
		}
		
		private function loadCharacter_completeHandler(param1:Event) : void
		{
			var _loc8_:CharThumb = null;
			var _loc9_:XML = null;
			var _loc2_:UtilURLStream = UtilURLStream(param1.target);
			var _loc3_:ByteArray = new ByteArray();
			_loc2_.readBytes(_loc3_);
			_loc3_.position = 0;
			var _loc4_:int = _loc3_.readByte();
			if(_loc4_ == ERROR_CHECK_BYTE)
			{
				this.errorMessageHandler(_loc3_);
				return;
			}
			_loc3_.position = 0;
			var _loc5_:XML = new XML(_loc3_);
			if(this.checkXmlError(_loc5_))
			{
				return;
			}
			this._hasMoreCharacter = _loc5_.@more == "1";
			var _loc6_:XMLList = _loc5_.children();
			var _loc7_:int = _loc6_.length();
			var _loc10_:Theme = this._themeManager.userTheme;
			var _loc11_:int = 0;
			while(_loc11_ < _loc7_)
			{
				_loc9_ = _loc6_[_loc11_];
				_loc8_ = new CharThumb();
				_loc8_.deSerialize(_loc9_,_loc10_);
				_loc8_.xml = _loc9_;
				_loc8_.editable = true;
				this._characters.addItem(new ThumbModel(_loc8_));
				this._themeManager.ccTheme.addThumb(_loc8_,_loc5_);
				_loc11_++;
			}
			this._nextCharacterPage++;
			this.finishLoading();
			dispatchEvent(new CoreEvent(CoreEvent.USER_CHAR_COMPLETE,this));
		}
		
		public function deleteTempProp() : void
		{
		}
		
		public function addNewlyAddedAssetId(param1:String) : void
		{
			if(this._newlyAddedAssetIds == "")
			{
				this._newlyAddedAssetIds = this._newlyAddedAssetIds + param1;
			}
			else
			{
				this._newlyAddedAssetIds = this._newlyAddedAssetIds + ("," + param1);
			}
		}
		
		public function set uploadedAssetXML(param1:XML) : void
		{
			this._uploadedAssetXML = param1;
		}
		
		public function onGetCustomSoundCompleteByte(param1:ByteArray, param2:XML, param3:Boolean, param4:Boolean = true) : SoundThumb
		{
			var _loc5_:SoundThumb = new SoundThumb();
			this._uploadedAssetXML = param2;
			_loc5_.deSerializeByUserAssetXML(this._uploadedAssetXML,ThemeManager.instance.userTheme);
			_loc5_.enable = true;
			_loc5_.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoadThumbComplete);
			_loc5_.initSoundByByteArray(param1);
			return _loc5_;
		}
		
		private function onSoundThumbLoadThumbComplete(param1:Event) : void
		{
			var _loc2_:SoundThumb = param1.currentTarget as SoundThumb;
			if(_loc2_)
			{
				this.addSoundByThumb(_loc2_);
				this.addNewlyAddedAssetId(this._uploadedAssetXML.id);
				dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_COMPLETE,_loc2_));
			}
		}
		
		public function notifyUploadComplete() : void
		{
			dispatchEvent(new UploadStuffEvent(UploadStuffEvent.UPLOAD_STUFF_COMPLETE));
		}
	}
}
