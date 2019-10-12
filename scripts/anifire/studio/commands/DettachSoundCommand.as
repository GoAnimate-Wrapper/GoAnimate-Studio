package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.sound.SoundCollectionMemento;
   
   public class DettachSoundCommand extends SceneCommand
   {
       
      
      private var _oldSpeech:AnimeSound;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      private var _updateSceneDuration:Boolean;
      
      public function DettachSoundCommand(param1:AnimeScene, param2:Boolean = true, param3:Boolean = true)
      {
         super(param2,param1);
         _type = "DettachSoundCommand";
         this._updateSceneDuration = param3;
      }
      
      override public function execute() : void
      {
         var _loc1_:AnimeScene = this.scene;
         this._oldSpeech = _loc1_.speech;
         if(!this._oldSpeech)
         {
            return;
         }
         super.execute();
         this._undoSoundMemento = this._oldSpeech.soundsController.sounds.memento;
         _loc1_.attachSpeech(null,this._updateSceneDuration);
      }
      
      override public function undo() : void
      {
         if(!this._oldSpeech)
         {
            return;
         }
         var _loc1_:AnimeScene = this.scene;
         var _loc2_:Console = Console.getConsole();
         _loc2_.timelineController.autoMoveSounds = false;
         _loc1_.attachSpeech(this._oldSpeech);
         if(this._undoSoundMemento)
         {
            this._oldSpeech.soundsController.sounds.memento = this._undoSoundMemento;
         }
         _loc2_.timelineController.autoMoveSounds = true;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         this._oldSpeech = _loc1_.attachSpeech(null,this._updateSceneDuration);
         super.redo();
      }
   }
}
