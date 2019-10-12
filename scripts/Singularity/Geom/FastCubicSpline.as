package Singularity.Geom
{
   public class FastCubicSpline
   {
       
      
      private var __t:Array;
      
      private var __y:Array;
      
      private var __u:Array;
      
      private var __v:Array;
      
      private var __h:Array;
      
      private var __b:Array;
      
      private var __z:Array;
      
      private var __hInv:Array;
      
      private var __delta:Number;
      
      private var __knots:uint;
      
      private var __invalidate:Boolean;
      
      public function FastCubicSpline()
      {
         super();
         this.__t = new Array();
         this.__y = new Array();
         this.__u = new Array();
         this.__v = new Array();
         this.__h = new Array();
         this.__b = new Array();
         this.__z = new Array();
         this.__hInv = new Array();
         this.__invalidate = true;
         this.__delta = 0;
         this.__knots = 0;
      }
      
      public function get knotCount() : Number
      {
         return this.__knots;
      }
      
      public function get knots() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:uint = 0;
         while(_loc2_ < this.__knots)
         {
            _loc1_.push({
               "X":this.__t[_loc2_],
               "Y":this.__y[_loc2_]
            });
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function addControlPoint(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         this.__invalidate = true;
         if(this.__t.length == 0)
         {
            this.__t.push(param1);
            this.__y.push(param2);
            this.__knots++;
         }
         else if(param1 > this.__t[this.__knots - 1])
         {
            this.__t.push(param1);
            this.__y.push(param2);
            this.__knots++;
         }
         else if(param1 < this.__t[0])
         {
            this.__insert(param1,param2,0);
         }
         else if(this.__knots > 1)
         {
            _loc3_ = 0;
            while(_loc3_ < this.__knots - 1)
            {
               if(param1 > this.__t[_loc3_] && param1 < this.__t[_loc3_ + 1])
               {
                  this.__insert(param1,param2,_loc3_ + 1);
               }
               _loc3_++;
            }
         }
      }
      
      private function __insert(param1:Number, param2:Number, param3:int) : void
      {
         this.__t.splice(param3,0,param1);
         this.__y.splice(param3,0,param2);
         this.__knots++;
      }
      
      public function deleteAllKnots() : void
      {
         this.__t.splice(0);
         this.__y.splice(0);
         this.__knots = 0;
         this.__invalidate = true;
      }
      
      public function eval(param1:Number) : Number
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.__knots == 0)
         {
            return NaN;
         }
         if(this.__knots == 1)
         {
            return this.__y[0];
         }
         if(this.__invalidate)
         {
            this.__computeZ();
         }
         _loc2_ = 0;
         this.__delta = param1 - this.__t[0];
         _loc3_ = this.__knots - 2;
         while(_loc3_ >= 0)
         {
            if(param1 >= this.__t[_loc3_])
            {
               this.__delta = param1 - this.__t[_loc3_];
               _loc2_ = _loc3_;
               break;
            }
            _loc3_--;
         }
         _loc4_ = (this.__y[_loc2_ + 1] - this.__y[_loc2_]) * this.__hInv[_loc2_] - this.__h[_loc2_] * (this.__z[_loc2_ + 1] + 2 * this.__z[_loc2_]) * 0.166666666666667;
         _loc5_ = 0.5 * this.__z[_loc2_] + this.__delta * (this.__z[_loc2_ + 1] - this.__z[_loc2_]) * 0.166666666666667 * this.__hInv[_loc2_];
         _loc6_ = _loc4_ + this.__delta * _loc5_;
         _loc7_ = this.__y[_loc2_] + this.__delta * _loc6_;
         return _loc7_;
      }
      
      private function __computeZ() : void
      {
         var _loc1_:uint = 0;
         while(_loc1_ < this.__knots - 1)
         {
            this.__h[_loc1_] = this.__t[_loc1_ + 1] - this.__t[_loc1_];
            this.__hInv[_loc1_] = 1 / this.__h[_loc1_];
            this.__b[_loc1_] = (this.__y[_loc1_ + 1] - this.__y[_loc1_]) * this.__hInv[_loc1_];
            _loc1_++;
         }
         this.__u[1] = 2 * (this.__h[0] + this.__h[1]);
         this.__v[1] = 6 * (this.__b[1] - this.__b[0]);
         _loc1_ = 2;
         while(_loc1_ < this.__knots - 1)
         {
            this.__u[_loc1_] = 2 * (this.__h[_loc1_] + this.__h[_loc1_ - 1]) - this.__h[_loc1_ - 1] * this.__h[_loc1_ - 1] / this.__u[_loc1_ - 1];
            this.__v[_loc1_] = 6 * (this.__b[_loc1_] - this.__b[_loc1_ - 1]) - this.__h[_loc1_ - 1] * this.__v[_loc1_ - 1] / this.__u[_loc1_ - 1];
            _loc1_++;
         }
         this.__z[this.__knots - 1] = 0;
         _loc1_ = this.__knots - 2;
         while(_loc1_ >= 1)
         {
            this.__z[_loc1_] = (this.__v[_loc1_] - this.__h[_loc1_] * this.__z[_loc1_ + 1]) / this.__u[_loc1_];
            _loc1_--;
         }
         this.__z[0] = 0;
         this.__invalidate = false;
      }
   }
}
