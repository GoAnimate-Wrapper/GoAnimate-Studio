package com.jumpeye.flashEff2.text.spinningGenie
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class FETSpinningGenie extends IFlashEffText
   {
       
      
      private var _delay:Number = 1;
      
      private var _preset:Number = 15;
      
      private var _positionY:Number = -200;
      
      private var _blurQuality:Number = 2;
      
      private var _alphaPercentage:Number = 50;
      
      private var _alphaDelay:Number;
      
      private var _maxBlurX:Number = 20;
      
      private var _maxBlurY:Number = 20;
      
      private var _groupDuration:Number = 1.3;
      
      private var _animationTarget;
      
      private var obj:Object;
      
      protected var owner:Object;
      
      public function FETSpinningGenie(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      protected function scaleTween(param1:Object, param2:Number) : *
      {
         param1.clip.y = param1.starty + (param1.endY - param1.starty) * Math.abs(Math.abs(4 * param2 - 2) - 2);
         param1.clip.x = param1.startx + (param1.endX - param1.startx) * Math.abs(Math.abs(4 * param2 - 2) - 2);
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:uint = 0;
         var _loc3_:* = undefined;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Object = null;
         if(owner is Object)
         {
            if(owner.elements is Array)
            {
               _loc1_ = owner.absMatrix;
               _loc2_ = owner.elements.length;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  _loc5_ = owner.elements[_loc3_].length;
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_)
                  {
                     _loc6_ = owner.elements[_loc3_][_loc4_];
                     TweenLite.killTweensOf(_loc6_,false);
                     TweenLite.killTweensOf(_loc6_.clip,false);
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
         }
         delete owner.elements;
      }
      
      protected function motionChange(... rest) : void
      {
         var _loc2_:* = rest[0].prop;
         rest[0].clip.x = rest[0].startX + (rest[0].endX - rest[0].startX) * (1 - Math.abs(_loc2_ * 4 - 2) / 2);
         rest[0].clip.y = rest[0].startY + (rest[0].endY - rest[0].startY) * _loc2_;
         rest[0].clip.scaleX = Math.abs(4 * _loc2_ - 2) - 1;
         var _loc3_:* = rest[0];
         var _loc4_:Number = _loc3_.prop * this.maxBlurX;
         var _loc5_:Number = _loc3_.prop * this.maxBlurY;
         this.blurEffect(_loc3_.clip,_loc4_,_loc5_,this.blurQuality);
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
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
      }
      
      public function get positionY() : Number
      {
         return this._positionY;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function blurEffect(param1:Sprite, param2:Number, param3:Number, param4:uint = 2) : void
      {
         var _loc5_:BitmapFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.7;
         _tweenType = "Strong";
         _easeType = "easeOut";
         this.owner = {};
      }
      
      public function set maxBlurY(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurY = Number(Number(param1)) || Number(0);
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function set maxBlurX(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlurX = Number(Number(param1)) || Number(0);
      }
      
      public function set positionY(param1:Number) : void
      {
         this._positionY = param1;
      }
      
      protected function motionFinish() : void
      {
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
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
         var _loc11_:uint = 0;
         var _loc12_:Object = null;
         var _loc13_:* = undefined;
         if(this._alphaPercentage > 100)
         {
            this._alphaPercentage = 100;
         }
         if(this._alphaPercentage < 0)
         {
            this._alphaPercentage = 0;
         }
         this._animationTarget = this._target;
         obj = {};
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
         if(param1 == true)
         {
            _loc9_ = 1;
            _loc10_ = 0;
            owner.timeDirection = 1;
            this._alphaDelay = 0;
         }
         else
         {
            this._alphaDelay = this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
         }
         owner.tweensNumber = this.component.textTable.childs.length;
         owner.elements = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc11_ = _loc2_[_loc6_].length;
            owner.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc11_)
            {
               _loc12_ = owner.elements[_loc6_][_loc7_] = {};
               _loc12_.clip = _loc2_[_loc6_][_loc7_];
               this._animationTarget = _loc12_.clip;
               obj = _loc12_;
               _loc12_.height = this._animationTarget.height;
               _loc12_.width = this._animationTarget.width;
               _loc12_.clip.alpha = Math.abs(1 - _loc9_);
               _loc12_.prop = _loc9_;
               _loc13_ = _loc12_.clip.width / 2 + _loc12_.clip.x;
               _loc12_.mij = _loc13_;
               _loc12_.startX = _loc12_.clip.x;
               _loc12_.startY = _loc12_.clip.y;
               _loc12_.endX = 2 * (_loc12_.clip.width / 2 - _loc12_.clip.x) + _loc12_.clip.x;
               _loc12_.endY = _loc12_.clip.y - this._positionY;
               _loc12_.endBlurX = owner.maxBlurX;
               _loc12_.endBlurY = owner.maxBlurX;
               owner.tweensFinished = 0;
               TweenLite.to(_loc12_,this.groupDuration,{
                  "prop":_loc10_,
                  "delay":_loc4_[_loc6_][_loc7_] * this._delay,
                  "ease":this.easeFunc,
                  "onComplete":motionFinish,
                  "onUpdate":motionChange,
                  "onUpdateParams":[_loc12_]
               });
               TweenLite.to(_loc12_.clip,this.groupDuration * this.alphaPercentage / 100,{
                  "alpha":_loc9_,
                  "delay":_loc4_[_loc6_][_loc7_] * this._delay + this._alphaDelay,
                  "onComplete":motionFinish2,
                  "overwrite":false
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         this._alphaPercentage = param1;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      protected function motionFinish2() : void
      {
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
   }
}
