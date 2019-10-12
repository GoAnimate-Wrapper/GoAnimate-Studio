package anifire.util
{
   import anifire.constant.ResponseConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.ServerRequestEvent;
   import anifire.managers.AppConfigManager;
   import com.adobe.serialization.json.JSONParseError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   
   public class ApiRequest extends EventDispatcher
   {
      
      public static const PARAM_USER_TOKEN:String = "utk";
      
      public static const PARAM_DATA:String = "data";
      
      public static const INVALID_JSON:String = "invalid JSON format";
      
      private static const _configManager:AppConfigManager = AppConfigManager.instance;
      
      private static var _userToken:String;
       
      
      public function ApiRequest()
      {
         super();
      }
      
      private static function get userToken() : String
      {
         if(!_userToken)
         {
            if(_configManager.getValue(ServerConstants.PARAM_U_INFO))
            {
               _userToken = _configManager.getValue(ServerConstants.PARAM_U_INFO);
            }
            else if(_configManager.getValue(ServerConstants.PARAM_U_INFO_SCHOOL))
            {
               _userToken = _configManager.getValue(ServerConstants.PARAM_U_INFO_SCHOOL);
            }
         }
         return _userToken;
      }
      
      public function post(param1:String, param2:Object = null) : void
      {
         var _loc3_:Object = {};
         if(userToken != "")
         {
            _loc3_[PARAM_USER_TOKEN] = userToken;
         }
         if(param2)
         {
            _loc3_[PARAM_DATA] = param2;
         }
         var _loc4_:URLRequest = new URLRequest(param1);
         _loc4_.data = com.adobe.serialization.json.JSON.encode(_loc3_);
         _loc4_.method = URLRequestMethod.POST;
         _loc4_.requestHeaders.push(new URLRequestHeader("Content-Type","application/json"));
         _loc4_.requestHeaders.push(new URLRequestHeader("Accept","application/json"));
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = URLLoaderDataFormat.BINARY;
         _loc5_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.post_securityErrorHandler);
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.post_ioErrorHandler);
         _loc5_.addEventListener(Event.COMPLETE,this.post_completedHandler);
         _loc5_.load(_loc4_);
      }
      
      private function post_securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function post_ioErrorHandler(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function post_completedHandler(param1:Event) : void
      {
         var _loc3_:ServerRequestEvent = null;
         var _loc4_:Object = null;
         var _loc2_:URLLoader = URLLoader(param1.target);
         try
         {
            _loc4_ = com.adobe.serialization.json.JSON.decode(_loc2_.data);
         }
         catch(e:JSONParseError)
         {
         }
         if(_loc4_)
         {
            if(_loc4_[ResponseConstants.STATUS] == ResponseConstants.OK)
            {
               _loc3_ = new ServerRequestEvent(ServerRequestEvent.COMPLETE);
               _loc3_.data = _loc4_[ResponseConstants.DATA] as Object;
            }
            else
            {
               _loc3_ = new ServerRequestEvent(ServerRequestEvent.FAIL);
               _loc3_.message = _loc4_[ResponseConstants.MESSAGE];
            }
         }
         else
         {
            _loc3_ = new ServerRequestEvent(ServerRequestEvent.FAIL);
            _loc3_.message = UtilDict.toDisplay(UtilDict.BUNDLE_NAME_GO,INVALID_JSON);
         }
         this.dispatchEvent(_loc3_);
      }
   }
}
