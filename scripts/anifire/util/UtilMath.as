package anifire.util
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class UtilMath
   {
      
      private static var _instance:UtilMath;
       
      
      private var _kebo:ByteArray;
      
      public function UtilMath()
      {
         super();
      }
      
      public static function get instance() : UtilMath
      {
         if(!_instance)
         {
            _instance = new UtilMath();
         }
         return _instance;
      }
      
      public static function boundaryCheck(param1:Number, param2:Number = -9999999, param3:Number = 9999999) : Number
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      public static function checkOverlap(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         if(param1 <= param3)
         {
            return param3 <= param2;
         }
         return param1 <= param4;
      }
      
      public static function rotatePoint(param1:Point, param2:Number, param3:Point = null) : Point
      {
         var _loc4_:Matrix = new Matrix();
         if(param3)
         {
            _loc4_.translate(-param3.x,-param3.y);
         }
         _loc4_.rotate(param2 * Math.PI / 180);
         if(param3)
         {
            _loc4_.translate(param3.x,param3.y);
         }
         return _loc4_.transformPoint(param1);
      }
      
      public static function scalePoint(param1:Point, param2:Number, param3:Number, param4:Point = null) : Point
      {
         var _loc5_:Matrix = new Matrix();
         if(param4)
         {
            _loc5_.translate(-param4.x,-param4.y);
         }
         _loc5_.scale(param2,param3);
         if(param4)
         {
            _loc5_.translate(param4.x,param4.y);
         }
         return _loc5_.transformPoint(param1);
      }
      
      public static function scaleRect(param1:Rectangle, param2:Number, param3:Number, param4:Point = null) : Rectangle
      {
         var _loc5_:Matrix = new Matrix();
         if(param4)
         {
            _loc5_.translate(-param4.x,-param4.y);
         }
         _loc5_.scale(param2,param3);
         if(param4)
         {
            _loc5_.translate(param4.x,param4.y);
         }
         var _loc6_:Point = new Point(param1.x,param1.y);
         _loc6_ = _loc5_.transformPoint(_loc6_);
         param1.x = _loc6_.x;
         param1.y = _loc6_.y;
         param1.width = param1.width * param2;
         param1.height = param1.height * param3;
         return param1;
      }
      
      public static function getCenter(param1:Rectangle) : Point
      {
         return new Point(param1.x + param1.width / 2,param1.y + param1.height / 2);
      }
      
      public static function dotProduct(param1:Point, param2:Point) : Number
      {
         return param1.x * param2.x + param1.y * param2.y;
      }
      
      public static function crossProduct(param1:Point, param2:Point) : Number
      {
         return param1.x * param2.y - param1.y * param2.x;
      }
      
      public static function angleBetweenVectors(param1:Point, param2:Point) : Number
      {
         if(param1.length > 0 && param2.length > 0)
         {
            return Math.acos(dotProduct(param1,param2) / (param1.length * param2.length)) * 180 / Math.PI;
         }
         return 0;
      }
      
      public static function signedAngleBetweenVectors(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = angleBetweenVectors(param1,param2);
         if(crossProduct(param1,param2) < 0)
         {
            _loc3_ = _loc3_ * -1;
         }
         return _loc3_;
      }
      
      public static function linearInterpolation(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 + param3 * (param2 - param1);
      }
      
      public static function permutate(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         if(param1.length == 1)
         {
            return [param1[0]];
         }
         var _loc2_:Array = [];
         var _loc3_:int = param1.length;
         _loc4_ = _loc3_;
         while(_loc4_--)
         {
            _loc6_ = param1.slice(0,_loc4_).concat(param1.slice(_loc4_ + 1,_loc3_));
            _loc7_ = permutate(_loc6_);
            _loc5_ = _loc7_.length;
            while(_loc5_--)
            {
               _loc6_ = [param1[_loc4_]].concat(_loc7_[_loc5_]);
               _loc2_.push(_loc6_);
            }
         }
         return _loc2_;
      }
      
      public function randomizeKebo() : ByteArray
      {
         if(this._kebo)
         {
            return this._kebo;
         }
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:Number = Math.floor(Math.random() * 100);
         _loc2_ = (_loc2_ + (_loc2_ + 1) + 9) / 2 - (_loc2_ + 5) + 5;
         var _loc3_:RegExp = /[\s\r\n]+/gim;
         var _loc4_:String = String(UtilDictOffline.array.getValueByKey(String(UtilDictOffline.array.getValueByKey(UtilDictOffline.error[_loc2_])))).substr(_loc2_).replace(_loc3_,"").toLowerCase();
         var _loc5_:int = _loc4_.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc1_[_loc6_] = _loc4_.charCodeAt(_loc6_) as uint;
            _loc6_++;
         }
         this._kebo = _loc1_;
         return _loc1_;
      }
   }
}
