package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   
   public class ChangeTypeCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _newType:String;
      
      public function ChangeTypeCommand(param1:AssetTransition, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         this._newType = param2;
         _type = "ChangeTypeCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         transition.type = this._newType;
      }
   }
}
