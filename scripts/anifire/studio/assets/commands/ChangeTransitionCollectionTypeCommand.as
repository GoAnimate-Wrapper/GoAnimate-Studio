package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   
   public class ChangeTransitionCollectionTypeCommand extends CollectiveCommand
   {
       
      
      public function ChangeTransitionCollectionTypeCommand(param1:Vector.<AssetTransition>, param2:String, param3:Boolean = true)
      {
         var _loc4_:AssetTransition = null;
         super(param3);
         _type = "ChangeTransitionCollectionTypeCommand";
         if(param1)
         {
            for each(_loc4_ in param1)
            {
               this.addCommand(new ChangeTypeCommand(_loc4_,param2,false));
            }
         }
      }
   }
}
