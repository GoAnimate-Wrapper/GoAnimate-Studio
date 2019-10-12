package Singularity.Geom
{
   import Singularity.Numeric.Consts;
   import anifire.util.UtilPlain;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class BezierSpline extends Composite
   {
       
      
      protected var __closed:Boolean;
      
      private var __parameterization:String;
      
      private var __knots:Array;
      
      protected var __bezier:Array;
      
      private var __t:Number;
      
      private var __s:Number;
      
      private var __index:uint;
      
      private var __tension:Number;
      
      private var __controlCage:BezierSplineControl;
      
      private var __quality:uint;
      
      public function BezierSpline()
      {
         super();
         this.__closed = false;
         this.__parameterization = Consts.UNIFORM;
         this.__knots = new Array();
         this.__bezier = new Array();
         this.__controlCage = new BezierSplineControl();
         this.__controlCage.knots = this.__knots;
         this.__controlCage.CLOSED = this.__closed;
         this.__tension = 1;
         this.__quality = 3;
      }
      
      public function get knots() : Number
      {
         return this.__knots.length;
      }
      
      public function get closed() : Boolean
      {
         return this.__closed;
      }
      
      public function set tension(param1:uint) : void
      {
         var _loc2_:Number = Math.max(0,param1);
         _loc2_ = Math.min(5,_loc2_);
         this.__controlCage.tension = _loc2_;
      }
      
      public function set quality(param1:uint) : void
      {
         var _loc2_:Number = Math.max(0,param1);
         _loc2_ = Math.min(3,_loc2_);
         this.__quality = _loc2_;
      }
      
      public function set closed(param1:Boolean) : void
      {
         this.__closed = param1;
         this.__controlCage.CLOSED = param1;
      }
      
      override public function __integrand(param1:Number) : Number
      {
         var _loc2_:Number = this.__bezier[this.__index].getXPrime(param1);
         var _loc3_:Number = this.__bezier[this.__index].getYPrime(param1);
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      override public function addControlPoint(param1:Number, param2:Number) : void
      {
         var _loc3_:FastBezier = null;
         if(!isNaN(param1) && !isNaN(param2))
         {
            this.__knots.push({
               "X":param1,
               "Y":param2
            });
            this.__index = this.__knots.length - 1;
            if(this.__index > 0)
            {
               _loc3_ = new FastBezier();
               _loc3_.subdivisions = this.__quality;
               this.__bezier[this.__index - 1] = _loc3_;
            }
         }
      }
      
      override public function moveControlPoint(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:Object = this.__knots[param1];
         _loc4_.X = param2;
         _loc4_.Y = param3;
         __invalidate = true;
      }
      
      public function removeControlPoint(param1:uint) : void
      {
         this.__knots.splice(param1,1);
      }
      
      public function insertControlPoint(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:FastBezier = null;
         if(!isNaN(param2) && !isNaN(param3))
         {
            this.__knots.splice(param1,0,{
               "X":param2,
               "Y":param3
            });
            this.__index = this.__knots.length - 1;
            if(this.__index > 0)
            {
               _loc4_ = new FastBezier();
               _loc4_.subdivisions = this.__quality;
               this.__bezier[this.__index - 1] = _loc4_;
            }
         }
      }
      
      override public function reset() : void
      {
         this.__knots.splice(0);
         var _loc1_:uint = 0;
         while(_loc1_ < this.__bezier.length)
         {
            this.__bezier[_loc1_].reset();
            _loc1_++;
         }
         this.__bezier.splice(0);
         __count = 0;
         __arcLength = -1;
         __invalidate = true;
      }
      
      override public function getX(param1:Number) : Number
      {
         if(__invalidate)
         {
            this.__assignControlPoints();
         }
         this.__interval(param1);
         return this.__bezier[this.__index].getX(this.__t);
      }
      
      override public function getY(param1:Number) : Number
      {
         if(__invalidate)
         {
            this.__assignControlPoints();
         }
         this.__interval(param1);
         return this.__bezier[this.__index].getY(this.__t);
      }
      
      override public function draw(param1:Number = 1.0, param2:Number = 3, param3:Number = 3, param4:Number = 15) : void
      {
         var _loc6_:Sprite = null;
         if(__invalidate)
         {
            this.__assignControlPoints();
         }
         if(__container.numChildren > 0)
         {
            UtilPlain.removeAllSon(__container);
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.__bezier.length)
         {
            _loc6_ = new Sprite();
            __container.addChild(_loc6_);
            _loc6_.name = _loc5_.toString();
            this.__bezier[_loc5_].draw(_loc6_,__thickness,__color,this.__closed,param2,param3,param4);
            _loc5_++;
         }
      }
      
      public function drawFilled(param1:Number, param2:Number) : void
      {
         if(__invalidate)
         {
            this.__assignControlPoints();
         }
         var _loc3_:Graphics = __container.graphics;
         _loc3_.beginFill(param2,1);
         _loc3_.moveTo(this.__knots[0].X,this.__knots[0].Y);
         var _loc4_:uint = 0;
         while(_loc4_ < this.__bezier.length)
         {
            this.__bezier[_loc4_].draw(__container,__thickness,param1,true);
            _loc4_++;
         }
         _loc3_.endFill();
      }
      
      public function drawControlPoints(param1:Shape, param2:uint) : void
      {
         if(__invalidate)
         {
            this.__assignControlPoints();
         }
         this.__controlCage.draw(param1,param2);
      }
      
      override public function arcLength() : Number
      {
         if(__arcLength != -1)
         {
            return __arcLength;
         }
         if(__invalidate)
         {
            this.__assignControlPoints();
         }
         var _loc1_:Number = 0;
         var _loc2_:uint = this.__knots.length - 1;
         if(_loc2_ < 2)
         {
            return _loc1_;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            this.__index = _loc3_;
            _loc1_ = _loc1_ + 0.5 * __integral.eval(this.__integrand,0,1,5);
            _loc3_++;
         }
         __arcLength = _loc1_;
         return _loc1_;
      }
      
      override public function arcLengthAt(param1:Number) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:uint = this.__knots.length;
         if(_loc3_ < 2 || param1 == 0)
         {
            return _loc2_;
         }
         if(__invalidate)
         {
            this.__assignControlPoints();
         }
         var _loc4_:Number = param1 < 0?Number(0):Number(param1);
         _loc4_ = _loc4_ > 1?Number(1):Number(_loc4_);
         var _loc5_:Number = _loc3_ - 1;
         var _loc6_:Number = _loc5_ * _loc4_;
         var _loc7_:Number = Math.floor(_loc6_);
         var _loc8_:Number = Math.min(_loc7_ + 1,_loc5_) - 1;
         var _loc9_:Number = _loc6_ - _loc7_;
         var _loc10_:uint = 0;
         while(_loc10_ < _loc8_)
         {
            this.__index = _loc10_;
            _loc2_ = _loc2_ + 0.5 * __integral.eval(this.__integrand,0,1,5);
            _loc10_++;
         }
         if(_loc9_ != 0)
         {
            this.__index = _loc8_;
            _loc2_ = _loc2_ + 0.5 * __integral.eval(this.__integrand,0,_loc9_,5);
         }
         return _loc2_;
      }
      
      private function __interval(param1:Number) : void
      {
         var _loc2_:Number = param1 < 0?Number(0):Number(param1);
         _loc2_ = _loc2_ > 1?Number(1):Number(_loc2_);
         if(__param == Consts.ARC_LENGTH)
         {
            if(_loc2_ != this.__s)
            {
               this.__t = __spline.eval(_loc2_);
               this.__s = _loc2_;
               this.__segment();
            }
         }
         else if(_loc2_ != this.__t)
         {
            this.__t = _loc2_;
            this.__segment();
         }
      }
      
      private function __segment() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:Number = this.__knots.length;
         if(_loc1_ == 2)
         {
            this.__index = 0;
         }
         else if(this.__t == 0)
         {
            this.__index = 0;
         }
         else if(this.__t == 1)
         {
            this.__index = _loc1_ - 2;
         }
         else
         {
            _loc2_ = _loc1_ - 1;
            _loc3_ = _loc2_ * this.__t;
            _loc4_ = Math.floor(_loc3_);
            this.__index = Math.min(_loc4_ + 1,_loc2_) - 1;
            this.__t = _loc3_ - _loc4_;
         }
      }
      
      public function __assignControlPoints() : void
      {
         var _loc3_:CubicCage = null;
         var _loc4_:FastBezier = null;
         var _loc1_:uint = this.__knots.length - 1;
         if(this.__closed && this.__knots[0].X != this.__knots[_loc1_].X && this.__knots[0].Y != this.__knots[_loc1_].Y)
         {
            this.addControlPoint(this.__knots[0].X,this.__knots[0].Y);
         }
         this.__controlCage.construct();
         var _loc2_:uint = 0;
         while(_loc2_ < this.__bezier.length)
         {
            _loc3_ = this.__controlCage.getCage(_loc2_);
            _loc4_ = this.__bezier[_loc2_];
            _loc4_.moveControlPoint(0,_loc3_.P0X,_loc3_.P0Y);
            _loc4_.moveControlPoint(1,_loc3_.P1X,_loc3_.P1Y);
            _loc4_.moveControlPoint(2,_loc3_.P2X,_loc3_.P2Y);
            _loc4_.moveControlPoint(3,_loc3_.P3X,_loc3_.P3Y);
            _loc2_++;
         }
         __invalidate = false;
         this.__parameterize();
      }
      
      private function __parameterize() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:uint = 0;
         var _loc4_:Number = NaN;
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(__param == Consts.ARC_LENGTH)
         {
            if(__arcLength == -1)
            {
               _loc6_ = this.arcLength();
            }
            _loc1_ = 1 / __arcLength;
            if(__spline.knotCount > 0)
            {
               __spline.deleteAllKnots();
            }
            __spline.addControlPoint(0,0);
            _loc2_ = 0;
            _loc3_ = this.__knots.length;
            _loc4_ = 1 / Number(_loc3_ - 1);
            _loc5_ = 1;
            while(_loc5_ < _loc3_ - 1)
            {
               _loc7_ = Number(_loc5_) * _loc4_;
               _loc8_ = _loc2_ + Consts.ONE_THIRD * (_loc7_ - _loc2_);
               _loc9_ = this.arcLengthAt(_loc8_) * _loc1_;
               __spline.addControlPoint(_loc9_,_loc8_);
               _loc10_ = _loc2_ + Consts.TWO_THIRDS * (_loc7_ - _loc2_);
               _loc9_ = this.arcLengthAt(_loc10_) * _loc1_;
               __spline.addControlPoint(_loc9_,_loc10_);
               _loc9_ = this.arcLengthAt(_loc7_) * _loc1_;
               __spline.addControlPoint(_loc9_,_loc7_);
               _loc2_ = _loc7_;
               _loc5_++;
            }
            _loc8_ = _loc2_ + Consts.ONE_THIRD * (1 - _loc2_);
            _loc9_ = this.arcLengthAt(_loc8_) * _loc1_;
            __spline.addControlPoint(_loc9_,_loc8_);
            _loc10_ = _loc2_ + Consts.TWO_THIRDS * (1 - _loc2_);
            _loc9_ = this.arcLengthAt(_loc10_) * _loc1_;
            __spline.addControlPoint(_loc9_,_loc10_);
            __spline.addControlPoint(1,1);
         }
      }
   }
}
