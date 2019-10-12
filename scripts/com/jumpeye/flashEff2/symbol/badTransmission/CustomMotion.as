package com.jumpeye.flashEff2.symbol.badTransmission
{
   public class CustomMotion
   {
       
      
      protected var _points:Array;
      
      protected var pLen:uint;
      
      public function CustomMotion()
      {
         super();
         _points = [];
         var _loc1_:* = 0;
         while(_loc1_ < 30)
         {
            _points[_loc1_] = 1;
            _loc1_++;
         }
      }
      
      public function get points() : Array
      {
         return this._points;
      }
      
      public function set points(param1:Array) : void
      {
         if(param1 is Array)
         {
            this._points = param1;
            pLen = param1.length - 1;
         }
      }
      
      public function getValue(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         if(param4 <= 0)
         {
            return NaN;
         }
         var _loc5_:* = param1 / param4;
         var _loc6_:uint = Math.floor(this.pLen * _loc5_);
         return param2 + this._points[_loc6_] * param3;
      }
   }
}
