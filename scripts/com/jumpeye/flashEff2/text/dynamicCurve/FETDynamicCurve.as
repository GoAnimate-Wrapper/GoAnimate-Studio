package com.jumpeye.flashEff2.text.dynamicCurve
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.filters.BlurFilter;
   import flash.geom.Point;
   
   public class FETDynamicCurve extends IFlashEffText
   {
       
      
      private var _intermediateY:Number = 400;
      
      private var _preset:Number = 14;
      
      protected var endEvent:Boolean = false;
      
      private var _speedBlurAmount:Number = 1;
      
      private var _intermediateX:Number = 200;
      
      private var tweenArray:Array;
      
      private var transitionType:String;
      
      private var _groupDuration:Number = 0.8;
      
      private var maxItems:Number;
      
      private var _positionX:Number = -100;
      
      private var _positionY:Number = 100;
      
      private var _blurQuality:Number = 2;
      
      private var _alphaPercentage:Number = 15;
      
      private var tweensFinished:Number = 0;
      
      private var presetObject:Object;
      
      public function FETDynamicCurve(param1:JUIComponent = null)
      {
         presetObject = {};
         transitionType = new String();
         tweenArray = new Array();
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
      
      public function set speedBlurAmount(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0.8;
         }
         this._speedBlurAmount = param1;
      }
      
      public function set intermediateX(param1:Number) : void
      {
         this._intermediateX = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      function motionChangeBlur(param1:*) : *
      {
         var _loc2_:* = Math.abs(param1.prop - param1.lastProp) * 100;
         blurEffect(param1,Math.min(_loc2_ * speedBlurAmount,25),Math.min(_loc2_ * speedBlurAmount,25));
      }
      
      function motionChange(param1:*) : *
      {
         var _loc2_:* = param1.prop;
         motionChangeBlur(param1);
         param1.lastProp = param1.prop;
         param1.visible = true;
         var _loc3_:* = this.positionX;
         var _loc4_:* = param1.x2;
         var _loc5_:* = param1.xInit;
         var _loc6_:* = (1 - _loc2_) * (1 - _loc2_) * _loc3_ + 2 * _loc2_ * (1 - _loc2_) * _loc4_ + _loc2_ * _loc2_ * _loc5_;
         _loc3_ = this.positionY;
         _loc4_ = param1.y2;
         _loc5_ = param1.yInit;
         var _loc7_:* = (1 - _loc2_) * (1 - _loc2_) * _loc3_ + 2 * _loc2_ * (1 - _loc2_) * _loc4_ + _loc2_ * _loc2_ * _loc5_;
         var _loc8_:* = new Point(_loc6_,_loc7_);
         _loc8_ = param1.globalToLocal(_loc8_);
         param1.x = param1.x + _loc8_.x;
         param1.y = param1.y + _loc8_.y;
      }
      
      public function get intermediateY() : Number
      {
         return this._intermediateY;
      }
      
      public function set positionX(param1:Number) : void
      {
         this._positionX = param1;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function set positionY(param1:Number) : void
      {
         this._positionY = param1;
      }
      
      private function startTween(param1:Object, param2:Number) : *
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = undefined;
         var _loc3_:* = this.positionX;
         var _loc4_:* = this._intermediateX;
         var _loc5_:Point = new Point();
         _loc5_ = param1.localToGlobal(_loc5_);
         var _loc6_:* = _loc5_.x;
         var _loc7_:* = 0.5;
         param1.x2 = (_loc4_ - (1 - _loc7_) * (1 - _loc7_) * _loc3_ - _loc7_ * _loc7_ * _loc6_) / (2 * _loc7_ * (1 - _loc7_));
         _loc3_ = this.positionY;
         _loc4_ = this.intermediateY;
         _loc6_ = Math.round(_loc5_.y);
         param1.y2 = (_loc4_ - (1 - _loc7_) * (1 - _loc7_) * _loc3_ - _loc7_ * _loc7_ * _loc6_) / (2 * _loc7_ * (1 - _loc7_));
         if(transitionType == "show")
         {
            param1.visible = false;
            _loc8_ = 1;
            param1.alpha = 0;
            _loc9_ = param2;
            param1.prop = 0;
            _loc10_ = 1;
         }
         else
         {
            _loc8_ = 0;
            param1.alpha = 1;
            _loc9_ = param2 + this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
            param1.prop = 1;
            _loc10_ = 0;
         }
         if(!param1.lastProp)
         {
            param1.lastProp = param1.prop;
         }
         TweenLite.to(param1,this.groupDuration,{
            "prop":_loc10_,
            "overwrite":true,
            "delay":param2,
            "ease":this.easeFunc,
            "onComplete":motionFinish,
            "onCompleteParams":[param1],
            "onUpdateParams":[param1],
            "onUpdate":motionChange
         });
         TweenLite.to(param1,this.groupDuration * this.alphaPercentage / 100,{
            "alpha":_loc8_,
            "overwrite":false,
            "delay":_loc9_
         });
      }
      
      public function set intermediateY(param1:Number) : void
      {
         this._intermediateY = param1;
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = param1;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set preset(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 18;
         }
         this._preset = param1;
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
      
      public function get positionX() : Number
      {
         return this._positionX;
      }
      
      public function get positionY() : Number
      {
         return this._positionY;
      }
      
      function blurEffect(param1:*, param2:Number, param3:Number, param4:* = 3) : *
      {
         param4 = this._blurQuality;
         var _loc5_:BlurFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
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
         this._groupDuration = param1;
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
      
      protected function startTransition(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:Point = null;
         tweensFinished = 0;
         endEvent = false;
         transitionType = param1;
         var _loc4_:Number = Number(Number(this.preset)) || Number(18);
         var _loc5_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc5_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         presetObject = JFETPreset.getPresetsArray(_loc5_.preset,_loc2_);
         _loc3_ = presetObject.timeMatrix;
         maxItems = this.component.textTable.childs.length;
         if(presetObject.maxItems > 1)
         {
            _loc7_ = Math.max((this.tweenDuration - this.groupDuration) / (presetObject.maxItems - 1),0);
         }
         else
         {
            _loc7_ = 0;
         }
         var _loc6_:* = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc3_[_loc6_].length)
            {
               _loc9_ = _loc2_[_loc6_][_loc8_];
               _loc10_ = new Point();
               _loc10_ = _loc9_.localToGlobal(_loc10_);
               _loc9_.xInit = _loc10_.x;
               _loc9_.yInit = _loc10_.y;
               startTween(_loc9_,_loc3_[_loc6_][_loc8_] * _loc7_);
               _loc8_++;
            }
            _loc6_++;
         }
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition("show");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get intermediateX() : Number
      {
         return this._intermediateX;
      }
   }
}
