package anifire.studio.assets.commands
{
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.SceneCommand;
   
   public class AddTransitionCommand extends SceneCommand
   {
       
      
      private var _transition:AssetTransition;
      
      private var _prepend:Boolean;
      
      public function AddTransitionCommand(param1:AssetTransition, param2:Boolean = true, param3:Boolean = false)
      {
         super(param2);
         _type = "AddTransitionCommand";
         this._transition = param1;
         this._prepend = param3;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.addTransition();
      }
      
      override public function undo() : void
      {
         if(scene && this._transition)
         {
            this._transition = AssetTransitionHelper.getTransition(this._transition.id,scene.assetTransitions);
            if(this._transition)
            {
               scene.assetTransitions.removeTransition(this._transition);
            }
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         this.addTransition();
         super.redo();
      }
      
      private function addTransition() : void
      {
         if(scene && this._transition)
         {
            if(this._prepend)
            {
               scene.assetTransitions.addTransitionAt(this._transition,0);
            }
            else
            {
               scene.assetTransitions.addTransition(this._transition);
            }
         }
      }
   }
}
