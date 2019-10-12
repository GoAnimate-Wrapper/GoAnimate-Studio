package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   
   public class ChangeAdvancedSoundFadingCommand extends CollectiveCommand
   {
       
      
      public var newFadeInDuration:int;
      
      public var newFadeInVolume:Number;
      
      public var newFadeOutDuration:int;
      
      public var newFadeOutVolume:Number;
      
      public var newMiddleVolume:Number;
      
      private var _sound:AnimeSound;
      
      private var _oldHasFading:Boolean;
      
      private var _fadingCommand:ChangeSoundFadingCommand;
      
      private var _volumeCommand:ChangeVolumeCommand;
      
      public function ChangeAdvancedSoundFadingCommand(param1:AnimeSound, param2:Boolean = true)
      {
         super(param2);
         _type = "ChangeAdvancedSoundFadingCommand";
         this._sound = param1;
         this._oldHasFading = this._sound.hasFading;
      }
      
      public function commit() : void
      {
         this._volumeCommand = new ChangeVolumeCommand(this._sound,this.newMiddleVolume,false);
         addCommand(this._volumeCommand);
         this._fadingCommand = new ChangeSoundFadingCommand(this._sound,this.newFadeInDuration,this.newFadeOutDuration,this.newFadeInVolume,this.newFadeOutVolume,false);
         addCommand(this._fadingCommand);
      }
      
      override public function execute() : void
      {
         this._sound.hasFading = true;
         super.execute();
      }
      
      override public function undo() : void
      {
         super.undo();
         this._sound.hasFading = this._oldHasFading;
      }
      
      override public function redo() : void
      {
         this._sound.hasFading = true;
         super.redo();
      }
   }
}
