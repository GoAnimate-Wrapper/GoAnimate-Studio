package anifire.studio.interfaces
{
   import anifire.studio.core.SoundThumb;
   import flash.utils.ByteArray;
   
   public interface ISpeechSubComponent
   {
       
      
      function saveSoundBySoundThumb(param1:SoundThumb) : void;
      
      function updateSoundThumb(param1:SoundThumb) : void;
      
      function saveSound(param1:ByteArray, param2:XML) : void;
      
      function destroy() : void;
      
      function commit(param1:Object) : void;
      
      function set loadProgress(param1:Number) : void;
      
      function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void;
      
      function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void;
      
      function set currentState(param1:String) : void;
   }
}
