package anifire.studio.commands
{
   import anifire.studio.core.Background;
   
   public class RemoveBackgroundCommand extends ComplexSceneCommand
   {
       
      
      private var _bg:Background;
      
      private var _undoable:Boolean;
      
      public function RemoveBackgroundCommand(param1:Background, param2:Boolean = true)
      {
         super();
         _type = "RemoveBackgroundCommand";
         this._bg = param1;
         this._undoable = param2;
      }
      
      override public function execute() : void
      {
         if(this._undoable)
         {
            super.execute();
         }
         if(this._bg)
         {
            this._bg.deleteAsset();
         }
      }
   }
}
