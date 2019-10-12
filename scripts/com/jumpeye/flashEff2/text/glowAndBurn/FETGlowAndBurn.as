package com.jumpeye.flashEff2.text.glowAndBurn
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.effects.JGlow;
   import com.jumpeye.effects.JMaskDistort;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFERandomPreset;
   import com.jumpeye.transitions.TweenLite;
   
   public class FETGlowAndBurn extends IFlashEffText
   {
       
      
      private var _preset:Number;
      
      private var _glowColor:Number = 16777215;
      
      private var _blurQuality:Number = 2;
      
      private var prop:Number = 0;
      
      private var _glowAmount:Number = 15;
      
      private var _transitionsNumber:Number = 8;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 0.9;
      
      private var transitionType:String;
      
      public function FETGlowAndBurn(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      public function get glowAmount() : Number
      {
         return _glowAmount;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
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
      
      public function get glowColor() : uint
      {
         return this._glowColor;
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
         if(component)
         {
            if(owner.msk)
            {
               if(component.targetOwner.contains(owner.msk))
               {
                  component.targetOwner.visible = transitionType == "show";
                  TweenLite.killTweensOf(owner.msk,false);
                  component.targetOwner.cacheAsBitmap = false;
                  owner.msk.cacheAsBitmap = false;
                  component.textTable["mask"] = null;
                  owner.msk.cleanAll();
                  component.targetOwner.removeChild(owner.msk);
               }
            }
         }
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
                     if(owner["glow" + _loc3_ + "_" + _loc4_])
                     {
                        owner["glow" + _loc3_ + "_" + _loc4_] = null;
                     }
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
            delete owner.elements;
         }
      }
      
      public function get transitionsNumber() : Number
      {
         return _transitionsNumber;
      }
      
      private function motionFinish() : *
      {
         clearProperties();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      public function set glowColor(param1:uint) : void
      {
         this._glowColor = param1;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:Object = null;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         this.tweenDuration = groupDuration >= this.tweenDuration?Number(groupDuration):Number(this.tweenDuration);
         var _loc8_:Number = Number(Number(this.preset)) || Number(1);
         clearProperties();
         transitionType = !!param1?"show":"hide";
         if(Number(_loc8_) > 55)
         {
            _loc8_ = 1;
         }
         var _loc9_:String = "chars";
         component.targetOwner.visible = true;
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
         var _loc10_:* = "non_radial:)";
         var _loc11_:* = !!param1?"show":"hide";
         owner.msk = new JMaskDistort(_loc11_,_loc10_,component.targetOwner.getBounds(owner.targetOwner).width + 10,component.targetOwner.getBounds(owner.targetOwner).height + 10,7,3,{
            "blur":true,
            "blurX":5,
            "blurY":5
         });
         owner.msk.value = 100;
         component.targetOwner.addChild(owner.msk);
         owner.msk.x = component.targetOwner.getBounds(owner.targetOwner).x;
         owner.msk.y = component.targetOwner.getBounds(owner.targetOwner).y;
         component.textTable["cacheAsBitmap"] = true;
         owner.msk.cacheAsBitmap = true;
         component.textTable["mask"] = owner.msk;
         owner.msk.visible = false;
         TweenLite.to(owner.msk,this.tweenDuration,{
            "value":0,
            "onComplete":motionFinish,
            "ease":this.easeFunc,
            "overwrite":true
         });
         owner.elements = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc12_ = _loc2_[_loc6_].length;
            owner.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc12_)
            {
               _loc13_ = owner.elements[_loc6_][_loc7_] = {};
               _loc14_ = !!param1?glowAmount:0;
               _loc15_ = !!param1?0:glowAmount;
               _loc13_.clip = _loc2_[_loc6_][_loc7_];
               owner["glow" + _loc6_ + "_" + _loc7_] = new JGlow(_loc13_.clip,glowColor);
               owner["glow" + _loc6_ + "_" + _loc7_].value = _loc14_;
               _loc16_ = Math.max(_loc4_[_loc6_][_loc7_] * owner.delay,0);
               TweenLite.to(owner["glow" + _loc6_ + "_" + _loc7_],this.groupDuration,{
                  "value":_loc15_,
                  "delay":_loc16_,
                  "ease":this.easeFunc,
                  "overwrite":false
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
         this.owner = {};
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
   }
}
