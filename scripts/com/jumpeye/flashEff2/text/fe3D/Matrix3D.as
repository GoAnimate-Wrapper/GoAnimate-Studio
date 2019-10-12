package com.jumpeye.flashEff2.text.fe3D
{
   public class Matrix3D
   {
      
      private static var toRADIANS:Number = Math.PI / 180;
      
      private static var toDEGREES:Number = 180 / Math.PI;
       
      
      public var n31:Number;
      
      public var n32:Number;
      
      public var n11:Number;
      
      public var n34:Number;
      
      public var n13:Number;
      
      public var n14:Number;
      
      public var n33:Number;
      
      public var n12:Number;
      
      public var n21:Number;
      
      public var n22:Number;
      
      public var n23:Number;
      
      public var n24:Number;
      
      public function Matrix3D(param1:Array = null)
      {
         super();
         if(!param1 || param1.length < 12)
         {
            n11 = n22 = n33 = 1;
            n12 = n13 = n14 = n21 = n23 = n24 = n31 = n32 = n34 = 0;
         }
         else
         {
            n11 = param1[0];
            n12 = param1[1];
            n13 = param1[2];
            n14 = param1[3];
            n21 = param1[4];
            n22 = param1[5];
            n23 = param1[6];
            n24 = param1[7];
            n31 = param1[8];
            n32 = param1[9];
            n33 = param1[10];
            n34 = param1[11];
         }
      }
      
      public static function inverse(param1:Matrix3D) : Matrix3D
      {
         var _loc2_:Matrix3D = new Matrix3D();
         _loc2_.calculateInverse(param1);
         return _loc2_;
      }
      
      public static function multiply(param1:Matrix3D, param2:Matrix3D) : Matrix3D
      {
         var _loc3_:Matrix3D = new Matrix3D();
         _loc3_.calculateMultiply(param1,param2);
         return _loc3_;
      }
      
      public static function multiplyVector(param1:Matrix3D, param2:Number3D) : void
      {
         var _loc3_:Number = param2.x;
         var _loc4_:Number = param2.y;
         var _loc5_:Number = param2.z;
         param2.x = _loc3_ * param1.n11 + _loc4_ * param1.n12 + _loc5_ * param1.n13 + param1.n14;
         param2.y = _loc3_ * param1.n21 + _loc4_ * param1.n22 + _loc5_ * param1.n23 + param1.n24;
         param2.z = _loc3_ * param1.n31 + _loc4_ * param1.n32 + _loc5_ * param1.n33 + param1.n34;
      }
      
      public static function scaleMatrix(param1:Number, param2:Number, param3:Number) : Matrix3D
      {
         var _loc4_:Matrix3D = IDENTITY;
         _loc4_.n11 = param1;
         _loc4_.n22 = param2;
         _loc4_.n33 = param3;
         return _loc4_;
      }
      
      public static function clone(param1:Matrix3D) : Matrix3D
      {
         return new Matrix3D([param1.n11,param1.n12,param1.n13,param1.n14,param1.n21,param1.n22,param1.n23,param1.n24,param1.n31,param1.n32,param1.n33,param1.n34]);
      }
      
      public static function get IDENTITY() : Matrix3D
      {
         return new Matrix3D([1,0,0,0,0,1,0,0,0,0,1,0]);
      }
      
      public function get det() : Number
      {
         return (this.n11 * this.n22 - this.n21 * this.n12) * this.n33 - (this.n11 * this.n32 - this.n31 * this.n12) * this.n23 + (this.n21 * this.n32 - this.n31 * this.n22) * this.n13;
      }
      
      public function calculateMultiply(param1:Matrix3D, param2:Matrix3D) : void
      {
         var _loc3_:Number = param1.n11;
         var _loc4_:Number = param2.n11;
         var _loc5_:Number = param1.n21;
         var _loc6_:Number = param2.n21;
         var _loc7_:Number = param1.n31;
         var _loc8_:Number = param2.n31;
         var _loc9_:Number = param1.n12;
         var _loc10_:Number = param2.n12;
         var _loc11_:Number = param1.n22;
         var _loc12_:Number = param2.n22;
         var _loc13_:Number = param1.n32;
         var _loc14_:Number = param2.n32;
         var _loc15_:Number = param1.n13;
         var _loc16_:Number = param2.n13;
         var _loc17_:Number = param1.n23;
         var _loc18_:Number = param2.n23;
         var _loc19_:Number = param1.n33;
         var _loc20_:Number = param2.n33;
         var _loc21_:Number = param1.n14;
         var _loc22_:Number = param2.n14;
         var _loc23_:Number = param1.n24;
         var _loc24_:Number = param2.n24;
         var _loc25_:Number = param1.n34;
         var _loc26_:Number = param2.n34;
         this.n11 = _loc3_ * _loc4_ + _loc9_ * _loc6_ + _loc15_ * _loc8_;
         this.n12 = _loc3_ * _loc10_ + _loc9_ * _loc12_ + _loc15_ * _loc14_;
         this.n13 = _loc3_ * _loc16_ + _loc9_ * _loc18_ + _loc15_ * _loc20_;
         this.n14 = _loc3_ * _loc22_ + _loc9_ * _loc24_ + _loc15_ * _loc26_ + _loc21_;
         this.n21 = _loc5_ * _loc4_ + _loc11_ * _loc6_ + _loc17_ * _loc8_;
         this.n22 = _loc5_ * _loc10_ + _loc11_ * _loc12_ + _loc17_ * _loc14_;
         this.n23 = _loc5_ * _loc16_ + _loc11_ * _loc18_ + _loc17_ * _loc20_;
         this.n24 = _loc5_ * _loc22_ + _loc11_ * _loc24_ + _loc17_ * _loc26_ + _loc23_;
         this.n31 = _loc7_ * _loc4_ + _loc13_ * _loc6_ + _loc19_ * _loc8_;
         this.n32 = _loc7_ * _loc10_ + _loc13_ * _loc12_ + _loc19_ * _loc14_;
         this.n33 = _loc7_ * _loc16_ + _loc13_ * _loc18_ + _loc19_ * _loc20_;
         this.n34 = _loc7_ * _loc22_ + _loc13_ * _loc24_ + _loc19_ * _loc26_ + _loc25_;
      }
      
      public function calculateInverse(param1:Matrix3D) : void
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
         var _loc2_:Number = param1.det;
         if(Math.abs(_loc2_) > 0.001)
         {
            _loc2_ = 1 / _loc2_;
            _loc3_ = param1.n11;
            _loc4_ = param1.n21;
            _loc5_ = param1.n31;
            _loc6_ = param1.n12;
            _loc7_ = param1.n22;
            _loc8_ = param1.n32;
            _loc9_ = param1.n13;
            _loc10_ = param1.n23;
            _loc11_ = param1.n33;
            _loc12_ = param1.n14;
            _loc13_ = param1.n24;
            _loc14_ = param1.n34;
            this.n11 = _loc2_ * (_loc7_ * _loc11_ - _loc8_ * _loc10_);
            this.n12 = -_loc2_ * (_loc6_ * _loc11_ - _loc8_ * _loc9_);
            this.n13 = _loc2_ * (_loc6_ * _loc10_ - _loc7_ * _loc9_);
            this.n14 = -_loc2_ * (_loc6_ * (_loc10_ * _loc14_ - _loc11_ * _loc13_) - _loc7_ * (_loc9_ * _loc14_ - _loc11_ * _loc12_) + _loc8_ * (_loc9_ * _loc13_ - _loc10_ * _loc12_));
            this.n21 = -_loc2_ * (_loc4_ * _loc11_ - _loc5_ * _loc10_);
            this.n22 = _loc2_ * (_loc3_ * _loc11_ - _loc5_ * _loc9_);
            this.n23 = -_loc2_ * (_loc3_ * _loc10_ - _loc4_ * _loc9_);
            this.n24 = _loc2_ * (_loc3_ * (_loc10_ * _loc14_ - _loc11_ * _loc13_) - _loc4_ * (_loc9_ * _loc14_ - _loc11_ * _loc12_) + _loc5_ * (_loc9_ * _loc13_ - _loc10_ * _loc12_));
            this.n31 = _loc2_ * (_loc4_ * _loc8_ - _loc5_ * _loc7_);
            this.n32 = -_loc2_ * (_loc3_ * _loc8_ - _loc5_ * _loc6_);
            this.n33 = _loc2_ * (_loc3_ * _loc7_ - _loc4_ * _loc6_);
            this.n34 = -_loc2_ * (_loc3_ * (_loc7_ * _loc14_ - _loc8_ * _loc13_) - _loc4_ * (_loc6_ * _loc14_ - _loc8_ * _loc12_) + _loc5_ * (_loc6_ * _loc13_ - _loc7_ * _loc12_));
         }
      }
   }
}
