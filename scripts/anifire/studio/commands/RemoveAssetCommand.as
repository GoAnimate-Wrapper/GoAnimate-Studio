package anifire.studio.commands
{
   import anifire.studio.assets.commands.RemoveTransitionCollectionCommand;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.MovieData;
   
   public class RemoveAssetCommand extends AssetCommand
   {
       
      
      private var _asset:Asset;
      
      private var _index:int;
      
      private var _removeLinkageCommand:RemoveLinkageCommand;
      
      private var _removeTransitionCommands:RemoveTransitionCollectionCommand;
      
      public function RemoveAssetCommand(param1:Asset, param2:Boolean = true)
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Boolean = false;
         var _loc6_:MovieData = null;
         var _loc7_:uint = 0;
         var _loc8_:AnimeScene = null;
         var _loc9_:AnimeScene = null;
         var _loc10_:int = 0;
         super(param1,param2);
         _type = "RemoveAssetCommand";
         this._asset = param1;
         if(param1)
         {
            _loc3_ = Console.getConsole().linkageController.getSoundIdByCharId(param1.id);
            if(_loc3_ && _loc3_.length > 0)
            {
               _loc6_ = Console.getConsole().movie;
               _loc7_ = _loc6_.length;
               _loc9_ = this.scene;
               while(_loc10_ < _loc7_)
               {
                  _loc8_ = _loc6_.getSceneAt(_loc10_);
                  if(_loc8_ && _loc8_ != _loc9_ && _loc8_.getCharacterById(param1.id) != null)
                  {
                     _loc5_ = true;
                     break;
                  }
                  _loc10_++;
               }
               if(!_loc5_)
               {
                  this._removeLinkageCommand = new RemoveLinkageCommand(param1 as Character,null,false);
               }
            }
            _loc4_ = AssetTransitionHelper.getTransitions(param1.id,this.scene.assetTransitions);
            if(_loc4_ && _loc4_.length > 0)
            {
               this._removeTransitionCommands = new RemoveTransitionCollectionCommand(_loc4_,false);
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this.redo();
      }
      
      override public function undo() : void
      {
         if(this.scene && this._asset)
         {
            this.scene.addAsset(this._asset);
            this.scene.reorderAsset(this._asset,this._index);
         }
         if(this._removeTransitionCommands)
         {
            this._removeTransitionCommands.undo();
         }
         if(this._removeLinkageCommand)
         {
            this._removeLinkageCommand.undo();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this._removeLinkageCommand)
         {
            this._removeLinkageCommand.execute();
         }
         if(this._removeTransitionCommands)
         {
            this._removeTransitionCommands.redo();
         }
         if(this.scene)
         {
            this._index = this.scene.getAssetOrdering(this.asset);
         }
         if(asset)
         {
            asset.deleteAsset();
         }
         super.redo();
      }
   }
}
