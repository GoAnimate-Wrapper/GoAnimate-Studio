package anifire.studio.assets.commands
{
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.SceneCommand;
   
   public class ChangeAssetTransitionCommand extends SceneCommand
   {
       
      
      private var _oldXml:XML;
      
      private var _newXml:XML;
      
      protected var _transition:AssetTransition;
      
      public function ChangeAssetTransitionCommand(param1:AssetTransition, param2:Boolean = true)
      {
         super(param2);
         _type = "ChangeAssetTransitionCommand";
         this._transition = param1;
         if(param1)
         {
            this._oldXml = param1.convertToXml();
         }
      }
      
      protected function get transition() : AssetTransition
      {
         if(this._transition)
         {
            return AssetTransitionHelper.getTransition(this._transition.id,this.scene.assetTransitions);
         }
         return null;
      }
      
      override public function undo() : void
      {
         var _loc1_:AssetTransition = this.transition;
         if(this.scene && _loc1_)
         {
            this._newXml = _loc1_.convertToXml();
            _loc1_.convertFromXml(this._oldXml);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:AssetTransition = this.transition;
         if(this.scene && _loc1_)
         {
            _loc1_.convertFromXml(this._newXml);
         }
         super.redo();
      }
   }
}
