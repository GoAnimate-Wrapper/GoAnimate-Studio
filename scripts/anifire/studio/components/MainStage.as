package anifire.studio.components
{
	import anifire.constant.AnimeConstants;
	import anifire.studio.assets.control.AssetResizeToolTip;
	import anifire.studio.assets.controllers.AssetCollectionController;
	import anifire.studio.assets.controllers.AssetControllerFactory;
	import anifire.studio.assets.views.AssetViewCollection;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.Asset;
	import anifire.studio.core.Background;
	import anifire.studio.core.Console;
	import anifire.studio.core.EffectAsset;
	import anifire.studio.core.ProgramEffectAsset;
	import anifire.studio.events.MenuItemEvent;
	import anifire.studio.events.SceneViewEvent;
	import anifire.studio.events.StageControlEvent;
	import anifire.studio.events.TutorialEvent;
	import anifire.studio.interfaces.IAssetView;
	import anifire.studio.managers.TutorialManager;
	import anifire.studio.managers.UserExperimentManager;
	import anifire.studio.models.MenuItemModel;
	import anifire.util.UtilDict;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.controls.Spacer;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.effects.Parallel;
	import mx.effects.Pause;
	import mx.effects.Sequence;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.events.ResizeEvent;
	import mx.events.SliderEvent;
	import mx.filters.IBitmapFilter;
	import mx.graphics.GradientEntry;
	import mx.graphics.LinearGradient;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.utils.StringUtil;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.effects.AnimateFilter;
	import spark.effects.Fade;
	import spark.effects.SetAction;
	import spark.effects.animation.MotionPath;
	import spark.effects.animation.SimpleMotionPath;
	import spark.filters.BlurFilter;
	import spark.filters.DropShadowFilter;
	import spark.filters.GlowFilter;
	import spark.formatters.NumberFormatter;
	import spark.primitives.BitmapImage;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class MainStage extends Group implements IBindingClient
	{
		
		public static const ZOOM_FIT_RATIO:Number = 0.9;
		
		private static const MENU_ITEM_KEY_ADD_SCENE:String = "addScene";
		
		private static const MENU_ITEM_KEY_ADD_BLANK_SCENE:String = "addBlankScene";
		
		private static const FULL_STAGE_WIDTH:Number = AnimeConstants.STAGE_WIDTH + AnimeConstants.STAGE_PADDING * 2;
		
		private static const FULL_STAGE_HEIGHT:Number = AnimeConstants.STAGE_HEIGHT + AnimeConstants.STAGE_PADDING * 2;
		
		private static const ADD_SCENE_BUTTON_LABEL:String = "Add Scene";
		
		private static const ADD_BLANK_SCENE_BUTTON_LABEL:String = "Add Blank Scene";
		
		private static const CONTINUE_SCENE_BUTTON_LABEL:String = "Continue Scene";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _MainStage_AnimateFilter1:AnimateFilter;
		
		public var _MainStage_AnimateFilter2:AnimateFilter;
		
		public var _MainStage_Label1:Label;
		
		private var _1307120806_sceneEditor:SceneEditor;
		
		private var _347427628_stageArea:Group;
		
		private var _194196304_thumbnailRenderer:SceneView;
		
		private var _1553880186addSceneDropDownList:ButtonDropDownList;
		
		private var _62171684addSceneEffect:Parallel;
		
		private var _987258746assetControlBar:AssetControlBar;
		
		private var _533588863assetResizeToolTip:AssetResizeToolTip;
		
		private var _1081950333autoSaveEffect:Sequence;
		
		private var _1969575579autoSaveMessage:HGroup;
		
		private var _1645186270controlGroup:HGroup;
		
		private var _2089082918controlGroupRect:Rect;
		
		private var _1350756296durationLimitGroup:DurationLimitGroup;
		
		private var _1646841573effectPause:Pause;
		
		private var _733607779fadeOutEffect:Fade;
		
		private var _74026253maskGroup:Group;
		
		private var _355954324panDropShadow:DropShadowFilter;
		
		private var _1931449851percentFormatter:NumberFormatter;
		
		private var _1245730790previewSaveGroup:PreviewSaveGroup;
		
		private var _775624479sceneSettingsButton:Button;
		
		private var _548081861stageControlPanel:StageControlPanel;
		
		private var _1212031097tinyEffectTray:TinyEffectTray;
		
		private var _1140124837toolBar:GoToolBar;
		
		private var _237378066zoomContainer:ZoomContainer;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _tutorialManager:TutorialManager;
		
		private var _1348266006durationWarningVisible:Boolean;
		
		private var _fadeOutPreviewWarningTimer:Timer;
		
		protected var _previewSaveWarningVisible:Boolean;
		
		private var _console:Console;
		
		private var _cameraMode:Boolean = false;
		
		private var _playAddSceneEffect:Boolean = false;
		
		protected var _interactionEnabled:Boolean = true;
		
		private var _embed_mxml__styles_images_common_autosaveicon_png_179375423:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function MainStage()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._tutorialManager = TutorialManager.instance;
			this._embed_mxml__styles_images_common_autosaveicon_png_179375423 = MainStage__embed_mxml__styles_images_common_autosaveicon_png_179375423;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._MainStage_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_MainStageWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return MainStage[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._MainStage_Rect1_c(),this._MainStage_VGroup1_c(),this._MainStage_Rect3_i(),this._MainStage_HGroup2_i(),this._MainStage_Rect4_c(),this._MainStage_Line1_c(),this._MainStage_Rect5_c()];
			this._MainStage_Parallel1_i();
			this._MainStage_Sequence1_i();
			this._MainStage_Fade3_i();
			this._MainStage_DropShadowFilter1_i();
			this._MainStage_NumberFormatter1_i();
			this.addEventListener("resize",this.___MainStage_Group1_resize);
			this.addEventListener("creationComplete",this.___MainStage_Group1_creationComplete);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			MainStage._watcherSetupUtil = param1;
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
		
		[Bindable(event="propertyChange")]
		public function get previewSaveWarningVisible() : Boolean
		{
			return this._previewSaveWarningVisible;
		}
		
		private function set _254198277previewSaveWarningVisible(param1:Boolean) : void
		{
			if(this._previewSaveWarningVisible != param1)
			{
				this._previewSaveWarningVisible = param1;
				if(this._previewSaveWarningVisible && this._fadeOutPreviewWarningTimer == null)
				{
					this._fadeOutPreviewWarningTimer = new Timer(60000,1);
					this._fadeOutPreviewWarningTimer.addEventListener(TimerEvent.TIMER,this.onPreviewWarningTimer);
					this._fadeOutPreviewWarningTimer.start();
				}
				if(!this._previewSaveWarningVisible && this._fadeOutPreviewWarningTimer)
				{
					this._fadeOutPreviewWarningTimer.removeEventListener(TimerEvent.TIMER,this.onPreviewWarningTimer);
					this._fadeOutPreviewWarningTimer = null;
				}
			}
		}
		
		private function onPreviewWarningTimer(param1:TimerEvent) : void
		{
			this._fadeOutPreviewWarningTimer.removeEventListener(TimerEvent.TIMER,this.onPreviewWarningTimer);
			this._fadeOutPreviewWarningTimer = null;
			this.previewSaveWarningVisible = false;
		}
		
		public function get sceneEditor() : SceneEditor
		{
			return this._sceneEditor;
		}
		
		private function init() : void
		{
			this._console = Console.getConsole();
			this.updateStageArea();
			this.zoomContainer.targetDisplayObject = this.sceneEditor;
			this.zoomContainer.addEventListener(StageControlEvent.STAGE_ZOOM_UPDATE,this.zoomContainer_stageZoomUpdateHandler);
			this.zoomContainer.addEventListener(SliderEvent.CHANGE,this.zoomContainer_sliderChangeHandler);
			this.zoomContainer.addEventListener(StageControlEvent.STAGE_RESIZE,this.zoomContainer_resizeHandler);
			this.sceneEditor.addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.sceneEditor_viewLoadCompleteHandler);
			this.initAddSceneDropDownList();
			this._tutorialManager.registerComponent("toolbar",this.toolBar);
			this._tutorialManager.registerComponent("sceneActiveArea",this.zoomContainer);
			this._tutorialManager.registerComponent("asset_control_bar",this.assetControlBar);
			this._tutorialManager.registerComponent("asset_control_bar_flip",this.assetControlBar.flipButton);
			this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_STEP_START,this.onTutorialStepStart);
			this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_STEP_COMPLETE,this.onTutorialStepComplete);
			this.stageControlPanel.addEventListener(StageControlEvent.UPDATE_ZOOM,this.stageControlPanel_updateZoomHandler);
			this.stageControlPanel.addEventListener(StageControlEvent.FIT_TO_STAGE,this.stageControlPanel_fitToStageHandler);
		}
		
		private function sceneEditor_viewLoadCompleteHandler(param1:Event) : void
		{
			if(this._playAddSceneEffect)
			{
				this.addSceneEffect.play([this.sceneEditor.view]);
				this._playAddSceneEffect = false;
			}
		}
		
		public function set enableAddSceneEffect(param1:Boolean) : void
		{
			this._playAddSceneEffect = param1;
		}
		
		protected function initAddSceneDropDownList() : void
		{
			var _loc1_:ArrayCollection = new ArrayCollection();
			var _loc2_:UserExperimentManager = UserExperimentManager.instance;
			if(_loc2_.experimentId == UserExperimentManager.ADD_SCENE_BUTTON_EXPERIMENT_ID)
			{
				_loc1_.addItem(new MenuItemModel(UtilDict.translate(ADD_SCENE_BUTTON_LABEL),MENU_ITEM_KEY_ADD_BLANK_SCENE));
				_loc1_.addItem(new MenuItemModel(UtilDict.translate(CONTINUE_SCENE_BUTTON_LABEL),MENU_ITEM_KEY_ADD_SCENE));
			}
			else
			{
				_loc1_.addItem(new MenuItemModel(UtilDict.translate(ADD_SCENE_BUTTON_LABEL),MENU_ITEM_KEY_ADD_SCENE));
				_loc1_.addItem(new MenuItemModel(UtilDict.translate(ADD_BLANK_SCENE_BUTTON_LABEL),MENU_ITEM_KEY_ADD_BLANK_SCENE));
			}
			this.addSceneDropDownList.dataProvider = _loc1_;
		}
		
		private function zoomContainer_stageZoomUpdateHandler(param1:StageControlEvent) : void
		{
			this.sceneEditor.hideControl();
			this.sceneEditor.selectionTool.zoomFactor = this.zoomContainer.zoomFactor;
			this.sceneEditor.scaleFactor = 1 / this.zoomContainer.zoomFactor;
			this.stageControlPanel.updateZoomSlider(param1.zoomValue);
		}
		
		public function get currentScene() : AnimeScene
		{
			if(this._console)
			{
				return this._console.currentScene;
			}
			return null;
		}
		
		public function setLoadingStatus(param1:Boolean) : void
		{
			mouseEnabled = !param1;
			mouseChildren = !param1;
		}
		
		public function showAutoSaveHints() : void
		{
			this.autoSaveMessage.visible = true;
		}
		
		private function resizeHandler(param1:Event) : void
		{
			this.updateStageArea();
		}
		
		private function updateStageArea() : void
		{
			this.validateNow();
			var _loc1_:Number = this.width;
			var _loc2_:Number = this.height - this.toolBar.height;
			this._stageArea.width = _loc1_;
			this._stageArea.height = _loc2_;
		}
		
		public function updateButtonBar() : void
		{
			var _loc2_:Rectangle = null;
			var _loc3_:Asset = null;
			var _loc4_:IAssetView = null;
			var _loc5_:AssetCollectionController = null;
			if(!this.currentScene)
			{
				return;
			}
			var _loc1_:AssetViewCollection = this.sceneEditor.selection;
			this.toolBar.copyEnabled = _loc1_.length > 0;
			if(_loc1_.length == 1)
			{
				_loc4_ = _loc1_.selectedAsset;
				if(_loc4_)
				{
					_loc3_ = _loc4_.asset;
					if(_loc3_ && _loc3_ is EffectAsset && this._console.metaData.mver > 3)
					{
						return;
					}
					this.assetControlBar.target = _loc3_;
				}
			}
			else if(_loc1_.length > 1)
			{
				_loc5_ = AssetControllerFactory.getCollectionController(_loc1_);
				this.assetControlBar.target = _loc5_;
			}
			this.assetControlBar.unpin();
		}
		
		public function showButtonBar() : void
		{
			var _loc2_:Rectangle = null;
			var _loc3_:Asset = null;
			var _loc4_:DisplayObject = null;
			var _loc5_:Number = NaN;
			var _loc6_:Number = NaN;
			var _loc7_:Number = NaN;
			var _loc8_:Number = NaN;
			if(!this.currentScene)
			{
				return;
			}
			var _loc1_:AssetViewCollection = this.sceneEditor.selection;
			_loc2_ = _loc1_.getBounds(this._stageArea);
			if(_loc1_.length == 1)
			{
				_loc3_ = _loc1_.selectedAsset.asset;
				if(_loc3_ && (_loc3_ is EffectAsset && this._console.metaData.mver > 3 || _loc3_ is Background))
				{
					return;
				}
			}
			if(_loc2_)
			{
				if(!(_loc3_ && _loc3_ is Background) && !(_loc3_ && _loc3_ is ProgramEffectAsset && ProgramEffectAsset(_loc3_).isCamera))
				{
					_loc2_.inflate(30,30);
				}
				if(_loc3_ && _loc3_ is ProgramEffectAsset && ProgramEffectAsset(_loc3_).isCamera)
				{
					_loc2_ = this.sceneEditor.controlBox.getBounds(this._stageArea);
				}
				_loc5_ = this.assetControlBar.height;
				_loc6_ = this.assetControlBar.width;
				_loc7_ = _loc2_.x;
				_loc8_ = _loc2_.y - _loc5_;
				if(_loc8_ < 0)
				{
					_loc8_ = 0;
					if(_loc7_ + _loc2_.width + _loc6_ > this._stageArea.width)
					{
						_loc7_ = _loc7_ - _loc6_;
					}
					else
					{
						_loc7_ = _loc7_ + _loc2_.width;
					}
				}
				if(_loc7_ < 0)
				{
					_loc7_ = 0;
				}
				else if(_loc7_ + _loc6_ > this._stageArea.width)
				{
					_loc7_ = this._stageArea.width - _loc6_;
				}
				if(!this.assetControlBar.isPinned)
				{
					this.assetControlBar.move(_loc7_,_loc8_);
				}
				this.assetControlBar.visible = true;
				this._tutorialManager.notifyTutorialAction("asset_control_bar_show");
			}
		}
		
		public function hideButtonBar() : void
		{
			this.assetControlBar.visible = false;
		}
		
		private function addSceneDropDownList_clickHandler() : void
		{
			var _loc1_:UserExperimentManager = UserExperimentManager.instance;
			if(_loc1_.experimentId == UserExperimentManager.ADD_SCENE_BUTTON_EXPERIMENT_ID)
			{
				this._console.addNextScene(true);
			}
			else
			{
				this._console.addNextScene();
			}
		}
		
		private function sceneSettingsButton_clickHandler() : void
		{
			var _loc1_:Asset = this._console.currentScene.background;
			if(_loc1_)
			{
				this._console.currentScene.selectedAsset = this._console.currentScene.background;
				this._console.updateOverTray(this._sceneEditor.getBackgroundAssetView());
			}
			else
			{
				this._console.currentScene.selectedAsset = this._console.currentScene.camera;
				this._console.updateOverTray(this._console.currentScene);
			}
		}
		
		private function addSceneDropDownList_itemClickHandler(param1:MenuItemEvent) : void
		{
			var _loc2_:String = param1.item.value;
			switch(_loc2_)
			{
				case MENU_ITEM_KEY_ADD_SCENE:
					this._console.addNextScene();
					break;
				case MENU_ITEM_KEY_ADD_BLANK_SCENE:
					this._console.addNextScene(true);
			}
		}
		
		private function zoomSliderDataTip(param1:Number) : Object
		{
			return this.percentFormatter.format(param1 * 100) + " %";
		}
		
		public function autoFitMainStage() : void
		{
			var _loc1_:Number = this.zoomContainer.effectiveWidth * ZOOM_FIT_RATIO / AnimeConstants.SCREEN_WIDTH;
			var _loc2_:Number = this.zoomContainer.effectiveHeight * ZOOM_FIT_RATIO / AnimeConstants.screenHeight;
			var _loc3_:Number = _loc1_ > _loc2_?Number(_loc2_):Number(_loc1_);
			this.zoomContainer.zoom(_loc3_);
			this.stageControlPanel.disableFitToStage();
		}
		
		public function autoFitCamrea() : void
		{
			var _loc1_:Asset = null;
			var _loc2_:Rectangle = null;
			var _loc3_:Number = NaN;
			if(this.currentScene)
			{
				_loc1_ = this.currentScene.sizingAsset;
				if(_loc1_)
				{
					_loc2_ = new Rectangle(_loc1_.x + AnimeConstants.STAGE_PADDING,_loc1_.y + AnimeConstants.STAGE_PADDING,_loc1_.width,_loc1_.height);
					_loc3_ = Math.min(this.zoomContainer.effectiveWidth * ZOOM_FIT_RATIO / _loc2_.width,this.zoomContainer.effectiveHeight * ZOOM_FIT_RATIO / _loc2_.height);
					this.zoomContainer.zoomAndPan(_loc3_,_loc2_.x + _loc2_.width * 0.5,_loc2_.y + _loc2_.height * 0.5);
					this.stageControlPanel.enableFitToStage();
				}
			}
		}
		
		public function startAutoSave() : void
		{
			this.toolBar.enabled = false;
		}
		
		public function finishAutoSave() : void
		{
			this.toolBar.enabled = true;
		}
		
		public function updateLastAutoSaveTime(param1:String) : void
		{
			var _loc2_:String = StringUtil.substitute(UtilDict.toDisplay("go","Last saved: {0}"),param1);
			this.toolBar.updateAutoSaveToolTip(_loc2_);
		}
		
		public function get thumbnailRenderer() : SceneView
		{
			return this._thumbnailRenderer;
		}
		
		public function get interactionEnabled() : Boolean
		{
			return this._interactionEnabled;
		}
		
		public function enableInteraction() : void
		{
			this._interactionEnabled = true;
			this.maskGroup.visible = false;
		}
		
		public function disableInteraction() : void
		{
			this._interactionEnabled = false;
			this.maskGroup.visible = true;
		}
		
		private function onTutorialStepStart(param1:TutorialEvent) : void
		{
			var _loc2_:String = param1.tutorialId;
			var _loc3_:String = param1.data;
			if(_loc2_ == TutorialManager.DEFAULT_TUTORIAL_ID)
			{
				switch(_loc3_)
				{
					case "move_motion_destination":
						this.assetControlBar.flipOnlyMode = true;
				}
			}
		}
		
		private function onTutorialStepComplete(param1:TutorialEvent) : void
		{
			var _loc2_:String = param1.tutorialId;
			var _loc3_:String = param1.data;
			if(_loc2_ == TutorialManager.DEFAULT_TUTORIAL_ID)
			{
				switch(_loc3_)
				{
					case "move_motion_destination":
						this.assetControlBar.flipOnlyMode = false;
				}
			}
		}
		
		private function zoomContainer_sliderChangeHandler(param1:Event) : void
		{
			this.stageUpdated();
		}
		
		private function zoomContainer_resizeHandler(param1:Event) : void
		{
			this.stageUpdated();
		}
		
		private function stageControlPanel_updateZoomHandler(param1:StageControlEvent) : void
		{
			var _loc2_:Number = param1.zoomValue;
			if(_loc2_)
			{
				this.zoomContainer.zoom(_loc2_);
				this.stageUpdated();
			}
		}
		
		private function stageControlPanel_fitToStageHandler(param1:StageControlEvent) : void
		{
			this.autoFitMainStage();
		}
		
		private function stageUpdated() : void
		{
			this.stageControlPanel.enableFitToStage();
		}
		
		protected function sceneEditor_assetDragStartHandler(param1:StageControlEvent) : void
		{
			this.zoomContainer.disableScrollBars();
		}
		
		protected function sceneEditor_assetDragCompleteHandler(param1:StageControlEvent) : void
		{
			this.zoomContainer.enableScrollBars();
		}
		
		private function _MainStage_Parallel1_i() : Parallel
		{
			var _loc1_:Parallel = new Parallel();
			_loc1_.children = [this._MainStage_AnimateFilter1_i(),this._MainStage_AnimateFilter2_i()];
			this.addSceneEffect = _loc1_;
			BindingManager.executeBindings(this,"addSceneEffect",this.addSceneEffect);
			return _loc1_;
		}
		
		private function _MainStage_AnimateFilter1_i() : AnimateFilter
		{
			var _loc1_:AnimateFilter = new AnimateFilter();
			_loc1_.duration = 800;
			_loc1_.repeatCount = 1;
			_loc1_.motionPaths = new <MotionPath>[this._MainStage_SimpleMotionPath1_c(),this._MainStage_SimpleMotionPath2_c()];
			this._MainStage_AnimateFilter1 = _loc1_;
			BindingManager.executeBindings(this,"_MainStage_AnimateFilter1",this._MainStage_AnimateFilter1);
			return _loc1_;
		}
		
		private function _MainStage_SimpleMotionPath1_c() : SimpleMotionPath
		{
			var _loc1_:SimpleMotionPath = new SimpleMotionPath();
			_loc1_.property = "blurX";
			_loc1_.valueFrom = 10;
			_loc1_.valueTo = 0;
			return _loc1_;
		}
		
		private function _MainStage_SimpleMotionPath2_c() : SimpleMotionPath
		{
			var _loc1_:SimpleMotionPath = new SimpleMotionPath();
			_loc1_.property = "blurY";
			_loc1_.valueFrom = 10;
			_loc1_.valueTo = 0;
			return _loc1_;
		}
		
		private function _MainStage_AnimateFilter2_i() : AnimateFilter
		{
			var _loc1_:AnimateFilter = new AnimateFilter();
			_loc1_.duration = 800;
			_loc1_.repeatCount = 1;
			_loc1_.motionPaths = new <MotionPath>[this._MainStage_SimpleMotionPath3_c(),this._MainStage_SimpleMotionPath4_c()];
			this._MainStage_AnimateFilter2 = _loc1_;
			BindingManager.executeBindings(this,"_MainStage_AnimateFilter2",this._MainStage_AnimateFilter2);
			return _loc1_;
		}
		
		private function _MainStage_SimpleMotionPath3_c() : SimpleMotionPath
		{
			var _loc1_:SimpleMotionPath = new SimpleMotionPath();
			_loc1_.property = "blurX";
			_loc1_.valueFrom = 0;
			_loc1_.valueTo = 60;
			return _loc1_;
		}
		
		private function _MainStage_SimpleMotionPath4_c() : SimpleMotionPath
		{
			var _loc1_:SimpleMotionPath = new SimpleMotionPath();
			_loc1_.property = "blurY";
			_loc1_.valueFrom = 0;
			_loc1_.valueTo = 60;
			return _loc1_;
		}
		
		private function _MainStage_Sequence1_i() : Sequence
		{
			var _loc1_:Sequence = new Sequence();
			_loc1_.children = [this._MainStage_Fade1_c(),this._MainStage_Pause1_i(),this._MainStage_Fade2_c(),this._MainStage_SetAction1_c()];
			this.autoSaveEffect = _loc1_;
			BindingManager.executeBindings(this,"autoSaveEffect",this.autoSaveEffect);
			return _loc1_;
		}
		
		private function _MainStage_Fade1_c() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 0;
			_loc1_.alphaTo = 1;
			_loc1_.duration = 1500;
			return _loc1_;
		}
		
		private function _MainStage_Pause1_i() : Pause
		{
			var _loc1_:Pause = new Pause();
			_loc1_.duration = 1000;
			this.effectPause = _loc1_;
			BindingManager.executeBindings(this,"effectPause",this.effectPause);
			return _loc1_;
		}
		
		private function _MainStage_Fade2_c() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 1;
			_loc1_.alphaTo = 0;
			_loc1_.duration = 1500;
			return _loc1_;
		}
		
		private function _MainStage_SetAction1_c() : SetAction
		{
			var _loc1_:SetAction = new SetAction();
			_loc1_.property = "visible";
			_loc1_.value = false;
			return _loc1_;
		}
		
		private function _MainStage_Fade3_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 1;
			_loc1_.alphaTo = 0;
			_loc1_.duration = 1000;
			this.fadeOutEffect = _loc1_;
			BindingManager.executeBindings(this,"fadeOutEffect",this.fadeOutEffect);
			return _loc1_;
		}
		
		private function _MainStage_DropShadowFilter1_i() : DropShadowFilter
		{
			var _loc1_:DropShadowFilter = new DropShadowFilter();
			_loc1_.distance = 3;
			this.panDropShadow = _loc1_;
			BindingManager.executeBindings(this,"panDropShadow",this.panDropShadow);
			return _loc1_;
		}
		
		private function _MainStage_NumberFormatter1_i() : NumberFormatter
		{
			var _loc1_:NumberFormatter = new NumberFormatter();
			_loc1_.fractionalDigits = 0;
			_loc1_.initialized(this,"percentFormatter");
			this.percentFormatter = _loc1_;
			BindingManager.executeBindings(this,"percentFormatter",this.percentFormatter);
			return _loc1_;
		}
		
		private function _MainStage_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._MainStage_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MainStage_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15790320;
			return _loc1_;
		}
		
		private function _MainStage_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._MainStage_GoToolBar1_i(),this._MainStage_Group2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _MainStage_GoToolBar1_i() : GoToolBar
		{
			var _loc1_:GoToolBar = new GoToolBar();
			_loc1_.percentWidth = 100;
			_loc1_.height = 50;
			_loc1_.id = "toolBar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.toolBar = _loc1_;
			BindingManager.executeBindings(this,"toolBar",this.toolBar);
			return _loc1_;
		}
		
		private function _MainStage_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentHeight = 100;
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._MainStage_ZoomContainer1_i(),this._MainStage_SceneEditor1_i(),this._MainStage_Group3_c(),this._MainStage_TinyEffectTray1_i(),this._MainStage_AssetResizeToolTip1_i(),this._MainStage_AssetControlBar1_i(),this._MainStage_DurationLimitGroup1_i(),this._MainStage_PreviewSaveGroup1_i(),this._MainStage_HGroup1_i(),this._MainStage_Group4_i()];
			_loc1_.id = "_stageArea";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._stageArea = _loc1_;
			BindingManager.executeBindings(this,"_stageArea",this._stageArea);
			return _loc1_;
		}
		
		private function _MainStage_ZoomContainer1_i() : ZoomContainer
		{
			var _loc1_:ZoomContainer = new ZoomContainer();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.id = "zoomContainer";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.zoomContainer = _loc1_;
			BindingManager.executeBindings(this,"zoomContainer",this.zoomContainer);
			return _loc1_;
		}
		
		private function _MainStage_SceneEditor1_i() : SceneEditor
		{
			var _loc1_:SceneEditor = new SceneEditor();
			_loc1_.addEventListener("assetDragStart",this.___sceneEditor_assetDragStart);
			_loc1_.addEventListener("assetDragComplete",this.___sceneEditor_assetDragComplete);
			_loc1_.id = "_sceneEditor";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._sceneEditor = _loc1_;
			BindingManager.executeBindings(this,"_sceneEditor",this._sceneEditor);
			return _loc1_;
		}
		
		public function ___sceneEditor_assetDragStart(param1:StageControlEvent) : void
		{
			this.sceneEditor_assetDragStartHandler(param1);
		}
		
		public function ___sceneEditor_assetDragComplete(param1:StageControlEvent) : void
		{
			this.sceneEditor_assetDragCompleteHandler(param1);
		}
		
		private function _MainStage_Group3_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.clipAndEnableScrolling = true;
			_loc1_.scaleX = 0.4;
			_loc1_.scaleY = 0.4;
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._MainStage_SceneView1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _MainStage_SceneView1_i() : SceneView
		{
			var _loc1_:SceneView = new SceneView();
			_loc1_.id = "_thumbnailRenderer";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._thumbnailRenderer = _loc1_;
			BindingManager.executeBindings(this,"_thumbnailRenderer",this._thumbnailRenderer);
			return _loc1_;
		}
		
		private function _MainStage_TinyEffectTray1_i() : TinyEffectTray
		{
			var _loc1_:TinyEffectTray = new TinyEffectTray();
			_loc1_.top = 0;
			_loc1_.right = 0;
			_loc1_.id = "tinyEffectTray";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tinyEffectTray = _loc1_;
			BindingManager.executeBindings(this,"tinyEffectTray",this.tinyEffectTray);
			return _loc1_;
		}
		
		private function _MainStage_AssetResizeToolTip1_i() : AssetResizeToolTip
		{
			var _loc1_:AssetResizeToolTip = new AssetResizeToolTip();
			_loc1_.visible = false;
			_loc1_.id = "assetResizeToolTip";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.assetResizeToolTip = _loc1_;
			BindingManager.executeBindings(this,"assetResizeToolTip",this.assetResizeToolTip);
			return _loc1_;
		}
		
		private function _MainStage_AssetControlBar1_i() : AssetControlBar
		{
			var _loc1_:AssetControlBar = new AssetControlBar();
			_loc1_.isOnStage = true;
			_loc1_.visible = false;
			_loc1_.id = "assetControlBar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.assetControlBar = _loc1_;
			BindingManager.executeBindings(this,"assetControlBar",this.assetControlBar);
			return _loc1_;
		}
		
		private function _MainStage_DurationLimitGroup1_i() : DurationLimitGroup
		{
			var _loc1_:DurationLimitGroup = new DurationLimitGroup();
			_loc1_.height = 24;
			_loc1_.top = 48;
			_loc1_.horizontalCenter = 0;
			_loc1_.id = "durationLimitGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.durationLimitGroup = _loc1_;
			BindingManager.executeBindings(this,"durationLimitGroup",this.durationLimitGroup);
			return _loc1_;
		}
		
		private function _MainStage_PreviewSaveGroup1_i() : PreviewSaveGroup
		{
			var _loc1_:PreviewSaveGroup = new PreviewSaveGroup();
			_loc1_.height = 24;
			_loc1_.top = 48;
			_loc1_.horizontalCenter = 0;
			_loc1_.id = "previewSaveGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewSaveGroup = _loc1_;
			BindingManager.executeBindings(this,"previewSaveGroup",this.previewSaveGroup);
			return _loc1_;
		}
		
		private function _MainStage_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.right = 50;
			_loc1_.top = 10;
			_loc1_.verticalAlign = "middle";
			_loc1_.visible = false;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.mxmlContent = [this._MainStage_BitmapImage1_c(),this._MainStage_Label1_i()];
			_loc1_.id = "autoSaveMessage";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.autoSaveMessage = _loc1_;
			BindingManager.executeBindings(this,"autoSaveMessage",this.autoSaveMessage);
			return _loc1_;
		}
		
		private function _MainStage_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_common_autosaveicon_png_179375423;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MainStage_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",2829099);
			_loc1_.setStyle("fontSize",12);
			_loc1_.id = "_MainStage_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._MainStage_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_MainStage_Label1",this._MainStage_Label1);
			return _loc1_;
		}
		
		private function _MainStage_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._MainStage_Rect2_c()];
			_loc1_.id = "maskGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.maskGroup = _loc1_;
			BindingManager.executeBindings(this,"maskGroup",this.maskGroup);
			return _loc1_;
		}
		
		private function _MainStage_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.fill = this._MainStage_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MainStage_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _MainStage_Rect3_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.height = 52;
			_loc1_.bottom = 0;
			_loc1_.fill = this._MainStage_SolidColor3_c();
			_loc1_.initialized(this,"controlGroupRect");
			this.controlGroupRect = _loc1_;
			BindingManager.executeBindings(this,"controlGroupRect",this.controlGroupRect);
			return _loc1_;
		}
		
		private function _MainStage_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			_loc1_.alpha = 0.1;
			return _loc1_;
		}
		
		private function _MainStage_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.height = 52;
			_loc1_.bottom = 0;
			_loc1_.gap = 10;
			_loc1_.verticalAlign = "middle";
			_loc1_.paddingLeft = 10;
			_loc1_.paddingRight = 10;
			_loc1_.mxmlContent = [this._MainStage_StageControlPanel1_i(),this._MainStage_Spacer1_c(),this._MainStage_Button1_i(),this._MainStage_ButtonDropDownList1_i()];
			_loc1_.id = "controlGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.controlGroup = _loc1_;
			BindingManager.executeBindings(this,"controlGroup",this.controlGroup);
			return _loc1_;
		}
		
		private function _MainStage_StageControlPanel1_i() : StageControlPanel
		{
			var _loc1_:StageControlPanel = new StageControlPanel();
			_loc1_.id = "stageControlPanel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.stageControlPanel = _loc1_;
			BindingManager.executeBindings(this,"stageControlPanel",this.stageControlPanel);
			return _loc1_;
		}
		
		private function _MainStage_Spacer1_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.percentWidth = 100;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _MainStage_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.addEventListener("click",this.__sceneSettingsButton_click);
			_loc1_.id = "sceneSettingsButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.sceneSettingsButton = _loc1_;
			BindingManager.executeBindings(this,"sceneSettingsButton",this.sceneSettingsButton);
			return _loc1_;
		}
		
		public function __sceneSettingsButton_click(param1:MouseEvent) : void
		{
			this.sceneSettingsButton_clickHandler();
		}
		
		private function _MainStage_ButtonDropDownList1_i() : ButtonDropDownList
		{
			var _loc1_:ButtonDropDownList = new ButtonDropDownList();
			_loc1_.popUpPosition = "aboveRight";
			_loc1_.addEventListener("click",this.__addSceneDropDownList_click);
			_loc1_.addEventListener("itemClick",this.__addSceneDropDownList_itemClick);
			_loc1_.id = "addSceneDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.addSceneDropDownList = _loc1_;
			BindingManager.executeBindings(this,"addSceneDropDownList",this.addSceneDropDownList);
			return _loc1_;
		}
		
		public function __addSceneDropDownList_click(param1:MouseEvent) : void
		{
			this.addSceneDropDownList_clickHandler();
		}
		
		public function __addSceneDropDownList_itemClick(param1:MenuItemEvent) : void
		{
			this.addSceneDropDownList_itemClickHandler(param1);
		}
		
		private function _MainStage_Rect4_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.width = 7;
			_loc1_.top = 0;
			_loc1_.bottom = 1;
			_loc1_.fill = this._MainStage_LinearGradient1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MainStage_LinearGradient1_c() : LinearGradient
		{
			var _loc1_:LinearGradient = new LinearGradient();
			_loc1_.entries = [this._MainStage_GradientEntry1_c(),this._MainStage_GradientEntry2_c()];
			return _loc1_;
		}
		
		private function _MainStage_GradientEntry1_c() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.color = 0;
			_loc1_.alpha = 0.05;
			return _loc1_;
		}
		
		private function _MainStage_GradientEntry2_c() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.color = 0;
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _MainStage_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._MainStage_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MainStage_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14737632;
			return _loc1_;
		}
		
		private function _MainStage_Rect5_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.bottom = 0;
			_loc1_.height = 10;
			_loc1_.fill = this._MainStage_LinearGradient2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _MainStage_LinearGradient2_c() : LinearGradient
		{
			var _loc1_:LinearGradient = new LinearGradient();
			_loc1_.rotation = 90;
			_loc1_.entries = [this._MainStage_GradientEntry3_c(),this._MainStage_GradientEntry4_c()];
			return _loc1_;
		}
		
		private function _MainStage_GradientEntry3_c() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.color = 3355443;
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _MainStage_GradientEntry4_c() : GradientEntry
		{
			var _loc1_:GradientEntry = new GradientEntry();
			_loc1_.color = 3355443;
			_loc1_.alpha = 0.08;
			return _loc1_;
		}
		
		public function ___MainStage_Group1_resize(param1:ResizeEvent) : void
		{
			this.resizeHandler(param1);
		}
		
		public function ___MainStage_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _MainStage_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():IBitmapFilter
			{
				return new BlurFilter();
			},null,"_MainStage_AnimateFilter1.bitmapFilter");
			result[1] = new Binding(this,function():IBitmapFilter
			{
				return new GlowFilter(0);
			},null,"_MainStage_AnimateFilter2.bitmapFilter");
			result[2] = new Binding(this,null,null,"durationLimitGroup.visible","durationWarningVisible");
			result[3] = new Binding(this,null,null,"previewSaveGroup.visible","previewSaveWarningVisible");
			result[4] = new Binding(this,null,function(param1:*):void
			{
				autoSaveMessage.setStyle("showEffect",param1);
			},"autoSaveMessage.showEffect","autoSaveEffect");
			result[5] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Autosave completed");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_MainStage_Label1.text");
			result[6] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Scene Settings");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"sceneSettingsButton.label");
			result[7] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Add Scene");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"addSceneDropDownList.label");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _sceneEditor() : SceneEditor
		{
			return this._1307120806_sceneEditor;
		}
		
		public function set _sceneEditor(param1:SceneEditor) : void
		{
			var _loc2_:Object = this._1307120806_sceneEditor;
			if(_loc2_ !== param1)
			{
				this._1307120806_sceneEditor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sceneEditor",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _stageArea() : Group
		{
			return this._347427628_stageArea;
		}
		
		public function set _stageArea(param1:Group) : void
		{
			var _loc2_:Object = this._347427628_stageArea;
			if(_loc2_ !== param1)
			{
				this._347427628_stageArea = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_stageArea",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _thumbnailRenderer() : SceneView
		{
			return this._194196304_thumbnailRenderer;
		}
		
		public function set _thumbnailRenderer(param1:SceneView) : void
		{
			var _loc2_:Object = this._194196304_thumbnailRenderer;
			if(_loc2_ !== param1)
			{
				this._194196304_thumbnailRenderer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_thumbnailRenderer",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get addSceneDropDownList() : ButtonDropDownList
		{
			return this._1553880186addSceneDropDownList;
		}
		
		public function set addSceneDropDownList(param1:ButtonDropDownList) : void
		{
			var _loc2_:Object = this._1553880186addSceneDropDownList;
			if(_loc2_ !== param1)
			{
				this._1553880186addSceneDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addSceneDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get addSceneEffect() : Parallel
		{
			return this._62171684addSceneEffect;
		}
		
		public function set addSceneEffect(param1:Parallel) : void
		{
			var _loc2_:Object = this._62171684addSceneEffect;
			if(_loc2_ !== param1)
			{
				this._62171684addSceneEffect = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addSceneEffect",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get assetControlBar() : AssetControlBar
		{
			return this._987258746assetControlBar;
		}
		
		public function set assetControlBar(param1:AssetControlBar) : void
		{
			var _loc2_:Object = this._987258746assetControlBar;
			if(_loc2_ !== param1)
			{
				this._987258746assetControlBar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetControlBar",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get assetResizeToolTip() : AssetResizeToolTip
		{
			return this._533588863assetResizeToolTip;
		}
		
		public function set assetResizeToolTip(param1:AssetResizeToolTip) : void
		{
			var _loc2_:Object = this._533588863assetResizeToolTip;
			if(_loc2_ !== param1)
			{
				this._533588863assetResizeToolTip = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetResizeToolTip",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get autoSaveEffect() : Sequence
		{
			return this._1081950333autoSaveEffect;
		}
		
		public function set autoSaveEffect(param1:Sequence) : void
		{
			var _loc2_:Object = this._1081950333autoSaveEffect;
			if(_loc2_ !== param1)
			{
				this._1081950333autoSaveEffect = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoSaveEffect",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get autoSaveMessage() : HGroup
		{
			return this._1969575579autoSaveMessage;
		}
		
		public function set autoSaveMessage(param1:HGroup) : void
		{
			var _loc2_:Object = this._1969575579autoSaveMessage;
			if(_loc2_ !== param1)
			{
				this._1969575579autoSaveMessage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoSaveMessage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get controlGroup() : HGroup
		{
			return this._1645186270controlGroup;
		}
		
		public function set controlGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._1645186270controlGroup;
			if(_loc2_ !== param1)
			{
				this._1645186270controlGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get controlGroupRect() : Rect
		{
			return this._2089082918controlGroupRect;
		}
		
		public function set controlGroupRect(param1:Rect) : void
		{
			var _loc2_:Object = this._2089082918controlGroupRect;
			if(_loc2_ !== param1)
			{
				this._2089082918controlGroupRect = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlGroupRect",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get durationLimitGroup() : DurationLimitGroup
		{
			return this._1350756296durationLimitGroup;
		}
		
		public function set durationLimitGroup(param1:DurationLimitGroup) : void
		{
			var _loc2_:Object = this._1350756296durationLimitGroup;
			if(_loc2_ !== param1)
			{
				this._1350756296durationLimitGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationLimitGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get effectPause() : Pause
		{
			return this._1646841573effectPause;
		}
		
		public function set effectPause(param1:Pause) : void
		{
			var _loc2_:Object = this._1646841573effectPause;
			if(_loc2_ !== param1)
			{
				this._1646841573effectPause = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectPause",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get fadeOutEffect() : Fade
		{
			return this._733607779fadeOutEffect;
		}
		
		public function set fadeOutEffect(param1:Fade) : void
		{
			var _loc2_:Object = this._733607779fadeOutEffect;
			if(_loc2_ !== param1)
			{
				this._733607779fadeOutEffect = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeOutEffect",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get maskGroup() : Group
		{
			return this._74026253maskGroup;
		}
		
		public function set maskGroup(param1:Group) : void
		{
			var _loc2_:Object = this._74026253maskGroup;
			if(_loc2_ !== param1)
			{
				this._74026253maskGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get panDropShadow() : DropShadowFilter
		{
			return this._355954324panDropShadow;
		}
		
		public function set panDropShadow(param1:DropShadowFilter) : void
		{
			var _loc2_:Object = this._355954324panDropShadow;
			if(_loc2_ !== param1)
			{
				this._355954324panDropShadow = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panDropShadow",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get percentFormatter() : NumberFormatter
		{
			return this._1931449851percentFormatter;
		}
		
		public function set percentFormatter(param1:NumberFormatter) : void
		{
			var _loc2_:Object = this._1931449851percentFormatter;
			if(_loc2_ !== param1)
			{
				this._1931449851percentFormatter = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"percentFormatter",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewSaveGroup() : PreviewSaveGroup
		{
			return this._1245730790previewSaveGroup;
		}
		
		public function set previewSaveGroup(param1:PreviewSaveGroup) : void
		{
			var _loc2_:Object = this._1245730790previewSaveGroup;
			if(_loc2_ !== param1)
			{
				this._1245730790previewSaveGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewSaveGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sceneSettingsButton() : Button
		{
			return this._775624479sceneSettingsButton;
		}
		
		public function set sceneSettingsButton(param1:Button) : void
		{
			var _loc2_:Object = this._775624479sceneSettingsButton;
			if(_loc2_ !== param1)
			{
				this._775624479sceneSettingsButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneSettingsButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get stageControlPanel() : StageControlPanel
		{
			return this._548081861stageControlPanel;
		}
		
		public function set stageControlPanel(param1:StageControlPanel) : void
		{
			var _loc2_:Object = this._548081861stageControlPanel;
			if(_loc2_ !== param1)
			{
				this._548081861stageControlPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stageControlPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tinyEffectTray() : TinyEffectTray
		{
			return this._1212031097tinyEffectTray;
		}
		
		public function set tinyEffectTray(param1:TinyEffectTray) : void
		{
			var _loc2_:Object = this._1212031097tinyEffectTray;
			if(_loc2_ !== param1)
			{
				this._1212031097tinyEffectTray = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tinyEffectTray",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get toolBar() : GoToolBar
		{
			return this._1140124837toolBar;
		}
		
		public function set toolBar(param1:GoToolBar) : void
		{
			var _loc2_:Object = this._1140124837toolBar;
			if(_loc2_ !== param1)
			{
				this._1140124837toolBar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolBar",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get zoomContainer() : ZoomContainer
		{
			return this._237378066zoomContainer;
		}
		
		public function set zoomContainer(param1:ZoomContainer) : void
		{
			var _loc2_:Object = this._237378066zoomContainer;
			if(_loc2_ !== param1)
			{
				this._237378066zoomContainer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zoomContainer",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get durationWarningVisible() : Boolean
		{
			return this._1348266006durationWarningVisible;
		}
		
		public function set durationWarningVisible(param1:Boolean) : void
		{
			var _loc2_:Object = this._1348266006durationWarningVisible;
			if(_loc2_ !== param1)
			{
				this._1348266006durationWarningVisible = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationWarningVisible",_loc2_,param1));
				}
			}
		}
		
		public function set previewSaveWarningVisible(param1:Boolean) : void
		{
			var _loc2_:Object = this.previewSaveWarningVisible;
			if(_loc2_ !== param1)
			{
				this._254198277previewSaveWarningVisible = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewSaveWarningVisible",_loc2_,param1));
				}
			}
		}
	}
}
