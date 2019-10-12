package anifire.studio.core.sound
{
   import anifire.studio.components.SoundContainer;
   import anifire.studio.utils.UtilSound;
   import anifire.util.Util;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   
   public class ProgressiveSound extends EventDispatcher implements ISoundable
   {
      
      private static const MONITOR_PLAYBACK_INTERVAL:Number = 40;
       
      
      private var _urlRequest:URLRequest;
      
      private var _soundChannel:SoundChannel;
      
      private var _soundTransform:SoundTransform;
      
      private var _duration:Number;
      
      private var _sound:Sound;
      
      private var _soundContainer:SoundContainer;
      
      private var _subType:String;
      
      private var _isPlaying:Boolean;
      
      private var _timer:Timer;
      
      private var _startTime:Number;
      
      private var _endTime:Number;
      
      private var _repeat:Boolean = true;
      
      private var _autoPlayAfterLoaded:Boolean;
      
      private var _loopCounter:int;
      
      private var _fadeFactor:Number = 1;
      
      private var _volume:Number = 1;
      
      private var _inner_volume:Number = 1;
      
      private var _customFadeInDuration:Number;
      
      private var _customFadeInVolume:Number;
      
      private var _customFadeOutDuration:Number;
      
      private var _customFadeOutVolume:Number;
      
      public function ProgressiveSound(param1:IEventDispatcher = null)
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
         this._volume = param1;
         this._soundTransform.volume = this.fadeFactor * this.volume * this.inner_volume;
         if(this._soundChannel)
         {
            this._soundChannel.soundTransform = this._soundTransform;
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
         if(this._sound && this._soundChannel)
         {
            return this._loopCounter * this._sound.length + this._soundChannel.position;
         }
         return 0;
      }
      
      public function init(param1:URLRequest, param2:Number, param3:String = null) : void
      {
         this._urlRequest = param1;
         this._duration = param2;
         if(param3)
         {
            this._subType = param3;
         }
         this.dispatchEvent(new SoundEvent(SoundEvent.READY_TO_PLAY,this));
      }
      
      public function clone() : ISoundable
      {
         var _loc1_:ProgressiveSound = new ProgressiveSound();
         _loc1_.init(this._urlRequest,this._duration);
         return _loc1_;
      }
      
      public function loadSound() : void
      {
         if(this._sound)
         {
            this._sound.removeEventListener(Event.COMPLETE,this.onLoadSoundComplete);
            this._sound.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadSoundFail);
         }
         this._sound = new Sound();
         this._sound.addEventListener(Event.COMPLETE,this.onLoadSoundComplete);
         this._sound.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadSoundFail);
         this._sound.load(this._urlRequest);
      }
      
      public function play(param1:Number = 0, param2:SoundContainer = null, param3:Number = 1, param4:Number = -1, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:Number = 0, param9:Boolean = true) : void
      {
         this._soundContainer = param2;
         this._startTime = param1;
         this._endTime = param4;
         this._repeat = param9;
         this._customFadeInDuration = UtilUnitConvert.frameToDuration(param5) * 1000;
         this._customFadeInVolume = param6;
         this._customFadeOutDuration = UtilUnitConvert.frameToDuration(param7) * 1000;
         this._customFadeOutVolume = param8;
         this._autoPlayAfterLoaded = true;
         if(!this._soundTransform)
         {
            this._soundTransform = new SoundTransform();
         }
         this.volume = this._soundTransform.volume = param3;
         if(this._sound)
         {
            this.playAfterLoaded();
         }
         else
         {
            this._sound = new Sound();
            this._sound.addEventListener(Event.COMPLETE,this.onLoadSoundComplete);
            this._sound.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadSoundFail);
            this._sound.load(this._urlRequest);
         }
      }
      
      private function playAfterLoaded() : void
      {
         if(!this._sound)
         {
            return;
         }
         this._soundChannel = this._sound.play(this._startTime,0,this._soundTransform);
         if(this._soundChannel)
         {
            if(this._endTime > this._startTime)
            {
               this._loopCounter = 0;
               if(!this._timer)
               {
                  this._timer = new Timer(MONITOR_PLAYBACK_INTERVAL);
               }
               this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               this._timer.start();
            }
            this._soundChannel.addEventListener(Event.SOUND_COMPLETE,this.onSoundPlaybackComplete);
         }
         if(this._startTime < this._duration)
         {
            this.startIndicator(this._startTime);
         }
         this._isPlaying = true;
         this._autoPlayAfterLoaded = false;
         this.dispatchEvent(new SoundEvent(SoundEvent.PLAYED,this));
      }
      
      private function onTimer(param1:Event) : void
      {
         this.updateVolumeByCurrentTime(this.playedTime);
         if(this.playedTime >= this._endTime)
         {
            this.finishPlaying(true);
         }
      }
      
      private function onLoadSoundFail(param1:IOErrorEvent) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadSoundComplete);
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadSoundFail);
      }
      
      private function onLoadSoundComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadSoundComplete);
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onLoadSoundFail);
         this.dispatchEvent(new SoundEvent(SoundEvent.SOUND_LOADED,this));
         if(this._autoPlayAfterLoaded)
         {
            this.playAfterLoaded();
         }
      }
      
      public function get sound#1() : Sound
      {
         return this._sound;
      }
      
      public function stop() : void
      {
         this.finishPlaying(false);
      }
      
      public function destroy() : void
      {
         this._soundTransform = null;
         if(this._soundChannel)
         {
            this._soundChannel.stop();
            this._soundChannel.removeEventListener(Event.SOUND_COMPLETE,this.onSoundPlaybackComplete);
            this._soundChannel = null;
         }
         if(this._sound)
         {
            this._sound.removeEventListener(Event.COMPLETE,this.onLoadSoundComplete);
            this._sound.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadSoundFail);
            if(this._sound.bytesLoaded < this._sound.bytesTotal)
            {
               this._sound.close();
            }
            this._sound = null;
         }
         if(this._soundContainer)
         {
            this._soundContainer.stopIndicator();
            this._soundContainer = null;
         }
         this._isPlaying = false;
         this._autoPlayAfterLoaded = false;
         if(this._timer)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer = null;
         }
      }
      
      private function finishPlaying(param1:Boolean) : void
      {
         if(this._soundChannel)
         {
            this._soundChannel.stop();
         }
         this.stopIndicator(param1);
         this._isPlaying = false;
         if(this._timer)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         }
         if(param1)
         {
            dispatchEvent(new SoundEvent(SoundEvent.PLAY_COMPLETE,this));
         }
         dispatchEvent(new SoundEvent(SoundEvent.STOPPED,this));
      }
      
      public function getDuration() : Number
      {
         return this._duration;
      }
      
      public function get isReady() : Boolean
      {
         return true;
      }
      
      private function onSoundPlaybackComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onSoundPlaybackComplete);
         if(this._repeat && this._sound)
         {
            this._loopCounter++;
            this._soundChannel = this._sound.play(this._startTime,0,this._soundTransform);
            if(this._soundChannel)
            {
               this._soundChannel.addEventListener(Event.SOUND_COMPLETE,this.onSoundPlaybackComplete);
            }
         }
         else
         {
            this.finishPlaying(true);
         }
      }
      
      private function startIndicator(param1:Number = 0) : void
      {
         if(this._soundContainer)
         {
            this._soundContainer.startIndicator(param1,this);
         }
      }
      
      private function stopIndicator(param1:Boolean = false) : void
      {
         if(this._soundContainer)
         {
            this._soundContainer.stopIndicator(param1);
         }
      }
      
      public function fadeVolume(param1:Number) : void
      {
         param1 = Util.roundNum(param1);
         this.fadeFactor = param1;
         this.updateVolume(this.getVolume());
      }
      
      private function updateVolumeByCurrentTime(param1:Number) : void
      {
         var _loc2_:Number = UtilSound.customMusicFadeByCurrentTime(this,param1);
         if(this.fadeFactor != _loc2_)
         {
            this.fadeVolume(_loc2_);
         }
      }
   }
}
