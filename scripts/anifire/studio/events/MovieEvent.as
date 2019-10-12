package anifire.studio.events
{
   import anifire.studio.core.AnimeScene;
   import flash.events.Event;
   
   public class MovieEvent extends Event
   {
      
      public static const SCENE_SELECTED:String = "SCENE_SELECTED";
      
      public static const SCENE_ADDED:String = "SCENE_ADDED";
      
      public static const SCENE_REMOVED:String = "SCENE_REMOVED";
      
      public static const SCENE_MOVED:String = "SCENE_MOVED";
       
      
      private var _index:int = -1;
      
      private var _sourceIndex:int = -1;
      
      private var _destIndex:int = -1;
      
      private var _scene:AnimeScene;
      
      public function MovieEvent(param1:String, param2:int = -1, param3:AnimeScene = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._index = param2;
         this._scene = param3;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get sourceIndex() : int
      {
         return this._sourceIndex;
      }
      
      public function get destIndex() : int
      {
         return this._destIndex;
      }
      
      public function set sourceIndex(param1:int) : void
      {
         this._sourceIndex = param1;
      }
      
      public function set destIndex(param1:int) : void
      {
         this._destIndex = param1;
      }
      
      public function get scene() : AnimeScene
      {
         return this._scene;
      }
      
      override public function clone() : Event
      {
         var _loc1_:MovieEvent = new MovieEvent(type,this._index,this._scene);
         _loc1_.destIndex = this._destIndex;
         _loc1_.sourceIndex = this._sourceIndex;
         return _loc1_;
      }
   }
}
