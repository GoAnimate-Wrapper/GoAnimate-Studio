package anifire.util
{
   import anifire.constant.AnimeConstants;
   
   public class UtilUnitConvert
   {
       
      
      public function UtilUnitConvert()
      {
         super();
      }
      
      public static function secToFrame(param1:Number, param2:Boolean = false, param3:Boolean = false) : Number
      {
         var _loc4_:Number = param1 * AnimeConstants.FRAME_PER_SEC;
         if(!param2)
         {
            _loc4_ = Math.round(_loc4_);
         }
         return _loc4_ > 0?Number(_loc4_):!!param3?Number(0):Number(1);
      }
      
      public static function frameToSec(param1:Number, param2:Boolean = true) : Number
      {
         if(param2 && param1 != 0)
         {
            return Util.roundNum(param1 - 1) / AnimeConstants.FRAME_PER_SEC;
         }
         if(param1 >= 0)
         {
            return Util.roundNum(param1 / AnimeConstants.FRAME_PER_SEC);
         }
         return 0;
      }
      
      public static function pixelToFrame(param1:Number, param2:Boolean = false) : Number
      {
         var _loc3_:Number = param1 * AnimeConstants.FRAME_PER_PIXEL;
         if(!param2)
         {
            _loc3_ = Math.round(_loc3_);
         }
         return _loc3_ > 0?Number(_loc3_):Number(1);
      }
      
      public static function widthToFrame(param1:Number) : int
      {
         return Math.round(param1 * AnimeConstants.FRAME_PER_PIXEL);
      }
      
      public static function xToFrame(param1:Number) : Number
      {
         if(param1 >= 0)
         {
            return Math.floor(param1 * AnimeConstants.FRAME_PER_PIXEL) + 1;
         }
         return 1;
      }
      
      public static function frameToPixel(param1:uint) : Number
      {
         return Math.round(param1 * AnimeConstants.PIXEL_PER_FRAME);
      }
      
      public static function frameToTime(param1:uint, param2:Boolean = true) : Number
      {
         if(param1 > 0)
         {
            if(param2)
            {
               return (param1 - 1) / AnimeConstants.FRAME_PER_SEC;
            }
            return param1 / AnimeConstants.FRAME_PER_SEC;
         }
         return 0;
      }
      
      public static function timeToFrame(param1:Number) : int
      {
         if(param1 >= 0)
         {
            return Math.floor(param1 * AnimeConstants.FRAME_PER_SEC) + 1;
         }
         return 1;
      }
      
      public static function frameToDuration(param1:uint) : Number
      {
         return param1 / AnimeConstants.FRAME_PER_SEC;
      }
      
      public static function durationToFrame(param1:Number) : int
      {
         return int(Math.round(param1 * AnimeConstants.FRAME_PER_SEC));
      }
      
      public static function frameToX(param1:uint, param2:Boolean = true) : Number
      {
         if(param1 > 0)
         {
            if(param2)
            {
               return frameToPixel(param1 - 1);
            }
            return frameToPixel(param1);
         }
         return 0;
      }
      
      public static function pixelToSec(param1:Number) : Number
      {
         return param1 / AnimeConstants.PIXEL_PER_SEC;
      }
      
      public static function secToPixel(param1:Number) : Number
      {
         return param1 * AnimeConstants.PIXEL_PER_SEC;
      }
      
      public static function millisecToPixel(param1:Number) : Number
      {
         return param1 * AnimeConstants.PIXEL_PER_MILLISEC;
      }
      
      public static function getTargetPoint(param1:Number, param2:Number, param3:Number, param4:Number) : int
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         if(param4 == 2)
         {
            return 1;
         }
         _loc5_ = (param2 - param1) / (param4 - 1);
         _loc6_ = 0;
         _loc6_ = 0;
         while(_loc6_ < param4 - 1)
         {
            if(param3 >= param1 + _loc5_ * _loc6_ && param3 <= param1 + _loc5_ * (_loc6_ + 1))
            {
               return _loc6_ + 1;
            }
            _loc6_++;
         }
         return 0;
      }
      
      public static function getClockTime(param1:uint, param2:uint) : String
      {
         var _loc3_:String = "PM";
         var _loc4_:String = doubleDigitFormat(param2);
         if(param1 > 12)
         {
            param1 = param1 - 12;
         }
         else if(param1 == 0)
         {
            _loc3_ = "AM";
            param1 = 12;
         }
         else if(param1 < 12)
         {
            _loc3_ = "AM";
         }
         return doubleDigitFormat(param1) + ":" + _loc4_ + " " + _loc3_;
      }
      
      public static function doubleDigitFormat(param1:uint) : String
      {
         if(param1 < 10)
         {
            return "0" + param1;
         }
         return String(param1);
      }
      
      public static function uintToColorHexString(param1:uint) : String
      {
         var _loc2_:String = "";
         _loc2_ = _loc2_ + param1.toString(16).toUpperCase();
         while(_loc2_.length < 6)
         {
            _loc2_ = "0" + _loc2_;
         }
         return "0x" + _loc2_;
      }
      
      public static function addUnit(param1:Number, param2:String) : String
      {
         return param1 + param2;
      }
      
      public static function removeUnit(param1:String, param2:String) : Number
      {
         var _loc3_:int = param1.indexOf(param2);
         if(_loc3_ > -1)
         {
            param1 = param1.substring(0,_loc3_);
         }
         return Number(param1);
      }
   }
}
