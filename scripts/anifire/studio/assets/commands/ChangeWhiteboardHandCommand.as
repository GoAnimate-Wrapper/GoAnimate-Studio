package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.assets.models.HandDrawnTransitionSetting;
   
   public class ChangeWhiteboardHandCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _handStyle:int;
      
      public function ChangeWhiteboardHandCommand(param1:AssetTransition, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         this._handStyle = param2;
         _type = "ChangeHandStyleCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:HandDrawnTransitionSetting = _transition.setting as HandDrawnTransitionSetting;
         if(_loc1_)
         {
            _loc1_.whiteboardHandStyle = this._handStyle;
         }
      }
   }
}
