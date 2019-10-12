package anifire.studio.assets.commands
{
   import anifire.studio.commands.ChangeActionCommand;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   
   public class RemoveCharacterMovementCommand extends RemoveAssetMovementCommand
   {
       
      
      private var _changeActionCommand:ChangeActionCommand;
      
      public function RemoveCharacterMovementCommand(param1:Character, param2:Boolean = false, param3:Boolean = true)
      {
         var _loc4_:CharThumb = null;
         super(param1,param3);
         _type = "RemoveCharacterMovementCommand";
         if(param1 && param2)
         {
            _loc4_ = param1.thumb as CharThumb;
            if(_loc4_ && _loc4_.defaultStandActionId)
            {
               this._changeActionCommand = new ChangeActionCommand(param1,_loc4_.defaultStandActionId,false);
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._changeActionCommand)
         {
            this._changeActionCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         if(this._changeActionCommand)
         {
            this._changeActionCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._changeActionCommand)
         {
            this._changeActionCommand.redo();
         }
         super.redo();
      }
   }
}
