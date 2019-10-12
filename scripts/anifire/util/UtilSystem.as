package anifire.util
{
   import flash.system.Capabilities;
   
   public class UtilSystem
   {
       
      
      public function UtilSystem()
      {
         super();
      }
      
      public static function isLion() : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc1_:String = Capabilities.os;
         if(_loc1_.indexOf("Mac") > -1)
         {
            _loc2_ = _loc1_.split(" ");
            _loc3_ = _loc2_[2];
            _loc4_ = _loc3_.split(".");
            if(_loc4_[0] == "10" && _loc4_[1] == "7")
            {
               return true;
            }
         }
         return false;
      }
      
      public static function get isMac() : Boolean
      {
         var _loc1_:String = Capabilities.os;
         if(_loc1_.indexOf("Mac") > -1)
         {
            return true;
         }
         return false;
      }
   }
}
