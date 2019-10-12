package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   
   public class ChangeVolumeCommand extends AbstractSoundCommand
   {
       
      
      private var _newVolume:Number;
      
      private var _oldVolume:Number;
      
      public function ChangeVolumeCommand(param1:AnimeSound, param2:Number, param3:Boolean = true)
      {
         super(param1,param3);
         this._newVolume = param2;
         _type = "ChangeVolumeCommand";
      }
      
      override public function execute() : void
      {
         if(_sound)
         {
            this._oldVolume = _sound.volume;
            if(this._oldVolume != this._newVolume)
            {
               super.execute();
               _sound.volume = this._newVolume;
            }
         }
      }
      
      override public function undo() : void
      {
         if(_sound)
         {
            _sound.volume = this._oldVolume;
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         if(_sound)
         {
            _sound.volume = this._newVolume;
            super.redo();
         }
      }
   }
}
