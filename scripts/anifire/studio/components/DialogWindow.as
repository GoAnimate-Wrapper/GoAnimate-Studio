package anifire.studio.components
{
	import anifire.constant.ServerConstants;
	import anifire.event.ExtraDataEvent;
	import anifire.managers.AppConfigManager;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.AnimeSound;
	import anifire.studio.core.Character;
	import anifire.studio.core.Console;
	import anifire.studio.core.SoundThumb;
	import anifire.studio.core.sound.ImporterSoundAsset;
	import anifire.studio.core.sound.SoundEvent;
	import anifire.studio.core.sound.SoundThumbEvent;
	import anifire.studio.interfaces.ISpeechSubComponent;
	import anifire.studio.managers.TutorialManager;
	import anifire.util.UtilDict;
	import anifire.util.UtilErrorLogger;
	import anifire.util.UtilURLStream;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLStream;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Button;
	import spark.components.SkinnablePopUpContainer;
	
	use namespace mx_internal;
	
	public class DialogWindow extends SkinnablePopUpContainer implements IBindingClient, IStateClient2
	{
		
		private static var _instance:DialogWindow;
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _2082343164btnClose:Button;
		
		private var _796392160fileUploadComponent:FileUploadComponent;
		
		private var _119693320libComponent:UserVoiceLibComponent;
		
		private var _1496708709micRecordComponent:MicRecordingComponent;
		
		private var _1280086002trackComponent:VoiceTrackSelectionComponent;
		
		private var _719389622ttsComponent:TTSComponent;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var addedConsoleListeners:Boolean;
		
		private var _target:Object;
		
		private var _added:Boolean;
		
		private var _subType:String = "tts";
		
		private var _request:URLRequest;
		
		private var _stream:UtilURLStream;
		
		private var _editingSoundId:String = "";
		
		private var _1510507698_processing:Boolean = false;
		
		private var _tutorialManager:TutorialManager;
		
		private var _uploadedAssetXML:XML;
		
		private var _enc_assetId:String;
		
		private var _signature:String;
		
		private var _soundBytes:ByteArray;
		
		private var sound:ImporterSoundAsset;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function DialogWindow()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._request = new URLRequest(ServerConstants.ACTION_GET_ASSET_EX);
			this._stream = new UtilURLStream();
			this._tutorialManager = TutorialManager.instance;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._DialogWindow_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_DialogWindowWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return DialogWindow[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 400;
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._DialogWindow_Array2_c);
			this.currentState = "mic";
			this.addEventListener("creationComplete",this.___DialogWindow_SkinnablePopUpContainer1_creationComplete);
			states = [new State({
				"name":"mic",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"micRecordComponent",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"micRecordComponent",
					"name":"includeInLayout",
					"value":true
				})]
			}),new State({
				"name":"file",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"fileUploadComponent",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"fileUploadComponent",
					"name":"includeInLayout",
					"value":true
				})]
			}),new State({
				"name":"tts",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"ttsComponent",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"ttsComponent",
					"name":"includeInLayout",
					"value":true
				})]
			}),new State({
				"name":"lib",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"libComponent",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"libComponent",
					"name":"includeInLayout",
					"value":true
				})]
			}),new State({
				"name":"track",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"trackComponent",
					"name":"visible",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"trackComponent",
					"name":"includeInLayout",
					"value":true
				})]
			})];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function get instance() : DialogWindow
		{
			if(!_instance)
			{
				_instance = new DialogWindow();
			}
			return _instance;
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			DialogWindow._watcherSetupUtil = param1;
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
				this.backgroundAlpha = 0;
			};
		}
		
		override public function initialize() : void
		{
			super.initialize();
		}
		
		public function get editingSoundId() : String
		{
			return this._editingSoundId;
		}
		
		public function set editingSoundId(param1:String) : void
		{
			this._editingSoundId = param1;
		}
		
		private function set added(param1:Boolean) : void
		{
			if(this._added != param1)
			{
				this._added = param1;
			}
		}
		
		private function set subType(param1:String) : void
		{
			if(this._subType != param1)
			{
				this._subType = param1;
				currentState = this._subType;
			}
			this.activeSubComponent.addEventListener(SoundThumbEvent.SOUND_CREATED,this.onSoundCreated);
			this.activeSubComponent.addEventListener(Event.COMPLETE,this.onVoiceAdded);
			this.activeSubComponent.addEventListener(ExtraDataEvent.PROCESSING,this.onProcessing);
		}
		
		public function get target() : Object
		{
			return this._target;
		}
		
		public function trim(param1:String) : String
		{
			var _loc2_:int = 0;
			var _loc3_:int = param1.length - 1;
			if(_loc3_ < 1)
			{
				return "";
			}
			while(param1.charAt(_loc2_) < "!" && _loc2_ < param1.length)
			{
				_loc2_++;
			}
			while(param1.charAt(_loc3_) < "!" && _loc3_ >= 0)
			{
				_loc3_--;
			}
			if(_loc3_ < _loc2_)
			{
				return "";
			}
			return param1.substring(_loc2_,_loc3_ + 1);
		}
		
		private function init() : void
		{
			this._stream.addEventListener(Event.COMPLETE,this.onSoundDataComplete);
			this._stream.addEventListener(UtilURLStream.TIME_OUT,this.onSoundDataError);
			this._stream.addEventListener(IOErrorEvent.IO_ERROR,this.onSoundDataError);
			this._stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSoundDataError);
			this._stream.addEventListener(ProgressEvent.PROGRESS,this.onSoundDataProgress);
		}
		
		protected function closeWindow(param1:MouseEvent = null) : void
		{
			this.activeSubComponent.destroy();
			this.activeSubComponent.removeEventListener(Event.COMPLETE,this.onVoiceAdded);
			this.activeSubComponent.removeEventListener(ExtraDataEvent.PROCESSING,this.onProcessing);
			close(false);
		}
		
		public function setState(param1:String) : void
		{
			this.subType = param1;
			currentState = param1;
			this.updateChildUI();
		}
		
		private function onSoundAdded(param1:SoundEvent) : void
		{
			this.added = true;
			this._tutorialManager.notifyTutorialAction("voice_add");
		}
		
		private function onSoundRemoved(param1:SoundEvent) : void
		{
			this.added = false;
		}
		
		private function addConsoleListeners() : void
		{
			if(!this.addedConsoleListeners && Console.initialized)
			{
				Console.getConsole().speechManager.addEventListener(SoundEvent.ADDED,this.onSoundAdded);
				Console.getConsole().speechManager.addEventListener(SoundEvent.REMOVED,this.onSoundRemoved);
				this.addedConsoleListeners = true;
			}
		}
		
		public function set target(param1:Object) : void
		{
			var scene:AnimeScene = null;
			var character:Character = null;
			var charId:String = null;
			var soundId:String = null;
			var obj:Object = param1;
			this.addConsoleListeners();
			try
			{
				if(this._target != obj)
				{
					this._target = obj;
					visible = true;
					if(this._target is Character)
					{
						character = this._target as Character;
						scene = character.scene;
					}
					else if(this._target is AnimeScene)
					{
						scene = this._target as AnimeScene;
					}
					if(scene)
					{
						if(soundId && soundId != "")
						{
							this.added = true;
						}
						else
						{
							this.added = false;
						}
					}
					this._processing = false;
				}
				return;
			}
			catch(e:Error)
			{
				visible = false;
				UtilErrorLogger.getInstance().appendCustomError("SpeechComponent.updateUI failed.",e);
				return;
			}
		}
		
		private function onVoiceAdded(param1:Event) : void
		{
			this.dispatchEvent(param1);
			this._processing = false;
			close(true);
		}
		
		private function updateChildUI() : void
		{
			var sound:AnimeSound = null;
			try
			{
				visible = true;
				if(this._editingSoundId)
				{
					sound = Console.getConsole().getSoundById(this._editingSoundId);
				}
				if(this._subType == "tts")
				{
					this.ttsComponent.target = this._target;
					this.ttsComponent.soundId = this._editingSoundId;
				}
				else if(this._subType == "mic")
				{
					this.micRecordComponent.target = this._target;
					this.micRecordComponent.sound#1 = sound;
				}
				else if(this._subType == "file")
				{
					this.fileUploadComponent.target = this._target;
					this.fileUploadComponent.sound#1 = sound;
				}
				else if(this._subType == "lib")
				{
					this.libComponent.target = this._target;
					this.libComponent.sound#1 = sound;
				}
				else if(this._subType == "track")
				{
					this.trackComponent.target = this._target;
				}
				return;
			}
			catch(e:Error)
			{
				visible = false;
				UtilErrorLogger.getInstance().appendCustomError("SpeechComponent.updateChildUI failed.",e);
				return;
			}
		}
		
		protected function onTTSUploadComplete(param1:DataEvent) : void
		{
			this.processData(param1.data);
		}
		
		protected function onMicUploadComplete(param1:DataEvent) : void
		{
			this.processData(param1.data);
		}
		
		protected function onFileUploadComplete(param1:DataEvent) : void
		{
			this.processData(param1.data);
		}
		
		protected function processData(param1:String) : void
		{
			var variables:URLVariables = null;
			var loadProgress:StudioProgressBar = null;
			var errorMessage:String = null;
			var returnData:String = param1;
			var checkCode:String = returnData.substr(0,1);
			var respondXml:XML = new XML(returnData.substr(1));
			this._uploadedAssetXML = respondXml.name().toString() == "response"?respondXml.asset[0]:respondXml;
			if(checkCode == "0")
			{
				this._enc_assetId = this._uploadedAssetXML.enc_asset_id;
				this._signature = this._uploadedAssetXML.signature;
				if(this._enc_assetId != null && this.trim(this._enc_assetId).length > 0)
				{
					variables = AppConfigManager.instance.createURLVariables();
					if(variables.hasOwnProperty(ServerConstants.PARAM_ENC_ASSET_ID))
					{
						delete variables[ServerConstants.PARAM_ENC_ASSET_ID];
					}
					variables[ServerConstants.PARAM_ENC_ASSET_ID] = this._enc_assetId;
					variables[ServerConstants.PARAM_SIGNATURE] = this._signature;
					this._request.method = URLRequestMethod.POST;
					this._request.data = variables;
					this._stream.load(this._request);
					loadProgress = Console.getConsole().getLoadProgress;
					loadProgress.resetLabel();
					loadProgress.setLabal(UtilDict.toDisplay("go","downloading"));
				}
				else
				{
					throw new Error("Invalid Id to get the asset");
				}
			}
			else
			{
				try
				{
					errorMessage = respondXml.message;
				}
				catch(e:Error)
				{
					errorMessage = "An unknown error occured";
				}
				Console.getConsole().requestLoadStatus(false);
				AlertPopUp.openDefaultPopUp(errorMessage);
				this.activeSubComponent.destroy();
				this.activeSubComponent.currentState = "ready";
			}
		}
		
		private function onSoundDataProgress(param1:ProgressEvent) : void
		{
			if(param1.bytesLoaded < param1.bytesTotal)
			{
				this.activeSubComponent.loadProgress = Number(param1.bytesLoaded / param1.bytesTotal) * 100;
			}
		}
		
		private function onSoundDataError(param1:IOErrorEvent) : void
		{
		}
		
		private function onSoundDataComplete(param1:Event) : void
		{
			var _loc3_:URLStream = null;
			var _loc4_:SoundThumb = null;
			var _loc2_:StudioProgressBar = Console.getConsole().getLoadProgress;
			_loc2_.resetLabel();
			Console.getConsole().loadProgress = 100;
			_loc3_ = URLStream(param1.target);
			this._soundBytes = new ByteArray();
			_loc3_.readBytes(this._soundBytes);
			if(param1.type == Event.COMPLETE)
			{
				_loc4_ = Console.getConsole().onGetCustomAssetCompleteByte(this._soundBytes,this._uploadedAssetXML,false,false);
				if(this.activeSubComponent == this.ttsComponent || this.activeSubComponent == this.fileUploadComponent)
				{
					this.updateSoundThumb(_loc4_);
				}
				else
				{
					this.activeSubComponent.saveSoundBySoundThumb(_loc4_);
				}
				return;
			}
			throw new Error("load asset by id failed.");
		}
		
		protected function onSoundCreated(param1:SoundThumbEvent) : void
		{
			var _loc2_:SoundThumb = param1.soundThumb;
			var _loc3_:SoundThumbEvent = new SoundThumbEvent(SoundThumbEvent.SOUND_CREATED);
			_loc3_.soundThumb = _loc2_;
			_loc3_.volume = param1.volume;
			this.dispatchEvent(_loc3_);
			this._processing = false;
			close(true);
		}
		
		private function get activeSubComponent() : ISpeechSubComponent
		{
			switch(this._subType)
			{
				case "tts":
					return this.ttsComponent;
				case "mic":
					return this.micRecordComponent;
				case "file":
					return this.fileUploadComponent;
				case "lib":
					return this.libComponent;
				case "track":
					return this.trackComponent;
				default:
					return null;
			}
		}
		
		private function updateSoundThumb(param1:SoundThumb) : void
		{
			this.activeSubComponent.updateSoundThumb(param1);
		}
		
		private function onProcessing(param1:Event = null) : void
		{
			this._processing = true;
		}
		
		private function _DialogWindow_Array2_c() : Array
		{
			var _loc1_:Array = [this._DialogWindow_MicRecordingComponent1_i(),this._DialogWindow_FileUploadComponent1_i(),this._DialogWindow_TTSComponent1_i(),this._DialogWindow_UserVoiceLibComponent1_i(),this._DialogWindow_VoiceTrackSelectionComponent1_i(),this._DialogWindow_Button1_i()];
			return _loc1_;
		}
		
		private function _DialogWindow_MicRecordingComponent1_i() : MicRecordingComponent
		{
			var _loc1_:MicRecordingComponent = new MicRecordingComponent();
			_loc1_.percentWidth = 100;
			_loc1_.visible = false;
			_loc1_.includeInLayout = false;
			_loc1_.addEventListener("uploadCompleteData",this.__micRecordComponent_uploadCompleteData);
			_loc1_.addEventListener("close",this.__micRecordComponent_close);
			_loc1_.id = "micRecordComponent";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.micRecordComponent = _loc1_;
			BindingManager.executeBindings(this,"micRecordComponent",this.micRecordComponent);
			return _loc1_;
		}
		
		public function __micRecordComponent_uploadCompleteData(param1:DataEvent) : void
		{
			this.onMicUploadComplete(param1);
		}
		
		public function __micRecordComponent_close(param1:Event) : void
		{
			this.closeWindow();
		}
		
		private function _DialogWindow_FileUploadComponent1_i() : FileUploadComponent
		{
			var _loc1_:FileUploadComponent = new FileUploadComponent();
			_loc1_.percentWidth = 100;
			_loc1_.visible = false;
			_loc1_.includeInLayout = false;
			_loc1_.addEventListener("uploadCompleteData",this.__fileUploadComponent_uploadCompleteData);
			_loc1_.addEventListener("close",this.__fileUploadComponent_close);
			_loc1_.id = "fileUploadComponent";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.fileUploadComponent = _loc1_;
			BindingManager.executeBindings(this,"fileUploadComponent",this.fileUploadComponent);
			return _loc1_;
		}
		
		public function __fileUploadComponent_uploadCompleteData(param1:DataEvent) : void
		{
			this.onFileUploadComplete(param1);
		}
		
		public function __fileUploadComponent_close(param1:Event) : void
		{
			this.closeWindow();
		}
		
		private function _DialogWindow_TTSComponent1_i() : TTSComponent
		{
			var _loc1_:TTSComponent = new TTSComponent();
			_loc1_.percentWidth = 100;
			_loc1_.visible = false;
			_loc1_.includeInLayout = false;
			_loc1_.addEventListener("uploadCompleteData",this.__ttsComponent_uploadCompleteData);
			_loc1_.addEventListener("close",this.__ttsComponent_close);
			_loc1_.id = "ttsComponent";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.ttsComponent = _loc1_;
			BindingManager.executeBindings(this,"ttsComponent",this.ttsComponent);
			return _loc1_;
		}
		
		public function __ttsComponent_uploadCompleteData(param1:DataEvent) : void
		{
			this.onTTSUploadComplete(param1);
		}
		
		public function __ttsComponent_close(param1:Event) : void
		{
			this.closeWindow();
		}
		
		private function _DialogWindow_UserVoiceLibComponent1_i() : UserVoiceLibComponent
		{
			var _loc1_:UserVoiceLibComponent = new UserVoiceLibComponent();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.visible = false;
			_loc1_.includeInLayout = false;
			_loc1_.addEventListener("uploadCompleteData",this.__libComponent_uploadCompleteData);
			_loc1_.addEventListener("close",this.__libComponent_close);
			_loc1_.id = "libComponent";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.libComponent = _loc1_;
			BindingManager.executeBindings(this,"libComponent",this.libComponent);
			return _loc1_;
		}
		
		public function __libComponent_uploadCompleteData(param1:DataEvent) : void
		{
			this.onTTSUploadComplete(param1);
		}
		
		public function __libComponent_close(param1:Event) : void
		{
			this.closeWindow();
		}
		
		private function _DialogWindow_VoiceTrackSelectionComponent1_i() : VoiceTrackSelectionComponent
		{
			var _loc1_:VoiceTrackSelectionComponent = new VoiceTrackSelectionComponent();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.visible = false;
			_loc1_.includeInLayout = false;
			_loc1_.addEventListener("close",this.__trackComponent_close);
			_loc1_.id = "trackComponent";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.trackComponent = _loc1_;
			BindingManager.executeBindings(this,"trackComponent",this.trackComponent);
			return _loc1_;
		}
		
		public function __trackComponent_close(param1:Event) : void
		{
			this.closeWindow();
		}
		
		private function _DialogWindow_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.styleName = "closePopUp";
			_loc1_.buttonMode = true;
			_loc1_.top = 0;
			_loc1_.right = 0;
			_loc1_.width = 50;
			_loc1_.height = 50;
			_loc1_.addEventListener("click",this.__btnClose_click);
			_loc1_.id = "btnClose";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnClose = _loc1_;
			BindingManager.executeBindings(this,"btnClose",this.btnClose);
			return _loc1_;
		}
		
		public function __btnClose_click(param1:MouseEvent) : void
		{
			this.closeWindow(param1);
		}
		
		public function ___DialogWindow_SkinnablePopUpContainer1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _DialogWindow_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Boolean
			{
				return !_processing;
			},null,"btnClose.enabled");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get btnClose() : Button
		{
			return this._2082343164btnClose;
		}
		
		public function set btnClose(param1:Button) : void
		{
			var _loc2_:Object = this._2082343164btnClose;
			if(_loc2_ !== param1)
			{
				this._2082343164btnClose = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnClose",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get fileUploadComponent() : FileUploadComponent
		{
			return this._796392160fileUploadComponent;
		}
		
		public function set fileUploadComponent(param1:FileUploadComponent) : void
		{
			var _loc2_:Object = this._796392160fileUploadComponent;
			if(_loc2_ !== param1)
			{
				this._796392160fileUploadComponent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fileUploadComponent",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get libComponent() : UserVoiceLibComponent
		{
			return this._119693320libComponent;
		}
		
		public function set libComponent(param1:UserVoiceLibComponent) : void
		{
			var _loc2_:Object = this._119693320libComponent;
			if(_loc2_ !== param1)
			{
				this._119693320libComponent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"libComponent",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get micRecordComponent() : MicRecordingComponent
		{
			return this._1496708709micRecordComponent;
		}
		
		public function set micRecordComponent(param1:MicRecordingComponent) : void
		{
			var _loc2_:Object = this._1496708709micRecordComponent;
			if(_loc2_ !== param1)
			{
				this._1496708709micRecordComponent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"micRecordComponent",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get trackComponent() : VoiceTrackSelectionComponent
		{
			return this._1280086002trackComponent;
		}
		
		public function set trackComponent(param1:VoiceTrackSelectionComponent) : void
		{
			var _loc2_:Object = this._1280086002trackComponent;
			if(_loc2_ !== param1)
			{
				this._1280086002trackComponent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trackComponent",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get ttsComponent() : TTSComponent
		{
			return this._719389622ttsComponent;
		}
		
		public function set ttsComponent(param1:TTSComponent) : void
		{
			var _loc2_:Object = this._719389622ttsComponent;
			if(_loc2_ !== param1)
			{
				this._719389622ttsComponent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ttsComponent",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _processing() : Boolean
		{
			return this._1510507698_processing;
		}
		
		private function set _processing(param1:Boolean) : void
		{
			var _loc2_:Object = this._1510507698_processing;
			if(_loc2_ !== param1)
			{
				this._1510507698_processing = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_processing",_loc2_,param1));
				}
			}
		}
	}
}
