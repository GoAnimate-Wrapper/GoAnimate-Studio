package com.jumpeye.flashEff2.text.smartSlide
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   
   public class FETSmartSlide extends IFlashEffText
   {
       
      
      private var newDelay:Number;
      
      private var finalxscale;
      
      private var _positionX:Number = 200;
      
      private var _positionY:Number = 0;
      
      private var objMatrix:Array;
      
      private var _alphaPercentage:Number = 45;
      
      private var _maxScale:Number = 1;
      
      private var finalyscale;
      
      private var finalDuration:Number;
      
      private var finalxposition;
      
      private var finalyposition:Number;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1;
      
      private var _preset:Number = 14;
      
      public function FETSmartSlide(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      protected function scaleTween(param1:Object, param2:Sprite, param3:Number) : *
      {
         param2.scaleX = param1.finalscalex - (param1.finalscalex - param1.startscalex) * Math.abs(1 - param3);
         param2.scaleY = param1.finalscaley - (param1.finalscaley - param1.startscaley) * Math.abs(1 - param3);
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
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeInOut";
         this.owner = {};
      }
      
      public function set maxScale(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 1;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         this._maxScale = param1;
      }
      
      public function get maxScale() : Number
      {
         return this._maxScale;
      }
      
      public function get positionX() : Number
      {
         return this._positionX;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      protected function coordonateTween(param1:Object, param2:Sprite, param3:Number) : *
      {
         param2.x = param1.finalx - (param1.finalx - param1.startx) * Math.abs(1 - param3);
         param2.y = param1.finaly - (param1.finaly - param1.starty) * Math.abs(1 - param3);
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
      
      public function set positionX(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 50;
         }
         this._positionX = param1;
      }
      
      protected function motionFinish(param1:*, param2:*, param3:*) : void
      {
         if(param3 == false)
         {
            param2.visible = false;
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
      
      protected function clearProperties() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:* = undefined;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         if(owner is Object)
         {
            if(owner.elements is Array)
            {
               _loc1_ = owner.elements.length;
               _loc2_ = 0;
               while(_loc2_ < _loc1_)
               {
                  _loc4_ = owner.elements[_loc2_].length;
                  _loc3_ = 0;
                  while(_loc3_ < _loc4_)
                  {
                     _loc5_ = owner.elements[_loc2_][_loc3_];
                     _loc5_.clip = objMatrix[_loc2_][_loc3_];
                     TweenLite.killTweensOf(_loc5_.clip,false);
                     TweenLite.killTweensOf(_loc5_.clip,false);
                     _loc3_++;
                  }
                  _loc2_++;
               }
            }
         }
         delete owner.elements;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         var _loc6_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:Object = null;
         var _loc7_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc7_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         objMatrix = this.component.absMatrix;
         _loc4_ = JFETPreset.getPresetsArray(_loc7_.preset,objMatrix);
         _loc3_ = _loc4_.timeMatrix;
         owner.maxItems = _loc4_.maxItems;
         owner.tweensFinished = 0;
         _loc2_ = objMatrix.length;
         var _loc8_:uint = 0;
         var _loc9_:uint = 1;
         owner.timeDirection = 0;
         owner.show = param1;
         if(param1 == true)
         {
            _loc8_ = 1;
            _loc9_ = 0;
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
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc10_ = objMatrix[_loc5_].length;
            owner.elements[_loc5_] = [];
            _loc6_ = 0;
            while(_loc6_ < _loc10_)
            {
               _loc11_ = owner.elements[_loc5_][_loc6_] = {};
               _loc11_.clip = objMatrix[_loc5_][_loc6_];
               _loc11_.clip.alpha = Math.abs(1 - _loc8_);
               _loc11_.startscalex = _loc11_.clip.scaleX;
               _loc11_.finalscalex = _maxScale;
               _loc11_.startscaley = _loc11_.clip.scaleY;
               _loc11_.finalscaley = _maxScale;
               _loc11_.startx = _loc11_.clip.x;
               _loc11_.starty = _loc11_.clip.y;
               _loc11_.finalx = _loc11_.clip.x + _positionX;
               _loc11_.finaly = _loc11_.clip.y + _positionY;
               checkTransitionType(param1,_loc11_);
               _loc11_.duration = Math.max(this._groupDuration + owner.delay * (owner.maxItems - _loc3_[_loc5_][_loc6_] - 1),0);
               TweenLite.to(_loc11_.clip,_loc11_.duration,{
                  "x":Number(finalxposition),
                  "y":finalyposition,
                  "scaleX":finalxscale,
                  "scaleY":finalyscale,
                  "delay":_loc3_[_loc5_][_loc6_] * owner.delay,
                  "ease":this.easeFunc,
                  "onComplete":motionFinish,
                  "onCompleteParams":[_loc11_,_loc11_.clip,param1]
               });
               TweenLite.to(_loc11_.clip,_alphaPercentage * _loc11_.duration / 100,{
                  "alpha":Number(param1),
                  "delay":_loc3_[_loc5_][_loc6_] * owner.delay + newDelay,
                  "overwrite":false
               });
               _loc6_++;
            }
            _loc5_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function get positionY() : Number
      {
         return this._positionY;
      }
   }
}
