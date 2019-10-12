package anifire.studio.core.sound
{
   import anifire.studio.components.SoundContainer;
   import flash.events.IEventDispatcher;
   
   public interface ISoundable extends IEventDispatcher
   {
       
      
      function clone() : ISoundable;
      
      function play(param1:Number = 0, param2:SoundContainer = null, param3:Number = 1, param4:Number = -1, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:Number = 0, param9:Boolean = true) : void;
      
      function stop() : void;
      
      function getDuration() : Number;
      
      function get isReady() : Boolean;
      
      function get isPlaying() : Boolean;
      
      function fadeVolume(param1:Number) : void;
      
      function get customFadeOutVolume() : Number;
      
      function get customFadeOutDuration() : Number;
      
      function get customFadeInVolume() : Number;
      
      function get customFadeInDuration() : Number;
      
      function get inner_volume() : Number;
      
      function get startTime() : Number;
      
      function get endTime() : Number;
      
      function get playedTime() : Number;
      
      function destroy() : void;
   }
}
