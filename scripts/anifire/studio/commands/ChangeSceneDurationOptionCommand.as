package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.studio.core.sound.SoundCollectionMemento;
   
   public class ChangeSceneDurationOptionCommand extends SceneCommand
   {
       
      
      private var _newCountMinimumDuration:Boolean;
      
      private var _newCountTransitionDuration:Boolean;
      
      private var _newCountActionDuration:Boolean;
      
      private var _newCountBubbleDuration:Boolean;
      
      private var _newCountSpeechDuration:Boolean;
      
      private var _oldCountMinimumDuration:Boolean;
      
      private var _oldCountTransitionDuration:Boolean;
      
      private var _oldCountActionDuration:Boolean;
      
      private var _oldCountBubbleDuration:Boolean;
      
      private var _oldCountSpeechDuration:Boolean;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      private var _undoVoiceMemento:SoundCollectionMemento;
      
      private var _changeDurationCommand:ChangeSceneDurationCommand;
      
      public function ChangeSceneDurationOptionCommand(param1:AnimeScene, param2:Boolean = true, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false)
      {
         super(param2,param1);
         _type = "ChangeSceneDurationOptionCommand";
         this._newCountMinimumDuration = param3;
         this._newCountTransitionDuration = param4;
         this._newCountActionDuration = param5;
         this._newCountBubbleDuration = param6;
         this._newCountSpeechDuration = param7;
         this._oldCountMinimumDuration = param1.countMinimumDuration;
         this._oldCountTransitionDuration = param1.countTransitionDuration;
         this._oldCountActionDuration = param1.countActionDuration;
         this._oldCountBubbleDuration = param1.countBubbleDuration;
         this._oldCountSpeechDuration = param1.countSpeechDuration;
      }
      
      override public function execute() : void
      {
         var _loc1_:AnimeScene = this.scene;
         if(_loc1_.durationMode == AnimeScene.DURATION_MODE_CUSTOM || this._newCountMinimumDuration != _loc1_.countMinimumDuration || this._newCountTransitionDuration != _loc1_.countTransitionDuration || this._newCountActionDuration != _loc1_.countActionDuration || this._newCountBubbleDuration != _loc1_.countBubbleDuration || this._newCountSpeechDuration != _loc1_.countSpeechDuration)
         {
            super.execute();
            this._undoSoundMemento = Console.getConsole().sounds.memento;
            this._undoVoiceMemento = Console.getConsole().voices.memento;
            _loc1_.countMinimumDuration = this._newCountMinimumDuration;
            _loc1_.countTransitionDuration = this._newCountTransitionDuration;
            _loc1_.countActionDuration = this._newCountActionDuration;
            _loc1_.countBubbleDuration = this._newCountBubbleDuration;
            _loc1_.countSpeechDuration = this._newCountSpeechDuration;
            if(_loc1_.durationMode == AnimeScene.DURATION_MODE_CUSTOM)
            {
               this._changeDurationCommand = new ChangeSceneDurationCommand(_loc1_,false);
               this._changeDurationCommand.executeNow(_loc1_.customTotalFrames,AnimeScene.DURATION_MODE_AUTO);
            }
            else
            {
               _loc1_.updateDuration();
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         if(_loc1_)
         {
            _loc1_.countMinimumDuration = this._oldCountMinimumDuration;
            _loc1_.countTransitionDuration = this._oldCountTransitionDuration;
            _loc1_.countActionDuration = this._oldCountActionDuration;
            _loc1_.countBubbleDuration = this._oldCountBubbleDuration;
            _loc1_.countSpeechDuration = this._oldCountSpeechDuration;
            if(this._changeDurationCommand)
            {
               this._changeDurationCommand.undo();
            }
            else
            {
               Console.getConsole().timelineController.autoMoveSounds = false;
               _loc1_.updateDuration();
               Console.getConsole().timelineController.autoMoveSounds = true;
               Console.getConsole().sounds.memento = this._undoSoundMemento;
               Console.getConsole().voices.memento = this._undoVoiceMemento;
            }
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         if(_loc1_)
         {
            _loc1_.countMinimumDuration = this._newCountMinimumDuration;
            _loc1_.countTransitionDuration = this._newCountTransitionDuration;
            _loc1_.countActionDuration = this._newCountActionDuration;
            _loc1_.countBubbleDuration = this._newCountBubbleDuration;
            _loc1_.countSpeechDuration = this._newCountSpeechDuration;
            if(this._changeDurationCommand)
            {
               this._changeDurationCommand.redo();
            }
            else
            {
               _loc1_.updateDuration();
            }
            super.redo();
         }
      }
   }
}
