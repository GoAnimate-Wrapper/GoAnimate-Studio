package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   
   public class AddTransitionCollectionCommand extends CollectiveCommand
   {
       
      
      public function AddTransitionCollectionCommand(param1:Vector.<AssetTransition>, param2:Boolean = true)
      {
         var _loc3_:AssetTransition = null;
         super(param2);
         _type = "AddTransitionCollectionCommand";
         if(param1)
         {
            for each(_loc3_ in param1)
            {
               this.addCommand(new AddTransitionCommand(_loc3_,false));
            }
         }
      }
   }
}
