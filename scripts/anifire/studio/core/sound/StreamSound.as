package anifire.studio.core.sound
{
   import anifire.constant.ServerConstants;
   import anifire.event.NetStreamClientEvent;
   import anifire.sound.NetStreamClient;
   import anifire.sound.NetStreamController;
   import anifire.studio.components.SoundContainer;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.NetStatusEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   import flash.utils.Timer;
   
   public class StreamSound extends EventDispatcher implements ISoundable
   {
       
      
      private var _url:String;
      
      private var _filename:String;
      
      private var _soundChannel:SoundChannel;
      
      private var _soundTransform:SoundTransform;
      
      private var _duration:Number;
      
      private var _sound:Sound;
      
      private var _netConnect:NetConnection;
      
      private var _netStream:NetStream;
      
      private var _playhead:Number;
      
      private var _soundContainer:SoundContainer;
      
      private var _isPlaying:Boolean;
      
      private var _timer:Timer;
      
      private var _startTime:Number;
      
      private var _endTime:Number;
      
      private var _repeat:Boolean;
      
      private var _loopCounter:int;
      
      private var _fadeFactor:Number = 1;
      
      private var _volume:Number = 1;
      
      private var _inner_volume:Number = 1;
      
      private var _customFadeInDuration:Number;
      
      private var _customFadeInVolume:Number;
      
      private var _customFadeOutDuration:Number;
      
      private var _customFadeOutVolume:Number;
      
      private var _netStreamController:NetStreamController;
      
      public function StreamSound(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function get startTime() : Number
      {
         return this._startTime;
      }
      
      public function get endTime() : Number
      {
         return this._endTime;
      }
      
      public function set endTime(param1:Number) : void
      {
         this._endTime = param1;
      }
      
      public function get customFadeInVolume() : Number
      {
         return this._customFadeInVolume;
      }
      
      public function set customFadeInVolume(param1:Number) : void
      {
         this._customFadeInVolume = param1;
      }
      
      public function get customFadeInDuration() : Number
      {
         return this._customFadeInDuration;
      }
      
      public function set customFadeInDuration(param1:Number) : void
      {
         this._customFadeInDuration = param1;
      }
      
      public function get customFadeOutVolume() : Number
      {
         return this._customFadeOutVolume;
      }
      
      public function set customFadeOutVolume(param1:Number) : void
      {
         this._customFadeOutVolume = param1;
      }
      
      public function get customFadeOutDuration() : Number
      {
         return this._customFadeOutDuration;
      }
      
      public function set customFadeOutDuration(param1:Number) : void
      {
         this._customFadeOutDuration = param1;
      }
      
      public function get netStreamController() : NetStreamController
      {
         return this._netStreamController;
      }
      
      public function set netStreamController(param1:NetStreamController) : void
      {
         this._netStreamController = param1;
      }
      
      public function get fadeFactor() : Number
      {
         return this._fadeFactor;
      }
      
      public function set fadeFactor(param1:Number) : void
      {
         this._fadeFactor = param1;
      }
      
      protected function get volume() : Number
      {
         return this._volume;
      }
      
      protected function set volume(param1:Number) : void
      {
         this._volume = param1;
      }
      
      public function get inner_volume() : Number
      {
         return this._inner_volume;
      }
      
      public function set inner_volume(param1:Number) : void
      {
         this._inner_volume = param1;
      }
      
      private function get soundTransform() : SoundTransform
      {
         return this._soundTransform;
      }
      
      private function set soundTransform(param1:SoundTransform) : void
      {
         this._soundTransform = param1;
      }
      
      public function setVolume(param1:Number) : void
      {
         this.volume = param1;
         this.soundTransform.volume = this.fadeFactor * this.volume * this.inner_volume;
         this.netStreamController.soundTransform = this.soundTransform;
      }
      
      protected function getVolume() : Number
      {
         return this.volume;
      }
      
      public function fadeVolume(param1:Number) : void
      {
         this.fadeFactor = param1;
         this.soundTransform.volume = this.fadeFactor * this.volume * this.inner_volume;
         this.netStreamController.soundTransform = this.soundTransform;
      }
      
      public function set soundContainer(param1:SoundContainer) : void
      {
         this._soundContainer = param1;
      }
      
      public function get soundContainer() : SoundContainer
      {
         return this._soundContainer;
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      public function get playedTime() : Number
      {
         return this._playhead;
      }
      
      public function init(param1:String, param2:String, param3:Number) : void
      {
         this._url = param1;
         this._filename = param2;
         this._duration = param3;
         this.dispatchEvent(new SoundEvent(SoundEvent.READY_TO_PLAY,this));
      }
      
      public function clone() : ISoundable
      {
         var _loc1_:StreamSound = new StreamSound();
         _loc1_._url = this._url;
         _loc1_._filename = this._filename;
         _loc1_._duration = this._duration;
         return _loc1_;
      }
      
      public function play(param1:Number = 0, param2:SoundContainer = null, param3:Number = 1, param4:Number = -1, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:Number = 0, param9:Boolean = true) : void
      {
         this._netConnect = new NetConnection();
         this._netConnect.addEventListener(NetStatusEvent.NET_STATUS,this.netStatusHandler);
         this._netConnect.connect(ServerConstants.ACTION_GET_STREAM_SOUND);
         this._playhead = param1;
         this.soundContainer = param2;
         this._startTime = param1;
         this._repeat = param9;
         if(param4 > param1)
         {
            this._customFadeInDuration = UtilUnitConvert.frameToDuration(param5) * 1000;
            this._customFadeInVolume = param6;
            this._customFadeOutDuration = UtilUnitConvert.frameToDuration(param7) * 1000;
            this._customFadeOutVolume = param8;
            this._loopCounter = 0;
            this._endTime = param4;
            this._timer = new Timer(40);
            this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.start();
         }
         this._isPlaying = true;
         this.dispatchEvent(new SoundEvent(SoundEvent.PLAYED,this));
      }
      
      private function onTimer(param1:Event) : void
      {
         if(this._netStream)
         {
            if(this._netStream.time * 1000 >= this._endTime)
            {
               this.stop();
            }
         }
      }
      
      private function netStatusHandler(param1:NetStatusEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:NetStreamClient = null;
         var _loc4_:UtilCrypto = null;
         var _loc5_:String = null;
         if(param1.info.code == "NetConnection.Connect.Success")
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.netStatusHandler);
            _loc2_ = param1.info.secureToken;
            if(_loc2_ != null)
            {
               _loc4_ = new UtilCrypto(UtilCrypto.MODE_DECRYPT_RTMPE_TOKEN);
               _loc5_ = _loc4_.decryptString(_loc2_);
               this._netConnect.call("secureTokenResponse",null,_loc5_);
            }
            this._netStream = new NetStream(this._netConnect);
            this._netStream.bufferTime = 1;
            _loc3_ = new NetStreamClient();
            _loc3_.addEventListener(NetStreamClientEvent.PLAY_STATUS_READY,this.doSayPlayComplete);
            this._netStream.client = _loc3_;
            this._netStream.play("mp3:" + this._filename);
            this._netStream.seek(this._playhead / 1000);
            this.startIndicator(this._playhead);
         }
      }
      
      public function stop() : void
      {
         this.destroy();
         this.dispatchEvent(new SoundEvent(SoundEvent.STOPPED,this));
      }
      
      public function destroy() : void
      {
         if(this._netStream != null)
         {
            this._netStream.pause();
            this._netStream.close();
            this._netStream = null;
         }
         if(this._netConnect != null)
         {
            this._netConnect.close();
            this._netConnect = null;
         }
         this.stopIndicator();
         this._isPlaying = false;
         if(this._timer)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer = null;
         }
      }
      
      public function getDuration() : Number
      {
         return this._duration;
      }
      
      public function get isReady() : Boolean
      {
         return true;
      }
      
      private function doSayPlayComplete(param1:NetStreamClientEvent) : void
      {
         if(param1.infoObject.code == "NetStream.Play.Complete")
         {
            this._isPlaying = false;
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doSayPlayComplete);
            this.dispatchEvent(new SoundEvent(SoundEvent.PLAY_COMPLETE,this));
            this.dispatchEvent(new SoundEvent(SoundEvent.STOPPED,this));
         }
      }
      
      private function startIndicator(param1:Number = 0) : void
      {
         if(this._soundContainer)
         {
            this._soundContainer.startIndicator(param1,this);
         }
      }
      
      private function stopIndicator() : void
      {
         if(this._soundContainer)
         {
            this._soundContainer.stopIndicator();
         }
      }
   }
}
