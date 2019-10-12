package anifire.studio.commands
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.SoundCollection;
   
   public class AbstractSoundCommand extends SuperCommand
   {
       
      
      private var _undoable:Boolean = true;
      
      protected var _soundId:String;
      
      protected var _sound:AnimeSound;
      
      protected var _collection:SoundCollection;
      
      public function AbstractSoundCommand(param1:AnimeSound, param2:Boolean = true, param3:SoundCollection = null)
      {
         super();
         this._sound = param1;
         if(param1)
         {
            this._soundId = param1.id;
         }
         this._collection = param3;
         this._undoable = param2;
         _type = "AbstractSoundCommand";
      }
      
      override public function execute() : void
      {
         if(this._undoable)
         {
            super.execute();
         }
      }
      
      override public function undo() : void
      {
      }
      
      override public function redo() : void
      {
      }
   }
}
