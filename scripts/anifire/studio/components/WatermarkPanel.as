package anifire.studio.components
{
	import anifire.constant.ServerConstants;
	import anifire.managers.ExternalLinkManager;
	import anifire.studio.core.Console;
	import anifire.studio.managers.WatermarkManager;
	import anifire.studio.skins.WatermarkListSkin;
	import anifire.studio.skins.WatermarkListSkinCol2;
	import anifire.util.UtilDict;
	import flash.utils.getDefinitionByName;
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.events.FlowElementMouseEvent;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColorStroke;
	import spark.components.FormHeading;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.List;
	import spark.components.RichEditableText;
	import spark.components.Scroller;
	import spark.components.VGroup;
	import spark.events.IndexChangeEvent;
	import spark.primitives.BitmapImage;
	import spark.primitives.Line;
	
	use namespace mx_internal;
	
	public class WatermarkPanel extends Group implements IBindingClient
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _WatermarkPanel_FormHeading1:FormHeading;
		
		private var _1279270963helpLabel:RichEditableText;
		
		private var _673098064watermarkList2:List;
		
		private var _673098065watermarkList3:List;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var watermarkList:List;
		
		private var _embed_mxml__styles_images_watermark_watermark_illustration_png_115924809:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function WatermarkPanel()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_watermark_watermark_illustration_png_115924809 = WatermarkPanel__embed_mxml__styles_images_watermark_watermark_illustration_png_115924809;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._WatermarkPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WatermarkPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return WatermarkPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._WatermarkPanel_HGroup1_c()];
			this.addEventListener("creationComplete",this.___WatermarkPanel_Group1_creationComplete);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			WatermarkPanel._watcherSetupUtil = param1;
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
		
		protected function init() : void
		{
			var _loc9_:SpanElement = null;
			if(ServerConstants.IS_WIX)
			{
				this.watermarkList = this.watermarkList2;
				this.watermarkList3.visible = false;
			}
			else
			{
				this.watermarkList = this.watermarkList3;
				this.watermarkList2.visible = false;
			}
			var _loc1_:WatermarkManager = Console.getConsole().watermarkManager;
			this.watermarkList.dataProvider = new ArrayCollection(_loc1_.watermarks);
			this.watermarkList.selectedItem = _loc1_.currentWatermark;
			var _loc2_:TextFlow = new TextFlow();
			var _loc3_:String = UtilDict.toDisplay("go","If you want to use a brand new logo, visit your {0} to upload a new one. It usually becomes available within 24 hours");
			var _loc4_:Array = _loc3_.split("{0}");
			var _loc5_:ParagraphElement = new ParagraphElement();
			var _loc6_:SpanElement = new SpanElement();
			_loc6_.text = _loc4_[0];
			_loc5_.addChild(_loc6_);
			var _loc7_:LinkElement = new LinkElement();
			var _loc8_:SpanElement = new SpanElement();
			_loc8_.text = UtilDict.toDisplay("go","account settings");
			_loc8_.fontWeight = "bold";
			_loc8_.color = 4439205;
			_loc8_.textDecoration = "none";
			_loc7_.addChild(_loc8_);
			_loc7_.addEventListener(FlowElementMouseEvent.CLICK,this.onLinkClick);
			_loc5_.addChild(_loc7_);
			if(_loc4_.length > 1)
			{
				_loc9_ = new SpanElement();
				_loc9_.text = _loc4_[1];
				_loc5_.addChild(_loc9_);
			}
			_loc2_.addChild(_loc5_);
			this.helpLabel.textFlow = _loc2_;
		}
		
		protected function onWatermarkChange(param1:IndexChangeEvent) : void
		{
			Console.getConsole().watermarkManager.currentWatermark = this.watermarkList.selectedItem;
			Console.getConsole().watermarkManager.saveWatermark(Console.getConsole().metaData.movieId);
		}
		
		protected function onLinkClick(param1:FlowElementMouseEvent) : void
		{
			var _loc2_:String = "/account/logo";
			ExternalLinkManager.instance.navigateWithSession(_loc2_,ExternalLinkManager.BLANK_WINDOW_ID);
		}
		
		private function _WatermarkPanel_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 20;
			_loc1_.paddingTop = 20;
			_loc1_.paddingBottom = 20;
			_loc1_.paddingLeft = 20;
			_loc1_.paddingRight = 20;
			_loc1_.mxmlContent = [this._WatermarkPanel_Scroller1_c(),this._WatermarkPanel_Line1_c(),this._WatermarkPanel_VGroup2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WatermarkPanel_Scroller1_c() : Scroller
		{
			var _loc1_:Scroller = new Scroller();
			_loc1_.height = 300;
			_loc1_.percentWidth = 100;
			_loc1_.viewport = this._WatermarkPanel_VGroup1_c();
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WatermarkPanel_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 10;
			_loc1_.mxmlContent = [this._WatermarkPanel_FormHeading1_i(),this._WatermarkPanel_Group2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WatermarkPanel_FormHeading1_i() : FormHeading
		{
			var _loc1_:FormHeading = new FormHeading();
			_loc1_.percentWidth = 100;
			_loc1_.id = "_WatermarkPanel_FormHeading1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._WatermarkPanel_FormHeading1 = _loc1_;
			BindingManager.executeBindings(this,"_WatermarkPanel_FormHeading1",this._WatermarkPanel_FormHeading1);
			return _loc1_;
		}
		
		private function _WatermarkPanel_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._WatermarkPanel_List1_i(),this._WatermarkPanel_List2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WatermarkPanel_List1_i() : List
		{
			var _loc1_:List = new List();
			_loc1_.percentHeight = 100;
			_loc1_.requireSelection = true;
			_loc1_.setStyle("skinClass",WatermarkListSkin);
			_loc1_.addEventListener("change",this.__watermarkList3_change);
			_loc1_.id = "watermarkList3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.watermarkList3 = _loc1_;
			BindingManager.executeBindings(this,"watermarkList3",this.watermarkList3);
			return _loc1_;
		}
		
		public function __watermarkList3_change(param1:IndexChangeEvent) : void
		{
			this.onWatermarkChange(param1);
		}
		
		private function _WatermarkPanel_List2_i() : List
		{
			var _loc1_:List = new List();
			_loc1_.percentHeight = 100;
			_loc1_.requireSelection = true;
			_loc1_.setStyle("skinClass",WatermarkListSkinCol2);
			_loc1_.addEventListener("change",this.__watermarkList2_change);
			_loc1_.id = "watermarkList2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.watermarkList2 = _loc1_;
			BindingManager.executeBindings(this,"watermarkList2",this.watermarkList2);
			return _loc1_;
		}
		
		public function __watermarkList2_change(param1:IndexChangeEvent) : void
		{
			this.onWatermarkChange(param1);
		}
		
		private function _WatermarkPanel_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentHeight = 100;
			_loc1_.stroke = this._WatermarkPanel_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _WatermarkPanel_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14738923;
			return _loc1_;
		}
		
		private function _WatermarkPanel_VGroup2_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.width = 211;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 20;
			_loc1_.horizontalAlign = "center";
			_loc1_.mxmlContent = [this._WatermarkPanel_RichEditableText1_i(),this._WatermarkPanel_BitmapImage1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WatermarkPanel_RichEditableText1_i() : RichEditableText
		{
			var _loc1_:RichEditableText = new RichEditableText();
			_loc1_.percentWidth = 100;
			_loc1_.multiline = true;
			_loc1_.editable = false;
			_loc1_.focusEnabled = false;
			_loc1_.selectable = false;
			_loc1_.id = "helpLabel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.helpLabel = _loc1_;
			BindingManager.executeBindings(this,"helpLabel",this.helpLabel);
			return _loc1_;
		}
		
		private function _WatermarkPanel_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_watermark_watermark_illustration_png_115924809;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		public function ___WatermarkPanel_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _WatermarkPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Select Logo");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_WatermarkPanel_FormHeading1.label");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get helpLabel() : RichEditableText
		{
			return this._1279270963helpLabel;
		}
		
		public function set helpLabel(param1:RichEditableText) : void
		{
			var _loc2_:Object = this._1279270963helpLabel;
			if(_loc2_ !== param1)
			{
				this._1279270963helpLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get watermarkList2() : List
		{
			return this._673098064watermarkList2;
		}
		
		public function set watermarkList2(param1:List) : void
		{
			var _loc2_:Object = this._673098064watermarkList2;
			if(_loc2_ !== param1)
			{
				this._673098064watermarkList2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkList2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get watermarkList3() : List
		{
			return this._673098065watermarkList3;
		}
		
		public function set watermarkList3(param1:List) : void
		{
			var _loc2_:Object = this._673098065watermarkList3;
			if(_loc2_ !== param1)
			{
				this._673098065watermarkList3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkList3",_loc2_,param1));
				}
			}
		}
	}
}
