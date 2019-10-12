package com.jumpeye.flashEff2.text.bubbles
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.filters.BlurFilter;
   
   public class FETBubbles extends IFlashEffText
   {
       
      
      private var _speedBlurAmount:Number = 2;
      
      private var presetObject:Object;
      
      private var _sinusSize:Number = 6;
      
      private var _maxBlurX:Number = 20;
      
      private var _maxBlurY:Number = 20;
      
      private var transitionType:String;
      
      private var _groupDuration:Number = 1;
      
      private var maxItems:Number;
      
      private var _numberOfSinusoids:Number = 3;
      
      private var _distance:Number = 50;
      
      private var _blurQuality:Number = 2;
      
      private var _alphaPercentage:Number = 32;
      
      private var tweensFinished:Number = 0;
      
      private var _preset:Number = 9;
      
      private var endEvent:Boolean = false;
      
      public function FETBubbles(param1:JUIComponent = null)
      {
         presetObject = {};
         transitionType = new String();
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         if(component)
         {
            this.clearProperties();
         }
      }
      
      function motionChange(param1:*) : *
      {
         var _loc2_:* = Math.sin(param1.prop);
         param1.x = param1.xInit + _loc2_ * this._sinusSize;
         motionChangeBlur(param1);
         param1.lastProp = param1.prop;
         param1.lastY = param1.y;
      }
      
      public function set speedBlurAmount(param1:Number) : void
      {
         this._speedBlurAmount = param1;
      }
      
      public function set numberOfSinusoids(param1:Number) : void
      {
         this._numberOfSinusoids = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.8;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      function motionChangeBlur(param1:*) : *
      {
         var _loc2_:* = Math.abs(param1.y - param1.lastY) * speedBlurAmount;
         _loc2_ = Math.min(int(_loc2_),25);
         blurEffect(param1,_loc2_,_loc2_);
      }
      
      public function get sinusSize() : Number
      {
         return this._sinusSize;
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      private function startTween(param1:*, param2:Number) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = undefined;
         param1.visible = true;
         if(transitionType == "show")
         {
            param1.scaleX = 0;
            param1.scaleY = 0;
            _loc4_ = param1.y + _distance;
            _loc5_ = param1.y;
            _loc6_ = 1;
            param1.alpha = 0;
            _loc7_ = param2;
            _loc8_ = 1;
         }
         else
         {
            param1.scaleX = 1;
            param1.scaleY = 1;
            _loc8_ = 2.5;
            _loc4_ = param1.y;
            _loc5_ = param1.y - _distance;
            _loc6_ = 0;
            param1.alpha = 1;
            _loc7_ = param2 + this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
         }
         param1.prop = 0;
         param1.y = _loc4_;
         param1.lastProp = param1.prop;
         param1.lastY = param1.y;
         var _loc3_:* = Math.round(Math.random() * numberOfSinusoids) * (2 * Math.PI);
         TweenLite.to(param1,this.groupDuration,{
            "prop":_loc3_,
            "scaleX":_loc8_,
            "scaleY":_loc8_,
            "overwrite":true,
            "delay":param2,
            "y":_loc5_,
            "ease":this.easeFunc,
            "onComplete":motionFinish,
            "onCompleteParams":[param1],
            "onUpdateParams":[param1],
            "onUpdate":motionChange
         });
         TweenLite.to(param1,this.groupDuration * this.alphaPercentage / 100,{
            "alpha":_loc6_,
            "overwrite":false,
            "delay":_loc7_
         });
      }
      
      public function set sinusSize(param1:Number) : void
      {
         this._sinusSize = param1;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = param1;
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         this._alphaPercentage = param1;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set preset(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 9;
         }
         this._preset = param1;
      }
      
      public function get numberOfSinusoids() : Number
      {
         return this._numberOfSinusoids;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition("hide");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get speedBlurAmount() : Number
      {
         return this._speedBlurAmount;
      }
      
      protected function startTransition(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:* = undefined;
         var _loc6_:uint = 0;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         tweensFinished = 0;
         endEvent = false;
         transitionType = param1;
         var _loc7_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc7_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         presetObject = JFETPreset.getPresetsArray(_loc7_.preset,_loc2_);
         maxItems = this.component.textTable.childs.length;
         _loc4_ = presetObject.timeMatrix;
         if(presetObject.maxItems > 1)
         {
            _loc8_ = Math.max((this.tweenDuration - this.groupDuration) / (presetObject.maxItems - 1),0);
         }
         else
         {
            _loc8_ = 0;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_[_loc5_].length)
            {
               _loc9_ = _loc2_[_loc5_][_loc6_];
               _loc10_ = _loc9_.width;
               _loc11_ = _loc9_.height;
               _loc12_ = 0;
               while(_loc12_ < _loc9_.numChildren)
               {
                  _loc9_.getChildAt(_loc12_).x = _loc9_.getChildAt(_loc12_).x - _loc10_ / 2;
                  _loc9_.getChildAt(_loc12_).y = _loc9_.getChildAt(_loc12_).y - _loc11_;
                  _loc12_++;
               }
               _loc9_.x = _loc9_.x + _loc10_ / 2;
               _loc9_.y = _loc9_.y + _loc11_;
               _loc9_.xInit = _loc9_.x;
               _loc9_.yInit = _loc9_.y;
               _loc9_.visible = true;
               startTween(_loc9_,_loc4_[_loc5_][_loc6_] * _loc8_);
               _loc6_++;
            }
            _loc5_++;
         }
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      function blurEffect(param1:*, param2:Number, param3:Number, param4:* = 3) : *
      {
         param4 = this.blurQuality;
         var _loc5_:BlurFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      function motionFinish(param1:*) : *
      {
         tweensFinished++;
         param1.filters = [];
         if(transitionType == "hide")
         {
            param1.visible = false;
         }
         if(tweensFinished == maxItems)
         {
            endEvent = true;
            remove();
         }
      }
      
      public function set distance(param1:Number) : void
      {
         this._distance = param1;
      }
      
      protected function clearProperties() : void
      {
         var _loc3_:* = undefined;
         var _loc1_:* = this.component.absMatrix;
         var _loc2_:* = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc1_[_loc2_].length)
            {
               if(_loc1_[_loc2_][_loc3_] is Object)
               {
                  TweenLite.killTweensOf(_loc1_[_loc2_][_loc3_],false);
               }
               _loc3_++;
            }
            _loc2_++;
         }
         if(endEvent == true)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function get distance() : Number
      {
         return this._distance;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition("show");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
   }
}
