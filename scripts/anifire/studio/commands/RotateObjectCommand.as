package anifire.studio.commands
{
   import anifire.studio.assets.controllers.AssetCollectionController;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IRotatable;
   
   public class RotateObjectCommand extends CollectiveCommand
   {
       
      
      public function RotateObjectCommand(param1:IRotatable)
      {
         var _loc2_:IAssetView = null;
         super();
         _type = "RotateObjectCommand";
         if(param1 is AssetCollectionController)
         {
            this.addCommand(new RotateAssetCollectionCommand((param1 as AssetCollectionController).viewCollection,false));
         }
         else if(param1 is IAssetController)
         {
            _loc2_ = (param1 as IAssetController).view;
            if(_loc2_)
            {
               if(_loc2_.asset is IRotatable)
               {
                  this.addCommand(new RotateAssetCommand(_loc2_.asset,false));
               }
               if(_loc2_.asset is IMovable)
               {
                  this.addCommand(new MoveAssetCommand(_loc2_.asset,false));
               }
            }
         }
      }
   }
}
