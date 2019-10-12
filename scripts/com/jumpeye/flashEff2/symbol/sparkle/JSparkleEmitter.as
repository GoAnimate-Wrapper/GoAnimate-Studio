package com.jumpeye.flashEff2.symbol.sparkle
{
   import com.jumpeye.Events.JEvent;
   import com.jumpeye.particle.JEmitter;
   import com.jumpeye.transitions.TweenLite;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   
   public class JSparkleEmitter extends JEmitter
   {
       
      
      public var glowAmount:Number = 20;
      
      public var tweens:Object;
      
      public var maxParticleSize:Number = 10;
      
      public var glowColor:uint = 16777215;
      
      public var alphaDurationPercentage:Number = 0.6;
      
      public var yDifference:Number = 20;
      
      public var orientation:String = "horizontal";
      
      public var maxDistance:Number = 400;
      
      public function JSparkleEmitter(param1:* = null)
      {
         super(param1);
      }
      
      override public function startEffect(param1:*, param2:Boolean = false) : void
      {
         param1.sizeAmount = maxParticleSize;
         var _loc3_:* = particleLifespan;
         this.setGlow(param1,glowAmount);
         if(orientation == "horizontal")
         {
            TweenLite.to(param1,_loc3_,{
               "x":randRange(0,maxDistance),
               "delay":0,
               "overwrite":false,
               "onComplete":particleTweenFinish,
               "onCompleteParams":[param1,param2]
            });
            TweenLite.to(param1,_loc3_,{
               "y":randRange(-yDifference,yDifference),
               "delay":0,
               "overwrite":false
            });
         }
         else
         {
            TweenLite.to(param1,_loc3_,{
               "y":randRange(0,maxDistance),
               "delay":0,
               "overwrite":false,
               "onComplete":particleTweenFinish,
               "onCompleteParams":[param1,param2]
            });
            TweenLite.to(param1,_loc3_,{
               "x":randRange(-yDifference,yDifference),
               "delay":0,
               "overwrite":false
            });
         }
         TweenLite.to(param1,_loc3_ * alphaDurationPercentage,{
            "alpha":0,
            "delay":_loc3_ - _loc3_ * alphaDurationPercentage,
            "overwrite":false
         });
         TweenLite.to(param1,_loc3_ * alphaDurationPercentage,{
            "sizeAmount":0,
            "delay":_loc3_ - _loc3_ * alphaDurationPercentage,
            "overwrite":false
         });
      }
      
      private function getGlow(param1:*) : BitmapFilter
      {
         var _loc2_:Number = glowColor;
         var _loc3_:Number = 1;
         var _loc4_:Number = param1;
         var _loc5_:Number = param1;
         var _loc6_:Number = param1;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Number = BitmapFilterQuality.HIGH;
         return new GlowFilter(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc9_,_loc7_,_loc8_);
      }
      
      private function setGlow(param1:*, param2:*) : void
      {
         var _loc3_:* = this.getGlow(param2);
         param1.filters = [_loc3_];
      }
      
      override public function clearParticle(param1:*) : void
      {
         TweenLite.killTweensOf(param1,false);
         param1.filters = [];
         super.clearParticle(param1);
      }
      
      private function particleTweenFinish(param1:*, param2:Boolean = false) : void
      {
         var _loc3_:* = undefined;
         if(param2)
         {
            _loc3_ = new JEvent("emitFinished");
            dispatchEvent(_loc3_);
         }
         this.clearParticle(param1);
      }
   }
}
