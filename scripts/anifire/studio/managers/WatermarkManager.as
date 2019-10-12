package anifire.studio.managers
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.models.WatermarkData;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class WatermarkManager extends EventDispatcher
   {
      
      public static const DEFAULT_WATERMARK_ID:String = "0vTLbQy9hG7k";
      
      public static const NO_WATERMARK_ID:String = "0dhteqDBt5nY";
       
      
      private var _currentWatermark:WatermarkData;
      
      private var _watermarks:Array;
      
      private var _change:Boolean = false;
      
      public function WatermarkManager(param1:IEventDispatcher = null)
      {
         this._currentWatermark = new WatermarkData();
         this._watermarks = new Array();
         super(param1);
      }
      
      public function get currentWatermark() : WatermarkData
      {
         return this._currentWatermark;
      }
      
      public function set currentWatermark(param1:WatermarkData) : void
      {
         this._currentWatermark = param1;
         this._change = true;
      }
      
      public function loadAllWatermarks() : void
      {
         var _loc1_:URLVariables = AppConfigManager.instance.createURLVariables();
         var _loc2_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_WATERMARKS);
         _loc2_.method = URLRequestMethod.POST;
         _loc2_.data = _loc1_;
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.addEventListener(Event.COMPLETE,this.watermarksLoader_completeHandler);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.watermarksLoader_errorHandler);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.watermarksLoader_errorHandler);
         _loc3_.load(_loc2_);
      }
      
      private function watermarksLoader_completeHandler(param1:Event) : void
      {
         var _loc4_:XML = null;
         var _loc5_:WatermarkData = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.watermarksLoader_completeHandler);
         IEventDispatcher(param1.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR,this.watermarksLoader_errorHandler);
         IEventDispatcher(param1.currentTarget).removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.watermarksLoader_errorHandler);
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:String = _loc2_.data as String;
         if(_loc3_ && _loc3_.substr(0,1) != "1")
         {
            _loc4_ = new XML(_loc3_);
            this._watermarks = new Array();
            _loc5_ = new WatermarkData();
            _loc5_.id = WatermarkManager.NO_WATERMARK_ID;
            this._watermarks.push(_loc5_);
            this._currentWatermark = _loc5_;
            _loc5_ = new WatermarkData();
            _loc5_.id = WatermarkManager.DEFAULT_WATERMARK_ID;
            _loc5_.url = "default";
            this._watermarks.push(_loc5_);
            if(UtilSite.isSchoolSite)
            {
               _loc5_.url = "g4s";
               this._currentWatermark = _loc5_;
            }
            else if(ServerConstants.IS_WIX)
            {
               _loc5_.url = "fullScreen";
               if(!ServerConstants.IS_WIX_PAID)
               {
                  this._currentWatermark = _loc5_;
               }
            }
            else if(UtilUser.isFreeTrial)
            {
               _loc5_.url = "freeTrial";
               this._currentWatermark = _loc5_;
            }
            else if(UtilUser.userType <= UtilUser.PLUS_USER)
            {
               _loc5_.url = "twoLines";
               this._currentWatermark = _loc5_;
            }
            else if(UtilUser.userType < UtilUser.COMM_USER)
            {
               this._currentWatermark = _loc5_;
            }
            _loc6_ = 0;
            while(_loc6_ < _loc4_.watermark.length())
            {
               _loc5_ = new WatermarkData();
               _loc5_.id = _loc4_.watermark[_loc6_].@id;
               _loc5_.url = _loc4_.watermark[_loc6_].@thumbnail;
               this._watermarks.push(_loc5_);
               _loc6_++;
            }
            if(_loc4_.preview)
            {
               _loc7_ = String(_loc4_.preview);
               _loc8_ = this._watermarks.length;
               _loc6_ = 0;
               while(_loc6_ < _loc8_)
               {
                  if(WatermarkData(this._watermarks[_loc6_]).id == _loc7_)
                  {
                     this._currentWatermark = this._watermarks[_loc6_] as WatermarkData;
                     break;
                  }
                  _loc6_++;
               }
            }
         }
         this.dispatchEvent(param1);
      }
      
      public function get watermarks() : Array
      {
         return this._watermarks;
      }
      
      private function watermarksLoader_errorHandler(param1:Event) : void
      {
         IEventDispatcher(param1.currentTarget).removeEventListener(Event.COMPLETE,this.watermarksLoader_completeHandler);
         IEventDispatcher(param1.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR,this.watermarksLoader_errorHandler);
         IEventDispatcher(param1.currentTarget).removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.watermarksLoader_errorHandler);
      }
      
      public function saveWatermark(param1:String) : void
      {
         var _loc2_:URLVariables = null;
         var _loc3_:String = null;
         var _loc4_:URLRequest = null;
         var _loc5_:URLLoader = null;
         if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_WATERMARK) && this._change)
         {
            if(param1 && param1.length > 0)
            {
               _loc2_ = AppConfigManager.instance.createURLVariables();
               _loc3_ = ServerConstants.ACTION_ASSIGN_WATERMARK + param1 + "/" + this._currentWatermark.id;
               _loc4_ = new URLRequest(_loc3_);
               _loc4_.method = URLRequestMethod.POST;
               _loc4_.data = _loc2_;
               _loc5_ = new URLLoader();
               _loc5_.load(_loc4_);
            }
         }
      }
   }
}
