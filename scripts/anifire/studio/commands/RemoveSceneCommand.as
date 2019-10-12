package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.studio.core.MovieData;
   import anifire.studio.core.sound.SoundCollectionMemento;
   
   public class RemoveSceneCommand extends SuperCommand
   {
       
      
      private var _movie:MovieData;
      
      private var _scene:AnimeScene;
      
      private var _index:int;
      
      private var _redoSoundMemento:SoundCollectionMemento;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      private var _redoVoiceMemento:SoundCollectionMemento;
      
      private var _undoVoiceMemento:SoundCollectionMemento;
      
      private var _undoable:Boolean;
      
      public function RemoveSceneCommand(param1:MovieData, param2:AnimeScene, param3:int, param4:Boolean = true)
      {
         super();
         this._movie = param1;
         this._scene = param2;
         this._index = param3;
         this._undoable = param4;
         _type = "RemoveSceneCommand";
      }
      
      override public function execute() : void
      {
         if(this._undoable)
         {
            super.execute();
         }
         this._undoSoundMemento = Console.getConsole().sounds.memento;
         this._undoVoiceMemento = Console.getConsole().voices.memento;
         this._index = this._movie.getSceneIndex(this._scene);
         this._movie.removeSceneAt(this._index);
      }
      
      override public function undo() : void
      {
         this._redoSoundMemento = Console.getConsole().sounds.memento;
         this._redoVoiceMemento = Console.getConsole().voices.memento;
         this._movie.addSceneAt(this._scene,this._index);
         Console.getConsole().sounds.memento = this._undoSoundMemento;
         Console.getConsole().voices.memento = this._undoVoiceMemento;
      }
      
      override public function redo() : void
      {
         this._movie.removeSceneAt(this._index);
         Console.getConsole().sounds.memento = this._redoSoundMemento;
         Console.getConsole().voices.memento = this._redoVoiceMemento;
      }
   }
}
