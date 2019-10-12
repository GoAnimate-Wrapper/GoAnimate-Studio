package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.sound.SoundCollection;
   import anifire.studio.core.sound.SoundCollectionMemento;
   
   public class RemoveSoundCommand extends AbstractSoundCommand
   {
       
      
      private var _oldSoundCollectionMemento:SoundCollectionMemento;
      
      public function RemoveSoundCommand(param1:AnimeSound, param2:SoundCollection, param3:Boolean = true)
      {
         super(param1,param3,param2);
         _type = "RemoveSoundCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         if(_collection)
         {
            this._oldSoundCollectionMemento = _collection.memento;
         }
         Console.getConsole().removeSoundById(_soundId);
      }
      
      override public function undo() : void
      {
         super.undo();
         if(this._oldSoundCollectionMemento && _collection)
         {
            _collection.memento = this._oldSoundCollectionMemento;
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         Console.getConsole().removeSoundById(_soundId);
      }
   }
}
