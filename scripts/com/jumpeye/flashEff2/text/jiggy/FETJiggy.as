package com.jumpeye.flashEff2.text.jiggy
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFERandomPreset;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.filters.DropShadowFilter;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class FETJiggy extends IFlashEffText
   {
       
      
      private var _delay:Number = 1;
      
      private var col:uint;
      
      private var _check:String = "true";
      
      private var lin:uint;
      
      private var _strength:Number = 20;
      
      private var dist = 3;
      
      private var steps;
      
      private var _maxBlurX:Number = 25;
      
      private var _maxBlurY:Number = 25;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 0.5;
      
      private var _vibrations:Number = 10;
      
      private var _positionY:Number = 500;
      
      private var _blurQuality:Number = 1;
      
      private var intervalArr:Array;
      
      private var _alphaPercentage:Number = 50;
      
      private var _alphaDelay:Number;
      
      private var trailStrength;
      
      private var grEfDur;
      
      private var _animationTarget;
      
      private var obj:Object;
      
      private var _preset:Number = 12;
      
      public function FETJiggy(param1:JUIComponent = null)
      {
         intervalArr = [];
         super();
         this.component = param1;
         this.init();
      }
      
      public function set strength(param1:Number) : void
      {
         this._strength = param1;
      }
      
      private function stTween(param1:*, param2:*, param3:*) : *
      {
         var _loc12_:* = undefined;
         clearInterval(owner["clipInterval" + param2 + "_" + param3]);
         var _loc4_:* = {};
         _loc4_.clip = param1.clip;
         _loc4_.i = param2;
         _loc4_.j = param3;
         var _loc5_:* = owner.show == true?0:1;
         var _loc6_:* = owner.show == true?1:0;
         var _loc7_:* = owner.show == true?trailStrength:0;
         var _loc8_:* = owner.show == true?0:trailStrength;
         var _loc9_:* = owner.duration * 1000;
         var _loc10_:* = steps + 1;
         var _loc11_:* = 0;
         _loc12_ = 2 * (_loc9_ - 2 * _loc11_) / (_loc10_ * (_loc10_ - 1));
         intervalArr[0] = 0;
         var _loc13_:* = 0;
         while(_loc13_ < _loc10_ - 1)
         {
            intervalArr[_loc13_ + 1] = intervalArr[_loc13_] + _loc12_;
            _loc13_++;
         }
         intervalArr.shift();
         intervalArr = JFERandomPreset.randomArray(intervalArr);
         this.makeBlurVibe(param1.clip,param2,param3);
         TweenLite.to(param1.clip,owner.duration,{
            "alpha":_loc6_,
            "delay":0,
            "onComplete":hdlAlphaFinished,
            "overwrite":false
         });
      }
      
      override public function remove() : void
      {
         this.clearProperties(owner);
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.8;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      private function getBlurShadow(param1:*, param2:*, param3:*, param4:*, param5:*, param6:*) : *
      {
         var _loc7_:* = param3;
         var _loc8_:Number = param2;
         var _loc9_:Number = param5;
         var _loc10_:Number = 1 - param6;
         var _loc11_:Number = _loc7_ == 1?Number(0):Number(param1 / 5);
         var _loc12_:Number = _loc7_ == 1?Number(param1 / 5):Number(0);
         var _loc13_:Number = param4;
         var _loc14_:Number = param1;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc17_:Number = BitmapFilterQuality.HIGH;
         return new DropShadowFilter(_loc13_,_loc9_,_loc8_,_loc10_,_loc11_,_loc12_,_loc14_,_loc17_,_loc15_,_loc16_);
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function set maxBlurX(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurX = Number(Number(param1)) || Number(0);
      }
      
      public function set maxBlurY(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurY = Number(Number(param1)) || Number(0);
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get vibrations() : Number
      {
         return this._vibrations;
      }
      
      public function set positionY(param1:Number) : void
      {
         this._positionY = param1;
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         this._alphaPercentage = param1;
      }
      
      private function countTransitions() : *
      {
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            owner.finished = true;
            this.clearProperties(owner);
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function get strength() : Number
      {
         return this._strength;
      }
      
      public function set vibrations(param1:Number) : void
      {
         this._vibrations = param1;
      }
      
      private function randRange(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get maxBlurX() : Number
      {
         return this._maxBlurX;
      }
      
      public function get positionY() : Number
      {
         return this._positionY;
      }
      
      private function makeBlurVibe(param1:*, param2:*, param3:*) : *
      {
         param1.vibe++;
         clearInterval(param1.inte);
         if(param1["vibeTween"])
         {
            param1["vibeTween"].stop();
         }
         var _loc4_:* = param1.vibeEff == 0?trailStrength:0;
         var _loc5_:* = param1.vibeEff == 0?0:trailStrength;
         param1.vibeEff = param1.vibeEff == 0?1:0;
         param1.tweenObj = {};
         param1.tweenObj.clip = param1;
         param1.tweenObj.i = param2;
         param1.tweenObj.j = param3;
         param1.tweenObj.a = this.randRange(0,360);
         param1.tweenObj.w = this.randRange(0,1);
         param1.tweenObj.d = this.randRange(0,dist);
         param1.tweenObj.position = _loc4_;
         TweenLite.to(param1.tweenObj,intervalArr[param1.vibe - 1] / 1000,{
            "position":_loc5_,
            "delay":0,
            "onUpdate":hdlChangeFilter,
            "onUpdateParams":[param1.tweenObj],
            "ease":this.easeFunc,
            "overwrite":false
         });
         if(param1.vibe < steps)
         {
            param1.inte = setInterval(this.makeBlurVibe,intervalArr[param1.vibe - 1],param1,param2,param3);
         }
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc11_:Object = null;
         var _loc12_:* = undefined;
         this.owner = {};
         this.grEfDur = !!isNaN(Number(this._groupDuration))?1:this._groupDuration;
         this.grEfDur = Math.max(0.01,this.grEfDur);
         this.trailStrength = !!isNaN(Number(this.strength))?20:this.strength;
         this.trailStrength = Math.max(0,this.trailStrength);
         this.steps = !!isNaN(this._vibrations)?10:Number(this._vibrations);
         this.steps = Math.max(0,this.steps);
         owner.finished = false;
         owner.tweensFinished = 0;
         this._animationTarget = this._target;
         var _loc8_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc8_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc8_.preset,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         owner.maxItems = _loc5_.maxItems;
         owner.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         if(owner.maxItems <= 1)
         {
            this._delay = 0;
         }
         else
         {
            this._delay = Math.max((this.tweenDuration - this.groupDuration) / (owner.maxItems - 1),0);
         }
         var _loc9_:uint = 0;
         var _loc10_:uint = 1;
         owner.timeDirection = 0;
         owner.show = param1;
         owner.elements = [];
         owner.delay = (this.tweenDuration - grEfDur) / owner.maxItems;
         owner.delay = owner.delay < 0?0:owner.delay;
         owner.duration = grEfDur;
         owner.tweensNumber = this.component.textTable.childs.length;
         owner.elements = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            col = _loc4_[_loc6_].length;
            owner.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < col)
            {
               _loc11_ = owner.elements[_loc6_][_loc7_] = {};
               _loc11_.clip = _loc2_[_loc6_][_loc7_];
               _loc11_.clip.alpha = owner.show == true?0:1;
               _loc11_.clip.vibe = 0;
               _loc11_.clip.vibeEff = this.getParity(steps) == true?1:0;
               _loc12_ = _loc4_[_loc6_][_loc7_] * owner.delay * 1000;
               _loc12_ = !!isNaN(_loc12_)?0:_loc12_;
               owner["clipInterval" + _loc6_ + "_" + _loc7_] = setInterval(this.stTween,_loc12_,_loc11_,_loc6_,_loc7_);
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function getParity(param1:*) : Boolean
      {
         var _loc2_:* = false;
         var _loc3_:* = param1 / 2;
         var _loc4_:* = _loc3_ - Math.floor(_loc3_);
         _loc2_ = _loc4_ == 0;
         return _loc2_;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      private function hdlAlphaFinished() : *
      {
         this.countTransitions();
      }
      
      private function hdlChangeFilter(param1:*) : *
      {
         var _loc2_:* = owner.finished == false?param1.position:0;
         var _loc3_:* = param1.clip;
         var _loc4_:* = param1.i;
         var _loc5_:* = param1.j;
         var _loc6_:* = param1.w;
         var _loc7_:* = param1.d;
         var _loc8_:* = param1.a;
         var _loc9_:* = this.target.getTextFormat(_loc3_.id,_loc3_.id + 1).color;
         var _loc10_:* = this.getBlur(_loc2_,_loc6_);
         var _loc11_:* = this.getBlurShadow(_loc2_,_loc9_,_loc6_,_loc7_,_loc8_,_loc3_.alpha);
         if(_loc2_ != 0)
         {
            _loc3_.filters = [_loc11_,_loc10_];
         }
         else
         {
            _loc3_.filters = [];
         }
      }
      
      protected function clearProperties(param1:*) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         var _loc4_:* = undefined;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:Object = null;
         if(param1)
         {
            _loc2_ = this.component.absMatrix;
            _loc3_ = param1.elements.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc6_ = param1.elements[_loc4_].length;
               _loc5_ = 0;
               while(_loc5_ < _loc6_)
               {
                  _loc7_ = param1.elements[_loc4_][_loc5_];
                  _loc7_.clip = _loc2_[_loc4_][_loc5_];
                  if(param1["clipInterval" + _loc4_ + "_" + _loc5_])
                  {
                     clearInterval(param1["clipInterval" + _loc4_ + "_" + _loc5_]);
                  }
                  if(_loc7_.clip)
                  {
                     TweenLite.killTweensOf(_loc7_.clip,false);
                     if(_loc7_.clip.inte)
                     {
                        clearInterval(_loc7_.clip.inte);
                        TweenLite.killTweensOf(_loc7_.tweenObj,false);
                        _loc7_.clip.filters = [];
                     }
                  }
                  _loc5_++;
               }
               _loc4_++;
            }
         }
         param1 = null;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      private function getBlur(param1:*, param2:*) : BitmapFilter
      {
         var _loc3_:Number = param2 == 1?Number(0):Number(param1 / 3);
         var _loc4_:Number = param2 == 1?Number(param1 / 3):Number(0);
         return new BlurFilter(_loc3_,_loc4_,BitmapFilterQuality.HIGH);
      }
   }
}
