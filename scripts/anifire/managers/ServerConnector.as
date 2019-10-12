package anifire.managers
{
   import anifire.constant.ServerConstants;
   import anifire.event.StudioEvent;
   import anifire.models.ApiEventModel;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilUser;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.Timer;
   
   public class ServerConnector extends EventDispatcher
   {
      
      private static var _instance:ServerConnector;
      
      public static const TYPE_FONT:String = "font";
      
      private static var _configManager:AppConfigManager = AppConfigManager.instance;
      
      public static const HEARTBEAT_URI:String = "goapi/heartbeat/v1/";
      
      public static const HEARTBEAT_INTERVAL:int = 2 * 60 * 1000;
       
      
      private var _logger:UtilErrorLogger;
      
      private var _decodeFunc:Function;
      
      private var _events:Vector.<ApiEventModel>;
      
      private var _heartbeatStarted:Boolean;
      
      private var _heartbeatTimer:Timer;
      
      private var _heartbeatLoader:URLLoader;
      
      private var _heartbeatRequest:URLRequest;
      
      public function ServerConnector()
      {
         super();
         this.init();
      }
      
      public static function get instance() : ServerConnector
      {
         if(!_instance)
         {
            _instance = new ServerConnector();
         }
         return _instance;
      }
      
      protected function init() : void
      {
         var _loc1_:String = null;
         this._events = new Vector.<ApiEventModel>();
         this._logger = UtilErrorLogger.getInstance();
         this._decodeFunc = com.adobe.serialization.json.JSON.decode;
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("onUpsellUpgrade",this.onUpsellUpgradePending);
            ExternalInterface.addCallback("selectSceneByGuid",this.selectSceneByGuid);
            ExternalInterface.addCallback("setWorkNoteMenuItemSelected",this.setWorkNoteMenuItemSelected);
            ExternalInterface.addCallback("bind",this.bind);
            ExternalInterface.addCallback("unbind",this.unbind);
            ExternalInterface.addCallback("openYourLibrary",this.openYourLibrary);
            _loc1_ = _configManager.getValue("initcb");
            if(_loc1_)
            {
               ExternalInterface.call(_loc1_);
            }
         }
      }
      
      public function bind(param1:String, param2:String) : void
      {
         this._events.push(new ApiEventModel(param1,param2));
      }
      
      public function unbind(param1:String, param2:String) : void
      {
         var _loc5_:ApiEventModel = null;
         var _loc3_:int = this._events.length;
         var _loc4_:int = _loc3_;
         while(_loc4_ >= 0)
         {
            _loc5_ = this._events[_loc4_];
            if(_loc5_.eventName == param1 && _loc5_.callback == param2)
            {
               this._events.splice(_loc4_,1);
            }
            _loc4_--;
         }
      }
      
      public function notifyEvent(param1:String, param2:Object = null) : void
      {
         var _loc5_:ApiEventModel = null;
         if(!ExternalInterface.available)
         {
            return;
         }
         if(!param2)
         {
            param2 = {};
         }
         var _loc3_:int = this._events.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this._events[_loc4_];
            if(_loc5_.eventName == param1)
            {
               ExternalInterface.call(_loc5_.callback,param1,param2);
            }
            _loc4_++;
         }
      }
      
      public function notifyAssetReady(param1:String, param2:String) : void
      {
         var _loc3_:Object = {};
         _loc3_["type"] = param1;
         _loc3_["file"] = param2;
         this.notifyEvent("userAssetReady",_loc3_);
      }
      
      public function notifyAssetDelete(param1:String, param2:String) : void
      {
         var _loc3_:Object = {};
         _loc3_["type"] = param1;
         _loc3_["file"] = param2;
         this.notifyEvent("userAssetDelete",_loc3_);
      }
      
      public function startHeartbeat(param1:String = null) : void
      {
         if(this._heartbeatStarted)
         {
            return;
         }
         this._heartbeatStarted = true;
         this._heartbeatTimer = new Timer(HEARTBEAT_INTERVAL);
         this._heartbeatTimer.addEventListener(TimerEvent.TIMER,this.onHeartbeatTimer);
         var _loc2_:URLVariables = new URLVariables();
         _configManager.appendURLVariables(_loc2_);
         if(!_loc2_["movieId"] && param1)
         {
            _loc2_["movieId"] = param1;
         }
         _loc2_["actions"] = "lock";
         this._heartbeatRequest = new URLRequest(ServerConstants.HOST_PATH + HEARTBEAT_URI);
         this._heartbeatRequest.data = _loc2_;
         this._heartbeatRequest.method = URLRequestMethod.POST;
         this._logger.info("[HB] Started with movie ID: " + _loc2_["movieId"]);
         this.sendHeartbeat();
      }
      
      private function sendHeartbeat() : void
      {
         this._heartbeatLoader = new URLLoader();
         this._heartbeatLoader.addEventListener(Event.COMPLETE,this.onHeartbeatComplete);
         this._heartbeatLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onHeartbeatError);
         this._heartbeatLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onHeartbeatError);
         this._heartbeatLoader.load(this._heartbeatRequest);
      }
      
      private function onHeartbeatTimer(param1:TimerEvent) : void
      {
         this.sendHeartbeat();
      }
      
      private function onHeartbeatComplete(param1:Event) : void
      {
         var studioEvent:StudioEvent = null;
         var result:Object = null;
         var event:Event = param1;
         try
         {
            result = this._decodeFunc(this._heartbeatLoader.data);
            if(result["health"] == "1")
            {
               this._logger.info("[HB OK] " + result["ts"]);
               if(result["locked"] == "1")
               {
                  studioEvent = new StudioEvent(StudioEvent.HEARTBEAT_TAKEOVER);
                  studioEvent.data = result["locker"];
                  this._logger.info("[LOCK] Taken over by:" + result["locker"]);
                  dispatchEvent(studioEvent);
               }
            }
            else
            {
               this._logger.info("[HB NG] " + result["errmsg"] + " " + result["ts"]);
            }
         }
         catch(e:Error)
         {
            _logger.info("[HB ERR]\n" + _heartbeatLoader.data + "\n---\n");
            return;
         }
         this.clearHeartbeatLoader();
         this._heartbeatTimer.reset();
         this._heartbeatTimer.start();
      }
      
      private function onHeartbeatError(param1:Event) : void
      {
         this._logger.info("[HB FAIL] " + param1);
         this.clearHeartbeatLoader();
         this._heartbeatTimer.reset();
         this._heartbeatTimer.start();
      }
      
      private function clearHeartbeatLoader() : void
      {
         if(this._heartbeatLoader)
         {
            this._heartbeatLoader.addEventListener(Event.COMPLETE,this.onHeartbeatComplete);
            this._heartbeatLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onHeartbeatError);
            this._heartbeatLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onHeartbeatError);
            this._heartbeatLoader = null;
         }
      }
      
      public function notifySceneChange(param1:String) : void
      {
         var _loc2_:Object = null;
         if(param1)
         {
            _loc2_ = {};
            _loc2_["guid"] = param1;
            this.notifyEvent("scene",_loc2_);
         }
      }
      
      public function setWorkNoteSideBarVisible(param1:Boolean) : void
      {
         var _loc2_:Object = {};
         _loc2_["visible"] = param1;
         this.notifyEvent("showSideBar",_loc2_);
      }
      
      public function setWorkNoteMenuItemSelected(param1:Boolean) : void
      {
         var _loc2_:StudioEvent = new StudioEvent(StudioEvent.WORK_NOTE_VISIBILITY_CHANGE);
         _loc2_.data = param1;
         dispatchEvent(_loc2_);
      }
      
      public function openYourLibrary() : void
      {
         var _loc1_:StudioEvent = new StudioEvent(StudioEvent.OPEN_YOUR_LIBRARY);
         dispatchEvent(_loc1_);
      }
      
      public function selectSceneByGuid(param1:String) : void
      {
         var _loc2_:StudioEvent = null;
         if(param1)
         {
            _loc2_ = new StudioEvent(StudioEvent.SELECT_SCENE_FROM_NOTE);
            _loc2_.data = param1;
            dispatchEvent(_loc2_);
         }
      }
      
      public function get neverDisplayTutorial() : Boolean
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call("interactiveTutorial.neverDisplay");
         }
         return false;
      }
      
      public function set neverDisplayTutorial(param1:Boolean) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("interactiveTutorial.neverDisplay",param1);
         }
      }
      
      public function displayUpsellHook(param1:String) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("triggerUpsell",param1);
         }
      }
      
      public function onUpsellUpgradePending() : void
      {
         dispatchEvent(new StudioEvent(StudioEvent.UPGRADE_PENDING));
      }
      
      public function refreshUserType() : void
      {
         var _loc1_:URLVariables = AppConfigManager.instance.createURLVariables();
         var _loc2_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_INIT_PARAMS);
         _loc2_.data = _loc1_;
         _loc2_.method = URLRequestMethod.POST;
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.addEventListener(Event.COMPLETE,this.onRefreshUserTypeComplete);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.onRefreshUserTypeError);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRefreshUserTypeError);
         _loc3_.load(_loc2_);
      }
      
      private function onRefreshUserTypeComplete(param1:Event) : void
      {
         var result:Object = null;
         var newUserType:Number = NaN;
         var event:Event = param1;
         var urlLoader:URLLoader = event.target as URLLoader;
         urlLoader.removeEventListener(Event.COMPLETE,this.onRefreshUserTypeComplete);
         urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.onRefreshUserTypeError);
         urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRefreshUserTypeError);
         try
         {
            result = this._decodeFunc(urlLoader.data);
            if(result["result"] == true)
            {
               newUserType = result["ut"];
               UtilUser.updateUserType(newUserType);
               this._logger.info("User type upgraded to: " + newUserType);
            }
            else
            {
               this.dispatchRefreshUserTypeError(result["message"]);
               return;
            }
         }
         catch(e:Error)
         {
            dispatchRefreshUserTypeError(e.message,e);
            return;
         }
         dispatchEvent(new StudioEvent(StudioEvent.UPGRADE_COMPLETE));
      }
      
      private function onRefreshUserTypeError(param1:Event) : void
      {
         var _loc2_:URLLoader = param1.target as URLLoader;
         _loc2_.removeEventListener(Event.COMPLETE,this.onRefreshUserTypeComplete);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.onRefreshUserTypeError);
         _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRefreshUserTypeError);
         this.dispatchRefreshUserTypeError(param1.toString());
      }
      
      private function dispatchRefreshUserTypeError(param1:String = "", param2:Error = null) : void
      {
         this._logger.appendCustomError("Upgrade error: " + param1,param2);
         dispatchEvent(new StudioEvent(StudioEvent.UPGRADE_ERROR));
      }
   }
}
