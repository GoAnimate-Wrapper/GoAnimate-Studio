package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   
   public class SceneCommand extends SuperCommand
   {
       
      
      protected var _undoable:Boolean = true;
      
      public function SceneCommand(param1:Boolean = true, param2:AnimeScene = null)
      {
         var _loc3_:String = !!param2?param2.id:"";
         super(_loc3_);
         _type = "SceneCommand";
         this._undoable = param1;
      }
      
      protected function get scene() : AnimeScene
      {
         return Console.getConsole().getScenebyId(sceneId);
      }
      
      protected function disableSoundOverlapCheck() : void
      {
         var _loc2_:Console = null;
         var _loc1_:AnimeScene = this.scene;
         if(this._undoable && _loc1_ && _loc1_.durationMode == AnimeScene.DURATION_MODE_AUTO)
         {
            _loc2_ = Console.getConsole();
            _loc2_.timelineController.autoResolveSoundOverlap = false;
         }
      }
      
      protected function enableSoundOverlapCheck() : void
      {
         var _loc2_:Console = null;
         var _loc1_:AnimeScene = this.scene;
         if(this._undoable && _loc1_ && _loc1_.durationMode == AnimeScene.DURATION_MODE_AUTO)
         {
            _loc2_ = Console.getConsole();
            _loc2_.timelineController.autoResolveSoundOverlap = true;
            _loc2_.timelineController.resolveAllSoundOverlap();
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:AnimeScene = null;
         if(this._undoable)
         {
            this.putCommand();
            _loc1_ = this.scene;
            if(_loc1_)
            {
               _loc1_.modified = true;
            }
         }
      }
      
      protected function putCommand() : void
      {
         CommandStack.getInstance().putCommand(this);
      }
      
      override public function undo() : void
      {
         this.selectTargetScene();
      }
      
      override public function redo() : void
      {
         this.selectTargetScene();
      }
      
      protected function selectTargetScene() : void
      {
         if(this._undoable)
         {
            if(Console.getConsole().currentSceneId != sceneId)
            {
               Console.getConsole().setCurrentSceneById(sceneId);
            }
         }
      }
   }
}
