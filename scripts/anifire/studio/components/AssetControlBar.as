package anifire.studio.components
{
	import anifire.assets.transition.AssetTransitionConstants;
	import anifire.constant.ThemeConstants;
	import anifire.event.WidgetEvent;
	import anifire.managers.AmplitudeAnalyticsManager;
	import anifire.studio.assets.commands.AddAssetMovementCommand;
	import anifire.studio.assets.commands.AddCharacterMovementCommand;
	import anifire.studio.assets.commands.RemoveAssetMovementCommand;
	import anifire.studio.assets.commands.RemoveCharacterMovementCommand;
	import anifire.studio.assets.controllers.AssetCollectionController;
	import anifire.studio.assets.controllers.TextCollectionController;
	import anifire.studio.assets.models.AssetTransition;
	import anifire.studio.commands.ICommand;
	import anifire.studio.commands.SlideAssetCommand;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.Asset;
	import anifire.studio.core.Background;
	import anifire.studio.core.BubbleAsset;
	import anifire.studio.core.CharThumb;
	import anifire.studio.core.Character;
	import anifire.studio.core.Console;
	import anifire.studio.core.EffectAsset;
	import anifire.studio.core.FlowFrame;
	import anifire.studio.core.ProgramEffectAsset;
	import anifire.studio.core.Prop;
	import anifire.studio.core.Widget;
	import anifire.studio.events.AssetCollectionEvent;
	import anifire.studio.events.AssetEvent;
	import anifire.studio.interfaces.ISlidable;
	import anifire.studio.managers.SceneManager;
	import anifire.studio.managers.TutorialManager;
	import anifire.studio.models.MenuItemModel;
	import anifire.studio.skins.AddCharacterMovementDropDownListSkin;
	import anifire.studio.skins.AssetSlideToggleButtonSkin;
	import anifire.studio.skins.RemoveCharacterMovementDropDownListSkin;
	import anifire.studio.skins.SwapAssetDropDownListSkin;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.ToggleButton;
	import spark.effects.Fade;
	import spark.events.DropDownEvent;
	import spark.events.IndexChangeEvent;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class AssetControlBar extends Group implements IBindingClient
	{
		
		public static const TRIGGER_ID:String = "tray_icon";
		
		public static const SWAP_ACTION_ASSET:String = "swapAsset";
		
		public static const SWAP_ACTION_FRAME_IMAGE:String = "swapFrameImage";
		
		public static const SWAP_ACTION_WIDGET_ICON:String = "swapWidgetIcon";
		
		public static const ACTION_ADD_CHARACTER_MOVEMENT:String = "actionAddCharacterMovement";
		
		public static const ACTION_ADD_CHARACTER_MOVEMENT_AND_WALK:String = "actionAddCharacterMovementAndWalk";
		
		public static const ACTION_REMOVE_CHARACTER_MOVEMENT:String = "actionRemoveCharacterMovement";
		
		public static const ACTION_REMOVE_CHARACTER_MOVEMENT_AND_STAND:String = "actionRemoveCharacterMovementAndStand";
		
		public static const LABEL_ADD_CHARACTER_MOVEMENT:String = "Current action";
		
		public static const LABEL_ADD_CHARACTER_MOVEMENT_AND_WALK:String = "Walk";
		
		public static const LABEL_REMOVE_CHARACTER_MOVEMENT:String = "Retain current action";
		
		public static const LABEL_REMOVE_CHARACTER_MOVEMENT_AND_STAND:String = "Stand";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _AssetControlBar_HGroup3:HGroup;
		
		public var _AssetControlBar_IconButton1:IconButton;
		
		public var _AssetControlBar_SolidColor2:SolidColor;
		
		private var _1914423910addCharacterMovementDropDownList:spark.components.DropDownList;
		
		private var _727984373backwardButton:IconButton;
		
		private var _2071192609clearButton:IconButton;
		
		private var _1397778681copyButton:IconButton;
		
		private var _1245745987deleteButton:IconButton;
		
		private var _1282133823fadeIn:Fade;
		
		private var _427707903flipButton:IconButton;
		
		private var _878657961forwardButton:IconButton;
		
		private var _1228621915pasteButton:IconButton;
		
		private var _122158822previewButton:IconButton;
		
		private var _592258717removeCharacterMovementDropDownList:spark.components.DropDownList;
		
		private var _1411676093slideButton:ToggleButton;
		
		private var _1438320977swapAssetButton:IconButton;
		
		private var _455203372swapAssetDropDownList:spark.components.DropDownList;
		
		private var _306150106swapButtonGroup:Group;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _target:Object;
		
		private var _collectionController:AssetCollectionController;
		
		protected var _swapAssetMenuItems:ArrayCollection;
		
		protected var _swapAssetPrimaryItem:MenuItemModel;
		
		protected var _swapAssetSecondaryItem:MenuItemModel;
		
		private var _1916674091isOnStage:Boolean;
		
		protected var _929617159displaySwapButton:Boolean;
		
		protected var _683885766displaySwapDropDown:Boolean;
		
		private var _2044116732flipOnlyMode:Boolean;
		
		private var _pinned:Boolean;
		
		protected var _559912415displaySlideButton:Boolean;
		
		protected var _566376925displayAddMovementDropDownList:Boolean;
		
		protected var _186141636displayRemoveMovementDropDownList:Boolean;
		
		protected var _1345931167displayFlipButton:Boolean;
		
		protected var _2030595794displayLayerButtons:Boolean;
		
		protected var _610875745displayDeleteButton:Boolean;
		
		protected var _1916017800displayPreviewButton:Boolean;
		
		protected var _1123549545displayCopyButton:Boolean;
		
		protected var _376858237displayPasteButton:Boolean;
		
		protected var _1219428931displayClearButton:Boolean;
		
		protected var _1595931044isSliding:Boolean;
		
		private var deleteSceneText:String;
		
		private var deleteAssetText:String;
		
		private var _embed_mxml__styles_images_toolbar_tools_swap_on_png_154503625:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_clear_hover_png_333215689:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_clear_png_175276855:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_sendback_png_1105677641:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_delete_png_379498175:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_handle_hover_png_2125909415:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_copy_hover_png_618627137:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_paste_hover_png_753797183:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_handle_png_244165311:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_flip_hover_png_100633153:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_copy_png_2129813895:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_sendfront_png_67588479:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_paste_png_1967977209:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_preview_hover_png_176525017:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_sendback_hover_png_155513417:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_delete_hover_png_1455017407:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_flip_png_116548535:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_sendfront_hover_png_1775771135:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_preview_png_1898309057:Class;
		
		private var _embed_mxml__styles_images_toolbar_tools_swap_png_87189375:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function AssetControlBar()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_toolbar_tools_swap_on_png_154503625 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_swap_on_png_154503625;
			this._embed_mxml__styles_images_toolbar_tools_clear_hover_png_333215689 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_clear_hover_png_333215689;
			this._embed_mxml__styles_images_toolbar_tools_clear_png_175276855 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_clear_png_175276855;
			this._embed_mxml__styles_images_toolbar_tools_sendback_png_1105677641 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_sendback_png_1105677641;
			this._embed_mxml__styles_images_toolbar_tools_delete_png_379498175 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_delete_png_379498175;
			this._embed_mxml__styles_images_toolbar_tools_handle_hover_png_2125909415 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_handle_hover_png_2125909415;
			this._embed_mxml__styles_images_toolbar_tools_copy_hover_png_618627137 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_copy_hover_png_618627137;
			this._embed_mxml__styles_images_toolbar_tools_paste_hover_png_753797183 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_paste_hover_png_753797183;
			this._embed_mxml__styles_images_toolbar_tools_handle_png_244165311 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_handle_png_244165311;
			this._embed_mxml__styles_images_toolbar_tools_flip_hover_png_100633153 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_flip_hover_png_100633153;
			this._embed_mxml__styles_images_toolbar_tools_copy_png_2129813895 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_copy_png_2129813895;
			this._embed_mxml__styles_images_toolbar_tools_sendfront_png_67588479 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_sendfront_png_67588479;
			this._embed_mxml__styles_images_toolbar_tools_paste_png_1967977209 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_paste_png_1967977209;
			this._embed_mxml__styles_images_toolbar_tools_preview_hover_png_176525017 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_preview_hover_png_176525017;
			this._embed_mxml__styles_images_toolbar_tools_sendback_hover_png_155513417 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_sendback_hover_png_155513417;
			this._embed_mxml__styles_images_toolbar_tools_delete_hover_png_1455017407 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_delete_hover_png_1455017407;
			this._embed_mxml__styles_images_toolbar_tools_flip_png_116548535 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_flip_png_116548535;
			this._embed_mxml__styles_images_toolbar_tools_sendfront_hover_png_1775771135 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_sendfront_hover_png_1775771135;
			this._embed_mxml__styles_images_toolbar_tools_preview_png_1898309057 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_preview_png_1898309057;
			this._embed_mxml__styles_images_toolbar_tools_swap_png_87189375 = AssetControlBar__embed_mxml__styles_images_toolbar_tools_swap_png_87189375;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._AssetControlBar_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_AssetControlBarWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return AssetControlBar[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._AssetControlBar_Rect1_c(),this._AssetControlBar_HGroup1_c()];
			this._AssetControlBar_Fade1_i();
			this.addEventListener("creationComplete",this.___AssetControlBar_Group1_creationComplete);
			this.addEventListener("mouseDown",this.___AssetControlBar_Group1_mouseDown);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			AssetControlBar._watcherSetupUtil = param1;
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
		
		private function init() : void
		{
			this.deleteSceneText = UtilDict.translate("Delete Scene");
			this.deleteAssetText = UtilDict.translate("Delete Asset");
			TutorialManager.instance.registerComponent("swap-char-button",this.swapAssetButton);
			this.initSwapAssetDropDownList();
			this.initAddCharacterMovementDropDownList();
			this.initRemoveCharacterMovementDropDownList();
		}
		
		private function initSwapAssetDropDownList() : void
		{
			this._swapAssetMenuItems = new ArrayCollection();
			this._swapAssetPrimaryItem = new MenuItemModel("",SWAP_ACTION_ASSET);
			this._swapAssetSecondaryItem = new MenuItemModel("","");
			this._swapAssetMenuItems.addItem(this._swapAssetPrimaryItem);
			this._swapAssetMenuItems.addItem(this._swapAssetSecondaryItem);
			this.swapAssetDropDownList.dataProvider = this._swapAssetMenuItems;
		}
		
		private function initAddCharacterMovementDropDownList() : void
		{
			var _loc1_:ArrayCollection = new ArrayCollection();
			_loc1_.addItem(new MenuItemModel(LABEL_ADD_CHARACTER_MOVEMENT,ACTION_ADD_CHARACTER_MOVEMENT));
			_loc1_.addItem(new MenuItemModel(LABEL_ADD_CHARACTER_MOVEMENT_AND_WALK,ACTION_ADD_CHARACTER_MOVEMENT_AND_WALK));
			this.addCharacterMovementDropDownList.dataProvider = _loc1_;
		}
		
		private function initRemoveCharacterMovementDropDownList() : void
		{
			var _loc1_:ArrayCollection = new ArrayCollection();
			_loc1_.addItem(new MenuItemModel(LABEL_REMOVE_CHARACTER_MOVEMENT,ACTION_REMOVE_CHARACTER_MOVEMENT));
			_loc1_.addItem(new MenuItemModel(LABEL_REMOVE_CHARACTER_MOVEMENT_AND_STAND,ACTION_REMOVE_CHARACTER_MOVEMENT_AND_STAND));
			this.removeCharacterMovementDropDownList.dataProvider = _loc1_;
		}
		
		public function set target(param1:Object) : void
		{
			if(this._target != param1)
			{
				if(this._collectionController)
				{
					this._collectionController.removeEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onAssetCollectionChanged);
					this._collectionController = null;
				}
				if(param1 is AssetCollectionController)
				{
					this._collectionController = param1 as AssetCollectionController;
					this._collectionController.addEventListener(AssetCollectionEvent.COLLECTION_CHANGED,this.onAssetCollectionChanged);
				}
				this.updateTarget(param1);
			}
		}
		
		private function updateTarget(param1:Object) : void
		{
			if(this._target is IEventDispatcher)
			{
				IEventDispatcher(this._target).removeEventListener(AssetEvent.MOTION_CHANGE,this.asset_motionChangeHandler);
				IEventDispatcher(this._target).removeEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.asset_widgetSwapCompleteHandler);
			}
			if(param1 is TextCollectionController && (param1 as TextCollectionController).singleBubbleAsset)
			{
				param1 = (param1 as TextCollectionController).singleBubbleAsset;
			}
			this._target = param1;
			this.updateUI();
			if(this._target is IEventDispatcher)
			{
				IEventDispatcher(this._target).addEventListener(AssetEvent.MOTION_CHANGE,this.asset_motionChangeHandler);
				IEventDispatcher(this._target).addEventListener(WidgetEvent.WIDGET_SWAP_COMPLETE,this.asset_widgetSwapCompleteHandler);
			}
		}
		
		private function onAssetCollectionChanged(param1:Event) : void
		{
			this.updateTarget(this._collectionController);
		}
		
		private function updateUI() : void
		{
			var _loc1_:Widget = null;
			this.displaySlideButton = false;
			this.displayAddMovementDropDownList = false;
			this.displayRemoveMovementDropDownList = false;
			this.displayFlipButton = false;
			this.displayLayerButtons = false;
			this.displayDeleteButton = false;
			this.displayPreviewButton = false;
			this.displayCopyButton = false;
			this.displayPasteButton = false;
			this.displayClearButton = false;
			this.displaySwapButton = false;
			this.displaySwapDropDown = false;
			if(this._target)
			{
				this.deleteButton.toolTip = this.deleteAssetText;
				if(this._target is Widget)
				{
					this.displayDeleteButton = true;
					this.displayLayerButtons = true;
					_loc1_ = this._target as Widget;
					if(_loc1_.isIconType)
					{
						this.displaySwapDropDown = true;
						this._swapAssetPrimaryItem.label = UtilDict.translate("Swap vidget type");
						this._swapAssetSecondaryItem.label = UtilDict.translate("Swap prop");
						this._swapAssetSecondaryItem.value = SWAP_ACTION_WIDGET_ICON;
					}
					else
					{
						this.displaySwapButton = this.shouldDisplaySwapButton();
					}
				}
				else if(this._target is FlowFrame)
				{
					this.displayDeleteButton = true;
					this.displayLayerButtons = true;
					this.displayFlipButton = true;
					this.displaySwapDropDown = true;
					this._swapAssetPrimaryItem.label = UtilDict.translate("Swap frame");
					this._swapAssetSecondaryItem.label = UtilDict.translate("Swap image");
					this._swapAssetSecondaryItem.value = SWAP_ACTION_FRAME_IMAGE;
				}
				else if(this._target is Prop || this._target is Character)
				{
					this.displayDeleteButton = true;
					this.displayLayerButtons = true;
					this.displayFlipButton = true;
					this.displaySwapButton = this.shouldDisplaySwapButton();
				}
				else if(this._target is BubbleAsset)
				{
					this.displayDeleteButton = true;
					this.displayLayerButtons = true;
				}
				else if(this._target is EffectAsset && (Console.getConsole().metaData.mver <= 3 || !(this._target is ProgramEffectAsset)))
				{
					if(Console.getConsole().metaData.mver <= 3)
					{
						this.displayDeleteButton = true;
					}
				}
				else if(this._target is AnimeScene || this._target is EffectAsset || this._target is Background)
				{
					this.displayPreviewButton = true;
					this.displayCopyButton = true;
					this.displayClearButton = true;
					this.displayDeleteButton = true;
					if(SceneManager.copiedScene)
					{
						this.displayPasteButton = true;
					}
					if(this._target is EffectAsset)
					{
						this._target = EffectAsset(this._target).scene;
					}
					this.deleteButton.toolTip = this.deleteSceneText;
				}
				else if(this._target is AssetCollectionController)
				{
					this.displayDeleteButton = true;
				}
			}
			this.updateMotionUI();
		}
		
		private function shouldDisplaySwapButton() : Boolean
		{
			var _loc1_:String = null;
			var _loc2_:Asset = null;
			var _loc3_:CharThumb = null;
			if(UtilSite.isGoAnimate || UtilSite.isWix)
			{
				_loc2_ = this._target as Asset;
				if(_loc2_ && _loc2_.thumb)
				{
					_loc3_ = _loc2_.thumb as CharThumb;
					if(_loc3_)
					{
						_loc1_ = _loc3_.themeOrCCThemeId;
					}
					else
					{
						_loc1_ = _loc2_.thumb.themeId;
					}
				}
				switch(_loc1_)
				{
					case ThemeConstants.BUSINESS_THEME_ID:
					case ThemeConstants.WHITEBOARD_THEME_ID:
					case ThemeConstants.INFOGRAPHICS_THEME_ID:
					case ThemeConstants.COMMON_CRAFT_THEME_ID:
					case ThemeConstants.UGC_THEME_ID:
						return true;
					default:
						return false;
				}
			}
			else
			{
				return true;
			}
		}
		
		private function asset_widgetSwapCompleteHandler(param1:WidgetEvent) : void
		{
			this.updateUI();
		}
		
		private function asset_motionChangeHandler(param1:AssetEvent) : void
		{
			this.updateMotionUI();
		}
		
		private function updateMotionUI() : void
		{
			var _loc2_:Boolean = false;
			var _loc1_:ISlidable = this._target as ISlidable;
			if(_loc1_ && _loc1_.slideEnabled)
			{
				this.isSliding = ISlidable(this._target).isSliding;
				if(_loc1_ is Character)
				{
					_loc2_ = true;
				}
				else if(_loc1_ is AssetCollectionController && (_loc1_ as AssetCollectionController).viewCollection && (_loc1_ as AssetCollectionController).viewCollection.containsCharacterViewOnly)
				{
					_loc2_ = true;
				}
				if(_loc2_)
				{
					this.displayAddMovementDropDownList = !this.isSliding;
					this.displayRemoveMovementDropDownList = this.isSliding;
				}
				else
				{
					this.displaySlideButton = true;
				}
			}
		}
		
		private function slideButton_clickHandler() : void
		{
			var _loc2_:ICommand = null;
			var _loc3_:Asset = null;
			var _loc4_:AssetTransition = null;
			var _loc1_:ISlidable = this._target as ISlidable;
			if(!_loc1_ || !_loc1_.slideEnabled)
			{
				return;
			}
			if(_loc1_ is AssetCollectionController)
			{
				if(_loc1_.isSliding)
				{
					_loc1_.removeSlideMotion();
				}
				else
				{
					_loc1_.startSlideMotion();
				}
			}
			else if(_loc1_ is Asset)
			{
				_loc3_ = _loc1_ as Asset;
				if(!_loc1_.isSliding)
				{
					if(_loc3_ is EffectAsset)
					{
						_loc2_ = new SlideAssetCommand(_loc3_,true);
					}
					else if(_loc3_.scene)
					{
						_loc4_ = _loc3_.scene.assetTransitionController.createTransition(_loc3_);
						if(_loc4_)
						{
							_loc4_.direction = AssetTransitionConstants.DIRECTION_MOVEMENT;
							_loc2_ = new AddAssetMovementCommand(_loc3_,_loc4_);
						}
					}
				}
				else if(_loc3_ is EffectAsset)
				{
					_loc2_ = new SlideAssetCommand(_loc3_,false);
				}
				else
				{
					_loc2_ = new RemoveAssetMovementCommand(_loc3_);
				}
			}
			if(_loc2_)
			{
				_loc2_.execute();
			}
		}
		
		private function copyButton_clickHandler() : void
		{
			Console.getConsole().copyCurrentScene();
			this.displayPasteButton = true;
		}
		
		private function deleteButton_clickHandler() : void
		{
			if(this._target is AnimeScene || this._target is Background)
			{
				Console.getConsole().deleteCurrentScene(TRIGGER_ID);
			}
			else
			{
				Console.getConsole().deleteAsset();
			}
		}
		
		private function flipButton_clickHandler() : void
		{
			Console.getConsole().flipAsset();
		}
		
		protected function handle_mouseDownHandler(param1:MouseEvent) : void
		{
			var _loc2_:Rectangle = new Rectangle(0,0,this.parent.width - this.width,this.parent.height - this.height);
			this.startDrag(false,_loc2_);
			this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
		}
		
		private function onStageMouseUp(param1:Event) : void
		{
			this.stage.removeEventListener(param1.type,this.onStageMouseUp);
			this.stopDrag();
			this._pinned = true;
		}
		
		public function unpin() : void
		{
			this._pinned = false;
		}
		
		public function get isPinned() : Boolean
		{
			return this._pinned;
		}
		
		protected function mouseDownHandler(param1:MouseEvent) : void
		{
		}
		
		protected function swapAssetButton_clickHandler(param1:MouseEvent) : void
		{
			Console.getConsole().displaySwapPanel();
			var _loc2_:TutorialManager = TutorialManager.instance;
			var _loc3_:String = "prop";
			if(this._target is Character)
			{
				_loc3_ = "character";
			}
			else if(this._target is Widget)
			{
				_loc3_ = "widget";
			}
			var _loc4_:Object = {
				"type":_loc3_,
				"tutorial":(!!_loc2_.currentTutorial?"yes":"no")
			};
			AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_SWAPPED_ASSET,_loc4_);
		}
		
		protected function swapAssetDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:MenuItemModel = this.swapAssetDropDownList.selectedItem as MenuItemModel;
			if(_loc2_)
			{
				switch(_loc2_.value)
				{
					case SWAP_ACTION_ASSET:
						Console.getConsole().displaySwapPanel();
						break;
					case SWAP_ACTION_WIDGET_ICON:
						Console.getConsole().displayWidgetIconPanel();
						break;
					case SWAP_ACTION_FRAME_IMAGE:
						Console.getConsole().displaySwapInnerImagePanel();
				}
			}
			this.swapAssetDropDownList.selectedIndex = -1;
		}
		
		protected function addCharacterMovementDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			callLater(this.addCharacterMovement);
		}
		
		private function addCharacterMovement() : void
		{
			var _loc2_:Boolean = false;
			var _loc3_:Character = null;
			var _loc4_:AssetTransition = null;
			var _loc5_:ICommand = null;
			var _loc1_:MenuItemModel = this.addCharacterMovementDropDownList.selectedItem as MenuItemModel;
			if(_loc1_ && _loc1_.value == ACTION_ADD_CHARACTER_MOVEMENT_AND_WALK)
			{
				_loc2_ = true;
			}
			if(this._target is AssetCollectionController)
			{
				(this._target as AssetCollectionController).startCharactersMotion(_loc2_);
			}
			else if(this._target is Character)
			{
				_loc3_ = this._target as Character;
				_loc4_ = _loc3_.scene.assetTransitionController.createTransition(_loc3_);
				if(_loc4_)
				{
					_loc5_ = new AddCharacterMovementCommand(_loc3_,_loc4_,_loc2_);
					_loc5_.execute();
				}
			}
			this.addCharacterMovementDropDownList.selectedIndex = -1;
		}
		
		protected function removeCharacterMovementDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			callLater(this.removeCharacterMovement);
		}
		
		private function removeCharacterMovement() : void
		{
			var _loc2_:Boolean = false;
			var _loc3_:ICommand = null;
			var _loc1_:MenuItemModel = this.removeCharacterMovementDropDownList.selectedItem as MenuItemModel;
			if(_loc1_ && _loc1_.value == ACTION_REMOVE_CHARACTER_MOVEMENT_AND_STAND)
			{
				_loc2_ = true;
			}
			if(this._target is AssetCollectionController)
			{
				(this._target as AssetCollectionController).removeSlideMotion();
			}
			else if(this._target is Character)
			{
				_loc3_ = new RemoveCharacterMovementCommand(this._target as Character,_loc2_);
				_loc3_.execute();
			}
			this.removeCharacterMovementDropDownList.selectedIndex = -1;
		}
		
		protected function swapAssetDropDownList_openHandler(param1:DropDownEvent) : void
		{
			var _loc2_:TutorialManager = TutorialManager.instance;
			var _loc3_:Object = {
				"type":(this._target is Widget?"widget":"prop"),
				"tutorial":(!!_loc2_.currentTutorial?"yes":"no")
			};
			AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_SWAPPED_ASSET,_loc3_);
		}
		
		private function _AssetControlBar_Fade1_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.duration = 500;
			_loc1_.alphaFrom = 0;
			_loc1_.alphaTo = 1;
			this.fadeIn = _loc1_;
			BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
			return _loc1_;
		}
		
		private function _AssetControlBar_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._AssetControlBar_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AssetControlBar_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			_loc1_.color = 65280;
			return _loc1_;
		}
		
		private function _AssetControlBar_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.gap = 1;
			_loc1_.verticalAlign = "middle";
			_loc1_.hasFocusableChildren = false;
			_loc1_.tabFocusEnabled = false;
			_loc1_.mxmlContent = [this._AssetControlBar_IconButton1_i(),this._AssetControlBar_Group2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetControlBar_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_handle_png_244165311);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_handle_hover_png_2125909415);
			_loc1_.addEventListener("mouseDown",this.___AssetControlBar_IconButton1_mouseDown);
			_loc1_.id = "_AssetControlBar_IconButton1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._AssetControlBar_IconButton1 = _loc1_;
			BindingManager.executeBindings(this,"_AssetControlBar_IconButton1",this._AssetControlBar_IconButton1);
			return _loc1_;
		}
		
		public function ___AssetControlBar_IconButton1_mouseDown(param1:MouseEvent) : void
		{
			this.handle_mouseDownHandler(param1);
		}
		
		private function _AssetControlBar_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.height = 35;
			_loc1_.mxmlContent = [this._AssetControlBar_Rect2_c(),this._AssetControlBar_HGroup2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetControlBar_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._AssetControlBar_SolidColor2_i();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AssetControlBar_SolidColor2_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 3619402;
			this._AssetControlBar_SolidColor2 = _loc1_;
			BindingManager.executeBindings(this,"_AssetControlBar_SolidColor2",this._AssetControlBar_SolidColor2);
			return _loc1_;
		}
		
		private function _AssetControlBar_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.gap = 0;
			_loc1_.buttonMode = true;
			_loc1_.hasFocusableChildren = false;
			_loc1_.tabFocusEnabled = false;
			_loc1_.mxmlContent = [this._AssetControlBar_Group3_i(),this._AssetControlBar_HGroup3_i(),this._AssetControlBar_IconButton3_i(),this._AssetControlBar_IconButton4_i(),this._AssetControlBar_IconButton5_i(),this._AssetControlBar_IconButton6_i(),this._AssetControlBar_IconButton7_i(),this._AssetControlBar_IconButton8_i(),this._AssetControlBar_IconButton9_i(),this._AssetControlBar_IconButton10_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetControlBar_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 47;
			_loc1_.mxmlContent = [this._AssetControlBar_IconButton2_i(),this._AssetControlBar_DropDownList1_i(),this._AssetControlBar_Line1_c()];
			_loc1_.id = "swapButtonGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.swapButtonGroup = _loc1_;
			BindingManager.executeBindings(this,"swapButtonGroup",this.swapButtonGroup);
			return _loc1_;
		}
		
		private function _AssetControlBar_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 46;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_swap_png_87189375);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_swap_on_png_154503625);
			_loc1_.addEventListener("click",this.__swapAssetButton_click);
			_loc1_.id = "swapAssetButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.swapAssetButton = _loc1_;
			BindingManager.executeBindings(this,"swapAssetButton",this.swapAssetButton);
			return _loc1_;
		}
		
		public function __swapAssetButton_click(param1:MouseEvent) : void
		{
			this.swapAssetButton_clickHandler(param1);
		}
		
		private function _AssetControlBar_DropDownList1_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.width = 46;
			_loc1_.height = 35;
			_loc1_.useVirtualLayout = false;
			_loc1_.requireSelection = false;
			_loc1_.setStyle("skinClass",SwapAssetDropDownListSkin);
			_loc1_.addEventListener("change",this.__swapAssetDropDownList_change);
			_loc1_.addEventListener("open",this.__swapAssetDropDownList_open);
			_loc1_.id = "swapAssetDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.swapAssetDropDownList = _loc1_;
			BindingManager.executeBindings(this,"swapAssetDropDownList",this.swapAssetDropDownList);
			return _loc1_;
		}
		
		public function __swapAssetDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.swapAssetDropDownList_changeHandler(param1);
		}
		
		public function __swapAssetDropDownList_open(param1:DropDownEvent) : void
		{
			this.swapAssetDropDownList_openHandler(param1);
		}
		
		private function _AssetControlBar_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.height = 35;
			_loc1_.right = 0;
			_loc1_.stroke = this._AssetControlBar_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AssetControlBar_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 7764345;
			_loc1_.weight = 1;
			return _loc1_;
		}
		
		private function _AssetControlBar_HGroup3_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._AssetControlBar_ToggleButton1_i(),this._AssetControlBar_DropDownList2_i(),this._AssetControlBar_DropDownList3_i(),this._AssetControlBar_Line2_c()];
			_loc1_.id = "_AssetControlBar_HGroup3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._AssetControlBar_HGroup3 = _loc1_;
			BindingManager.executeBindings(this,"_AssetControlBar_HGroup3",this._AssetControlBar_HGroup3);
			return _loc1_;
		}
		
		private function _AssetControlBar_ToggleButton1_i() : ToggleButton
		{
			var _loc1_:ToggleButton = new ToggleButton();
			_loc1_.width = 46;
			_loc1_.height = 35;
			_loc1_.setStyle("skinClass",AssetSlideToggleButtonSkin);
			_loc1_.addEventListener("click",this.__slideButton_click);
			_loc1_.id = "slideButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.slideButton = _loc1_;
			BindingManager.executeBindings(this,"slideButton",this.slideButton);
			return _loc1_;
		}
		
		public function __slideButton_click(param1:MouseEvent) : void
		{
			this.slideButton_clickHandler();
		}
		
		private function _AssetControlBar_DropDownList2_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.width = 46;
			_loc1_.height = 35;
			_loc1_.useVirtualLayout = false;
			_loc1_.requireSelection = false;
			_loc1_.setStyle("skinClass",AddCharacterMovementDropDownListSkin);
			_loc1_.addEventListener("change",this.__addCharacterMovementDropDownList_change);
			_loc1_.id = "addCharacterMovementDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.addCharacterMovementDropDownList = _loc1_;
			BindingManager.executeBindings(this,"addCharacterMovementDropDownList",this.addCharacterMovementDropDownList);
			return _loc1_;
		}
		
		public function __addCharacterMovementDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.addCharacterMovementDropDownList_changeHandler(param1);
		}
		
		private function _AssetControlBar_DropDownList3_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.width = 46;
			_loc1_.height = 35;
			_loc1_.useVirtualLayout = false;
			_loc1_.requireSelection = false;
			_loc1_.setStyle("skinClass",RemoveCharacterMovementDropDownListSkin);
			_loc1_.addEventListener("change",this.__removeCharacterMovementDropDownList_change);
			_loc1_.id = "removeCharacterMovementDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.removeCharacterMovementDropDownList = _loc1_;
			BindingManager.executeBindings(this,"removeCharacterMovementDropDownList",this.removeCharacterMovementDropDownList);
			return _loc1_;
		}
		
		public function __removeCharacterMovementDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.removeCharacterMovementDropDownList_changeHandler(param1);
		}
		
		private function _AssetControlBar_Line2_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.height = 35;
			_loc1_.stroke = this._AssetControlBar_SolidColorStroke2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AssetControlBar_SolidColorStroke2_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 7764345;
			_loc1_.weight = 1;
			return _loc1_;
		}
		
		private function _AssetControlBar_IconButton3_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 42;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_flip_png_116548535);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_flip_hover_png_100633153);
			_loc1_.addEventListener("click",this.__flipButton_click);
			_loc1_.id = "flipButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.flipButton = _loc1_;
			BindingManager.executeBindings(this,"flipButton",this.flipButton);
			return _loc1_;
		}
		
		public function __flipButton_click(param1:MouseEvent) : void
		{
			this.flipButton_clickHandler();
		}
		
		private function _AssetControlBar_IconButton4_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 35;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_sendfront_png_67588479);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_sendfront_hover_png_1775771135);
			_loc1_.addEventListener("click",this.__forwardButton_click);
			_loc1_.id = "forwardButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.forwardButton = _loc1_;
			BindingManager.executeBindings(this,"forwardButton",this.forwardButton);
			return _loc1_;
		}
		
		public function __forwardButton_click(param1:MouseEvent) : void
		{
			Console.getConsole().bringForward();
		}
		
		private function _AssetControlBar_IconButton5_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 35;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_sendback_png_1105677641);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_sendback_hover_png_155513417);
			_loc1_.addEventListener("click",this.__backwardButton_click);
			_loc1_.id = "backwardButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.backwardButton = _loc1_;
			BindingManager.executeBindings(this,"backwardButton",this.backwardButton);
			return _loc1_;
		}
		
		public function __backwardButton_click(param1:MouseEvent) : void
		{
			Console.getConsole().sendBackward();
		}
		
		private function _AssetControlBar_IconButton6_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 35;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_preview_png_1898309057);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_preview_hover_png_176525017);
			_loc1_.addEventListener("click",this.__previewButton_click);
			_loc1_.id = "previewButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.previewButton = _loc1_;
			BindingManager.executeBindings(this,"previewButton",this.previewButton);
			return _loc1_;
		}
		
		public function __previewButton_click(param1:MouseEvent) : void
		{
			Console.getConsole().preview(true);
		}
		
		private function _AssetControlBar_IconButton7_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 35;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_copy_png_2129813895);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_copy_hover_png_618627137);
			_loc1_.addEventListener("click",this.__copyButton_click);
			_loc1_.id = "copyButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.copyButton = _loc1_;
			BindingManager.executeBindings(this,"copyButton",this.copyButton);
			return _loc1_;
		}
		
		public function __copyButton_click(param1:MouseEvent) : void
		{
			this.copyButton_clickHandler();
		}
		
		private function _AssetControlBar_IconButton8_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 35;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_paste_png_1967977209);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_paste_hover_png_753797183);
			_loc1_.addEventListener("click",this.__pasteButton_click);
			_loc1_.id = "pasteButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.pasteButton = _loc1_;
			BindingManager.executeBindings(this,"pasteButton",this.pasteButton);
			return _loc1_;
		}
		
		public function __pasteButton_click(param1:MouseEvent) : void
		{
			Console.getConsole().pasteScene();
		}
		
		private function _AssetControlBar_IconButton9_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 35;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_clear_png_175276855);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_clear_hover_png_333215689);
			_loc1_.addEventListener("click",this.__clearButton_click);
			_loc1_.id = "clearButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.clearButton = _loc1_;
			BindingManager.executeBindings(this,"clearButton",this.clearButton);
			return _loc1_;
		}
		
		public function __clearButton_click(param1:MouseEvent) : void
		{
			Console.getConsole().clearCurrentScene(TRIGGER_ID);
		}
		
		private function _AssetControlBar_IconButton10_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 35;
			_loc1_.height = 35;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_tools_delete_png_379498175);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_toolbar_tools_delete_hover_png_1455017407);
			_loc1_.addEventListener("click",this.__deleteButton_click);
			_loc1_.id = "deleteButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.deleteButton = _loc1_;
			BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
			return _loc1_;
		}
		
		public function __deleteButton_click(param1:MouseEvent) : void
		{
			this.deleteButton_clickHandler();
		}
		
		public function ___AssetControlBar_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		public function ___AssetControlBar_Group1_mouseDown(param1:MouseEvent) : void
		{
			this.mouseDownHandler(param1);
		}
		
		private function _AssetControlBar_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,null,function(param1:*):void
			{
				this.setStyle("showEffect",param1);
			},"this.showEffect","fadeIn");
			result[1] = new Binding(this,null,null,"_AssetControlBar_IconButton1.visible","isOnStage");
			result[2] = new Binding(this,null,null,"_AssetControlBar_IconButton1.includeInLayout","isOnStage");
			result[3] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"_AssetControlBar_IconButton1.enabled");
			result[4] = new Binding(this,function():Number
			{
				return !!isOnStage?Number(0.9):Number(0);
			},null,"_AssetControlBar_SolidColor2.alpha");
			result[5] = new Binding(this,function():Boolean
			{
				return displaySwapButton || displaySwapDropDown;
			},null,"swapButtonGroup.visible");
			result[6] = new Binding(this,function():Boolean
			{
				return displaySwapButton || displaySwapDropDown;
			},null,"swapButtonGroup.includeInLayout");
			result[7] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Swap Asset");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"swapAssetButton.toolTip");
			result[8] = new Binding(this,function():Boolean
			{
				return displaySwapButton;
			},null,"swapAssetButton.visible");
			result[9] = new Binding(this,function():Boolean
			{
				return displaySwapButton;
			},null,"swapAssetButton.includeInLayout");
			result[10] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Swap Asset");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"swapAssetDropDownList.toolTip");
			result[11] = new Binding(this,function():Boolean
			{
				return displaySwapDropDown;
			},null,"swapAssetDropDownList.visible");
			result[12] = new Binding(this,function():Boolean
			{
				return displaySwapDropDown;
			},null,"swapAssetDropDownList.includeInLayout");
			result[13] = new Binding(this,function():Boolean
			{
				return displaySlideButton || displayAddMovementDropDownList || displayRemoveMovementDropDownList;
			},null,"_AssetControlBar_HGroup3.visible");
			result[14] = new Binding(this,function():Boolean
			{
				return displaySlideButton || displayAddMovementDropDownList || displayRemoveMovementDropDownList;
			},null,"_AssetControlBar_HGroup3.includeInLayout");
			result[15] = new Binding(this,function():Boolean
			{
				return displaySlideButton;
			},null,"slideButton.visible");
			result[16] = new Binding(this,function():Boolean
			{
				return displaySlideButton;
			},null,"slideButton.includeInLayout");
			result[17] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Toggle movement ON/OFF");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"slideButton.toolTip");
			result[18] = new Binding(this,function():Boolean
			{
				return isSliding;
			},null,"slideButton.selected");
			result[19] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"slideButton.enabled");
			result[20] = new Binding(this,function():Boolean
			{
				return displayAddMovementDropDownList;
			},null,"addCharacterMovementDropDownList.visible");
			result[21] = new Binding(this,function():Boolean
			{
				return displayAddMovementDropDownList;
			},null,"addCharacterMovementDropDownList.includeInLayout");
			result[22] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Add movement");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"addCharacterMovementDropDownList.toolTip");
			result[23] = new Binding(this,function():Boolean
			{
				return displayRemoveMovementDropDownList;
			},null,"removeCharacterMovementDropDownList.visible");
			result[24] = new Binding(this,function():Boolean
			{
				return displayRemoveMovementDropDownList;
			},null,"removeCharacterMovementDropDownList.includeInLayout");
			result[25] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Remove movement");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"removeCharacterMovementDropDownList.toolTip");
			result[26] = new Binding(this,function():Boolean
			{
				return displayFlipButton;
			},null,"flipButton.visible");
			result[27] = new Binding(this,function():Boolean
			{
				return displayFlipButton;
			},null,"flipButton.includeInLayout");
			result[28] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("ctrlbtnbar_flip");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"flipButton.toolTip");
			result[29] = new Binding(this,function():Boolean
			{
				return displayLayerButtons;
			},null,"forwardButton.visible");
			result[30] = new Binding(this,function():Boolean
			{
				return displayLayerButtons;
			},null,"forwardButton.includeInLayout");
			result[31] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("ctrlbtnbar_forward");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"forwardButton.toolTip");
			result[32] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"forwardButton.enabled");
			result[33] = new Binding(this,function():Boolean
			{
				return displayLayerButtons;
			},null,"backwardButton.visible");
			result[34] = new Binding(this,function():Boolean
			{
				return displayLayerButtons;
			},null,"backwardButton.includeInLayout");
			result[35] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("ctrlbtnbar_backward");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"backwardButton.toolTip");
			result[36] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"backwardButton.enabled");
			result[37] = new Binding(this,function():Boolean
			{
				return displayPreviewButton;
			},null,"previewButton.visible");
			result[38] = new Binding(this,function():Boolean
			{
				return displayPreviewButton;
			},null,"previewButton.includeInLayout");
			result[39] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Preview from here");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"previewButton.toolTip");
			result[40] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"previewButton.enabled");
			result[41] = new Binding(this,function():Boolean
			{
				return displayCopyButton;
			},null,"copyButton.visible");
			result[42] = new Binding(this,function():Boolean
			{
				return displayCopyButton;
			},null,"copyButton.includeInLayout");
			result[43] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Copy Scene");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"copyButton.toolTip");
			result[44] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"copyButton.enabled");
			result[45] = new Binding(this,function():Boolean
			{
				return displayPasteButton;
			},null,"pasteButton.visible");
			result[46] = new Binding(this,function():Boolean
			{
				return displayPasteButton;
			},null,"pasteButton.includeInLayout");
			result[47] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Paste Scene");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"pasteButton.toolTip");
			result[48] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"pasteButton.enabled");
			result[49] = new Binding(this,function():Boolean
			{
				return displayClearButton;
			},null,"clearButton.visible");
			result[50] = new Binding(this,function():Boolean
			{
				return displayClearButton;
			},null,"clearButton.includeInLayout");
			result[51] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Clear Scene");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"clearButton.toolTip");
			result[52] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"clearButton.enabled");
			result[53] = new Binding(this,function():Boolean
			{
				return displayDeleteButton;
			},null,"deleteButton.visible");
			result[54] = new Binding(this,function():Boolean
			{
				return displayDeleteButton;
			},null,"deleteButton.includeInLayout");
			result[55] = new Binding(this,function():Boolean
			{
				return !flipOnlyMode;
			},null,"deleteButton.enabled");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get addCharacterMovementDropDownList() : spark.components.DropDownList
		{
			return this._1914423910addCharacterMovementDropDownList;
		}
		
		public function set addCharacterMovementDropDownList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._1914423910addCharacterMovementDropDownList;
			if(_loc2_ !== param1)
			{
				this._1914423910addCharacterMovementDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addCharacterMovementDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get backwardButton() : IconButton
		{
			return this._727984373backwardButton;
		}
		
		public function set backwardButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._727984373backwardButton;
			if(_loc2_ !== param1)
			{
				this._727984373backwardButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backwardButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get clearButton() : IconButton
		{
			return this._2071192609clearButton;
		}
		
		public function set clearButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._2071192609clearButton;
			if(_loc2_ !== param1)
			{
				this._2071192609clearButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clearButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get copyButton() : IconButton
		{
			return this._1397778681copyButton;
		}
		
		public function set copyButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._1397778681copyButton;
			if(_loc2_ !== param1)
			{
				this._1397778681copyButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"copyButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get deleteButton() : IconButton
		{
			return this._1245745987deleteButton;
		}
		
		public function set deleteButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._1245745987deleteButton;
			if(_loc2_ !== param1)
			{
				this._1245745987deleteButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deleteButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get fadeIn() : Fade
		{
			return this._1282133823fadeIn;
		}
		
		public function set fadeIn(param1:Fade) : void
		{
			var _loc2_:Object = this._1282133823fadeIn;
			if(_loc2_ !== param1)
			{
				this._1282133823fadeIn = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get flipButton() : IconButton
		{
			return this._427707903flipButton;
		}
		
		public function set flipButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._427707903flipButton;
			if(_loc2_ !== param1)
			{
				this._427707903flipButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flipButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get forwardButton() : IconButton
		{
			return this._878657961forwardButton;
		}
		
		public function set forwardButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._878657961forwardButton;
			if(_loc2_ !== param1)
			{
				this._878657961forwardButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"forwardButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get pasteButton() : IconButton
		{
			return this._1228621915pasteButton;
		}
		
		public function set pasteButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._1228621915pasteButton;
			if(_loc2_ !== param1)
			{
				this._1228621915pasteButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pasteButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get previewButton() : IconButton
		{
			return this._122158822previewButton;
		}
		
		public function set previewButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._122158822previewButton;
			if(_loc2_ !== param1)
			{
				this._122158822previewButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get removeCharacterMovementDropDownList() : spark.components.DropDownList
		{
			return this._592258717removeCharacterMovementDropDownList;
		}
		
		public function set removeCharacterMovementDropDownList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._592258717removeCharacterMovementDropDownList;
			if(_loc2_ !== param1)
			{
				this._592258717removeCharacterMovementDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"removeCharacterMovementDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get slideButton() : ToggleButton
		{
			return this._1411676093slideButton;
		}
		
		public function set slideButton(param1:ToggleButton) : void
		{
			var _loc2_:Object = this._1411676093slideButton;
			if(_loc2_ !== param1)
			{
				this._1411676093slideButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slideButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get swapAssetButton() : IconButton
		{
			return this._1438320977swapAssetButton;
		}
		
		public function set swapAssetButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._1438320977swapAssetButton;
			if(_loc2_ !== param1)
			{
				this._1438320977swapAssetButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapAssetButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get swapAssetDropDownList() : spark.components.DropDownList
		{
			return this._455203372swapAssetDropDownList;
		}
		
		public function set swapAssetDropDownList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._455203372swapAssetDropDownList;
			if(_loc2_ !== param1)
			{
				this._455203372swapAssetDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapAssetDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get swapButtonGroup() : Group
		{
			return this._306150106swapButtonGroup;
		}
		
		public function set swapButtonGroup(param1:Group) : void
		{
			var _loc2_:Object = this._306150106swapButtonGroup;
			if(_loc2_ !== param1)
			{
				this._306150106swapButtonGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapButtonGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get isOnStage() : Boolean
		{
			return this._1916674091isOnStage;
		}
		
		public function set isOnStage(param1:Boolean) : void
		{
			var _loc2_:Object = this._1916674091isOnStage;
			if(_loc2_ !== param1)
			{
				this._1916674091isOnStage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isOnStage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displaySwapButton() : Boolean
		{
			return this._929617159displaySwapButton;
		}
		
		protected function set displaySwapButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._929617159displaySwapButton;
			if(_loc2_ !== param1)
			{
				this._929617159displaySwapButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displaySwapButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displaySwapDropDown() : Boolean
		{
			return this._683885766displaySwapDropDown;
		}
		
		protected function set displaySwapDropDown(param1:Boolean) : void
		{
			var _loc2_:Object = this._683885766displaySwapDropDown;
			if(_loc2_ !== param1)
			{
				this._683885766displaySwapDropDown = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displaySwapDropDown",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get flipOnlyMode() : Boolean
		{
			return this._2044116732flipOnlyMode;
		}
		
		public function set flipOnlyMode(param1:Boolean) : void
		{
			var _loc2_:Object = this._2044116732flipOnlyMode;
			if(_loc2_ !== param1)
			{
				this._2044116732flipOnlyMode = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flipOnlyMode",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displaySlideButton() : Boolean
		{
			return this._559912415displaySlideButton;
		}
		
		protected function set displaySlideButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._559912415displaySlideButton;
			if(_loc2_ !== param1)
			{
				this._559912415displaySlideButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displaySlideButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayAddMovementDropDownList() : Boolean
		{
			return this._566376925displayAddMovementDropDownList;
		}
		
		protected function set displayAddMovementDropDownList(param1:Boolean) : void
		{
			var _loc2_:Object = this._566376925displayAddMovementDropDownList;
			if(_loc2_ !== param1)
			{
				this._566376925displayAddMovementDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayAddMovementDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayRemoveMovementDropDownList() : Boolean
		{
			return this._186141636displayRemoveMovementDropDownList;
		}
		
		protected function set displayRemoveMovementDropDownList(param1:Boolean) : void
		{
			var _loc2_:Object = this._186141636displayRemoveMovementDropDownList;
			if(_loc2_ !== param1)
			{
				this._186141636displayRemoveMovementDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayRemoveMovementDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayFlipButton() : Boolean
		{
			return this._1345931167displayFlipButton;
		}
		
		protected function set displayFlipButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._1345931167displayFlipButton;
			if(_loc2_ !== param1)
			{
				this._1345931167displayFlipButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayFlipButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayLayerButtons() : Boolean
		{
			return this._2030595794displayLayerButtons;
		}
		
		protected function set displayLayerButtons(param1:Boolean) : void
		{
			var _loc2_:Object = this._2030595794displayLayerButtons;
			if(_loc2_ !== param1)
			{
				this._2030595794displayLayerButtons = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayLayerButtons",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayDeleteButton() : Boolean
		{
			return this._610875745displayDeleteButton;
		}
		
		protected function set displayDeleteButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._610875745displayDeleteButton;
			if(_loc2_ !== param1)
			{
				this._610875745displayDeleteButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayDeleteButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayPreviewButton() : Boolean
		{
			return this._1916017800displayPreviewButton;
		}
		
		protected function set displayPreviewButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._1916017800displayPreviewButton;
			if(_loc2_ !== param1)
			{
				this._1916017800displayPreviewButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayPreviewButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayCopyButton() : Boolean
		{
			return this._1123549545displayCopyButton;
		}
		
		protected function set displayCopyButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._1123549545displayCopyButton;
			if(_loc2_ !== param1)
			{
				this._1123549545displayCopyButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayCopyButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayPasteButton() : Boolean
		{
			return this._376858237displayPasteButton;
		}
		
		protected function set displayPasteButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._376858237displayPasteButton;
			if(_loc2_ !== param1)
			{
				this._376858237displayPasteButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayPasteButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get displayClearButton() : Boolean
		{
			return this._1219428931displayClearButton;
		}
		
		protected function set displayClearButton(param1:Boolean) : void
		{
			var _loc2_:Object = this._1219428931displayClearButton;
			if(_loc2_ !== param1)
			{
				this._1219428931displayClearButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayClearButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get isSliding() : Boolean
		{
			return this._1595931044isSliding;
		}
		
		protected function set isSliding(param1:Boolean) : void
		{
			var _loc2_:Object = this._1595931044isSliding;
			if(_loc2_ !== param1)
			{
				this._1595931044isSliding = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isSliding",_loc2_,param1));
				}
			}
		}
	}
}
