package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.sound.SoundCollectionMemento;
   
   public class AttachSoundCommand extends SceneCommand
   {
       
      
      private var _sound:AnimeSound;
      
      private var _oldSpeech:AnimeSound;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      public function AttachSoundCommand(param1:AnimeScene, param2:AnimeSound, param3:Boolean = true)
      {
         super(param3,param1);
         _type = "AttachSoundCommand";
         this._sound = param2;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:AnimeScene = this.scene;
         this._undoSoundMemento = Console.getConsole().voices.memento;
         this._oldSpeech = _loc1_.speech;
         _loc1_.attachSpeech(this._sound);
      }
      
      override public function undo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         var _loc2_:Console = Console.getConsole();
         _loc2_.timelineController.autoMoveSounds = false;
         _loc1_.attachSpeech(this._oldSpeech);
         if(this._undoSoundMemento)
         {
            _loc2_.voices.memento = this._undoSoundMemento;
         }
         _loc2_.timelineController.autoMoveSounds = true;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         _loc1_.attachSpeech(this._sound);
         super.redo();
      }
   }
}
