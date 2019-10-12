package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.studio.core.sound.SoundCollectionMemento;
   import anifire.studio.managers.SceneManager;
   
   public class ChangeSceneDurationCommand extends SceneCommand
   {
       
      
      private var _oldDurationMode:uint;
      
      private var _newDurationMode:uint;
      
      private var _oldCustomFrame:int;
      
      private var _newCustomFrame:int;
      
      private var _oldTransitionDuration:int = 0;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      private var _undoVoiceMemento:SoundCollectionMemento;
      
      public function ChangeSceneDurationCommand(param1:AnimeScene, param2:Boolean = true)
      {
         super(param2,param1);
         this._oldCustomFrame = param1.customTotalFrames;
         this._oldDurationMode = param1.durationMode;
         if(param1.transition)
         {
            this._oldTransitionDuration = param1.transition.duration;
         }
         this._undoSoundMemento = Console.getConsole().sounds.memento;
         this._undoVoiceMemento = Console.getConsole().voices.memento;
         _type = "ChangeSceneDurationCommand";
      }
      
      public function executeNow(param1:int, param2:uint) : Boolean
      {
         var _loc4_:Number = NaN;
         this._newCustomFrame = param1;
         this._newDurationMode = param2;
         var _loc3_:AnimeScene = this.scene;
         if(this._newCustomFrame != this._oldCustomFrame || this._newDurationMode != this._oldDurationMode)
         {
            super.execute();
            _loc3_.customTotalFrames = this._newCustomFrame;
            _loc3_.durationMode = this._newDurationMode;
            _loc4_ = Console.getConsole().timelineController.movieTotalDuration;
            SceneManager.checkMovieDuration(_loc4_);
            return true;
         }
         return false;
      }
      
      override public function undo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         Console.getConsole().timelineController.autoMoveSounds = false;
         _loc1_.durationMode = this._oldDurationMode;
         _loc1_.customTotalFrames = this._oldCustomFrame;
         if(_loc1_.transition)
         {
            _loc1_.transition.duration = this._oldTransitionDuration;
         }
         Console.getConsole().timelineController.autoMoveSounds = true;
         Console.getConsole().sounds.memento = this._undoSoundMemento;
         Console.getConsole().voices.memento = this._undoVoiceMemento;
      }
      
      override public function redo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         _loc1_.durationMode = this._newDurationMode;
         _loc1_.customTotalFrames = this._newCustomFrame;
      }
   }
}
