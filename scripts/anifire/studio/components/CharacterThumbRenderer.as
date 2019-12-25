package anifire.studio.components
{
	import anifire.constant.ResponseConstants;
	import anifire.constant.ServerConstants;
	import anifire.managers.AppConfigManager;
	import anifire.managers.ExternalLinkManager;
	import anifire.managers.ServerConnector;
	import anifire.studio.core.CharThumb;
	import anifire.studio.core.Console;
	import anifire.studio.managers.TutorialManager;
	import anifire.studio.managers.UserAssetManager;
	import anifire.studio.models.ThumbModel;
	import anifire.util.ApiRequest;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import anifire.util.UtilUser;
	import flash.display.DisplayObjectContainer;
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
	import mx.core.FlexGlobals;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.utils.StringUtil;
	import spark.components.DataGroup;
	import spark.components.HGroup;
	import spark.components.SkinnableDataContainer;
	import spark.events.PopUpEvent;
	import spark.filters.ColorMatrixFilter;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class CharacterThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
	{
		
		protected static var _lockFilter:ColorMatrixFilter;
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _38836911_CharacterThumbRenderer_SolidColorStroke1:SolidColorStroke;
		
		private var _1402725672addCharGroup:AddCharacterGroup;
		
		private var _1781625235buttonGroup:HGroup;
		
		private var _1397778681copyButton:IconButton;
		
		private var _1245745987deleteButton:IconButton;
		
		private var _2024940825imageDisplay:CharacterThumbSparkImage;
		
		private var _1302741632infoButton:IconButton;
		
		private var _1908992068lockIcon:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _model:ThumbModel;
		
		protected var _dataSource:CharThumb;
		
		protected var _colorSetId:String = "";
		
		protected var _1692934083_editable:Boolean;
		
		protected var _415059026_copyable:Boolean;
		
		protected var _1611018281_locked:Boolean;
		
		protected var _254318759_isTemplateChar:Boolean;
		
		private var _tutorialManager:TutorialManager;
		
		private var _embed_mxml__styles_images_tray_lock_icon_png_423648535:Class;
		
		private var _embed_mxml__styles_images_tray_cc_copy_hover_png_452539351:Class;
		
		private var _embed_mxml__styles_images_tray_cc_copy_png_928026027:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function CharacterThumbRenderer()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._tutorialManager = TutorialManager.instance;
			this._embed_mxml__styles_images_tray_lock_icon_png_423648535 = CharacterThumbRenderer__embed_mxml__styles_images_tray_lock_icon_png_423648535;
			this._embed_mxml__styles_images_tray_cc_copy_hover_png_452539351 = CharacterThumbRenderer__embed_mxml__styles_images_tray_cc_copy_hover_png_452539351;
			this._embed_mxml__styles_images_tray_cc_copy_png_928026027 = CharacterThumbRenderer__embed_mxml__styles_images_tray_cc_copy_png_928026027;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._CharacterThumbRenderer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CharacterThumbRendererWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return CharacterThumbRenderer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 62;
			this.height = 90;
			this.buttonMode = true;
			this.mxmlContent = [this._CharacterThumbRenderer_Rect1_c(),this._CharacterThumbRenderer_CharacterThumbSparkImage1_i(),this._CharacterThumbRenderer_BitmapImage1_i(),this._CharacterThumbRenderer_AddCharacterGroup1_i()];
			this.currentState = "normal";
			var _CharacterThumbRenderer_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CharacterThumbRenderer_HGroup1_i);
			var _CharacterThumbRenderer_IconButton3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CharacterThumbRenderer_IconButton3_i);
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"hovered",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_CharacterThumbRenderer_IconButton3_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["addCharGroup"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_CharacterThumbRenderer_HGroup1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["addCharGroup"]
				}),new SetProperty().initializeFromObject({
					"target":"_CharacterThumbRenderer_SolidColorStroke1",
					"name":"alpha",
					"value":1
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
		
		public static function get lockFilter() : ColorMatrixFilter
		{
			var _loc1_:Array = null;
			if(!_lockFilter)
			{
				_loc1_ = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.3,0];
				_lockFilter = new ColorMatrixFilter(_loc1_);
			}
			return _lockFilter;
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			CharacterThumbRenderer._watcherSetupUtil = param1;
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
				this._dataSource = this._model.thumb as CharThumb;
				this._colorSetId = this._model.colorSetId;
				this._isTemplateChar = this._model.isStoreCharacter;
				if(this._model.isPlaceHolder)
				{
					this.addCharGroup.active = true;
					this.imageDisplay.model = null;
					this._locked = false;
					_toolTipContent = UtilDict.toDisplay("go","Create your own characters");
				}
				else
				{
					this.addCharGroup.active = false;
					this.imageDisplay.model = this._model;
				}
			}
			else
			{
				this._dataSource = null;
				this._colorSetId = "";
				this.imageDisplay.model = null;
			}
			if(this._dataSource)
			{
				this.updateThumbData();
			}
		}
		
		override protected function createDragProxy() : IFlexDisplayObject
		{
			var _loc1_:CharacterThumbRenderer = new CharacterThumbRenderer();
			_loc1_.dragging = true;
			_loc1_.imageDisplay.showTransition = false;
			_loc1_.data = data;
			_loc1_.scaleX = 1.6;
			_loc1_.scaleY = 1.6;
			return _loc1_;
		}
		
		override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
		{
			var _loc3_:DragSource = new DragSource();
			_loc3_.addData(this._dataSource,"thumb");
			_loc3_.addData(param2.localX,"x");
			_loc3_.addData(param2.localY,"y");
			if(this._colorSetId != "")
			{
				_loc3_.addData(this._colorSetId,"colorSetId");
			}
			return _loc3_;
		}
		
		override protected function shouldStartDrag(param1:MouseEvent) : Boolean
		{
			var _loc2_:ConfirmPopUp = null;
			if(this._model.locked)
			{
				this.displayUpsellHook();
				return false;
			}
			if(this._model.isPlaceHolder)
			{
				if(this._tutorialManager.currentTutorial)
				{
					return false;
				}
				_loc2_ = new ConfirmPopUp();
				_loc2_.title = UtilDict.toDisplay("go","Create New Character");
				_loc2_.message = UtilDict.toDisplay("go","Do you want to close the Studio and go to Character Creator?\n\nUnsaved changes will be discarded.");
				_loc2_.confirmText = UtilDict.toDisplay("go","OK");
				_loc2_.cancelText = UtilDict.toDisplay("go","Cancel");
				_loc2_.showCloseButton = false;
				_loc2_.addEventListener(PopUpEvent.CLOSE,this.onCreateCreatorPopUp);
				_loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
				return false;
			}
			return param1.target == this;
		}
		
		protected function displayUpsellHook() : void
		{
			Console.getConsole().resetExpectedUserType();
			ServerConnector.instance.displayUpsellHook("character");
		}
		
		protected function updateThumbData() : void
		{
			_toolTipContent = this._dataSource.name;
			if(UtilUser.hasAdminFeatures)
			{
				_toolTipContent = this._dataSource.toString();
			}
			this._locked = this._model.locked;
			this._editable = !this._model.isPlaceHolder && this._model.editable;
			this._copyable = !this._model.isPlaceHolder && !this._locked && this._model.copyable && this._dataSource.copyable && this._dataSource.isCC;
			this.imageDisplay.filters = !!this._locked?[lockFilter]:null;
		}
		
		protected function infoButtonHandler(param1:MouseEvent) : void
		{
			this.showInfoDialog();
		}
		
		protected function deleteButtonHandler(param1:MouseEvent) : void
		{
			this.showDeleteDialog();
		}
		
		protected function copyButtonHandler(param1:MouseEvent) : void
		{
			var _loc2_:ConfirmPopUp = null;
			if(this._tutorialManager.currentTutorial)
			{
				return;
			}
			if(this._model.copyable)
			{
				_loc2_ = new ConfirmPopUp();
				_loc2_.title = UtilDict.toDisplay("go","Copy Character");
				_loc2_.message = UtilDict.toDisplay("go","Do you want to close the Studio and go to Character Creator?\n\nUnsaved changes will be discarded.");
				_loc2_.confirmText = UtilDict.toDisplay("go","OK");
				_loc2_.cancelText = UtilDict.toDisplay("go","Cancel");
				_loc2_.showCloseButton = false;
				_loc2_.addEventListener(PopUpEvent.CLOSE,this.onCopyPopUpClose);
				_loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
			}
			else
			{
				this.displayUpsellHook();
			}
		}
		
		protected function onCopyPopUpClose(param1:PopUpEvent) : void
		{
			var _loc2_:String = null;
			var _loc3_:String = null;
			var _loc4_:String = null;
			if(param1.commit)
			{
				_loc2_ = this._dataSource.ccThemeId;
				_loc3_ = !!this._dataSource.encryptId?this._dataSource.encryptId:this._dataSource.id;
				_loc4_ = ServerConstants.CC_PAGE_PATH;
				if(_loc2_)
				{
					_loc4_ = _loc4_ + ("/" + _loc2_);
				}
				_loc4_ = _loc4_ + ("/copy/" + _loc3_);
				ExternalLinkManager.instance.navigateWithSession(_loc4_,ServerConstants.POPUP_WINDOW_NAME);
			}
		}
		
		protected function showInfoDialog() : void
		{
			var _loc1_:EditAssetPopUp = new EditAssetPopUp();
			_loc1_.thumb = this._dataSource;
			_loc1_.showPublishOptions = allowPublish();
			_loc1_.nameLabel = UtilDict.toDisplay("go","assetinfo_name");
			_loc1_.tagsLabel = UtilDict.toDisplay("go","assetinfo_tags");
			_loc1_.optionPrivateLabel = UtilDict.toDisplay("go","assetinfo_private");
			_loc1_.optionPublicLabel = UtilDict.toDisplay("go","assetinfo_public");
			_loc1_.confirmText = UtilDict.toDisplay("go","assetinfo_update");
			_loc1_.cancelText = UtilDict.toDisplay("go","assetinfo_cancel");
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmEdit);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function confirmEdit(param1:PopUpEvent) : void
		{
			var _loc2_:Object = null;
			if(param1.commit)
			{
				_loc2_ = param1.data;
				if(_loc2_)
				{
					this._dataSource.name = _loc2_["name"];
					this._dataSource.tags = _loc2_["tags"];
					this._dataSource.isPublished = _loc2_["published"];
					this._dataSource.sharingOptions = _loc2_["share"];
					UserAssetManager.instance.updateAsset(this._dataSource.id,this._dataSource.encAssetId,this._dataSource.name,this._dataSource.tags,this._dataSource.isPublished,this._dataSource.sharingOptions);
					_toolTipContent = this._dataSource.name;
				}
			}
		}
		
		protected function showDeleteDialog() : void
		{
			var _loc1_:ConfirmPopUp = new ConfirmPopUp();
			if(Console.getConsole().thumbTray.isInTeamTheme())
			{
				_loc1_.title = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET,LABEL_TYPE_CHARACTER));
				_loc1_.message = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET_MESSAGE,LABEL_TYPE_CHARACTER));
			}
			else
			{
				_loc1_.title = UtilDict.toDisplay("go","goalert_delcharacter");
				_loc1_.message = UtilDict.toDisplay("go","goalert_delcharactertext");
			}
			_loc1_.confirmText = UtilDict.toDisplay("go","goalert_delete");
			_loc1_.cancelText = UtilDict.toDisplay("go","goalert_cancel");
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmDelete);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function confirmDelete(param1:PopUpEvent) : void
		{
			if(param1.commit)
			{
				this.deleteThumbnail();
			}
		}
		
		protected function deleteThumbnail() : void
		{
			var _loc1_:Object = null;
			var _loc2_:ApiRequest = null;
			var _loc3_:URLVariables = null;
			var _loc4_:URLRequest = null;
			var _loc5_:URLStream = null;
			if(UtilSite.isGoAnimate)
			{
				_loc1_ = {};
				_loc1_[ResponseConstants.ID] = this._dataSource.encAssetId;
				_loc2_ = new ApiRequest();
				_loc2_.post(ServerConstants.ACTION_DELETE_ASSET_V2,_loc1_);
			}
			else
			{
				_loc3_ = AppConfigManager.instance.createURLVariables();
				_loc3_["assetId"] = this._dataSource.id;
				_loc3_["id"] = this._dataSource.encAssetId;
				_loc4_ = new URLRequest(ServerConstants.ACTION_DELETE_ASSET);
				_loc4_.method = URLRequestMethod.POST;
				_loc4_.data = _loc3_;
				_loc5_ = new URLStream();
				_loc5_.load(_loc4_);
			}
			if(owner is DataGroup)
			{
				(owner as DataGroup).dataProvider.removeItemAt(itemIndex);
			}
			else if(owner is SkinnableDataContainer)
			{
				(owner as SkinnableDataContainer).dataProvider.removeItemAt(itemIndex);
			}
		}
		
		protected function onCreateCreatorPopUp(param1:PopUpEvent) : void
		{
			var _loc2_:String = null;
			if(param1.commit)
			{
				_loc2_ = ServerConstants.CC_PAGE_PATH + "/" + this._model.colorSetId;
				ExternalLinkManager.instance.exitStudio();
				ExternalLinkManager.instance.navigateWithSession(_loc2_);
			}
		}
		
		private function _CharacterThumbRenderer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._CharacterThumbRenderer_SolidColorStroke1_i();
			_loc1_.fill = this._CharacterThumbRenderer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _CharacterThumbRenderer_SolidColorStroke1_i() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.alpha = 0;
			_loc1_.color = 5093288;
			this._CharacterThumbRenderer_SolidColorStroke1 = _loc1_;
			BindingManager.executeBindings(this,"_CharacterThumbRenderer_SolidColorStroke1",this._CharacterThumbRenderer_SolidColorStroke1);
			return _loc1_;
		}
		
		private function _CharacterThumbRenderer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _CharacterThumbRenderer_CharacterThumbSparkImage1_i() : CharacterThumbSparkImage
		{
			var _loc1_:CharacterThumbSparkImage = new CharacterThumbSparkImage();
			_loc1_.left = 7;
			_loc1_.right = 7;
			_loc1_.top = 7;
			_loc1_.bottom = 7;
			_loc1_.id = "imageDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.imageDisplay = _loc1_;
			BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
			return _loc1_;
		}
		
		private function _CharacterThumbRenderer_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.bottom = 3;
			_loc1_.right = 3;
			_loc1_.source = this._embed_mxml__styles_images_tray_lock_icon_png_423648535;
			_loc1_.initialized(this,"lockIcon");
			this.lockIcon = _loc1_;
			BindingManager.executeBindings(this,"lockIcon",this.lockIcon);
			return _loc1_;
		}
		
		private function _CharacterThumbRenderer_AddCharacterGroup1_i() : AddCharacterGroup
		{
			var _loc1_:AddCharacterGroup = new AddCharacterGroup();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.id = "addCharGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.addCharGroup = _loc1_;
			BindingManager.executeBindings(this,"addCharGroup",this.addCharGroup);
			return _loc1_;
		}
		
		private function _CharacterThumbRenderer_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.left = 0;
			_loc1_.top = 0;
			_loc1_.paddingLeft = 2;
			_loc1_.paddingTop = 2;
			_loc1_.gap = 2;
			_loc1_.mxmlContent = [this._CharacterThumbRenderer_IconButton1_i(),this._CharacterThumbRenderer_IconButton2_i()];
			_loc1_.id = "buttonGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.buttonGroup = _loc1_;
			BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
			return _loc1_;
		}
		
		private function _CharacterThumbRenderer_IconButton1_i() : IconButton
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
		
		private function _CharacterThumbRenderer_IconButton2_i() : IconButton
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
		
		private function _CharacterThumbRenderer_IconButton3_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.right = 0;
			_loc1_.bottom = 0;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_tray_cc_copy_png_928026027);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_tray_cc_copy_hover_png_452539351);
			_loc1_.addEventListener("mouseDown",this.__copyButton_mouseDown);
			_loc1_.id = "copyButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.copyButton = _loc1_;
			BindingManager.executeBindings(this,"copyButton",this.copyButton);
			return _loc1_;
		}
		
		public function __copyButton_mouseDown(param1:MouseEvent) : void
		{
			this.copyButtonHandler(param1);
		}
		
		private function _CharacterThumbRenderer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Boolean
			{
				return _locked;
			},null,"lockIcon.visible");
			result[1] = new Binding(this,function():Boolean
			{
				return _editable || _copyable;
			},null,"buttonGroup.visible");
			result[2] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"infoButton.includeInLayout");
			result[3] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"infoButton.visible");
			result[4] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"deleteButton.includeInLayout");
			result[5] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"deleteButton.visible");
			result[6] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Make a copy");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"copyButton.toolTip");
			result[7] = new Binding(this,function():Boolean
			{
				return _copyable;
			},null,"copyButton.visible");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _CharacterThumbRenderer_SolidColorStroke1() : SolidColorStroke
		{
			return this._38836911_CharacterThumbRenderer_SolidColorStroke1;
		}
		
		public function set _CharacterThumbRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
		{
			var _loc2_:Object = this._38836911_CharacterThumbRenderer_SolidColorStroke1;
			if(_loc2_ !== param1)
			{
				this._38836911_CharacterThumbRenderer_SolidColorStroke1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CharacterThumbRenderer_SolidColorStroke1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get addCharGroup() : AddCharacterGroup
		{
			return this._1402725672addCharGroup;
		}
		
		public function set addCharGroup(param1:AddCharacterGroup) : void
		{
			var _loc2_:Object = this._1402725672addCharGroup;
			if(_loc2_ !== param1)
			{
				this._1402725672addCharGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addCharGroup",_loc2_,param1));
				}
			}
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
		public function get imageDisplay() : CharacterThumbSparkImage
		{
			return this._2024940825imageDisplay;
		}
		
		public function set imageDisplay(param1:CharacterThumbSparkImage) : void
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
		public function get lockIcon() : BitmapImage
		{
			return this._1908992068lockIcon;
		}
		
		public function set lockIcon(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1908992068lockIcon;
			if(_loc2_ !== param1)
			{
				this._1908992068lockIcon = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lockIcon",_loc2_,param1));
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
		protected function get _copyable() : Boolean
		{
			return this._415059026_copyable;
		}
		
		protected function set _copyable(param1:Boolean) : void
		{
			var _loc2_:Object = this._415059026_copyable;
			if(_loc2_ !== param1)
			{
				this._415059026_copyable = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_copyable",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _locked() : Boolean
		{
			return this._1611018281_locked;
		}
		
		protected function set _locked(param1:Boolean) : void
		{
			var _loc2_:Object = this._1611018281_locked;
			if(_loc2_ !== param1)
			{
				this._1611018281_locked = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_locked",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _isTemplateChar() : Boolean
		{
			return this._254318759_isTemplateChar;
		}
		
		protected function set _isTemplateChar(param1:Boolean) : void
		{
			var _loc2_:Object = this._254318759_isTemplateChar;
			if(_loc2_ !== param1)
			{
				this._254318759_isTemplateChar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_isTemplateChar",_loc2_,param1));
				}
			}
		}
	}
}
