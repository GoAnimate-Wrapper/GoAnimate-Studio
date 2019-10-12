package anifire.studio.commands
{
   import anifire.studio.assets.controllers.AssetCollectionController;
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IScalable;
   
   public class ResizeObjectCommand extends CollectiveCommand
   {
       
      
      public function ResizeObjectCommand(param1:IResizable)
      {
         var _loc2_:IAssetView = null;
         var _loc3_:Asset = null;
         super();
         _type = "ResizeObjectCommand";
         if(param1 is AssetCollectionController)
         {
            this.addCommand(new ResizeAssetCollectionCommand((param1 as AssetCollectionController).viewCollection,false));
         }
         else if(param1 is IAssetController)
         {
            _loc2_ = (param1 as IAssetController).view;
            _loc3_ = _loc2_.asset;
            if(_loc3_ is IResizable)
            {
               this.addCommand(new ResizeAssetCommand(_loc3_,false));
            }
            if(_loc3_ is IScalable)
            {
               this.addCommand(new ScaleAssetCommand(_loc3_,false));
            }
            if(_loc3_ is IMovable)
            {
               this.addCommand(new MoveAssetCommand(_loc3_,false));
            }
         }
      }
   }
}
