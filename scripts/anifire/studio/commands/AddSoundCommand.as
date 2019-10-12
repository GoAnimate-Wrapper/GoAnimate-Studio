package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   
   public class AddSoundCommand extends AbstractSoundCommand
   {
       
      
      public function AddSoundCommand(param1:AnimeSound, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "AddSoundCommand";
      }
      
      override public function execute() : void
      {
         if(_sound)
         {
            super.execute();
            Console.getConsole().addSound(_sound);
         }
      }
      
      override public function undo() : void
      {
         if(_soundId)
         {
            super.undo();
            Console.getConsole().removeSoundById(_soundId);
         }
      }
      
      override public function redo() : void
      {
         if(_sound)
         {
            super.redo();
            Console.getConsole().addSound(_sound);
         }
      }
   }
}
