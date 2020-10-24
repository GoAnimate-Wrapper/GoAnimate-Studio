package anifire.studio.components
{
	import anifire.constant.ResponseConstants;
	import anifire.constant.ServerConstants;
	import anifire.event.CoreEvent;
	import anifire.managers.AppConfigManager;
	import anifire.studio.core.Console;
	import anifire.studio.core.SoundThumb;
	import anifire.studio.core.Thumb;
	import anifire.studio.core.sound.ISoundable;
	import anifire.studio.core.sound.SoundEvent;
	import anifire.studio.managers.AccessRightManager;
	import anifire.studio.managers.SharedAssetManager;
	import anifire.studio.managers.SoundPlaybackManager;
	import anifire.studio.managers.StudioDragManager;
	import anifire.studio.managers.UserAssetManager;
	import anifire.studio.models.SoundCollection;
	import anifire.studio.models.ThumbModel;
	import anifire.studio.skins.SoundVariationListSkin;
	import anifire.util.ApiRequest;
	import anifire.util.UtilDict;
	import anifire.util.UtilSite;
	import anifire.util.UtilString;
	import flash.events.Event;
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
	import mx.collections.IList;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.DragSource;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.EffectEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.utils.StringUtil;
	import spark.collections.Sort;
	import spark.collections.SortField;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.events.PopUpEvent;
	import spark.primitives.Line;
	import spark.primitives.Path;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class SoundThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
	{
		
		public static const EVENT_PLAY_BUT_CLICK:String = "play_but_click";
		
		public static const LABEL_GOTEAM_ONLY:String = "GoTeam only";
		
		public static const LABEL_GOPREMIUM_GOTEAM_ONLY:String = "GoPremium & GoTeam only";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _SoundThumbRenderer_Group1:Group;
		
		private var _801855588_SoundThumbRenderer_HGroup1:HGroup;
		
		private var _801855590_SoundThumbRenderer_HGroup3:HGroup;
		
		public var _SoundThumbRenderer_Line2:Line;
		
		private var _1935332176_SoundThumbRenderer_SetProperty1:SetProperty;
		
		private var _1935332175_SoundThumbRenderer_SetProperty2:SetProperty;
		
		private var _1751797770arrowGroup:Group;
		
		private var _1391998104bgFill:SolidColor;
		
		private var _1781625235buttonGroup:HGroup;
		
		private var _434221093chromeGroup:Group;
		
		private var _809612678contentGroup:VGroup;
		
		private var _1245745987deleteButton:IconButton;
		
		private var _775506802durationDisplay:Label;
		
		private var _1302741632infoButton:IconButton;
		
		private var _1671708693labelGroup:HGroup;
		
		private var _1097557894playButton:IconButton;
		
		private var _1844912971upgradeIcon:UpgradeIcon;
		
		private var _1653553920variationBar:Group;
		
		private var _2026267867variationButton:VariationButton;
		
		private var _279741777variationList:SoundVariationList;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _1934183932_dataSource:SoundThumb;
		
		protected var _2096654142_labelText:String;
		
		protected var _256018112_durationText:String;
		
		protected var _1864660719_playing:Boolean = false;
		
		protected var _1692934083_editable:Boolean = false;
		
		protected var _1913409067_previewOnly:Boolean;
		
		protected var _sound:ISoundable;
		
		protected var _375930756_upsellNotice:String;
		
		protected var _1158315602_variationCollection:SoundCollection;
		
		private var _variationSort:Sort;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function SoundThumbRenderer()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._1158315602_variationCollection = new SoundCollection("variation");
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._SoundThumbRenderer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SoundThumbRendererWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return SoundThumbRenderer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.autoDrawBackground = false;
			this.percentWidth = 100;
			this.mxmlContent = [this._SoundThumbRenderer_Group1_i()];
			this.currentState = "normal";
			var _SoundThumbRenderer_HGroup4_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundThumbRenderer_HGroup4_i);
			var _SoundThumbRenderer_Line2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundThumbRenderer_Line2_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SoundThumbRenderer_Line2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SoundThumbRenderer_Group1"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_SoundThumbRenderer_HGroup4_factory,
					"destination":"_SoundThumbRenderer_HGroup1",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["contentGroup"]
				})]
			}),new State({
				"name":"hovered",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SoundThumbRenderer_Line2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SoundThumbRenderer_Group1"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_SoundThumbRenderer_HGroup4_factory,
					"destination":"_SoundThumbRenderer_HGroup1",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["contentGroup"]
				}),this._SoundThumbRenderer_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
					"target":"infoButton",
					"name":"visible",
					"value":undefined
				})),this._SoundThumbRenderer_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
					"target":"deleteButton",
					"name":"visible",
					"value":undefined
				}))]
			}),new State({
				"name":"dragging",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"bgFill",
					"name":"alpha",
					"value":0
				}),new SetProperty().initializeFromObject({
					"target":"_SoundThumbRenderer_HGroup3",
					"name":"visible",
					"value":false
				})]
			})];
			BindingManager.executeBindings(this,"_SoundThumbRenderer_SetProperty1",this._SoundThumbRenderer_SetProperty1);
			BindingManager.executeBindings(this,"_SoundThumbRenderer_SetProperty2",this._SoundThumbRenderer_SetProperty2);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			SoundThumbRenderer._watcherSetupUtil = param1;
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
		
		override protected function init() : void
		{
			this.contentGroup.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
			this.contentGroup.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
			this.contentGroup.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
			this.contentGroup.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
		}
		
		override public function set data(param1:Object) : void
		{
			var _loc3_:Array = null;
			super.data = param1;
			if(this._dataSource)
			{
				if(!dragging)
				{
					this._dataSource.removeEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
				}
			}
			var _loc2_:ThumbModel = data as ThumbModel;
			if(_loc2_)
			{
				this._editable = _loc2_.editable;
				this._dataSource = _loc2_.thumb as SoundThumb;
				if(this._dataSource)
				{
					this._previewOnly = this._dataSource.previewOnly;
					this.sound#1 = this._dataSource.sound#1;
					this.updateLabel();
					if(!dragging)
					{
						this._dataSource.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
					}
					if(this._previewOnly)
					{
						if(this._dataSource.goTeamOnly)
						{
							this._upsellNotice = UtilDict.translate(LABEL_GOTEAM_ONLY);
						}
						else
						{
							this._upsellNotice = UtilDict.translate(LABEL_GOPREMIUM_GOTEAM_ONLY);
						}
					}
					this.variationButton.visible = this.variationBar.visible = this._dataSource.variations.length > 0;
					this.variationButton.previewOnly = !AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_TEAM_ONLY_PREMIUM_TRACK);
					this._variationCollection = new SoundCollection("variation");
					_loc3_ = [];
					_loc3_.push(new SortField("name"));
					_loc3_.push(new SortField("duration",false,true));
					this._variationSort = new Sort();
					this._variationSort.fields = _loc3_;
					this._variationCollection.sort = this._variationSort;
					this.loadSoundVariationThumb();
					this._variationCollection.refresh();
				}
			}
			this.chromeGroup.visible = false;
			this.variationList.visible = this.variationList.includeInLayout = false;
			if(this._dataSource && this._dataSource.isVariationListOpen)
			{
				this.variationList.openVariationList();
				this.chromeGroup.visible = true;
				this.variationList.visible = this.variationList.includeInLayout = true;
			}
		}
		
		public function get sound#1() : ISoundable
		{
			return this._sound;
		}
		
		public function set sound#1(param1:ISoundable) : void
		{
			if(this._sound != param1)
			{
				if(this._sound)
				{
					this._sound.removeEventListener(SoundEvent.STOPPED,this.onSoundStopped);
					this._sound.removeEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
				}
				this._sound = param1;
				if(this._sound)
				{
					this._playing = this._sound.isPlaying;
					this._sound.addEventListener(SoundEvent.STOPPED,this.onSoundStopped);
					this._sound.addEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
				}
				else
				{
					this._playing = false;
				}
			}
		}
		
		private function loadSoundVariationThumb() : void
		{
			var _loc3_:SoundThumb = null;
			var _loc1_:Number = this._dataSource.variations.length;
			var _loc2_:int = 0;
			while(_loc2_ < _loc1_)
			{
				_loc3_ = this._dataSource.theme.soundThumbs.getValueByKey(this._dataSource.variations[_loc2_]) as SoundThumb;
				if(_loc3_ && _loc3_.enable && _loc3_.isVariation)
				{
					this.addSoundOnVariationList(_loc3_);
				}
				_loc2_++;
			}
		}
		
		public function addSoundOnVariationList(param1:SoundThumb) : void
		{
			var _loc2_:ThumbModel = new ThumbModel(param1);
			this._variationCollection.addProduct(_loc2_);
		}
		
		private function onSoundThumbLoaded(param1:Event) : void
		{
			this.sound#1 = this._dataSource.sound#1;
		}
		
		private function onSoundPlayed(param1:Event) : void
		{
			this._playing = true;
		}
		
		private function onSoundStopped(param1:Event) : void
		{
			this._playing = false;
			this.dispatchEvent(new CoreEvent(CoreEvent.PLAY_SOUND_COMPLETE,this));
		}
		
		protected function updateLabel() : void
		{
			this._labelText = this._dataSource.name;
			this._durationText = UtilString.secToTimeString(this._dataSource.duration * 0.001,false);
		}
		
		protected function playButtonHandler(param1:MouseEvent) : void
		{
			if(this._playing)
			{
				SoundPlaybackManager.stop();
			}
			else
			{
				SoundPlaybackManager.playSoundThumb(this._dataSource,0,null,1,-1,0,0,0,0,false);
			}
			param1.stopImmediatePropagation();
		}
		
		protected function infoButtonHandler(param1:MouseEvent) : void
		{
			this.showInfoDialog();
			param1.stopImmediatePropagation();
		}
		
		protected function deleteButtonHandler(param1:MouseEvent) : void
		{
			this.showDeleteDialog();
			param1.stopImmediatePropagation();
		}
		
		override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
		{
			var _loc3_:DragSource = new DragSource();
			_loc3_.addData(this._dataSource,Thumb.DRAG_DATA_FORMAT);
			_loc3_.addData(this._dataSource,SoundThumb.DRAG_DATA_FORMAT);
			_loc3_.addData(param1,StudioDragManager.DRAG_IMAGE);
			return _loc3_;
		}
		
		override protected function createDragProxy() : IFlexDisplayObject
		{
			var _loc1_:SoundThumbRenderer = new SoundThumbRenderer();
			_loc1_.dragging = true;
			_loc1_.data = data;
			return _loc1_;
		}
		
		protected function showInfoDialog() : void
		{
			var _loc1_:EditAssetPopUp = new EditAssetPopUp();
			_loc1_.showPublishOptions = this.allowPublish();
			_loc1_.thumb = this._dataSource;
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
					this.updateLabel();
				}
			}
		}
		
		protected function showDeleteDialog() : void
		{
			var _loc1_:ConfirmPopUp = new ConfirmPopUp();
			if(Console.getConsole().thumbTray.isInTeamTheme())
			{
				_loc1_.title = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET,LABEL_TYPE_SOUND));
				_loc1_.message = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET_MESSAGE,LABEL_TYPE_SOUND));
			}
			else
			{
				_loc1_.title = UtilDict.toDisplay("go","goalert_delsound");
				_loc1_.message = UtilDict.toDisplay("go","goalert_delsoundtext");
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
			var _loc2_:Object = null;
			var _loc3_:ApiRequest = null;
			var _loc4_:URLVariables = null;
			var _loc5_:URLRequest = null;
			var _loc6_:URLStream = null;
			SoundPlaybackManager.stop();
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
				_loc4_["assetId"] = this._dataSource.id;
				_loc4_["id"] = this._dataSource.encAssetId;
				_loc5_ = new URLRequest(ServerConstants.ACTION_DELETE_ASSET);
				_loc5_.method = URLRequestMethod.POST;
				_loc5_.data = _loc4_;
				_loc6_ = new URLStream();
				_loc6_.load(_loc5_);
			}
			var _loc1_:String = this._dataSource.id;
			UserAssetManager.instance.removeSoundByAssetId(_loc1_);
			SharedAssetManager.adminTeamInstance.removeSoundByAssetId(_loc1_);
		}
		
		override protected function allowPublish() : Boolean
		{
			return false;
		}
		
		override protected function shouldStartDrag(param1:MouseEvent) : Boolean
		{
			if(this._dataSource && this._dataSource.previewOnly)
			{
				return false;
			}
			return true;
		}
		
		protected function variationButton_mouseClickHandler(param1:MouseEvent) : void
		{
			this.toggleVariationList();
		}
		
		protected function toggleVariationList() : void
		{
			if(!this.variationList.listExpand)
			{
				this.variationList.openVariationList();
				this.chromeGroup.visible = true;
				this.variationList.visible = this.variationList.includeInLayout = true;
			}
			else
			{
				this.variationList.closeVariationList();
				this.chromeGroup.visible = false;
			}
		}
		
		protected function listCloseAnimaton_effectEndHandler(param1:EffectEvent) : void
		{
			this.variationList.visible = this.variationList.includeInLayout = false;
		}
		
		protected function item_mouseOverHandler(param1:MouseEvent) : void
		{
			if(this.buttonGroup)
			{
				this.buttonGroup.visible = true;
			}
		}
		
		protected function item_mouseOutHandler(param1:MouseEvent) : void
		{
			if(this.buttonGroup && !this._playing)
			{
				this.buttonGroup.visible = false;
			}
		}
		
		private function _SoundThumbRenderer_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._SoundThumbRenderer_SoundVariationList1_i(),this._SoundThumbRenderer_Rect1_c(),this._SoundThumbRenderer_HGroup1_i(),this._SoundThumbRenderer_Group3_i()];
			_loc1_.id = "_SoundThumbRenderer_Group1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SoundThumbRenderer_Group1 = _loc1_;
			BindingManager.executeBindings(this,"_SoundThumbRenderer_Group1",this._SoundThumbRenderer_Group1);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_SoundVariationList1_i() : SoundVariationList
		{
			var _loc1_:SoundVariationList = new SoundVariationList();
			_loc1_.percentWidth = 100;
			_loc1_.top = 48;
			_loc1_.includeInLayout = false;
			_loc1_.visible = false;
			_loc1_.setStyle("skinClass",SoundVariationListSkin);
			_loc1_.addEventListener("effectEnd",this.__variationList_effectEnd);
			_loc1_.id = "variationList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.variationList = _loc1_;
			BindingManager.executeBindings(this,"variationList",this.variationList);
			return _loc1_;
		}
		
		public function __variationList_effectEnd(param1:EffectEvent) : void
		{
			this.listCloseAnimaton_effectEndHandler(param1);
		}
		
		private function _SoundThumbRenderer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.height = 48;
			_loc1_.fill = this._SoundThumbRenderer_SolidColor1_i();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_SolidColor1_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15594230;
			this.bgFill = _loc1_;
			BindingManager.executeBindings(this,"bgFill",this.bgFill);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.height = 48;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._SoundThumbRenderer_VGroup1_i()];
			_loc1_.addEventListener("mouseOver",this.___SoundThumbRenderer_HGroup1_mouseOver);
			_loc1_.addEventListener("mouseOut",this.___SoundThumbRenderer_HGroup1_mouseOut);
			_loc1_.id = "_SoundThumbRenderer_HGroup1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SoundThumbRenderer_HGroup1 = _loc1_;
			BindingManager.executeBindings(this,"_SoundThumbRenderer_HGroup1",this._SoundThumbRenderer_HGroup1);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.verticalAlign = "middle";
			_loc1_.gap = 4;
			_loc1_.paddingLeft = 7;
			_loc1_.paddingTop = 10;
			_loc1_.paddingBottom = 8;
			_loc1_.mouseChildren = true;
			_loc1_.mouseEnabledWhereTransparent = true;
			_loc1_.mxmlContent = [this._SoundThumbRenderer_HGroup2_i(),this._SoundThumbRenderer_HGroup3_i()];
			_loc1_.id = "contentGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.contentGroup = _loc1_;
			BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = 8;
			_loc1_.mxmlContent = [this._SoundThumbRenderer_Label1_i(),this._SoundThumbRenderer_UpgradeIcon1_i()];
			_loc1_.id = "labelGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.labelGroup = _loc1_;
			BindingManager.executeBindings(this,"labelGroup",this.labelGroup);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.maxDisplayedLines = 1;
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("fontSize",13);
			_loc1_.setStyle("verticalAlign","bottom");
			_loc1_.id = "labelDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			labelDisplay = _loc1_;
			BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_UpgradeIcon1_i() : UpgradeIcon
		{
			var _loc1_:UpgradeIcon = new UpgradeIcon();
			_loc1_.width = 9;
			_loc1_.id = "upgradeIcon";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.upgradeIcon = _loc1_;
			BindingManager.executeBindings(this,"upgradeIcon",this.upgradeIcon);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_HGroup3_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.gap = 8;
			_loc1_.mxmlContent = [this._SoundThumbRenderer_Label2_i(),this._SoundThumbRenderer_Group2_i(),this._SoundThumbRenderer_VariationButton1_i()];
			_loc1_.id = "_SoundThumbRenderer_HGroup3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SoundThumbRenderer_HGroup3 = _loc1_;
			BindingManager.executeBindings(this,"_SoundThumbRenderer_HGroup3",this._SoundThumbRenderer_HGroup3);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.maxDisplayedLines = 1;
			_loc1_.setStyle("fontSize",11);
			_loc1_.setStyle("verticalAlign","top");
			_loc1_.id = "durationDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.durationDisplay = _loc1_;
			BindingManager.executeBindings(this,"durationDisplay",this.durationDisplay);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._SoundThumbRenderer_Line1_c()];
			_loc1_.id = "variationBar";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.variationBar = _loc1_;
			BindingManager.executeBindings(this,"variationBar",this.variationBar);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.height = 10;
			_loc1_.stroke = this._SoundThumbRenderer_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 8355711;
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_VariationButton1_i() : VariationButton
		{
			var _loc1_:VariationButton = new VariationButton();
			_loc1_.addEventListener("click",this.__variationButton_click);
			_loc1_.id = "variationButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.variationButton = _loc1_;
			BindingManager.executeBindings(this,"variationButton",this.variationButton);
			return _loc1_;
		}
		
		public function __variationButton_click(param1:MouseEvent) : void
		{
			this.variationButton_mouseClickHandler(param1);
		}
		
		private function _SoundThumbRenderer_HGroup4_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentHeight = 100;
			_loc1_.paddingLeft = 4;
			_loc1_.paddingRight = 4;
			_loc1_.gap = 2;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._SoundThumbRenderer_IconButton1_i(),this._SoundThumbRenderer_IconButton2_i(),this._SoundThumbRenderer_IconButton3_i()];
			_loc1_.id = "buttonGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.buttonGroup = _loc1_;
			BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "infoSmall";
			_loc1_.visible = false;
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
		
		private function _SoundThumbRenderer_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "deleteSmall";
			_loc1_.visible = false;
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
		
		private function _SoundThumbRenderer_IconButton3_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.addEventListener("mouseDown",this.__playButton_mouseDown);
			_loc1_.id = "playButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.playButton = _loc1_;
			BindingManager.executeBindings(this,"playButton",this.playButton);
			return _loc1_;
		}
		
		public function __playButton_mouseDown(param1:MouseEvent) : void
		{
			this.playButtonHandler(param1);
		}
		
		public function ___SoundThumbRenderer_HGroup1_mouseOver(param1:MouseEvent) : void
		{
			this.item_mouseOverHandler(param1);
		}
		
		public function ___SoundThumbRenderer_HGroup1_mouseOut(param1:MouseEvent) : void
		{
			this.item_mouseOutHandler(param1);
		}
		
		private function _SoundThumbRenderer_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.top = 41;
			_loc1_.horizontalCenter = -19;
			_loc1_.mxmlContent = [this._SoundThumbRenderer_Group4_i()];
			_loc1_.id = "chromeGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.chromeGroup = _loc1_;
			BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.horizontalCenter = 0;
			_loc1_.mxmlContent = [this._SoundThumbRenderer_Path1_c()];
			_loc1_.id = "arrowGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.arrowGroup = _loc1_;
			BindingManager.executeBindings(this,"arrowGroup",this.arrowGroup);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_Path1_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.percentHeight = 100;
			_loc1_.data = "M 0 8 l 6 -8 l 6 8 Z";
			_loc1_.fill = this._SoundThumbRenderer_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_Line2_i() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._SoundThumbRenderer_SolidColorStroke2_c();
			_loc1_.initialized(this,"_SoundThumbRenderer_Line2");
			this._SoundThumbRenderer_Line2 = _loc1_;
			BindingManager.executeBindings(this,"_SoundThumbRenderer_Line2",this._SoundThumbRenderer_Line2);
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_SolidColorStroke2_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14870509;
			return _loc1_;
		}
		
		private function _SoundThumbRenderer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():IList
			{
				return _variationCollection;
			},null,"variationList.dataProvider");
			result[1] = new Binding(this,function():Number
			{
				return !!_previewOnly?Number(labelGroup.width - upgradeIcon.width - 8):Number(labelGroup.width);
			},null,"labelDisplay.maxWidth");
			result[2] = new Binding(this,function():String
			{
				var _loc1_:* = _labelText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"labelDisplay.text");
			result[3] = new Binding(this,function():uint
			{
				return !!_previewOnly?uint(13160918):uint(5331305);
			},function(param1:uint):void
			{
				labelDisplay.setStyle("color",param1);
			},"labelDisplay.color");
			result[4] = new Binding(this,function():Boolean
			{
				return _previewOnly;
			},null,"upgradeIcon.visible");
			result[5] = new Binding(this,function():Boolean
			{
				return _previewOnly;
			},null,"upgradeIcon.includeInLayout");
			result[6] = new Binding(this,function():String
			{
				var _loc1_:* = _upsellNotice;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"upgradeIcon.toolTipLabel");
			result[7] = new Binding(this,function():Boolean
			{
				return _dataSource.goTeamOnly;
			},null,"upgradeIcon.isGoTeamOnly");
			result[8] = new Binding(this,function():String
			{
				var _loc1_:* = _durationText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"durationDisplay.text");
			result[9] = new Binding(this,function():uint
			{
				return !!_previewOnly?uint(13160918):uint(8752789);
			},function(param1:uint):void
			{
				durationDisplay.setStyle("color",param1);
			},"durationDisplay.color");
			result[10] = new Binding(this,function():Boolean
			{
				return _playing;
			},null,"buttonGroup.visible");
			result[11] = new Binding(this,function():*
			{
				return _editable;
			},null,"_SoundThumbRenderer_SetProperty1.value");
			result[12] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"infoButton.includeInLayout");
			result[13] = new Binding(this,function():*
			{
				return _editable;
			},null,"_SoundThumbRenderer_SetProperty2.value");
			result[14] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"deleteButton.includeInLayout");
			result[15] = new Binding(this,function():Object
			{
				return !!_playing?"stopSmall":"playSmall";
			},null,"playButton.styleName");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _SoundThumbRenderer_HGroup1() : HGroup
		{
			return this._801855588_SoundThumbRenderer_HGroup1;
		}
		
		public function set _SoundThumbRenderer_HGroup1(param1:HGroup) : void
		{
			var _loc2_:Object = this._801855588_SoundThumbRenderer_HGroup1;
			if(_loc2_ !== param1)
			{
				this._801855588_SoundThumbRenderer_HGroup1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundThumbRenderer_HGroup1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _SoundThumbRenderer_HGroup3() : HGroup
		{
			return this._801855590_SoundThumbRenderer_HGroup3;
		}
		
		public function set _SoundThumbRenderer_HGroup3(param1:HGroup) : void
		{
			var _loc2_:Object = this._801855590_SoundThumbRenderer_HGroup3;
			if(_loc2_ !== param1)
			{
				this._801855590_SoundThumbRenderer_HGroup3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundThumbRenderer_HGroup3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _SoundThumbRenderer_SetProperty1() : SetProperty
		{
			return this._1935332176_SoundThumbRenderer_SetProperty1;
		}
		
		public function set _SoundThumbRenderer_SetProperty1(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1935332176_SoundThumbRenderer_SetProperty1;
			if(_loc2_ !== param1)
			{
				this._1935332176_SoundThumbRenderer_SetProperty1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundThumbRenderer_SetProperty1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _SoundThumbRenderer_SetProperty2() : SetProperty
		{
			return this._1935332175_SoundThumbRenderer_SetProperty2;
		}
		
		public function set _SoundThumbRenderer_SetProperty2(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1935332175_SoundThumbRenderer_SetProperty2;
			if(_loc2_ !== param1)
			{
				this._1935332175_SoundThumbRenderer_SetProperty2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundThumbRenderer_SetProperty2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get arrowGroup() : Group
		{
			return this._1751797770arrowGroup;
		}
		
		public function set arrowGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1751797770arrowGroup;
			if(_loc2_ !== param1)
			{
				this._1751797770arrowGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get bgFill() : SolidColor
		{
			return this._1391998104bgFill;
		}
		
		public function set bgFill(param1:SolidColor) : void
		{
			var _loc2_:Object = this._1391998104bgFill;
			if(_loc2_ !== param1)
			{
				this._1391998104bgFill = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
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
		public function get chromeGroup() : Group
		{
			return this._434221093chromeGroup;
		}
		
		public function set chromeGroup(param1:Group) : void
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
		public function get contentGroup() : VGroup
		{
			return this._809612678contentGroup;
		}
		
		public function set contentGroup(param1:VGroup) : void
		{
			var _loc2_:Object = this._809612678contentGroup;
			if(_loc2_ !== param1)
			{
				this._809612678contentGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
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
		public function get durationDisplay() : Label
		{
			return this._775506802durationDisplay;
		}
		
		public function set durationDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._775506802durationDisplay;
			if(_loc2_ !== param1)
			{
				this._775506802durationDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationDisplay",_loc2_,param1));
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
		public function get labelGroup() : HGroup
		{
			return this._1671708693labelGroup;
		}
		
		public function set labelGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._1671708693labelGroup;
			if(_loc2_ !== param1)
			{
				this._1671708693labelGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get playButton() : IconButton
		{
			return this._1097557894playButton;
		}
		
		public function set playButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._1097557894playButton;
			if(_loc2_ !== param1)
			{
				this._1097557894playButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get upgradeIcon() : UpgradeIcon
		{
			return this._1844912971upgradeIcon;
		}
		
		public function set upgradeIcon(param1:UpgradeIcon) : void
		{
			var _loc2_:Object = this._1844912971upgradeIcon;
			if(_loc2_ !== param1)
			{
				this._1844912971upgradeIcon = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upgradeIcon",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get variationBar() : Group
		{
			return this._1653553920variationBar;
		}
		
		public function set variationBar(param1:Group) : void
		{
			var _loc2_:Object = this._1653553920variationBar;
			if(_loc2_ !== param1)
			{
				this._1653553920variationBar = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"variationBar",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get variationButton() : VariationButton
		{
			return this._2026267867variationButton;
		}
		
		public function set variationButton(param1:VariationButton) : void
		{
			var _loc2_:Object = this._2026267867variationButton;
			if(_loc2_ !== param1)
			{
				this._2026267867variationButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"variationButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get variationList() : SoundVariationList
		{
			return this._279741777variationList;
		}
		
		public function set variationList(param1:SoundVariationList) : void
		{
			var _loc2_:Object = this._279741777variationList;
			if(_loc2_ !== param1)
			{
				this._279741777variationList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"variationList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _dataSource() : SoundThumb
		{
			return this._1934183932_dataSource;
		}
		
		protected function set _dataSource(param1:SoundThumb) : void
		{
			var _loc2_:Object = this._1934183932_dataSource;
			if(_loc2_ !== param1)
			{
				this._1934183932_dataSource = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_dataSource",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _labelText() : String
		{
			return this._2096654142_labelText;
		}
		
		protected function set _labelText(param1:String) : void
		{
			var _loc2_:Object = this._2096654142_labelText;
			if(_loc2_ !== param1)
			{
				this._2096654142_labelText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_labelText",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _durationText() : String
		{
			return this._256018112_durationText;
		}
		
		protected function set _durationText(param1:String) : void
		{
			var _loc2_:Object = this._256018112_durationText;
			if(_loc2_ !== param1)
			{
				this._256018112_durationText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_durationText",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _playing() : Boolean
		{
			return this._1864660719_playing;
		}
		
		protected function set _playing(param1:Boolean) : void
		{
			var _loc2_:Object = this._1864660719_playing;
			if(_loc2_ !== param1)
			{
				this._1864660719_playing = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_playing",_loc2_,param1));
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
		protected function get _previewOnly() : Boolean
		{
			return this._1913409067_previewOnly;
		}
		
		protected function set _previewOnly(param1:Boolean) : void
		{
			var _loc2_:Object = this._1913409067_previewOnly;
			if(_loc2_ !== param1)
			{
				this._1913409067_previewOnly = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_previewOnly",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _upsellNotice() : String
		{
			return this._375930756_upsellNotice;
		}
		
		protected function set _upsellNotice(param1:String) : void
		{
			var _loc2_:Object = this._375930756_upsellNotice;
			if(_loc2_ !== param1)
			{
				this._375930756_upsellNotice = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_upsellNotice",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		protected function get _variationCollection() : SoundCollection
		{
			return this._1158315602_variationCollection;
		}
		
		protected function set _variationCollection(param1:SoundCollection) : void
		{
			var _loc2_:Object = this._1158315602_variationCollection;
			if(_loc2_ !== param1)
			{
				this._1158315602_variationCollection = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_variationCollection",_loc2_,param1));
				}
			}
		}
	}
}
