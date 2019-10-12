package anifire.studio.components
{
   import anifire.studio.skins.RangeSelectorSkin;
   import flash.events.Event;
   import mx.core.FlexVersion;
   import mx.core.IVisualElement;
   import spark.components.HSlider;
   import spark.components.Label;
   import spark.components.supportClasses.Range;
   import spark.events.TrackBaseEvent;
   
   public class RangeSelector extends Range
   {
       
      
      [SkinPart(required="true")]
      public var startSlider:HSlider;
      
      [SkinPart(required="true")]
      public var endSlider:HSlider;
      
      [SkinPart(required="false")]
      public var labelDisplay:Label;
      
      protected var _startValue:Number = 0;
      
      protected var _endValue:Number = 0;
      
      public function RangeSelector()
      {
         super();
         setStyle("skinClass",RangeSelectorSkin);
      }
      
      override public function get baselinePosition() : Number
      {
         if(FlexVersion.compatibilityVersion < FlexVersion.VERSION_4_5)
         {
            return super.baselinePosition;
         }
         var _loc1_:IVisualElement = this.labelDisplay;
         if(_loc1_)
         {
            return _loc1_.baselinePosition + _loc1_.y;
         }
         return super.baselinePosition;
      }
      
      override public function set minimum(param1:Number) : void
      {
         var _loc2_:Number = this.startValue;
         super.minimum = param1;
         if(this.startSlider)
         {
            this.startSlider.minimum = minimum;
            this.startSlider.value = this.startValue;
         }
         if(this.endSlider)
         {
            this.endSlider.minimum = minimum;
            this.endSlider.value = this.endValue;
         }
         if(this.startValue < minimum)
         {
            this.startValue = minimum;
         }
         if(skin)
         {
            skin.invalidateDisplayList();
         }
      }
      
      override public function set maximum(param1:Number) : void
      {
         var _loc2_:Number = this.endValue;
         super.maximum = param1;
         if(this.startSlider)
         {
            this.startSlider.maximum = maximum;
            this.startSlider.value = this.startValue;
         }
         if(this.endSlider)
         {
            this.endSlider.maximum = maximum;
            this.endSlider.value = this.endValue;
         }
         if(this.endValue > maximum)
         {
            this.endValue = maximum;
         }
         if(skin)
         {
            skin.invalidateDisplayList();
         }
      }
      
      override public function set snapInterval(param1:Number) : void
      {
         super.snapInterval = param1;
         if(this.startSlider)
         {
            this.startSlider.snapInterval = snapInterval;
         }
         if(this.endSlider)
         {
            this.endSlider.snapInterval = snapInterval;
         }
      }
      
      public function get startValue() : Number
      {
         return this._startValue;
      }
      
      public function set startValue(param1:Number) : void
      {
         if(this._startValue == param1)
         {
            return;
         }
         if(!isNaN(maximum) && !isNaN(minimum) && maximum > minimum)
         {
            this._startValue = Math.min(maximum,Math.max(minimum,param1));
         }
         else
         {
            this._startValue = param1;
         }
         if(this.startSlider)
         {
            this.startSlider.value = this._startValue;
            skin.invalidateDisplayList();
         }
      }
      
      public function get endValue() : Number
      {
         return this._endValue;
      }
      
      public function set endValue(param1:Number) : void
      {
         if(this._endValue == param1)
         {
            return;
         }
         if(!isNaN(maximum) && !isNaN(minimum) && maximum > minimum)
         {
            this._endValue = Math.min(maximum,Math.max(minimum,param1));
         }
         else
         {
            this._endValue = param1;
         }
         if(this.endSlider)
         {
            this.endSlider.value = this._endValue;
            skin.invalidateDisplayList();
         }
      }
      
      private function startSliderUpdateHandler(param1:Event) : void
      {
         this.startValue = this.startSlider.value;
         if(this.startValue > this.endValue)
         {
            this.endValue = this.startValue;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function endSliderUpdateHandler(param1:Event) : void
      {
         this.endValue = this.endSlider.value;
         if(this.endValue < this.startValue)
         {
            this.startValue = this.endValue;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      override protected function getCurrentSkinState() : String
      {
         return super.getCurrentSkinState();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.startSlider)
         {
            this.startSlider.addEventListener(Event.CHANGE,this.startSliderUpdateHandler);
            this.startSlider.addEventListener(TrackBaseEvent.THUMB_PRESS,this.onStartSliderThumbPress);
            this.startSlider.addEventListener(TrackBaseEvent.THUMB_RELEASE,this.onStartSliderThumbRelease);
            this.startSlider.minimum = minimum;
            this.startSlider.maximum = maximum;
            this.startSlider.snapInterval = snapInterval;
         }
         else if(param2 == this.endSlider)
         {
            this.endSlider.addEventListener(Event.CHANGE,this.endSliderUpdateHandler);
            this.endSlider.addEventListener(TrackBaseEvent.THUMB_PRESS,this.onEndSliderThumbPress);
            this.endSlider.addEventListener(TrackBaseEvent.THUMB_RELEASE,this.onEndSliderThumbRelease);
            this.endSlider.minimum = minimum;
            this.endSlider.maximum = maximum;
            this.endSlider.snapInterval = snapInterval;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.startSlider)
         {
            this.startSlider.removeEventListener(Event.CHANGE,this.startSliderUpdateHandler);
            this.startSlider.removeEventListener(TrackBaseEvent.THUMB_PRESS,this.onStartSliderThumbPress);
            this.startSlider.removeEventListener(TrackBaseEvent.THUMB_RELEASE,this.onStartSliderThumbRelease);
         }
         else if(param2 == this.endSlider)
         {
            this.endSlider.removeEventListener(Event.CHANGE,this.endSliderUpdateHandler);
            this.endSlider.removeEventListener(TrackBaseEvent.THUMB_PRESS,this.onEndSliderThumbPress);
            this.endSlider.removeEventListener(TrackBaseEvent.THUMB_RELEASE,this.onEndSliderThumbRelease);
         }
      }
      
      private function onStartSliderThumbPress(param1:TrackBaseEvent) : void
      {
         this.dispatchEvent(new Event("startThumbPress"));
      }
      
      private function onStartSliderThumbRelease(param1:TrackBaseEvent) : void
      {
         this.dispatchEvent(new Event("startThumbRelease"));
      }
      
      private function onEndSliderThumbPress(param1:TrackBaseEvent) : void
      {
         this.dispatchEvent(new Event("endThumbPress"));
      }
      
      private function onEndSliderThumbRelease(param1:TrackBaseEvent) : void
      {
         this.dispatchEvent(new Event("endThumbRelease"));
      }
   }
}
