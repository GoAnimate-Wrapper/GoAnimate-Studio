package Singularity.Geom
{
   import flash.display.Graphics;
   import flash.display.Shape;
   
   public class CubicCage
   {
       
      
      public var P0X:Number;
      
      public var P1X:Number;
      
      public var P2X:Number;
      
      public var P3X:Number;
      
      public var P0Y:Number;
      
      public var P1Y:Number;
      
      public var P2Y:Number;
      
      public var P3Y:Number;
      
      public function CubicCage()
      {
         super();
         this.init();
      }
      
      public function init() : void
      {
         this.P0X = 0;
         this.P1X = 0;
         this.P2X = 0;
         this.P3X = 0;
         this.P0Y = 0;
         this.P1Y = 0;
         this.P2Y = 0;
         this.P3Y = 0;
      }
      
      public function draw(param1:Shape, param2:Number) : void
      {
         var _loc3_:Graphics = param1.graphics;
         _loc3_.lineStyle(0,param2,100);
         _loc3_.moveTo(this.P0X,this.P0Y);
         _loc3_.lineTo(this.P1X,this.P1Y);
         _loc3_.lineTo(this.P2X,this.P2Y);
         _loc3_.lineTo(this.P3X,this.P3Y);
      }
   }
}
