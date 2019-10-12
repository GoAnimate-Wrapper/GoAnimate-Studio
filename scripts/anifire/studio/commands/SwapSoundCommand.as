package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.sound.SoundCollectionMemento;
   
   public class SwapSoundCommand extends AbstractSoundCommand
   {
       
      
      private var _oldSoundThumb:SoundThumb;
      
      private var _soundThumb:SoundThumb;
      
      private var _undoSoundMemento:SoundCollectionMemento;
      
      private var _trimSoundCommand:TrimSoundCommand;
      
      public function SwapSoundCommand(param1:AnimeSound, param2:SoundThumb, param3:Boolean = true)
      {
         super(param1,param3);
         this._soundThumb = param2;
      }
      
      override public function execute() : void
      {
         if(!_sound || !this._soundThumb)
         {
            return;
         }
         super.execute();
         this._oldSoundThumb = _sound.soundThumb;
         this._undoSoundMemento = _sound.soundsController.sounds.memento;
         this.swapSound();
         this._trimSoundCommand = new TrimSoundCommand(_sound,1,-1,false);
         this._trimSoundCommand.execute();
      }
      
      private function swapSound() : void
      {
         var _loc1_:int = 0;
         _sound.soundThumb = this._soundThumb;
         var _loc2_:AnimeScene = _sound.scene;
         if(_loc2_)
         {
            _loc1_ = _sound.soundsController.resizeSound(_sound,_sound.startFrame,_sound.startFrame + _loc2_.totalFrames - 1);
         }
         else
         {
            _loc1_ = _sound.soundsController.resizeSound(_sound,_sound.startFrame,_sound.startFrame + this._soundThumb.totalFrame - 1);
            if(_loc1_ > 0)
            {
               _sound.soundsController.showOverlapConfirmation();
            }
         }
      }
      
      override public function undo() : void
      {
         if(!_sound || !this._soundThumb)
         {
            return;
         }
         super.undo();
         if(this._trimSoundCommand)
         {
            this._trimSoundCommand.undo();
         }
         _sound.soundThumb = this._oldSoundThumb;
         if(this._undoSoundMemento)
         {
            _sound.soundsController.sounds.memento = this._undoSoundMemento;
         }
      }
      
      override public function redo() : void
      {
         if(!_sound || !this._soundThumb)
         {
            return;
         }
         super.redo();
         this.swapSound();
         if(this._trimSoundCommand)
         {
            this._trimSoundCommand.redo();
         }
      }
   }
}
