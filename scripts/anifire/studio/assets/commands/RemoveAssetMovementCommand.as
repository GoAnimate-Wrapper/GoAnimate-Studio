package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.AssetCommand;
   import anifire.studio.core.Asset;
   
   public class RemoveAssetMovementCommand extends AssetCommand
   {
       
      
      private var _changeMotionCommand:ChangeAssetMotionCommand;
      
      private var _removeTransitionCommand:RemoveTransitionCommand;
      
      public function RemoveAssetMovementCommand(param1:Asset, param2:Boolean = true)
      {
         var _loc3_:Array = null;
         var _loc4_:AssetTransition = null;
         super(param1,param2);
         _type = "RemoveAssetMovementCommand";
         this._changeMotionCommand = new ChangeAssetMotionCommand(param1,null,false);
         if(param1 && this.scene)
         {
            _loc3_ = AssetTransitionHelper.getTransitions(param1.id,this.scene.assetTransitions);
            if(_loc3_ && _loc3_.length > 0)
            {
               for each(_loc4_ in _loc3_)
               {
                  if(_loc4_ && _loc4_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
                  {
                     this._removeTransitionCommand = new RemoveTransitionCommand(_loc4_,false);
                     break;
                  }
               }
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this._changeMotionCommand.execute();
         if(this._removeTransitionCommand)
         {
            this._removeTransitionCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         this._changeMotionCommand.undo();
         if(this._removeTransitionCommand)
         {
            this._removeTransitionCommand.undo();
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         this._changeMotionCommand.redo();
         if(this._removeTransitionCommand)
         {
            this._removeTransitionCommand.redo();
         }
      }
   }
}
