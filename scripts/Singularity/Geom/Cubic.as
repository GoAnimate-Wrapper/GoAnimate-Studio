package Singularity.Geom
{
   public class Cubic implements IPoly
   {
       
      
      private var __c0X:Number;
      
      private var __c1X:Number;
      
      private var __c2X:Number;
      
      private var __c3X:Number;
      
      private var __c0Y:Number;
      
      private var __c1Y:Number;
      
      private var __c2Y:Number;
      
      private var __c3Y:Number;
      
      private var __count:uint;
      
      public function Cubic()
      {
         super();
         this.reset();
      }
      
      public function reset() : void
      {
         this.__c0X = 0;
         this.__c1X = 0;
         this.__c2X = 0;
         this.__c3X = 0;
         this.__c0Y = 0;
         this.__c1Y = 0;
         this.__c2Y = 0;
         this.__c3Y = 0;
         this.__count = 0;
      }
      
      public function addCoef(param1:Number, param2:Number) : void
      {
         if(this.__count < 4 && !isNaN(param1) && !isNaN(param2))
         {
            switch(this.__count)
            {
               case 0:
                  this.__c0X = param1;
                  this.__c0Y = param2;
                  break;
               case 1:
                  this.__c1X = param1;
                  this.__c1Y = param2;
                  break;
               case 2:
                  this.__c2X = param1;
                  this.__c2Y = param2;
                  break;
               case 3:
                  this.__c3X = param1;
                  this.__c3Y = param2;
            }
            this.__count++;
         }
      }
      
      public function getCoef(param1:uint) : Object
      {
         var _loc2_:Object = null;
         if(param1 > -1 && param1 < 4)
         {
            _loc2_ = new Object();
            switch(param1)
            {
               case 0:
                  _loc2_.X = this.__c0X;
                  _loc2_.Y = this.__c0Y;
                  break;
               case 1:
                  _loc2_.X = this.__c1X;
                  _loc2_.Y = this.__c1Y;
                  break;
               case 2:
                  _loc2_.X = this.__c2X;
                  _loc2_.Y = this.__c2Y;
                  break;
               case 3:
                  _loc2_.X = this.__c3X;
                  _loc2_.Y = this.__c3Y;
            }
         }
         return _loc2_;
      }
      
      public function getX(param1:Number) : Number
      {
         return this.__c0X + param1 * (this.__c1X + param1 * (this.__c2X + param1 * this.__c3X));
      }
      
      public function getY(param1:Number) : Number
      {
         return this.__c0Y + param1 * (this.__c1Y + param1 * (this.__c2Y + param1 * this.__c3Y));
      }
      
      public function getXPrime(param1:Number) : Number
      {
         return this.__c1X + param1 * (2 * this.__c2X + param1 * (3 * this.__c3X));
      }
      
      public function getYPrime(param1:Number) : Number
      {
         return this.__c1Y + param1 * (2 * this.__c2Y + param1 * (3 * this.__c3Y));
      }
      
      public function getDeriv(param1:Number) : Number
      {
         var _loc2_:Number = this.getYPrime(param1);
         var _loc3_:Number = this.getXPrime(param1);
         return _loc2_ / _loc3_;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "coef[0] " + this.__c0X + "," + this.__c0Y;
         _loc1_ = _loc1_ + (" coef[1] " + this.__c1X + "," + this.__c1Y);
         _loc1_ = _loc1_ + (" coef[2] " + this.__c2X + "," + this.__c2Y);
         _loc1_ = _loc1_ + (" coef[3] " + this.__c3X + "," + this.__c3Y);
         return _loc1_;
      }
   }
}
