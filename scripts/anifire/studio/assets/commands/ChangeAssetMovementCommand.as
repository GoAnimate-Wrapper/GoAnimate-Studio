package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.AssetCommand;
   import anifire.studio.core.Asset;
   import anifire.studio.core.MotionData;
   
   public class ChangeAssetMovementCommand extends AssetCommand
   {
       
      
      private var _changeMotionCommand:ChangeAssetMotionCommand;
      
      private var _removeTransitionCommand:RemoveTransitionCommand;
      
      private var _addTransitionCommand:AddTransitionCommand;
      
      private var _newMotion:MotionData;
      
      private var _endScaleRatio:Number = 1;
      
      private var _timing:uint;
      
      private var _section:uint;
      
      public function ChangeAssetMovementCommand(param1:Asset, param2:MotionData, param3:Boolean = true, param4:uint = 3, param5:Number = 1, param6:uint = 6)
      {
         super(param1,param3);
         _type = "ChangeAssetMovementCommand";
         this._newMotion = param2;
         this._endScaleRatio = param5;
         this._timing = param4;
         this._section = param6;
      }
      
      override public function execute() : void
      {
         var _loc2_:Array = null;
         var _loc3_:AssetTransition = null;
         var _loc4_:AssetTransition = null;
         super.execute();
         var _loc1_:Asset = this.asset;
         this._changeMotionCommand = new ChangeAssetMotionCommand(_loc1_,this._newMotion,false,this._endScaleRatio);
         this._changeMotionCommand.execute();
         if(_loc1_ && this.scene)
         {
            _loc2_ = AssetTransitionHelper.getTransitions(_loc1_.id,this.scene.assetTransitions);
            if(_loc2_ && _loc2_.length > 0)
            {
               for each(_loc3_ in _loc2_)
               {
                  if(_loc3_ && _loc3_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
                  {
                     this._removeTransitionCommand = new RemoveTransitionCommand(_loc3_,false);
                     this._removeTransitionCommand.execute();
                     break;
                  }
               }
            }
         }
         if(this._newMotion)
         {
            _loc4_ = this.scene.assetTransitionController.createTransition(_loc1_);
            if(_loc4_)
            {
               _loc4_.direction = AssetTransitionConstants.DIRECTION_MOVEMENT;
               _loc4_.timing = this._timing;
               _loc4_.section = this._section;
               this._addTransitionCommand = new AddTransitionCommand(_loc4_,false);
               this._addTransitionCommand.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.undo();
         }
         if(this._removeTransitionCommand)
         {
            this._removeTransitionCommand.undo();
         }
         if(this._changeMotionCommand)
         {
            this._changeMotionCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._changeMotionCommand)
         {
            this._changeMotionCommand.redo();
         }
         if(this._removeTransitionCommand)
         {
            this._removeTransitionCommand.redo();
         }
         if(this._addTransitionCommand)
         {
            this._addTransitionCommand.redo();
         }
         super.redo();
      }
   }
}
