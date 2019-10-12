package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   
   public class ChangeSoundLineCommand extends AbstractSoundCommand
   {
       
      
      private var _newLine:String;
      
      private var _oldLine:String;
      
      public function ChangeSoundLineCommand(param1:AnimeSound, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         this._newLine = param2;
      }
      
      override public function execute() : void
      {
         if(_sound && _sound.soundThumb && _sound.soundThumb.ttsData)
         {
            this._oldLine = _sound.soundThumb.ttsData.text;
            if(this._oldLine != this._newLine)
            {
               _sound.soundThumb.ttsData.text = this._newLine;
               super.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         if(_sound && _sound.soundThumb && _sound.soundThumb.ttsData)
         {
            super.undo();
            _sound.soundThumb.ttsData.text = this._oldLine;
         }
      }
      
      override public function redo() : void
      {
         if(_sound && _sound.soundThumb && _sound.soundThumb.ttsData)
         {
            super.redo();
            _sound.soundThumb.ttsData.text = this._newLine;
         }
      }
   }
}
