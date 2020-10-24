package anifire.studio.components
{
	import anifire.constant.ThemeConstants;
	import anifire.managers.FeatureManager;
	import anifire.studio.assets.controllers.TextCollectionController;
	import anifire.studio.assets.views.AssetEditor;
	import anifire.studio.assets.views.AssetViewCollection;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.Asset;
	import anifire.studio.core.Background;
	import anifire.studio.core.BubbleAsset;
	import anifire.studio.core.CharThumb;
	import anifire.studio.core.Character;
	import anifire.studio.core.Console;
	import anifire.studio.core.EffectAsset;
	import anifire.studio.core.EffectThumb;
	import anifire.studio.core.FlowFrame;
	import anifire.studio.core.ProgramEffectAsset;
	import anifire.studio.core.Prop;
	import anifire.studio.core.VideoProp;
	import anifire.studio.core.Widget;
	import anifire.studio.events.TutorialEvent;
	import anifire.studio.interfaces.IAssetView;
	import anifire.studio.interfaces.IColorable;
	import anifire.studio.managers.StudioManager;
	import anifire.studio.managers.TutorialManager;
	import anifire.studio.skins.PropertyTabBarSkin;
	import anifire.util.UtilArray;
	import anifire.util.UtilDict;
	import anifire.util.UtilUser;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.containers.ViewStack;
	import mx.controls.Spacer;
	import mx.core.IFlexModuleFactory;
	import mx.core.INavigatorContent;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.core.UIComponentDescriptor;
	import mx.core.mx_internal;
	import mx.events.EffectEvent;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.states.Transition;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.TabBar;
	import spark.components.VGroup;
	import spark.effects.Animate;
	import spark.effects.animation.MotionPath;
	import spark.effects.animation.SimpleMotionPath;
	import spark.events.IndexChangeEvent;
	import spark.events.RendererExistenceEvent;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class PropertiesWindow extends Group implements IBindingClient, IStateClient2
	{
		
		private static const STATE_NORMAL:String = "normal";
		
		private static const STATE_SWAPASSET:String = "swapAsset";
		
		private static const LABEL_CHAR_SPEECH_PANEL:String = "Dialog";
		
		private static const LABEL_SCENE_SPEECH_PANEL:String = "Narration";
		
		private static const TUTORIAL_EVENT_VOICE_TAB:String = "voice_tab_select";
		
		private static const TUTORIAL_EVENT_ACTION_TAB:String = "action_tab_select";
		
		private static const TUTORIAL_ACTION_TAB:String = "action_tab";
		
		private static const TUTORIAL_VOICE_TAB:String = "voice_tab";
		
		private static const PANEL_TITLE_CHARACTER:String = "Character Settings";
		
		private static const PANEL_TITLE_PROP:String = "Prop Settings";
		
		private static const PANEL_TITLE_CHART:String = "Chart Settings";
		
		private static const PANEL_TITLE_SCENE:String = "Scene Settings";
		
		private static const PANEL_TITLE_EFFECT:String = "Effect Settings";
		
		private static const PANEL_TITLE_TEXT:String = "Text Settings";
		
		private static const PANEL_TITLE_FLOW_FRAME:String = "Image Frame Settings";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _1569328494actionPanel:ActionPanel;
		
		private var _734914287advPanel:BubbleAdvancedPanel;
		
		private var _1118509956animation:Animate;
		
		private var _1427077073backgroundFill:Rect;
		
		private var _764566744bubblePanel:FontChooser;
		
		private var _11548545buttonBar:AssetControlBar;
		
		private var _2044757471cameraPanel:CameraPanel;
		
		private var _434221093chromeGroup:VGroup;
		
		private var _1275269217colorPanel:ColorPanel;
		
		private var _1646834419effectPanel:EffectPanel;
		
		private var _1116096238flowFrameStylePanel:FlowFrameStylePanel;
		
		private var _195657577joinEffectPanel:JoinEffectPanel;
		
		private var _795937457navBackground:Rect;
		
		private var _1539511881navContentGroup:Group;
		
		private var _2079239841navPanel:ViewStack;
		
		private var _1810586611normalContentGroup:VGroup;
		
		private var _2066184408scenePanel:ScenePanel;
		
		private var _314498417slideContainerGroup:HGroup;
		
		private var _1250680294slideTransition:Transition;
		
		private var _1758088770speechPanel:DialogPanel;
		
		private var _241989645statePanel:PropStatePanel;
		
		private var _1489950439swapAssetPanel:SwapAssetPanel;
		
		private var _1106138809swapContentGroup:Group;
		
		private var _881418178tabBar:TabBar;
		
		private var _1670896865tabBarGroup:Group;
		
		private var _1330532588thumbnail:PropertyThumbnail;
		
		private var _1893287094titleDisplay:Label;
		
		private var _1987987025transitionPanel:TransitionPanel;
		
		private var _2098034326widgetDataPanel:WidgetDataPanel;
		
		private var _433187785widgetStylePanel:WidgetStylePanel;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _tutorialManager:TutorialManager;
		
		private var _372006012allowSwap:Boolean;
		
		private var _318652970swapMode:Boolean;
		
		private var _110371416title:String;
		
		private var _336650556loading:Boolean;
		
		private var _target:Object;
		
		private var _lastTarget:Object;
		
		private var _selectionTarget:Object;
		
		private var _colorTarget:Object;
		
		private var active:Boolean;
		
		private var _view:IAssetView;
		
		private var _lastSelectedContent:INavigatorContent;
		
		private var characterPanelTitle:String;
		
		private var propPanelTitle:String;
		
		private var widgetPanelTitle:String;
		
		private var scenePanelTitle:String;
		
		private var effectPanelTitle:String;
		
		private var bubblePanelTitle:String;
		
		private var flowFramePanelTitle:String;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function PropertiesWindow()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._tutorialManager = TutorialManager.instance;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._PropertiesWindow_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_PropertiesWindowWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return PropertiesWindow[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.percentWidth = 100;
			this.percentHeight = 100;
			this.transitions = [this._PropertiesWindow_Transition1_i()];
			this.mxmlContent = [this._PropertiesWindow_Rect1_i(),this._PropertiesWindow_VGroup1_i()];
			this.currentState = "normal";
			this.addEventListener("initialize",this.___PropertiesWindow_Group1_initialize);
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"swapAsset",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"slideContainerGroup",
					"name":"horizontalScrollPosition",
					"value":310
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
			PropertiesWindow._watcherSetupUtil = param1;
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
		
		public function set target(param1:Object) : void
		{
			var _loc3_:INavigatorContent = null;
			var _loc4_:Boolean = false;
			var _loc5_:Asset = null;
			if(this._selectionTarget == param1 && !(param1 is TextCollectionController) && !(param1 is AssetViewCollection))
			{
				return;
			}
			if(param1)
			{
				this._lastTarget = param1;
			}
			this._selectionTarget = param1;
			this.thumbnail.target = param1;
			this._colorTarget = param1;
			this.allowSwap = false;
			var _loc2_:Boolean = false;
			this._view = null;
			if(param1 is IAssetView)
			{
				this._view = param1 as IAssetView;
				param1 = IAssetView(param1).asset;
			}
			this._target = param1;
			this.buttonBar.target = this._target;
			this.swapAssetPanel.asset = null;
			this.hideAllPanels();
			this.displayAssetPanel();
			if(param1 is ProgramEffectAsset && ProgramEffectAsset(param1).getExactType() == EffectThumb.TYPE_ZOOM)
			{
				_loc2_ = true;
			}
			if(this.transitionApplyable(param1))
			{
				this.assetTransitionPanelVisible = true;
				_loc3_ = this.transitionPanel;
			}
			if(param1 is Prop)
			{
				this.title = this.propPanelTitle;
				if(Prop(param1).state)
				{
					this.statePanelVisible = true;
					_loc3_ = this.statePanel;
				}
				if(param1 is Widget)
				{
					this.widgetDataPanelVisible = true;
					this.widgetStylePanelVisible = true;
					this.title = this.widgetPanelTitle;
					_loc3_ = this.widgetDataPanel;
				}
				if(param1 is FlowFrame)
				{
					this.flowFrameStylePanelVisible = true;
					this.title = this.flowFramePanelTitle;
					_loc3_ = this.flowFrameStylePanel;
					if(FlowFrame(param1).isAddButtonClicked)
					{
						this._lastSelectedContent = null;
					}
				}
				this.swapAssetPanel.asset = param1 as Asset;
				this.allowSwap = true;
			}
			else if(param1 is Character)
			{
				this.speechPanel.label = UtilDict.translate(LABEL_CHAR_SPEECH_PANEL);
				this.actionPanelVisible = true;
				this.speechPanelVisible = true;
				_loc3_ = this.actionPanel;
				this.title = this.characterPanelTitle;
				this.allowSwap = true;
				this.swapAssetPanel.asset = param1 as Asset;
			}
			else if(param1 is TextCollectionController)
			{
				this.bubblePanelVisible = true;
				if(TextCollectionController(param1).singleBubbleAsset)
				{
					this.advPanelVisible = FeatureManager.shouldBubbleUrlBeEditable;
				}
				_loc3_ = this.bubblePanel;
				this.title = this.bubblePanelTitle;
			}
			else if(!(param1 is AssetViewCollection))
			{
				if(param1 is AnimeScene || param1 is EffectAsset || param1 is Background)
				{
					this.sceneOptionVisible = true;
					this.speechPanel.label = UtilDict.translate(LABEL_SCENE_SPEECH_PANEL);
					this.speechPanelVisible = true;
					if(Console.getConsole().metaData.mver > 3)
					{
						this.cameraSettingPanelVisible = true;
					}
					this.joinEffectPanelVisible = true;
					this.title = this.scenePanelTitle;
					if(!(param1 is AnimeScene))
					{
						this._target = Asset(param1).scene;
					}
					if(param1 is EffectAsset)
					{
						if(_loc2_)
						{
							_loc3_ = this.cameraPanel;
						}
						else
						{
							_loc3_ = this.joinEffectPanel;
						}
					}
					else
					{
						_loc3_ = this.scenePanel;
					}
					_loc4_ = true;
					this._colorTarget = Console.getConsole().sceneEditor.getBackgroundAssetView();
					if(this._colorTarget)
					{
						_loc5_ = AssetEditor(this._colorTarget).asset;
						if(_loc5_ is Background)
						{
							_loc4_ = Background(_loc5_).baseVisible;
						}
					}
					if(!this._colorTarget || !_loc4_)
					{
						this._colorTarget = this._target;
					}
					this._lastSelectedContent = null;
				}
				else
				{
					this._target = null;
					this._view = null;
					this._selectionTarget = null;
					this._lastSelectedContent = null;
					this.title = "";
					dispatchEvent(new Event(Event.CLOSE));
				}
			}
			if(param1 is Background)
			{
				this.allowSwap = true;
				this.swapAssetPanel.asset = param1 as Asset;
			}
			if(!this.allowSwap)
			{
				this.displayAssetPanel();
			}
			if(!(param1 is AnimeScene || param1 is EffectAsset || param1 is Background))
			{
				if(param1 is Character)
				{
					if(Character(param1).thumb.isCC)
					{
						if(CharThumb(Character(param1).thumb).ccThemeId != ThemeConstants.INFOGRAPHICS_THEME_ID)
						{
							this.colorPanelVisible = false;
						}
						else if(UtilUser.hasAdminFeatures)
						{
							this.colorPanelVisible = true;
						}
					}
					else if(CharThumb(Character(param1).thumb).themeId == ThemeConstants.POLITIC_2_THEME_ID)
					{
						this.colorPanelVisible = false;
					}
					else if(this.hasColorParts(this._colorTarget))
					{
						this.colorPanelVisible = true;
					}
				}
				else if(this.hasColorParts(this._colorTarget))
				{
					this.colorPanelVisible = true;
				}
			}
			if(this._target)
			{
				if(!this.resumeContent(this._lastSelectedContent))
				{
					this.resumeContent(_loc3_);
				}
				this.updateChildUI();
			}
		}
		
		public function isTargetingScene() : Boolean
		{
			return this._target is AnimeScene;
		}
		
		private function resumeContent(param1:INavigatorContent) : Boolean
		{
			if(param1 && param1.enabled)
			{
				this.navPanel.selectedChild = param1;
				return true;
			}
			return false;
		}
		
		private function updateChildUI() : void
		{
			if(this._lastSelectedContent == this.cameraPanel && this.cameraPanel.enabled)
			{
				Console.getConsole().sceneEditor.showSelectedAssetControlBox();
			}
			if(this.navPanel.selectedChild == this.speechPanel)
			{
				this.speechPanel.target = this._target;
				this._tutorialManager.notifyTutorialAction(TUTORIAL_EVENT_VOICE_TAB);
			}
			else if(this.navPanel.selectedChild == this.colorPanel)
			{
				this.colorPanel.target = this._colorTarget;
			}
			else if(this.navPanel.selectedChild == this.actionPanel)
			{
				this.actionPanel.target = this._view;
				this._tutorialManager.notifyTutorialAction(TUTORIAL_EVENT_ACTION_TAB);
			}
			else if(this.navPanel.selectedChild == this.cameraPanel)
			{
				if(this._target is AnimeScene && (this._target as AnimeScene).sizingAsset)
				{
					this.cameraPanel.target = (this._target as AnimeScene).sizingAsset;
					Console.getConsole().sceneEditor.setCameraAsTarget();
				}
			}
			else if(this.navPanel.selectedChild == this.scenePanel)
			{
				this.scenePanel.target = this._target;
				this.scenePanel.colorComponent.target = this._colorTarget;
			}
			else if(this.navPanel.selectedChild == this.transitionPanel)
			{
				this.transitionPanel.sceneModel = Console.getConsole().currentScene;
			}
			else if(this.navPanel.selectedChild == this.bubblePanel)
			{
				this.bubblePanel.target = this._target;
			}
			else if(this.navPanel.selectedChild == this.effectPanel)
			{
				this.effectPanel.target = this._target;
			}
			else if(this.navPanel.selectedChild == this.statePanel)
			{
				this.statePanel.target = this._target;
			}
			else if(this.navPanel.selectedChild == this.advPanel)
			{
				this.advPanel.target = this._target;
			}
			else if(this.navPanel.selectedChild == this.widgetDataPanel)
			{
				this.widgetDataPanel.target = this._target as Widget;
			}
			else if(this.navPanel.selectedChild == this.widgetStylePanel)
			{
				this.widgetStylePanel.target = this._target as Widget;
			}
			else if(this.navPanel.selectedChild == this.joinEffectPanel)
			{
				this.joinEffectPanel.target = this._target;
			}
			else if(this.navPanel.selectedChild == this.flowFrameStylePanel)
			{
				this.flowFrameStylePanel.flowFrame = this._target as FlowFrame;
			}
			this._lastSelectedContent = this.navPanel.selectedChild;
			StudioManager.instance.closeSuggestionPopUp();
		}
		
		private function transitionApplyable(param1:Object) : Boolean
		{
			if(param1 is VideoProp)
			{
				return false;
			}
			return param1 is Prop || param1 is Character || param1 is BubbleAsset || param1 is AssetViewCollection || param1 is TextCollectionController;
		}
		
		private function hasColorParts(param1:Object) : Boolean
		{
			var _loc2_:Array = null;
			var _loc3_:IAssetView = null;
			var _loc4_:DisplayObject = null;
			if(param1 is Background)
			{
				return true;
			}
			if(param1 is IAssetView)
			{
				_loc3_ = param1 as IAssetView;
				if(_loc3_.asset is Asset)
				{
					_loc2_ = Asset(_loc3_.asset).getColorArea();
				}
				_loc4_ = _loc3_.assetImage;
				if(_loc4_ is IColorable)
				{
					_loc2_ = _loc2_.concat(IColorable(_loc4_).colorableArea);
				}
			}
			if(_loc2_)
			{
				_loc2_ = UtilArray.removeDuplicates(_loc2_,true);
			}
			if(_loc2_ && _loc2_.length > 0)
			{
				return true;
			}
			return false;
		}
		
		private function hideAllPanels() : void
		{
			this.actionPanelVisible = false;
			this.speechPanelVisible = false;
			this.colorPanelVisible = false;
			this.statePanelVisible = false;
			this.bubblePanelVisible = false;
			this.joinEffectPanelVisible = false;
			this.advPanelVisible = false;
			this.sceneOptionVisible = false;
			this.assetTransitionPanelVisible = false;
			this.cameraSettingPanelVisible = false;
			this.widgetDataPanelVisible = false;
			this.widgetStylePanelVisible = false;
			this.flowFrameStylePanelVisible = false;
			this.navigationVisible = false;
		}
		
		private function init() : void
		{
			this.characterPanelTitle = UtilDict.translate(PANEL_TITLE_CHARACTER);
			this.propPanelTitle = UtilDict.translate(PANEL_TITLE_PROP);
			this.widgetPanelTitle = UtilDict.translate(PANEL_TITLE_CHART);
			this.scenePanelTitle = UtilDict.translate(PANEL_TITLE_SCENE);
			this.effectPanelTitle = UtilDict.translate(PANEL_TITLE_EFFECT);
			this.bubblePanelTitle = UtilDict.translate(PANEL_TITLE_TEXT);
			this.flowFramePanelTitle = UtilDict.translate(PANEL_TITLE_FLOW_FRAME);
			this.hideAllPanels();
			this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_START,this.onTutorialStart);
		}
		
		public function showSpeechPanel() : void
		{
			this.speechPanel.target = this._target;
			this.navPanel.selectedChild = this.speechPanel;
		}
		
		public function open(param1:Object) : void
		{
			this.show(param1);
			this.active = true;
			dispatchEvent(new Event(Event.OPEN));
		}
		
		public function update(param1:Object) : void
		{
			if(this.active)
			{
				this.target = param1;
			}
			else
			{
				this.open(param1);
			}
		}
		
		public function close() : void
		{
			if(this.active)
			{
				this.hide();
				this.active = false;
			}
			this.displayAssetPanel();
			dispatchEvent(new Event(Event.CLOSE));
		}
		
		public function show(param1:Object = null) : void
		{
			this.swapAssetPanel.visible = true;
			this.refresh(param1);
		}
		
		public function hide() : void
		{
			this.swapAssetPanel.visible = false;
			this.target = null;
		}
		
		public function refresh(param1:Object = null) : void
		{
			var _loc2_:AssetViewCollection = null;
			var _loc3_:Asset = null;
			var _loc4_:Object = null;
			if(param1)
			{
				this.target = param1;
			}
			else
			{
				_loc2_ = Console.getConsole().mainStage.sceneEditor.selection;
				_loc4_ = _loc2_.selectedAsset;
				if(_loc4_ is IAssetView)
				{
					_loc3_ = IAssetView(_loc4_).asset;
				}
				if(this._target != _loc3_)
				{
					this.target = _loc2_.selectedAsset;
				}
				else if(_loc3_ is FlowFrame)
				{
					if(FlowFrame(_loc3_).isAddButtonClicked)
					{
						this.resumeContent(this.flowFrameStylePanel);
					}
				}
			}
		}
		
		private function set actionPanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.actionPanel.enabled = param1;
		}
		
		private function set colorPanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.colorPanel.enabled = param1;
		}
		
		private function set speechPanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.speechPanel.enabled = param1;
		}
		
		private function set statePanelVisible(param1:Boolean) : void
		{
			this.navPanel.visible = true;
			this.navBackground.visible = true;
			this.statePanel.enabled = param1;
		}
		
		private function set bubblePanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.bubblePanel.enabled = param1;
		}
		
		private function set joinEffectPanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.joinEffectPanel.enabled = param1;
		}
		
		private function set advPanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.advPanel.enabled = param1;
		}
		
		private function set sceneOptionVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.scenePanel.enabled = param1;
		}
		
		private function set assetTransitionPanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.transitionPanel.enabled = param1;
		}
		
		private function set cameraSettingPanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.cameraPanel.enabled = param1;
		}
		
		private function set widgetDataPanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.widgetDataPanel.enabled = param1;
		}
		
		private function set widgetStylePanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.widgetStylePanel.enabled = param1;
		}
		
		private function set flowFrameStylePanelVisible(param1:Boolean) : void
		{
			if(param1)
			{
				this.navigationVisible = true;
			}
			this.flowFrameStylePanel.enabled = param1;
		}
		
		private function set navigationVisible(param1:Boolean) : void
		{
			this.navContentGroup.visible = param1;
			this.tabBarGroup.visible = param1;
		}
		
		public function setLoadingStatus(param1:Boolean) : void
		{
			this.loading = param1;
		}
		
		protected function onTabChange(param1:IndexChangeEvent) : void
		{
			this.updateChildUI();
		}
		
		protected function onTabChaging(param1:IndexChangeEvent) : void
		{
			var _loc2_:INavigatorContent = this.tabBar.selectedItem;
			if(!(_loc2_ && _loc2_.enabled))
			{
				param1.preventDefault();
			}
		}
		
		protected function onTabBarRendererAdd(param1:RendererExistenceEvent) : void
		{
			var _loc4_:String = null;
			var _loc2_:UIComponent = param1.renderer as UIComponent;
			var _loc3_:int = this.tabBar.dataGroup.getElementIndex(_loc2_);
			if(param1.data == this.actionPanel)
			{
				_loc4_ = TUTORIAL_ACTION_TAB;
			}
			else if(param1.data == this.speechPanel)
			{
				_loc4_ = TUTORIAL_VOICE_TAB;
			}
			if(_loc4_)
			{
				this._tutorialManager.registerComponent(_loc4_,_loc2_);
			}
		}
		
		protected function onTutorialStart(param1:TutorialEvent) : void
		{
			var _loc2_:String = param1.tutorialId;
			var _loc3_:String = param1.data;
			if(_loc2_ == TutorialManager.DEFAULT_TUTORIAL_ID)
			{
				this._lastSelectedContent = null;
				if(this.navPanel.selectedChild == this.speechPanel)
				{
					this.navPanel.selectedChild = this.actionPanel;
				}
			}
			else if(_loc2_ == TutorialManager.NO_MOTION_TUTORIAL_ID)
			{
				this._lastSelectedContent = null;
				if(this.navPanel.selectedChild == this.speechPanel)
				{
					this.navPanel.selectedChild = this.actionPanel;
				}
			}
		}
		
		public function displaySwapPanel() : void
		{
			this.open(this._lastTarget);
			callLater(this.displaySwapPanelImpl);
		}
		
		protected function displaySwapPanelImpl() : void
		{
			currentState = STATE_SWAPASSET;
			this._tutorialManager.notifyTutorialAction("swap-char");
		}
		
		public function displaySwapInnerImagePanel() : void
		{
			this.open(this._lastTarget);
			this.navPanel.selectedChild = this.flowFrameStylePanel;
			this.updateChildUI();
			callLater(this.displaySwapInnerImagePanelImpl);
		}
		
		protected function displaySwapInnerImagePanelImpl() : void
		{
			currentState = STATE_NORMAL;
			this.flowFrameStylePanel.displayInnerImageTray();
		}
		
		public function displayWidgetIconPanel() : void
		{
			this.open(this._lastTarget);
			this.navPanel.selectedChild = this.widgetStylePanel;
			this.updateChildUI();
			callLater(this.displayWidgetIconPanelImpl);
		}
		
		protected function displayWidgetIconPanelImpl() : void
		{
			currentState = STATE_NORMAL;
			this.widgetStylePanel.displayIconTray();
		}
		
		public function displayAssetPanel() : void
		{
			currentState = STATE_NORMAL;
			this.swapAssetPanel.active = false;
			this.widgetStylePanel.reset();
			this.scenePanel.reset();
		}
		
		protected function animation_effectEndHandler(param1:EffectEvent) : void
		{
			if(currentState == STATE_SWAPASSET)
			{
				this.swapAssetPanel.active = true;
			}
		}
		
		protected function swapAssetPanel_cancelHandler(param1:Event) : void
		{
			this.displayAssetPanel();
		}
		
		private function _PropertiesWindow_Transition1_i() : Transition
		{
			var _loc1_:Transition = new Transition();
			_loc1_.fromState = "*";
			_loc1_.toState = "*";
			_loc1_.effect = this._PropertiesWindow_Animate1_i();
			this.slideTransition = _loc1_;
			BindingManager.executeBindings(this,"slideTransition",this.slideTransition);
			return _loc1_;
		}
		
		private function _PropertiesWindow_Animate1_i() : Animate
		{
			var _loc1_:Animate = new Animate();
			_loc1_.duration = 200;
			_loc1_.motionPaths = new <MotionPath>[this._PropertiesWindow_SimpleMotionPath1_c()];
			_loc1_.addEventListener("effectEnd",this.__animation_effectEnd);
			this.animation = _loc1_;
			BindingManager.executeBindings(this,"animation",this.animation);
			return _loc1_;
		}
		
		private function _PropertiesWindow_SimpleMotionPath1_c() : SimpleMotionPath
		{
			var _loc1_:SimpleMotionPath = new SimpleMotionPath();
			_loc1_.property = "horizontalScrollPosition";
			return _loc1_;
		}
		
		public function __animation_effectEnd(param1:EffectEvent) : void
		{
			this.animation_effectEndHandler(param1);
		}
		
		private function _PropertiesWindow_Rect1_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._PropertiesWindow_SolidColor1_c();
			_loc1_.initialized(this,"backgroundFill");
			this.backgroundFill = _loc1_;
			BindingManager.executeBindings(this,"backgroundFill",this.backgroundFill);
			return _loc1_;
		}
		
		private function _PropertiesWindow_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 2632511;
			return _loc1_;
		}
		
		private function _PropertiesWindow_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 0;
			_loc1_.paddingBottom = 0;
			_loc1_.paddingTop = 10;
			_loc1_.mxmlContent = [this._PropertiesWindow_Label1_i(),this._PropertiesWindow_Spacer1_c(),this._PropertiesWindow_HGroup1_c(),this._PropertiesWindow_HGroup2_i()];
			_loc1_.id = "chromeGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.chromeGroup = _loc1_;
			BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
			return _loc1_;
		}
		
		private function _PropertiesWindow_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",11126214);
			_loc1_.setStyle("fontSize",18);
			_loc1_.setStyle("paddingLeft",7);
			_loc1_.id = "titleDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.titleDisplay = _loc1_;
			BindingManager.executeBindings(this,"titleDisplay",this.titleDisplay);
			return _loc1_;
		}
		
		private function _PropertiesWindow_Spacer1_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.height = 7;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PropertiesWindow_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = 0;
			_loc1_.paddingBottom = 14;
			_loc1_.paddingLeft = 7;
			_loc1_.paddingRight = 7;
			_loc1_.verticalAlign = "bottom";
			_loc1_.mxmlContent = [this._PropertiesWindow_PropertyThumbnail1_i(),this._PropertiesWindow_Spacer2_c(),this._PropertiesWindow_AssetControlBar1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PropertiesWindow_PropertyThumbnail1_i() : PropertyThumbnail
		{
			var _loc1_:PropertyThumbnail = new PropertyThumbnail();
			_loc1_.id = "thumbnail";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.thumbnail = _loc1_;
			BindingManager.executeBindings(this,"thumbnail",this.thumbnail);
			return _loc1_;
		}
		
		private function _PropertiesWindow_Spacer2_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.percentWidth = 100;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PropertiesWindow_AssetControlBar1_i() : AssetControlBar
		{
			var _loc1_:AssetControlBar = new AssetControlBar();
			_loc1_.id = "buttonBar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.buttonBar = _loc1_;
			BindingManager.executeBindings(this,"buttonBar",this.buttonBar);
			return _loc1_;
		}
		
		private function _PropertiesWindow_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.clipAndEnableScrolling = true;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._PropertiesWindow_VGroup2_i(),this._PropertiesWindow_Group4_i()];
			_loc1_.id = "slideContainerGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.slideContainerGroup = _loc1_;
			BindingManager.executeBindings(this,"slideContainerGroup",this.slideContainerGroup);
			return _loc1_;
		}
		
		private function _PropertiesWindow_VGroup2_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.width = 310;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._PropertiesWindow_Group2_i(),this._PropertiesWindow_Group3_i()];
			_loc1_.id = "normalContentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.normalContentGroup = _loc1_;
			BindingManager.executeBindings(this,"normalContentGroup",this.normalContentGroup);
			return _loc1_;
		}
		
		private function _PropertiesWindow_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._PropertiesWindow_TabBar1_i()];
			_loc1_.id = "tabBarGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tabBarGroup = _loc1_;
			BindingManager.executeBindings(this,"tabBarGroup",this.tabBarGroup);
			return _loc1_;
		}
		
		private function _PropertiesWindow_TabBar1_i() : TabBar
		{
			var _loc1_:TabBar = new TabBar();
			_loc1_.percentWidth = 100;
			_loc1_.focusEnabled = false;
			_loc1_.setStyle("skinClass",PropertyTabBarSkin);
			_loc1_.addEventListener("change",this.__tabBar_change);
			_loc1_.addEventListener("changing",this.__tabBar_changing);
			_loc1_.addEventListener("rendererAdd",this.__tabBar_rendererAdd);
			_loc1_.id = "tabBar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tabBar = _loc1_;
			BindingManager.executeBindings(this,"tabBar",this.tabBar);
			return _loc1_;
		}
		
		public function __tabBar_change(param1:IndexChangeEvent) : void
		{
			this.onTabChange(param1);
		}
		
		public function __tabBar_changing(param1:IndexChangeEvent) : void
		{
			this.onTabChaging(param1);
		}
		
		public function __tabBar_rendererAdd(param1:RendererExistenceEvent) : void
		{
			this.onTabBarRendererAdd(param1);
		}
		
		private function _PropertiesWindow_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._PropertiesWindow_Rect2_i(),this._PropertiesWindow_ViewStack1_i()];
			_loc1_.id = "navContentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.navContentGroup = _loc1_;
			BindingManager.executeBindings(this,"navContentGroup",this.navContentGroup);
			return _loc1_;
		}
		
		private function _PropertiesWindow_Rect2_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._PropertiesWindow_SolidColor2_c();
			_loc1_.initialized(this,"navBackground");
			this.navBackground = _loc1_;
			BindingManager.executeBindings(this,"navBackground",this.navBackground);
			return _loc1_;
		}
		
		private function _PropertiesWindow_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _PropertiesWindow_ViewStack1_i() : ViewStack
		{
			var temp:ViewStack = new ViewStack();
			temp.percentWidth = 100;
			temp.percentHeight = 100;
			temp.creationPolicy = "all";
			temp.id = "navPanel";
			if(!temp.document)
			{
				temp.document = this;
			}
			temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
				"type":ViewStack,
				"id":"navPanel",
				"propertiesFactory":function():Object
				{
					return {"childDescriptors":[new UIComponentDescriptor({
						"type":WidgetDataPanel,
						"id":"widgetDataPanel"
					}),new UIComponentDescriptor({
						"type":WidgetStylePanel,
						"id":"widgetStylePanel"
					}),new UIComponentDescriptor({
						"type":FlowFrameStylePanel,
						"id":"flowFrameStylePanel"
					}),new UIComponentDescriptor({
						"type":ScenePanel,
						"id":"scenePanel"
					}),new UIComponentDescriptor({
						"type":ActionPanel,
						"id":"actionPanel"
					}),new UIComponentDescriptor({
						"type":DialogPanel,
						"id":"speechPanel"
					}),new UIComponentDescriptor({
						"type":PropStatePanel,
						"id":"statePanel"
					}),new UIComponentDescriptor({
						"type":FontChooser,
						"id":"bubblePanel"
					}),new UIComponentDescriptor({
						"type":EffectPanel,
						"id":"effectPanel",
						"propertiesFactory":function():Object
						{
							return {
								"visible":false,
								"enabled":false
							};
						}
					}),new UIComponentDescriptor({
						"type":BubbleAdvancedPanel,
						"id":"advPanel"
					}),new UIComponentDescriptor({
						"type":TransitionPanel,
						"id":"transitionPanel"
					}),new UIComponentDescriptor({
						"type":JoinEffectPanel,
						"id":"joinEffectPanel"
					}),new UIComponentDescriptor({
						"type":CameraPanel,
						"id":"cameraPanel"
					}),new UIComponentDescriptor({
						"type":ColorPanel,
						"id":"colorPanel"
					})]};
				}
			});
			temp.mx_internal::_documentDescriptor.document = this;
			this.navPanel = temp;
			BindingManager.executeBindings(this,"navPanel",this.navPanel);
			return temp;
		}
		
		private function _PropertiesWindow_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 310;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._PropertiesWindow_SwapAssetPanel1_i()];
			_loc1_.id = "swapContentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.swapContentGroup = _loc1_;
			BindingManager.executeBindings(this,"swapContentGroup",this.swapContentGroup);
			return _loc1_;
		}
		
		private function _PropertiesWindow_SwapAssetPanel1_i() : SwapAssetPanel
		{
			var _loc1_:SwapAssetPanel = new SwapAssetPanel();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.addEventListener("cancel",this.__swapAssetPanel_cancel);
			_loc1_.id = "swapAssetPanel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.swapAssetPanel = _loc1_;
			BindingManager.executeBindings(this,"swapAssetPanel",this.swapAssetPanel);
			return _loc1_;
		}
		
		public function __swapAssetPanel_cancel(param1:Event) : void
		{
			this.swapAssetPanel_cancelHandler(param1);
		}
		
		public function ___PropertiesWindow_Group1_initialize(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _PropertiesWindow_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Boolean
			{
				return !loading;
			},null,"this.mouseChildren");
			result[1] = new Binding(this,function():Boolean
			{
				return !loading;
			},null,"this.mouseEnabled");
			result[2] = new Binding(this,null,null,"animation.target","slideContainerGroup");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = title;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"titleDisplay.text");
			result[4] = new Binding(this,null,null,"tabBar.dataProvider","navPanel");
			result[5] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Data");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"widgetDataPanel.label");
			result[6] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Style");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"widgetStylePanel.label");
			result[7] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Style");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"flowFrameStylePanel.label");
			result[8] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Options");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"scenePanel.label");
			result[9] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Actions");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"actionPanel.label");
			result[10] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Dialog");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"speechPanel.label");
			result[11] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("States");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"statePanel.label");
			result[12] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Style");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"bubblePanel.label");
			result[13] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Effect");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"effectPanel.label");
			result[14] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Advanced");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"advPanel.label");
			result[15] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Enter/Exit");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"transitionPanel.label");
			result[16] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Effects");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"joinEffectPanel.label");
			result[17] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Camera");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"cameraPanel.label");
			result[18] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Colors");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"colorPanel.label");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get actionPanel() : ActionPanel
		{
			return this._1569328494actionPanel;
		}
		
		public function set actionPanel(param1:ActionPanel) : void
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
		public function get advPanel() : BubbleAdvancedPanel
		{
			return this._734914287advPanel;
		}
		
		public function set advPanel(param1:BubbleAdvancedPanel) : void
		{
			var _loc2_:Object = this._734914287advPanel;
			if(_loc2_ !== param1)
			{
				this._734914287advPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"advPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get animation() : Animate
		{
			return this._1118509956animation;
		}
		
		public function set animation(param1:Animate) : void
		{
			var _loc2_:Object = this._1118509956animation;
			if(_loc2_ !== param1)
			{
				this._1118509956animation = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animation",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get backgroundFill() : Rect
		{
			return this._1427077073backgroundFill;
		}
		
		public function set backgroundFill(param1:Rect) : void
		{
			var _loc2_:Object = this._1427077073backgroundFill;
			if(_loc2_ !== param1)
			{
				this._1427077073backgroundFill = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundFill",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get bubblePanel() : FontChooser
		{
			return this._764566744bubblePanel;
		}
		
		public function set bubblePanel(param1:FontChooser) : void
		{
			var _loc2_:Object = this._764566744bubblePanel;
			if(_loc2_ !== param1)
			{
				this._764566744bubblePanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubblePanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get buttonBar() : AssetControlBar
		{
			return this._11548545buttonBar;
		}
		
		public function set buttonBar(param1:AssetControlBar) : void
		{
			var _loc2_:Object = this._11548545buttonBar;
			if(_loc2_ !== param1)
			{
				this._11548545buttonBar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonBar",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get cameraPanel() : CameraPanel
		{
			return this._2044757471cameraPanel;
		}
		
		public function set cameraPanel(param1:CameraPanel) : void
		{
			var _loc2_:Object = this._2044757471cameraPanel;
			if(_loc2_ !== param1)
			{
				this._2044757471cameraPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cameraPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get chromeGroup() : VGroup
		{
			return this._434221093chromeGroup;
		}
		
		public function set chromeGroup(param1:VGroup) : void
		{
			var _loc2_:Object = this._434221093chromeGroup;
			if(_loc2_ !== param1)
			{
				this._434221093chromeGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorPanel() : ColorPanel
		{
			return this._1275269217colorPanel;
		}
		
		public function set colorPanel(param1:ColorPanel) : void
		{
			var _loc2_:Object = this._1275269217colorPanel;
			if(_loc2_ !== param1)
			{
				this._1275269217colorPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get effectPanel() : EffectPanel
		{
			return this._1646834419effectPanel;
		}
		
		public function set effectPanel(param1:EffectPanel) : void
		{
			var _loc2_:Object = this._1646834419effectPanel;
			if(_loc2_ !== param1)
			{
				this._1646834419effectPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get flowFrameStylePanel() : FlowFrameStylePanel
		{
			return this._1116096238flowFrameStylePanel;
		}
		
		public function set flowFrameStylePanel(param1:FlowFrameStylePanel) : void
		{
			var _loc2_:Object = this._1116096238flowFrameStylePanel;
			if(_loc2_ !== param1)
			{
				this._1116096238flowFrameStylePanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flowFrameStylePanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get joinEffectPanel() : JoinEffectPanel
		{
			return this._195657577joinEffectPanel;
		}
		
		public function set joinEffectPanel(param1:JoinEffectPanel) : void
		{
			var _loc2_:Object = this._195657577joinEffectPanel;
			if(_loc2_ !== param1)
			{
				this._195657577joinEffectPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"joinEffectPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get navBackground() : Rect
		{
			return this._795937457navBackground;
		}
		
		public function set navBackground(param1:Rect) : void
		{
			var _loc2_:Object = this._795937457navBackground;
			if(_loc2_ !== param1)
			{
				this._795937457navBackground = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"navBackground",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get navContentGroup() : Group
		{
			return this._1539511881navContentGroup;
		}
		
		public function set navContentGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1539511881navContentGroup;
			if(_loc2_ !== param1)
			{
				this._1539511881navContentGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"navContentGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get navPanel() : ViewStack
		{
			return this._2079239841navPanel;
		}
		
		public function set navPanel(param1:ViewStack) : void
		{
			var _loc2_:Object = this._2079239841navPanel;
			if(_loc2_ !== param1)
			{
				this._2079239841navPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"navPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get normalContentGroup() : VGroup
		{
			return this._1810586611normalContentGroup;
		}
		
		public function set normalContentGroup(param1:VGroup) : void
		{
			var _loc2_:Object = this._1810586611normalContentGroup;
			if(_loc2_ !== param1)
			{
				this._1810586611normalContentGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"normalContentGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get scenePanel() : ScenePanel
		{
			return this._2066184408scenePanel;
		}
		
		public function set scenePanel(param1:ScenePanel) : void
		{
			var _loc2_:Object = this._2066184408scenePanel;
			if(_loc2_ !== param1)
			{
				this._2066184408scenePanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenePanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get slideContainerGroup() : HGroup
		{
			return this._314498417slideContainerGroup;
		}
		
		public function set slideContainerGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._314498417slideContainerGroup;
			if(_loc2_ !== param1)
			{
				this._314498417slideContainerGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slideContainerGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get slideTransition() : Transition
		{
			return this._1250680294slideTransition;
		}
		
		public function set slideTransition(param1:Transition) : void
		{
			var _loc2_:Object = this._1250680294slideTransition;
			if(_loc2_ !== param1)
			{
				this._1250680294slideTransition = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slideTransition",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get speechPanel() : DialogPanel
		{
			return this._1758088770speechPanel;
		}
		
		public function set speechPanel(param1:DialogPanel) : void
		{
			var _loc2_:Object = this._1758088770speechPanel;
			if(_loc2_ !== param1)
			{
				this._1758088770speechPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get statePanel() : PropStatePanel
		{
			return this._241989645statePanel;
		}
		
		public function set statePanel(param1:PropStatePanel) : void
		{
			var _loc2_:Object = this._241989645statePanel;
			if(_loc2_ !== param1)
			{
				this._241989645statePanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"statePanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get swapAssetPanel() : SwapAssetPanel
		{
			return this._1489950439swapAssetPanel;
		}
		
		public function set swapAssetPanel(param1:SwapAssetPanel) : void
		{
			var _loc2_:Object = this._1489950439swapAssetPanel;
			if(_loc2_ !== param1)
			{
				this._1489950439swapAssetPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapAssetPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get swapContentGroup() : Group
		{
			return this._1106138809swapContentGroup;
		}
		
		public function set swapContentGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1106138809swapContentGroup;
			if(_loc2_ !== param1)
			{
				this._1106138809swapContentGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapContentGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tabBar() : TabBar
		{
			return this._881418178tabBar;
		}
		
		public function set tabBar(param1:TabBar) : void
		{
			var _loc2_:Object = this._881418178tabBar;
			if(_loc2_ !== param1)
			{
				this._881418178tabBar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabBar",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tabBarGroup() : Group
		{
			return this._1670896865tabBarGroup;
		}
		
		public function set tabBarGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1670896865tabBarGroup;
			if(_loc2_ !== param1)
			{
				this._1670896865tabBarGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabBarGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get thumbnail() : PropertyThumbnail
		{
			return this._1330532588thumbnail;
		}
		
		public function set thumbnail(param1:PropertyThumbnail) : void
		{
			var _loc2_:Object = this._1330532588thumbnail;
			if(_loc2_ !== param1)
			{
				this._1330532588thumbnail = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnail",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get titleDisplay() : Label
		{
			return this._1893287094titleDisplay;
		}
		
		public function set titleDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._1893287094titleDisplay;
			if(_loc2_ !== param1)
			{
				this._1893287094titleDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get transitionPanel() : TransitionPanel
		{
			return this._1987987025transitionPanel;
		}
		
		public function set transitionPanel(param1:TransitionPanel) : void
		{
			var _loc2_:Object = this._1987987025transitionPanel;
			if(_loc2_ !== param1)
			{
				this._1987987025transitionPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get widgetDataPanel() : WidgetDataPanel
		{
			return this._2098034326widgetDataPanel;
		}
		
		public function set widgetDataPanel(param1:WidgetDataPanel) : void
		{
			var _loc2_:Object = this._2098034326widgetDataPanel;
			if(_loc2_ !== param1)
			{
				this._2098034326widgetDataPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widgetDataPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get widgetStylePanel() : WidgetStylePanel
		{
			return this._433187785widgetStylePanel;
		}
		
		public function set widgetStylePanel(param1:WidgetStylePanel) : void
		{
			var _loc2_:Object = this._433187785widgetStylePanel;
			if(_loc2_ !== param1)
			{
				this._433187785widgetStylePanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widgetStylePanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get allowSwap() : Boolean
		{
			return this._372006012allowSwap;
		}
		
		private function set allowSwap(param1:Boolean) : void
		{
			var _loc2_:Object = this._372006012allowSwap;
			if(_loc2_ !== param1)
			{
				this._372006012allowSwap = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowSwap",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get swapMode() : Boolean
		{
			return this._318652970swapMode;
		}
		
		private function set swapMode(param1:Boolean) : void
		{
			var _loc2_:Object = this._318652970swapMode;
			if(_loc2_ !== param1)
			{
				this._318652970swapMode = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapMode",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get title() : String
		{
			return this._110371416title;
		}
		
		private function set title(param1:String) : void
		{
			var _loc2_:Object = this._110371416title;
			if(_loc2_ !== param1)
			{
				this._110371416title = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get loading() : Boolean
		{
			return this._336650556loading;
		}
		
		private function set loading(param1:Boolean) : void
		{
			var _loc2_:Object = this._336650556loading;
			if(_loc2_ !== param1)
			{
				this._336650556loading = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
				}
			}
		}
	}
}
