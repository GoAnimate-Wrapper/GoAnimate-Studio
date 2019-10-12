package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.Console;
   import anifire.studio.core.MovieData;
   import anifire.studio.core.sound.SoundSelection;
   
   public class AddStarterCommand extends SuperCommand
   {
       
      
      private var _undoSoundInfos:Array;
      
      private var _redoSoundInfos:Array;
      
      private var _movie:MovieData;
      
      private var _starter:BackgroundThumb;
      
      private var _index:Number;
      
      private var _removeSceneCommand:RemoveSceneCommand;
      
      private var _replaceCurrent:Boolean;
      
      private var _removedSceneIds:Array;
      
      private var _sounds:SoundSelection;
      
      private var _voices:SoundSelection;
      
      private var _delta:int;
      
      private var _oldScene:AnimeScene;
      
      private var _attachSoundCommand:AttachSoundCommand;
      
      public function AddStarterCommand(param1:MovieData, param2:BackgroundThumb, param3:Number, param4:Boolean = true, param5:SoundSelection = null, param6:SoundSelection = null, param7:int = 0)
      {
         super();
         _type = "AddStarterCommand";
         this._movie = param1;
         this._starter = param2;
         this._index = param3;
         this._replaceCurrent = param4;
         this._sounds = param5;
         this._voices = param6;
         this._delta = param7;
      }
      
      override public function execute() : void
      {
         var _loc2_:AnimeSound = null;
         super.execute();
         var _loc1_:Console = Console.getConsole();
         if(this._replaceCurrent)
         {
            this._oldScene = _loc1_.getScene(this._index);
            this._oldScene.saveTextCopiesFromTextComponent();
            _loc1_.textComponentData = this._oldScene.textComponentData.clone();
         }
         _loc1_.startProcessingStarter(!this._replaceCurrent);
         _loc1_.insertStarterImpl(this._starter,this._index);
         if(this._replaceCurrent)
         {
            if(this._oldScene)
            {
               _loc2_ = this._oldScene.speech;
               if(_loc2_)
               {
                  this._attachSoundCommand = new AttachSoundCommand(_loc1_.getScene(this._index),_loc2_,false);
                  this._attachSoundCommand.execute();
               }
               else
               {
                  _loc1_.timelineController.moveSoundCollectionByFrame(this._sounds,-this._delta);
                  _loc1_.timelineController.moveSoundCollectionByFrame(this._voices,-this._delta);
               }
            }
            this._removeSceneCommand = new RemoveSceneCommand(this._movie,_loc1_.getScene(this._index + 1),this._index + 1,false);
            this._removeSceneCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         var _loc2_:AnimeSound = null;
         var _loc1_:Console = Console.getConsole();
         if(this._replaceCurrent)
         {
            this._removeSceneCommand.undo();
            _loc1_.timelineController.autoMoveSounds = false;
         }
         if(this._attachSoundCommand)
         {
            _loc2_ = _loc1_.getScene(this._index).speech;
            this._attachSoundCommand = new AttachSoundCommand(this._oldScene,_loc2_,false);
            this._attachSoundCommand.execute();
         }
         else
         {
            _loc1_.timelineController.moveSoundCollectionByFrame(this._sounds,this._delta);
            _loc1_.timelineController.moveSoundCollectionByFrame(this._voices,this._delta);
         }
         this._removedSceneIds = this._movie.removeMultipleScene(this._index,this._starter.numScenes);
         if(this._replaceCurrent)
         {
            _loc1_.timelineController.autoMoveSounds = true;
         }
      }
      
      override public function redo() : void
      {
         var _loc2_:AnimeSound = null;
         var _loc1_:Console = Console.getConsole();
         _loc1_.startProcessingStarter(!this._replaceCurrent);
         _loc1_.insertStarterImpl(this._starter,this._index,this._removedSceneIds);
         if(this._attachSoundCommand)
         {
            _loc2_ = this._oldScene.speech;
            if(_loc2_)
            {
               this._attachSoundCommand = new AttachSoundCommand(_loc1_.getScene(this._index),_loc2_,false);
               this._attachSoundCommand.execute();
            }
         }
         else
         {
            _loc1_.timelineController.moveSoundCollectionByFrame(this._sounds,-this._delta);
            _loc1_.timelineController.moveSoundCollectionByFrame(this._voices,-this._delta);
         }
         if(this._replaceCurrent)
         {
            this._removeSceneCommand.redo();
         }
      }
   }
}
