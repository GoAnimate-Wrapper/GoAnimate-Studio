package anifire.util
{
   import flash.display.Graphics;
   import flash.geom.Point;
   
   public class Bezje2D
   {
       
      
      private var _point0:Point;
      
      private var _point1:Point;
      
      private var _control:Point;
      
      private var _length:Number;
      
      private var XY:Number;
      
      private var B:Number;
      
      private var C:Number;
      
      private var CS:Number;
      
      private var CS2:Number;
      
      private var INTG_0:Number;
      
      public function Bezje2D(param1:Point, param2:Point, param3:Point)
      {
         super();
         this.setPoints(param1,param2,param3);
      }
      
      public function f(param1:Number) : Point
      {
         var _loc2_:Number = 1 - param1;
         return new Point(this._point0.x * _loc2_ * _loc2_ + 2 * this._control.x * param1 * _loc2_ + this._point1.x * param1 * param1,this._point0.y * _loc2_ * _loc2_ + 2 * this._control.y * param1 * _loc2_ + this._point1.y * param1 * param1);
      }
      
      public function diff(param1:Number) : Point
      {
         return new Point(2 * (param1 * (this._point0.x + this._point1.x - 2 * this._control.x) - this._point0.x + this._control.x),2 * (param1 * (this._point0.y + this._point1.y - 2 * this._control.y) - this._point0.y + this._control.y));
      }
      
      public function integral(param1:Number) : Number
      {
         return this.integralBezje(param1) - this.INTG_0;
      }
      
      public function get length() : Number
      {
         return this._length;
      }
      
      private function integralInit() : void
      {
         var _loc1_:Number = this._point0.x + this._point1.x - 2 * this._control.x;
         var _loc2_:Number = this._point0.y + this._point1.y - 2 * this._control.y;
         var _loc3_:Number = -this._point0.x + this._control.x;
         var _loc4_:Number = -this._point0.y + this._control.y;
         if(_loc1_ == 0 && _loc2_ == 0)
         {
            this.XY = 0;
            this.B = 0;
            this.C = 0;
            this.CS = this.CS2 = 1;
            this._length = 0;
         }
         else
         {
            this.XY = _loc1_ * _loc1_ + _loc2_ * _loc2_;
            this.B = (_loc3_ * _loc1_ + _loc4_ * _loc2_) / this.XY;
            this.C = (_loc3_ * _loc3_ + _loc4_ * _loc4_) / this.XY - this.B * this.B;
            if(this.C > 1.0e-10)
            {
               this.CS = Math.sqrt(this.C);
               this.CS2 = 0;
            }
            else
            {
               this.C = 0;
               this.CS = this.CS2 = 1;
            }
            this.INTG_0 = this.integralBezje(0);
            this._length = this.integral(1);
         }
      }
      
      private function integralBezje(param1:Number) : Number
      {
         var _loc2_:Number = this.B + param1;
         var _loc3_:Number = Math.sqrt(_loc2_ * _loc2_ + this.C);
         return Math.sqrt(this.XY) * (_loc3_ * _loc2_ + this.C * Math.log((_loc2_ + _loc3_) / this.CS + this.CS2));
      }
      
      public function length2T(param1:Number, param2:Number = 0.1) : Number
      {
         if(param1 < 0 || param1 > this._length)
         {
            return Number.NaN;
         }
         return this.seekL(param1,param2);
      }
      
      private function seekL(param1:Number, param2:Number = 0.1, param3:Number = 0.5, param4:Number = 0.25) : Number
      {
         var _loc5_:Number = this.integral(param3);
         if(Math.abs(param1 - _loc5_) < param2)
         {
            return param3;
         }
         return this.seekL(param1,param2,_loc5_ < param1?Number(param3 + param4):Number(param3 - param4),param4 / 2);
      }
      
      public function draw(param1:Graphics) : void
      {
         param1.moveTo(this._point0.x,this._point0.y);
         param1.curveTo(this._control.x,this._control.y,this._point1.x,this._point1.y);
      }
      
      public function get point0() : Point
      {
         return this._point0.clone();
      }
      
      public function get point1() : Point
      {
         return this._point1.clone();
      }
      
      public function get control() : Point
      {
         return this._control.clone();
      }
      
      public function set point0(param1:Point) : void
      {
         this._point0 = param1;
         this.integralInit();
      }
      
      public function set point1(param1:Point) : void
      {
         this._point1 = param1;
         this.integralInit();
      }
      
      public function set control(param1:Point) : void
      {
         this._control = param1;
         this.integralInit();
      }
      
      public function setPoints(param1:Point, param2:Point, param3:Point) : void
      {
         this._point0 = param1;
         this._point1 = param2;
         this._control = param3;
         this.integralInit();
      }
   }
}
