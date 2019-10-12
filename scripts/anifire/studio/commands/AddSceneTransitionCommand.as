package anifire.studio.commands
{
   import anifire.studio.core.GoTransition;
   
   public class AddSceneTransitionCommand extends SceneCommand
   {
       
      
      private var _oldTransition:GoTransition;
      
      private var _newtransition:GoTransition;
      
      public function AddSceneTransitionCommand(param1:GoTransition)
      {
         super();
         _type = "AddSceneTransitionCommand";
         this._newtransition = param1;
         if(scene)
         {
            this._oldTransition = scene.transition;
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this.redo();
      }
      
      override public function undo() : void
      {
         if(scene)
         {
            scene.transition = this._oldTransition;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(scene && this._newtransition)
         {
            scene.transition = this._newtransition;
         }
         super.redo();
      }
   }
}
