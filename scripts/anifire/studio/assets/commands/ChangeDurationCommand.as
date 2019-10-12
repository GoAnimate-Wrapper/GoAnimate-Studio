package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   
   public class ChangeDurationCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _newDuration:int;
      
      public function ChangeDurationCommand(param1:AssetTransition, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         this._newDuration = param2;
         _type = "ChangeDurationCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         transition.duration = this._newDuration;
      }
      
      public function executeNow(param1:int) : void
      {
         this._newDuration = param1;
         this.execute();
      }
   }
}
