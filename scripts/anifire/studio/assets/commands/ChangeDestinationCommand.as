package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.interfaces.IDestination;
   import anifire.studio.assets.models.AssetTransition;
   
   public class ChangeDestinationCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _newDestination:uint;
      
      public function ChangeDestinationCommand(param1:AssetTransition, param2:uint, param3:Boolean = true)
      {
         super(param1,param3);
         if(param1.direction == AssetTransitionConstants.DIRECTION_IN)
         {
            this._newDestination = 10 - param2;
         }
         else
         {
            this._newDestination = param2;
         }
         _type = "ChangeDestinationCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         if(transition.setting is IDestination)
         {
            IDestination(transition.setting).destination = this._newDestination;
         }
      }
   }
}
