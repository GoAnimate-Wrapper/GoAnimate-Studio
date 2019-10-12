package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   
   public class RemoveSoundFadingCommand extends AbstractSoundCommand
   {
       
      
      private var _oldFadeInDuration:int;
      
      private var _oldFadeOutDuration:int;
      
      private var _oldFadeInVolume:Number;
      
      private var _oldFadeOutVolume:Number;
      
      public function RemoveSoundFadingCommand(param1:AnimeSound, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "RemoveSoundFadingCommand";
      }
      
      override public function execute() : void
      {
         if(_sound && _sound.hasFading)
         {
            this._oldFadeInDuration = _sound.fadeInDuration;
            this._oldFadeOutDuration = _sound.fadeOutDuration;
            this._oldFadeInVolume = _sound.fadeInVolume;
            this._oldFadeOutVolume = _sound.fadeOutVolume;
            _sound.removeFading();
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         if(_sound && !_sound.hasFading)
         {
            _sound.addFading(this._oldFadeInDuration,this._oldFadeOutDuration,this._oldFadeInVolume,this._oldFadeOutVolume);
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         if(_sound && _sound.hasFading)
         {
            _sound.removeFading();
            super.redo();
         }
      }
   }
}
