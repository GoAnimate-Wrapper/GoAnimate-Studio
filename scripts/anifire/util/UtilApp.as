package anifire.util
{
   public class UtilApp
   {
      
      public static const UNKNOWN:String = "unknown";
      
      public static const STUDIO:String = "studio";
      
      public static const CC:String = "cc";
      
      private static var _mainAppName:String = UNKNOWN;
       
      
      public function UtilApp()
      {
         super();
      }
      
      public static function set mainAppName(param1:String) : void
      {
         _mainAppName = param1;
      }
      
      public static function get mainAppName() : String
      {
         return _mainAppName;
      }
   }
}
