package anifire.bubble
{
   import flash.geom.Point;
   
   public class Circle extends Point
   {
       
      
      private var _r:Number = 0.0;
      
      public function Circle(param1:Number = 0.0, param2:Number = 0.0, param3:Number = 0.0)
      {
         super(param1,param2);
         this._r = param3;
      }
      
      public function get r() : Number
      {
         return this._r;
      }
      
      public function set r(param1:Number) : void
      {
         this._r = param1;
      }
      
      public function get d() : Number
      {
         return this._r * 2;
      }
      
      public function set d(param1:Number) : void
      {
         this._r = param1 / 2;
      }
      
      public function get point() : Point
      {
         return new Point(this.x,this.y);
      }
      
      public function set point(param1:Point) : void
      {
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function getArea() : Number
      {
         return this._r * this._r * Math.PI;
      }
      
      public function getPerimeter() : Number
      {
         return this._r * 2 * Math.PI;
      }
      
      override public function toString() : String
      {
         return "([center] x=" + this.x + ", y=" + this.y + ", r=" + this._r + ")";
      }
   }
}
