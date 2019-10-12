package com.jumpeye.particle
{
   import flash.display.Shape;
   
   public class JParticle extends Shape
   {
       
      
      public var color:uint = 16777215;
      
      public function JParticle(param1:* = null)
      {
         var _loc2_:* = undefined;
         super();
         for(_loc2_ in param1)
         {
            this[_loc2_] = param1[_loc2_];
         }
         this.drawParticle();
      }
      
      public function drawParticle() : void
      {
         graphics.beginFill(color,1);
         graphics.drawCircle(10,10,10);
         graphics.endFill();
      }
      
      public function destroy() : void
      {
         graphics.clear();
      }
   }
}
