package anifire.util
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class UtilErrorLogger extends EventDispatcher
   {
      
      public static const FATAL_EVENT_LOGGED:String = "FATAL_EVENT_LOGGED";
      
      public static const ERROR_EVENT_LOGGED:String = "ERROR_EVENT_LOGGED";
      
      public static const LOG_SENT_COMPLETE:String = "LOG_SENT_COMPLETE";
      
      public static const LOG_SENT_FAIL:String = "LOG_SENT_FAIL";
      
      public static const SOURCE_FVM:String = "SOURCE_FVM";
      
      public static const SOURCE_PLAYER:String = "SOURCE_PLAYER";
      
      private static var _instance:UtilErrorLogger = null;
       
      
      public function UtilErrorLogger()
      {
         super();
      }
      
      public static function getInstance() : UtilErrorLogger
      {
         if(!_instance)
         {
            _instance = new UtilErrorLogger();
         }
         return _instance;
      }
      
      public function set movieId(param1:String) : void
      {
      }
      
      public function get movieId() : String
      {
         return "";
      }
      
      public function appendDebug(param1:String) : void
      {
      }
      
      public function appendError(param1:Error) : void
      {
      }
      
      public function appendCustomError(param1:String, param2:Error = null, param3:Object = null) : void
      {
      }
      
      public function fatal(param1:String) : void
      {
      }
      
      public function error(param1:String) : void
      {
      }
      
      public function info(param1:String) : void
      {
      }
      
      private function getFlashVars() : String
      {
         return "";
      }
      
      private function prepareModel() : Object
      {
         return new Object();
      }
      
      public function getEncryptedDebugInfo(param1:Boolean = false, param2:Boolean = false, param3:String = "") : String
      {
         return "";
      }
      
      private function get debugInfo() : String
      {
         return "";
      }
      
      public function get systemInfo() : String
      {
         return "";
      }
      
      public function get flashPlayerInfo() : String
      {
         return "";
      }
      
      public function get browserInfo() : String
      {
         return "";
      }
      
      private function sendLog(param1:Boolean = false) : void
      {
      }
      
      private function onSendLogComplete(param1:Event) : void
      {
      }
      
      private function onSendLogError(param1:Event) : void
      {
      }
      
      public function copyLog() : void
      {
      }
      
      public function set source(param1:String) : void
      {
      }
   }
}
