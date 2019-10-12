package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.AssetCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   
   public class OverwriteAssetTransitionCommand extends AssetCommand
   {
       
      
      private var _removeTransitionCommand:RemoveTransitionCommand;
      
      private var _addTransitionCommand:AddTransitionCommand;
      
      private var _direction:uint;
      
      private var _timing:uint;
      
      public function OverwriteAssetTransitionCommand(param1:Asset, param2:uint, param3:uint, param4:Boolean = true)
      {
         super(param1,param4);
         _type = "OverwriteAssetTransitionCommand";
         this._direction = param2;
         this._timing = param3;
      }
      
      override public function execute() : void
      {
         var _loc3_:Array = null;
         var _loc4_:AssetTransition = null;
         var _loc5_:AssetTransition = null;
         super.execute();
         var _loc1_:Asset = this.asset;
         var _loc2_:AnimeScene = this.scene;
         if(_loc1_ && _loc2_)
         {
            _loc3_ = AssetTransitionHelper.getTransitions(_loc1_.id,_loc2_.assetTransitions);
            if(_loc3_ && _loc3_.length > 0)
            {
               for each(_loc5_ in _loc3_)
               {
                  if(_loc5_ && _loc5_.direction == this._direction)
                  {
                     this._removeTransitionCommand = new RemoveTransitionCommand(_loc5_,false);
                     this._removeTransitionCommand.execute();
                     break;
                  }
               }
            }
            _loc4_ = _loc2_.assetTransitionController.createTransition(_loc1_);
            if(_loc4_)
            {
               _loc4_.direction = this._direction;
               _loc4_.timing = this._timing;
               _loc4_.duration = 24;
               _loc4_.delay = 0;
               _loc4_.soundMode = AssetTransitionConstants.SOUND_OFF;
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
         super.undo();
      }
      
      override public function redo() : void
      {
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
