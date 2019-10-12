package anifire.studio.interfaces
{
   import anifire.studio.core.AnimeScene;
   import flash.events.IEventDispatcher;
   
   public interface ISceneView extends IEventDispatcher
   {
       
      
      function get sceneModel() : AnimeScene;
      
      function set sceneModel(param1:AnimeScene) : void;
   }
}
