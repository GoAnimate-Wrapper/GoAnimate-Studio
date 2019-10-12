package Singularity.Numeric
{
   import Singularity.Events.SingularityEvent;
   import flash.events.EventDispatcher;
   
   public class Gauss extends EventDispatcher
   {
      
      public static const MAX_POINTS:Number = 8;
       
      
      private var __abscissa:Array;
      
      private var __weight:Array;
      
      private var __error:SingularityEvent;
      
      public function Gauss()
      {
         super();
         this.__abscissa = new Array();
         this.__weight = new Array();
         this.__error = new SingularityEvent(SingularityEvent.ERROR);
         this.__error.classname = "Gauss";
         this.__abscissa.push(-0.5773502692);
         this.__abscissa.push(0.5773502692);
         this.__weight.push(1);
         this.__weight.push(1);
         this.__abscissa.push(-0.7745966692);
         this.__abscissa.push(0.7745966692);
         this.__abscissa.push(0);
         this.__weight.push(0.5555555556);
         this.__weight.push(0.5555555556);
         this.__weight.push(0.8888888888);
         this.__abscissa.push(-0.8611363116);
         this.__abscissa.push(0.8611363116);
         this.__abscissa.push(-0.3399810436);
         this.__abscissa.push(0.3399810436);
         this.__weight.push(0.3478548451);
         this.__weight.push(0.3478548451);
         this.__weight.push(0.6521451549);
         this.__weight.push(0.6521451549);
         this.__abscissa.push(-0.9061798459);
         this.__abscissa.push(0.9061798459);
         this.__abscissa.push(-0.5384693101);
         this.__abscissa.push(0.5384693101);
         this.__abscissa.push(0);
         this.__weight.push(0.2369268851);
         this.__weight.push(0.2369268851);
         this.__weight.push(0.4786286705);
         this.__weight.push(0.4786286705);
         this.__weight.push(0.5688888888);
         this.__abscissa.push(-0.9324695142);
         this.__abscissa.push(0.9324695142);
         this.__abscissa.push(-0.6612093865);
         this.__abscissa.push(0.6612093865);
         this.__abscissa.push(-0.2386191861);
         this.__abscissa.push(0.2386191861);
         this.__weight.push(0.1713244924);
         this.__weight.push(0.1713244924);
         this.__weight.push(0.360761573);
         this.__weight.push(0.360761573);
         this.__weight.push(0.4679139346);
         this.__weight.push(0.4679139346);
         this.__abscissa.push(-0.9491079123);
         this.__abscissa.push(0.9491079123);
         this.__abscissa.push(-0.7415311856);
         this.__abscissa.push(0.7415311856);
         this.__abscissa.push(-0.4058451514);
         this.__abscissa.push(0.4058451514);
         this.__abscissa.push(0);
         this.__weight.push(0.1294849662);
         this.__weight.push(0.1294849662);
         this.__weight.push(0.2797053915);
         this.__weight.push(0.2797053915);
         this.__weight.push(0.3818300505);
         this.__weight.push(0.3818300505);
         this.__weight.push(0.4179591837);
         this.__abscissa.push(-0.9602898565);
         this.__abscissa.push(0.9602898565);
         this.__abscissa.push(-0.7966664774);
         this.__abscissa.push(0.7966664774);
         this.__abscissa.push(-0.5255324099);
         this.__abscissa.push(0.5255324099);
         this.__abscissa.push(-0.1834346425);
         this.__abscissa.push(0.1834346425);
         this.__weight.push(0.1012285363);
         this.__weight.push(0.1012285363);
         this.__weight.push(0.2223810345);
         this.__weight.push(0.2223810345);
         this.__weight.push(0.3137066459);
         this.__weight.push(0.3137066459);
         this.__weight.push(0.3626837834);
         this.__weight.push(0.3626837834);
      }
      
      public function eval(param1:Function, param2:Number, param3:Number, param4:uint) : Number
      {
         var _loc8_:uint = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         this.__error.methodname = "eval()";
         if(isNaN(param2) || isNaN(param3))
         {
            this.__error.message = "Invalid interval values";
            dispatchEvent(this.__error);
            return 0;
         }
         if(param2 >= param3)
         {
            this.__error.message = "Left-hand interval value overlaps right-hand value";
            dispatchEvent(this.__error);
            return 0;
         }
         if(!(param1 is Function))
         {
            this.__error.message = "Invalid function reference";
            dispatchEvent(this.__error);
            return 0;
         }
         if(isNaN(param4) || param4 < 2)
         {
            this.__error.message = "Invalid number of intervals: " + param4.toString();
            dispatchEvent(this.__error);
            return 0;
         }
         var _loc5_:uint = Math.max(param4,2);
         _loc5_ = Math.min(_loc5_,MAX_POINTS);
         var _loc6_:uint = _loc5_ == 2?uint(0):uint(_loc5_ * (_loc5_ - 1) / 2 - 1);
         var _loc7_:Number = 0;
         if(param2 == -1 && param3 == 1)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc5_)
            {
               _loc7_ = _loc7_ + param1(this.__abscissa[_loc6_ + _loc8_]) * this.__weight[_loc6_ + _loc8_];
               _loc8_++;
            }
            return _loc7_;
         }
         _loc9_ = 0.5 * (param3 - param2);
         _loc10_ = 0.5 * (param2 + param3);
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc7_ = _loc7_ + param1(_loc10_ + _loc9_ * this.__abscissa[_loc6_ + _loc8_]) * this.__weight[_loc6_ + _loc8_];
            _loc8_++;
         }
         return _loc9_ * _loc7_;
      }
   }
}
