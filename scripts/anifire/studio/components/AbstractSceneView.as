package anifire.studio.components
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.interfaces.ISceneView;
   import flash.events.IEventDispatcher;
   import spark.components.Group;
   
   public class AbstractSceneView extends Group implements ISceneView
   {
       
      
      protected var _sceneModel:AnimeScene;
      
      public function AbstractSceneView()
      {
         super();
      }
      
      public function set sceneModel(param1:AnimeScene) : void
      {
         if(param1)
         {
            if(this._sceneModel)
            {
               this.removeEventListeners(this._sceneModel);
               this.unloadAllAssets();
            }
            this._sceneModel = param1;
            this.loadAllAssets();
            this.addEventListeners(this._sceneModel);
         }
      }
      
      protected function addEventListeners(param1:IEventDispatcher) : void
      {
      }
      
      protected function removeEventListeners(param1:IEventDispatcher) : void
      {
      }
      
      protected function unloadAllAssets() : void
      {
      }
      
      protected function loadAllAssets() : void
      {
      }
      
      public function get sceneModel() : AnimeScene
      {
         return this._sceneModel;
      }
   }
}
