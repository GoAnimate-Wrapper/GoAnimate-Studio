package anifire.util
{
   public class UtilString
   {
      
      public static var REGEXP_ENDING_WHITESPACE:RegExp = / +$/gm;
       
      
      public function UtilString()
      {
         super();
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         return param1.split(param2).join(param3);
      }
      
      public static function trim(param1:String, param2:String) : String
      {
         return trimBack(trimFront(param1,param2),param2);
      }
      
      public static function trimFront(param1:String, param2:String) : String
      {
         param2 = stringToCharacter(param2);
         if(param1.charAt(0) == param2)
         {
            param1 = trimFront(param1.substring(1),param2);
         }
         return param1;
      }
      
      public static function trimBack(param1:String, param2:String) : String
      {
         param2 = stringToCharacter(param2);
         if(param1.charAt(param1.length - 1) == param2)
         {
            param1 = trimBack(param1.substring(0,param1.length - 1),param2);
         }
         return param1;
      }
      
      public static function trimEndingWhitespacePerLine(param1:String) : String
      {
         var _loc2_:String = null;
         if(!param1)
         {
            return "";
         }
         _loc2_ = param1.replace(REGEXP_ENDING_WHITESPACE,"");
         return _loc2_;
      }
      
      public static function stringToCharacter(param1:String) : String
      {
         if(param1.length == 1)
         {
            return param1;
         }
         return param1.slice(0,1);
      }
      
      public static function countWord(param1:String) : Number
      {
         var _loc2_:RegExp = /\w+/g;
         var _loc3_:Object = param1.match(_loc2_);
         return _loc3_.length;
      }
      
      public static function mb_countWord(param1:String) : Number
      {
         var _loc2_:String = escape(param1);
         var _loc3_:RegExp = /%u..../g;
         var _loc4_:Object = _loc2_.match(_loc3_);
         return _loc4_.length;
      }
      
      public static function rightPad(param1:String, param2:String, param3:int) : String
      {
         var _loc4_:String = param1;
         while(_loc4_.length < param3)
         {
            _loc4_ = _loc4_ + param2;
         }
         return _loc4_;
      }
      
      public static function leftPad(param1:String, param2:String, param3:int) : String
      {
         var _loc4_:String = param1;
         while(_loc4_.length < param3)
         {
            _loc4_ = param2 + _loc4_;
         }
         return _loc4_;
      }
      
      public static function convertSecToTimeString(param1:Number) : String
      {
         var _loc2_:Number = int(Math.floor(param1 % 60));
         var _loc3_:Number = int(Math.floor(param1 / 60));
         var _loc4_:String = UtilString.leftPad(_loc2_.toString(),"0",2);
         var _loc5_:String = UtilString.leftPad(_loc3_.toString(),"0",2);
         return _loc5_ + ":" + _loc4_;
      }
      
      public static function secToTimeString(param1:Number, param2:Boolean = true) : String
      {
         var _loc3_:Number = Math.floor(param1 / 60);
         param1 = param1 % 60;
         if(param2)
         {
            return (_loc3_ >= 10?_loc3_:"0" + _loc3_) + ":" + (param1 >= 10?param1.toFixed(2):"0" + param1.toFixed(2));
         }
         param1 = Math.floor(param1);
         return (_loc3_ >= 10?_loc3_:"0" + _loc3_) + ":" + (param1 >= 10?param1.toString():"0" + param1.toString());
      }
      
      public static function hasSWFextension(param1:String) : Boolean
      {
         var _loc2_:String = param1.substr(param1.length - 4);
         return _loc2_ == ".swf";
      }
      
      public static function distance(param1:String, param2:String) : int
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ <= param1.length)
         {
            _loc3_[_loc5_] = new Array();
            _loc6_ = 0;
            while(_loc6_ <= param2.length)
            {
               if(_loc5_ != 0)
               {
                  _loc3_[_loc5_].push(0);
               }
               else
               {
                  _loc3_[_loc5_].push(_loc6_);
               }
               _loc6_++;
            }
            _loc3_[_loc5_][0] = _loc5_;
            _loc5_++;
         }
         _loc5_ = 1;
         while(_loc5_ <= param1.length)
         {
            _loc6_ = 1;
            while(_loc6_ <= param2.length)
            {
               if(param1.charAt(_loc5_ - 1) == param2.charAt(_loc6_ - 1))
               {
                  _loc4_ = 0;
               }
               else
               {
                  _loc4_ = 1;
               }
               _loc3_[_loc5_][_loc6_] = Math.min(_loc3_[_loc5_ - 1][_loc6_] + 1,_loc3_[_loc5_][_loc6_ - 1] + 1,_loc3_[_loc5_ - 1][_loc6_ - 1] + _loc4_);
               _loc6_++;
            }
            _loc5_++;
         }
         return _loc3_[param1.length][param2.length];
      }
      
      public static function firstLetterToUpperCase(param1:String, param2:String = "", param3:int = 0) : String
      {
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         if(param1 && param1.length > 0)
         {
            if(param1.length == 1)
            {
               return param1.charAt().toLocaleUpperCase();
            }
            _loc4_ = param1.split(" ");
            param3 = 0;
            while(param3 < _loc4_.length)
            {
               _loc6_ = _loc4_[param3] as String;
               _loc6_ = !!_loc6_.match(/[A-Z]{2,}\b/)?_loc6_:_loc6_.toLocaleLowerCase();
               _loc4_[param3] = _loc6_;
               param3++;
            }
            _loc5_ = _loc4_.join(" ");
            return _loc5_.charAt().toLocaleUpperCase() + _loc5_.substr(1);
         }
         return "";
      }
   }
}
