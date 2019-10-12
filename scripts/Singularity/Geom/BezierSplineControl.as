package Singularity.Geom
{
   import Singularity.Numeric.Consts;
   import flash.display.Shape;
   
   public class BezierSplineControl
   {
       
      
      public var CLOSED:Boolean;
      
      private var __bXNR:Number;
      
      private var __bYNR:Number;
      
      private var __bXNL:Number;
      
      private var __bYNL:Number;
      
      private var __pX:Number;
      
      private var __pY:Number;
      
      private var __dX1:Number;
      
      private var __dY1:Number;
      
      private var __dX2:Number;
      
      private var __dY2:Number;
      
      private var __d1:Number;
      
      private var __d2:Number;
      
      private var __tension:Number;
      
      private var __uX:Number;
      
      private var __uY:Number;
      
      private var __dist:Number;
      
      private var __cage:Array;
      
      private var __points:Array;
      
      private var __numPoints:uint;
      
      private var __tensionMap:Array;
      
      public function BezierSplineControl()
      {
         super();
         this.CLOSED = false;
         this.__points = new Array();
         this.__cage = new Array();
         this.__tensionMap = new Array();
         this.__bXNR = 0;
         this.__bYNR = 0;
         this.__bXNL = 0;
         this.__bYNL = 0;
         this.__pX = 0;
         this.__pY = 0;
         this.__dX1 = 0;
         this.__dY1 = 0;
         this.__dX2 = 0;
         this.__dY2 = 0;
         this.__d1 = 0;
         this.__d2 = 0;
         this.__uX = 0;
         this.__uY = 0;
         this.__dist = 0;
         this.__tension = 1;
         this.__numPoints = 0;
         this.__tensionMap[0] = 0.4;
         this.__tensionMap[1] = 0.3;
         this.__tensionMap[2] = 0.25;
         this.__tensionMap[3] = 0.175;
         this.__tensionMap[4] = 0.1;
      }
      
      public function get tension() : Number
      {
         return this.__tension;
      }
      
      public function set knots(param1:Array) : void
      {
         this.__points = param1;
      }
      
      public function set tension(param1:Number) : void
      {
         var _loc2_:Number = Math.round(param1);
         if(_loc2_ > 0 && _loc2_ < 6)
         {
            this.__tension = param1 - 1;
         }
      }
      
      public function getCage(param1:Number) : CubicCage
      {
         return this.__cage[param1];
      }
      
      public function construct() : void
      {
         var _loc1_:uint = this.__points.length - 1;
         this.__numPoints = this.__points.length;
         if(_loc1_ < 2)
         {
            return;
         }
         var _loc2_:uint = 0;
         while(_loc2_ < _loc1_)
         {
            if(this.__cage[_loc2_] == undefined)
            {
               this.__cage[_loc2_] = new CubicCage();
            }
            _loc2_++;
         }
         var _loc3_:Number = this.__tensionMap[this.__tension];
         if(this.CLOSED)
         {
            this.__leftClosed(_loc3_);
         }
         else
         {
            this.__left(_loc3_);
         }
         var _loc4_:uint = 1;
         while(_loc4_ < _loc1_ - 1)
         {
            this.__cageCoef(_loc4_,_loc3_);
            _loc4_++;
         }
         if(this.CLOSED)
         {
            this.__rightClosed(_loc3_);
         }
         else
         {
            this.__right(_loc3_);
         }
      }
      
      public function draw(param1:Shape, param2:Number) : void
      {
         var _loc3_:uint = 0;
         while(_loc3_ < this.__cage.length)
         {
            this.__cage[_loc3_].draw(param1,param2);
            _loc3_++;
         }
      }
      
      private function __cageCoef(param1:uint, param2:Number) : void
      {
         this.__getNormals(param1);
         var _loc3_:CubicCage = this.__cage[param1];
         _loc3_.P0X = this.__points[param1].X;
         _loc3_.P0Y = this.__points[param1].Y;
         _loc3_.P1X = this.__bXNL;
         _loc3_.P1Y = this.__bYNL;
         if(this.__dist > Consts.ZERO_TOL)
         {
            if(this.__isClockWise(this.__points,param1))
            {
               this.__CW(param1,param2);
            }
            else
            {
               this.__CCW(param1,param2);
            }
         }
         else
         {
            this.__bXNR = this.__points[param1].X + param2 * this.__dX1;
            this.__bYNR = this.__points[param1].Y + param2 * this.__dY1;
            this.__bXNL = this.__points[param1].X + param2 * this.__dX2;
            this.__bYNL = this.__points[param1].Y + param2 * this.__dY2;
         }
         _loc3_.P2X = this.__bXNR;
         _loc3_.P2Y = this.__bYNR;
         _loc3_.P3X = this.__points[param1 + 1].X;
         _loc3_.P3Y = this.__points[param1 + 1].Y;
      }
      
      private function __getNormals(param1:uint) : void
      {
         this.__dX1 = this.__points[param1].X - this.__points[param1 + 1].X;
         this.__dY1 = this.__points[param1].Y - this.__points[param1 + 1].Y;
         this.__d1 = Math.sqrt(this.__dX1 * this.__dX1 + this.__dY1 * this.__dY1);
         this.__dX1 = this.__dX1 / this.__d1;
         this.__dY1 = this.__dY1 / this.__d1;
         this.__dX2 = this.__points[param1 + 2].X - this.__points[param1 + 1].X;
         this.__dY2 = this.__points[param1 + 2].Y - this.__points[param1 + 1].Y;
         this.__d2 = Math.sqrt(this.__dX2 * this.__dX2 + this.__dY2 * this.__dY2);
         this.__dX2 = this.__dX2 / this.__d2;
         this.__dY2 = this.__dY2 / this.__d2;
         this.__uX = this.__dX1 + this.__dX2;
         this.__uY = this.__dY1 + this.__dY2;
         this.__dist = Math.sqrt(this.__uX * this.__uX + this.__uY * this.__uY);
         this.__uX = this.__uX / this.__dist;
         this.__uY = this.__uY / this.__dist;
      }
      
      private function __left(param1:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         this.__getNormals(0);
         if(this.__dist > Consts.ZERO_TOL)
         {
            if(this.__isClockWise(this.__points,0))
            {
               this.__CW(0,param1);
            }
            else
            {
               this.__CCW(0,param1);
            }
            _loc3_ = 0.5 * (this.__points[0].X + this.__points[1].X);
            _loc4_ = 0.5 * (this.__points[0].Y + this.__points[1].Y);
            _loc5_ = this.__points[0].X - _loc3_;
            _loc6_ = this.__points[0].Y - _loc4_;
            _loc7_ = 2 / this.__d1;
            _loc8_ = -_loc7_ * _loc6_;
            _loc9_ = _loc7_ * _loc5_;
            _loc10_ = _loc8_ * _loc8_ - _loc9_ * _loc9_;
            _loc11_ = 2 * _loc8_ * _loc9_;
            _loc12_ = _loc9_ * _loc9_ - _loc8_ * _loc8_;
            _loc13_ = this.__bXNR - _loc3_;
            _loc14_ = this.__bYNR - _loc4_;
            this.__pX = _loc3_ + _loc10_ * _loc13_ + _loc11_ * _loc14_;
            this.__pY = _loc4_ + _loc11_ * _loc13_ + _loc12_ * _loc14_;
         }
         else
         {
            this.__bXNR = this.__points[1].X + param1 * this.__dX1;
            this.__bYNR = this.__points[1].Y + param1 * this.__dY1;
            this.__bXNL = this.__points[1].X + param1 * this.__dX2;
            this.__bYNL = this.__points[1].Y + param1 * this.__dY2;
            this.__pX = this.__points[0].X + param1 * this.__dX1;
            this.__pY = this.__points[0].Y + param1 * this.__dY1;
         }
         var _loc2_:CubicCage = this.__cage[0];
         _loc2_.P0X = this.__points[0].X;
         _loc2_.P0Y = this.__points[0].Y;
         _loc2_.P1X = this.__pX;
         _loc2_.P1Y = this.__pY;
         _loc2_.P2X = this.__bXNR;
         _loc2_.P2Y = this.__bYNR;
         _loc2_.P3X = this.__points[1].X;
         _loc2_.P3Y = this.__points[1].Y;
      }
      
      private function __leftClosed(param1:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc2_:uint = this.__numPoints - 2;
         this.__dX1 = this.__points[_loc2_].X - this.__points[0].X;
         this.__dY1 = this.__points[_loc2_].Y - this.__points[0].Y;
         this.__d1 = Math.sqrt(this.__dX1 * this.__dX1 + this.__dY1 * this.__dY1);
         this.__dX1 = this.__dX1 / this.__d1;
         this.__dY1 = this.__dY1 / this.__d1;
         this.__dX2 = this.__points[1].X - this.__points[0].X;
         this.__dY2 = this.__points[1].Y - this.__points[0].Y;
         this.__d2 = Math.sqrt(this.__dX2 * this.__dX2 + this.__dY2 * this.__dY2);
         this.__dX2 = this.__dX2 / this.__d2;
         this.__dY2 = this.__dY2 / this.__d2;
         this.__uX = this.__dX1 + this.__dX2;
         this.__uY = this.__dY1 + this.__dY2;
         this.__dist = Math.sqrt(this.__uX * this.__uX + this.__uY * this.__uY);
         this.__uX = this.__uX / this.__dist;
         this.__uY = this.__uY / this.__dist;
         if(this.__dist > Consts.ZERO_TOL)
         {
            if((this.__points[1].Y - this.__points[_loc2_].Y) * (this.__points[0].X - this.__points[_loc2_].X) > (this.__points[0].Y - this.__points[_loc2_].Y) * (this.__points[1].X - this.__points[_loc2_].X))
            {
               _loc4_ = param1 * this.__d2;
               this.__bXNL = this.__points[0].X + _loc4_ * this.__uY;
               this.__bYNL = this.__points[0].Y - _loc4_ * this.__uX;
            }
            else
            {
               _loc4_ = param1 * this.__d2;
               this.__bXNL = this.__points[0].X - _loc4_ * this.__uY;
               this.__bYNL = this.__points[0].Y + _loc4_ * this.__uX;
            }
         }
         else
         {
            this.__bXNL = this.__points[0].X + param1 * this.__dX1;
            this.__bYNL = this.__points[0].Y + param1 * this.__dY1;
         }
         var _loc3_:CubicCage = this.__cage[0];
         _loc3_.P0X = this.__points[0].X;
         _loc3_.P0Y = this.__points[0].Y;
         _loc3_.P1X = this.__bXNL;
         _loc3_.P1Y = this.__bYNL;
         this.__getNormals(0);
         if(this.__dist > Consts.ZERO_TOL)
         {
            if(this.__isClockWise(this.__points,0))
            {
               this.__CW(0,param1);
            }
            else
            {
               this.__CCW(0,param1);
            }
         }
         else
         {
            this.__bXNR = this.__points[1].X + param1 * this.__dX1;
            this.__bYNR = this.__points[1].Y + param1 * this.__dY1;
            this.__bXNL = this.__points[1].X + param1 * this.__dX2;
            this.__bYNL = this.__points[1].Y + param1 * this.__dY2;
         }
         _loc3_.P2X = this.__bXNR;
         _loc3_.P2Y = this.__bYNR;
         _loc3_.P3X = this.__points[1].X;
         _loc3_.P3Y = this.__points[1].Y;
      }
      
      private function __right(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:CubicCage = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         try
         {
            _loc2_ = this.__points.length - 1;
            if(this.__dist > Consts.ZERO_TOL)
            {
               _loc4_ = 0.5 * (this.__points[_loc2_ - 1].X + this.__points[_loc2_].X);
               _loc5_ = 0.5 * (this.__points[_loc2_ - 1].Y + this.__points[_loc2_].Y);
               _loc6_ = this.__points[_loc2_].X - _loc4_;
               _loc7_ = this.__points[_loc2_].Y - _loc5_;
               _loc8_ = 2 / this.__d2;
               _loc9_ = -_loc8_ * _loc7_;
               _loc10_ = _loc8_ * _loc6_;
               _loc11_ = _loc9_ * _loc9_ - _loc10_ * _loc10_;
               _loc12_ = 2 * _loc9_ * _loc10_;
               _loc13_ = _loc10_ * _loc10_ - _loc9_ * _loc9_;
               _loc14_ = this.__bXNL - _loc4_;
               _loc15_ = this.__bYNL - _loc5_;
               this.__pX = _loc4_ + _loc11_ * _loc14_ + _loc12_ * _loc15_;
               this.__pY = _loc5_ + _loc12_ * _loc14_ + _loc13_ * _loc15_;
            }
            else
            {
               this.__pX = this.__points[_loc2_].X - param1 * this.__dX2;
               this.__pY = this.__points[_loc2_].Y - param1 * this.__dY2;
            }
            _loc3_ = this.__cage[_loc2_ - 1];
            _loc3_.P0X = this.__points[_loc2_ - 1].X;
            _loc3_.P0Y = this.__points[_loc2_ - 1].Y;
            _loc3_.P1X = this.__bXNL;
            _loc3_.P1Y = this.__bYNL;
            _loc3_.P2X = this.__pX;
            _loc3_.P2Y = this.__pY;
            _loc3_.P3X = this.__points[_loc2_].X;
            _loc3_.P3Y = this.__points[_loc2_].Y;
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function __rightClosed(param1:Number) : void
      {
         var _loc2_:Number = this.__numPoints - 1;
         var _loc3_:CubicCage = this.__cage[0];
         var _loc4_:CubicCage = this.__cage[_loc2_ - 1];
         _loc4_.P0X = this.__points[_loc2_ - 1].X;
         _loc4_.P0Y = this.__points[_loc2_ - 1].Y;
         _loc4_.P1X = this.__bXNL;
         _loc4_.P1Y = this.__bYNL;
         _loc4_.P2X = 2 * this.__points[0].X - _loc3_.P1X;
         _loc4_.P2Y = 2 * this.__points[0].Y - _loc3_.P1Y;
         _loc4_.P3X = this.__points[_loc2_].X;
         _loc4_.P3Y = this.__points[_loc2_].Y;
      }
      
      private function __CW(param1:int, param2:Number) : void
      {
         var _loc3_:Number = param2 * this.__d1;
         this.__bXNR = this.__points[param1 + 1].X - _loc3_ * this.__uY;
         this.__bYNR = this.__points[param1 + 1].Y + _loc3_ * this.__uX;
         _loc3_ = param2 * this.__d2;
         this.__bXNL = this.__points[param1 + 1].X + _loc3_ * this.__uY;
         this.__bYNL = this.__points[param1 + 1].Y - _loc3_ * this.__uX;
      }
      
      private function __CCW(param1:int, param2:Number) : void
      {
         var _loc3_:Number = param2 * this.__d2;
         this.__bXNL = this.__points[param1 + 1].X - _loc3_ * this.__uY;
         this.__bYNL = this.__points[param1 + 1].Y + _loc3_ * this.__uX;
         _loc3_ = param2 * this.__d1;
         this.__bXNR = this.__points[param1 + 1].X + _loc3_ * this.__uY;
         this.__bYNR = this.__points[param1 + 1].Y - _loc3_ * this.__uX;
      }
      
      private function __isClockWise(param1:Array, param2:Number) : Boolean
      {
         return (param1[param2 + 2].Y - param1[param2].Y) * (param1[param2 + 1].X - param1[param2].X) > (param1[param2 + 1].Y - param1[param2].Y) * (param1[param2 + 2].X - param1[param2].X);
      }
   }
}
