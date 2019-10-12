package anifire.component
{
   import anifire.constant.CcLibConstant;
   import anifire.constant.ServerConstants;
   import anifire.core.CCLipSyncController;
   import anifire.managers.AppConfigManager;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashActionLoader;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashBytes;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public class CcActionLoader extends EventDispatcher
   {
      
      private static var _loaders:UtilHashActionLoader = new UtilHashActionLoader();
      
      private static var _configManager:AppConfigManager;
       
      
      private const STATE_NULL:String = "STATE_NULL";
      
      private const STATE_LOADING:String = "STATE_LOADING";
      
      private const STATE_LOADED:String = "STATE_LOADED";
      
      private var _imageData:Object;
      
      private var _regulator:ProcessRegulator;
      
      private var _state:String = "STATE_NULL";
      
      public function CcActionLoader()
      {
         super();
         _configManager = AppConfigManager.instance;
      }
      
      public static function getActionLoader(param1:String) : CcActionLoader
      {
         var _loc2_:CcActionLoader = null;
         if(param1 && param1 != "")
         {
            _loc2_ = _loaders.getValueByKey(param1) as CcActionLoader;
            if(!_loc2_)
            {
               _loc2_ = new CcActionLoader();
               _loaders.push(param1,_loc2_);
            }
            return _loc2_;
         }
         return new CcActionLoader();
      }
      
      public static function getStoreUrl(param1:String, param2:String = "", param3:Number = 1) : String
      {
         var _loc4_:String = null;
         var _loc6_:RegExp = null;
         switch(param3)
         {
            case 3:
               _loc4_ = "";
               break;
            default:
               _loc4_ = "cc_store/";
         }
         var _loc5_:String = _configManager.getValue(ServerConstants.FLASHVAR_STORE_PATH);
         if(_loc5_ == "" || _loc5_ == null)
         {
            _loc5_ = _configManager.getValue(ServerConstants.FLASHVAR_APISERVER);
            _loc5_ = _loc5_ + ("static/store/" + _loc4_ + param1);
         }
         else
         {
            _loc6_ = new RegExp(ServerConstants.FLASHVAR_STORE_PLACEHOLDER,"g");
            _loc5_ = _loc5_.replace(_loc6_,_loc4_ + param1);
         }
         return _loc5_;
      }
      
      public function get imageData() : Object
      {
         return this._imageData;
      }
      
      public function load(param1:String, param2:String = "", param3:String = "", param4:Boolean = false) : void
      {
         var request:URLRequest = null;
         var stream:UtilURLStream = null;
         var aid:String = param1;
         var actionId:String = param2;
         var facialId:String = param3;
         var isDefault:Boolean = param4;
         try
         {
            if(aid)
            {
               stream = new UtilURLStream();
               request = UtilNetwork.getGetCcActionRequest(aid,actionId,facialId,isDefault);
               stream.addEventListener(Event.COMPLETE,this.onXmlLoaded);
               stream.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
               stream.addEventListener(UtilURLStream.TIME_OUT,this.timeoutHandler);
               stream.load(request);
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CcActionLoader:load",e);
            return;
         }
      }
      
      private function onXmlLoaded(param1:Event) : void
      {
         var stream:URLStream = null;
         var bytes:ByteArray = null;
         var xmlCC:XML = null;
         var e:Event = param1;
         try
         {
            IEventDispatcher(e.target).removeEventListener(e.type,this.onXmlLoaded);
            stream = URLStream(e.target);
            bytes = new ByteArray();
            stream.readBytes(bytes);
            xmlCC = XML(bytes);
            this.loadCcComponents(xmlCC);
            return;
         }
         catch(e:Error)
         {
            dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
            UtilErrorLogger.getInstance().appendCustomError("CcActionLoader:onXmlLoaded:",e);
            return;
         }
      }
      
      public function loadCcComponents(param1:XML, param2:Number = 0, param3:Number = 0, param4:UtilHashBytes = null, param5:Number = 1, param6:Boolean = false, param7:String = "", param8:String = "", param9:Boolean = false) : void
      {
         var _loc10_:URLStream = null;
         var _loc11_:String = null;
         var _loc12_:XML = null;
         var _loc13_:CcComponentLoader = null;
         var _loc14_:String = null;
         var _loc15_:* = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         if(this._state == this.STATE_LOADED)
         {
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
         else if(this._state == this.STATE_LOADING)
         {
            return;
         }
         this._state = this.STATE_LOADING;
         try
         {
            if(param1)
            {
               _loc14_ = _configManager.getValue(ServerConstants.FLASHVAR_IS_VIDEO_RECORD_MODE);
               this._imageData = new Object();
               this._imageData["imageData"] = !!param4?param4:new UtilHashBytes();
               this._imageData["xml"] = param1;
               this._regulator = new ProcessRegulator();
               for each(_loc12_ in param1..library)
               {
                  _loc17_ = _loc12_.@theme_id;
                  _loc18_ = _loc12_.@type;
                  if(param5 == 3)
                  {
                     if(_loc12_.@type == CcLibConstant.COMPONENT_TYPE_MOUTH)
                     {
                        this.doLoadExtraComponent(_loc12_,param8,param5);
                        continue;
                     }
                     _loc11_ = getStoreUrl(_loc17_ + "/charparts" + "/" + _loc18_ + "/" + _loc12_.@path + ".swf",_loc17_,param5);
                     _loc18_ = CcLibConstant.LIBRARY_TYPE_GOHANDS;
                  }
                  else
                  {
                     _loc11_ = getStoreUrl(_loc17_ + "/" + _loc18_ + "/" + _loc12_.@path + ".swf",_loc17_);
                  }
                  _loc15_ = _loc17_ + "." + _loc18_ + "." + _loc12_.@path + ".swf";
                  if(UtilHashBytes(this._imageData["imageData"]).getValueByKey(_loc15_) == null)
                  {
                     _loc13_ = CcComponentLoader.getComponentLoader(_loc15_,_loc11_);
                     _loc13_.addEventListener(Event.COMPLETE,this.onCcComponentLoaded);
                     _loc13_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcComponentFailed);
                     this._regulator.addProcess(_loc13_,Event.COMPLETE);
                  }
               }
               _loc16_ = "default";
               for each(_loc12_ in param1..component)
               {
                  if(_loc12_.@type == "bodyshape")
                  {
                     _loc16_ = _loc12_.@path;
                  }
               }
               for each(_loc12_ in param1..component)
               {
                  if(_loc12_.hasOwnProperty("@file"))
                  {
                     _loc11_ = getStoreUrl(_loc12_.@theme_id + "/" + _loc12_.@type + "/" + _loc12_.@path + "/" + _loc12_.@file);
                  }
                  else if(_loc12_.@type == "freeaction" && _loc12_.@path != "default" && !param9)
                  {
                     if(_loc16_ != _loc12_.@path)
                     {
                        _loc11_ = getStoreUrl(_loc12_.@theme_id + "/" + _loc12_.@type + "/" + _loc16_ + "/" + _loc12_.@path + ".swf");
                     }
                     else
                     {
                        continue;
                     }
                  }
                  else
                  {
                     continue;
                  }
                  _loc15_ = _loc12_.@theme_id + "." + _loc12_.@type + "." + _loc12_.@path + ".swf";
                  if(UtilHashBytes(this._imageData["imageData"]).getValueByKey(_loc15_) == null)
                  {
                     _loc13_ = CcComponentLoader.getComponentLoader(_loc15_,_loc11_);
                     _loc13_.addEventListener(Event.COMPLETE,this.onCcComponentLoaded);
                     _loc13_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcComponentFailed);
                     this._regulator.addProcess(_loc13_,Event.COMPLETE);
                  }
                  this.doLoadExtraComponent(_loc12_);
               }
               this._regulator.startProcess();
               if(this._regulator.numProcess == 0)
               {
                  this._state = this.STATE_LOADED;
                  this.dispatchEvent(new Event(Event.COMPLETE));
               }
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function loadCcComponentsByCam(param1:CCCharacterActionModel, param2:UtilHashBytes = null, param3:Number = 1) : void
      {
         var _loc4_:URLStream = null;
         var _loc5_:String = null;
         var _loc6_:CcComponentLoader = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:* = null;
         var _loc10_:String = null;
         var _loc11_:Object = null;
         var _loc12_:* = null;
         if(param1)
         {
            if(!this._imageData)
            {
               this._imageData = new Object();
            }
            if(!this._imageData["imageData"])
            {
               if(param2)
               {
                  this._imageData["imageData"] = param2;
               }
               else
               {
                  this._imageData["imageData"] = new UtilHashBytes();
               }
            }
            this._imageData["cam"] = param1;
         }
         if(this._state == this.STATE_LOADED)
         {
            this.dispatchEvent(new Event(Event.COMPLETE));
            return;
         }
         if(this._state == this.STATE_LOADING)
         {
            return;
         }
         this._state = this.STATE_LOADING;
         if(param1)
         {
            _loc7_ = _configManager.getValue(ServerConstants.FLASHVAR_IS_VIDEO_RECORD_MODE);
            this._regulator = new ProcessRegulator();
            for(_loc9_ in param1.libraryPaths)
            {
               _loc10_ = param1.libraryPaths[_loc9_] as String;
               _loc5_ = getStoreUrl(_loc10_);
               _loc8_ = _loc10_;
               if(UtilHashBytes(this._imageData["imageData"]).getValueByKey(_loc8_) == null)
               {
                  _loc6_ = CcComponentLoader.getComponentLoader(_loc8_,_loc5_);
                  _loc6_.addEventListener(Event.COMPLETE,this.onCcComponentLoaded);
                  _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcComponentFailed);
                  this._regulator.addProcess(_loc6_,Event.COMPLETE);
               }
            }
            for(_loc9_ in param1.components)
            {
               if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc9_) > -1)
               {
                  _loc11_ = param1.components[_loc9_];
                  for(_loc12_ in _loc11_)
                  {
                     _loc10_ = _loc11_[_loc12_].path;
                     _loc5_ = getStoreUrl(_loc10_);
                     _loc8_ = _loc10_;
                     if(UtilHashBytes(this._imageData["imageData"]).getValueByKey(_loc8_) == null)
                     {
                        _loc6_ = CcComponentLoader.getComponentLoader(_loc8_,_loc5_);
                        _loc6_.addEventListener(Event.COMPLETE,this.onCcComponentLoaded);
                        _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcComponentFailed);
                        this._regulator.addProcess(_loc6_,Event.COMPLETE);
                     }
                  }
               }
               else
               {
                  _loc10_ = param1.getComponentByType(_loc9_).path;
                  _loc5_ = getStoreUrl(_loc10_);
                  _loc8_ = _loc10_;
                  if(UtilHashBytes(this._imageData["imageData"]).getValueByKey(_loc8_) == null)
                  {
                     _loc6_ = CcComponentLoader.getComponentLoader(_loc8_,_loc5_);
                     _loc6_.addEventListener(Event.COMPLETE,this.onCcComponentLoaded);
                     _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcComponentFailed);
                     this._regulator.addProcess(_loc6_,Event.COMPLETE);
                  }
                  this.doLoadExtraComponentByCam(param1,_loc9_);
               }
            }
            this._regulator.startProcess();
            if(this._regulator.numProcess == 0)
            {
               this._state = this.STATE_LOADED;
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
         }
      }
      
      private function onCcComponentLoaded(param1:Event) : void
      {
         var loader:CcComponentLoader = null;
         var e:Event = param1;
         try
         {
            loader = CcComponentLoader(e.target);
            if(loader)
            {
               loader.removeEventListener(e.type,this.onCcComponentLoaded);
               this.addComponent(loader.componentId,loader.swfBytes);
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CcActionLoader:onCcComponentLoaded:",e);
            return;
         }
      }
      
      private function addComponent(param1:String, param2:ByteArray) : void
      {
         UtilHashBytes(this._imageData["imageData"]).push(param1,param2);
         this.progress();
      }
      
      private function progress() : void
      {
         var _loc1_:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS);
         _loc1_.bytesLoaded = UtilHashBytes(this._imageData["imageData"]).length;
         _loc1_.bytesTotal = this._regulator.numProcess;
         this.dispatchEvent(_loc1_);
         if(UtilHashBytes(this._imageData["imageData"]).length == this._regulator.numProcess)
         {
            this._state = this.STATE_LOADED;
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      public function doLoadExtraComponentByCam(param1:CCCharacterActionModel, param2:String, param3:String = "", param4:Number = 1) : void
      {
         var _loc5_:CcComponentLoader = null;
         var _loc6_:Object = null;
         var _loc7_:UtilHashBytes = null;
         var _loc8_:* = null;
         var _loc9_:String = null;
         if(param2 == CcLibConstant.COMPONENT_TYPE_MOUTH)
         {
            _loc6_ = CCLipSyncController.getLipSyncComponentItemsByCam(param1,param2,param3,param4);
            _loc7_ = this._imageData["imageData"] as UtilHashBytes;
            for(_loc8_ in _loc6_)
            {
               _loc9_ = _loc6_[_loc8_];
               if(_loc7_.getValueByKey(_loc9_) == null)
               {
                  _loc5_ = CcComponentLoader.getComponentLoader(_loc9_,_loc8_);
                  _loc5_.addEventListener(Event.COMPLETE,this.onCcComponentLoaded);
                  _loc5_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcComponentFailed);
                  this._regulator.addProcess(_loc5_,Event.COMPLETE);
               }
            }
         }
      }
      
      public function doLoadExtraComponent(param1:XML, param2:String = "", param3:Number = 1) : void
      {
         var _loc4_:CcComponentLoader = null;
         var _loc7_:UtilHashArray = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc5_:UtilHashArray = new UtilHashArray();
         if(param1.@type == CcLibConstant.COMPONENT_TYPE_MOUTH)
         {
            _loc7_ = CCLipSyncController.getLipSyncComponentItems(param1,param2,param3);
            _loc5_.insert(0,_loc7_);
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc8_ = _loc5_.getKey(_loc6_);
            _loc9_ = _loc5_.getValueByIndex(_loc6_);
            if(UtilHashBytes(this._imageData["imageData"]).getValueByKey(_loc9_) == null)
            {
               _loc4_ = CcComponentLoader.getComponentLoader(_loc9_,_loc8_);
               _loc4_.addEventListener(Event.COMPLETE,this.onCcComponentLoaded);
               _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.onCcComponentFailed);
               this._regulator.addProcess(_loc4_,Event.COMPLETE);
            }
            _loc6_++;
         }
      }
      
      private function onCcComponentFailed(param1:IOErrorEvent) : void
      {
         var _loc2_:CcComponentLoader = CcComponentLoader(param1.target);
         if(_loc2_)
         {
            _loc2_.removeEventListener(param1.type,this.onCcComponentFailed);
            this.addComponent(_loc2_.componentId,_loc2_.swfBytes);
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function timeoutHandler(param1:Event) : void
      {
         this.dispatchEvent(param1);
      }
      
      public function clearImageData() : void
      {
         this._imageData = null;
      }
   }
}
