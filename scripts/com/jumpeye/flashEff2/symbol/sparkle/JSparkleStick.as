package com.jumpeye.flashEff2.symbol.sparkle
{
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   
   public class JSparkleStick extends Sprite
   {
       
      
      public var sparkleObj:Object;
      
      public var emitters:Array;
      
      public var hig:Number;
      
      public var emittersCount:Number = 10;
      
      public var stick:Shape;
      
      public var wid;
      
      public var glowColor:uint = 16777215;
      
      public var orientation:String = "vertical";
      
      public var glowAmount:Number = 20;
      
      public function JSparkleStick(param1:* = null)
      {
         var _loc2_:* = undefined;
         super();
         for(_loc2_ in param1)
         {
            this[_loc2_] = param1[_loc2_];
         }
         this.createChildren();
      }
      
      private function getGlow(param1:*) : BitmapFilter
      {
         var _loc2_:Number = glowColor;
         var _loc3_:Number = 1;
         var _loc4_:Number = param1;
         var _loc5_:Number = param1;
         var _loc6_:Number = param1 / 3;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Number = BitmapFilterQuality.HIGH;
         return new GlowFilter(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc9_,_loc7_,_loc8_);
      }
      
      public function destroy() : void
      {
         var _loc1_:JSparkleEmitter = null;
         var _loc2_:* = undefined;
         for(_loc2_ in emitters)
         {
            _loc1_ = emitters[_loc2_];
            _loc1_.destroy();
            if(this.contains(_loc1_))
            {
               this.removeChild(_loc1_);
            }
            _loc1_ = null;
         }
      }
      
      public function startEffect() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in emitters)
         {
            emitters[_loc1_].startEmit();
         }
      }
      
      private function setGlow(param1:*, param2:*) : void
      {
         var _loc3_:* = this.getGlow(param2);
         param1.filters = [_loc3_];
      }
      
      public function stopEffect() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in emitters)
         {
            emitters[_loc1_].stopEmit();
         }
         TweenLite.to(stick,0.3,{
            "alpha":0,
            "delay":0,
            "overwrite":true
         });
      }
      
      private function createChildren() : void
      {
         var _loc2_:JSparkleEmitter = null;
         var _loc1_:uint = 0;
         emitters = [];
         stick = new Shape();
         stick.graphics.beginFill(glowColor,1);
         stick.graphics.drawRoundRect(0,0,wid,hig,60,30);
         stick.graphics.endFill();
         this.addChild(stick);
         sparkleObj.maxDistance = -sparkleObj.maxDistance;
         sparkleObj.yDifference = 40;
         var _loc3_:* = orientation == "vertical"?hig:wid;
         var _loc4_:* = orientation == "vertical"?wid:hig;
         var _loc5_:String = orientation == "vertical"?"x":"y";
         var _loc6_:String = orientation == "vertical"?"y":"x";
         var _loc7_:String = orientation == "vertical"?"width":"height";
         var _loc8_:* = orientation == "vertical"?"horizontal":"vertical";
         var _loc9_:uint = 0;
         var _loc10_:Number = emittersCount == 0?Number(1):Number(emittersCount);
         _loc9_ = _loc10_ > 2?uint(_loc3_ / ((_loc10_ - 2) / 2)):uint(_loc3_ / (_loc10_ / 2));
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            _loc2_ = new JSparkleEmitter(sparkleObj);
            if(emittersCount != 0)
            {
               this.addChild(_loc2_);
            }
            _loc2_[_loc5_] = -_loc2_[_loc7_];
            _loc2_[_loc6_] = _loc1_;
            _loc2_.orientation = _loc8_;
            emitters.push(_loc2_);
            _loc1_ = _loc1_ + _loc9_;
         }
         sparkleObj.maxDistance = -sparkleObj.maxDistance;
         if(emittersCount >= 2)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc3_)
            {
               _loc2_ = new JSparkleEmitter(sparkleObj);
               this.addChild(_loc2_);
               _loc2_[_loc5_] = _loc4_;
               _loc2_[_loc6_] = _loc1_;
               _loc2_.orientation = _loc8_;
               emitters.push(_loc2_);
               _loc1_ = _loc1_ + _loc9_;
            }
         }
         this.setGlow(stick,glowAmount);
         TweenLite.to(stick,sparkleObj.particleLifespan,{
            "alpha":0,
            "delay":sparkleObj.emitterLifespan - sparkleObj.particleLifespan,
            "overwrite":true
         });
      }
   }
}
