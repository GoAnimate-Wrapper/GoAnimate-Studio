package com.jumpeye.particle
{
   import flash.display.Sprite;
   import flash.utils.clearInterval;
   import flash.utils.getDefinitionByName;
   import flash.utils.setInterval;
   
   public class JEmitter extends Sprite
   {
       
      
      private var cross:Sprite;
      
      public var showCross:Boolean = false;
      
      private var createdIntervals:Number;
      
      private var endTime;
      
      public var particleObj;
      
      public var particleClass;
      
      private var eventDispatched:Boolean;
      
      public var emitterLifespan:Number = 10;
      
      private var inte;
      
      public var particleEmissionInterval:Number = 0.1;
      
      private var ind;
      
      public var easeFunc:Function;
      
      public var inteArr:Array;
      
      public var particles:Array;
      
      public var particleCount:Number = 1;
      
      private var totalTime:Number;
      
      public var isRandomInterval:Boolean = true;
      
      public var particleLifespan:Number = 0.5;
      
      public var inde:Number = 0;
      
      public function JEmitter(param1:* = null)
      {
         var _loc2_:* = undefined;
         super();
         for(_loc2_ in param1)
         {
            this[_loc2_] = param1[_loc2_];
         }
         init();
         if(showCross)
         {
            cross = new getDefinitionByName("emitter")();
            this.addChild(cross);
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:* = undefined;
         stopEmit();
         var _loc2_:* = 0;
         while(_loc2_ <= this.numChildren - 1)
         {
            _loc1_ = this.getChildAt(_loc2_);
            if(_loc1_ is JParticle)
            {
               clearParticle(_loc1_);
            }
            else
            {
               this.removeChild(_loc1_);
               _loc1_ = null;
            }
            _loc2_++;
         }
      }
      
      public function clearParticle(param1:*) : void
      {
         param1.destroy();
         if(this.contains(param1))
         {
            this.removeChild(param1);
         }
         param1 = null;
      }
      
      public function stopEmit() : void
      {
         clearInterval(inte);
      }
      
      public function randRange(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      private function startInterval() : void
      {
         if(inteArr[ind])
         {
            inte = setInterval(createParticle,inteArr[ind] * 1000,inteArr[ind]);
            ind++;
         }
      }
      
      public function createParticle(param1:Number = 0) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:Boolean = false;
         this.stopEmit();
         this.startInterval();
         totalTime = totalTime + param1;
         var _loc3_:* = 0;
         while(_loc3_ <= particleCount - 1)
         {
            if(createdIntervals == inteArr.length - 1 && !eventDispatched)
            {
               _loc2_ = true;
               eventDispatched = true;
            }
            else
            {
               _loc2_ = false;
               eventDispatched = false;
            }
            _loc4_ = new particleClass(particleObj);
            _loc4_.cacheAsBitmap = true;
            startEffect(_loc4_,_loc2_);
            this.addChild(_loc4_);
            _loc3_++;
         }
         createdIntervals++;
      }
      
      public function startEmit() : void
      {
         init();
         startInterval();
      }
      
      public function startEffect(param1:*, param2:Boolean = false) : void
      {
      }
      
      public function endEffect(param1:*) : void
      {
         clearInterval(param1.inte);
         clearParticle(param1);
      }
      
      public function test() : *
      {
         stopEmit();
         var _loc1_:* = 0;
         while(_loc1_ <= this.numChildren - 1)
         {
            trace("c " + this.getChildAt(_loc1_));
            _loc1_++;
         }
      }
      
      private function init() : void
      {
         ind = 0;
         createdIntervals = 0;
         eventDispatched = false;
         particles = [];
         totalTime = 0;
         inteArr = [];
         var _loc1_:* = particleEmissionInterval;
         while(totalTime + particleLifespan < emitterLifespan)
         {
            if(isRandomInterval)
            {
               _loc1_ = randRange(particleEmissionInterval * 70,particleEmissionInterval * 100);
               _loc1_ = _loc1_ / 100;
            }
            inteArr.push(_loc1_);
            totalTime = totalTime + _loc1_;
         }
         inteArr[inteArr.length - 1] = emitterLifespan - particleLifespan - (totalTime - inteArr[inteArr.length - 1]);
         totalTime = 0;
         clearInterval(inte);
      }
   }
}
