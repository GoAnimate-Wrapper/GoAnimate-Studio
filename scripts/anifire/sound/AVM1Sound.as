package anifire.sound
{
   import anifire.constant.AnimeConstants;
   import anifire.event.AVM1ServerEvent;
   import anifire.event.AVM1SoundEvent;
   import anifire.util.UtilAVM1server;
   import anifire.util.UtilErrorLogger;
   import flash.display.AVM1Movie;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AVM1Sound extends EventDispatcher
   {
      
      private static const COMMAND_GET_DURATION:Number = 2;
      
      private static const COMMAND_GET_DURATION_READY:Number = 3;
      
      private static const COMMAND_GOTOANDPAUSE_SOUND:Number = 4;
      
      private static const COMMAND_GOTOANDPLAY_SOUND:Number = 5;
      
      private static const COMMAND_PAUSE_SOUND:Number = 6;
      
      private static const COMMAND_RESUME_SOUND:Number = 7;
      
      private static const COMMAND_STOP_SOUND:Number = 8;
      
      private static const COMMAND_SET_VOLUME:Number = 9;
      
      private static const COMMAND_NOTIFY_SOUND_COMPLETE:Number = 10;
      
      private static const COMMAND_GET_CURRENT_POSITION:Number = 11;
       
      
      private var _duration:Number;
      
      private var _avm1movie:AVM1Movie;
      
      private var _avm1server:UtilAVM1server;
      
      private var _playHeadTimer:Timer;
      
      private var _prevPauseMilliSec:Number;
      
      private var _prevPlayMilliSec:Number;
      
      private var _volume:Number;
      
      private var _playedTime:Number;
      
      private var _lastPlayTimeStamp:Number;
      
      private var _playTimeTracker:Timer;
      
      public function AVM1Sound()
      {
         this._volume = AnimeConstants.DEFAULT_VOLUME;
         super();
      }
      
      public function get playedTime() : Number
      {
         return this._playedTime;
      }
      
      public function getDuration() : Number
      {
         return this._duration;
      }
      
      public function init(param1:AVM1Movie) : void
      {
         this._avm1movie = param1;
         this._avm1movie.visible = false;
         this._playHeadTimer = new Timer(1000);
         this._playHeadTimer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._playTimeTracker = new Timer(20);
         this._playTimeTracker.addEventListener(TimerEvent.TIMER,this.playTimeCounter_timerHandler);
         this._avm1server = new UtilAVM1server();
         this._avm1server.addEventListener(AVM1ServerEvent.EVENT_COMMAND_RECEIVED,this.onServerCommandReceived);
         this._avm1server.openConnection(this._avm1movie);
         addEventListener(AVM1SoundEvent.SOUND_DURATION_RECEIVE,this.doDispatchInitComplete);
         this.requestGetDuration();
      }
      
      private function doDispatchInitComplete(param1:AVM1SoundEvent) : void
      {
         removeEventListener(AVM1SoundEvent.SOUND_DURATION_RECEIVE,this.doDispatchInitComplete);
         this.setVolume(this._volume);
         dispatchEvent(new AVM1SoundEvent(AVM1SoundEvent.SOUND_INIT_COMPLETE,this));
      }
      
      private function getTimeStamp() : Number
      {
         var _loc1_:Date = new Date();
         return _loc1_.time;
      }
      
      public function gotoAndPlay(param1:Number) : void
      {
         this._playedTime = param1;
         this.startTracking();
         this._prevPlayMilliSec = this.getTimeStamp() - param1;
         this._playHeadTimer.reset();
         this._playHeadTimer.delay = this.getDuration() - param1;
         this._playHeadTimer.start();
         this._avm1server.sendCommand(COMMAND_GOTOANDPLAY_SOUND,param1);
      }
      
      public function gotoAndPause(param1:Number) : void
      {
         this._playedTime = param1;
         this._playTimeTracker.reset();
         this._prevPauseMilliSec = this.getTimeStamp();
         this._prevPlayMilliSec = this._prevPauseMilliSec - param1;
         this._playHeadTimer.reset();
         this._avm1server.sendCommand(COMMAND_GOTOANDPAUSE_SOUND,param1);
      }
      
      public function stop() : void
      {
         this.stopTracking();
         this._prevPauseMilliSec = this.getTimeStamp();
         this._playedTime = this._playedTime + (this._prevPauseMilliSec - this._prevPlayMilliSec);
         this._prevPlayMilliSec = this._prevPauseMilliSec;
         this._playHeadTimer.reset();
         this._avm1server.sendCommand(COMMAND_STOP_SOUND,0);
      }
      
      public function pause() : void
      {
         this.stopTracking();
         this._prevPauseMilliSec = this.getTimeStamp();
         this._playedTime = this._playedTime + (this._prevPauseMilliSec - this._prevPlayMilliSec);
         this._playHeadTimer.reset();
         this._avm1server.sendCommand(COMMAND_PAUSE_SOUND,0);
      }
      
      public function resume() : void
      {
         try
         {
            this._prevPlayMilliSec = this.getTimeStamp();
            this._playHeadTimer.reset();
            this._playHeadTimer.delay = this.getDuration() - (this._prevPauseMilliSec - this._prevPlayMilliSec);
            this._playHeadTimer.start();
            this._avm1server.sendCommand(COMMAND_RESUME_SOUND,0);
            this.startTracking();
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AVM1Sound:resume",e);
            return;
         }
      }
      
      public function setVolume(param1:Number) : void
      {
         this._volume = param1;
         this._avm1server.sendCommand(COMMAND_SET_VOLUME,param1);
      }
      
      public function getVolume() : Number
      {
         return this._volume;
      }
      
      private function requestGetDuration() : void
      {
         this._avm1server.sendCommand(COMMAND_GET_DURATION,0);
      }
      
      private function onServerCommandReceived(param1:AVM1ServerEvent) : void
      {
         if(param1.command == COMMAND_GET_DURATION_READY)
         {
            this._duration = param1.param;
            if(this.getDuration() <= 0)
            {
               throw new Error("Duration got but is 0");
            }
            dispatchEvent(new AVM1SoundEvent(AVM1SoundEvent.SOUND_DURATION_RECEIVE,this));
         }
      }
      
      private function onTimer(param1:Event) : void
      {
         this.stopTracking();
         this._prevPauseMilliSec = this.getTimeStamp();
         this._prevPlayMilliSec = this._prevPauseMilliSec;
         this._playHeadTimer.reset();
         dispatchEvent(new AVM1SoundEvent(AVM1SoundEvent.SOUND_COMPLETE,this));
      }
      
      private function resetTracking() : void
      {
         this._playedTime = 0;
      }
      
      private function startTracking() : void
      {
         this._lastPlayTimeStamp = this.getTimeStamp();
         this._playTimeTracker.start();
      }
      
      private function stopTracking() : void
      {
         var _loc1_:Number = this.getTimeStamp();
         this._playedTime = this._playedTime + (_loc1_ - this._lastPlayTimeStamp);
         this._playTimeTracker.reset();
      }
      
      private function playTimeCounter_timerHandler(param1:TimerEvent) : void
      {
         var _loc2_:Number = this.getTimeStamp();
         this._playedTime = this._playedTime + (_loc2_ - this._lastPlayTimeStamp);
         this._lastPlayTimeStamp = _loc2_;
      }
   }
}
