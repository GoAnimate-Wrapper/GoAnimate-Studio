package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   
   public class RemoveSpeechCommand extends AbstractSoundCommand
   {
       
      
      private var _removeSoundCommand:RemoveSoundCommand;
      
      private var _dettachSoundCommand:DettachSoundCommand;
      
      private var _removeSoundLinkageCommand:RemoveSoundLinkageCommand;
      
      public function RemoveSpeechCommand(param1:AnimeSound, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "RemoveSpeechCommand";
         this._removeSoundCommand = new RemoveSoundCommand(param1,param1.soundsController.sounds,false);
      }
      
      override public function execute() : void
      {
         if(!_sound)
         {
            return;
         }
         super.execute();
         var _loc1_:Array = Console.getConsole().linkageController.getCharIdBySoundId(_soundId);
         if(_loc1_ && _loc1_.length > 0)
         {
            this._removeSoundLinkageCommand = new RemoveSoundLinkageCommand(_sound,false);
            this._removeSoundLinkageCommand.execute();
         }
         var _loc2_:AnimeScene = _sound.scene;
         if(_loc2_)
         {
            this._dettachSoundCommand = new DettachSoundCommand(_loc2_,false,false);
            this._dettachSoundCommand.execute();
         }
         this._removeSoundCommand.execute();
         if(_loc2_)
         {
            _loc2_.updateDuration();
         }
      }
      
      override public function undo() : void
      {
         if(!_sound)
         {
            return;
         }
         super.undo();
         this._removeSoundCommand.undo();
         if(this._dettachSoundCommand)
         {
            this._dettachSoundCommand.undo();
         }
         if(this._removeSoundLinkageCommand)
         {
            this._removeSoundLinkageCommand.undo();
         }
      }
      
      override public function redo() : void
      {
         if(!_sound)
         {
            return;
         }
         super.redo();
         var _loc1_:AnimeScene = _sound.scene;
         if(this._removeSoundLinkageCommand)
         {
            this._removeSoundLinkageCommand.redo();
         }
         if(this._dettachSoundCommand)
         {
            this._dettachSoundCommand.redo();
         }
         this._removeSoundCommand.redo();
         if(_loc1_)
         {
            _loc1_.updateDuration();
         }
      }
   }
}
