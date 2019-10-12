package anifire.studio.commands
{
   import anifire.studio.assets.commands.AddTransitionCommand;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Widget;
   
   public class AddAssetCommand extends AssetCommand
   {
       
      
      private var _asset:Asset;
      
      private var _transitionCommand:ICommand;
      
      public function AddAssetCommand(param1:Asset, param2:Boolean = true, param3:Boolean = true)
      {
         var _loc5_:AssetTransition = null;
         super(param1,param3);
         _type = "AddAssetCommand";
         this._asset = param1;
         var _loc4_:AnimeScene = this.scene;
         if(param1 && _loc4_ && param2)
         {
            if(param1.isWhiteboardAsset || param1.isInfographicAsset || param1 is Widget)
            {
               _loc5_ = _loc4_.assetTransitionController.createTransition(param1);
               if(_loc5_)
               {
                  this._transitionCommand = new AddTransitionCommand(_loc5_,false);
               }
            }
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:AnimeScene = this.scene;
         if(_loc1_ && this._asset)
         {
            super.execute();
            _loc1_.addAsset(this._asset);
            if(this._transitionCommand)
            {
               this._transitionCommand.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         if(this._transitionCommand)
         {
            this._transitionCommand.undo();
         }
         var _loc1_:AnimeScene = this.scene;
         if(_loc1_)
         {
            _loc1_.removeAsset(asset);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         if(_loc1_ && this._asset)
         {
            _loc1_.addAsset(this._asset);
         }
         if(this._transitionCommand)
         {
            this._transitionCommand.redo();
         }
         super.redo();
      }
   }
}
