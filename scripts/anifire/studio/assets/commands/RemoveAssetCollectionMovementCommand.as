package anifire.studio.assets.commands
{
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.commands.CollectiveCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.MotionData;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   
   public class RemoveAssetCollectionMovementCommand extends CollectiveCommand
   {
       
      
      public function RemoveAssetCollectionMovementCommand(param1:AssetViewCollection)
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ICommand = null;
         var _loc5_:Boolean = false;
         var _loc6_:MotionData = null;
         super();
         _type = "RemoveAssetCollectionMovementCommand";
         if(param1)
         {
            _loc2_ = param1.iterator();
            _loc5_ = true;
            while(_loc2_.hasNext)
            {
               _loc3_ = _loc2_.next as IAssetView;
               if(_loc3_ && _loc3_.asset is IMovable)
               {
                  _loc4_ = new ChangeAssetMovementCommand(_loc3_.asset,null,false);
                  this.addCommand(_loc4_);
               }
            }
         }
      }
   }
}
