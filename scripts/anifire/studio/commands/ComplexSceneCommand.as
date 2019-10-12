package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   
   public class ComplexSceneCommand extends SuperCommand
   {
       
      
      public function ComplexSceneCommand()
      {
         super();
         _type = "ComplexSceneCommand";
         backupSceneData();
      }
      
      protected function get scene() : AnimeScene
      {
         return Console.getConsole().getScenebyId(sceneId);
      }
   }
}
