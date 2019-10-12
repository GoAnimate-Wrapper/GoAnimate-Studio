package com.jumpeye.flashEff2.text.xyscale
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   
   public class FETXYScale extends IFlashEffText
   {
       
      
      private var _maxScale:Number = 3;
      
      private var _maxBlurX:Number = 20;
      
      private var _maxBlurY:Number = 20;
      
      private var _groupDuration:Number = 0.9;
      
      private var newDelay:Number;
      
      private var finalxscale;
      
      protected var owner:Object;
      
      private var _positionX:Number = -10;
      
      private var _positionY:Number = 80;
      
      private var _alphaPercentage:Number = 90;
      
      private var _blurQuality:Number = 2;
      
      private var finalyscale;
      
      private var finalxposition;
      
      private var finalyposition:Number;
      
      private var _preset:Number = 18;
      
      public function FETXYScale(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function set maxScale(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 3;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 3)
         {
            param1 = 3;
         }
         this._maxScale = param1;
      }
      
      protected function coordonateTween(param1:Object, param2:Sprite, param3:Number) : *
      {
         param2.x = param1.finalx - (param1.finalx - param1.startx) * Math.abs(1 - param3);
         param2.y = param1.finaly - (param1.finaly - param1.starty) * Math.abs(1 - param3);
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
         this.owner = {};
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function set positionX(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 50;
         }
         this._positionX = param1;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function set positionY(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 50;
         }
         this._positionY = param1;
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
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = Number(Number(param1)) || Number(1);
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      protected function scaleTween(param1:Object, param2:Sprite, param3:Number) : *
      {
         param2.scaleX = param1.finalscalex - (param1.finalscalex - param1.startscalex) * Math.abs(1 - param3);
         param2.scaleY = param1.finalscaley - (param1.finalscaley - param1.startscaley) * Math.abs(1 - param3);
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get maxScale() : Number
      {
         return this._maxScale;
      }
      
      public function get positionX() : Number
      {
         return this._positionX;
      }
      
      private function checkTransitionType(param1:Boolean, param2:Object) : *
      {
         if(param1 == false)
         {
            finalxposition = param2.finalx;
            finalyposition = param2.finaly;
            finalxscale = param2.finalscalex;
            finalyscale = param2.finalscaley;
            newDelay = this._groupDuration - _alphaPercentage * this._groupDuration / 100;
         }
         else
         {
            finalxposition = param2.startx;
            finalyposition = param2.starty;
            finalxscale = param2.startscalex;
            finalyscale = param2.startscaley;
            newDelay = 0;
            param2.clip.x = param2.finalx;
            param2.clip.y = param2.finaly;
            param2.clip.scaleX = param2.finalscalex;
            param2.clip.scaleY = param2.finalscaley;
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
               _loc12_.startscalex = _loc12_.clip.scaleX;
               _loc12_.finalscalex = _maxScale;
               _loc12_.startscaley = _loc12_.clip.scaleY;
               _loc12_.finalscaley = _maxScale;
               _loc12_.startx = _loc12_.clip.x;
               _loc12_.starty = _loc12_.clip.y;
               _loc12_.finalx = _loc12_.clip.x + _positionX;
               _loc12_.finaly = _loc12_.clip.y + _positionY;
               checkTransitionType(param1,_loc12_);
               TweenLite.to(_loc12_.clip,this._groupDuration,{
                  "x":Number(finalxposition),
                  "y":finalyposition,
                  "scaleX":finalxscale,
                  "scaleY":finalyscale,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc
               });
               TweenLite.to(_loc12_.clip,_alphaPercentage * this._groupDuration / 100,{
                  "alpha":Number(param1),
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay + newDelay,
                  "overwrite":false,
                  "onComplete":motionFinished,
                  "onCompleteParams":[_loc12_,_loc12_.clip]
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      protected function motionFinished(param1:*, param2:*) : void
      {
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
                     TweenLite.killTweensOf(_loc6_.clip,false);
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
         }
         delete owner.elements;
      }
      
      public function get positionY() : Number
      {
         return this._positionY;
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
