package Singularity.Numeric
{
   public class Consts
   {
      
      public static const ZERO_TOL:Number = 0.0001;
      
      public static const PI_2:Number = 0.5 * Math.PI;
      
      public static const PI_4:Number = 0.25 * Math.PI;
      
      public static const PI_8:Number = 0.125 * Math.PI;
      
      public static const PI_16:Number = 0.0625 * Math.PI;
      
      public static const TWO_PI:Number = 2 * Math.PI;
      
      public static const THREE_PI_2:Number = 1.5 * Math.PI;
      
      public static const ONE_THIRD:Number = 1 / 3;
      
      public static const TWO_THIRDS:Number = ONE_THIRD + ONE_THIRD;
      
      public static const ONE_SIXTH:Number = 1 / 6;
      
      public static const DEG_TO_RAD:Number = Math.PI / 180;
      
      public static const RAD_TO_DEG:Number = 180 / Math.PI;
      
      public static const CIRCLE_ALPHA:Number = 4 * (Math.sqrt(2) - 1) / 3;
      
      public static const ON:Boolean = true;
      
      public static const OFF:Boolean = false;
      
      public static const AUTO:String = "A";
      
      public static const DUPLICATE:String = "D";
      
      public static const EXPLICIT:String = "E";
      
      public static const CHORD_LENGTH:String = "C";
      
      public static const ARC_LENGTH:String = "AL";
      
      public static const UNIFORM:String = "U";
      
      public static const FIRST:String = "F";
      
      public static const LAST:String = "L";
      
      public static const POLAR:String = "P";
       
      
      private var __epsilon:Number;
      
      public function Consts()
      {
         super();
         var _loc1_:Number = 4 / 3;
         var _loc2_:Number = _loc1_ - 1;
         var _loc3_:Number = _loc2_ + _loc2_ + _loc2_;
         this.__epsilon = Math.abs(1 - _loc3_);
      }
      
      public function get EPSILON() : Number
      {
         return this.__epsilon;
      }
   }
}
