package anifire.studio.commands
{
   import anifire.studio.core.GoTransition;
   
   public class RemoveSceneTransitionCommand extends SceneCommand
   {
       
      
      private var _transition:GoTransition;
      
      public function RemoveSceneTransitionCommand(param1:GoTransition)
      {
         super();
         this._transition = param1;
         _type = "RemoveSceneTransitionCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         this.redo();
      }
      
      override public function undo() : void
      {
         if(scene && this._transition)
         {
            scene.transition = this._transition;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(scene)
         {
            scene.transition = null;
         }
         super.redo();
      }
   }
}
