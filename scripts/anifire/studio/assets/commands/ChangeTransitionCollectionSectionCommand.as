package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   
   public class ChangeTransitionCollectionSectionCommand extends CollectiveCommand
   {
       
      
      public function ChangeTransitionCollectionSectionCommand(param1:Vector.<AssetTransition>, param2:uint, param3:Boolean = true)
      {
         var _loc4_:AssetTransition = null;
         super(param3);
         _type = "ChangeTransitionCollectionSectionCommand";
         if(param1)
         {
            for each(_loc4_ in param1)
            {
               this.addCommand(new ChangeSectionCommand(_loc4_,param2,false));
            }
         }
      }
   }
}
