package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   import anifire.studio.core.Asset;
   
   public class RemoveTransitionCollectionCommand extends CollectiveCommand
   {
       
      
      public function RemoveTransitionCollectionCommand(param1:Array, param2:Boolean = true)
      {
         var _loc3_:AssetTransition = null;
         var _loc4_:Asset = null;
         super(param2);
         _type = "RemoveTransitionCollectionCommand";
         if(param1)
         {
            for each(_loc3_ in param1)
            {
               if(_loc3_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
               {
                  if(this.scene)
                  {
                     _loc4_ = this.scene.getAssetById(_loc3_.assetId);
                     if(_loc4_)
                     {
                        this.addCommand(new RemoveAssetMovementCommand(_loc4_,false));
                     }
                  }
               }
               else
               {
                  this.addCommand(new RemoveTransitionCommand(_loc3_,false));
               }
            }
         }
      }
   }
}
