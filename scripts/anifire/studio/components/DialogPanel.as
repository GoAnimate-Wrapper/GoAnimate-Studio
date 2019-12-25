package anifire.studio.components
{
	import anifire.constant.CcLibConstant;
	import anifire.core.AssetLinkage;
	import anifire.event.StudioEvent;
	import anifire.managers.AmplitudeAnalyticsManager;
	import anifire.studio.commands.AddSpeechCommand;
	import anifire.studio.commands.RemoveLinkageCommand;
	import anifire.studio.commands.SwapSoundCommand;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.AnimeSound;
	import anifire.studio.core.Character;
	import anifire.studio.core.Console;
	import anifire.studio.core.SoundThumb;
	import anifire.studio.core.SpeechData;
	import anifire.studio.core.sound.SoundCollectionEvent;
	import anifire.studio.core.sound.SoundEvent;
	import anifire.studio.core.sound.SoundThumbEvent;
	import anifire.studio.managers.AnalyticsManager;
	import anifire.studio.managers.TutorialManager;
	import anifire.studio.skins.LinkSecondButtonSkin;
	import anifire.studio.skins.VoiceTabButtonSkin;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.FlexGlobals;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.managers.PopUpManager;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.components.supportClasses.ItemRenderer;
	import spark.events.PopUpEvent;
	import spark.events.RendererExistenceEvent;
	import spark.filters.DropShadowFilter;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class DialogPanel extends spark.components.NavigatorContent implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _DialogPanel_Button1:Button;
		
		public var _DialogPanel_Button2:Button;
		
		private var _573166710_DialogPanel_Group3:Group;
		
		public var _DialogPanel_IconButton1:IconButton;
		
		public var _DialogPanel_IconButton2:IconButton;
		
		public var _DialogPanel_IconButton3:IconButton;
		
		public var _DialogPanel_IconButton4:IconButton;
		
		public var _DialogPanel_Label1:Label;
		
		public var _DialogPanel_Label3:Label;
		
		public var _DialogPanel_Label4:Label;
		
		private var _861531420addSceneMessage:Label;
		
		private var _1184681627addSceneOverlay:Group;
		
		private var _1517038610addVoiceGroup:Group;
		
		private var _1929043277bannerGroup:Group;
		
		private var _513991335bannerNarrow:HGroup;
		
		private var _342885369btnExisting:IconButton;
		
		private var _1625230065clipGroup:Group;
		
		private var _1649906807controlBoard:VGroup;
		
		private var _1633444101controlTitle:VGroup;
		
		private var _1663301640groupBtnExisting:Group;
		
		private var _2133597457listOfAssignedVoice:VoiceAssignedList;
		
		private var _1625241110listOfUnAssignedVoice:VoiceAtBackgroundList;
		
		private var _1968315946overlapWarningGroup:Group;
		
		private var _1972414111overlapWarningLabel:Label;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _target:Object;
		
		private var _tutorialManager:TutorialManager;
		
		private var _dialogW:DialogWindow;
		
		private var _193192190soundsCollection:ArrayCollection;
		
		private var _348367298assignedVoiceCollection:ArrayCollection;
		
		private var _947765495unassignedVoiceCollection:ArrayCollection;
		
		private var _1215456337_showOverlapWarning:Boolean;
		
		private var _embed_mxml__styles_images_voicetab_voicebunny_logo_png_1538021845:Class;
		
		private var _embed_mxml__styles_images_voicetab_small_icon_no_voice_png_475815347:Class;
		
		private var _embed_mxml__styles_images_voicetab_arrow_png_1360059575:Class;
		
		private var _embed_mxml__styles_images_voicetab_small_uploadfile_png_1251868247:Class;
		
		private var _embed_mxml__styles_images_voicetab_inwhatlang_logo_png_1535408461:Class;
		
		private var _embed_mxml__styles_images_voicetab_small_tts_png_1149334323:Class;
		
		private var _embed_mxml__styles_images_voicetab_small_mic_png_1690711003:Class;
		
		private var _embed_mxml__styles_images_voicetab_small_yourlibrary_png_314740119:Class;
		
		private var _embed_mxml__styles_images_voicetab_small_lipsync_png_1032554667:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function DialogPanel()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._tutorialManager = TutorialManager.instance;
			this._193192190soundsCollection = new ArrayCollection();
			this._348367298assignedVoiceCollection = new ArrayCollection();
			this._947765495unassignedVoiceCollection = new ArrayCollection();
			this._embed_mxml__styles_images_voicetab_voicebunny_logo_png_1538021845 = DialogPanel__embed_mxml__styles_images_voicetab_voicebunny_logo_png_1538021845;
			this._embed_mxml__styles_images_voicetab_small_icon_no_voice_png_475815347 = DialogPanel__embed_mxml__styles_images_voicetab_small_icon_no_voice_png_475815347;
			this._embed_mxml__styles_images_voicetab_arrow_png_1360059575 = DialogPanel__embed_mxml__styles_images_voicetab_arrow_png_1360059575;
			this._embed_mxml__styles_images_voicetab_small_uploadfile_png_1251868247 = DialogPanel__embed_mxml__styles_images_voicetab_small_uploadfile_png_1251868247;
			this._embed_mxml__styles_images_voicetab_inwhatlang_logo_png_1535408461 = DialogPanel__embed_mxml__styles_images_voicetab_inwhatlang_logo_png_1535408461;
			this._embed_mxml__styles_images_voicetab_small_tts_png_1149334323 = DialogPanel__embed_mxml__styles_images_voicetab_small_tts_png_1149334323;
			this._embed_mxml__styles_images_voicetab_small_mic_png_1690711003 = DialogPanel__embed_mxml__styles_images_voicetab_small_mic_png_1690711003;
			this._embed_mxml__styles_images_voicetab_small_yourlibrary_png_314740119 = DialogPanel__embed_mxml__styles_images_voicetab_small_yourlibrary_png_314740119;
			this._embed_mxml__styles_images_voicetab_small_lipsync_png_1032554667 = DialogPanel__embed_mxml__styles_images_voicetab_small_lipsync_png_1032554667;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._DialogPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_DialogPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return DialogPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 310;
			this.percentHeight = 100;
			this.creationPolicy = "all";
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._DialogPanel_Array2_c);
			this.currentState = "notassigned";
			this.addEventListener("creationComplete",this.___DialogPanel_NavigatorContent1_creationComplete);
			states = [new State({
				"name":"notassigned",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_DialogPanel_Group3",
					"name":"includeInLayout",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"_DialogPanel_Group3",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"assigned",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"listOfAssignedVoice",
					"name":"includeInLayout",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"listOfAssignedVoice",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"showunassigned",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"listOfUnAssignedVoice",
					"name":"includeInLayout",
					"value":true
				}),new SetProperty().initializeFromObject({
					"target":"listOfUnAssignedVoice",
					"name":"visible",
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
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			DialogPanel._watcherSetupUtil = param1;
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
				this.backgroundColor = 16777215;
			};
		}
		
		override public function initialize() : void
		{
			super.initialize();
		}
		
		private function get dialogW() : DialogWindow
		{
			return this._dialogW;
		}
		
		private function init() : void
		{
			this._tutorialManager.registerComponent("dialog_panel",this);
			this._dialogW = DialogWindow.instance;
			this.dialogW.addEventListener(SoundThumbEvent.SOUND_CREATED,this.onSoundCreated);
			this.dialogW.addEventListener(PopUpEvent.CLOSE,this.onPopUpClose);
			this.dialogW.addEventListener(Event.COMPLETE,this.updateUI);
			var _loc1_:Console = Console.getConsole();
			_loc1_.speechManager.addEventListener(SoundEvent.ADDED,this.soundUpdateHandler);
			_loc1_.speechManager.addEventListener(SoundEvent.REMOVED,this.soundUpdateHandler);
			_loc1_.linkageController.eventDispatcher.addEventListener(SoundEvent.UPDATED,this.soundUpdateHandler);
			_loc1_.voices.addEventListener(SoundCollectionEvent.SOUND_ADDED,this.soundUpdateHandler);
			_loc1_.voices.addEventListener(SoundCollectionEvent.SOUND_REMOVED,this.soundUpdateHandler);
			_loc1_.voices.addEventListener(SoundCollectionEvent.SOUND_MOVED,this.soundUpdateHandler);
			this.onBaseResize();
		}
		
		public function set target(param1:Object) : void
		{
			if(this._target != param1)
			{
				this._target = param1;
				createDeferredContent();
			}
			this.updateUI();
		}
		
		private function includeVoiceAds() : void
		{
			if(UtilSite.isGoAnimate)
			{
				this.bannerGroup.visible = this.bannerGroup.includeInLayout = true;
			}
		}
		
		private function hasCollidedSound(param1:Array) : Boolean
		{
			var _loc5_:AnimeSound = null;
			var _loc6_:int = 0;
			var _loc7_:AnimeSound = null;
			var _loc2_:Console = Console.getConsole();
			var _loc3_:int = param1.length;
			var _loc4_:int = 0;
			while(_loc4_ < _loc3_)
			{
				_loc5_ = _loc2_.getSoundById(param1[_loc4_]);
				_loc6_ = _loc4_ + 1;
				while(_loc6_ < _loc3_)
				{
					_loc7_ = _loc2_.getSoundById(param1[_loc6_]);
					if(!(_loc5_.endFrame < _loc7_.startFrame || _loc5_.startFrame > _loc7_.endFrame))
					{
						return true;
					}
					_loc6_++;
				}
				_loc4_++;
			}
			return false;
		}
		
		private function updateUI(param1:Event = null) : void
		{
			var _loc3_:AnimeScene = null;
			var _loc4_:Character = null;
			var _loc5_:String = null;
			var _loc6_:Array = null;
			var _loc7_:Array = null;
			var _loc8_:int = 0;
			var _loc9_:int = 0;
			var _loc10_:AnimeSound = null;
			var _loc11_:Array = null;
			var _loc12_:Boolean = false;
			var _loc13_:int = 0;
			var _loc14_:AnimeSound = null;
			var _loc15_:AssetLinkage = null;
			this.btnExisting.visible = this.btnExisting.includeInLayout = true;
			this.groupBtnExisting.visible = this.groupBtnExisting.includeInLayout = true;
			this.includeVoiceAds();
			this.groupBtnExisting.toolTip = "";
			var _loc2_:Console = Console.getConsole();
			if(this._target is Character)
			{
				_loc4_ = this._target as Character;
				_loc3_ = _loc4_.scene;
			}
			else if(this._target is AnimeScene)
			{
				_loc3_ = this._target as AnimeScene;
			}
			if(_loc3_)
			{
				if(_loc4_)
				{
					_loc6_ = _loc2_.linkageController.getSoundIdByAssetId(_loc3_.id,_loc4_.id);
					_loc7_ = _loc2_.getAllSoundOverlapWithScene(_loc3_);
					if(_loc7_ && _loc7_.length > 0)
					{
						this.btnExisting.enabled = true;
					}
					if(_loc6_ && _loc6_.length > 0)
					{
						currentState = "assigned";
						this.updateCurrentSpeech();
						if(_loc6_.length > 1)
						{
							this._showOverlapWarning = this.hasCollidedSound(_loc6_);
						}
						else
						{
							this._showOverlapWarning = false;
						}
						this.addSceneOverlay.visible = true;
						this.closeControlBoard();
					}
					else
					{
						this._showOverlapWarning = false;
						if(_loc7_)
						{
							currentState = "notassigned";
							this.soundsCollection.source = _loc7_;
							this.soundsCollection.refresh();
							this.btnExisting.enabled = true;
							this.addSceneOverlay.visible = true;
						}
						else
						{
							currentState = "notassigned";
							this.btnExisting.enabled = false;
							this.addSceneOverlay.visible = false;
						}
						this.openControlBoard();
					}
					if(_loc7_)
					{
						_loc8_ = _loc7_.length;
						_loc9_ = _loc8_ - 1;
						while(_loc9_ >= 0)
						{
							_loc10_ = _loc7_[_loc9_];
							if(_loc6_.indexOf(_loc10_.id) > -1)
							{
								_loc7_.splice(_loc9_,1);
							}
							_loc9_--;
						}
						if(_loc7_.length <= 0)
						{
							this.btnExisting.enabled = false;
						}
					}
				}
				else
				{
					this._showOverlapWarning = false;
					this.btnExisting.visible = this.btnExisting.includeInLayout = false;
					this.groupBtnExisting.visible = this.groupBtnExisting.includeInLayout = false;
					_loc7_ = _loc2_.getAllSoundOverlapWithScene(_loc3_);
					_loc11_ = new Array();
					_loc12_ = false;
					if(_loc7_)
					{
						_loc13_ = 0;
						while(_loc13_ < _loc7_.length)
						{
							_loc14_ = _loc7_[_loc13_];
							_loc15_ = _loc2_.linkageController.getLinkageBySoundId(_loc14_.id);
							if(!_loc15_ || _loc15_.getCharId().length == 0)
							{
								_loc11_.push(_loc14_.id);
							}
							else
							{
								_loc12_ = true;
							}
							_loc13_++;
						}
					}
					if(_loc11_.length > 0)
					{
						currentState = "showunassigned";
						this.unassignedVoiceCollection.source = _loc11_;
						this.unassignedVoiceCollection.refresh();
						this.addSceneOverlay.visible = true;
						this.closeControlBoard();
					}
					else
					{
						currentState = "notassigned";
						if(_loc12_)
						{
							this.addSceneOverlay.visible = true;
						}
						else
						{
							this.addSceneOverlay.visible = false;
						}
						this.openControlBoard();
					}
				}
			}
			if(_loc4_ && CcLibConstant.ALL_NON_LIP_SYNC_THEMES.indexOf(_loc4_.thumb.themeId) > -1)
			{
				this.btnExisting.enabled = false;
				this.groupBtnExisting.toolTip = UtilDict.toDisplay("go","lip-sync is not available in this theme");
			}
		}
		
		private function editSoundHandler(param1:Event) : void
		{
			var _loc3_:SoundThumb = null;
			var _loc2_:ItemRenderer = param1.currentTarget as ItemRenderer;
			if(_loc2_ is VoiceAssignedItemRenderer)
			{
				_loc3_ = VoiceAssignedItemRenderer(_loc2_).soundThumb;
			}
			else if(_loc2_ is VoiceAtBackgroundItemRenderer)
			{
				_loc3_ = VoiceAtBackgroundItemRenderer(_loc2_).soundThumb;
			}
			if(_loc3_)
			{
				this.showPop(_loc3_.ttsData.type,_loc2_.data as String);
			}
		}
		
		private function getAssetIdBySpeechId(param1:String) : String
		{
			var _loc4_:Array = null;
			var _loc2_:String = "";
			var _loc3_:Array = Console.getConsole().linkageController.isLinkageExist(param1);
			if(_loc3_)
			{
				_loc4_ = _loc3_.concat();
				_loc4_.splice(_loc4_.indexOf(param1),1);
				_loc2_ = _loc4_.join("");
			}
			return _loc2_;
		}
		
		private function onDeleteHandler(param1:Event) : void
		{
			var _loc2_:ConfirmPopUp = new ConfirmPopUp();
			_loc2_.title = UtilDict.toDisplay("go","Delete Voice");
			_loc2_.message = UtilDict.toDisplay("go","Are you sure you want to delete this voice you added to this scene?");
			_loc2_.subMessage = UtilDict.toDisplay("go","Note: The corresponding voice clip will still remain available in your library for future use.");
			_loc2_.confirmText = UtilDict.toDisplay("go","delete");
			_loc2_.cancelText = UtilDict.toDisplay("go","cancel");
			_loc2_.addEventListener(StudioEvent.POPUP_CONFIRM,this.onConfirmDelete);
			_loc2_.showCloseButton = true;
			_loc2_.open(Console.getConsole().mainStage,true);
		}
		
		private function onConfirmDelete(param1:Event) : void
		{
		}
		
		private function addScene() : void
		{
			var _loc3_:SceneEditor = null;
			var _loc1_:Console = Console.getConsole();
			var _loc2_:Character = this._target as Character;
			if(_loc2_)
			{
				_loc3_ = _loc1_.mainStage.sceneEditor;
				_loc3_.preSelectedAssetIds = [_loc2_.id];
				_loc3_.showVoiceTab = true;
			}
			_loc1_.addNextScene();
		}
		
		private function updateCurrentSpeech(param1:Event = null) : void
		{
			var _loc2_:AnimeScene = null;
			var _loc3_:String = null;
			var _loc4_:Array = null;
			if(this._target is Character)
			{
				_loc2_ = Character(this._target).scene;
			}
			else if(this._target is AnimeScene)
			{
				_loc2_ = this._target as AnimeScene;
			}
			if(this._target)
			{
				if(this._target is Character)
				{
					_loc4_ = Console.getConsole().linkageController.getSoundIdByAssetId(_loc2_.id,Character(this._target).id);
				}
				else if(this._target is AnimeScene)
				{
					_loc4_ = Console.getConsole().linkageController.getSoundIdBySceneId(_loc2_.id);
				}
				this.assignedVoiceCollection.source = _loc4_;
			}
			if(_loc4_.length > 1)
			{
			}
		}
		
		private function showPop(param1:String, param2:String = "") : void
		{
			this.dialogW.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
			PopUpManager.centerPopUp(this.dialogW);
			this.dialogW.target = this._target;
			this.dialogW.editingSoundId = param2;
			this.dialogW.setState(param1);
		}
		
		private function onPopUpClose(param1:PopUpEvent) : void
		{
			this._tutorialManager.notifyTutorialAction("dialog_panel_popup");
		}
		
		private function onBaseResize() : void
		{
			this.bannerNarrow.visible = this.bannerNarrow.includeInLayout = true;
		}
		
		private function onClickInWhatLanguage() : void
		{
			if(ExternalInterface.available)
			{
				ExternalInterface.call("voiceBanner","iw");
			}
		}
		
		private function onClickVoiceBunny() : void
		{
			if(ExternalInterface.available)
			{
				ExternalInterface.call("voiceBanner","vb");
			}
		}
		
		protected function soundUpdateHandler(param1:Event) : void
		{
			this.updateUI();
		}
		
		protected function onSoundCreated(param1:SoundThumbEvent) : void
		{
			var _loc5_:String = null;
			var _loc6_:String = null;
			var _loc7_:String = null;
			var _loc10_:AnimeSound = null;
			var _loc11_:SwapSoundCommand = null;
			var _loc2_:Console = Console.getConsole();
			var _loc3_:SoundThumb = param1.soundThumb;
			if(this.dialogW.editingSoundId != "")
			{
				_loc10_ = _loc2_.getSoundById(this.dialogW.editingSoundId);
				_loc11_ = new SwapSoundCommand(_loc10_,_loc3_);
				_loc11_.execute();
			}
			else
			{
				_loc2_.addSpeechAtScene(_loc3_,_loc2_.currentScene,this._target as Character,true,param1.volume);
			}
			var _loc4_:String = "Add Voice Clip";
			if(this._target is Character)
			{
				_loc5_ = "Add to Character";
			}
			else if(this._target is AnimeScene)
			{
				_loc5_ = "Add as Narration";
			}
			switch(_loc3_.ttsData.type)
			{
				case SpeechData.SOURCE_TYPE_LIB:
					_loc6_ = "User\'s library";
					_loc7_ = "from_library";
					break;
				case SpeechData.SOURCE_TYPE_MIC_RECORDING:
					_loc6_ = "Mic Recording";
					_loc7_ = "mic";
					break;
				case SpeechData.SOURCE_TYPE_TTS:
					_loc6_ = "TTS";
					_loc7_ = "tts";
					break;
				case SpeechData.SOURCE_TYPE_VOICE_FILE:
					_loc6_ = "File Import";
					_loc7_ = "import";
					break;
				default:
					_loc6_ = "default";
					_loc7_ = "default";
			}
			var _loc8_:* = _loc3_.duration * 0.001 + "s";
			AnalyticsManager.instance.trackEventByUserGroup(_loc5_,_loc6_,_loc4_,_loc8_);
			var _loc9_:Object = {"input":_loc7_};
			AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_ADD_VOICE_TO_SCENE,_loc9_);
			this.updateUI();
		}
		
		protected function refreshItem(param1:Event) : void
		{
			if(!(param1.currentTarget is DialogItemRenderer))
			{
				if(param1.currentTarget is VoiceAssignedItemRenderer)
				{
					VoiceAssignedItemRenderer(param1.currentTarget).init(Character(this._target));
				}
			}
		}
		
		protected function onRendererAdd(param1:RendererExistenceEvent) : void
		{
			param1.renderer.addEventListener("addLinkage",this.addLinkage);
			param1.renderer.addEventListener("removeLinkage",this.removeLinkage);
			param1.renderer.addEventListener("data_change",this.refreshItem);
			param1.renderer.addEventListener("removeSound",this.updateUI);
			param1.renderer.addEventListener("editSound",this.editSoundHandler);
			if(!(param1.renderer is DialogItemRenderer))
			{
				if(param1.renderer is VoiceAssignedItemRenderer)
				{
					VoiceAssignedItemRenderer(param1.renderer).init(Character(this._target));
				}
			}
		}
		
		protected function onRendererRemove(param1:RendererExistenceEvent) : void
		{
			param1.renderer.removeEventListener("addLinkage",this.addLinkage);
			param1.renderer.removeEventListener("removeLinkage",this.removeLinkage);
			param1.renderer.removeEventListener("data_change",this.refreshItem);
			param1.renderer.removeEventListener("removeSound",this.updateUI);
			param1.renderer.removeEventListener("editSound",this.editSoundHandler);
		}
		
		protected function addLinkage(param1:Event) : void
		{
			var _loc4_:AnimeScene = null;
			var _loc5_:Character = null;
			var _loc7_:AddSpeechCommand = null;
			var _loc2_:DialogItemRenderer = param1.currentTarget as DialogItemRenderer;
			var _loc3_:AnimeSound = _loc2_.data as AnimeSound;
			if(this._target is Character)
			{
				_loc5_ = this._target as Character;
				_loc4_ = _loc5_.scene;
			}
			else if(this._target is AnimeScene)
			{
				_loc4_ = this._target as AnimeScene;
			}
			var _loc6_:SpeechData = new SpeechData();
			_loc6_.type = SpeechData.SOURCE_TYPE_LIB;
			_loc3_.soundThumb.ttsData = _loc6_;
			if(_loc5_)
			{
				Console.getConsole().speechManager.addSoundAtAllScene(_loc3_,_loc5_.id);
			}
			else
			{
				_loc7_ = new AddSpeechCommand(_loc3_);
				_loc7_.execute();
			}
			this.updateUI();
		}
		
		protected function removeLinkage(param1:Event) : void
		{
			var _loc4_:Character = null;
			var _loc5_:RemoveLinkageCommand = null;
			var _loc2_:VoiceAssignedItemRenderer = param1.currentTarget as VoiceAssignedItemRenderer;
			var _loc3_:String = _loc2_.data as String;
			if(this._target is Character)
			{
				_loc4_ = this._target as Character;
				_loc5_ = new RemoveLinkageCommand(_loc4_,_loc3_);
				_loc5_.execute();
			}
			this.updateUI();
		}
		
		protected function onAddMoreSound() : void
		{
			currentState = "notassigned";
		}
		
		protected function onListCurrSound() : void
		{
		}
		
		protected function backButton_clickHandler(param1:Event) : void
		{
		}
		
		protected function addSceneButton_clickHandler(param1:MouseEvent) : void
		{
			this.addScene();
		}
		
		protected function hideAddSceneOverlay() : void
		{
			this.addSceneOverlay.visible = false;
		}
		
		protected function onClickTab(param1:Event) : void
		{
			if(this.addVoiceGroup.includeInLayout)
			{
				this.closeControlBoard();
			}
			else
			{
				this.openControlBoard();
			}
		}
		
		protected function closeControlBoard() : void
		{
			this.addVoiceGroup.includeInLayout = false;
		}
		
		protected function openControlBoard() : void
		{
			this.addVoiceGroup.includeInLayout = true;
		}
		
		private function _DialogPanel_Array2_c() : Array
		{
			var _loc1_:Array = [this._DialogPanel_Group1_i()];
			return _loc1_;
		}
		
		private function _DialogPanel_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.clipAndEnableScrolling = true;
			_loc1_.mxmlContent = [this._DialogPanel_Group2_c()];
			_loc1_.id = "clipGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.clipGroup = _loc1_;
			BindingManager.executeBindings(this,"clipGroup",this.clipGroup);
			return _loc1_;
		}
		
		private function _DialogPanel_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 310;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._DialogPanel_VGroup1_c(),this._DialogPanel_VGroup2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _DialogPanel_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.width = 310;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._DialogPanel_Group3_i(),this._DialogPanel_Group4_i(),this._DialogPanel_VoiceAssignedList1_i(),this._DialogPanel_VoiceAtBackgroundList1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _DialogPanel_Group3_i() : Group
		{
			var _loc1_:Group = null;
			_loc1_ = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.includeInLayout = false;
			_loc1_.minHeight = 40;
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._DialogPanel_HGroup1_c()];
			_loc1_.id = "_DialogPanel_Group3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_Group3 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_Group3",this._DialogPanel_Group3);
			return _loc1_;
		}
		
		private function _DialogPanel_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.horizontalAlign = "center";
			_loc1_.horizontalCenter = 0;
			_loc1_.paddingBottom = 12;
			_loc1_.paddingTop = 12;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._DialogPanel_BitmapImage1_c(),this._DialogPanel_Label1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _DialogPanel_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_voicetab_small_icon_no_voice_png_475815347;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _DialogPanel_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("color",11119017);
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.id = "_DialogPanel_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_Label1",this._DialogPanel_Label1);
			return _loc1_;
		}
		
		private function _DialogPanel_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._DialogPanel_Rect1_c(),this._DialogPanel_Label2_i()];
			_loc1_.id = "overlapWarningGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.overlapWarningGroup = _loc1_;
			BindingManager.executeBindings(this,"overlapWarningGroup",this.overlapWarningGroup);
			return _loc1_;
		}
		
		private function _DialogPanel_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.bottom = 5;
			_loc1_.left = 5;
			_loc1_.right = 5;
			_loc1_.top = 5;
			_loc1_.radiusX = 4;
			_loc1_.radiusY = 4;
			_loc1_.fill = this._DialogPanel_SolidColor1_c();
			_loc1_.stroke = this._DialogPanel_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _DialogPanel_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15916766;
			return _loc1_;
		}
		
		private function _DialogPanel_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 15453393;
			return _loc1_;
		}
		
		private function _DialogPanel_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("color",11093058);
			_loc1_.setStyle("paddingBottom",10);
			_loc1_.setStyle("paddingLeft",10);
			_loc1_.setStyle("paddingRight",10);
			_loc1_.setStyle("paddingTop",10);
			_loc1_.id = "overlapWarningLabel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.overlapWarningLabel = _loc1_;
			BindingManager.executeBindings(this,"overlapWarningLabel",this.overlapWarningLabel);
			return _loc1_;
		}
		
		private function _DialogPanel_VoiceAssignedList1_i() : VoiceAssignedList
		{
			var _loc1_:VoiceAssignedList = new VoiceAssignedList();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.includeInLayout = false;
			_loc1_.visible = false;
			_loc1_.addEventListener("rendererAdd",this.__listOfAssignedVoice_rendererAdd);
			_loc1_.addEventListener("rendererRemove",this.__listOfAssignedVoice_rendererRemove);
			_loc1_.id = "listOfAssignedVoice";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.listOfAssignedVoice = _loc1_;
			BindingManager.executeBindings(this,"listOfAssignedVoice",this.listOfAssignedVoice);
			return _loc1_;
		}
		
		public function __listOfAssignedVoice_rendererAdd(param1:RendererExistenceEvent) : void
		{
			this.onRendererAdd(param1);
		}
		
		public function __listOfAssignedVoice_rendererRemove(param1:RendererExistenceEvent) : void
		{
			this.onRendererRemove(param1);
		}
		
		private function _DialogPanel_VoiceAtBackgroundList1_i() : VoiceAtBackgroundList
		{
			var _loc1_:VoiceAtBackgroundList = new VoiceAtBackgroundList();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.includeInLayout = false;
			_loc1_.visible = false;
			_loc1_.addEventListener("rendererAdd",this.__listOfUnAssignedVoice_rendererAdd);
			_loc1_.addEventListener("rendererRemove",this.__listOfUnAssignedVoice_rendererRemove);
			_loc1_.id = "listOfUnAssignedVoice";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.listOfUnAssignedVoice = _loc1_;
			BindingManager.executeBindings(this,"listOfUnAssignedVoice",this.listOfUnAssignedVoice);
			return _loc1_;
		}
		
		public function __listOfUnAssignedVoice_rendererAdd(param1:RendererExistenceEvent) : void
		{
			this.onRendererAdd(param1);
		}
		
		public function __listOfUnAssignedVoice_rendererRemove(param1:RendererExistenceEvent) : void
		{
			this.onRendererRemove(param1);
		}
		
		private function _DialogPanel_VGroup2_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.bottom = 0;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._DialogPanel_Group5_c(),this._DialogPanel_Group6_i()];
			_loc1_.id = "controlBoard";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.controlBoard = _loc1_;
			BindingManager.executeBindings(this,"controlBoard",this.controlBoard);
			return _loc1_;
		}
		
		private function _DialogPanel_Group5_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mouseEnabled = true;
			_loc1_.mouseChildren = false;
			_loc1_.buttonMode = true;
			_loc1_.useHandCursor = true;
			_loc1_.filters = [this._DialogPanel_DropShadowFilter1_c()];
			_loc1_.mxmlContent = [this._DialogPanel_Rect2_c(),this._DialogPanel_VGroup3_i()];
			_loc1_.addEventListener("click",this.___DialogPanel_Group5_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _DialogPanel_DropShadowFilter1_c() : DropShadowFilter
		{
			var _loc1_:DropShadowFilter = new DropShadowFilter();
			_loc1_.angle = 90;
			_loc1_.distance = 2;
			_loc1_.color = 11184810;
			return _loc1_;
		}
		
		private function _DialogPanel_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._DialogPanel_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _DialogPanel_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 3233154;
			return _loc1_;
		}
		
		private function _DialogPanel_VGroup3_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.height = 40;
			_loc1_.horizontalAlign = "center";
			_loc1_.paddingBottom = 7;
			_loc1_.paddingLeft = 14;
			_loc1_.paddingRight = 14;
			_loc1_.paddingTop = 7;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._DialogPanel_Label3_i(),this._DialogPanel_BitmapImage2_c()];
			_loc1_.id = "controlTitle";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.controlTitle = _loc1_;
			BindingManager.executeBindings(this,"controlTitle",this.controlTitle);
			return _loc1_;
		}
		
		private function _DialogPanel_Label3_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.horizontalCenter = 0;
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("fontSize",12);
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.id = "_DialogPanel_Label3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_Label3 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_Label3",this._DialogPanel_Label3);
			return _loc1_;
		}
		
		private function _DialogPanel_BitmapImage2_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_voicetab_arrow_png_1360059575;
			_loc1_.horizontalCenter = 0;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		public function ___DialogPanel_Group5_click(param1:MouseEvent) : void
		{
			this.onClickTab(param1);
		}
		
		private function _DialogPanel_Group6_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._DialogPanel_VGroup4_c(),this._DialogPanel_Group9_i()];
			_loc1_.id = "addVoiceGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.addVoiceGroup = _loc1_;
			BindingManager.executeBindings(this,"addVoiceGroup",this.addVoiceGroup);
			return _loc1_;
		}
		
		private function _DialogPanel_VGroup4_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._DialogPanel_IconButton1_i(),this._DialogPanel_IconButton2_i(),this._DialogPanel_IconButton3_i(),this._DialogPanel_IconButton4_i(),this._DialogPanel_Group7_i(),this._DialogPanel_Group8_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _DialogPanel_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.percentWidth = 100;
			_loc1_.height = 45;
			_loc1_.enabled = true;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_small_mic_png_1690711003);
			_loc1_.setStyle("skinClass",VoiceTabButtonSkin);
			_loc1_.addEventListener("click",this.___DialogPanel_IconButton1_click);
			_loc1_.id = "_DialogPanel_IconButton1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_IconButton1 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_IconButton1",this._DialogPanel_IconButton1);
			return _loc1_;
		}
		
		public function ___DialogPanel_IconButton1_click(param1:MouseEvent) : void
		{
			this.showPop("mic");
		}
		
		private function _DialogPanel_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.percentWidth = 100;
			_loc1_.height = 45;
			_loc1_.enabled = true;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_small_uploadfile_png_1251868247);
			_loc1_.setStyle("skinClass",VoiceTabButtonSkin);
			_loc1_.addEventListener("click",this.___DialogPanel_IconButton2_click);
			_loc1_.id = "_DialogPanel_IconButton2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_IconButton2 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_IconButton2",this._DialogPanel_IconButton2);
			return _loc1_;
		}
		
		public function ___DialogPanel_IconButton2_click(param1:MouseEvent) : void
		{
			this.showPop("file");
		}
		
		private function _DialogPanel_IconButton3_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.percentWidth = 100;
			_loc1_.height = 45;
			_loc1_.enabled = true;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_small_yourlibrary_png_314740119);
			_loc1_.setStyle("skinClass",VoiceTabButtonSkin);
			_loc1_.addEventListener("click",this.___DialogPanel_IconButton3_click);
			_loc1_.id = "_DialogPanel_IconButton3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_IconButton3 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_IconButton3",this._DialogPanel_IconButton3);
			return _loc1_;
		}
		
		public function ___DialogPanel_IconButton3_click(param1:MouseEvent) : void
		{
			this.showPop("lib");
		}
		
		private function _DialogPanel_IconButton4_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.percentWidth = 100;
			_loc1_.height = 45;
			_loc1_.enabled = true;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_small_tts_png_1149334323);
			_loc1_.setStyle("skinClass",VoiceTabButtonSkin);
			_loc1_.addEventListener("click",this.___DialogPanel_IconButton4_click);
			_loc1_.id = "_DialogPanel_IconButton4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_IconButton4 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_IconButton4",this._DialogPanel_IconButton4);
			return _loc1_;
		}
		
		public function ___DialogPanel_IconButton4_click(param1:MouseEvent) : void
		{
			this.showPop("tts");
		}
		
		private function _DialogPanel_Group7_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.height = 45;
			_loc1_.mxmlContent = [this._DialogPanel_IconButton5_i()];
			_loc1_.id = "groupBtnExisting";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.groupBtnExisting = _loc1_;
			BindingManager.executeBindings(this,"groupBtnExisting",this.groupBtnExisting);
			return _loc1_;
		}
		
		private function _DialogPanel_IconButton5_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.percentWidth = 100;
			_loc1_.height = 45;
			_loc1_.enabled = true;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_small_lipsync_png_1032554667);
			_loc1_.setStyle("skinClass",VoiceTabButtonSkin);
			_loc1_.addEventListener("click",this.__btnExisting_click);
			_loc1_.id = "btnExisting";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.btnExisting = _loc1_;
			BindingManager.executeBindings(this,"btnExisting",this.btnExisting);
			return _loc1_;
		}
		
		public function __btnExisting_click(param1:MouseEvent) : void
		{
			this.showPop("track");
		}
		
		private function _DialogPanel_Group8_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._DialogPanel_Rect3_c(),this._DialogPanel_HGroup2_i()];
			_loc1_.id = "bannerGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.bannerGroup = _loc1_;
			BindingManager.executeBindings(this,"bannerGroup",this.bannerGroup);
			return _loc1_;
		}
		
		private function _DialogPanel_Rect3_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._DialogPanel_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _DialogPanel_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _DialogPanel_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.height = 30;
			_loc1_.left = 10;
			_loc1_.right = 10;
			_loc1_.verticalAlign = "middle";
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._DialogPanel_Label4_i(),this._DialogPanel_IconButton6_c(),this._DialogPanel_IconButton7_c()];
			_loc1_.id = "bannerNarrow";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.bannerNarrow = _loc1_;
			BindingManager.executeBindings(this,"bannerNarrow",this.bannerNarrow);
			return _loc1_;
		}
		
		private function _DialogPanel_Label4_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",5267059);
			_loc1_.setStyle("fontSize",12);
			_loc1_.setStyle("textAlign","justify");
			_loc1_.id = "_DialogPanel_Label4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_Label4 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_Label4",this._DialogPanel_Label4);
			return _loc1_;
		}
		
		private function _DialogPanel_IconButton6_c() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.percentHeight = 100;
			_loc1_.enabled = true;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_inwhatlang_logo_png_1535408461);
			_loc1_.addEventListener("click",this.___DialogPanel_IconButton6_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___DialogPanel_IconButton6_click(param1:MouseEvent) : void
		{
			this.onClickInWhatLanguage();
		}
		
		private function _DialogPanel_IconButton7_c() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.percentHeight = 100;
			_loc1_.enabled = true;
			_loc1_.horizontalCenter = -1;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_voicebunny_logo_png_1538021845);
			_loc1_.addEventListener("click",this.___DialogPanel_IconButton7_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___DialogPanel_IconButton7_click(param1:MouseEvent) : void
		{
			this.onClickVoiceBunny();
		}
		
		private function _DialogPanel_Group9_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._DialogPanel_Rect4_c(),this._DialogPanel_VGroup5_c(),this._DialogPanel_Button2_i()];
			_loc1_.id = "addSceneOverlay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.addSceneOverlay = _loc1_;
			BindingManager.executeBindings(this,"addSceneOverlay",this.addSceneOverlay);
			return _loc1_;
		}
		
		private function _DialogPanel_Rect4_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._DialogPanel_SolidColor4_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _DialogPanel_SolidColor4_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 0;
			_loc1_.alpha = 0.75;
			return _loc1_;
		}
		
		private function _DialogPanel_VGroup5_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.horizontalAlign = "center";
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalAlign = "middle";
			_loc1_.verticalCenter = 0;
			_loc1_.gap = 18;
			_loc1_.mxmlContent = [this._DialogPanel_Label5_i(),this._DialogPanel_Button1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _DialogPanel_Label5_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 80;
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("fontSize",13);
			_loc1_.setStyle("lineBreak","toFit");
			_loc1_.id = "addSceneMessage";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.addSceneMessage = _loc1_;
			BindingManager.executeBindings(this,"addSceneMessage",this.addSceneMessage);
			return _loc1_;
		}
		
		private function _DialogPanel_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.addEventListener("click",this.___DialogPanel_Button1_click);
			_loc1_.id = "_DialogPanel_Button1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_Button1 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_Button1",this._DialogPanel_Button1);
			return _loc1_;
		}
		
		public function ___DialogPanel_Button1_click(param1:MouseEvent) : void
		{
			this.addScene();
		}
		
		private function _DialogPanel_Button2_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.bottom = 4;
			_loc1_.right = 4;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("fontSize",14);
			_loc1_.setStyle("skinClass",LinkSecondButtonSkin);
			_loc1_.addEventListener("click",this.___DialogPanel_Button2_click);
			_loc1_.id = "_DialogPanel_Button2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._DialogPanel_Button2 = _loc1_;
			BindingManager.executeBindings(this,"_DialogPanel_Button2",this._DialogPanel_Button2);
			return _loc1_;
		}
		
		public function ___DialogPanel_Button2_click(param1:MouseEvent) : void
		{
			this.hideAddSceneOverlay();
		}
		
		public function ___DialogPanel_NavigatorContent1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _DialogPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","No voice yet");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_Label1.text");
			result[1] = new Binding(this,function():Boolean
			{
				return _showOverlapWarning;
			},null,"overlapWarningGroup.includeInLayout");
			result[2] = new Binding(this,function():Boolean
			{
				return _showOverlapWarning;
			},null,"overlapWarningGroup.visible");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Voice clips are overlapping. Lip-sync is disabled. Un-assign one or drag the audio to re-activate.");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"overlapWarningLabel.text");
			result[4] = new Binding(this,function():IList
			{
				return assignedVoiceCollection;
			},null,"listOfAssignedVoice.dataProvider");
			result[5] = new Binding(this,function():IList
			{
				return unassignedVoiceCollection;
			},null,"listOfUnAssignedVoice.dataProvider");
			result[6] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add a voice");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_Label3.text");
			result[7] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Mic recording");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_IconButton1.label");
			result[8] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Upload file");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_IconButton2.label");
			result[9] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Your library");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_IconButton3.label");
			result[10] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","TEXT-TO-SPEECH");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_IconButton4.label");
			result[11] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Lip-sync with existing voice clip");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"btnExisting.label");
			result[12] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Hire voice talent:");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_Label4.text");
			result[13] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","This scene already includes a voice clip. Add a scene to make it easy to manage the timing of your video.");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"addSceneMessage.text");
			result[14] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","ADD SCENE");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_Button1.label");
			result[15] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Skip");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_DialogPanel_Button2.label");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _DialogPanel_Group3() : Group
		{
			return this._573166710_DialogPanel_Group3;
		}
		
		public function set _DialogPanel_Group3(param1:Group) : void
		{
			var _loc2_:Object = this._573166710_DialogPanel_Group3;
			if(_loc2_ !== param1)
			{
				this._573166710_DialogPanel_Group3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DialogPanel_Group3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get addSceneMessage() : Label
		{
			return this._861531420addSceneMessage;
		}
		
		public function set addSceneMessage(param1:Label) : void
		{
			var _loc2_:Object = this._861531420addSceneMessage;
			if(_loc2_ !== param1)
			{
				this._861531420addSceneMessage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addSceneMessage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get addSceneOverlay() : Group
		{
			return this._1184681627addSceneOverlay;
		}
		
		public function set addSceneOverlay(param1:Group) : void
		{
			var _loc2_:Object = this._1184681627addSceneOverlay;
			if(_loc2_ !== param1)
			{
				this._1184681627addSceneOverlay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addSceneOverlay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get addVoiceGroup() : Group
		{
			return this._1517038610addVoiceGroup;
		}
		
		public function set addVoiceGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1517038610addVoiceGroup;
			if(_loc2_ !== param1)
			{
				this._1517038610addVoiceGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addVoiceGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get bannerGroup() : Group
		{
			return this._1929043277bannerGroup;
		}
		
		public function set bannerGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1929043277bannerGroup;
			if(_loc2_ !== param1)
			{
				this._1929043277bannerGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bannerGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get bannerNarrow() : HGroup
		{
			return this._513991335bannerNarrow;
		}
		
		public function set bannerNarrow(param1:HGroup) : void
		{
			var _loc2_:Object = this._513991335bannerNarrow;
			if(_loc2_ !== param1)
			{
				this._513991335bannerNarrow = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bannerNarrow",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get btnExisting() : IconButton
		{
			return this._342885369btnExisting;
		}
		
		public function set btnExisting(param1:IconButton) : void
		{
			var _loc2_:Object = this._342885369btnExisting;
			if(_loc2_ !== param1)
			{
				this._342885369btnExisting = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnExisting",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get clipGroup() : Group
		{
			return this._1625230065clipGroup;
		}
		
		public function set clipGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1625230065clipGroup;
			if(_loc2_ !== param1)
			{
				this._1625230065clipGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clipGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get controlBoard() : VGroup
		{
			return this._1649906807controlBoard;
		}
		
		public function set controlBoard(param1:VGroup) : void
		{
			var _loc2_:Object = this._1649906807controlBoard;
			if(_loc2_ !== param1)
			{
				this._1649906807controlBoard = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlBoard",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get controlTitle() : VGroup
		{
			return this._1633444101controlTitle;
		}
		
		public function set controlTitle(param1:VGroup) : void
		{
			var _loc2_:Object = this._1633444101controlTitle;
			if(_loc2_ !== param1)
			{
				this._1633444101controlTitle = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlTitle",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get groupBtnExisting() : Group
		{
			return this._1663301640groupBtnExisting;
		}
		
		public function set groupBtnExisting(param1:Group) : void
		{
			var _loc2_:Object = this._1663301640groupBtnExisting;
			if(_loc2_ !== param1)
			{
				this._1663301640groupBtnExisting = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupBtnExisting",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get listOfAssignedVoice() : VoiceAssignedList
		{
			return this._2133597457listOfAssignedVoice;
		}
		
		public function set listOfAssignedVoice(param1:VoiceAssignedList) : void
		{
			var _loc2_:Object = this._2133597457listOfAssignedVoice;
			if(_loc2_ !== param1)
			{
				this._2133597457listOfAssignedVoice = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listOfAssignedVoice",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get listOfUnAssignedVoice() : VoiceAtBackgroundList
		{
			return this._1625241110listOfUnAssignedVoice;
		}
		
		public function set listOfUnAssignedVoice(param1:VoiceAtBackgroundList) : void
		{
			var _loc2_:Object = this._1625241110listOfUnAssignedVoice;
			if(_loc2_ !== param1)
			{
				this._1625241110listOfUnAssignedVoice = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"listOfUnAssignedVoice",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get overlapWarningGroup() : Group
		{
			return this._1968315946overlapWarningGroup;
		}
		
		public function set overlapWarningGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1968315946overlapWarningGroup;
			if(_loc2_ !== param1)
			{
				this._1968315946overlapWarningGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overlapWarningGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get overlapWarningLabel() : Label
		{
			return this._1972414111overlapWarningLabel;
		}
		
		public function set overlapWarningLabel(param1:Label) : void
		{
			var _loc2_:Object = this._1972414111overlapWarningLabel;
			if(_loc2_ !== param1)
			{
				this._1972414111overlapWarningLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overlapWarningLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get soundsCollection() : ArrayCollection
		{
			return this._193192190soundsCollection;
		}
		
		private function set soundsCollection(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._193192190soundsCollection;
			if(_loc2_ !== param1)
			{
				this._193192190soundsCollection = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundsCollection",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get assignedVoiceCollection() : ArrayCollection
		{
			return this._348367298assignedVoiceCollection;
		}
		
		private function set assignedVoiceCollection(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._348367298assignedVoiceCollection;
			if(_loc2_ !== param1)
			{
				this._348367298assignedVoiceCollection = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assignedVoiceCollection",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get unassignedVoiceCollection() : ArrayCollection
		{
			return this._947765495unassignedVoiceCollection;
		}
		
		private function set unassignedVoiceCollection(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._947765495unassignedVoiceCollection;
			if(_loc2_ !== param1)
			{
				this._947765495unassignedVoiceCollection = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"unassignedVoiceCollection",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _showOverlapWarning() : Boolean
		{
			return this._1215456337_showOverlapWarning;
		}
		
		private function set _showOverlapWarning(param1:Boolean) : void
		{
			var _loc2_:Object = this._1215456337_showOverlapWarning;
			if(_loc2_ !== param1)
			{
				this._1215456337_showOverlapWarning = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showOverlapWarning",_loc2_,param1));
				}
			}
		}
	}
}
