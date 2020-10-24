package anifire.studio.components
{
	import anifire.studio.core.PropThumb;
	import anifire.studio.models.ThumbModel;
	import anifire.util.UtilUser;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColorStroke;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class FlowFrameImageDisplay extends ThumbRendererBase implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _FlowFrameImageDisplay_BitmapImage1:BitmapImage;
		
		private var _1355548087_FlowFrameImageDisplay_SolidColorStroke1:SolidColorStroke;
		
		private var _2024940825imageDisplay:ProductThumbSparkImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _model:ThumbModel;
		
		protected var _dataSource:PropThumb;
		
		private var _882192095_showImage:Boolean;
		
		private var _embed_mxml__styles_images_tray_button_flow_frame_remove_image_png_1890237759:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function FlowFrameImageDisplay()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_tray_button_flow_frame_remove_image_png_1890237759 = FlowFrameImageDisplay__embed_mxml__styles_images_tray_button_flow_frame_remove_image_png_1890237759;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._FlowFrameImageDisplay_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FlowFrameImageDisplayWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return FlowFrameImageDisplay[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 60;
			this.height = 60;
			this.buttonMode = true;
			this.mxmlContent = [this._FlowFrameImageDisplay_ProductThumbSparkImage1_i(),this._FlowFrameImageDisplay_BitmapImage1_i(),this._FlowFrameImageDisplay_Rect1_c()];
			this.currentState = "normal";
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"hovered",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_FlowFrameImageDisplay_SolidColorStroke1",
					"name":"color",
					"value":5093288
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
			FlowFrameImageDisplay._watcherSetupUtil = param1;
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
				this._dataSource = this._model.thumb as PropThumb;
			}
			else
			{
				this._dataSource = null;
			}
			this._showImage = this._dataSource != null;
			if(this._dataSource)
			{
				this.updateThumbData();
			}
			this.imageDisplay.model = this._model;
		}
		
		protected function updateThumbData() : void
		{
			if(UtilUser.hasAdminFeatures)
			{
				_toolTipContent = this._dataSource.toString();
			}
			else
			{
				_toolTipContent = this._dataSource.name;
			}
		}
		
		override protected function shouldStartDrag(param1:MouseEvent) : Boolean
		{
			return false;
		}
		
		override public function get baselinePosition() : Number
		{
			return 30;
		}
		
		private function _FlowFrameImageDisplay_ProductThumbSparkImage1_i() : ProductThumbSparkImage
		{
			var _loc1_:ProductThumbSparkImage = new ProductThumbSparkImage();
			_loc1_.left = 5;
			_loc1_.right = 5;
			_loc1_.top = 5;
			_loc1_.bottom = 5;
			_loc1_.id = "imageDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.imageDisplay = _loc1_;
			BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
			return _loc1_;
		}
		
		private function _FlowFrameImageDisplay_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_tray_button_flow_frame_remove_image_png_1890237759;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.smooth = true;
			_loc1_.initialized(this,"_FlowFrameImageDisplay_BitmapImage1");
			this._FlowFrameImageDisplay_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_FlowFrameImageDisplay_BitmapImage1",this._FlowFrameImageDisplay_BitmapImage1);
			return _loc1_;
		}
		
		private function _FlowFrameImageDisplay_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._FlowFrameImageDisplay_SolidColorStroke1_i();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _FlowFrameImageDisplay_SolidColorStroke1_i() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14672866;
			this._FlowFrameImageDisplay_SolidColorStroke1 = _loc1_;
			BindingManager.executeBindings(this,"_FlowFrameImageDisplay_SolidColorStroke1",this._FlowFrameImageDisplay_SolidColorStroke1);
			return _loc1_;
		}
		
		private function _FlowFrameImageDisplay_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Boolean
			{
				return _showImage;
			},null,"imageDisplay.visible");
			result[1] = new Binding(this,function():Boolean
			{
				return _showImage;
			},null,"imageDisplay.includeInLayout");
			result[2] = new Binding(this,function():Boolean
			{
				return !_showImage;
			},null,"_FlowFrameImageDisplay_BitmapImage1.visible");
			result[3] = new Binding(this,function():Boolean
			{
				return !_showImage;
			},null,"_FlowFrameImageDisplay_BitmapImage1.includeInLayout");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _FlowFrameImageDisplay_SolidColorStroke1() : SolidColorStroke
		{
			return this._1355548087_FlowFrameImageDisplay_SolidColorStroke1;
		}
		
		public function set _FlowFrameImageDisplay_SolidColorStroke1(param1:SolidColorStroke) : void
		{
			var _loc2_:Object = this._1355548087_FlowFrameImageDisplay_SolidColorStroke1;
			if(_loc2_ !== param1)
			{
				this._1355548087_FlowFrameImageDisplay_SolidColorStroke1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FlowFrameImageDisplay_SolidColorStroke1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get imageDisplay() : ProductThumbSparkImage
		{
			return this._2024940825imageDisplay;
		}
		
		public function set imageDisplay(param1:ProductThumbSparkImage) : void
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
		private function get _showImage() : Boolean
		{
			return this._882192095_showImage;
		}
		
		private function set _showImage(param1:Boolean) : void
		{
			var _loc2_:Object = this._882192095_showImage;
			if(_loc2_ !== param1)
			{
				this._882192095_showImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showImage",_loc2_,param1));
				}
			}
		}
	}
}
