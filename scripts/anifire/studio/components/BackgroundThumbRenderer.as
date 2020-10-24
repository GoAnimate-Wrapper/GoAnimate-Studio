package anifire.studio.components
{
	import anifire.constant.ResponseConstants;
	import anifire.constant.ServerConstants;
	import anifire.constant.ThemeConstants;
	import anifire.managers.AppConfigManager;
	import anifire.studio.core.BackgroundThumb;
	import anifire.studio.core.Console;
	import anifire.studio.core.Thumb;
	import anifire.studio.managers.SharedAssetManager;
	import anifire.studio.managers.ThemeStarterManager;
	import anifire.studio.managers.TutorialManager;
	import anifire.studio.managers.UserAssetManager;
	import anifire.studio.models.ThumbModel;
	import anifire.util.ApiRequest;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import anifire.util.UtilUser;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLStream;
	import flash.net.URLVariables;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.DragSource;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.managers.DragManager;
	import mx.states.AddItems;
	import mx.states.State;
	import mx.utils.StringUtil;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.events.PopUpEvent;
	import spark.filters.DropShadowFilter;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class BackgroundThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _BackgroundThumbRenderer_Group4:Group;
		
		public var _BackgroundThumbRenderer_Label1:Label;
		
		public var _BackgroundThumbRenderer_Label2:Label;
		
		public var _BackgroundThumbRenderer_VGroup1:VGroup;
		
		private var _1781625235buttonGroup:HGroup;
		
		private var _1245745987deleteButton:IconButton;
		
		private var _937797528idDisplayGroup:Group;
		
		private var _2024940825imageDisplay:BackgroundThumbSparkImage;
		
		private var _1302741632infoButton:IconButton;
		
		private var _1209425521infoGroup:Group;
		
		private var _263713807overlayGroup:Group;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _model:ThumbModel;
		
		protected var _dataSource:BackgroundThumb;
		
		protected var _colorSetId:String = "";
		
		private var _1401767146wideMode:Boolean;
		
		protected var _1692934083_editable:Boolean;
		
		protected var _329089670_isStarter:Boolean;
		
		protected var _943475025_isMultipleScenesStarter:Boolean;
		
		protected var _1805325847_showId:Boolean;
		
		protected var _248917117_sceneNumberText:String = "";
		
		protected var _509683624_starterIdText:String = "";
		
		protected var _675199010_shouldAllowDelete:Boolean = false;
		
		private var _tutorialManager:TutorialManager;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function BackgroundThumbRenderer()
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
			bindings = this._BackgroundThumbRenderer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_BackgroundThumbRendererWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return BackgroundThumbRenderer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 135;
			this.height = 90;
			this.buttonMode = true;
			this.mxmlContent = [this._BackgroundThumbRenderer_Rect1_c(),this._BackgroundThumbRenderer_BackgroundThumbSparkImage1_i()];
			this.currentState = "normal";
			var _BackgroundThumbRenderer_Group1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._BackgroundThumbRenderer_Group1_i);
			var _BackgroundThumbRenderer_Group3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._BackgroundThumbRenderer_Group3_i);
			var _BackgroundThumbRenderer_Group4_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._BackgroundThumbRenderer_Group4_i);
			var _BackgroundThumbRenderer_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._BackgroundThumbRenderer_HGroup1_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_BackgroundThumbRenderer_Group1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["imageDisplay"]
				})]
			}),new State({
				"name":"hovered",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_BackgroundThumbRenderer_HGroup1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["imageDisplay"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_BackgroundThumbRenderer_Group3_factory,
					"destination":"infoGroup",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["idDisplayGroup"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_BackgroundThumbRenderer_Group1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["imageDisplay"]
				})]
			}),new State({
				"name":"selected",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_BackgroundThumbRenderer_Group4_factory,
					"destination":"infoGroup",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["idDisplayGroup"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_BackgroundThumbRenderer_Group1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["imageDisplay"]
				})]
			}),new State({
				"name":"dragging",
				"overrides":[]
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
			BackgroundThumbRenderer._watcherSetupUtil = param1;
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
		
		override public function set data(param1:Object) : void
		{
			super.data = param1;
			this._model = data as ThumbModel;
			if(this._model)
			{
				this._dataSource = this._model.thumb as BackgroundThumb;
				this._colorSetId = this._model.colorSetId;
				this._editable = this._model.editable;
				if(this._dataSource)
				{
					this._shouldAllowDelete = this._dataSource.themeId == ThemeConstants.UGC_THEME_ID;
				}
			}
			else
			{
				this._dataSource = null;
				this._colorSetId = "";
				this._editable = false;
			}
			if(this._dataSource)
			{
				this._isStarter = this._dataSource.isStarter;
				this._isMultipleScenesStarter = this._dataSource.isStarter && this._dataSource.numScenes > 1;
				this.updateThumbData();
			}
			if(this._isStarter)
			{
				_dragProxyImageAlpha = 0.8;
				if(UtilUser.hasAdminFeatures)
				{
					this._editable = true;
				}
			}
			this.imageDisplay.model = this._model;
		}
		
		override protected function createDragProxy() : IFlexDisplayObject
		{
			var _loc2_:DropShadowFilter = null;
			var _loc1_:BackgroundThumbRenderer = new BackgroundThumbRenderer();
			_loc1_.dragging = true;
			_loc1_.imageDisplay.showTransition = false;
			_loc1_.data = data;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			if(this._isStarter)
			{
				_loc1_.rotation = 5;
				_loc1_.y = _loc1_.height / 2;
				_loc2_ = new DropShadowFilter();
				_loc2_.color = 0;
				_loc2_.distance = 2;
				_loc2_.angle = 70;
				_loc2_.alpha = 0.5;
				_loc1_.filters = [_loc2_];
			}
			return _loc1_;
		}
		
		override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
		{
			var _loc3_:DragSource = new DragSource();
			_loc3_.addData(this._dataSource,Thumb.DRAG_DATA_FORMAT);
			if(this._colorSetId != "")
			{
				_loc3_.addData(this._colorSetId,"colorSetId");
			}
			if(this._isStarter)
			{
				_loc3_.addData(this._dataSource,BackgroundThumb.STARTER_DRAG_DATA_FORMAT);
			}
			return _loc3_;
		}
		
		override protected function shouldStartDrag(param1:MouseEvent) : Boolean
		{
			if(param1.target == this)
			{
				return true;
			}
			currentState = "hovered";
			return false;
		}
		
		protected function updateThumbData() : void
		{
			this._showId = false;
			_toolTipContent = this._dataSource.name;
			if(this._isStarter)
			{
				this._sceneNumberText = StringUtil.substitute(UtilDict.translate("{0} Scenes"),this._dataSource.numScenes);
				this._starterIdText = this._dataSource.id;
				this._showId = UtilUser.hasAdminFeatures;
			}
		}
		
		protected function infoButtonHandler(param1:MouseEvent) : void
		{
			this.showInfoDialog();
		}
		
		protected function deleteButtonHandler(param1:MouseEvent) : void
		{
			this.showDeleteDialog();
		}
		
		protected function showInfoDialog() : void
		{
			var _loc1_:EditAssetPopUp = new EditAssetPopUp();
			if(!this._isStarter)
			{
				_loc1_.showPublishOptions = allowPublish();
			}
			_loc1_.thumb = this._dataSource;
			_loc1_.nameLabel = UtilDict.translate("Name:");
			_loc1_.tagsLabel = UtilDict.translate("Tags:");
			_loc1_.optionPrivateLabel = UtilDict.translate("Private");
			_loc1_.optionPublicLabel = UtilDict.translate("Public");
			_loc1_.confirmText = UtilDict.translate("Update");
			_loc1_.cancelText = UtilDict.translate("Cancel");
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.editPopUp_closeHandler);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function editPopUp_closeHandler(param1:PopUpEvent) : void
		{
			var _loc2_:Object = null;
			if(param1.commit)
			{
				_loc2_ = param1.data;
				if(_loc2_)
				{
					this._dataSource.name = _loc2_["name"];
					this._dataSource.tags = _loc2_["tags"];
					this._dataSource.sharingOptions = _loc2_["share"];
					if(this._isStarter)
					{
						ThemeStarterManager.instance.updateStarter(this._dataSource.aid,this._dataSource.name,this._dataSource.tags,this._dataSource.encAssetId,this._dataSource.sharingOptions);
					}
					else
					{
						this._dataSource.isPublished = _loc2_["published"];
						UserAssetManager.instance.updateAsset(this._dataSource.id,this._dataSource.encAssetId,this._dataSource.name,this._dataSource.tags,this._dataSource.isPublished,this._dataSource.sharingOptions);
					}
					_toolTipContent = this._dataSource.name;
				}
			}
		}
		
		protected function showDeleteDialog() : void
		{
			var _loc1_:ConfirmPopUp = new ConfirmPopUp();
			if(Console.getConsole().thumbTray.isInTeamTheme())
			{
				if(this._isStarter)
				{
					_loc1_.title = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET,LABEL_TYPE_STARTER));
					_loc1_.message = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET_MESSAGE,LABEL_TYPE_STARTER));
				}
				else
				{
					_loc1_.title = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET,LABEL_TYPE_BACKGROUND));
					_loc1_.message = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET_MESSAGE,LABEL_TYPE_BACKGROUND));
				}
			}
			else if(this._isStarter)
			{
				_loc1_.title = UtilDict.translate("Delete Starter");
				_loc1_.message = UtilDict.translate("You will not be able to use this starter any more!");
			}
			else
			{
				_loc1_.title = UtilDict.translate("Delete Background");
				_loc1_.message = UtilDict.translate("You will not be able to use this background any more!");
			}
			_loc1_.confirmText = UtilDict.translate("Delete");
			_loc1_.cancelText = UtilDict.translate("Cancel");
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.deletePopUp_closeHandler);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function deletePopUp_closeHandler(param1:PopUpEvent) : void
		{
			if(param1.commit)
			{
				this.confirmDelete();
			}
		}
		
		protected function confirmDelete() : void
		{
			var _loc2_:Object = null;
			var _loc3_:ApiRequest = null;
			var _loc4_:URLVariables = null;
			var _loc5_:String = null;
			var _loc6_:URLRequest = null;
			var _loc7_:URLStream = null;
			if(UtilSite.isGoAnimate)
			{
				_loc2_ = {};
				_loc2_[ResponseConstants.ID] = this._dataSource.encAssetId;
				_loc3_ = new ApiRequest();
				_loc3_.post(ServerConstants.ACTION_DELETE_ASSET_V2,_loc2_);
			}
			else
			{
				_loc4_ = AppConfigManager.instance.createURLVariables();
				if(this._isStarter)
				{
					_loc5_ = ServerConstants.ACTION_DELETE_STARTER;
					_loc4_["templateId"] = this._dataSource.starterId;
					_loc4_["id"] = this._dataSource.encAssetId;
				}
				else
				{
					_loc5_ = ServerConstants.ACTION_DELETE_ASSET;
					_loc4_["assetId"] = this._dataSource.id;
					_loc4_["id"] = this._dataSource.encAssetId;
				}
				_loc6_ = new URLRequest(_loc5_);
				_loc6_.method = URLRequestMethod.POST;
				_loc6_.data = _loc4_;
				_loc7_ = new URLStream();
				_loc7_.load(_loc6_);
			}
			var _loc1_:String = this._dataSource.id;
			if(this._isStarter)
			{
				UserAssetManager.instance.removeStarterByAssetId(_loc1_);
				SharedAssetManager.adminTeamInstance.removeStarterByAssetId(_loc1_);
			}
			else
			{
				UserAssetManager.instance.removeBackgroundByAssetId(_loc1_);
				SharedAssetManager.adminTeamInstance.removeBackgroundByAssetId(_loc1_);
			}
		}
		
		override protected function mouseMoveHandler(param1:MouseEvent) : void
		{
			super.mouseMoveHandler(param1);
			if(this._isStarter && _isMouseDown && DragManager.isDragging)
			{
				this.selected = true;
				Console.getConsole().showStarterDropLayer();
			}
		}
		
		private function _BackgroundThumbRenderer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._BackgroundThumbRenderer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15987700;
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_BackgroundThumbSparkImage1_i() : BackgroundThumbSparkImage
		{
			var _loc1_:BackgroundThumbSparkImage = new BackgroundThumbSparkImage();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.id = "imageDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.imageDisplay = _loc1_;
			BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.mxmlContent = [this._BackgroundThumbRenderer_Group2_i()];
			_loc1_.id = "infoGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.infoGroup = _loc1_;
			BindingManager.executeBindings(this,"infoGroup",this.infoGroup);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.mxmlContent = [this._BackgroundThumbRenderer_Rect2_c(),this._BackgroundThumbRenderer_Label1_i()];
			_loc1_.id = "idDisplayGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.idDisplayGroup = _loc1_;
			BindingManager.executeBindings(this,"idDisplayGroup",this.idDisplayGroup);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._BackgroundThumbRenderer_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			_loc1_.alpha = 0.7;
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.top = 5;
			_loc1_.right = 5;
			_loc1_.setStyle("fontSize",11);
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.id = "_BackgroundThumbRenderer_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._BackgroundThumbRenderer_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_BackgroundThumbRenderer_Label1",this._BackgroundThumbRenderer_Label1);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._BackgroundThumbRenderer_Rect3_c(),this._BackgroundThumbRenderer_VGroup1_i()];
			_loc1_.id = "overlayGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.overlayGroup = _loc1_;
			BindingManager.executeBindings(this,"overlayGroup",this.overlayGroup);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Rect3_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._BackgroundThumbRenderer_SolidColorStroke1_c();
			_loc1_.fill = this._BackgroundThumbRenderer_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 3062438;
			_loc1_.weight = 4;
			_loc1_.joints = "miter";
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0.5;
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.paddingLeft = 7;
			_loc1_.paddingRight = 7;
			_loc1_.paddingBottom = 5;
			_loc1_.paddingTop = 5;
			_loc1_.verticalAlign = "bottom";
			_loc1_.mxmlContent = [this._BackgroundThumbRenderer_Label2_i()];
			_loc1_.id = "_BackgroundThumbRenderer_VGroup1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._BackgroundThumbRenderer_VGroup1 = _loc1_;
			BindingManager.executeBindings(this,"_BackgroundThumbRenderer_VGroup1",this._BackgroundThumbRenderer_VGroup1);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("fontSize",16);
			_loc1_.setStyle("color",16777215);
			_loc1_.id = "_BackgroundThumbRenderer_Label2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._BackgroundThumbRenderer_Label2 = _loc1_;
			BindingManager.executeBindings(this,"_BackgroundThumbRenderer_Label2",this._BackgroundThumbRenderer_Label2);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._BackgroundThumbRenderer_Rect4_c()];
			_loc1_.id = "_BackgroundThumbRenderer_Group4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._BackgroundThumbRenderer_Group4 = _loc1_;
			BindingManager.executeBindings(this,"_BackgroundThumbRenderer_Group4",this._BackgroundThumbRenderer_Group4);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_Rect4_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._BackgroundThumbRenderer_SolidColor4_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_SolidColor4_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0.7;
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.paddingLeft = 4;
			_loc1_.paddingTop = 4;
			_loc1_.gap = 2;
			_loc1_.mxmlContent = [this._BackgroundThumbRenderer_IconButton1_i(),this._BackgroundThumbRenderer_IconButton2_i()];
			_loc1_.id = "buttonGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.buttonGroup = _loc1_;
			BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
			return _loc1_;
		}
		
		private function _BackgroundThumbRenderer_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "infoSmall";
			_loc1_.addEventListener("mouseDown",this.__infoButton_mouseDown);
			_loc1_.id = "infoButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.infoButton = _loc1_;
			BindingManager.executeBindings(this,"infoButton",this.infoButton);
			return _loc1_;
		}
		
		public function __infoButton_mouseDown(param1:MouseEvent) : void
		{
			this.infoButtonHandler(param1);
		}
		
		private function _BackgroundThumbRenderer_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "deleteSmall";
			_loc1_.addEventListener("mouseDown",this.__deleteButton_mouseDown);
			_loc1_.id = "deleteButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.deleteButton = _loc1_;
			BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
			return _loc1_;
		}
		
		public function __deleteButton_mouseDown(param1:MouseEvent) : void
		{
			this.deleteButtonHandler(param1);
		}
		
		private function _BackgroundThumbRenderer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,null,null,"imageDisplay.wideMode","wideMode");
			result[1] = new Binding(this,function():Boolean
			{
				return _showId;
			},null,"idDisplayGroup.visible");
			result[2] = new Binding(this,function():String
			{
				var _loc1_:* = _starterIdText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_BackgroundThumbRenderer_Label1.text");
			result[3] = new Binding(this,function():Boolean
			{
				return _isStarter;
			},null,"_BackgroundThumbRenderer_Label1.visible");
			result[4] = new Binding(this,function():Boolean
			{
				return _isMultipleScenesStarter;
			},null,"_BackgroundThumbRenderer_VGroup1.visible");
			result[5] = new Binding(this,function():String
			{
				var _loc1_:* = _sceneNumberText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_BackgroundThumbRenderer_Label2.text");
			result[6] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"buttonGroup.visible");
			result[7] = new Binding(this,function():Boolean
			{
				return _shouldAllowDelete;
			},null,"deleteButton.visible");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get buttonGroup() : HGroup
		{
			return this._1781625235buttonGroup;
		}
		
		public function set buttonGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._1781625235buttonGroup;
			if(_loc2_ !== param1)
			{
				this._1781625235buttonGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonGroup",_loc2_,param1));
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
		public function get idDisplayGroup() : Group
		{
			return this._937797528idDisplayGroup;
		}
		
		public function set idDisplayGroup(param1:Group) : void
		{
			var _loc2_:Object = this._937797528idDisplayGroup;
			if(_loc2_ !== param1)
			{
				this._937797528idDisplayGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"idDisplayGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get imageDisplay() : BackgroundThumbSparkImage
		{
			return this._2024940825imageDisplay;
		}
		
		public function set imageDisplay(param1:BackgroundThumbSparkImage) : void
		{
			var _loc2_:Object = this._2024940825imageDisplay;
			if(_loc2_ !== param1)
			{
				this._2024940825imageDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get infoButton() : IconButton
		{
			return this._1302741632infoButton;
		}
		
		public function set infoButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._1302741632infoButton;
			if(_loc2_ !== param1)
			{
				this._1302741632infoButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get infoGroup() : Group
		{
			return this._1209425521infoGroup;
		}
		
		public function set infoGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1209425521infoGroup;
			if(_loc2_ !== param1)
			{
				this._1209425521infoGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get overlayGroup() : Group
		{
			return this._263713807overlayGroup;
		}
		
		public function set overlayGroup(param1:Group) : void
		{
			var _loc2_:Object = this._263713807overlayGroup;
			if(_loc2_ !== param1)
			{
				this._263713807overlayGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overlayGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get wideMode() : Boolean
		{
			return this._1401767146wideMode;
		}
		
		public function set wideMode(param1:Boolean) : void
		{
			var _loc2_:Object = this._1401767146wideMode;
			if(_loc2_ !== param1)
			{
				this._1401767146wideMode = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wideMode",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _editable() : Boolean
		{
			return this._1692934083_editable;
		}
		
		protected function set _editable(param1:Boolean) : void
		{
			var _loc2_:Object = this._1692934083_editable;
			if(_loc2_ !== param1)
			{
				this._1692934083_editable = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_editable",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _isStarter() : Boolean
		{
			return this._329089670_isStarter;
		}
		
		protected function set _isStarter(param1:Boolean) : void
		{
			var _loc2_:Object = this._329089670_isStarter;
			if(_loc2_ !== param1)
			{
				this._329089670_isStarter = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_isStarter",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _isMultipleScenesStarter() : Boolean
		{
			return this._943475025_isMultipleScenesStarter;
		}
		
		protected function set _isMultipleScenesStarter(param1:Boolean) : void
		{
			var _loc2_:Object = this._943475025_isMultipleScenesStarter;
			if(_loc2_ !== param1)
			{
				this._943475025_isMultipleScenesStarter = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_isMultipleScenesStarter",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _showId() : Boolean
		{
			return this._1805325847_showId;
		}
		
		protected function set _showId(param1:Boolean) : void
		{
			var _loc2_:Object = this._1805325847_showId;
			if(_loc2_ !== param1)
			{
				this._1805325847_showId = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showId",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _sceneNumberText() : String
		{
			return this._248917117_sceneNumberText;
		}
		
		protected function set _sceneNumberText(param1:String) : void
		{
			var _loc2_:Object = this._248917117_sceneNumberText;
			if(_loc2_ !== param1)
			{
				this._248917117_sceneNumberText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sceneNumberText",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _starterIdText() : String
		{
			return this._509683624_starterIdText;
		}
		
		protected function set _starterIdText(param1:String) : void
		{
			var _loc2_:Object = this._509683624_starterIdText;
			if(_loc2_ !== param1)
			{
				this._509683624_starterIdText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_starterIdText",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _shouldAllowDelete() : Boolean
		{
			return this._675199010_shouldAllowDelete;
		}
		
		protected function set _shouldAllowDelete(param1:Boolean) : void
		{
			var _loc2_:Object = this._675199010_shouldAllowDelete;
			if(_loc2_ !== param1)
			{
				this._675199010_shouldAllowDelete = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_shouldAllowDelete",_loc2_,param1));
				}
			}
		}
	}
}
