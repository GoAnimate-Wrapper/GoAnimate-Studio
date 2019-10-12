package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   
   public class AddAssetCollectionCommand extends CollectiveCommand
   {
       
      
      public function AddAssetCollectionCommand(param1:Array, param2:Boolean = true)
      {
         var _loc3_:Asset = null;
         super(param2);
         if(param1)
         {
            for each(_loc3_ in param1)
            {
               this.addCommand(new AddAssetCommand(_loc3_,false,false));
            }
         }
         _type = "AddAssetCollectionCommand";
      }
   }
}
