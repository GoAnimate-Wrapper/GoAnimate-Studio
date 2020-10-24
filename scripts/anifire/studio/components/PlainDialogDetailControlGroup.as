package anifire.studio.components
{
	import anifire.event.ExtraDataEvent;
	import anifire.studio.events.VoicePanelEvent;
	import anifire.studio.skins.PlainPlayVoiceToggleButtonSkin;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.HGroup;
	
	use namespace mx_internal;
	
	public class PlainDialogDetailControlGroup extends HGroup implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _1932020019_PlainDialogDetailControlGroup_SetProperty1:SetProperty;
		
		private var _236921507_PlainDialogDetailControlGroup_SetProperty10:SetProperty;
		
		private var _236921506_PlainDialogDetailControlGroup_SetProperty11:SetProperty;
		
		private var _236921505_PlainDialogDetailControlGroup_SetProperty12:SetProperty;
		
		private var _236921504_PlainDialogDetailControlGroup_SetProperty13:SetProperty;
		
		private var _236921503_PlainDialogDetailControlGroup_SetProperty14:SetProperty;
		
		private var _236921502_PlainDialogDetailControlGroup_SetProperty15:SetProperty;
		
		private var _236921501_PlainDialogDetailControlGroup_SetProperty16:SetProperty;
		
		private var _236921500_PlainDialogDetailControlGroup_SetProperty17:SetProperty;
		
		private var _236921499_PlainDialogDetailControlGroup_SetProperty18:SetProperty;
		
		private var _236921498_PlainDialogDetailControlGroup_SetProperty19:SetProperty;
		
		private var _1932020020_PlainDialogDetailControlGroup_SetProperty2:SetProperty;
		
		private var _236921476_PlainDialogDetailControlGroup_SetProperty20:SetProperty;
		
		private var _236921475_PlainDialogDetailControlGroup_SetProperty21:SetProperty;
		
		private var _236921474_PlainDialogDetailControlGroup_SetProperty22:SetProperty;
		
		private var _236921473_PlainDialogDetailControlGroup_SetProperty23:SetProperty;
		
		private var _236921472_PlainDialogDetailControlGroup_SetProperty24:SetProperty;
		
		private var _1932020021_PlainDialogDetailControlGroup_SetProperty3:SetProperty;
		
		private var _1932020022_PlainDialogDetailControlGroup_SetProperty4:SetProperty;
		
		private var _1932020023_PlainDialogDetailControlGroup_SetProperty5:SetProperty;
		
		private var _1932020024_PlainDialogDetailControlGroup_SetProperty6:SetProperty;
		
		private var _1932020025_PlainDialogDetailControlGroup_SetProperty7:SetProperty;
		
		private var _1932020026_PlainDialogDetailControlGroup_SetProperty8:SetProperty;
		
		private var _1932020027_PlainDialogDetailControlGroup_SetProperty9:SetProperty;
		
		private var _1338722904_btnDelete:IconButton;
		
		private var _1730971321_btnEdit:IconButton;
		
		private var _1730636175_btnPlay:PlaySoundToggleButton;
		
		private var _1358002274_speechVolumeControl:PlainSpeechVolumeControl;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _1746229292voiceContentUpdated:Boolean = false;
		
		private var _embed_mxml__styles_images_voicetab_viewpage_delete_hover_png_1355972279:Class;
		
		private var _embed_mxml__styles_images_voicetab_viewpage_edit_png_1122458625:Class;
		
		private var _embed_mxml__styles_images_voicetab_viewpage_edit_hover_png_142782857:Class;
		
		private var _embed_mxml__styles_images_voicetab_viewpage_delete_png_614427457:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function PlainDialogDetailControlGroup()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_voicetab_viewpage_delete_hover_png_1355972279 = PlainDialogDetailControlGroup__embed_mxml__styles_images_voicetab_viewpage_delete_hover_png_1355972279;
			this._embed_mxml__styles_images_voicetab_viewpage_edit_png_1122458625 = PlainDialogDetailControlGroup__embed_mxml__styles_images_voicetab_viewpage_edit_png_1122458625;
			this._embed_mxml__styles_images_voicetab_viewpage_edit_hover_png_142782857 = PlainDialogDetailControlGroup__embed_mxml__styles_images_voicetab_viewpage_edit_hover_png_142782857;
			this._embed_mxml__styles_images_voicetab_viewpage_delete_png_614427457 = PlainDialogDetailControlGroup__embed_mxml__styles_images_voicetab_viewpage_delete_png_614427457;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._PlainDialogDetailControlGroup_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_PlainDialogDetailControlGroupWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return PlainDialogDetailControlGroup[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._PlainDialogDetailControlGroup_HGroup2_c()];
			this.currentState = "tts";
			this.addEventListener("creationComplete",this.___PlainDialogDetailControlGroup_HGroup1_creationComplete);
			states = [new State({
				"name":"tts",
				"stateGroups":["normalStates","ttsStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"includeInLayout",
					"value":false
				})]
			}),new State({
				"name":"mic",
				"stateGroups":["normalStates","micStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"includeInLayout",
					"value":false
				})]
			}),new State({
				"name":"file",
				"stateGroups":["normalStates","fileStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"includeInLayout",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"includeInLayout",
					"value":false
				})]
			}),new State({
				"name":"ttsAndAdded",
				"stateGroups":["addedStates","ttsStates"],
				"overrides":[this._PlainDialogDetailControlGroup_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty6 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty9 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty12 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty15 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty18 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty21 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty24 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"includeInLayout",
					"value":undefined
				}))]
			}),new State({
				"name":"micAndAdded",
				"stateGroups":["addedStates","micStates"],
				"overrides":[this._PlainDialogDetailControlGroup_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty5 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty8 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty11 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty14 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty17 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty20 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty23 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"includeInLayout",
					"value":undefined
				}))]
			}),new State({
				"name":"fileAndAdded",
				"stateGroups":["addedStates","fileStates"],
				"overrides":[this._PlainDialogDetailControlGroup_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnPlay",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty7 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty10 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_speechVolumeControl",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty13 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty16 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnEdit",
					"name":"includeInLayout",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty19 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"visible",
					"value":undefined
				})),this._PlainDialogDetailControlGroup_SetProperty22 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_btnDelete",
					"name":"includeInLayout",
					"value":undefined
				}))]
			})];
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty3",this._PlainDialogDetailControlGroup_SetProperty3);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty6",this._PlainDialogDetailControlGroup_SetProperty6);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty9",this._PlainDialogDetailControlGroup_SetProperty9);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty12",this._PlainDialogDetailControlGroup_SetProperty12);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty15",this._PlainDialogDetailControlGroup_SetProperty15);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty18",this._PlainDialogDetailControlGroup_SetProperty18);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty21",this._PlainDialogDetailControlGroup_SetProperty21);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty24",this._PlainDialogDetailControlGroup_SetProperty24);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty2",this._PlainDialogDetailControlGroup_SetProperty2);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty5",this._PlainDialogDetailControlGroup_SetProperty5);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty8",this._PlainDialogDetailControlGroup_SetProperty8);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty11",this._PlainDialogDetailControlGroup_SetProperty11);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty14",this._PlainDialogDetailControlGroup_SetProperty14);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty17",this._PlainDialogDetailControlGroup_SetProperty17);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty20",this._PlainDialogDetailControlGroup_SetProperty20);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty23",this._PlainDialogDetailControlGroup_SetProperty23);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty1",this._PlainDialogDetailControlGroup_SetProperty1);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty4",this._PlainDialogDetailControlGroup_SetProperty4);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty7",this._PlainDialogDetailControlGroup_SetProperty7);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty10",this._PlainDialogDetailControlGroup_SetProperty10);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty13",this._PlainDialogDetailControlGroup_SetProperty13);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty16",this._PlainDialogDetailControlGroup_SetProperty16);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty19",this._PlainDialogDetailControlGroup_SetProperty19);
			BindingManager.executeBindings(this,"_PlainDialogDetailControlGroup_SetProperty22",this._PlainDialogDetailControlGroup_SetProperty22);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			PlainDialogDetailControlGroup._watcherSetupUtil = param1;
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
		
		public function setVolumeSliderUp(param1:Boolean) : void
		{
			this._speechVolumeControl.expandUp = param1;
		}
		
		public function setState() : void
		{
		}
		
		private function onVolumeUpdate(param1:ExtraDataEvent) : void
		{
			if(param1.getData() && this._btnPlay)
			{
				this._btnPlay.volume = param1.getData() as Number;
			}
			dispatchEvent(param1);
		}
		
		private function onClickDelete() : void
		{
			dispatchEvent(new VoicePanelEvent(VoicePanelEvent.DELETE_VOICE));
		}
		
		private function onClickPlay() : void
		{
			dispatchEvent(new VoicePanelEvent(VoicePanelEvent.PLAY_VOICE));
		}
		
		private function onClickEdit() : void
		{
			dispatchEvent(new VoicePanelEvent(VoicePanelEvent.EDIT_VOICE));
		}
		
		private function _PlainDialogDetailControlGroup_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.horizontalAlign = "center";
			_loc1_.verticalAlign = "middle";
			_loc1_.visible = true;
			_loc1_.includeInLayout = true;
			_loc1_.gap = 10;
			_loc1_.mxmlContent = [this._PlainDialogDetailControlGroup_PlaySoundToggleButton1_i(),this._PlainDialogDetailControlGroup_PlainSpeechVolumeControl1_i(),this._PlainDialogDetailControlGroup_IconButton1_i(),this._PlainDialogDetailControlGroup_IconButton2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PlainDialogDetailControlGroup_PlaySoundToggleButton1_i() : PlaySoundToggleButton
		{
			var _loc1_:PlaySoundToggleButton = new PlaySoundToggleButton();
			_loc1_.setStyle("skinClass",PlainPlayVoiceToggleButtonSkin);
			_loc1_.id = "_btnPlay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._btnPlay = _loc1_;
			BindingManager.executeBindings(this,"_btnPlay",this._btnPlay);
			return _loc1_;
		}
		
		private function _PlainDialogDetailControlGroup_PlainSpeechVolumeControl1_i() : PlainSpeechVolumeControl
		{
			var _loc1_:PlainSpeechVolumeControl = new PlainSpeechVolumeControl();
			_loc1_.addEventListener("update",this.___speechVolumeControl_update);
			_loc1_.id = "_speechVolumeControl";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._speechVolumeControl = _loc1_;
			BindingManager.executeBindings(this,"_speechVolumeControl",this._speechVolumeControl);
			return _loc1_;
		}
		
		public function ___speechVolumeControl_update(param1:ExtraDataEvent) : void
		{
			this.onVolumeUpdate(param1);
		}
		
		private function _PlainDialogDetailControlGroup_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_viewpage_edit_png_1122458625);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_voicetab_viewpage_edit_hover_png_142782857);
			_loc1_.addEventListener("click",this.___btnEdit_click);
			_loc1_.id = "_btnEdit";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._btnEdit = _loc1_;
			BindingManager.executeBindings(this,"_btnEdit",this._btnEdit);
			return _loc1_;
		}
		
		public function ___btnEdit_click(param1:MouseEvent) : void
		{
			this.onClickEdit();
		}
		
		private function _PlainDialogDetailControlGroup_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_viewpage_delete_png_614427457);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_voicetab_viewpage_delete_hover_png_1355972279);
			_loc1_.addEventListener("click",this.___btnDelete_click);
			_loc1_.id = "_btnDelete";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._btnDelete = _loc1_;
			BindingManager.executeBindings(this,"_btnDelete",this._btnDelete);
			return _loc1_;
		}
		
		public function ___btnDelete_click(param1:MouseEvent) : void
		{
			this.onClickDelete();
		}
		
		public function ___PlainDialogDetailControlGroup_HGroup1_creationComplete(param1:FlexEvent) : void
		{
			this.setState();
		}
		
		private function _PlainDialogDetailControlGroup_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty1.value");
			result[1] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty2.value");
			result[2] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty3.value");
			result[3] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty4.value");
			result[4] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty5.value");
			result[5] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty6.value");
			result[6] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty7.value");
			result[7] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty8.value");
			result[8] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty9.value");
			result[9] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty10.value");
			result[10] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty11.value");
			result[11] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty12.value");
			result[12] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty13.value");
			result[13] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty14.value");
			result[14] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty15.value");
			result[15] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty16.value");
			result[16] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty17.value");
			result[17] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty18.value");
			result[18] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty19.value");
			result[19] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty20.value");
			result[20] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty21.value");
			result[21] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty22.value");
			result[22] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty23.value");
			result[23] = new Binding(this,function():*
			{
				return !voiceContentUpdated;
			},null,"_PlainDialogDetailControlGroup_SetProperty24.value");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty1() : SetProperty
		{
			return this._1932020019_PlainDialogDetailControlGroup_SetProperty1;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty1(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020019_PlainDialogDetailControlGroup_SetProperty1;
			if(_loc2_ !== param1)
			{
				this._1932020019_PlainDialogDetailControlGroup_SetProperty1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty10() : SetProperty
		{
			return this._236921507_PlainDialogDetailControlGroup_SetProperty10;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty10(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921507_PlainDialogDetailControlGroup_SetProperty10;
			if(_loc2_ !== param1)
			{
				this._236921507_PlainDialogDetailControlGroup_SetProperty10 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty10",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty11() : SetProperty
		{
			return this._236921506_PlainDialogDetailControlGroup_SetProperty11;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty11(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921506_PlainDialogDetailControlGroup_SetProperty11;
			if(_loc2_ !== param1)
			{
				this._236921506_PlainDialogDetailControlGroup_SetProperty11 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty11",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty12() : SetProperty
		{
			return this._236921505_PlainDialogDetailControlGroup_SetProperty12;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty12(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921505_PlainDialogDetailControlGroup_SetProperty12;
			if(_loc2_ !== param1)
			{
				this._236921505_PlainDialogDetailControlGroup_SetProperty12 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty12",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty13() : SetProperty
		{
			return this._236921504_PlainDialogDetailControlGroup_SetProperty13;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty13(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921504_PlainDialogDetailControlGroup_SetProperty13;
			if(_loc2_ !== param1)
			{
				this._236921504_PlainDialogDetailControlGroup_SetProperty13 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty13",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty14() : SetProperty
		{
			return this._236921503_PlainDialogDetailControlGroup_SetProperty14;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty14(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921503_PlainDialogDetailControlGroup_SetProperty14;
			if(_loc2_ !== param1)
			{
				this._236921503_PlainDialogDetailControlGroup_SetProperty14 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty14",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty15() : SetProperty
		{
			return this._236921502_PlainDialogDetailControlGroup_SetProperty15;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty15(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921502_PlainDialogDetailControlGroup_SetProperty15;
			if(_loc2_ !== param1)
			{
				this._236921502_PlainDialogDetailControlGroup_SetProperty15 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty15",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty16() : SetProperty
		{
			return this._236921501_PlainDialogDetailControlGroup_SetProperty16;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty16(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921501_PlainDialogDetailControlGroup_SetProperty16;
			if(_loc2_ !== param1)
			{
				this._236921501_PlainDialogDetailControlGroup_SetProperty16 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty16",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty17() : SetProperty
		{
			return this._236921500_PlainDialogDetailControlGroup_SetProperty17;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty17(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921500_PlainDialogDetailControlGroup_SetProperty17;
			if(_loc2_ !== param1)
			{
				this._236921500_PlainDialogDetailControlGroup_SetProperty17 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty17",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty18() : SetProperty
		{
			return this._236921499_PlainDialogDetailControlGroup_SetProperty18;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty18(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921499_PlainDialogDetailControlGroup_SetProperty18;
			if(_loc2_ !== param1)
			{
				this._236921499_PlainDialogDetailControlGroup_SetProperty18 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty18",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty19() : SetProperty
		{
			return this._236921498_PlainDialogDetailControlGroup_SetProperty19;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty19(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921498_PlainDialogDetailControlGroup_SetProperty19;
			if(_loc2_ !== param1)
			{
				this._236921498_PlainDialogDetailControlGroup_SetProperty19 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty19",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty2() : SetProperty
		{
			return this._1932020020_PlainDialogDetailControlGroup_SetProperty2;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty2(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020020_PlainDialogDetailControlGroup_SetProperty2;
			if(_loc2_ !== param1)
			{
				this._1932020020_PlainDialogDetailControlGroup_SetProperty2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty20() : SetProperty
		{
			return this._236921476_PlainDialogDetailControlGroup_SetProperty20;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty20(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921476_PlainDialogDetailControlGroup_SetProperty20;
			if(_loc2_ !== param1)
			{
				this._236921476_PlainDialogDetailControlGroup_SetProperty20 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty20",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty21() : SetProperty
		{
			return this._236921475_PlainDialogDetailControlGroup_SetProperty21;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty21(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921475_PlainDialogDetailControlGroup_SetProperty21;
			if(_loc2_ !== param1)
			{
				this._236921475_PlainDialogDetailControlGroup_SetProperty21 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty21",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty22() : SetProperty
		{
			return this._236921474_PlainDialogDetailControlGroup_SetProperty22;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty22(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921474_PlainDialogDetailControlGroup_SetProperty22;
			if(_loc2_ !== param1)
			{
				this._236921474_PlainDialogDetailControlGroup_SetProperty22 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty22",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty23() : SetProperty
		{
			return this._236921473_PlainDialogDetailControlGroup_SetProperty23;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty23(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921473_PlainDialogDetailControlGroup_SetProperty23;
			if(_loc2_ !== param1)
			{
				this._236921473_PlainDialogDetailControlGroup_SetProperty23 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty23",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty24() : SetProperty
		{
			return this._236921472_PlainDialogDetailControlGroup_SetProperty24;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty24(param1:SetProperty) : void
		{
			var _loc2_:Object = this._236921472_PlainDialogDetailControlGroup_SetProperty24;
			if(_loc2_ !== param1)
			{
				this._236921472_PlainDialogDetailControlGroup_SetProperty24 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty24",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty3() : SetProperty
		{
			return this._1932020021_PlainDialogDetailControlGroup_SetProperty3;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty3(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020021_PlainDialogDetailControlGroup_SetProperty3;
			if(_loc2_ !== param1)
			{
				this._1932020021_PlainDialogDetailControlGroup_SetProperty3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty4() : SetProperty
		{
			return this._1932020022_PlainDialogDetailControlGroup_SetProperty4;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty4(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020022_PlainDialogDetailControlGroup_SetProperty4;
			if(_loc2_ !== param1)
			{
				this._1932020022_PlainDialogDetailControlGroup_SetProperty4 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty4",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty5() : SetProperty
		{
			return this._1932020023_PlainDialogDetailControlGroup_SetProperty5;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty5(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020023_PlainDialogDetailControlGroup_SetProperty5;
			if(_loc2_ !== param1)
			{
				this._1932020023_PlainDialogDetailControlGroup_SetProperty5 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty5",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty6() : SetProperty
		{
			return this._1932020024_PlainDialogDetailControlGroup_SetProperty6;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty6(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020024_PlainDialogDetailControlGroup_SetProperty6;
			if(_loc2_ !== param1)
			{
				this._1932020024_PlainDialogDetailControlGroup_SetProperty6 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty6",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty7() : SetProperty
		{
			return this._1932020025_PlainDialogDetailControlGroup_SetProperty7;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty7(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020025_PlainDialogDetailControlGroup_SetProperty7;
			if(_loc2_ !== param1)
			{
				this._1932020025_PlainDialogDetailControlGroup_SetProperty7 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty7",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty8() : SetProperty
		{
			return this._1932020026_PlainDialogDetailControlGroup_SetProperty8;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty8(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020026_PlainDialogDetailControlGroup_SetProperty8;
			if(_loc2_ !== param1)
			{
				this._1932020026_PlainDialogDetailControlGroup_SetProperty8 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty8",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _PlainDialogDetailControlGroup_SetProperty9() : SetProperty
		{
			return this._1932020027_PlainDialogDetailControlGroup_SetProperty9;
		}
		
		public function set _PlainDialogDetailControlGroup_SetProperty9(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1932020027_PlainDialogDetailControlGroup_SetProperty9;
			if(_loc2_ !== param1)
			{
				this._1932020027_PlainDialogDetailControlGroup_SetProperty9 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlainDialogDetailControlGroup_SetProperty9",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _btnDelete() : IconButton
		{
			return this._1338722904_btnDelete;
		}
		
		public function set _btnDelete(param1:IconButton) : void
		{
			var _loc2_:Object = this._1338722904_btnDelete;
			if(_loc2_ !== param1)
			{
				this._1338722904_btnDelete = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnDelete",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _btnEdit() : IconButton
		{
			return this._1730971321_btnEdit;
		}
		
		public function set _btnEdit(param1:IconButton) : void
		{
			var _loc2_:Object = this._1730971321_btnEdit;
			if(_loc2_ !== param1)
			{
				this._1730971321_btnEdit = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnEdit",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _btnPlay() : PlaySoundToggleButton
		{
			return this._1730636175_btnPlay;
		}
		
		public function set _btnPlay(param1:PlaySoundToggleButton) : void
		{
			var _loc2_:Object = this._1730636175_btnPlay;
			if(_loc2_ !== param1)
			{
				this._1730636175_btnPlay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPlay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _speechVolumeControl() : PlainSpeechVolumeControl
		{
			return this._1358002274_speechVolumeControl;
		}
		
		public function set _speechVolumeControl(param1:PlainSpeechVolumeControl) : void
		{
			var _loc2_:Object = this._1358002274_speechVolumeControl;
			if(_loc2_ !== param1)
			{
				this._1358002274_speechVolumeControl = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_speechVolumeControl",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get voiceContentUpdated() : Boolean
		{
			return this._1746229292voiceContentUpdated;
		}
		
		private function set voiceContentUpdated(param1:Boolean) : void
		{
			var _loc2_:Object = this._1746229292voiceContentUpdated;
			if(_loc2_ !== param1)
			{
				this._1746229292voiceContentUpdated = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceContentUpdated",_loc2_,param1));
				}
			}
		}
	}
}
