package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   
   public class ChangeSoundFadingCommand extends AbstractSoundCommand
   {
       
      
      private var _oldFadeInDuration:int;
      
      private var _oldFadeOutDuration:int;
      
      private var _oldFadeInVolume:Number;
      
      private var _oldFadeOutVolume:Number;
      
      private var _newFadeInDuration:int;
      
      private var _newFadeOutDuration:int;
      
      private var _newFadeInVolume:Number;
      
      private var _newFadeOutVolume:Number;
      
      public function ChangeSoundFadingCommand(param1:AnimeSound, param2:int, param3:int, param4:Number, param5:Number, param6:Boolean = true)
      {
         super(param1,param6);
         _type = "ChangeSoundFadingCommand";
         this._newFadeInDuration = param2;
         this._newFadeOutDuration = param3;
         this._newFadeInVolume = param4;
         this._newFadeOutVolume = param5;
      }
      
      override public function execute() : void
      {
         if(_sound && _sound.hasFading)
         {
            super.execute();
            this._oldFadeInDuration = _sound.fadeInDuration;
            this._oldFadeOutDuration = _sound.fadeOutDuration;
            this._oldFadeInVolume = _sound.fadeInVolume;
            this._oldFadeOutVolume = _sound.fadeOutVolume;
            _sound.updateFading(this._newFadeInDuration,this._newFadeOutDuration,this._newFadeInVolume,this._newFadeOutVolume);
         }
      }
      
      override public function undo() : void
      {
         if(_sound && _sound.hasFading)
         {
            super.undo();
            _sound.updateFading(this._oldFadeInDuration,this._oldFadeOutDuration,this._oldFadeInVolume,this._oldFadeOutVolume);
         }
      }
      
      override public function redo() : void
      {
         if(_sound && _sound.hasFading)
         {
            super.undo();
            _sound.updateFading(this._newFadeInDuration,this._newFadeOutDuration,this._newFadeInVolume,this._newFadeOutVolume);
         }
      }
   }
}
