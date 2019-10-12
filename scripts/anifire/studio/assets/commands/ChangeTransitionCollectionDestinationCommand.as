package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   
   public class ChangeTransitionCollectionDestinationCommand extends CollectiveCommand
   {
       
      
      public function ChangeTransitionCollectionDestinationCommand(param1:Vector.<AssetTransition>, param2:uint, param3:Boolean = true)
      {
         var _loc4_:AssetTransition = null;
         super(param3);
         _type = "ChangeTransitionCollectionDestinationCommand";
         if(param1)
         {
            for each(_loc4_ in param1)
            {
               this.addCommand(new ChangeDestinationCommand(_loc4_,param2,false));
            }
         }
      }
   }
}
