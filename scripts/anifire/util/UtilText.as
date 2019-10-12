package anifire.util
{
   public class UtilText
   {
       
      
      public function UtilText()
      {
         super();
      }
      
      public static function search(param1:String, param2:String) : Boolean
      {
         var _loc7_:String = null;
         var _loc8_:RegExp = null;
         param1 = param1.replace(/ {1,}/gi," ");
         param1 = param1.replace(/^[ \t]+/,"");
         param1 = param1.replace(/[ \t]+$/,"");
         var _loc3_:Array = param1.split(" ");
         var _loc4_:Number = 0;
         var _loc5_:Number = _loc3_.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc3_[_loc6_];
            _loc8_ = new RegExp(_loc7_,"i");
            if(param2.search(_loc8_) > -1)
            {
               _loc4_++;
            }
            _loc6_++;
         }
         if(_loc4_ >= _loc5_)
         {
            return true;
         }
         return false;
      }
   }
}
