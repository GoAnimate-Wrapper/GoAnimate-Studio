package anifire.studio.core.sound
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.media.Sound;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   
   public class SoundWaveformData extends EventDispatcher
   {
      
      public static const PIXEL_PER_SAMPLE:Number = 1;
       
      
      private var _samples:Array;
      
      public function SoundWaveformData()
      {
         super();
      }
      
      public function init(param1:Sound) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:ByteArray = null;
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         var _loc7_:uint = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:uint = 0;
         var _loc11_:Number = NaN;
         if(!this._samples && param1)
         {
            this._samples = new Array();
            _loc2_ = 44100;
            _loc3_ = param1.length * 44.1;
            _loc4_ = new ByteArray();
            _loc3_ = param1.extract(_loc4_,_loc3_);
            _loc5_ = 8;
            _loc6_ = AnimeConstants.PIXEL_PER_SEC / PIXEL_PER_SAMPLE;
            _loc7_ = uint(_loc2_ / _loc6_) * _loc5_;
            _loc8_ = 0;
            _loc9_ = 0;
            _loc4_.position = 0;
            _loc10_ = 0;
            while(_loc10_ < _loc4_.length)
            {
               if(_loc10_ * _loc7_ < _loc4_.length)
               {
                  _loc4_.position = _loc10_ * _loc7_;
                  if(_loc4_.bytesAvailable >= _loc5_)
                  {
                     _loc9_ = _loc4_.readFloat();
                     _loc8_ = Math.max(_loc8_,Math.abs(_loc9_));
                     this._samples.push(_loc9_);
                     _loc9_ = _loc4_.readFloat();
                     _loc8_ = Math.max(_loc8_,Math.abs(_loc9_));
                     this._samples.push(_loc9_);
                  }
                  _loc10_++;
                  continue;
               }
               break;
            }
            _loc11_ = 1000;
            _loc10_ = 0;
            while(_loc10_ < this._samples.length)
            {
               this._samples[_loc10_] = Math.round(_loc11_ * Math.abs(this._samples[_loc10_]) / _loc8_) / _loc11_;
               _loc10_++;
            }
         }
      }
      
      public function get samples() : Array
      {
         return this._samples;
      }
      
      public function loadWaveform(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:URLVariables = AppConfigManager.instance.createURLVariables();
         _loc4_["wfid"] = param1;
         _loc4_["wftheme"] = param2;
         _loc4_["wfaid"] = param3;
         var _loc5_:URLRequest = new URLRequest(ServerConstants.SERVER_API_PATH + "getWaveform/");
         _loc5_.data = _loc4_;
         _loc5_.method = URLRequestMethod.POST;
         var _loc6_:URLLoader = new URLLoader();
         _loc6_.addEventListener(Event.COMPLETE,this.onUrlLoadComplete);
         _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.onUrlLoadError);
         _loc6_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUrlLoadError);
         _loc6_.load(_loc5_);
      }
      
      private function onUrlLoadComplete(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:URLLoader = param1.target as URLLoader;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.COMPLETE,this.onUrlLoadComplete);
            _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.onUrlLoadError);
            _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUrlLoadError);
            _loc3_ = _loc2_.data as String;
            if(_loc3_)
            {
               _loc4_ = _loc3_.substr(0,1);
               if(_loc4_ == "0")
               {
                  _loc3_ = _loc3_.substr(1);
                  if(_loc3_)
                  {
                     this._samples = _loc3_.split(",");
                  }
               }
            }
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function onUrlLoadError(param1:Event) : void
      {
         var _loc2_:URLLoader = param1.target as URLLoader;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.COMPLETE,this.onUrlLoadComplete);
            _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.onUrlLoadError);
            _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUrlLoadError);
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function saveWaveform(param1:Array, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:URLVariables = AppConfigManager.instance.createURLVariables();
         _loc5_["wfid"] = param2;
         _loc5_["wftheme"] = param3;
         _loc5_["wfaid"] = !!param4?param4:"";
         if(param1)
         {
            _loc5_["waveform"] = param1.toString();
         }
         var _loc6_:URLRequest = new URLRequest(ServerConstants.SERVER_API_PATH + "saveWaveform/");
         _loc6_.data = _loc5_;
         _loc6_.method = URLRequestMethod.POST;
         var _loc7_:URLLoader = new URLLoader();
         _loc7_.addEventListener(Event.COMPLETE,this.onUrlSaveComplete);
         _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.onUrlSaveError);
         _loc7_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUrlSaveError);
         _loc7_.load(_loc6_);
      }
      
      private function onUrlSaveComplete(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:URLLoader = param1.target as URLLoader;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.COMPLETE,this.onUrlSaveComplete);
            _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.onUrlSaveError);
            _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUrlSaveError);
            _loc3_ = _loc2_.data as String;
            if(_loc3_)
            {
               _loc4_ = _loc3_.substr(0,1);
               if(_loc4_ == "0")
               {
               }
            }
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function onUrlSaveError(param1:Event) : void
      {
         var _loc2_:URLLoader = param1.target as URLLoader;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.COMPLETE,this.onUrlSaveComplete);
            _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.onUrlSaveError);
            _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUrlSaveError);
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
