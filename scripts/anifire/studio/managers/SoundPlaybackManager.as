package anifire.studio.managers
{
   import anifire.event.CoreEvent;
   import anifire.studio.components.SoundContainer;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.sound.ISoundable;
   import anifire.util.UtilErrorLogger;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class SoundPlaybackManager extends EventDispatcher
   {
      
      private static var _currentSound:ISoundable;
      
      private static var _playbackSoundThumb:SoundThumb;
      
      private static var _playbackStartTime:Number = 0;
      
      private static var _playbackEndTime:Number = -1;
      
      private static var _playbackVol:Number = 1;
      
      private static var _playbackSoundContainer:SoundContainer;
      
      private static var _fadeInDuration:Number;
      
      private static var _fadeInVolume:Number;
      
      private static var _fadeOutDuration:Number;
      
      private static var _fadeOutVolume:Number;
      
      private static var _playbackRepeat:Boolean;
       
      
      public function SoundPlaybackManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function play(param1:ISoundable, param2:Number = 0, param3:SoundContainer = null, param4:Number = 1, param5:Number = -1, param6:Number = 0, param7:Number = 0, param8:Number = 0, param9:Number = 0, param10:Boolean = true) : void
      {
         var sound:ISoundable = param1;
         var startTime:Number = param2;
         var soundContainer:SoundContainer = param3;
         var volume:Number = param4;
         var endTime:Number = param5;
         var fadeInDuration:Number = param6;
         var fadeInVolume:Number = param7;
         var fadeOutDuration:Number = param8;
         var fadeOutVolume:Number = param9;
         var repeat:Boolean = param10;
         try
         {
            if(sound)
            {
               if(_currentSound)
               {
                  _currentSound.stop();
                  if(_currentSound != sound)
                  {
                     _currentSound.destroy();
                  }
               }
               _currentSound = sound;
               sound.play(startTime,soundContainer,volume,endTime,fadeInDuration,fadeInVolume,fadeOutDuration,fadeOutVolume,repeat);
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("SoundPlayback:play",e);
            return;
         }
      }
      
      public static function stop() : void
      {
         try
         {
            if(_currentSound && _currentSound.isPlaying)
            {
               _currentSound.stop();
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("SoundPlayback:stop",e);
            return;
         }
      }
      
      private static function onSoundLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,onSoundLoaded);
         SoundPlaybackManager.playSoundThumb(_playbackSoundThumb,_playbackStartTime,_playbackSoundContainer,_playbackVol,_playbackEndTime,_fadeInDuration,_fadeInVolume,_fadeOutDuration,_fadeOutVolume,_playbackRepeat);
      }
      
      public static function playSoundThumb(param1:SoundThumb, param2:Number = 0, param3:SoundContainer = null, param4:Number = 1, param5:Number = -1, param6:Number = 0, param7:Number = 0, param8:Number = 0, param9:Number = 0, param10:Boolean = true) : void
      {
         if(param1)
         {
            _playbackSoundThumb = param1;
            _playbackStartTime = param2;
            _playbackEndTime = param5;
            _playbackVol = param4;
            _playbackSoundContainer = param3;
            _fadeInDuration = param6;
            _fadeInVolume = param7;
            _fadeOutDuration = param8;
            _fadeOutVolume = param9;
            _playbackRepeat = param10;
            if(param1.sound#1 && param1.sound#1.isReady)
            {
               SoundPlaybackManager.play(param1.sound#1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
            }
            else
            {
               param1.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,onSoundLoaded);
               param1.initSoundFromNetwork();
            }
         }
      }
   }
}
