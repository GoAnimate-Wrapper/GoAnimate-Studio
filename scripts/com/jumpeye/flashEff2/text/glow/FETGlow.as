package com.jumpeye.flashEff2.text.glow
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   
   public class FETGlow extends IFlashEffText
   {
       
      
      private var newDelay:Number;
      
      private var _maxGlow:Number = 5;
      
      private var _alphaPercentage:Number = 10;
      
      private var _blurQuality:Number = 2;
      
      private var prop:Number = 0;
      
      private var _color:Number = 16777215;
      
      private var _maxBlurX:Number = 3;
      
      private var _maxBlurY:Number = 3;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1;
      
      private var _preset:Number = 2;
      
      public function FETGlow(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
         this.owner = {};
      }
      
      public function get maxGlow() : Number
      {
         return this._maxGlow;
      }
      
      public function get maxBlurX() : Number
      {
         return this._maxBlurX;
      }
      
      public function set color(param1:uint) : void
      {
         this._color = param1;
      }
      
      private function glowEffect(param1:Sprite, param2:uint, param3:Number, param4:Number, param5:Number, param6:uint = 2) : *
      {
         var _loc7_:GlowFilter = new GlowFilter(param2,1,param3,param4,param5,param6,false,false);
         param1.filters = [_loc7_];
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
         var _loc8_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc8_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc8_.preset,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         owner.maxItems = _loc5_.maxItems;
         owner.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         var _loc9_:uint = 0;
         var _loc10_:uint = 1;
         owner.timeDirection = 0;
         owner.show = param1;
         if(param1 == true)
         {
            _loc9_ = 1;
            _loc10_ = 0;
            owner.timeDirection = 1;
         }
         owner.tweensNumber = this.component.textTable.childs.length;
         if(owner.maxItems <= 1)
         {
            owner.delay = 0;
         }
         else
         {
            owner.delay = Math.max((this.tweenDuration - this.groupDuration) / (owner.maxItems - 1),0);
         }
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
               _loc12_.clip.alpha = Math.abs(1 - _loc9_);
               checkTransitionType(param1,_loc12_);
               TweenLite.to(_loc12_,this._groupDuration,{
                  "pos":prop,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "onUpdate":motionChange,
                  "onUpdateParams":[_loc12_,_loc12_.clip],
                  "onComplete":motionFinish,
                  "onCompleteParams":[_loc12_,_loc12_.clip]
               });
               TweenLite.to(_loc12_.clip,_alphaPercentage * this._groupDuration / 100,{
                  "alpha":Number(param1),
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay + newDelay,
                  "overwrite":false
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function set maxBlurY(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._maxBlurY = Number(Number(param1)) || Number(0);
      }
      
      private function checkTransitionType(param1:Boolean, param2:Object) : *
      {
         prop = Number(param1);
         if(param1 == false)
         {
            param2.pos = 1;
            newDelay = this._groupDuration - _alphaPercentage * this._groupDuration / 100;
         }
         else
         {
            param2.pos = 0;
            newDelay = 0;
         }
      }
      
      public function set maxBlurX(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._maxBlurX = Number(Number(param1)) || Number(0);
      }
      
      public function set maxGlow(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 5;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 10)
         {
            param1 = 10;
         }
         this._maxGlow = param1;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      private function motionFinish(param1:Object, param2:Sprite) : *
      {
         param1.clip.filters = [];
         if(show == false)
         {
            param1.clip.visible = false;
         }
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get preset() : Number
      {
         return this._preset;
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
                     TweenLite.killTweensOf(_loc6_.clip,false);
                     TweenLite.killTweensOf(_loc6_,false);
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
         }
         delete owner.elements;
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 100;
         }
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
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
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
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      private function motionChange(param1:Object, param2:Sprite) : *
      {
         var _loc3_:Number = Math.abs(Math.abs(2 * param1.pos - 1) - 1) * _maxGlow * 2;
         glowEffect(param1.clip,_color,_maxBlurX,_maxBlurY,_loc3_);
      }
   }
}
