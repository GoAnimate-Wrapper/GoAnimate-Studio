package anifire.studio.components
{
	import anifire.studio.core.Console;
	import anifire.studio.events.MenuItemEvent;
	import anifire.studio.models.MenuItemModel;
	import anifire.util.UtilDict;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.binding.BindingManager;
	import mx.collections.ArrayCollection;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.VGroup;
	import spark.primitives.BitmapImage;
	import spark.primitives.Line;
	
	public class TimelineToolBar extends VGroup implements IStateClient2
	{
		
		private static const imgCollapse:Class = TimelineToolBar_imgCollapse;
		
		private static const imgExpand:Class = TimelineToolBar_imgExpand;
		
		private static const imgWaveform:Class = TimelineToolBar_imgWaveform;
		
		private static const imgInfo:Class = TimelineToolBar_imgInfo;
		 
		
		public var _TimelineToolBar_Group3:Group;
		
		public var _TimelineToolBar_Group4:Group;
		
		public var _TimelineToolBar_Group5:Group;
		
		private var _949550860menuAnchor:PopUpAnchor;
		
		private var _913939087menuButton:IconButton;
		
		private var _604015971menuList:ArrowTipMenuItemList;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var waveformMenuItem:MenuItemModel;
		
		protected var collapseMenuItem:MenuItemModel;
		
		private var _embed_mxml__styles_images_timeline_timeline_movie_png_837878007:Class;
		
		private var _embed_mxml__styles_images_timeline_timeline_music_png_1052862679:Class;
		
		private var _embed_mxml__styles_images_timeline_timeline_settingicon_png_262732009:Class;
		
		private var _embed_mxml__styles_images_timeline_timeline_speech_png_1569168037:Class;
		
		public function TimelineToolBar()
		{
			this._embed_mxml__styles_images_timeline_timeline_movie_png_837878007 = TimelineToolBar__embed_mxml__styles_images_timeline_timeline_movie_png_837878007;
			this._embed_mxml__styles_images_timeline_timeline_music_png_1052862679 = TimelineToolBar__embed_mxml__styles_images_timeline_timeline_music_png_1052862679;
			this._embed_mxml__styles_images_timeline_timeline_settingicon_png_262732009 = TimelineToolBar__embed_mxml__styles_images_timeline_timeline_settingicon_png_262732009;
			this._embed_mxml__styles_images_timeline_timeline_speech_png_1569168037 = TimelineToolBar__embed_mxml__styles_images_timeline_timeline_speech_png_1569168037;
			super();
			mx_internal::_document = this;
			this.gap = 0;
			this.mxmlContent = [this._TimelineToolBar_Group1_c(),this._TimelineToolBar_Group3_i()];
			this.currentState = "normal";
			this.addEventListener("creationComplete",this.___TimelineToolBar_VGroup1_creationComplete);
			var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TimelineToolBar_Group4_i);
			var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TimelineToolBar_Group5_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc2_,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_TimelineToolBar_Group3"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_loc1_,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_TimelineToolBar_Group3"]
				})]
			}),new State({
				"name":"collapsed",
				"overrides":[]
			})];
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
		
		public function expand() : void
		{
			currentState = "normal";
		}
		
		public function collapse() : void
		{
			currentState = "collapsed";
		}
		
		protected function createMenuModel() : void
		{
			this.waveformMenuItem = new MenuItemModel("","waveform");
			this.collapseMenuItem = new MenuItemModel("","collapse");
			this.menuList.dataProvider = new ArrayCollection([this.waveformMenuItem,this.collapseMenuItem]);
		}
		
		protected function onMenuButtonClick() : void
		{
			if(currentState == "normal")
			{
				this.collapseMenuItem.label = UtilDict.toDisplay("go","Collapse timeline");
				this.collapseMenuItem.icon = imgCollapse;
			}
			else
			{
				this.collapseMenuItem.label = UtilDict.toDisplay("go","Expand timeline");
				this.collapseMenuItem.icon = imgExpand;
			}
			if(Console.getConsole().timeline.showWaveform)
			{
				this.waveformMenuItem.label = UtilDict.toDisplay("go","Show audio info");
				this.waveformMenuItem.icon = imgInfo;
			}
			else
			{
				this.waveformMenuItem.label = UtilDict.toDisplay("go","Show waveform");
				this.waveformMenuItem.icon = imgWaveform;
			}
			this.menuAnchor.displayPopUp = true;
		}
		
		protected function onMenuItemClick(param1:MenuItemEvent) : void
		{
			var _loc2_:MenuItemModel = param1.item;
			if(_loc2_ == this.waveformMenuItem)
			{
				dispatchEvent(new Event("timelineToggleWaveform"));
			}
			else if(_loc2_ == this.collapseMenuItem)
			{
				dispatchEvent(new Event("timelineToggleExpand"));
			}
		}
		
		private function _TimelineToolBar_Group1_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.height = 39;
			_loc1_.mxmlContent = [this._TimelineToolBar_Line1_c(),this._TimelineToolBar_Group2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TimelineToolBar_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.right = 0;
			_loc1_.bottom = 0;
			_loc1_.height = 15;
			_loc1_.stroke = this._TimelineToolBar_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TimelineToolBar_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 13355733;
			return _loc1_;
		}
		
		private function _TimelineToolBar_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 30;
			_loc1_.percentHeight = 100;
			_loc1_.horizontalCenter = 0;
			_loc1_.mxmlContent = [this._TimelineToolBar_IconButton1_i(),this._TimelineToolBar_PopUpAnchor1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _TimelineToolBar_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_timeline_timeline_settingicon_png_262732009);
			_loc1_.addEventListener("click",this.__menuButton_click);
			_loc1_.id = "menuButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.menuButton = _loc1_;
			BindingManager.executeBindings(this,"menuButton",this.menuButton);
			return _loc1_;
		}
		
		public function __menuButton_click(param1:MouseEvent) : void
		{
			this.onMenuButtonClick();
		}
		
		private function _TimelineToolBar_PopUpAnchor1_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.left = -10;
			_loc1_.right = 0;
			_loc1_.bottom = 10;
			_loc1_.popUpPosition = "below";
			_loc1_.displayPopUp = false;
			_loc1_.popUp = this._TimelineToolBar_ArrowTipMenuItemList1_i();
			_loc1_.id = "menuAnchor";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.menuAnchor = _loc1_;
			BindingManager.executeBindings(this,"menuAnchor",this.menuAnchor);
			return _loc1_;
		}
		
		private function _TimelineToolBar_ArrowTipMenuItemList1_i() : ArrowTipMenuItemList
		{
			var _loc1_:ArrowTipMenuItemList = new ArrowTipMenuItemList();
			_loc1_.tipPosition = "below";
			_loc1_.targetWidth = 20;
			_loc1_.offset = 26;
			_loc1_.addEventListener("itemClick",this.__menuList_itemClick);
			_loc1_.id = "menuList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.menuList = _loc1_;
			BindingManager.executeBindings(this,"menuList",this.menuList);
			return _loc1_;
		}
		
		public function __menuList_itemClick(param1:MenuItemEvent) : void
		{
			this.onMenuItemClick(param1);
		}
		
		private function _TimelineToolBar_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.height = 52;
			_loc1_.mxmlContent = [this._TimelineToolBar_BitmapImage1_c()];
			_loc1_.id = "_TimelineToolBar_Group3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TimelineToolBar_Group3 = _loc1_;
			BindingManager.executeBindings(this,"_TimelineToolBar_Group3",this._TimelineToolBar_Group3);
			return _loc1_;
		}
		
		private function _TimelineToolBar_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_timeline_timeline_movie_png_837878007;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TimelineToolBar_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.height = 40;
			_loc1_.mxmlContent = [this._TimelineToolBar_Line2_c(),this._TimelineToolBar_BitmapImage2_c()];
			_loc1_.id = "_TimelineToolBar_Group4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TimelineToolBar_Group4 = _loc1_;
			BindingManager.executeBindings(this,"_TimelineToolBar_Group4",this._TimelineToolBar_Group4);
			return _loc1_;
		}
		
		private function _TimelineToolBar_Line2_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.top = 0;
			_loc1_.stroke = this._TimelineToolBar_SolidColorStroke2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TimelineToolBar_SolidColorStroke2_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _TimelineToolBar_BitmapImage2_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_timeline_timeline_speech_png_1569168037;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TimelineToolBar_Group5_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.height = 60;
			_loc1_.mxmlContent = [this._TimelineToolBar_Line3_c(),this._TimelineToolBar_BitmapImage3_c(),this._TimelineToolBar_Line4_c()];
			_loc1_.id = "_TimelineToolBar_Group5";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TimelineToolBar_Group5 = _loc1_;
			BindingManager.executeBindings(this,"_TimelineToolBar_Group5",this._TimelineToolBar_Group5);
			return _loc1_;
		}
		
		private function _TimelineToolBar_Line3_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.top = 0;
			_loc1_.stroke = this._TimelineToolBar_SolidColorStroke3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TimelineToolBar_SolidColorStroke3_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _TimelineToolBar_BitmapImage3_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_timeline_timeline_music_png_1052862679;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TimelineToolBar_Line4_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._TimelineToolBar_SolidColorStroke4_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TimelineToolBar_SolidColorStroke4_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		public function ___TimelineToolBar_VGroup1_creationComplete(param1:FlexEvent) : void
		{
			this.createMenuModel();
		}
		
		[Bindable(event="propertyChange")]
		public function get menuAnchor() : PopUpAnchor
		{
			return this._949550860menuAnchor;
		}
		
		public function set menuAnchor(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._949550860menuAnchor;
			if(_loc2_ !== param1)
			{
				this._949550860menuAnchor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuAnchor",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get menuButton() : IconButton
		{
			return this._913939087menuButton;
		}
		
		public function set menuButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._913939087menuButton;
			if(_loc2_ !== param1)
			{
				this._913939087menuButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get menuList() : ArrowTipMenuItemList
		{
			return this._604015971menuList;
		}
		
		public function set menuList(param1:ArrowTipMenuItemList) : void
		{
			var _loc2_:Object = this._604015971menuList;
			if(_loc2_ !== param1)
			{
				this._604015971menuList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuList",_loc2_,param1));
				}
			}
		}
	}
}
