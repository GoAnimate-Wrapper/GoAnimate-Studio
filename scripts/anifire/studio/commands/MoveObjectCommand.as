package anifire.studio.commands
{
   import anifire.studio.assets.controllers.AssetCollectionController;
   import anifire.studio.assets.models.AssetCollectionShadow;
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   
   public class MoveObjectCommand extends SceneCommand
   {
       
      
      private var _command:ICommand;
      
      public function MoveObjectCommand(param1:IMovable)
      {
         var _loc2_:IAssetView = null;
         super();
         _type = "MoveObjectCommand";
         if(param1 is AssetCollectionController)
         {
            this._command = new MoveAssetCollectionCommand((param1 as AssetCollectionController).viewCollection,false);
         }
         else if(param1 is IAssetController)
         {
            _loc2_ = (param1 as IAssetController).view;
            this._command = new MoveAssetCommand(_loc2_.asset,false);
         }
         else if(param1 is Asset)
         {
            this._command = new MoveAssetCommand(param1 as Asset,false);
         }
         else if(param1 is AssetCollectionShadow)
         {
            this._command = new MoveAssetCollectionShadowCommand(param1 as AssetCollectionShadow,false);
         }
      }
      
      override public function execute() : void
      {
         if(this._command)
         {
            super.execute();
            this._command.execute();
         }
      }
      
      override public function undo() : void
      {
         if(this._command)
         {
            this._command.undo();
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         if(this._command)
         {
            this._command.redo();
            super.redo();
         }
      }
   }
}
