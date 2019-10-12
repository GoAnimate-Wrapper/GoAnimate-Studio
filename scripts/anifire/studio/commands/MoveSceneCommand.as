package anifire.studio.commands
{
   import anifire.studio.core.Console;
   import anifire.studio.core.MovieData;
   import anifire.studio.core.sound.SoundCollectionMemento;
   
   public class MoveSceneCommand extends SuperCommand
   {
       
      
      private var _movie:MovieData;
      
      private var _sourceIndex:Number;
      
      private var _destIndex:Number;
      
      private var _redoSoundMemento:SoundCollectionMemento;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      private var _redoVoiceMemento:SoundCollectionMemento;
      
      private var _undoVoiceMemento:SoundCollectionMemento;
      
      public function MoveSceneCommand(param1:MovieData, param2:Number, param3:Number)
      {
         super();
         _type = "MoveSceneCommand";
         this._movie = param1;
         this._sourceIndex = param2;
         this._destIndex = param3;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._undoSoundMemento = Console.getConsole().sounds.memento;
         this._undoVoiceMemento = Console.getConsole().voices.memento;
         this._movie.moveScene(this._sourceIndex,this._destIndex);
      }
      
      override public function undo() : void
      {
         this._redoSoundMemento = Console.getConsole().sounds.memento;
         this._redoVoiceMemento = Console.getConsole().voices.memento;
         if(this._destIndex > this._sourceIndex)
         {
            this._movie.moveScene(this._destIndex - 1,this._sourceIndex);
         }
         else
         {
            this._movie.moveScene(this._destIndex,this._sourceIndex + 1);
         }
         Console.getConsole().sounds.memento = this._undoSoundMemento;
         Console.getConsole().voices.memento = this._undoVoiceMemento;
      }
      
      override public function redo() : void
      {
         this._movie.moveScene(this._sourceIndex,this._destIndex);
         Console.getConsole().sounds.memento = this._redoSoundMemento;
         Console.getConsole().voices.memento = this._redoVoiceMemento;
      }
   }
}
