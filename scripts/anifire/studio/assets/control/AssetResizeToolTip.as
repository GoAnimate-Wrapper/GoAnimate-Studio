package anifire.studio.assets.control
{
	import mx.binding.BindingManager;
	import mx.controls.Spacer;
	import mx.core.IFlexModuleFactory;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColorStroke;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.filters.GlowFilter;
	import spark.primitives.BitmapImage;
	import spark.primitives.Path;
	
	public class AssetResizeToolTip extends Group
	{
		 
		
		private var _176091291glowFilter:GlowFilter;
		
		private var _1583207835heightDisplay:Label;
		
		private var _738160316iconLock:BitmapImage;
		
		private var _445445859iconUnlock:BitmapImage;
		
		private var _1021596903lockIndication:VGroup;
		
		private var _996907036widthDisplay:Label;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _lock:Boolean = true;
		
		private var _embed_mxml__styles_images_icons_icon_unlock_png_1732766775:Class;
		
		private var _embed_mxml__styles_images_icons_icon_lock_png_638469383:Class;
		
		public function AssetResizeToolTip()
		{
			this._embed_mxml__styles_images_icons_icon_unlock_png_1732766775 = AssetResizeToolTip__embed_mxml__styles_images_icons_icon_unlock_png_1732766775;
			this._embed_mxml__styles_images_icons_icon_lock_png_638469383 = AssetResizeToolTip__embed_mxml__styles_images_icons_icon_lock_png_638469383;
			super();
			mx_internal::_document = this;
			this.width = 50;
			this.height = 30;
			this.mouseChildren = false;
			this.mouseEnabled = false;
			this.filters = [this._AssetResizeToolTip_GlowFilter1_i()];
			this.mxmlContent = [this._AssetResizeToolTip_HGroup1_c()];
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
		
		protected function get lock() : Boolean
		{
			return this._lock;
		}
		
		protected function set lock(param1:Boolean) : void
		{
			if(this._lock != param1)
			{
				this._lock = param1;
				if(this._lock)
				{
					this.iconLock.visible = true;
					this.iconUnlock.visible = false;
				}
				else
				{
					this.iconLock.visible = false;
					this.iconUnlock.visible = true;
				}
			}
		}
		
		public function setSize(param1:Number, param2:Number, param3:Number = -1, param4:Number = -1, param5:Boolean = false, param6:Boolean = true) : void
		{
			this.widthDisplay.text = "W:" + Math.round(param1);
			this.heightDisplay.text = "H:" + Math.round(param2);
			this.widthDisplay.text = this.widthDisplay.text + (param3 != -1 && param3 != Number.POSITIVE_INFINITY?" (" + Math.round(param3 * 100) + "%)":"");
			this.heightDisplay.text = this.heightDisplay.text + (param4 != -1 && param4 != Number.POSITIVE_INFINITY?" (" + Math.round(param4 * 100) + "%)":"");
			this.lock = param6;
			if(this.lockIndication.visible != param5)
			{
				this.lockIndication.visible = param5;
			}
		}
		
		private function _AssetResizeToolTip_GlowFilter1_i() : GlowFilter
		{
			var _loc1_:GlowFilter = new GlowFilter();
			_loc1_.blurX = 2;
			_loc1_.blurY = 2;
			_loc1_.color = 16777215;
			_loc1_.strength = 10;
			this.glowFilter = _loc1_;
			BindingManager.executeBindings(this,"glowFilter",this.glowFilter);
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.gap = 2;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._AssetResizeToolTip_VGroup1_c(),this._AssetResizeToolTip_VGroup2_i(),this._AssetResizeToolTip_Group4_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._AssetResizeToolTip_Label1_i(),this._AssetResizeToolTip_Label2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",0);
			_loc1_.setStyle("fontSize",10);
			_loc1_.id = "widthDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.widthDisplay = _loc1_;
			BindingManager.executeBindings(this,"widthDisplay",this.widthDisplay);
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",0);
			_loc1_.setStyle("fontSize",10);
			_loc1_.id = "heightDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.heightDisplay = _loc1_;
			BindingManager.executeBindings(this,"heightDisplay",this.heightDisplay);
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_VGroup2_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._AssetResizeToolTip_Group2_c(),this._AssetResizeToolTip_Spacer1_c(),this._AssetResizeToolTip_Group3_c()];
			_loc1_.id = "lockIndication";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.lockIndication = _loc1_;
			BindingManager.executeBindings(this,"lockIndication",this.lockIndication);
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._AssetResizeToolTip_Path1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_Path1_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.data = "M 0 0 l 4 0 l 0 3";
			_loc1_.stroke = this._AssetResizeToolTip_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 0;
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_Spacer1_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.height = 6;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_Group3_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._AssetResizeToolTip_Path2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_Path2_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.data = "M 0 3 l 4 0 l 0 -3";
			_loc1_.stroke = this._AssetResizeToolTip_SolidColorStroke2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_SolidColorStroke2_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 0;
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_Group4_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._AssetResizeToolTip_BitmapImage1_i(),this._AssetResizeToolTip_BitmapImage2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_icons_icon_lock_png_638469383;
			_loc1_.initialized(this,"iconLock");
			this.iconLock = _loc1_;
			BindingManager.executeBindings(this,"iconLock",this.iconLock);
			return _loc1_;
		}
		
		private function _AssetResizeToolTip_BitmapImage2_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_icons_icon_unlock_png_1732766775;
			_loc1_.initialized(this,"iconUnlock");
			this.iconUnlock = _loc1_;
			BindingManager.executeBindings(this,"iconUnlock",this.iconUnlock);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get glowFilter() : GlowFilter
		{
			return this._176091291glowFilter;
		}
		
		public function set glowFilter(param1:GlowFilter) : void
		{
			var _loc2_:Object = this._176091291glowFilter;
			if(_loc2_ !== param1)
			{
				this._176091291glowFilter = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"glowFilter",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get heightDisplay() : Label
		{
			return this._1583207835heightDisplay;
		}
		
		public function set heightDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._1583207835heightDisplay;
			if(_loc2_ !== param1)
			{
				this._1583207835heightDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"heightDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get iconLock() : BitmapImage
		{
			return this._738160316iconLock;
		}
		
		public function set iconLock(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._738160316iconLock;
			if(_loc2_ !== param1)
			{
				this._738160316iconLock = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconLock",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get iconUnlock() : BitmapImage
		{
			return this._445445859iconUnlock;
		}
		
		public function set iconUnlock(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._445445859iconUnlock;
			if(_loc2_ !== param1)
			{
				this._445445859iconUnlock = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconUnlock",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get lockIndication() : VGroup
		{
			return this._1021596903lockIndication;
		}
		
		public function set lockIndication(param1:VGroup) : void
		{
			var _loc2_:Object = this._1021596903lockIndication;
			if(_loc2_ !== param1)
			{
				this._1021596903lockIndication = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lockIndication",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get widthDisplay() : Label
		{
			return this._996907036widthDisplay;
		}
		
		public function set widthDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._996907036widthDisplay;
			if(_loc2_ !== param1)
			{
				this._996907036widthDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widthDisplay",_loc2_,param1));
				}
			}
		}
	}
}
