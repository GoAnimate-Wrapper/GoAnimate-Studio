package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.ChangeActionCommand;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   
   public class AddCharacterMovementCommand extends AddAssetMovementCommand
   {
       
      
      private var _changeActionCommand:ChangeActionCommand;
      
      public function AddCharacterMovementCommand(param1:Character, param2:AssetTransition, param3:Boolean = false, param4:Boolean = true)
      {
         var _loc5_:CharThumb = null;
         super(param1,param2,param4);
         _type = "AddCharacterMovementCommand";
         if(param2)
         {
            param2.direction = AssetTransitionConstants.DIRECTION_MOVEMENT;
            param2.section = AssetTransitionConstants.TIMING_WHOLE_SCENE;
         }
         if(param1 && param3)
         {
            _loc5_ = param1.thumb as CharThumb;
            if(_loc5_ && _loc5_.defaultMotionId)
            {
               this._changeActionCommand = new ChangeActionCommand(param1,_loc5_.defaultMotionId,false);
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
         super.undo();
         if(this._changeActionCommand)
         {
            this._changeActionCommand.undo();
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         if(this._changeActionCommand)
         {
            this._changeActionCommand.redo();
         }
      }
   }
}
