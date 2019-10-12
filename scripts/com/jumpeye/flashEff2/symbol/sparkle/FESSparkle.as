package com.jumpeye.flashEff2.symbol.sparkle
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.Events.JEvent;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import com.jumpeye.utils.JLineMask;
   
   public class FESSparkle extends IFlashEffSymbol
   {
       
      
      private var dim:Number;
      
      private var axe;
      
      private var _maximumParticleSize:Number = 5;
      
      private var transitionType:String;
      
      private var owner:Object;
      
      private var bounds:Object;
      
      private var _particleTweenDuration:Number = 0.5;
      
      private var isStopped:Boolean = false;
      
      private var _smooth:Boolean = false;
      
      private var _emitterSize:Number = 0;
      
      private var _maximumParticleSpread:Number = 60;
      
      private var axe2:String;
      
      private var _glowAmount:Number = 10;
      
      private var _glowColor:Number = 16777215;
      
      private var _particleEmissionInterval:Number = 0.2;
      
      private var _particleDiversity:Number = 25;
      
      private var _preset:Number = 1;
      
      public function FESSparkle(param1:JUIComponent = null)
      {
         owner = {};
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         if(target)
         {
            clearProperties();
            target.visible = true;
         }
      }
      
      public function set glowAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 20;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._glowAmount = param1;
      }
      
      private function motionChange() : void
      {
         var _loc1_:* = owner.msk.value;
         owner.spkStick[axe] = owner.msk[axe] + getSparklePosition(_loc1_);
      }
      
      public function get emitterSize() : Number
      {
         return _emitterSize;
      }
      
      public function get particleEmissionInterval() : Number
      {
         return _particleEmissionInterval;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeInOut";
      }
      
      public function set emitterSize(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 10;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._emitterSize = param1;
      }
      
      public function set particleEmissionInterval(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 0.2;
         }
         if(param1 <= 0)
         {
            param1 = 0.1;
         }
         this._particleEmissionInterval = param1;
      }
      
      private function getSparklePosition(param1:*) : Number
      {
         var _loc2_:* = 0;
         var _loc3_:* = preset == 1 || preset == 2?param1 + _loc2_:dim - param1 - _loc2_;
         var _loc4_:* = _loc3_;
         return _loc4_;
      }
      
      public function set glowColor(param1:uint) : void
      {
         this._glowColor = param1;
      }
      
      public function set maximumParticleSpread(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 150;
         }
         this._maximumParticleSpread = param1;
      }
      
      public function get particleTweenDuration() : Number
      {
         return _particleTweenDuration;
      }
      
      public function set preset(param1:Number) : void
      {
         if(param1 > 4 || param1 < 1)
         {
            param1 = 1;
         }
         this._preset = param1;
      }
      
      public function get glowAmount() : Number
      {
         return _glowAmount;
      }
      
      override public function hide() : void
      {
         startTransition("hide");
      }
      
      public function set maximumParticleSize(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 8;
         }
         this._maximumParticleSize = param1;
      }
      
      private function transition() : *
      {
         var _loc2_:String = null;
         var _loc1_:* = target.getBounds(target.parent);
         switch(preset)
         {
            default:
               _loc2_ = "left";
               break;
            case 2:
               _loc2_ = "top";
               break;
            case 3:
               _loc2_ = "right";
               break;
            case 4:
               _loc2_ = "bottom";
         }
         owner.msk = new JLineMask(target.width,target.height,_loc2_);
         component.targetOwner.addChild(owner.msk);
         owner.msk.x = _loc1_.x;
         owner.msk.y = _loc1_.y;
         target.mask = owner.msk;
         dim = preset == 1 || preset == 3?Number(target.width):Number(target.height);
         var _loc3_:* = transitionType == "show"?0:dim;
         var _loc4_:* = transitionType == "show"?dim:0;
         var _loc5_:* = {};
         _loc5_.particleObj = {};
         _loc5_.particleObj.color = glowColor;
         _loc5_.particleClass = JSparkleParticle;
         _loc5_.particleLifespan = Math.min(particleTweenDuration,tweenDuration - 0.01);
         _loc5_.particleEmissionInterval = Math.min(particleEmissionInterval,tweenDuration - 0.01);
         _loc5_.particleCount = 1;
         _loc5_.maxParticleSize = maximumParticleSize;
         _loc5_.isRandomInterval = true;
         _loc5_.showCross = false;
         _loc5_.easeFunc = this.easeFunc;
         _loc5_.maxDistance = this.maximumParticleSpread;
         _loc5_.yDifference = _loc5_.maxDistance / 3;
         _loc5_.glowAmount = glowAmount;
         _loc5_.glowColor = glowColor;
         _loc5_.emitterLifespan = tweenDuration;
         axe = preset == 1 || preset == 3?"x":"y";
         axe2 = preset == 1 || preset == 3?"y":"x";
         var _loc6_:* = {};
         _loc6_.wid = preset == 1 || preset == 3?emitterSize:target.width;
         _loc6_.hig = preset == 1 || preset == 3?target.height:emitterSize;
         _loc6_.sparkleObj = _loc5_;
         _loc6_.emittersCount = particleDiversity;
         _loc6_.glowAmount = glowAmount;
         _loc6_.glowColor = glowColor;
         _loc6_.orientation = preset == 1 || preset == 3?"vertical":"horizontal";
         owner.spkStick = new JSparkleStick(_loc6_);
         owner.spkStick[axe] = owner.msk[axe] + getSparklePosition(_loc3_);
         component.targetOwner.addChild(owner.spkStick);
         owner.spkStick.startEffect();
         owner.spkStick.emitters[0].addEventListener("emitFinished",emitFinished,false,0,true);
         owner.spkStick[axe2] = owner.msk[axe2];
         owner.msk.value = _loc3_;
         TweenLite.to(owner.msk,tweenDuration,{
            "value":_loc4_,
            "delay":0,
            "onUpdate":motionChange,
            "onComplete":motionFinish,
            "ease":this.easeFunc,
            "overwrite":false
         });
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get glowColor() : uint
      {
         return this._glowColor;
      }
      
      public function get maximumParticleSpread() : Number
      {
         return _maximumParticleSpread;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function clearProperties() : *
      {
         target.mask = null;
         if(owner.spkStick)
         {
            owner.spkStick.emitters[0].removeEventListener("emitFinished",emitFinished);
            owner.spkStick.destroy();
            if(component.targetOwner.contains(owner.msk))
            {
               component.targetOwner.removeChild(owner.spkStick);
            }
            owner.spkStick = null;
         }
         if(owner.msk)
         {
            if(component.targetOwner.contains(owner.msk))
            {
               TweenLite.killTweensOf(owner.msk,false);
               component.targetOwner.removeChild(owner.msk);
               owner.msk = null;
            }
         }
      }
      
      private function emitFinished(param1:JEvent) : void
      {
         target.visible = transitionType == "hide"?false:true;
         clearProperties();
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
      }
      
      public function get maximumParticleSize() : Number
      {
         return _maximumParticleSize;
      }
      
      private function motionFinish() : void
      {
      }
      
      public function set particleDiversity(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 20;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._particleDiversity = param1;
      }
      
      public function set particleTweenDuration(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 0.6;
         }
         if(param1 < 0.1)
         {
            param1 = 0.1;
         }
         this._particleTweenDuration = param1;
      }
      
      public function get particleDiversity() : Number
      {
         return _particleDiversity;
      }
      
      private function startTransition(param1:String) : *
      {
         isStopped = false;
         transitionType = param1;
         clearProperties();
         bounds = target.getBounds(target.parent);
         var _loc2_:* = target.getBounds(target);
         owner["targetObj"] = {
            "x":target.x,
            "y":target.y,
            "width":_loc2_.width * target.scaleX,
            "height":_loc2_.height * target.scaleY,
            "scaleX":target.scaleX,
            "scaleY":target.scaleY,
            "xMin":_loc2_.x,
            "yMin":_loc2_.y
         };
         transition();
      }
      
      override public function show() : void
      {
         startTransition("show");
      }
   }
}
