package anifire.studio.components
{
	import anifire.studio.core.FolderThumb;
	import anifire.studio.models.ThumbModel;
	import anifire.util.UtilDict;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.State;
	import mx.utils.StringUtil;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.events.PopUpEvent;
	import spark.primitives.BitmapImage;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class FolderThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
	{
		
		private static const IMPORTED_DATE_LABEL:String = "Imported: {0}";
		
		private static const DELETE_POPUP_TITLE:String = "Delete folder";
		
		private static const DELETE_POPUP_MESSAGE:String = "Are you sure you want delete this folder and everything inside?\n\nThis action cannot be undone.";
		
		private static const DELETE_POPUP_CONFIRM_TEXT:String = "Delete folder";
		
		private static const DELETE_POPUP_CANCEL_TEXT:String = "Cancel";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _FolderThumbRenderer_Label1:Label;
		
		public var _FolderThumbRenderer_Label2:Label;
		
		public var _FolderThumbRenderer_VGroup1:VGroup;
		
		private var _1781625235buttonGroup:HGroup;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _521758647_folderThumb:FolderThumb;
		
		protected var _2096654142_labelText:String;
		
		protected var _1857499266_importedDateText:String;
		
		protected var _1692934083_editable:Boolean;
		
		private var _embed_mxml__styles_images_tray_icon_folder_png_950756929:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function FolderThumbRenderer()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_tray_icon_folder_png_950756929 = FolderThumbRenderer__embed_mxml__styles_images_tray_icon_folder_png_950756929;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._FolderThumbRenderer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FolderThumbRendererWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return FolderThumbRenderer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.autoDrawBackground = false;
			this.percentWidth = 100;
			this.buttonMode = true;
			this.mxmlContent = [this._FolderThumbRenderer_Rect1_c(),this._FolderThumbRenderer_VGroup1_i(),this._FolderThumbRenderer_Line1_c()];
			this.currentState = "normal";
			var _FolderThumbRenderer_HGroup2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FolderThumbRenderer_HGroup2_i);
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"hovered",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_FolderThumbRenderer_HGroup2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_FolderThumbRenderer_VGroup1"]
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
			FolderThumbRenderer._watcherSetupUtil = param1;
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
			var _loc2_:ThumbModel = data as ThumbModel;
			if(_loc2_)
			{
				this._editable = _loc2_.editable;
				this._folderThumb = _loc2_.thumb as FolderThumb;
				if(this._folderThumb)
				{
					this._labelText = this._folderThumb.name;
					this._importedDateText = StringUtil.substitute(UtilDict.translate(IMPORTED_DATE_LABEL),this._folderThumb.createdDate);
				}
			}
			else
			{
				this._editable = false;
			}
		}
		
		override protected function allowPublish() : Boolean
		{
			return false;
		}
		
		override protected function shouldStartDrag(param1:MouseEvent) : Boolean
		{
			return false;
		}
		
		protected function infoButton_mouseDownHandler(param1:MouseEvent) : void
		{
			param1.stopImmediatePropagation();
			this.showInfoPopUp();
		}
		
		protected function showInfoPopUp() : void
		{
			var _loc1_:EditFolderPopUp = new EditFolderPopUp();
			_loc1_.thumb = this._folderThumb;
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.popUp_closeHandler);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function popUp_closeHandler(param1:PopUpEvent) : void
		{
			if(param1.commit)
			{
				this.updateFolderInfo(param1.data);
			}
		}
		
		protected function updateFolderInfo(param1:Object) : void
		{
			var _loc2_:String = null;
			if(this._folderThumb && param1)
			{
				_loc2_ = param1[EditAssetPopUp.DATA_NAME];
				this._labelText = _loc2_;
				this._folderThumb.updateRemote(_loc2_);
			}
		}
		
		protected function deleteButton_mouseDownHandler(param1:MouseEvent) : void
		{
			param1.stopImmediatePropagation();
			this.showDeletePopUp();
		}
		
		protected function showDeletePopUp() : void
		{
			var _loc1_:ConfirmPopUp = new ConfirmPopUp();
			_loc1_.title = UtilDict.translate(DELETE_POPUP_TITLE);
			_loc1_.message = UtilDict.translate(DELETE_POPUP_MESSAGE);
			_loc1_.confirmText = UtilDict.translate(DELETE_POPUP_CONFIRM_TEXT);
			_loc1_.cancelText = UtilDict.translate(DELETE_POPUP_CANCEL_TEXT);
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.deletePopUp_closeHandler);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function deletePopUp_closeHandler(param1:PopUpEvent) : void
		{
			if(param1.commit)
			{
				this.deleteFolder();
			}
		}
		
		protected function deleteFolder() : void
		{
			if(this._folderThumb)
			{
				this._folderThumb.deleteRemote();
			}
		}
		
		private function _FolderThumbRenderer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._FolderThumbRenderer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15594230;
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = 6;
			_loc1_.paddingLeft = 10;
			_loc1_.paddingRight = 10;
			_loc1_.paddingTop = 10;
			_loc1_.paddingBottom = 10;
			_loc1_.mxmlContent = [this._FolderThumbRenderer_HGroup1_c(),this._FolderThumbRenderer_Label2_i()];
			_loc1_.id = "_FolderThumbRenderer_VGroup1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FolderThumbRenderer_VGroup1 = _loc1_;
			BindingManager.executeBindings(this,"_FolderThumbRenderer_VGroup1",this._FolderThumbRenderer_VGroup1);
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._FolderThumbRenderer_BitmapImage1_c(),this._FolderThumbRenderer_Label1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.width = 15;
			_loc1_.height = 14;
			_loc1_.source = this._embed_mxml__styles_images_tray_icon_folder_png_950756929;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.maxDisplayedLines = 1;
			_loc1_.showTruncationTip = true;
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("fontSize",13);
			_loc1_.setStyle("color",5331305);
			_loc1_.id = "_FolderThumbRenderer_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FolderThumbRenderer_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_FolderThumbRenderer_Label1",this._FolderThumbRenderer_Label1);
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",11);
			_loc1_.setStyle("color",8752789);
			_loc1_.id = "_FolderThumbRenderer_Label2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._FolderThumbRenderer_Label2 = _loc1_;
			BindingManager.executeBindings(this,"_FolderThumbRenderer_Label2",this._FolderThumbRenderer_Label2);
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentHeight = 100;
			_loc1_.right = 0;
			_loc1_.paddingLeft = 4;
			_loc1_.paddingRight = 4;
			_loc1_.gap = 2;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._FolderThumbRenderer_IconButton1_c(),this._FolderThumbRenderer_IconButton2_c()];
			_loc1_.id = "buttonGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.buttonGroup = _loc1_;
			BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_IconButton1_c() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "infoSmall";
			_loc1_.addEventListener("mouseDown",this.___FolderThumbRenderer_IconButton1_mouseDown);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___FolderThumbRenderer_IconButton1_mouseDown(param1:MouseEvent) : void
		{
			this.infoButton_mouseDownHandler(param1);
		}
		
		private function _FolderThumbRenderer_IconButton2_c() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "deleteSmall";
			_loc1_.addEventListener("mouseDown",this.___FolderThumbRenderer_IconButton2_mouseDown);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___FolderThumbRenderer_IconButton2_mouseDown(param1:MouseEvent) : void
		{
			this.deleteButton_mouseDownHandler(param1);
		}
		
		private function _FolderThumbRenderer_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._FolderThumbRenderer_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14870509;
			return _loc1_;
		}
		
		private function _FolderThumbRenderer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = _labelText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FolderThumbRenderer_Label1.text");
			result[1] = new Binding(this,function():String
			{
				var _loc1_:* = _importedDateText;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_FolderThumbRenderer_Label2.text");
			result[2] = new Binding(this,function():Boolean
			{
				return _editable;
			},null,"buttonGroup.visible");
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
		protected function get _folderThumb() : FolderThumb
		{
			return this._521758647_folderThumb;
		}
		
		protected function set _folderThumb(param1:FolderThumb) : void
		{
			var _loc2_:Object = this._521758647_folderThumb;
			if(_loc2_ !== param1)
			{
				this._521758647_folderThumb = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_folderThumb",_loc2_,param1));
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
		protected function get _importedDateText() : String
		{
			return this._1857499266_importedDateText;
		}
		
		protected function set _importedDateText(param1:String) : void
		{
			var _loc2_:Object = this._1857499266_importedDateText;
			if(_loc2_ !== param1)
			{
				this._1857499266_importedDateText = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_importedDateText",_loc2_,param1));
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
	}
}
