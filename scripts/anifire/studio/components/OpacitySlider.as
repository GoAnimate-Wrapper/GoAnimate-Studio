package anifire.studio.components
{
	import anifire.studio.skins.OpacitySliderSkin;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import mx.events.PropertyChangeEvent;
	import spark.components.HSlider;
	import spark.components.supportClasses.SkinnableTextBase;
	
	public class OpacitySlider extends HSlider
	{
		
		private static var _1130117411PERCENTAGE_SYMBOL:String = "%";
		
		private static var _staticBindingEventDispatcher:EventDispatcher = new EventDispatcher();
		 
		
		[SkinPart(required="false")]
		public var labelDisplay:SkinnableTextBase;
		
		private var _baseColor:uint;
		
		public function OpacitySlider()
		{
			super();
			setStyle("skinClass",OpacitySliderSkin);
		}
		
		[Bindable(event="propertyChange")]
		public static function get PERCENTAGE_SYMBOL() : String
		{
			return OpacitySlider._1130117411PERCENTAGE_SYMBOL;
		}
		
		public static function set PERCENTAGE_SYMBOL(param1:String) : void
		{
			var _loc3_:IEventDispatcher = null;
			var _loc2_:Object = OpacitySlider._1130117411PERCENTAGE_SYMBOL;
			if(_loc2_ !== param1)
			{
				OpacitySlider._1130117411PERCENTAGE_SYMBOL = param1;
				_loc3_ = OpacitySlider.staticEventDispatcher;
				if(_loc3_ !== null)
				{
					_loc3_.dispatchEvent(PropertyChangeEvent.createUpdateEvent(OpacitySlider,"PERCENTAGE_SYMBOL",_loc2_,param1));
				}
			}
		}
		
		public static function get staticEventDispatcher() : IEventDispatcher
		{
			return _staticBindingEventDispatcher;
		}
		
		[Bindable(event="propertyChange")]
		public function get baseColor() : uint
		{
			return this._baseColor;
		}
		
		private function set _1842425070baseColor(param1:uint) : void
		{
			if(this._baseColor != param1)
			{
				this._baseColor = param1;
			}
		}
		
		private function labelDisplay_textInputHandler(param1:Event) : void
		{
			var _loc2_:String = this.labelDisplay.text.replace(PERCENTAGE_SYMBOL,"");
			var _loc3_:Number = Number(_loc2_);
			if(_loc3_ < 0)
			{
				_loc3_ = 0;
			}
			else if(_loc3_ > 100)
			{
				_loc3_ = 100;
			}
			if(this.value != _loc3_)
			{
				this.value = _loc3_;
				this.dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		override protected function partAdded(param1:String, param2:Object) : void
		{
			super.partAdded(param1,param2);
			if(param2 == this.labelDisplay)
			{
				this.labelDisplay.addEventListener(Event.CHANGE,this.labelDisplay_textInputHandler);
			}
		}
		
		override protected function partRemoved(param1:String, param2:Object) : void
		{
			super.partRemoved(param1,param2);
			if(param2 == this.labelDisplay)
			{
				this.labelDisplay.removeEventListener(Event.CHANGE,this.labelDisplay_textInputHandler);
			}
		}
		
		public function set baseColor(param1:uint) : void
		{
			var _loc2_:Object = this.baseColor;
			if(_loc2_ !== param1)
			{
				this._1842425070baseColor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseColor",_loc2_,param1));
				}
			}
		}
	}
}
