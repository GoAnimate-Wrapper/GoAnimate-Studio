package anifire.assets.motion
{
   import Singularity.Geom.BezierSpline;
   import flash.geom.Point;
   
   public class BezierSplineController
   {
       
      
      private var _spline:BezierSpline;
      
      private var _arcLength:Array;
      
      private var _arcLengthFactor:Array;
      
      private var _precision:Number = 1000;
      
      public function BezierSplineController(param1:BezierSpline)
      {
         var _loc3_:Point = null;
         super();
         this._spline = param1;
         var _loc2_:Number = 0;
         this._arcLength = new Array();
         this._arcLengthFactor = new Array();
         this._arcLength.push(0);
         this._arcLengthFactor.push(0);
         var _loc4_:uint = 0;
         while(_loc4_ < this._precision)
         {
            _loc3_ = new Point(this._spline.getX((_loc4_ + 1) / this._precision) - this._spline.getX(_loc4_ / this._precision),this._spline.getY((_loc4_ + 1) / this._precision) - this._spline.getY(_loc4_ / this._precision));
            _loc2_ = _loc2_ + _loc3_.length;
            this._arcLength.push(_loc2_);
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < this._arcLength.length)
         {
            this._arcLengthFactor.push(this._arcLength[_loc4_] / _loc2_);
            _loc4_++;
         }
      }
      
      private function getArcLengthFactor(param1:Number) : Number
      {
         return this._arcLengthFactor[Math.round(param1 * this._precision)];
      }
      
      private function getArcLength(param1:Number) : Number
      {
         return this._arcLength[Math.round(param1 * this._precision)];
      }
      
      private function getTimeFactor(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = (param1 + param2) / 2;
         var _loc5_:Number = this.getArcLengthFactor(_loc4_);
         var _loc6_:Number = 0.0001;
         var _loc7_:Number = 0.0001;
         if(Math.abs(_loc5_ - param3) <= _loc6_)
         {
            return _loc4_;
         }
         if(Math.abs(param2 - param1) <= _loc7_)
         {
            return _loc4_;
         }
         if(_loc5_ < param3)
         {
            return this.getTimeFactor(_loc4_,param2,param3);
         }
         return this.getTimeFactor(param1,_loc4_,param3);
      }
      
      public function getPosition(param1:Number, param2:Boolean = true) : Point
      {
         if(param2)
         {
            param1 = this.getTimeFactor(0,1,param1);
         }
         return new Point(this._spline.getX(param1),this._spline.getY(param1));
      }
   }
}
