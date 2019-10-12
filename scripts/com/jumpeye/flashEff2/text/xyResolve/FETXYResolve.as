package com.jumpeye.flashEff2.text.xyResolve
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class FETXYResolve extends IFlashEffText
   {
       
      
      private var _maxBlur:Number = 8;
      
      private var _groupDuration:Number = 0.6;
      
      private var _randomX:Number = 50;
      
      private var _randomY:Number = 50;
      
      protected var isShow:Boolean = true;
      
      protected var timeDirection:uint = 0;
      
      protected var tweensNumber:uint = 0;
      
      private var _blurQuality:Number = 1;
      
      private var _maxScaleAmount:Number = 0.3;
      
      private var _alphaPercentage:Number = 50;
      
      protected var elements:Array;
      
      protected var tweensFinished:uint = 0;
      
      private var _preset:Number = 15;
      
      public function FETXYResolve(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function motionChange(param1:Object) : void
      {
         var _loc2_:Number = param1.prop;
         param1.clip.x = param1.startX + (param1.endX - param1.startX) * _loc2_;
         param1.clip.y = param1.startY + (param1.endY - param1.startY) * _loc2_;
         param1.clip.scaleX = param1.clip.scaleY = 1 + (param1.endScale - 1) * _loc2_;
      }
      
      override public function show() : void
      {
         this.startTransition(true);
      }
      
      protected function blurMotionChange(param1:Object) : void
      {
         var _loc2_:Number = param1.blurProp;
         var _loc3_:Number = param1.endBlurX * _loc2_;
         var _loc4_:Number = param1.endBlurY * _loc2_;
         this.blurEffect(param1.clip,_loc3_,_loc4_,this.blurQuality);
      }
      
      private function init() : *
      {
         _tweenDuration = 1.2;
         _tweenType = "Back";
         _easeType = "easeOut";
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
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
         else if(param1 > 10)
         {
            param1 = 10;
         }
         this._blurQuality = param1;
      }
      
      protected function positionMotionFinish(param1:Object) : void
      {
         this.tweensFinished++;
         if(3 * this.tweensNumber == this.tweensFinished)
         {
            this.clearProperties();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set preset(param1:Number) : void
      {
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
      
      public function set maxBlur(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._maxBlur = param1;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc15_:Number = NaN;
         var _loc16_:uint = 0;
         var _loc17_:Object = null;
         this.isShow = param1;
         var _loc8_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc8_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc8_.preset,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         var _loc9_:Number = _loc5_.maxItems;
         this.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         var _loc10_:uint = 0;
         var _loc11_:uint = 1;
         var _loc12_:String = "max";
         var _loc13_:Number = this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
         this.timeDirection = 0;
         if(this.isShow == true)
         {
            _loc10_ = 1;
            _loc11_ = 0;
            _loc12_ = "min";
            this.timeDirection = 1;
            _loc13_ = 0;
         }
         this.tweensNumber = this.component.textTable.childs.length;
         this.tweensFinished = 0;
         this.elements = [];
         var _loc14_:Number = Math.max(this.randomX,this.randomY);
         if(_loc9_ > 1)
         {
            _loc15_ = Math.max((this.tweenDuration - this.groupDuration) / (_loc9_ - 1),0);
         }
         else
         {
            _loc15_ = 0;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc16_ = _loc4_[_loc6_].length;
            this.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc16_)
            {
               _loc17_ = this.elements[_loc6_][_loc7_] = {};
               _loc17_.clip = _loc2_[_loc6_][_loc7_];
               _loc17_.clip.alpha = Math.abs(1 - _loc10_);
               _loc17_.startX = _loc17_.clip.x;
               _loc17_.startY = _loc17_.clip.y;
               _loc17_.endX = _loc17_.startX + (Math.random() * 2 - 1) * this.randomX;
               _loc17_.endY = _loc17_.startY + (Math.random() * 2 - 1) * this.randomY;
               _loc17_.endBlurX = Math.abs((_loc17_.endX - _loc17_.startX) * this.maxBlur / _loc14_);
               _loc17_.endBlurY = Math.abs((_loc17_.endY - _loc17_.startY) * this.maxBlur / _loc14_);
               _loc17_.endScale = 1 + (Math.random() * 2 - 1) * this.maxScaleAmount;
               _loc17_.endX = _loc17_.endX - _loc17_.clip.width * (_loc17_.endScale - 1) / 2;
               _loc17_.endY = _loc17_.endY - _loc17_.clip.height * (_loc17_.endScale - 1) / 2;
               _loc17_.prop = _loc17_.blurProp = _loc10_;
               TweenLite.to(_loc17_,this.groupDuration,{
                  "prop":_loc11_,
                  "ease":this.easeFunc,
                  "delay":_loc15_ * _loc4_[_loc6_][_loc7_],
                  "onUpdate":this.motionChange,
                  "onUpdateParams":[_loc17_],
                  "onComplete":this.positionMotionFinish,
                  "onCompleteParams":[_loc17_]
               });
               TweenLite.to(_loc17_,this.groupDuration,{
                  "blurProp":_loc11_,
                  "delay":_loc15_ * _loc4_[_loc6_][_loc7_],
                  "onUpdate":this.blurMotionChange,
                  "onUpdateParams":[_loc17_],
                  "onComplete":this.blurMotionFinish,
                  "onCompleteParams":[_loc17_],
                  "overwrite":false
               });
               TweenLite.to(_loc17_.clip,this.groupDuration * this.alphaPercentage / 100,{
                  "alpha":_loc10_,
                  "delay":_loc15_ * _loc4_[_loc6_][_loc7_] + _loc13_,
                  "onComplete":this.alphaMotionFinish,
                  "onCompleteParams":[_loc17_]
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      protected function blurEffect(param1:Sprite, param2:Number, param3:Number, param4:uint = 1) : void
      {
         var _loc5_:BitmapFilter = null;
         var _loc6_:Array = null;
         if(param2 != 0 || param3 != 0)
         {
            _loc5_ = new BlurFilter(param2,param3,param4);
            _loc6_ = new Array();
            _loc6_.push(_loc5_);
            param1.filters = _loc6_;
         }
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function alphaMotionFinish(param1:Object) : void
      {
         this.tweensFinished++;
         if(3 * this.tweensNumber == this.tweensFinished)
         {
            this.clearProperties();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set randomX(param1:Number) : void
      {
         this._randomX = param1;
      }
      
      public function get maxBlur() : Number
      {
         return this._maxBlur;
      }
      
      public function set randomY(param1:Number) : void
      {
         this._randomY = param1;
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
                  _loc3_++;
               }
               _loc2_++;
            }
            this.elements = null;
         }
      }
      
      protected function blurMotionFinish(param1:Object) : void
      {
         param1.clip.filters = [];
         if(this.isShow == false)
         {
            param1.clip.visible = false;
         }
         this.tweensFinished++;
         if(3 * this.tweensNumber == this.tweensFinished)
         {
            this.clearProperties();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function get randomX() : Number
      {
         return this._randomX;
      }
      
      public function get randomY() : Number
      {
         return this._randomY;
      }
      
      public function set maxScaleAmount(param1:Number) : void
      {
         this._maxScaleAmount = param1;
      }
   }
}
