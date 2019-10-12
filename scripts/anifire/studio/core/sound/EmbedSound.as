package anifire.studio.core.sound
{
   import anifire.event.AVM1SoundEvent;
   import anifire.sound.AVM1Sound;
   import anifire.studio.components.SoundContainer;
   import anifire.studio.utils.UtilSound;
   import anifire.util.Util;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilUnitConvert;
   import flash.display.AVM1Movie;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class EmbedSound extends EventDispatcher implements ISoundable
   {
      
      private static const PLAYBACK_MONITOR_INTERVAL:Number = 40;
       
      
      private var _avm1Sound:AVM1Sound;
      
      private var _isNeedErrorByteCheck:Boolean;
      
      private var _byteArray:ByteArray;
      
      private var _isReadyToPlay:Boolean;
      
      private var _isNeedDecryption:Boolean;
      
      private var _soundContainer:SoundContainer;
      
      private var _isPlaying:Boolean;
      
      private var _timer:Timer;
      
      private var _startTime:Number;
      
      private var _endTime:Number;
      
      private var _repeat:Boolean = true;
      
      private var _loopCounter:int;
      
      private var _fadeFactor:Number = 1;
      
      private var _volume:Number = 1;
      
      private var _inner_volume:Number = 1;
      
      private var _customFadeInDuration:Number;
      
      private var _customFadeInVolume:Number;
      
      private var _customFadeOutDuration:Number;
      
      private var _customFadeOutVolume:Number;
      
      public function EmbedSound()
      {
         super();
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
      
      public function updateVolume(param1:Number) : void
      {
         this.volume = param1;
         if(this._avm1Sound)
         {
            this._avm1Sound.setVolume(this.volume * this.fadeFactor * this.inner_volume);
         }
      }
      
      protected function getVolume() : Number
      {
         return this.volume;
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      public function get playedTime() : Number
      {
         var _loc1_:Number = NaN;
         if(this._avm1Sound && this._loopCounter >= 0)
         {
            _loc1_ = this._loopCounter * this._avm1Sound.getDuration() + this._avm1Sound.playedTime;
            return _loc1_;
         }
         return 0;
      }
      
      public function get byteArray() : ByteArray
      {
         return this._byteArray;
      }
      
      public function set soundContainer(param1:SoundContainer) : void
      {
         this._soundContainer = param1;
      }
      
      public function get soundContainer() : SoundContainer
      {
         return this._soundContainer;
      }
      
      public function clone() : ISoundable
      {
         var _loc1_:EmbedSound = new EmbedSound();
         _loc1_._isNeedErrorByteCheck = this._isNeedErrorByteCheck;
         _loc1_._isNeedDecryption = this._isNeedDecryption;
         _loc1_._byteArray = this._byteArray;
         return _loc1_;
      }
      
      public function initByUrl(param1:URLRequest, param2:Boolean, param3:Boolean) : void
      {
         if(this._byteArray)
         {
            this.initByByteArray(this._byteArray);
            return;
         }
         this._isNeedErrorByteCheck = param2;
         this._isNeedDecryption = param3;
         var _loc4_:URLStream = new URLStream();
         _loc4_.addEventListener(Event.COMPLETE,this.doInitByByteArray);
         _loc4_.addEventListener(ProgressEvent.PROGRESS,this.doReplicateEvent);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.doReplicateEvent);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.doReplicateEvent);
         _loc4_.load(param1);
      }
      
      private function doInitByByteArray(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:ByteArray = null;
         var _loc5_:UtilCrypto = null;
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doInitByByteArray);
         var _loc2_:URLStream = URLStream(param1.target);
         if(this._isNeedErrorByteCheck)
         {
            _loc3_ = _loc2_.readByte();
            if(_loc3_ != 0)
            {
               _loc4_ = new ByteArray();
               _loc2_.readBytes(_loc4_);
            }
         }
         this._byteArray = new ByteArray();
         _loc2_.readBytes(this._byteArray);
         if(this._isNeedDecryption)
         {
            _loc5_ = new UtilCrypto();
            _loc5_.decrypt(this._byteArray);
         }
         this.initByByteArray(this._byteArray);
      }
      
      public function initByByteArray(param1:ByteArray) : void
      {
         var loader:Loader = null;
         var byteArray:ByteArray = param1;
         try
         {
            this._byteArray = byteArray;
            loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.doInitAVMsound);
            loader.loadBytes(byteArray as ByteArray);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function doInitAVMsound(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doInitAVMsound);
         this._avm1Sound = new AVM1Sound();
         this._avm1Sound.addEventListener(AVM1SoundEvent.SOUND_INIT_COMPLETE,this.doDispatchCompleteEvent);
         this._avm1Sound.init(LoaderInfo(param1.target).content as AVM1Movie);
      }
      
      private function doDispatchCompleteEvent(param1:AVM1SoundEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doDispatchCompleteEvent);
         var _loc2_:SoundEvent = new SoundEvent(SoundEvent.READY_TO_PLAY,this);
         this._isReadyToPlay = true;
         this.dispatchEvent(_loc2_);
      }
      
      private function doReplicateEvent(param1:Event) : void
      {
         this.dispatchEvent(param1.clone());
      }
      
      public function play(param1:Number = 0, param2:SoundContainer = null, param3:Number = 1, param4:Number = -1, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:Number = 0, param9:Boolean = true) : void
      {
         this._avm1Sound.addEventListener(AVM1SoundEvent.SOUND_COMPLETE,this.doSayPlayComplete);
         this._avm1Sound.setVolume(param3);
         this.volume = param3;
         this._avm1Sound.gotoAndPlay(param1);
         this.soundContainer = param2;
         this.startIndicator(param1);
         this._isPlaying = true;
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
            this._timer = new Timer(PLAYBACK_MONITOR_INTERVAL);
            this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.start();
         }
         this.dispatchEvent(new SoundEvent(SoundEvent.PLAYED,this));
      }
      
      private function onTimer(param1:Event) : void
      {
         var _loc2_:Number = this.playedTime / this._endTime;
         var _loc3_:SoundEvent = new SoundEvent(SoundEvent.ON_PROGRESS,this);
         _loc3_.progress = _loc2_;
         this.dispatchEvent(_loc3_);
         this.updateVolumeByCurrentTime(this.playedTime);
         if(this.playedTime >= this._endTime)
         {
            this.stop();
         }
      }
      
      public function stop() : void
      {
         this.destroy();
         this.dispatchEvent(new SoundEvent(SoundEvent.PLAY_COMPLETE,this));
         this.dispatchEvent(new SoundEvent(SoundEvent.STOPPED,this));
      }
      
      public function destroy() : void
      {
         if(this._avm1Sound)
         {
            this._avm1Sound.stop();
            this.stopIndicator();
            this._isPlaying = false;
            if(this._timer)
            {
               this._timer.stop();
               this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
               this._timer = null;
            }
         }
      }
      
      public function getDuration() : Number
      {
         return this._avm1Sound.getDuration();
      }
      
      public function get isReady() : Boolean
      {
         return this._isReadyToPlay;
      }
      
      private function doSayPlayComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doSayPlayComplete);
         if(this._repeat)
         {
            this._isPlaying = false;
            this._loopCounter++;
            this.play(0);
         }
         else
         {
            this.stop();
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
      
      public function fadeVolume(param1:Number) : void
      {
         param1 = Util.roundNum(param1);
         this.fadeFactor = param1;
         this.updateVolume(this.getVolume());
      }
      
      public function updateVolumeByCurrentTime(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         _loc2_ = UtilSound.customMusicFadeByCurrentTime(this,param1);
         if(this.fadeFactor != _loc2_)
         {
            this.fadeVolume(_loc2_);
         }
      }
   }
}
