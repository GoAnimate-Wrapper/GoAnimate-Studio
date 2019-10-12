package com.jumpeye.flashEff2.text.fe3D
{
   public class Number3D
   {
       
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public function Number3D(param1:Number = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.z = param3;
      }
      
      public static function sub(param1:Number3D, param2:Number3D) : Number3D
      {
         return new Number3D(param1.x - param2.x,param1.y - param2.y,param1.z - param2.z);
      }
      
      public static function add(param1:Number3D, param2:Number3D) : Number3D
      {
         return new Number3D(param1.x + param2.x,param1.y + param2.y,param1.z + param2.z);
      }
      
      public static function get ZERO() : Number3D
      {
         return new Number3D(0,0,0);
      }
      
      public static function cross(param1:Number3D, param2:Number3D) : Number3D
      {
         return new Number3D(param2.y * param1.z - param2.z * param1.y,param2.z * param1.x - param2.x * param1.z,param2.x * param1.y - param2.y * param1.x);
      }
      
      public function get modulo() : Number
      {
         return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
      }
      
      public function normalize() : void
      {
         var _loc1_:Number = this.modulo;
         if(_loc1_ != 0 && _loc1_ != 1)
         {
            this.x = this.x / _loc1_;
            this.y = this.y / _loc1_;
            this.z = this.z / _loc1_;
         }
      }
   }
}
