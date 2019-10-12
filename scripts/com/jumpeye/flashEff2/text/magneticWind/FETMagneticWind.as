package com.jumpeye.flashEff2.text.magneticWind
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class FETMagneticWind extends IFlashEffText
   {
       
      
      private var _preset:Number = 9;
      
      protected var chars;
      
      protected var cLen:Number;
      
      private var _groupDuration:Number = 1;
      
      private var _randomX:Number = 80;
      
      private var _randomY:Number = 20;
      
      private var _changeLetters:Boolean = false;
      
      protected var isShow:Boolean = true;
      
      protected var tweensNumber:uint = 0;
      
      private var _alphaPercentage:Number = 50;
      
      private var _maxScaleAmount:Number = 4;
      
      protected var elements:Array;
      
      protected var tweensFinished:uint = 0;
      
      protected var direction:uint = 0;
      
      public function FETMagneticWind(param1:JUIComponent = null)
      {
         chars = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
         cLen = chars.length;
         super();
         this.component = param1;
         init();
      }
      
      public function set changeLetters(param1:Boolean) : void
      {
         this._changeLetters = param1;
      }
      
      public function set maxScaleAmount(param1:Number) : void
      {
         this._maxScaleAmount = param1;
      }
      
      override public function remove() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         if(this.elements is Array)
         {
            _loc1_ = this.elements.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc4_ = this.elements[_loc2_].length;
               _loc3_ = 0;
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = this.elements[_loc2_][_loc3_];
                  TweenLite.killTweensOf(_loc5_,false);
                  TweenLite.killTweensOf(_loc5_.clip,false);
                  clearInterval(_loc5_.lettersInterval);
                  _loc3_++;
               }
               _loc2_++;
            }
            this.elements = null;
         }
      }
      
      protected function motionChange(param1:Object) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Number = NaN;
         var _loc4_:Number = param1.prop;
         var _loc5_:Number = _loc4_;
         var _loc6_:* = _loc4_;
         param1.clip.x = this.getBezier(_loc6_,param1.startX,param1.startX,param1.endX);
         param1.clip.y = this.getBezier(_loc6_,param1.startY,param1.endY,param1.endY);
         var _loc7_:Number = Math.abs(param1.clip.y - param1.lastBlurY) * 3;
         var _loc8_:Number = Math.abs(param1.clip.x - param1.lastBlurX) * 3;
         param1.lastBlurX = param1.clip.x;
         param1.lastBlurY = param1.clip.y;
         this.blurEffect(param1.clip,_loc8_,_loc7_);
         var _loc9_:Matrix = param1.clip.transform.matrix;
         _loc9_.a = _loc9_.d = param1.clip.scaleY = 1 + (param1.maxScaleAmount - 1) * _loc6_;
         _loc9_.c = param1.skewX * _loc6_;
         param1.clip.transform.matrix = _loc9_;
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
      
      private function init() : *
      {
         _tweenDuration = 1.6;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
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
      
      public function get changeLetters() : Boolean
      {
         return this._changeLetters;
      }
      
      override public function hide() : void
      {
         this.startTransition(false);
      }
      
      public function get maxScaleAmount() : Number
      {
         return this._maxScaleAmount;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      protected function motionStart(param1:Object) : void
      {
         if(this.changeLetters == true)
         {
            if(param1.initialLetter != "")
            {
               param1.lettersInterval = setInterval(this.changeLetter,Math.random() * 50 + 80,param1,this.groupDuration / 0.2);
            }
         }
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      protected function getBezier(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return (1 - param1) * (1 - param1) * param2 + 2 * param1 * (1 - param1) * param3 + param1 * param1 * param4;
      }
      
      protected function startTransition(param1:Boolean) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc14_:* = undefined;
         var _loc15_:uint = 0;
         var _loc16_:Object = null;
         var _loc17_:Number = NaN;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc20_:Number = NaN;
         var _loc8_:Number = -1;
         this.isShow = param1;
         this.component.drawTextTable("chars",this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         this.direction = 0;
         if(this.preset > 9)
         {
            preset = preset - 9;
            this.direction = 1;
            _loc8_ = 1;
         }
         else if(preset > 18)
         {
            preset = 1;
         }
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(preset,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         var _loc9_:Number = _loc5_.maxItems;
         this.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         var _loc10_:* = 0;
         var _loc11_:* = 1;
         if(isShow == true)
         {
            _loc10_ = 1;
            _loc11_ = 0;
            this.isShow = true;
         }
         else
         {
            this.isShow = false;
         }
         this.tweensNumber = this.component.textTable.childs.length;
         var _loc12_:Array = [[[1,-1],[1,1],[-1,1]],[[-1,-1],[-1,-1],[1,1]]];
         this.elements = [];
         if(_loc9_ > 1)
         {
            _loc14_ = Math.max((this.tweenDuration - this.groupDuration) / (_loc9_ - 1),0);
         }
         else
         {
            _loc14_ = 0;
         }
         var _loc13_:Number = Math.sqrt(this.randomX * this.randomX + this.randomY * this.randomY);
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc15_ = _loc4_[_loc6_].length;
            this.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc15_)
            {
               _loc16_ = this.elements[_loc6_][_loc7_] = {};
               _loc17_ = Math.floor(Math.random() * 4);
               if(_loc17_ > 2)
               {
                  _loc17_ = 2;
               }
               _loc16_.clip = _loc2_[_loc6_][_loc7_];
               _loc16_.clip.alpha = _loc11_;
               _loc16_.directionX = _loc12_[this.direction][_loc17_][0];
               _loc16_.directionY = _loc12_[this.direction][_loc17_][1];
               _loc16_.startX = _loc16_.clip.x;
               _loc16_.startY = _loc16_.clip.y;
               _loc16_.endX = _loc16_.startX + Math.random() * this.randomX * _loc16_.directionX;
               _loc16_.endY = _loc16_.startY + Math.random() * this.randomY * _loc16_.directionY;
               _loc16_.lastBlurX = 0;
               _loc16_.lastBlurY = 0;
               _loc18_ = _loc16_.endX - _loc16_.startX;
               _loc19_ = _loc16_.endY - _loc16_.startY;
               _loc20_ = Math.sqrt(_loc18_ * _loc18_ + _loc19_ * _loc19_);
               _loc16_.maxScaleAmount = 1 + _loc20_ * this.maxScaleAmount * (_loc17_ - 1) / _loc13_ || 0;
               _loc16_.endX = _loc16_.endX - _loc16_.clip.width * (_loc16_.maxScaleAmount - 1) / 2;
               _loc16_.endY = _loc16_.endY - _loc16_.clip.height * (_loc16_.maxScaleAmount - 1) / 2;
               _loc16_.skewX = Math.tan(_loc8_ * Math.PI / 180 * Math.abs(_loc18_ / 6));
               _loc16_.lastBlurX = _loc16_.clip.x;
               _loc16_.lastBlurY = _loc16_.clip.y;
               _loc16_.textFormat = _loc16_.clip.textField.getTextFormat();
               _loc16_.initialLetter = _loc16_.clip.textField.text;
               _loc16_.currentCount = 0;
               _loc16_.prop = _loc10_;
               TweenLite.to(_loc16_,this.groupDuration,{
                  "prop":_loc11_,
                  "ease":this.easeFunc,
                  "delay":_loc4_[_loc6_][_loc7_] * _loc14_,
                  "onUpdate":this.motionChange,
                  "onComplete":this.motionFinish,
                  "onStart":this.motionStart,
                  "onStartParams":[_loc16_],
                  "onUpdateParams":[_loc16_],
                  "onCompleteParams":[_loc16_]
               });
               TweenLite.to(_loc16_.clip,this.groupDuration * this.alphaPercentage / 100,{
                  "alpha":_loc10_,
                  "delay":_loc4_[_loc6_][_loc7_] * _loc14_ + _loc11_ * (this.groupDuration - this.groupDuration * this.alphaPercentage / 100),
                  "onUpdate":this.motionChange,
                  "onComplete":this.motionFinish,
                  "onStart":this.motionStart,
                  "onStartParams":[_loc16_],
                  "onUpdateParams":[_loc16_],
                  "onCompleteParams":[_loc16_]
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      protected function blurEffect(param1:Sprite, param2:Number, param3:Number, param4:uint = 1) : void
      {
         var _loc5_:BitmapFilter = new BlurFilter(param2,param3,param4);
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
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      protected function motionFinish(param1:Object) : void
      {
         param1.clip.filters = [];
         if(this.isShow == false)
         {
            param1.clip.visible = false;
         }
         this.tweensFinished++;
         if(this.tweensNumber == this.tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set randomX(param1:Number) : void
      {
         this._randomX = param1;
      }
      
      public function set randomY(param1:Number) : void
      {
         this._randomY = param1;
      }
      
      public function get randomX() : Number
      {
         return this._randomX;
      }
      
      protected function changeLetter(param1:Object, param2:uint) : void
      {
         param1.currentCount++;
         if(param1.currentCount < param2)
         {
            param1.clip.textField.text = this.chars[Math.floor(Math.random() * this.cLen)];
         }
         else
         {
            param1.clip.textField.text = param1.initialLetter;
            clearInterval(param1.lettersInterval);
         }
         param1.clip.textField.setTextFormat(param1.textFormat);
      }
      
      public function get randomY() : Number
      {
         return this._randomY;
      }
   }
}
