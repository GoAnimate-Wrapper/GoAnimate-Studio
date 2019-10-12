package anifire.util
{
   public class UtilDict
   {
      
      public static const BUNDLE_NAME_STUDIO:String = "go";
      
      public static const BUNDLE_NAME_GO:String = "go";
      
      public static const BUNDLE_NAME_TUTORIAL:String = "tutorial";
       
      
      public function UtilDict()
      {
         super();
      }
      
      public static function toDisplay(param1:String, param2:String) : String
      {
         var _loc3_:String = param2.replace(/\W/g,"_");
         var _loc4_:String = UtilGettext.translateAggregate(param1,param2);
         if(_loc4_ == null)
         {
            return param2;
         }
         return _loc4_;
      }
      
      public static function translate(param1:String) : String
      {
         return toDisplay(BUNDLE_NAME_STUDIO,param1);
      }
   }
}
