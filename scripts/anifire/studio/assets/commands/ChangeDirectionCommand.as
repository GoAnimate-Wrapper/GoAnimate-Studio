package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.SlideAssetCommand;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Character;
   
   public class ChangeDirectionCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _newDirection:int;
      
      private var _motionCommand:ICommand;
      
      public function ChangeDirectionCommand(param1:AssetTransition, param2:int, param3:Boolean = true)
      {
         super(param1);
         _type = "ChangeDirectionCommand";
         this._newDirection = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:Asset = null;
         var _loc2_:Character = null;
         if(transition && transition.direction != this._newDirection)
         {
            super.execute();
            if(this.scene)
            {
               if(this._newDirection == AssetTransitionConstants.DIRECTION_MOVEMENT)
               {
                  _loc1_ = this.scene.getAssetById(transition.assetId);
                  if(_loc1_)
                  {
                     this._motionCommand = new SlideAssetCommand(_loc1_,true,false);
                     this._motionCommand.execute();
                     _loc2_ = _loc1_ as Character;
                     if(_loc2_ && _loc2_.action)
                     {
                        transition.characterActionName = _loc2_.action.name;
                     }
                  }
               }
               else if(transition.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
               {
                  _loc1_ = this.scene.getAssetById(transition.assetId);
                  if(_loc1_)
                  {
                     this._motionCommand = new ChangeAssetMotionCommand(_loc1_,null,false);
                     this._motionCommand.execute();
                  }
               }
            }
            transition.direction = this._newDirection;
         }
      }
      
      override public function undo() : void
      {
         if(this._motionCommand)
         {
            this._motionCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._motionCommand)
         {
            this._motionCommand.redo();
         }
         super.redo();
      }
   }
}
