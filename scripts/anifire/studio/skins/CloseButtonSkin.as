package anifire.studio.skins
{
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.primitives.BitmapImage;
	import spark.skins.SparkButtonSkin;
	
	public class CloseButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		
		private static const exclusions:Array = ["labelDisplay"];
		 
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var cornerRadius:Number = 2;
		
		private var _embed_mxml__styles_images_timeline_timeline_tooltip_close_png_1688046887:Class;
		
		public function CloseButtonSkin()
		{
			this._embed_mxml__styles_images_timeline_timeline_tooltip_close_png_1688046887 = CloseButtonSkin__embed_mxml__styles_images_timeline_timeline_tooltip_close_png_1688046887;
			super();
			mx_internal::_document = this;
			this.minWidth = 5;
			this.minHeight = 5;
			this.mxmlContent = [this._CloseButtonSkin_BitmapImage1_c()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"overrides":[]
			}),new State({
				"name":"down",
				"overrides":[]
			}),new State({
				"name":"disabled",
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				})]
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
		
		override public function get colorizeExclusions() : Array
		{
			return exclusions;
		}
		
		override protected function initializationComplete() : void
		{
			useChromeColor = true;
			super.initializationComplete();
		}
		
		override protected function updateDisplayList(param1:Number, param2:Number) : void
		{
			var _loc3_:Number = getStyle("cornerRadius");
			if(this.cornerRadius != _loc3_)
			{
				this.cornerRadius = _loc3_;
			}
			super.updateDisplayList(param1,param2);
		}
		
		private function _CloseButtonSkin_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_timeline_timeline_tooltip_close_png_1688046887;
			_loc1_.smooth = true;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
	}
}
