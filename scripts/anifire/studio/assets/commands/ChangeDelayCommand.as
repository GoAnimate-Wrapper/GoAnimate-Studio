package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   
   public class ChangeDelayCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _newDelay:int;
      
      public function ChangeDelayCommand(param1:AssetTransition, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         this._newDelay = param2;
         _type = "ChangeDelayCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         transition.delay = this._newDelay;
      }
      
      public function executeNow(param1:int) : void
      {
         this._newDelay = param1;
         this.execute();
      }
   }
}
