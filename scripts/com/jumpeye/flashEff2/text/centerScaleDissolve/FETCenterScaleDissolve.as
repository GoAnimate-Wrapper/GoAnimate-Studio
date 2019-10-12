package com.jumpeye.flashEff2.text.centerScaleDissolve
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFERandomPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class FETCenterScaleDissolve extends IFlashEffText
   {
       
      
      private var _scaleAmount:Number = 5;
      
      private var _preset:Number = 1;
      
      private var _blurQuality:Number = 2;
      
      private var _centerPositionDifference:Number = 70;
      
      private var prop:Number = 0;
      
      private var _transitionsNumber:Number = 25;
      
      private var _scalePercentageDuration:Number = 0.2;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 0.8;
      
      public function FETCenterScaleDissolve(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      public function get scaleAmount() : Number
      {
         return _scaleAmount;
      }
      
      public function set scaleAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 3;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 20)
         {
            param1 = 20;
         }
         this._scaleAmount = param1;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get centerPositionDifference() : Number
      {
         return _centerPositionDifference;
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
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      private function skewObject(param1:*, param2:*, param3:*) : void
      {
         var _loc4_:* = new Matrix();
         _loc4_.a = 1;
         _loc4_.b = param2;
         _loc4_.c = param3;
         _loc4_.d = 1;
         _loc4_.tx = param1.x;
         _loc4_.ty = param1.y;
         param1.transform.matrix = _loc4_;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.6;
         _tweenType = "Back";
         _easeType = "easeInOut";
         this.owner = {};
      }
      
      private function randRange(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:Object = null;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc20_:* = undefined;
         var _loc21_:* = undefined;
         var _loc22_:* = undefined;
         var _loc23_:* = undefined;
         var _loc24_:* = undefined;
         var _loc25_:* = undefined;
         var _loc26_:* = undefined;
         var _loc27_:* = undefined;
         var _loc28_:* = undefined;
         var _loc8_:Number = Number(Number(this.preset)) || Number(1);
         if(Number(_loc8_) > 55)
         {
            _loc8_ = 1;
         }
         var _loc9_:String = "chars";
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
            owner.delay = Math.max((this.tweenDuration - this.groupDuration) / ((owner.maxItems - 1) / transitionsNumber),0);
         }
         owner.delay = Math.max((this.tweenDuration - this.groupDuration) / ((owner.maxItems - 1) / transitionsNumber),0);
         owner.elements = [];
         var _loc10_:* = !!param1?0:groupDuration * (1 - scalePercentageDuration);
         var _loc11_:* = !!param1?groupDuration * scalePercentageDuration:0;
         component.targetOwner.getBounds(owner.targetOwner).x;
         var _loc12_:* = component.targetOwner.getBounds(owner.targetOwner);
         owner.initX = _loc12_.width / 2;
         owner.initY = _loc12_.height / 2;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc13_ = _loc2_[_loc6_].length;
            owner.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc13_)
            {
               _loc14_ = owner.elements[_loc6_][_loc7_] = {};
               _loc14_.clip = _loc2_[_loc6_][_loc7_];
               _loc15_ = _loc14_.clip.x;
               _loc16_ = _loc14_.clip.y;
               _loc17_ = Math.floor(Math.random() * 10);
               _loc18_ = !!param1?Math.pow(-1,_loc17_) * (randRange(50,100) / 100):0;
               _loc19_ = !!param1?0:Math.pow(-1,_loc17_) * (randRange(50,100) / 100);
               _loc14_.skew = _loc18_;
               TweenLite.to(_loc14_,this.groupDuration * scalePercentageDuration,{
                  "skew":_loc19_,
                  "delay":_loc10_ + _loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "onUpdate":skewChange,
                  "onUpdateParams":[_loc14_,_loc14_.clip],
                  "overwrite":false
               });
               _loc20_ = randRange(1,scaleAmount);
               _loc21_ = !!param1?_loc20_:1;
               _loc22_ = !!param1?1:_loc20_;
               _loc14_.scale = _loc21_;
               TweenLite.to(_loc14_,this.groupDuration * scalePercentageDuration,{
                  "scale":_loc22_,
                  "delay":_loc10_ + _loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "onUpdate":scaleChange,
                  "onUpdateParams":[_loc14_,_loc14_.clip],
                  "overwrite":false
               });
               _loc23_ = !!param1?0:1;
               _loc24_ = !!param1?1:0;
               _loc14_.clip.alpha = _loc23_;
               TweenLite.to(_loc14_.clip,this.groupDuration,{
                  "alpha":_loc24_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "onComplete":alphaFinish,
                  "onCompleteParams":[_loc14_,_loc14_.clip],
                  "overwrite":false
               });
               _loc25_ = !!param1?owner.initX + randRange(-centerPositionDifference,centerPositionDifference):_loc14_.clip.x;
               _loc26_ = !!param1?owner.initY + randRange(-centerPositionDifference,centerPositionDifference):_loc14_.clip.y;
               _loc14_.clip.x = _loc25_;
               _loc14_.clip.y = _loc26_;
               _loc27_ = !!param1?_loc15_:owner.initX + randRange(-centerPositionDifference,centerPositionDifference);
               _loc28_ = !!param1?_loc16_:owner.initY + randRange(-centerPositionDifference,centerPositionDifference);
               TweenLite.to(_loc14_.clip,this.groupDuration * (1 - scalePercentageDuration),{
                  "x":_loc27_,
                  "delay":_loc11_ + _loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "overwrite":false
               });
               TweenLite.to(_loc14_.clip,this.groupDuration * (1 - scalePercentageDuration),{
                  "y":_loc28_,
                  "delay":_loc11_ + _loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "overwrite":false
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
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
      
      private function scaleChange(param1:Object, param2:Sprite) : void
      {
         param2.scaleX = param2.scaleY = param1.scale;
      }
      
      public function get transitionsNumber() : Number
      {
         return _transitionsNumber;
      }
      
      private function skewChange(param1:Object, param2:Sprite) : void
      {
         skewObject(param2,param1.skew,param1.skew);
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function set scalePercentageDuration(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 20;
         }
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param1 > 99)
         {
            param1 = 99;
         }
         this._scalePercentageDuration = param1 / 100;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set centerPositionDifference(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 50;
         }
         this._centerPositionDifference = param1;
      }
      
      public function get scalePercentageDuration() : Number
      {
         return _scalePercentageDuration;
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
   }
}
