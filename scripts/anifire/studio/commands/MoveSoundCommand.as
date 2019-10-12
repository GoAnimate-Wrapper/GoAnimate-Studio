package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.SoundCollection;
   import anifire.studio.core.sound.SoundCollectionMemento;
   
   public class MoveSoundCommand extends AbstractSoundCommand
   {
       
      
      private var _newStartFrame:int;
      
      private var _newTotalFrame:int;
      
      private var _newTrack:int;
      
      private var _newSoundCollectionMemento:SoundCollectionMemento;
      
      private var _oldStartFrame:int;
      
      private var _oldTotalFrame:int;
      
      private var _oldTrack:int;
      
      private var _oldSoundCollectionMemento:SoundCollectionMemento;
      
      public function MoveSoundCommand(param1:AnimeSound, param2:SoundCollection, param3:Boolean = true)
      {
         super(param1,param3,param2);
         if(param1)
         {
            this._oldStartFrame = param1.startFrame;
            this._oldTotalFrame = param1.totalFrame;
            this._oldTrack = param1.trackNum;
         }
         if(param2)
         {
            this._oldSoundCollectionMemento = param2.memento;
         }
         _type = "MoveSoundCommand";
      }
      
      public function executeNow(param1:int, param2:int, param3:int) : Boolean
      {
         this._newStartFrame = param1;
         this._newTotalFrame = param2;
         this._newTrack = param3;
         if(this._oldStartFrame != this._newStartFrame || this._oldTotalFrame != this._newTotalFrame || this._oldTrack != this._newTrack)
         {
            if(_sound)
            {
               super.execute();
               _sound.startFrame = this._newStartFrame;
               _sound.totalFrame = this._newTotalFrame;
               _sound.trackNum = this._newTrack;
               return true;
            }
         }
         return false;
      }
      
      override public function undo() : void
      {
         if(this._oldSoundCollectionMemento && _collection)
         {
            this._newSoundCollectionMemento = _collection.memento;
            _collection.memento = this._oldSoundCollectionMemento;
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         if(this._newSoundCollectionMemento && _collection)
         {
            _collection.memento = this._newSoundCollectionMemento;
            super.redo();
         }
      }
   }
}
