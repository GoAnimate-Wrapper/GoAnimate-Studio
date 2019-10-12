package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   
   public class TrimSoundCommand extends AbstractSoundCommand
   {
       
      
      private var _oldTotalFrame:int;
      
      private var _newTotalFrame:int;
      
      private var _oldTrimStartFrame:int;
      
      private var _newTrimStartFrame:int;
      
      private var _oldTrimEndFrame:int;
      
      private var _newTrimEndFrame:int;
      
      public function TrimSoundCommand(param1:AnimeSound, param2:int, param3:int, param4:Boolean = true)
      {
         super(param1,param4);
         this._newTrimStartFrame = param2;
         this._newTrimEndFrame = param3;
         _type = "TrimSoundCommand";
      }
      
      override public function execute() : void
      {
         if(_sound.trimStartFrame != this._newTrimStartFrame || _sound.trimEndFrame != this._newTrimEndFrame)
         {
            super.execute();
            this._oldTrimStartFrame = _sound.trimStartFrame;
            this._oldTrimEndFrame = _sound.trimEndFrame;
            _sound.trimStartFrame = this._newTrimStartFrame;
            _sound.trimEndFrame = this._newTrimEndFrame;
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         _sound.trimStartFrame = this._oldTrimStartFrame;
         _sound.trimEndFrame = this._oldTrimEndFrame;
      }
      
      override public function redo() : void
      {
         super.redo();
         _sound.trimStartFrame = this._newTrimStartFrame;
         _sound.trimEndFrame = this._newTrimEndFrame;
      }
   }
}
