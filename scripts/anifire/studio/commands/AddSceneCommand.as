package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.MovieData;
   import anifire.studio.managers.SceneManager;
   
   public class AddSceneCommand extends SuperCommand
   {
       
      
      private var _movie:MovieData;
      
      private var _scene:AnimeScene;
      
      private var _index:int;
      
      public function AddSceneCommand(param1:MovieData, param2:AnimeScene, param3:int)
      {
         super(param2.id);
         this._movie = param1;
         this._scene = param2;
         this._index = param3;
         _type = "AddSceneCommand";
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._movie && this._scene)
         {
            this._movie.addSceneAt(this._scene,this._index);
            SceneManager.checkSceneNum(this._movie.length);
            SceneManager.checkMovieDuration(this._movie.getTotalDuration());
         }
      }
      
      override public function undo() : void
      {
         if(this._movie && this._scene)
         {
            this._movie.removeSceneAt(this._index);
         }
      }
      
      override public function redo() : void
      {
         if(this._movie && this._scene)
         {
            this._movie.addSceneAt(this._scene,this._index);
         }
      }
   }
}
