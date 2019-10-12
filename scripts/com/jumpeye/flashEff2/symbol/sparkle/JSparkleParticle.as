package com.jumpeye.flashEff2.symbol.sparkle
{
   import com.jumpeye.particle.JParticle;
   
   public class JSparkleParticle extends JParticle
   {
       
      
      public var alphaInt:Number;
      
      private var __sizeAmount:Number = 0;
      
      public function JSparkleParticle(param1:* = null)
      {
         super(param1);
      }
      
      public function get sizeAmount() : Number
      {
         return __sizeAmount;
      }
      
      public function set sizeAmount(param1:Number) : void
      {
         __sizeAmount = param1;
         this.width = this.height = param1;
      }
   }
}
