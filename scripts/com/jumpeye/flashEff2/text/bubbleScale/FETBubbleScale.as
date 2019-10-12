package com.jumpeye.flashEff2.text.bubbleScale
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   
   public class FETBubbleScale extends IFlashEffText
   {
       
      
      private var _maxBlurX:Number = 25;
      
      private var _maxBlurY:Number = 25;
      
      private var _groupDuration:Number = 0.5;
      
      protected var owner:Object;
      
      private var newDelay:Number;
      
      private var finalxscale;
      
      private var _maxScaleX:Number = 5;
      
      private var _maxScaleY:Number = 5;
      
      private var _blurQuality:Number = 2;
      
      private var prop:Number = 0;
      
      private var finalyscale;
      
      private var finalxposition;
      
      private var finalyposition:Number;
      
      private var _preset:Number = 19;
      
      public function FETBubbleScale(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function coordonateTween(param1:Object, param2:Sprite, param3:Number) : *
      {
         if(param3 < 1)
         {
            param2.x = param1.finalx - (param1.finalx - param1.startx) * Math.abs(1 - param3);
            param2.y = param1.finaly - (param1.finaly - param1.starty) * Math.abs(1 - param3);
         }
         else
         {
            param2.x = param1.finalx - (param1.finalx - param1.start2x) * Math.abs(1 - param3);
            param2.y = param1.finaly - (param1.finaly - param1.start2y) * Math.abs(1 - param3);
         }
      }
      
      protected function motionChange(param1:*, param2:*) : *
      {
         scaleTween(param1,param2,param1.pos);
         coordonateTween(param1,param2,param1.pos);
         var _loc3_:* = maxBlurX * (2 - param1.pos);
         var _loc4_:* = maxBlurY * (2 - param1.pos);
         blurEffect(param2,_loc3_,_loc4_);
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeInOut";
         this.owner = {};
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function set maxBlurX(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 20;
         }
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
      
      public function set maxBlurY(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 20;
         }
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
      
      public function set maxScaleX(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 1;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 5)
         {
            param1 = 5;
         }
         this._maxScaleX = param1;
      }
      
      public function set maxScaleY(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 1;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 5)
         {
            param1 = 5;
         }
         this._maxScaleY = param1;
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
      
      protected function scaleTween(param1:Object, param2:Sprite, param3:Number) : *
      {
         if(param3 < 1)
         {
            param2.scaleX = param1.finalscalex - (param1.finalscalex - param1.startscalex) * Math.abs(1 - param3);
            param2.scaleY = param1.finalscaley - (param1.finalscaley - param1.startscaley) * Math.abs(1 - param3);
         }
         else
         {
            param2.scaleX = param1.finalscalex - (param1.finalscalex - param1.start2scalex) * Math.abs(1 - param3);
            param2.scaleY = param1.finalscaley - (param1.finalscaley - param1.start2scaley) * Math.abs(1 - param3);
         }
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
      
      protected function motionFinished(param1:*, param2:*) : void
      {
         param1.clip.filters = [];
         if(owner.show == false)
         {
            param1.clip.visible = false;
         }
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function get maxScaleX() : Number
      {
         return this._maxScaleX;
      }
      
      public function get maxBlurY() : Number
      {
         return this._maxBlurY;
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
               _loc12_.startscalex = 0;
               _loc12_.finalscalex = this.maxScaleX;
               _loc12_.startscaley = 0;
               _loc12_.finalscaley = this.maxScaleY;
               _loc12_.start2scalex = 1;
               _loc12_.start2scaley = 1;
               _loc12_.start2x = _loc12_.clip.x;
               _loc12_.start2y = _loc12_.clip.y;
               _loc12_.startx = _loc12_.clip.x + _loc12_.clip.width / 2;
               _loc12_.starty = _loc12_.clip.y + _loc12_.clip.height / 2;
               _loc12_.finalx = _loc12_.startx - _loc12_.clip.width * _loc12_.finalscalex / 2;
               _loc12_.finaly = _loc12_.starty - _loc12_.clip.height * _loc12_.finalscaley / 2;
               checkTransitionType(param1,_loc12_);
               TweenLite.to(_loc12_,this._groupDuration,{
                  "pos":prop,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "onUpdate":motionChange,
                  "onUpdateParams":[_loc12_,_loc12_.clip],
                  "onComplete":motionFinished,
                  "onCompleteParams":[_loc12_,_loc12_.clip]
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      private function checkTransitionType(param1:Boolean, param2:Object) : *
      {
         if(Number(param1) == 1)
         {
            prop = 2;
         }
         else
         {
            prop = 0;
         }
         if(param1 == false)
         {
            param2.pos = 2;
         }
         else
         {
            param2.pos = 0;
            param2.clip.x = param2.startx;
            param2.clip.y = param2.starty;
            param2.clip.scaleX = param2.startscalex;
            param2.clip.scaleY = param2.startscaley;
         }
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
                     _loc6_.clip.filter = [];
                     TweenLite.killTweensOf(_loc6_,false);
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
         }
         delete owner.elements;
      }
      
      public function get maxScaleY() : Number
      {
         return this._maxScaleY;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function blurEffect(param1:Object, param2:*, param3:*, param4:uint = 2) : *
      {
         var _loc5_:BitmapFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
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
