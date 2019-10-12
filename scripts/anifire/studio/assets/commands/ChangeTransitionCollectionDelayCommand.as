package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   
   public class ChangeTransitionCollectionDelayCommand extends CollectiveCommand
   {
       
      
      public function ChangeTransitionCollectionDelayCommand(param1:Vector.<AssetTransition>, param2:int, param3:Boolean = true)
      {
         var _loc4_:AssetTransition = null;
         super(param3);
         _type = "ChangeTransitionCollectionDelayCommand";
         if(param1)
         {
            for each(_loc4_ in param1)
            {
               this.addCommand(new ChangeDelayCommand(_loc4_,param2,false));
            }
         }
      }
      
      public function executeNow(param1:int) : void
      {
         var _loc2_:ChangeDelayCommand = null;
         if(_undoable)
         {
            this.putCommand();
         }
         if(_commands)
         {
            for each(_loc2_ in _commands)
            {
               _loc2_.executeNow(param1);
            }
         }
      }
   }
}
