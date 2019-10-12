package com.jumpeye.flashEff2.text.chasingWords
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFERandomPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BitmapFilterType;
   import flash.filters.GradientGlowFilter;
   
   public class FETChasingWords extends IFlashEffText
   {
       
      
      private var axe:String;
      
      private var _trailColor:Number = 16777215;
      
      private var _trailDistance:Number = 18;
      
      private var _transitionsNumber:Number = 10;
      
      private var _groupDuration:Number = 0.9;
      
      private var sign:Number;
      
      protected var owner:Object;
      
      private var angle;
      
      private var _blurQuality:Number = 2;
      
      private var _glowAmount:Number = 20;
      
      private var _positionDifference:Number = 90;
      
      private var _trailStrength:Number = 38;
      
      private var distance:Number = 0;
      
      private var _preset:Number = 1;
      
      public function FETChasingWords(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      public function get trailColor() : uint
      {
         return this._trailColor;
      }
      
      public function set glowAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 30;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._glowAmount = param1;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function set positionDifference(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 100;
         }
         this._positionDifference = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
         this.owner = {};
      }
      
      private function alphaFinish(param1:Object, param2:Sprite) : *
      {
         param1.clip.filters = [];
         if(show == false)
         {
            param1.clip.visible = false;
         }
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            clearProperties();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function get trailDistance() : Number
      {
         return _trailDistance;
      }
      
      private function glowChange(param1:Object, param2:Sprite) : *
      {
         var _loc3_:* = getMotionFilter(param1.glow,trailColor);
         param2.filters = [_loc3_];
      }
      
      public function get transitionsNumber() : Number
      {
         return _transitionsNumber;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set trailDistance(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 10;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._trailDistance = param1;
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
      
      private function getMotionFilter(param1:*, param2:*) : *
      {
         var _loc3_:Number = angle;
         var _loc4_:Array = [param2,param2];
         var _loc5_:Array = [0,1];
         var _loc6_:Array = [0,256];
         var _loc7_:Number = axe == "x"?Number(param1):Number(0);
         var _loc8_:Number = axe == "x"?Number(0):Number(param1);
         var _loc9_:Number = param1 / 5;
         var _loc10_:Number = BitmapFilterQuality.HIGH;
         var _loc11_:String = BitmapFilterType.OUTER;
         var _loc12_:Boolean = false;
         return new GradientGlowFilter(distance,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
      }
      
      public function get glowAmount() : Number
      {
         return _glowAmount;
      }
      
      public function get positionDifference() : Number
      {
         return _positionDifference;
      }
      
      public function set transitionsNumber(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 7;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._transitionsNumber = param1;
      }
      
      public function set trailStrength(param1:Number) : void
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
         this._trailStrength = param1;
      }
      
      private function axeChange(param1:Object, param2:Sprite) : void
      {
         param2[axe] = param1.ax;
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
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc8_:Number = Number(Number(this.preset)) || Number(1);
         if(Number(_loc8_) > 4)
         {
            _loc8_ = 1;
         }
         var _loc9_:String = "words";
         this.component.drawTextTable(_loc9_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFERandomPreset.getPresetsArray(1,_loc2_,transitionsNumber);
         _loc4_ = _loc5_.timeMatrix;
         owner.maxItems = _loc5_.maxItems;
         owner.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         owner.tweensNumber = this.component.textTable.childs.length;
         if(owner.maxItems <= 1)
         {
            owner.delay = 0;
         }
         else
         {
            owner.delay = Math.max((this.tweenDuration - groupDuration) / Math.ceil(owner.maxItems / transitionsNumber - 1),0);
         }
         axe = _loc8_ == 3 || _loc8_ == 4?"y":"x";
         angle = axe == "x"?0:90;
         sign = _loc8_ == 1 || _loc8_ == 3?Number(-1):Number(1);
         distance = !!param1?Number(trailDistance * sign):Number(-trailDistance * sign);
         owner.elements = [];
         var _loc10_:* = component.targetOwner.getBounds(component.targetOwner.parent);
         if(_loc8_ == 2)
         {
            positionDifference = positionDifference + target.textWidth;
         }
         if(_loc8_ == 4)
         {
            positionDifference = positionDifference + target.textHeight;
         }
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
               _loc13_ = _loc12_.clip[axe];
               _loc14_ = !!param1?0:1;
               _loc15_ = !!param1?1:0;
               _loc12_.clip.alpha = _loc14_;
               _loc16_ = !!param1?positionDifference * sign:_loc13_;
               _loc17_ = !!param1?_loc13_:positionDifference * sign;
               _loc12_.ax = _loc16_;
               TweenLite.to(_loc12_,this.groupDuration,{
                  "ax":_loc17_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "onUpdate":axeChange,
                  "onUpdateParams":[_loc12_,_loc12_.clip],
                  "ease":this.easeFunc,
                  "overwrite":false
               });
               _loc18_ = !!param1?trailStrength:0;
               _loc19_ = !!param1?0:trailStrength;
               _loc12_.glow = _loc18_;
               TweenLite.to(_loc12_,this.groupDuration,{
                  "glow":_loc19_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "onUpdate":glowChange,
                  "onUpdateParams":[_loc12_,_loc12_.clip],
                  "overwrite":false
               });
               TweenLite.to(_loc12_.clip,this.groupDuration,{
                  "alpha":_loc15_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "onComplete":alphaFinish,
                  "onCompleteParams":[_loc12_,_loc12_.clip],
                  "overwrite":false
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get trailStrength() : Number
      {
         return _trailStrength;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function set trailColor(param1:uint) : void
      {
         this._trailColor = param1;
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
