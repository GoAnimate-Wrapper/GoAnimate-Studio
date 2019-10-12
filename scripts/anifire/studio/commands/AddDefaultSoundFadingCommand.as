package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   
   public class AddDefaultSoundFadingCommand extends AbstractSoundCommand
   {
       
      
      public function AddDefaultSoundFadingCommand(param1:AnimeSound, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "AddDefaultSoundFadingCommand";
      }
      
      override public function execute() : void
      {
         if(_sound && !_sound.hasFading)
         {
            _sound.addDefaultFading();
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         if(_sound && _sound.hasFading)
         {
            _sound.removeFading();
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         if(_sound && !_sound.hasFading)
         {
            _sound.addDefaultFading();
            super.redo();
         }
      }
   }
}
