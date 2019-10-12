package com.jumpeye.flashEff2.text.emerge
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.BevelFilter;
   import flash.filters.BlurFilter;
   
   public class FETEmerge extends IFlashEffText
   {
       
      
      private var _delay:Number = 1;
      
      private var _check:String = "true";
      
      private var _strength:Number = 10;
      
      private var _maxScale:Number = 2;
      
      private var _maxBlurX:Number = 1;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1.3;
      
      private var _blur:Number = 1;
      
      private var maxBlurX:Number = 1;
      
      private var _positionY:Number = 100;
      
      private var _angle:Number = 45;
      
      private var _blurQuality:Number = 2;
      
      private var _alphaPercentage:Number = 67;
      
      private var _color:Number = 0;
      
      private var _alphaDelay:Number;
      
      private var _animationTarget;
      
      private var obj:Object;
      
      private var _rotate:Number = 2;
      
      private var _preset:Number = 55;
      
      public function FETEmerge(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      public function set strength(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._strength = param1;
      }
      
      protected function blurEffect(param1:Sprite, param2:Number, param3:Number, param4:Number, param5:uint = 2) : *
      {
         var _loc6_:BlurFilter = new BlurFilter(param3,param3,param5);
         var _loc7_:BevelFilter = new BevelFilter(1,this.angle,this.color,param4,10053120,0,2,2,param2,4,"inner",false);
         var _loc8_:BevelFilter = new BevelFilter(1,360 - this.angle,this.color,param4,10053120,0,2,2,param2,4,"inner",false);
         var _loc9_:Array = new Array();
         _loc9_.push(_loc7_);
         _loc9_.push(_loc6_);
         _loc9_.push(_loc8_);
         param1.filters = _loc9_;
      }
      
      protected function motionChange(... rest) : void
      {
         var _loc2_:* = rest[0].prop;
         rest[0].x = rest[0].startX + (rest[0].endX - rest[0].startX) * (1 - Math.abs(_loc2_ * 4 - 2) / 2);
         rest[0].y = rest[0].startY + (rest[0].endY - rest[0].startY) * _loc2_;
         var _loc3_:* = rest[0];
         var _loc4_:* = Math.abs(rest[0].prop) * (this.strength * 255);
         var _loc5_:Number = _loc3_.prop * this.maxBlurX;
         var _loc6_:Number = _loc3_.prop * this.blur;
         this.blurEffect(rest[0].clip,_loc4_,_loc6_,_loc2_);
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Quadratic";
         _easeType = "easeNone";
         this.owner = {};
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function set angle(param1:Number) : void
      {
         this._angle = param1;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
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
         this._preset = param1;
      }
      
      public function get strength() : Number
      {
         return this._strength;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function set blur(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blur = Number(Number(param1)) || Number(0);
      }
      
      protected function scaleTween(param1:Object, param2:Number) : *
      {
      }
      
      public function get angle() : Number
      {
         return this._angle;
      }
      
      public function set color(param1:uint) : void
      {
         this._color = param1;
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
         this._animationTarget = this._target;
         var _loc8_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc8_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc8_.preset,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         owner.maxItems = _loc5_.maxItems;
         owner.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         this._delay = Math.max((this.tweenDuration - this.groupDuration) / owner.maxItems,0);
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
               _loc12_.startx = _loc12_.clip.x;
               _loc12_.starty = _loc12_.clip.y;
               _loc12_.finalx = _loc12_.clip.x + owner.positionX;
               _loc12_.finaly = _loc12_.clip.y + owner.positionY;
               _loc12_.endX = 2 * (_loc12_.clip.width / 2 - _loc12_.clip.x) + _loc12_.clip.x;
               _loc12_.endY = _loc12_.clip.y - this._positionY;
               _loc12_.endBlurX = this._maxBlurX;
               _loc12_.endBlurY = this._blur;
               owner.tweensFinished = 0;
               _loc12_.scale = this._maxScale;
               _loc12_.rotate = this._rotate;
               _loc12_.startscalex = _loc12_.clip.scaleX;
               _loc12_.finalscalex = _loc12_.scale;
               _loc12_.startscaley = _loc12_.clip.scaleY;
               _loc12_.finalscaley = _loc12_.scale;
               this.setRegPoint(_loc12_.clip,_loc12_.width / 2,_loc12_.height / 2);
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
      
      protected function setRegPoint(param1:*, param2:Number, param3:Number) : *
      {
         var _loc4_:Number = NaN;
         var _loc5_:* = undefined;
         var _loc6_:DisplayObject = null;
         if(owner.check == "true")
         {
            _loc4_ = param1.numChildren;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = param1.getChildAt(_loc5_);
               _loc6_.x = _loc6_.x - param2;
               _loc6_.y = _loc6_.y - param3;
               _loc5_++;
            }
            param1.x = param1.x + param2;
            param1.y = param1.y + param3;
         }
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get blur() : Number
      {
         return this._blur;
      }
      
      protected function motionFinish() : void
      {
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
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
      
      protected function motionFinish2() : void
      {
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
   }
}
