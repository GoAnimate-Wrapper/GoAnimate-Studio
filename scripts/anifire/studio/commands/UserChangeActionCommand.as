package anifire.studio.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.commands.AddAssetMovementCommand;
   import anifire.studio.assets.commands.RemoveAssetMovementCommand;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.core.Action;
   import anifire.studio.core.Character;
   
   public class UserChangeActionCommand extends AssetCommand
   {
       
      
      private var _toMotion:Boolean;
      
      private var _fromMotion:Boolean;
      
      private var _changeActionCommand:ICommand;
      
      private var _movementCommand:ICommand;
      
      public function UserChangeActionCommand(param1:Character, param2:String, param3:Boolean)
      {
         super(param1);
         _type = "UserChangeActionCommand";
         this._toMotion = param3;
         this._changeActionCommand = new ChangeActionCommand(param1,param2,false);
      }
      
      override public function execute() : void
      {
         var _loc2_:AssetTransition = null;
         var _loc1_:Character = asset as Character;
         if(!_loc1_)
         {
            return;
         }
         if(_loc1_.action is Action && (_loc1_.action as Action).isMotion)
         {
            this._fromMotion = true;
         }
         this._changeActionCommand.execute();
         if(this._toMotion && !this._fromMotion && !_loc1_.isSliding)
         {
            if(_loc1_.scene)
            {
               _loc2_ = _loc1_.scene.assetTransitionController.createTransition(_loc1_);
               if(_loc2_)
               {
                  _loc2_.direction = AssetTransitionConstants.DIRECTION_MOVEMENT;
                  _loc2_.section = AssetTransitionConstants.TIMING_WHOLE_SCENE;
                  this._movementCommand = new AddAssetMovementCommand(_loc1_,_loc2_,false);
                  this._movementCommand.execute();
               }
            }
         }
         if(!this._toMotion && this._fromMotion && _loc1_.isSliding)
         {
            this._movementCommand = new RemoveAssetMovementCommand(_loc1_,false);
            this._movementCommand.execute();
         }
         super.execute();
      }
      
      override public function undo() : void
      {
         if(this._movementCommand)
         {
            this._movementCommand.undo();
         }
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
         if(this._movementCommand)
         {
            this._movementCommand.redo();
         }
         super.redo();
      }
   }
}
