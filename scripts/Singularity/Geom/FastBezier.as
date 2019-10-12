package Singularity.Geom
{
   import Singularity.Numeric.Consts;
   import anifire.util.DashLine;
   import anifire.util.UtilDraw;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class FastBezier
   {
       
      
      private var __p0X:Number;
      
      private var __p0Y:Number;
      
      private var __p1X:Number;
      
      private var __p1Y:Number;
      
      private var __p2X:Number;
      
      private var __p2Y:Number;
      
      private var __p3X:Number;
      
      private var __p3Y:Number;
      
      private var __count:uint;
      
      private var __invalidate:Boolean;
      
      private var __coef:Cubic;
      
      private var __left1:Array;
      
      private var __left2:Array;
      
      private var __left1a:Array;
      
      private var __left2a:Array;
      
      private var __right1:Array;
      
      private var __right2:Array;
      
      private var __right1a:Array;
      
      private var __right2a:Array;
      
      private var __pX:Number;
      
      private var __pY:Number;
      
      private var __subdiv:Number;
      
      private var __t1:Number;
      
      private var __t2:Number;
      
      private var __t3:Number;
      
      public function FastBezier()
      {
         super();
         this.__p0X = 0;
         this.__p0Y = 0;
         this.__p1X = 0;
         this.__p1Y = 0;
         this.__p2X = 0;
         this.__p2Y = 0;
         this.__p3X = 0;
         this.__p3Y = 0;
         this.__pX = 0;
         this.__pY = 0;
         this.__t1 = 0;
         this.__t2 = 0;
         this.__t3 = 0;
         this.__subdiv = 3;
         this.__left1 = new Array();
         this.__right1 = new Array();
         this.__left2 = new Array();
         this.__right2 = new Array();
         this.__left1a = new Array();
         this.__right1a = new Array();
         this.__left2a = new Array();
         this.__right2a = new Array();
         this.__coef = new Cubic();
         this.__count = 0;
         this.__invalidate = true;
      }
      
      public function set subdivisions(param1:uint) : void
      {
         if(param1 == 1 || param1 == 2 || param1 == 3)
         {
            this.__subdiv = param1;
         }
      }
      
      public function addControlPoint(param1:Number, param2:Number) : void
      {
         switch(this.__count)
         {
            case 0:
               this.__p0X = param1;
               this.__p0Y = param2;
               this.__count++;
               break;
            case 1:
               this.__p1X = param1;
               this.__p1Y = param2;
               this.__count++;
               break;
            case 2:
               this.__p2X = param1;
               this.__p2Y = param2;
               this.__count++;
               break;
            case 3:
               this.__p3X = param1;
               this.__p3Y = param2;
               this.__count++;
         }
         this.__invalidate = true;
      }
      
      public function reset() : void
      {
         this.__p0X = 0;
         this.__p0Y = 0;
         this.__p1X = 0;
         this.__p1Y = 0;
         this.__p2X = 0;
         this.__p2Y = 0;
         this.__p3X = 0;
         this.__p3Y = 0;
         this.__invalidate = true;
         this.__count = 0;
         this.__coef.reset();
      }
      
      public function moveControlPoint(param1:uint, param2:Number, param3:Number) : void
      {
         switch(param1)
         {
            case 0:
               this.__p0X = param2;
               this.__p0Y = param3;
               break;
            case 1:
               this.__p1X = param2;
               this.__p1Y = param3;
               break;
            case 2:
               this.__p2X = param2;
               this.__p2Y = param3;
               break;
            case 3:
               this.__p3X = param2;
               this.__p3Y = param3;
         }
         this.__invalidate = true;
      }
      
      public function getX(param1:Number) : Number
      {
         var _loc2_:Number = param1;
         _loc2_ = _loc2_ < 0?Number(0):Number(_loc2_);
         _loc2_ = _loc2_ > 1?Number(1):Number(_loc2_);
         if(this.__invalidate)
         {
            this.__computeCoef();
         }
         return this.__coef.getX(_loc2_);
      }
      
      public function getY(param1:Number) : Number
      {
         var _loc2_:Number = param1;
         _loc2_ = _loc2_ < 0?Number(0):Number(_loc2_);
         _loc2_ = _loc2_ > 1?Number(1):Number(_loc2_);
         if(this.__invalidate)
         {
            this.__computeCoef();
         }
         return this.__coef.getY(_loc2_);
      }
      
      public function getXPrime(param1:Number) : Number
      {
         var _loc2_:Number = param1;
         _loc2_ = _loc2_ < 0?Number(0):Number(_loc2_);
         _loc2_ = _loc2_ > 1?Number(1):Number(_loc2_);
         if(this.__invalidate)
         {
            this.__computeCoef();
         }
         return this.__coef.getXPrime(_loc2_);
      }
      
      public function getYPrime(param1:Number) : Number
      {
         var _loc2_:Number = param1;
         _loc2_ = _loc2_ < 0?Number(0):Number(_loc2_);
         _loc2_ = _loc2_ > 1?Number(1):Number(_loc2_);
         if(this.__invalidate)
         {
            this.__computeCoef();
         }
         return this.__coef.getYPrime(_loc2_);
      }
      
      private function __split(param1:Number) : void
      {
         var _loc2_:Number = 1 - param1;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         var _loc14_:Number = 0;
         _loc3_ = _loc2_ * this.__p0X + param1 * this.__p1X;
         _loc4_ = _loc2_ * this.__p0Y + param1 * this.__p1Y;
         _loc5_ = _loc2_ * this.__p1X + param1 * this.__p2X;
         _loc6_ = _loc2_ * this.__p1Y + param1 * this.__p2Y;
         _loc7_ = _loc2_ * this.__p2X + param1 * this.__p3X;
         _loc8_ = _loc2_ * this.__p2Y + param1 * this.__p3Y;
         _loc9_ = _loc2_ * _loc3_ + param1 * _loc5_;
         _loc10_ = _loc2_ * _loc4_ + param1 * _loc6_;
         _loc11_ = _loc2_ * _loc5_ + param1 * _loc7_;
         _loc12_ = _loc2_ * _loc6_ + param1 * _loc8_;
         _loc13_ = _loc2_ * _loc9_ + param1 * _loc11_;
         _loc14_ = _loc2_ * _loc10_ + param1 * _loc12_;
         this.__setCoef(this.__left1,this.__right1,this.__p0X,this.__p0Y,_loc3_,_loc4_,_loc9_,_loc10_,_loc13_,_loc14_,_loc11_,_loc12_,_loc7_,_loc8_,this.__p3X,this.__p3Y);
         if(this.__subdiv == 2 || this.__subdiv == 3)
         {
            _loc3_ = 0.5 * this.__left1[0] + 0.5 * this.__left1[2];
            _loc4_ = 0.5 * this.__left1[1] + 0.5 * this.__left1[3];
            _loc5_ = 0.5 * this.__left1[2] + 0.5 * this.__left1[4];
            _loc6_ = 0.5 * this.__left1[3] + 0.5 * this.__left1[5];
            _loc7_ = 0.5 * this.__left1[4] + 0.5 * this.__left1[6];
            _loc8_ = 0.5 * this.__left1[5] + 0.5 * this.__left1[7];
            _loc9_ = 0.5 * _loc3_ + 0.5 * _loc5_;
            _loc10_ = 0.5 * _loc4_ + 0.5 * _loc6_;
            _loc11_ = 0.5 * _loc5_ + 0.5 * _loc7_;
            _loc12_ = 0.5 * _loc6_ + 0.5 * _loc8_;
            _loc13_ = 0.5 * _loc9_ + 0.5 * _loc11_;
            _loc14_ = 0.5 * _loc10_ + 0.5 * _loc12_;
            this.__setCoef(this.__left1,this.__left2,this.__left1[0],this.__left1[1],_loc3_,_loc4_,_loc9_,_loc10_,_loc13_,_loc14_,_loc11_,_loc12_,_loc7_,_loc8_,this.__left1[6],this.__left1[7]);
            _loc3_ = 0.5 * this.__right1[0] + 0.5 * this.__right1[2];
            _loc4_ = 0.5 * this.__right1[1] + 0.5 * this.__right1[3];
            _loc5_ = 0.5 * this.__right1[2] + 0.5 * this.__right1[4];
            _loc6_ = 0.5 * this.__right1[3] + 0.5 * this.__right1[5];
            _loc7_ = 0.5 * this.__right1[4] + 0.5 * this.__right1[6];
            _loc8_ = 0.5 * this.__right1[5] + 0.5 * this.__right1[7];
            _loc9_ = 0.5 * _loc3_ + 0.5 * _loc5_;
            _loc10_ = 0.5 * _loc4_ + 0.5 * _loc6_;
            _loc11_ = 0.5 * _loc5_ + 0.5 * _loc7_;
            _loc12_ = 0.5 * _loc6_ + 0.5 * _loc8_;
            _loc13_ = 0.5 * _loc9_ + 0.5 * _loc11_;
            _loc14_ = 0.5 * _loc10_ + 0.5 * _loc12_;
            this.__setCoef(this.__right1,this.__right2,this.__right1[0],this.__right1[1],_loc3_,_loc4_,_loc9_,_loc10_,_loc13_,_loc14_,_loc11_,_loc12_,_loc7_,_loc8_,this.__right1[6],this.__right1[7]);
         }
         if(this.__subdiv == 3)
         {
            _loc3_ = 0.5 * this.__left1[0] + 0.5 * this.__left1[2];
            _loc4_ = 0.5 * this.__left1[1] + 0.5 * this.__left1[3];
            _loc5_ = 0.5 * this.__left1[2] + 0.5 * this.__left1[4];
            _loc6_ = 0.5 * this.__left1[3] + 0.5 * this.__left1[5];
            _loc7_ = 0.5 * this.__left1[4] + 0.5 * this.__left1[6];
            _loc8_ = 0.5 * this.__left1[5] + 0.5 * this.__left1[7];
            _loc9_ = 0.5 * _loc3_ + 0.5 * _loc5_;
            _loc10_ = 0.5 * _loc4_ + 0.5 * _loc6_;
            _loc11_ = 0.5 * _loc5_ + 0.5 * _loc7_;
            _loc12_ = 0.5 * _loc6_ + 0.5 * _loc8_;
            _loc13_ = 0.5 * _loc9_ + 0.5 * _loc11_;
            _loc14_ = 0.5 * _loc10_ + 0.5 * _loc12_;
            this.__setCoef(this.__left1,this.__left1a,this.__left1[0],this.__left1[1],_loc3_,_loc4_,_loc9_,_loc10_,_loc13_,_loc14_,_loc11_,_loc12_,_loc7_,_loc8_,this.__left1[6],this.__left1[7]);
            _loc3_ = 0.5 * this.__right1[0] + 0.5 * this.__right1[2];
            _loc4_ = 0.5 * this.__right1[1] + 0.5 * this.__right1[3];
            _loc5_ = 0.5 * this.__right1[2] + 0.5 * this.__right1[4];
            _loc6_ = 0.5 * this.__right1[3] + 0.5 * this.__right1[5];
            _loc7_ = 0.5 * this.__right1[4] + 0.5 * this.__right1[6];
            _loc8_ = 0.5 * this.__right1[5] + 0.5 * this.__right1[7];
            _loc9_ = 0.5 * _loc3_ + 0.5 * _loc5_;
            _loc10_ = 0.5 * _loc4_ + 0.5 * _loc6_;
            _loc11_ = 0.5 * _loc5_ + 0.5 * _loc7_;
            _loc12_ = 0.5 * _loc6_ + 0.5 * _loc8_;
            _loc13_ = 0.5 * _loc9_ + 0.5 * _loc11_;
            _loc14_ = 0.5 * _loc10_ + 0.5 * _loc12_;
            this.__setCoef(this.__right1,this.__right1a,this.__right1[0],this.__right1[1],_loc3_,_loc4_,_loc9_,_loc10_,_loc13_,_loc14_,_loc11_,_loc12_,_loc7_,_loc8_,this.__right1[6],this.__right1[7]);
            _loc3_ = 0.5 * this.__left2[0] + 0.5 * this.__left2[2];
            _loc4_ = 0.5 * this.__left2[1] + 0.5 * this.__left2[3];
            _loc5_ = 0.5 * this.__left2[2] + 0.5 * this.__left2[4];
            _loc6_ = 0.5 * this.__left2[3] + 0.5 * this.__left2[5];
            _loc7_ = 0.5 * this.__left2[4] + 0.5 * this.__left2[6];
            _loc8_ = 0.5 * this.__left2[5] + 0.5 * this.__left2[7];
            _loc9_ = 0.5 * _loc3_ + 0.5 * _loc5_;
            _loc10_ = 0.5 * _loc4_ + 0.5 * _loc6_;
            _loc11_ = 0.5 * _loc5_ + 0.5 * _loc7_;
            _loc12_ = 0.5 * _loc6_ + 0.5 * _loc8_;
            _loc13_ = 0.5 * _loc9_ + 0.5 * _loc11_;
            _loc14_ = 0.5 * _loc10_ + 0.5 * _loc12_;
            this.__setCoef(this.__left2,this.__left2a,this.__left2[0],this.__left2[1],_loc3_,_loc4_,_loc9_,_loc10_,_loc13_,_loc14_,_loc11_,_loc12_,_loc7_,_loc8_,this.__left2[6],this.__left2[7]);
            _loc3_ = 0.5 * this.__right2[0] + 0.5 * this.__right2[2];
            _loc4_ = 0.5 * this.__right2[1] + 0.5 * this.__right2[3];
            _loc5_ = 0.5 * this.__right2[2] + 0.5 * this.__right2[4];
            _loc6_ = 0.5 * this.__right2[3] + 0.5 * this.__right2[5];
            _loc7_ = 0.5 * this.__right2[4] + 0.5 * this.__right2[6];
            _loc8_ = 0.5 * this.__right2[5] + 0.5 * this.__right2[7];
            _loc9_ = 0.5 * _loc3_ + 0.5 * _loc5_;
            _loc10_ = 0.5 * _loc4_ + 0.5 * _loc6_;
            _loc11_ = 0.5 * _loc5_ + 0.5 * _loc7_;
            _loc12_ = 0.5 * _loc6_ + 0.5 * _loc8_;
            _loc13_ = 0.5 * _loc9_ + 0.5 * _loc11_;
            _loc14_ = 0.5 * _loc10_ + 0.5 * _loc12_;
            this.__setCoef(this.__right2,this.__right2a,this.__right2[0],this.__right2[1],_loc3_,_loc4_,_loc9_,_loc10_,_loc13_,_loc14_,_loc11_,_loc12_,_loc7_,_loc8_,this.__right2[6],this.__right2[7]);
         }
      }
      
      private function __setCoef(param1:Array, param2:Array, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number, param15:Number, param16:Number) : void
      {
         param1[0] = param3;
         param1[1] = param4;
         param1[2] = param5;
         param1[3] = param6;
         param1[4] = param7;
         param1[5] = param8;
         param1[6] = param9;
         param1[7] = param10;
         param2[0] = param9;
         param2[1] = param10;
         param2[2] = param11;
         param2[3] = param12;
         param2[4] = param13;
         param2[5] = param14;
         param2[6] = param15;
         param2[7] = param16;
      }
      
      public function draw(param1:Sprite, param2:uint, param3:uint, param4:Boolean, param5:Number, param6:Number, param7:Number) : void
      {
         var _loc8_:Number = this.__inflect();
         if(_loc8_ == -1)
         {
            _loc8_ = 0.5;
         }
         this.__split(_loc8_);
         this.__plot(param1,param2,param3,param4,param5,param6,param7);
      }
      
      private function __inflect() : Number
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc1_:Number = -this.__p0X + 3 * (this.__p1X - this.__p2X) + this.__p3X;
         var _loc2_:Number = -this.__p0Y + 3 * (this.__p1Y - this.__p2Y) + this.__p3Y;
         var _loc3_:Number = 3 * (this.__p0X - 2 * this.__p1X + this.__p2X);
         var _loc4_:Number = 3 * (this.__p0Y - 2 * this.__p1Y + this.__p2Y);
         var _loc5_:Number = 3 * (this.__p1X - this.__p0X);
         var _loc6_:Number = 3 * (this.__p1Y - this.__p0Y);
         var _loc7_:Number = 1 / (_loc2_ * _loc3_ - _loc1_ * _loc4_);
         var _loc8_:Number = -0.5 * ((_loc2_ * _loc5_ - _loc1_ * _loc6_) * _loc7_);
         var _loc9_:Number = _loc8_ * _loc8_ - Consts.ONE_THIRD * ((_loc4_ * _loc5_ - _loc3_ * _loc6_) * _loc7_);
         if(_loc9_ < 0)
         {
            return -1;
         }
         _loc10_ = Math.sqrt(_loc9_);
         _loc11_ = _loc8_ - _loc10_;
         _loc12_ = _loc8_ + _loc10_;
         _loc11_ = _loc11_ > 0 && _loc11_ < 1?Number(_loc11_):Number(-1);
         _loc12_ = _loc12_ > 0 && _loc12_ < 1?Number(_loc12_):Number(-1);
         if(_loc11_ != -1 && _loc12_ != -1)
         {
            _loc13_ = Math.min(_loc11_,1 - _loc11_);
            _loc14_ = Math.min(_loc12_,1 - _loc12_);
            return _loc13_ < _loc14_?Number(_loc12_):Number(_loc11_);
         }
         return Math.max(_loc11_,_loc12_);
      }
      
      private function __plot(param1:Sprite, param2:uint, param3:uint, param4:Boolean, param5:Number, param6:Number, param7:Number) : void
      {
         var _loc8_:Point = null;
         param1.graphics.lineStyle(param2,param3);
         var _loc9_:DashLine = new DashLine(param1.graphics,param5,param6);
         switch(this.__subdiv)
         {
            case 1:
               this.__intersect(this.__left1);
               if(!param4)
               {
                  _loc9_.moveTo(this.__left1[0],this.__left1[1]);
               }
               _loc9_.curveTo(this.__pX,this.__pY,this.__left1[6],this.__left1[7]);
               _loc8_ = new Point(this.__pX,this.__pY);
               this.__intersect(this.__right1);
               _loc9_.curveTo(this.__pX,this.__pY,this.__right1[6],this.__right1[7]);
               UtilDraw.drawDashLineWithArrow(param1,_loc8_,new Point(this.__pX,this.__pY),param5,param6,param7);
               break;
            case 2:
               this.__intersect(this.__left1);
               if(!param4)
               {
                  _loc9_.moveTo(this.__left1[0],this.__left1[1]);
               }
               _loc9_.curveTo(this.__pX,this.__pY,this.__left1[6],this.__left1[7]);
               this.__intersect(this.__left2);
               _loc9_.curveTo(this.__pX,this.__pY,this.__left2[6],this.__left2[7]);
               this.__intersect(this.__right1);
               _loc9_.curveTo(this.__pX,this.__pY,this.__right1[6],this.__right1[7]);
               _loc8_ = new Point(this.__pX,this.__pY);
               this.__intersect(this.__right2);
               _loc9_.curveTo(this.__pX,this.__pY,this.__right2[6],this.__right2[7]);
               UtilDraw.drawDashLineWithArrow(param1,_loc8_,new Point(this.__pX,this.__pY),param5,param6,param7);
               break;
            case 3:
               this.__intersect(this.__left1);
               if(!param4)
               {
                  _loc9_.moveTo(this.__left1[0],this.__left1[1]);
               }
               _loc9_.curveTo(this.__pX,this.__pY,this.__left1[6],this.__left1[7]);
               this.__intersect(this.__left1a);
               _loc9_.curveTo(this.__pX,this.__pY,this.__left1a[6],this.__left1a[7]);
               this.__intersect(this.__left2);
               _loc9_.curveTo(this.__pX,this.__pY,this.__left2[6],this.__left2[7]);
               this.__intersect(this.__left2a);
               _loc9_.curveTo(this.__pX,this.__pY,this.__left2a[6],this.__left2a[7]);
               this.__intersect(this.__right1);
               _loc9_.curveTo(this.__pX,this.__pY,this.__right1[6],this.__right1[7]);
               this.__intersect(this.__right1a);
               _loc9_.curveTo(this.__pX,this.__pY,this.__right1a[6],this.__right1a[7]);
               this.__intersect(this.__right2);
               _loc9_.curveTo(this.__pX,this.__pY,this.__right2[6],this.__right2[7]);
               _loc8_ = new Point(this.__pX,this.__pY);
               this.__intersect(this.__right2a);
               _loc9_.curveTo(this.__pX,this.__pY,this.__right2a[6],this.__right2a[7]);
               UtilDraw.drawDashLineWithArrow(param1,_loc8_,new Point(this.__pX,this.__pY),param5,param6,param7);
         }
      }
      
      private function __intersect(param1:Array) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc2_:Number = param1[2] - param1[0];
         var _loc3_:Number = param1[4] - param1[6];
         var _loc4_:Number = Math.abs(_loc2_);
         var _loc5_:Number = Math.abs(_loc3_);
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         if(_loc4_ <= Consts.ZERO_TOL)
         {
            this.__pX = param1[0];
            _loc7_ = (param1[5] - param1[7]) / _loc3_;
            this.__pY = _loc5_ <= Consts.ZERO_TOL?Number(param1[0] + 3 * (param1[1] - param1[0])):Number(_loc7_ * (param1[0] - param1[6]) + param1[7]);
         }
         else if(_loc5_ <= Consts.ZERO_TOL)
         {
            this.__pX = param1[6];
            _loc6_ = (param1[3] - param1[1]) / _loc2_;
            this.__pY = _loc4_ <= Consts.ZERO_TOL?Number(param1[4] + 3 * (param1[4] - param1[6])):Number(_loc6_ * (param1[6] - param1[0]) + param1[1]);
         }
         else if(Math.abs(_loc6_) <= Consts.ZERO_TOL && Math.abs(_loc7_) <= Consts.ZERO_TOL)
         {
            this.__pX = 0.5 * (param1[2] + param1[4]);
            this.__pY = 0.5 * (param1[3] + param1[5]);
         }
         else
         {
            _loc6_ = (param1[3] - param1[1]) / _loc2_;
            _loc7_ = (param1[5] - param1[7]) / _loc3_;
            if(Math.abs(_loc6_) <= Consts.ZERO_TOL && Math.abs(_loc7_) <= Consts.ZERO_TOL)
            {
               this.__pX = 0.5 * (param1[0] + param1[6]);
               this.__pY = 0.5 * (param1[1] + param1[7]);
            }
            else
            {
               _loc8_ = param1[1] - _loc6_ * param1[0];
               _loc9_ = param1[7] - _loc7_ * param1[6];
               this.__pX = (_loc9_ - _loc8_) / (_loc6_ - _loc7_);
               this.__pY = _loc6_ * this.__pX + _loc8_;
            }
         }
      }
      
      private function __computeCoef() : void
      {
         this.__coef.reset();
         this.__coef.addCoef(this.__p0X,this.__p0Y);
         var _loc1_:Number = 3 * (this.__p1X - this.__p0X);
         var _loc2_:Number = 3 * (this.__p1Y - this.__p0Y);
         this.__coef.addCoef(_loc1_,_loc2_);
         var _loc3_:Number = 3 * (this.__p2X - this.__p1X) - _loc1_;
         var _loc4_:Number = 3 * (this.__p2Y - this.__p1Y) - _loc2_;
         this.__coef.addCoef(_loc3_,_loc4_);
         this.__coef.addCoef(this.__p3X - this.__p0X - _loc1_ - _loc3_,this.__p3Y - this.__p0Y - _loc2_ - _loc4_);
         var _loc5_:Array = new Array();
         _loc5_[0] = this.__p0X;
         _loc5_[1] = this.__p0Y;
         _loc5_[2] = this.__p1X;
         _loc5_[3] = this.__p1Y;
         _loc5_[4] = this.__p2X;
         _loc5_[5] = this.__p2Y;
         _loc5_[6] = this.__p3X;
         _loc5_[7] = this.__p3Y;
         this.__invalidate = false;
      }
   }
}
