package anifire.studio.components
{
	import anifire.constant.AnimeConstants;
	import anifire.constant.LicenseConstants;
	import anifire.event.ExtraDataEvent;
	import anifire.studio.commands.ChangeSceneDurationOptionCommand;
	import anifire.studio.commands.ICommand;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.AnimeSound;
	import anifire.studio.core.BackgroundThumb;
	import anifire.studio.core.Console;
	import anifire.studio.events.MenuItemEvent;
	import anifire.studio.events.SceneEvent;
	import anifire.studio.interfaces.ITimelineElement;
	import anifire.studio.interfaces.ITimelineMenuSource;
	import anifire.studio.managers.SceneManager;
	import anifire.studio.models.MenuItemModel;
	import anifire.util.UtilDict;
	import anifire.util.UtilErrorLogger;
	import anifire.util.UtilUnitConvert;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.controls.SWFLoader;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.DragSource;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.DragEvent;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.managers.CursorManager;
	import mx.managers.DragManager;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.utils.StringUtil;
	import spark.components.Group;
	import spark.components.Image;
	import spark.components.Label;
	import spark.effects.Fade;
	import spark.filters.DropShadowFilter;
	import spark.primitives.BitmapImage;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	import spark.primitives.RectangularDropShadow;
	
	use namespace mx_internal;
	
	public class SceneElement extends Group implements ITimelineElement, ITimelineMenuSource, IBindingClient, IStateClient2
	{
		
		private static const imgResize:Class = SceneElement_imgResize;
		
		private static const imgClear:Class = SceneElement_imgClear;
		
		private static const imgCopy:Class = SceneElement_imgCopy;
		
		private static const imgDelete:Class = SceneElement_imgDelete;
		
		private static const imgDuration:Class = SceneElement_imgDuration;
		
		private static const imgInsertAfter:Class = SceneElement_imgInsertAfter;
		
		private static const imgInsertBefore:Class = SceneElement_imgInsertBefore;
		
		private static const imgPreview:Class = SceneElement_imgPreview;
		
		private static const imgSceneSetting:Class = SceneElement_imgSceneSetting;
		
		public static const TRIGGER_ID:String = "dropdown";
		
		private static const MENU_LABEL_SCENE_LENGTH:String = "timeline_duration";
		
		private static const MENU_LABEL_SCENE_LENGTH_1:String = "timeline_1sec";
		
		private static const MENU_LABEL_SCENE_LENGTH_2:String = "timeline_2sec";
		
		private static const MENU_LABEL_SCENE_LENGTH_3:String = "timeline_3sec";
		
		private static const MENU_LABEL_SCENE_LENGTH_4:String = "timeline_4sec";
		
		private static const MENU_LABEL_SCENE_LENGTH_6:String = "timeline_6sec";
		
		private static const MENU_LABEL_COPY:String = "timeline_copy";
		
		private static const MENU_LABEL_DELETE:String = "timeline_delete";
		
		private static const MENU_LABEL_CLEAR:String = "timeline_clear";
		
		private static const MENU_LABEL_PASTE_BEFORE:String = "timeline_insertbefore";
		
		private static const MENU_LABEL_PASTE_AFTER:String = "timeline_insertafter";
		
		private static const MENU_LABEL_PREVIEW_SCENE:String = "Preview from here";
		
		public static const DRAG_DATA_FORMAT:String = "SceneElement";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _SceneElement_Group6:Group;
		
		public var _SceneElement_Rect1:Rect;
		
		public var _SceneElement_RectangularDropShadow1:RectangularDropShadow;
		
		public var _SceneElement_SWFLoader1:SWFLoader;
		
		private var _2038272553_SceneElement_SolidColor1:SolidColor;
		
		private var _2038272554_SceneElement_SolidColor2:SolidColor;
		
		private var _98309cce:Fade;
		
		private var _541768759chapterBreakImage:BitmapImage;
		
		private var _1736126340dragHandle:Group;
		
		private var _1419185120dropIndicator:Group;
		
		private var _1131896221menuDisplay:PopUpAnchor;
		
		private var _2060064815sceneImage:BitmapImage;
		
		private var _1654993370sceneLabelDisplay:Label;
		
		private var _1729133579sceneMenu:MenuItemList;
		
		private var _1955108705sceneThumbnailGroup:Group;
		
		private var _482586504toolTipAnchor:PopUpAnchor;
		
		private var _459096927toolTipDisplay:SceneToolTip;
		
		private var _150593027toolTipMarker:Line;
		
		private var _1280875879trans_cs:SceneTransitionView;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _bitmapData:BitmapData;
		
		private var _focus:Boolean = false;
		
		private var _1472470539_label:String = " ";
		
		private var _1699337934_speechText:String;
		
		private var _prop:Object;
		
		private var _scene:AnimeScene;
		
		private var _mouseDown:Boolean = false;
		
		private var _timelineControl:Timeline = null;
		
		private var _id:String;
		
		private var _motionTime:Number = 0;
		
		private var _showWaveform:Boolean = false;
		
		private var _toolTipTimer:Timer;
		
		private var pasteBeforeItem:MenuItemModel;
		
		private var pasteAfterItem:MenuItemModel;
		
		private var _1035782592_isThumbnailReady:Boolean;
		
		private var cursorID:int;
		
		private var isResizing:Boolean = false;
		
		private var _animeSound:AnimeSound;
		
		private var _embed_mxml__styles_images_timeline_loading_swf_970254217:Class;
		
		private var _embed_mxml__styles_images_timeline_timeline_chapter_break_png_2020576519:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function SceneElement()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._toolTipTimer = new Timer(200,1);
			this._embed_mxml__styles_images_timeline_loading_swf_970254217 = SceneElement__embed_mxml__styles_images_timeline_loading_swf_970254217;
			this._embed_mxml__styles_images_timeline_timeline_chapter_break_png_2020576519 = SceneElement__embed_mxml__styles_images_timeline_timeline_chapter_break_png_2020576519;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._SceneElement_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneElementWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return SceneElement[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 300;
			this.percentHeight = 100;
			this.mxmlContent = [this._SceneElement_Line1_c(),this._SceneElement_Group2_i(),this._SceneElement_Group6_i(),this._SceneElement_Group7_i()];
			this.currentState = "normal";
			this._SceneElement_Fade1_i();
			this.addEventListener("creationComplete",this.___SceneElement_Group1_creationComplete);
			this.addEventListener("dragEnter",this.___SceneElement_Group1_dragEnter);
			this.addEventListener("dragDrop",this.___SceneElement_Group1_dragDrop);
			this.addEventListener("dragOver",this.___SceneElement_Group1_dragOver);
			this.addEventListener("dragExit",this.___SceneElement_Group1_dragExit);
			var _SceneElement_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SceneElement_Rect1_i);
			var _SceneElement_RectangularDropShadow1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SceneElement_RectangularDropShadow1_i);
			states = [new State({
				"name":"normal",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_SceneElement_SolidColor2",
					"name":"alpha",
					"value":0.35
				})]
			}),new State({
				"name":"hovered",
				"stateGroups":["hoveredAndSelected"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SceneElement_Rect1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["sceneThumbnailGroup"]
				}),new SetProperty().initializeFromObject({
					"target":"_SceneElement_SolidColor1",
					"name":"alpha",
					"value":0.3
				}),new SetProperty().initializeFromObject({
					"target":"_SceneElement_SolidColor2",
					"name":"color",
					"value":3062438
				})]
			}),new State({
				"name":"selected",
				"stateGroups":["hoveredAndSelected"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SceneElement_RectangularDropShadow1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SceneElement_Group6"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_SceneElement_Rect1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["sceneThumbnailGroup"]
				}),new SetProperty().initializeFromObject({
					"target":"_SceneElement_SolidColor2",
					"name":"color",
					"value":3062438
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
			SceneElement._watcherSetupUtil = param1;
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
		
		private function initApp() : void
		{
			this.sceneImage.width = !!LicenseConstants.isWideScreen()?Number(90):Number(80);
			this.createMenuModel();
		}
		
		override public function get id() : String
		{
			return this._id;
		}
		
		override public function set id(param1:String) : void
		{
			this._id = param1;
		}
		
		[Bindable(event="propertyChange")]
		public function get scene() : AnimeScene
		{
			return this._scene;
		}
		
		private function set _109254796scene(param1:AnimeScene) : void
		{
			if(this._scene != param1)
			{
				if(this._scene)
				{
					this._scene.removeEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
					this._scene.removeEventListener(SceneEvent.TRANSITION_CHANGE,this.onSceneTransitionChange);
				}
				this._scene = param1;
				this.updateSceneTransitionView();
				if(this._scene)
				{
					this._scene.addEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
					this._scene.addEventListener(SceneEvent.TRANSITION_CHANGE,this.onSceneTransitionChange);
				}
			}
		}
		
		private function onSceneDurationChange(param1:Event) : void
		{
			if(this._scene)
			{
				this.width = UtilUnitConvert.frameToPixel(this._scene.totalFrames);
				this.toolTipDisplay.text = this.getLabel();
			}
		}
		
		private function onSceneTransitionChange(param1:Event) : void
		{
			this.updateSceneTransitionView();
		}
		
		private function updateSceneTransitionView() : void
		{
			if(this._scene && this._scene.transition)
			{
				this.trans_cs.transDur = this._scene.transition.duration;
				this.trans_cs.transType = this._scene.transition.type;
			}
			else
			{
				this.trans_cs.transType = "";
			}
		}
		
		public function set focus(param1:Boolean) : void
		{
			if(this._focus != param1)
			{
				this._focus = param1;
				this.currentState = !!this._focus?"selected":"normal";
			}
		}
		
		public function get focus() : Boolean
		{
			return this._focus;
		}
		
		[Bindable(event="dataChange")]
		public function get source() : BitmapData
		{
			return this._bitmapData;
		}
		
		[Bindable(event="dataChange")]
		public function get label() : String
		{
			return this._label;
		}
		
		[Bindable(event="dataChange")]
		public function get prop() : Object
		{
			return this._prop;
		}
		
		public function set source(param1:BitmapData) : void
		{
			var value:BitmapData = param1;
			try
			{
				if(value != null)
				{
					this._isThumbnailReady = true;
				}
				if(value && value.width > 0 && value.height > 0)
				{
					this._bitmapData = value;
					this.sceneImage.source = value;
				}
				return;
			}
			catch(e:Error)
			{
				UtilErrorLogger.getInstance().error("SceneElement::source" + e);
				return;
			}
		}
		
		public function set label(param1:String) : void
		{
			this._label = param1;
			dispatchEvent(new Event("dataChange"));
		}
		
		public function set prop(param1:Object) : void
		{
			this._prop = param1;
			dispatchEvent(new Event("dataChange"));
		}
		
		public function get totalTime() : Number
		{
			return width;
		}
		
		public function get startTime() : Number
		{
			return x;
		}
		
		public function set motionTime(param1:Number) : void
		{
			this._motionTime = param1;
		}
		
		public function get motionTime() : Number
		{
			return this._motionTime;
		}
		
		public function get actionTime() : Number
		{
			return this.totalTime - this.motionTime;
		}
		
		public function setTimelineReferer(param1:Timeline) : void
		{
			this._timelineControl = param1;
		}
		
		public function showIndicator() : void
		{
			this._timelineControl.clearChildrenMenu();
			this.toolTipAnchor.displayPopUp = true;
			this.toolTipDisplay.text = this.getLabel();
			this.toolTipMarker.bottom = -this._timelineControl.contentHeight;
		}
		
		public function removeIndicator() : void
		{
			this.toolTipAnchor.displayPopUp = false;
		}
		
		private function formatTime(param1:Number) : String
		{
			var _loc2_:Number = Math.floor(param1 / 60);
			param1 = param1 % 60;
			if(_loc2_ > 0)
			{
				return _loc2_ + ":" + (param1 >= 10?param1.toFixed(2):"0" + param1.toFixed(2));
			}
			return param1.toFixed(2);
		}
		
		private function getLabel() : String
		{
			var _loc1_:Number = UtilUnitConvert.pixelToSec(x);
			var _loc2_:Number = UtilUnitConvert.pixelToSec(width);
			var _loc3_:String = StringUtil.substitute(UtilDict.toDisplay("go","Start time: {0}"),this.formatTime(_loc1_));
			var _loc4_:String = StringUtil.substitute(UtilDict.toDisplay("go","Duration: {0}"),this.formatTime(_loc2_));
			var _loc5_:String = StringUtil.substitute(UtilDict.toDisplay("go","End time: {0}"),this.formatTime(_loc1_ + _loc2_));
			return _loc3_ + "\n" + _loc4_ + "\n" + _loc5_;
		}
		
		private function onMouseDownHandler(param1:MouseEvent) : void
		{
			this._mouseDown = true;
			stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
		}
		
		private function onMouseUpHandler(param1:MouseEvent) : void
		{
			this._mouseDown = false;
			if(this.isResizing)
			{
				this.isResizing = false;
				CursorManager.removeCursor(this.cursorID);
			}
			if(stage != null)
			{
				stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUpHandler);
				this.removeIndicator();
			}
		}
		
		public function currentScenehasSpeech() : Boolean
		{
			var _loc1_:AnimeScene = Console.getConsole().currentScene;
			if(Console.getConsole().linkageController.getSpeechSoundIdByScene(_loc1_) != "")
			{
				return true;
			}
			return false;
		}
		
		private function createMenuModel() : void
		{
			var _loc1_:ArrayCollection = new ArrayCollection();
			_loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_COPY),MENU_LABEL_COPY,MenuItemModel.MENU_TYPE_NORMAL,null,imgCopy));
			this.pasteBeforeItem = new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_PASTE_BEFORE),MENU_LABEL_PASTE_BEFORE,MenuItemModel.MENU_TYPE_NORMAL,null,imgInsertBefore);
			_loc1_.addItem(this.pasteBeforeItem);
			this.pasteAfterItem = new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_PASTE_AFTER),MENU_LABEL_PASTE_AFTER,MenuItemModel.MENU_TYPE_NORMAL,null,imgInsertAfter);
			_loc1_.addItem(this.pasteAfterItem);
			_loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_DELETE),MENU_LABEL_DELETE,MenuItemModel.MENU_TYPE_NORMAL,null,imgDelete));
			_loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_CLEAR),MENU_LABEL_CLEAR,MenuItemModel.MENU_TYPE_NORMAL,null,imgClear));
			_loc1_.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
			_loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Scene Settings"),"sceneSettings",MenuItemModel.MENU_TYPE_NORMAL,null,imgSceneSetting));
			var _loc2_:ArrayCollection = new ArrayCollection();
			_loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Fit to all scene content"),"lengthAuto"));
			_loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Fit to speech duration"),"lengthFitSpeech"));
			_loc2_.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
			_loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SCENE_LENGTH_1),MENU_LABEL_SCENE_LENGTH_1));
			_loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SCENE_LENGTH_2),MENU_LABEL_SCENE_LENGTH_2));
			_loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SCENE_LENGTH_4),MENU_LABEL_SCENE_LENGTH_4));
			_loc2_.addItem(new MenuItemModel(UtilDict.toDisplay("go","6 secs"),MENU_LABEL_SCENE_LENGTH_6));
			var _loc3_:MenuItemModel = new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_SCENE_LENGTH),null,MenuItemModel.MENU_TYPE_NORMAL,_loc2_,imgDuration);
			_loc1_.addItem(_loc3_);
			_loc1_.addItem(new MenuItemModel(UtilDict.toDisplay("go",MENU_LABEL_PREVIEW_SCENE),MENU_LABEL_PREVIEW_SCENE,MenuItemModel.MENU_TYPE_NORMAL,null,imgPreview));
			this.sceneMenu.dataProvider = _loc1_;
		}
		
		private function showMenu(param1:Number) : void
		{
			this.pasteBeforeItem.enabled = SceneManager.copiedScene != null;
			this.pasteAfterItem.enabled = SceneManager.copiedScene != null;
			if(!this._timelineControl.disableScenePopUpMenu)
			{
				this.menuDisplay.x = param1;
				this.menuDisplay.displayPopUp = true;
			}
			this._timelineControl.activeMenuItem = this;
		}
		
		public function removeMenu() : void
		{
			this.menuDisplay.displayPopUp = false;
		}
		
		protected function getSceneCanvas() : Group
		{
			if(Console.getConsole().timeline == null)
			{
				return null;
			}
			return Console.getConsole().timeline;
		}
		
		private function onSceneMenuItemClick(param1:MenuItemEvent) : void
		{
			var _loc3_:ICommand = null;
			var _loc2_:String = param1.item.value;
			switch(_loc2_)
			{
				case MENU_LABEL_SCENE_LENGTH_1:
					Console.getConsole().timelineController.changeSceneDuration(this._scene,1 * AnimeConstants.FRAME_PER_SEC);
					break;
				case MENU_LABEL_SCENE_LENGTH_2:
					Console.getConsole().timelineController.changeSceneDuration(this._scene,2 * AnimeConstants.FRAME_PER_SEC);
					break;
				case MENU_LABEL_SCENE_LENGTH_4:
					Console.getConsole().timelineController.changeSceneDuration(this._scene,4 * AnimeConstants.FRAME_PER_SEC);
					break;
				case MENU_LABEL_SCENE_LENGTH_6:
					Console.getConsole().timelineController.changeSceneDuration(this._scene,6 * AnimeConstants.FRAME_PER_SEC);
					break;
				case "lengthAuto":
					_loc3_ = new ChangeSceneDurationOptionCommand(this._scene,true,true,true,true,true,true);
					_loc3_.execute();
					break;
				case "lengthFitSpeech":
					_loc3_ = new ChangeSceneDurationOptionCommand(this._scene,true,false,false,false,false,true);
					_loc3_.execute();
					break;
				case "duplicate":
					Console.getConsole().copyCurrentScene();
					Console.getConsole().pasteScene();
					break;
				case MENU_LABEL_COPY:
					Console.getConsole().copyCurrentScene();
					break;
				case MENU_LABEL_DELETE:
					Console.getConsole().deleteCurrentScene(TRIGGER_ID);
					break;
				case MENU_LABEL_CLEAR:
					Console.getConsole().clearCurrentScene(TRIGGER_ID);
					break;
				case MENU_LABEL_PASTE_BEFORE:
					Console.getConsole().pasteScene(false);
					break;
				case MENU_LABEL_PASTE_AFTER:
					Console.getConsole().pasteScene();
					break;
				case MENU_LABEL_PREVIEW_SCENE:
					Console.getConsole().preview(true);
					break;
				case "sceneSettings":
					this.showSceneSettingTray();
			}
		}
		
		private function showSceneSettingTray() : void
		{
			Console.getConsole().currentScene.selectedAsset = null;
			Console.getConsole().showOverTray(true,Console.getConsole().currentScene);
		}
		
		private function changeArrowCursor(param1:Boolean) : void
		{
			if(!this.isResizing)
			{
				if(param1)
				{
					this.cursorID = CursorManager.setCursor(imgResize,3,-10.5,-6);
				}
				else
				{
					CursorManager.removeCursor(this.cursorID);
				}
			}
		}
		
		private function enableDragScene(param1:MouseEvent) : void
		{
			this.isResizing = true;
			this.showIndicator();
			dispatchEvent(new ExtraDataEvent("ArrowClick",this,param1));
		}
		
		public function get speechText() : String
		{
			return this._speechText;
		}
		
		public function updateSpeechComment(param1:String, param2:AnimeSound) : void
		{
		}
		
		private function onSceneClick(param1:MouseEvent) : void
		{
			this.showMenu(param1.localX);
		}
		
		private function onMouseMove(param1:MouseEvent) : void
		{
			var _loc2_:DragSource = null;
			var _loc3_:Image = null;
			if(!this.isResizing && this._focus && this._mouseDown)
			{
				_loc2_ = new DragSource();
				_loc2_.addData(this,DRAG_DATA_FORMAT);
				_loc3_ = new Image();
				_loc3_.source = new Bitmap(this.source);
				_loc3_.width = this.sceneImage.getLayoutBoundsWidth();
				_loc3_.height = this.sceneImage.getLayoutBoundsHeight();
				DragManager.doDrag(this,_loc2_,param1,_loc3_,20 - this.mouseX,20 - this.mouseY);
				this.removeIndicator();
			}
		}
		
		private function dragEnterHandler(param1:DragEvent) : void
		{
			if(param1.dragSource.hasFormat(BackgroundThumb.STARTER_DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(DRAG_DATA_FORMAT) && param1.dragSource.dataForFormat(DRAG_DATA_FORMAT) != this)
			{
				DragManager.acceptDragDrop(SceneElement(param1.target));
				if(param1.dragSource.hasFormat(BackgroundThumb.STARTER_DRAG_DATA_FORMAT))
				{
					DragManager.showFeedback(DragManager.COPY);
				}
				else
				{
					DragManager.showFeedback(DragManager.MOVE);
				}
			}
		}
		
		private function dragDropHandler(param1:DragEvent) : void
		{
			var _loc4_:SceneElement = null;
			var _loc5_:Number = NaN;
			var _loc6_:BackgroundThumb = null;
			var _loc2_:Console = Console.getConsole();
			this.dropIndicator.visible = false;
			var _loc3_:Number = Number(this.label) - 1;
			if(this.mouseX > this.width * 0.5)
			{
				_loc3_++;
			}
			if(param1.dragSource.hasFormat(DRAG_DATA_FORMAT))
			{
				_loc4_ = SceneElement(param1.dragSource.dataForFormat(DRAG_DATA_FORMAT));
				_loc5_ = Number(_loc4_.label) - 1;
				if(_loc5_ != _loc3_ && _loc3_ - _loc5_ != 1)
				{
					_loc2_.moveScene(_loc5_,_loc3_);
				}
			}
			else if(param1.dragSource.hasFormat(BackgroundThumb.STARTER_DRAG_DATA_FORMAT))
			{
				_loc6_ = param1.dragSource.dataForFormat(BackgroundThumb.STARTER_DRAG_DATA_FORMAT) as BackgroundThumb;
				Console.getConsole().addStarter(_loc6_,_loc3_,false,true);
			}
		}
		
		private function dragOverHandler(param1:DragEvent) : void
		{
			if(param1.dragSource.hasFormat(BackgroundThumb.STARTER_DRAG_DATA_FORMAT) || param1.dragSource.hasFormat(DRAG_DATA_FORMAT) != this)
			{
				if(!this.dropIndicator.visible)
				{
					this.dropIndicator.visible = true;
				}
				if(this.mouseX > this.width * 0.5)
				{
					this.dropIndicator.left = undefined;
					this.dropIndicator.right = 0;
				}
				else
				{
					this.dropIndicator.left = 0;
					this.dropIndicator.right = undefined;
				}
			}
		}
		
		private function dragExitHandler(param1:DragEvent) : void
		{
			this.dropIndicator.visible = false;
		}
		
		public function setWaveformVisible(param1:Boolean) : void
		{
		}
		
		protected function onRollOver(param1:MouseEvent) : void
		{
			if(currentState == "normal")
			{
				currentState = "hovered";
			}
		}
		
		protected function onRollOut(param1:MouseEvent) : void
		{
			if(currentState == "hovered")
			{
				currentState = "normal";
			}
		}
		
		private function _SceneElement_Fade1_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 0;
			_loc1_.alphaTo = 1;
			_loc1_.duration = 300;
			this.cce = _loc1_;
			BindingManager.executeBindings(this,"cce",this.cce);
			return _loc1_;
		}
		
		private function _SceneElement_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._SceneElement_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SceneElement_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14804459;
			return _loc1_;
		}
		
		private function _SceneElement_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.height = 52;
			_loc1_.horizontalCenter = 0;
			_loc1_.clipAndEnableScrolling = true;
			_loc1_.mxmlContent = [this._SceneElement_PopUpAnchor1_i(),this._SceneElement_PopUpAnchor2_i(),this._SceneElement_Group4_c(),this._SceneElement_Group5_i()];
			_loc1_.addEventListener("rollOver",this.__sceneThumbnailGroup_rollOver);
			_loc1_.addEventListener("rollOut",this.__sceneThumbnailGroup_rollOut);
			_loc1_.addEventListener("mouseDown",this.__sceneThumbnailGroup_mouseDown);
			_loc1_.addEventListener("mouseUp",this.__sceneThumbnailGroup_mouseUp);
			_loc1_.id = "sceneThumbnailGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.sceneThumbnailGroup = _loc1_;
			BindingManager.executeBindings(this,"sceneThumbnailGroup",this.sceneThumbnailGroup);
			return _loc1_;
		}
		
		private function _SceneElement_PopUpAnchor1_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.top = -5;
			_loc1_.popUpPosition = "above";
			_loc1_.displayPopUp = false;
			_loc1_.popUp = this._SceneElement_MenuItemList1_i();
			_loc1_.id = "menuDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.menuDisplay = _loc1_;
			BindingManager.executeBindings(this,"menuDisplay",this.menuDisplay);
			return _loc1_;
		}
		
		private function _SceneElement_MenuItemList1_i() : MenuItemList
		{
			var _loc1_:MenuItemList = new MenuItemList();
			_loc1_.right = 0;
			_loc1_.addEventListener("itemClick",this.__sceneMenu_itemClick);
			_loc1_.id = "sceneMenu";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.sceneMenu = _loc1_;
			BindingManager.executeBindings(this,"sceneMenu",this.sceneMenu);
			return _loc1_;
		}
		
		public function __sceneMenu_itemClick(param1:MenuItemEvent) : void
		{
			this.onSceneMenuItemClick(param1);
		}
		
		private function _SceneElement_PopUpAnchor2_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.popUpPosition = "aboveRight";
			_loc1_.displayPopUp = false;
			_loc1_.popUp = this._SceneElement_Group3_c();
			_loc1_.id = "toolTipAnchor";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.toolTipAnchor = _loc1_;
			BindingManager.executeBindings(this,"toolTipAnchor",this.toolTipAnchor);
			return _loc1_;
		}
		
		private function _SceneElement_Group3_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 0;
			_loc1_.mxmlContent = [this._SceneElement_Line2_i(),this._SceneElement_SceneToolTip1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _SceneElement_Line2_i() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.top = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.stroke = this._SceneElement_SolidColorStroke2_c();
			_loc1_.initialized(this,"toolTipMarker");
			this.toolTipMarker = _loc1_;
			BindingManager.executeBindings(this,"toolTipMarker",this.toolTipMarker);
			return _loc1_;
		}
		
		private function _SceneElement_SolidColorStroke2_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 4028582;
			return _loc1_;
		}
		
		private function _SceneElement_SceneToolTip1_i() : SceneToolTip
		{
			var _loc1_:SceneToolTip = new SceneToolTip();
			_loc1_.horizontalCenter = 0;
			_loc1_.id = "toolTipDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.toolTipDisplay = _loc1_;
			BindingManager.executeBindings(this,"toolTipDisplay",this.toolTipDisplay);
			return _loc1_;
		}
		
		private function _SceneElement_Group4_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mouseChildren = false;
			_loc1_.clipAndEnableScrolling = true;
			_loc1_.mxmlContent = [this._SceneElement_BitmapImage1_i(),this._SceneElement_SWFLoader1_i(),this._SceneElement_BitmapImage2_i(),this._SceneElement_SceneTransitionView1_i()];
			_loc1_.addEventListener("mouseMove",this.___SceneElement_Group4_mouseMove);
			_loc1_.addEventListener("click",this.___SceneElement_Group4_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _SceneElement_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.scaleMode = "zoom";
			_loc1_.horizontalAlign = "center";
			_loc1_.verticalAlign = "middle";
			_loc1_.width = 90;
			_loc1_.height = 51;
			_loc1_.smooth = true;
			_loc1_.initialized(this,"sceneImage");
			this.sceneImage = _loc1_;
			BindingManager.executeBindings(this,"sceneImage",this.sceneImage);
			return _loc1_;
		}
		
		private function _SceneElement_SWFLoader1_i() : SWFLoader
		{
			var _loc1_:SWFLoader = new SWFLoader();
			_loc1_.source = this._embed_mxml__styles_images_timeline_loading_swf_970254217;
			_loc1_.height = 20;
			_loc1_.width = 20;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.id = "_SceneElement_SWFLoader1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SceneElement_SWFLoader1 = _loc1_;
			BindingManager.executeBindings(this,"_SceneElement_SWFLoader1",this._SceneElement_SWFLoader1);
			return _loc1_;
		}
		
		private function _SceneElement_BitmapImage2_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.right = 0;
			_loc1_.bottom = 0;
			_loc1_.source = this._embed_mxml__styles_images_timeline_timeline_chapter_break_png_2020576519;
			_loc1_.initialized(this,"chapterBreakImage");
			this.chapterBreakImage = _loc1_;
			BindingManager.executeBindings(this,"chapterBreakImage",this.chapterBreakImage);
			return _loc1_;
		}
		
		private function _SceneElement_SceneTransitionView1_i() : SceneTransitionView
		{
			var _loc1_:SceneTransitionView = new SceneTransitionView();
			_loc1_.percentHeight = 100;
			_loc1_.visible = false;
			_loc1_.id = "trans_cs";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.trans_cs = _loc1_;
			BindingManager.executeBindings(this,"trans_cs",this.trans_cs);
			return _loc1_;
		}
		
		public function ___SceneElement_Group4_mouseMove(param1:MouseEvent) : void
		{
			this.onMouseMove(param1);
		}
		
		public function ___SceneElement_Group4_click(param1:MouseEvent) : void
		{
			this.onSceneClick(param1);
		}
		
		private function _SceneElement_Group5_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentHeight = 100;
			_loc1_.right = 0;
			_loc1_.width = 10;
			_loc1_.mouseEnabledWhereTransparent = true;
			_loc1_.addEventListener("rollOver",this.__dragHandle_rollOver);
			_loc1_.addEventListener("rollOut",this.__dragHandle_rollOut);
			_loc1_.addEventListener("mouseDown",this.__dragHandle_mouseDown);
			_loc1_.id = "dragHandle";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dragHandle = _loc1_;
			BindingManager.executeBindings(this,"dragHandle",this.dragHandle);
			return _loc1_;
		}
		
		public function __dragHandle_rollOver(param1:MouseEvent) : void
		{
			this.changeArrowCursor(true);
		}
		
		public function __dragHandle_rollOut(param1:MouseEvent) : void
		{
			this.changeArrowCursor(false);
		}
		
		public function __dragHandle_mouseDown(param1:MouseEvent) : void
		{
			this.enableDragScene(param1);
		}
		
		public function __sceneThumbnailGroup_rollOver(param1:MouseEvent) : void
		{
			this.onRollOver(param1);
		}
		
		public function __sceneThumbnailGroup_rollOut(param1:MouseEvent) : void
		{
			this.onRollOut(param1);
		}
		
		public function __sceneThumbnailGroup_mouseDown(param1:MouseEvent) : void
		{
			this.onMouseDownHandler(param1);
		}
		
		public function __sceneThumbnailGroup_mouseUp(param1:MouseEvent) : void
		{
			this.onMouseUpHandler(param1);
		}
		
		private function _SceneElement_Rect1_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.height = 50;
			_loc1_.stroke = this._SceneElement_SolidColorStroke3_c();
			_loc1_.fill = this._SceneElement_SolidColor1_i();
			_loc1_.initialized(this,"_SceneElement_Rect1");
			this._SceneElement_Rect1 = _loc1_;
			BindingManager.executeBindings(this,"_SceneElement_Rect1",this._SceneElement_Rect1);
			return _loc1_;
		}
		
		private function _SceneElement_SolidColorStroke3_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 5093288;
			_loc1_.weight = 3;
			_loc1_.joints = "miter";
			return _loc1_;
		}
		
		private function _SceneElement_SolidColor1_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 0;
			_loc1_.alpha = 0;
			this._SceneElement_SolidColor1 = _loc1_;
			BindingManager.executeBindings(this,"_SceneElement_SolidColor1",this._SceneElement_SolidColor1);
			return _loc1_;
		}
		
		private function _SceneElement_Group6_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.top = 0;
			_loc1_.minWidth = 12;
			_loc1_.height = 12;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.mxmlContent = [this._SceneElement_Rect2_c(),this._SceneElement_Label1_i()];
			_loc1_.id = "_SceneElement_Group6";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SceneElement_Group6 = _loc1_;
			BindingManager.executeBindings(this,"_SceneElement_Group6",this._SceneElement_Group6);
			return _loc1_;
		}
		
		private function _SceneElement_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._SceneElement_SolidColor2_i();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SceneElement_SolidColor2_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 0;
			this._SceneElement_SolidColor2 = _loc1_;
			BindingManager.executeBindings(this,"_SceneElement_SolidColor2",this._SceneElement_SolidColor2);
			return _loc1_;
		}
		
		private function _SceneElement_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.left = 3;
			_loc1_.right = 3;
			_loc1_.verticalCenter = 0;
			_loc1_.maxDisplayedLines = 1;
			_loc1_.filters = [this._SceneElement_DropShadowFilter1_c()];
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("fontSize",10);
			_loc1_.id = "sceneLabelDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.sceneLabelDisplay = _loc1_;
			BindingManager.executeBindings(this,"sceneLabelDisplay",this.sceneLabelDisplay);
			return _loc1_;
		}
		
		private function _SceneElement_DropShadowFilter1_c() : DropShadowFilter
		{
			var _loc1_:DropShadowFilter = new DropShadowFilter();
			_loc1_.alpha = 0.8;
			_loc1_.distance = 1;
			_loc1_.blurX = 3;
			_loc1_.blurY = 3;
			return _loc1_;
		}
		
		private function _SceneElement_RectangularDropShadow1_i() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.height = 50;
			_loc1_.alpha = 0.5;
			_loc1_.blurX = 8;
			_loc1_.blurY = 8;
			_loc1_.distance = 0;
			_loc1_.id = "_SceneElement_RectangularDropShadow1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SceneElement_RectangularDropShadow1 = _loc1_;
			BindingManager.executeBindings(this,"_SceneElement_RectangularDropShadow1",this._SceneElement_RectangularDropShadow1);
			return _loc1_;
		}
		
		private function _SceneElement_Group7_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.mouseChildren = false;
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._SceneElement_Rect3_c()];
			_loc1_.id = "dropIndicator";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dropIndicator = _loc1_;
			BindingManager.executeBindings(this,"dropIndicator",this.dropIndicator);
			return _loc1_;
		}
		
		private function _SceneElement_Rect3_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.width = 3;
			_loc1_.fill = this._SceneElement_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SceneElement_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 0;
			return _loc1_;
		}
		
		public function ___SceneElement_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.initApp();
		}
		
		public function ___SceneElement_Group1_dragEnter(param1:DragEvent) : void
		{
			this.dragEnterHandler(param1);
		}
		
		public function ___SceneElement_Group1_dragDrop(param1:DragEvent) : void
		{
			this.dragDropHandler(param1);
		}
		
		public function ___SceneElement_Group1_dragOver(param1:DragEvent) : void
		{
			this.dragOverHandler(param1);
		}
		
		public function ___SceneElement_Group1_dragExit(param1:DragEvent) : void
		{
			this.dragExitHandler(param1);
		}
		
		private function _SceneElement_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,null,function(param1:*):void
			{
				this.setStyle("creationCompleteEffect",param1);
			},"this.creationCompleteEffect","cce");
			result[1] = new Binding(this,function():Boolean
			{
				return !_isThumbnailReady;
			},null,"_SceneElement_SWFLoader1.visible");
			result[2] = new Binding(this,function():Boolean
			{
				return scene.chapterBreak;
			},null,"chapterBreakImage.visible");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = _label;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"sceneLabelDisplay.text");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _SceneElement_SolidColor1() : SolidColor
		{
			return this._2038272553_SceneElement_SolidColor1;
		}
		
		public function set _SceneElement_SolidColor1(param1:SolidColor) : void
		{
			var _loc2_:Object = this._2038272553_SceneElement_SolidColor1;
			if(_loc2_ !== param1)
			{
				this._2038272553_SceneElement_SolidColor1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneElement_SolidColor1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _SceneElement_SolidColor2() : SolidColor
		{
			return this._2038272554_SceneElement_SolidColor2;
		}
		
		public function set _SceneElement_SolidColor2(param1:SolidColor) : void
		{
			var _loc2_:Object = this._2038272554_SceneElement_SolidColor2;
			if(_loc2_ !== param1)
			{
				this._2038272554_SceneElement_SolidColor2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneElement_SolidColor2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get cce() : Fade
		{
			return this._98309cce;
		}
		
		public function set cce(param1:Fade) : void
		{
			var _loc2_:Object = this._98309cce;
			if(_loc2_ !== param1)
			{
				this._98309cce = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cce",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get chapterBreakImage() : BitmapImage
		{
			return this._541768759chapterBreakImage;
		}
		
		public function set chapterBreakImage(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._541768759chapterBreakImage;
			if(_loc2_ !== param1)
			{
				this._541768759chapterBreakImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chapterBreakImage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dragHandle() : Group
		{
			return this._1736126340dragHandle;
		}
		
		public function set dragHandle(param1:Group) : void
		{
			var _loc2_:Object = this._1736126340dragHandle;
			if(_loc2_ !== param1)
			{
				this._1736126340dragHandle = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragHandle",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dropIndicator() : Group
		{
			return this._1419185120dropIndicator;
		}
		
		public function set dropIndicator(param1:Group) : void
		{
			var _loc2_:Object = this._1419185120dropIndicator;
			if(_loc2_ !== param1)
			{
				this._1419185120dropIndicator = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropIndicator",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get menuDisplay() : PopUpAnchor
		{
			return this._1131896221menuDisplay;
		}
		
		public function set menuDisplay(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._1131896221menuDisplay;
			if(_loc2_ !== param1)
			{
				this._1131896221menuDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sceneImage() : BitmapImage
		{
			return this._2060064815sceneImage;
		}
		
		public function set sceneImage(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._2060064815sceneImage;
			if(_loc2_ !== param1)
			{
				this._2060064815sceneImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneImage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sceneLabelDisplay() : Label
		{
			return this._1654993370sceneLabelDisplay;
		}
		
		public function set sceneLabelDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._1654993370sceneLabelDisplay;
			if(_loc2_ !== param1)
			{
				this._1654993370sceneLabelDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneLabelDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sceneMenu() : MenuItemList
		{
			return this._1729133579sceneMenu;
		}
		
		public function set sceneMenu(param1:MenuItemList) : void
		{
			var _loc2_:Object = this._1729133579sceneMenu;
			if(_loc2_ !== param1)
			{
				this._1729133579sceneMenu = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneMenu",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sceneThumbnailGroup() : Group
		{
			return this._1955108705sceneThumbnailGroup;
		}
		
		public function set sceneThumbnailGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1955108705sceneThumbnailGroup;
			if(_loc2_ !== param1)
			{
				this._1955108705sceneThumbnailGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneThumbnailGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get toolTipAnchor() : PopUpAnchor
		{
			return this._482586504toolTipAnchor;
		}
		
		public function set toolTipAnchor(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._482586504toolTipAnchor;
			if(_loc2_ !== param1)
			{
				this._482586504toolTipAnchor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipAnchor",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get toolTipDisplay() : SceneToolTip
		{
			return this._459096927toolTipDisplay;
		}
		
		public function set toolTipDisplay(param1:SceneToolTip) : void
		{
			var _loc2_:Object = this._459096927toolTipDisplay;
			if(_loc2_ !== param1)
			{
				this._459096927toolTipDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get toolTipMarker() : Line
		{
			return this._150593027toolTipMarker;
		}
		
		public function set toolTipMarker(param1:Line) : void
		{
			var _loc2_:Object = this._150593027toolTipMarker;
			if(_loc2_ !== param1)
			{
				this._150593027toolTipMarker = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipMarker",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get trans_cs() : SceneTransitionView
		{
			return this._1280875879trans_cs;
		}
		
		public function set trans_cs(param1:SceneTransitionView) : void
		{
			var _loc2_:Object = this._1280875879trans_cs;
			if(_loc2_ !== param1)
			{
				this._1280875879trans_cs = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trans_cs",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _label() : String
		{
			return this._1472470539_label;
		}
		
		private function set _label(param1:String) : void
		{
			var _loc2_:Object = this._1472470539_label;
			if(_loc2_ !== param1)
			{
				this._1472470539_label = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_label",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _speechText() : String
		{
			return this._1699337934_speechText;
		}
		
		private function set _speechText(param1:String) : void
		{
			var _loc2_:Object = this._1699337934_speechText;
			if(_loc2_ !== param1)
			{
				this._1699337934_speechText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_speechText",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _isThumbnailReady() : Boolean
		{
			return this._1035782592_isThumbnailReady;
		}
		
		private function set _isThumbnailReady(param1:Boolean) : void
		{
			var _loc2_:Object = this._1035782592_isThumbnailReady;
			if(_loc2_ !== param1)
			{
				this._1035782592_isThumbnailReady = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_isThumbnailReady",_loc2_,param1));
				}
			}
		}
		
		public function set scene(param1:AnimeScene) : void
		{
			var _loc2_:Object = this.scene;
			if(_loc2_ !== param1)
			{
				this._109254796scene = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scene",_loc2_,param1));
				}
			}
		}
	}
}
