package anifire.managers
{
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   
   public class ExternalLinkManager
   {
      
      public static const DEFAULT_WINDOW_ID:String = "_self";
      
      public static const BLANK_WINDOW_ID:String = "_blank";
      
      public static const EXIT_STUDIO_FUNCTION:String = "exitStudio";
      
      public static const SESSION_FIELD_KEY:String = "ifut";
      
      private static var __instance:ExternalLinkManager;
      
      private static const UNDERSCORE_PATTERN:RegExp = /%5f/gi;
       
      
      private var _sessionVariables:URLVariables;
      
      public function ExternalLinkManager()
      {
         super();
         this.init();
      }
      
      public static function get instance() : ExternalLinkManager
      {
         if(!__instance)
         {
            __instance = new ExternalLinkManager();
         }
         return __instance;
      }
      
      private function init() : void
      {
         this._sessionVariables = new URLVariables();
         var _loc1_:String = AppConfigManager.instance.getValue(SESSION_FIELD_KEY);
         if(_loc1_)
         {
            this._sessionVariables.decode(unescape(_loc1_));
         }
      }
      
      public function exitStudio() : void
      {
         ExternalInterface.call(EXIT_STUDIO_FUNCTION);
      }
      
      public function navigate(param1:String, param2:String = "_self") : void
      {
         var _loc3_:URLRequest = new URLRequest(param1);
         navigateToURL(_loc3_,param2);
      }
      
      public function navigateWithSession(param1:String, param2:String = "_self") : void
      {
         var _loc3_:URLRequest = new URLRequest(param1);
         var _loc4_:URLVariables = new URLVariables();
         this.addSessionInfo(_loc4_);
         navigateToURL(new URLRequest(param1 + this.createRequestQueryString(_loc4_)),param2);
      }
      
      public function navigateWithVariables(param1:String, param2:URLVariables, param3:Boolean = true, param4:String = "_self") : void
      {
         var _loc5_:URLRequest = new URLRequest(param1);
         this.addSessionInfo(param2);
         if(param3)
         {
            _loc5_.method = URLRequestMethod.POST;
            _loc5_.data = param2;
            navigateToURL(_loc5_,param4);
         }
         else
         {
            navigateToURL(new URLRequest(param1 + this.createRequestQueryString(param2)),param4);
         }
      }
      
      private function addSessionInfo(param1:URLVariables) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in this._sessionVariables)
         {
            param1[_loc2_] = this._sessionVariables[_loc2_];
         }
      }
      
      private function createRequestQueryString(param1:URLVariables) : String
      {
         return "?" + unescape(param1.toString());
      }
   }
}
