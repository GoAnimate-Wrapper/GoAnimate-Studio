package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   
   public class ChangeTransitionCollectionTimingCommand extends CollectiveCommand
   {
       
      
      public function ChangeTransitionCollectionTimingCommand(param1:Vector.<AssetTransition>, param2:uint, param3:Boolean = true)
      {
         var _loc4_:AssetTransition = null;
         super(param3);
         _type = "ChangeTransitionCollectionTimingCommand";
         if(param1)
         {
            for each(_loc4_ in param1)
            {
               this.addCommand(new ChangeTimingCommand(_loc4_,param2,false));
            }
         }
      }
   }
}
