package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   
   public class ChangeTransitionCollectionDurationCommand extends CollectiveCommand
   {
       
      
      public function ChangeTransitionCollectionDurationCommand(param1:Vector.<AssetTransition>, param2:int, param3:Boolean = true)
      {
         var _loc4_:AssetTransition = null;
         super(param3);
         _type = "ChangeTransitionCollectionDurationCommand";
         if(param1)
         {
            for each(_loc4_ in param1)
            {
               this.addCommand(new ChangeDurationCommand(_loc4_,param2,false));
            }
         }
      }
      
      public function executeNow(param1:int) : void
      {
         var _loc2_:ChangeDurationCommand = null;
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
