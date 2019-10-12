package anifire.util
{
   public class UtilArray
   {
      
      private static var keys:Object = new Object();
       
      
      public function UtilArray()
      {
         super();
      }
      
      public static function removeDuplicates(param1:Array, param2:Boolean = false) : Array
      {
         keys = new Object();
         var _loc3_:Array = param1.filter(scanDuplicates);
         if(param2)
         {
            _loc3_.sort();
         }
         return _loc3_;
      }
      
      private static function scanDuplicates(param1:Object, param2:uint, param3:Array) : Boolean
      {
         if(keys.hasOwnProperty(param1))
         {
            return false;
         }
         keys[param1] = param1;
         return true;
      }
      
      public static function hasMatchingElement(param1:Array, param2:Array) : Boolean
      {
         var _loc4_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            if(param2.indexOf(_loc4_) > -1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public static function deleteTheseGuys(param1:Array, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:uint = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param2.indexOf(param1[_loc3_]);
            if(_loc4_ != -1)
            {
               param2.splice(_loc4_,1);
            }
            _loc3_++;
         }
      }
   }
}
