package anifire.studio.events
{
   import anifire.studio.core.AnimeScene;
   import flash.events.Event;
   
   public class SceneDurationEvent extends Event
   {
      
      public static const SCENE_DURATION_CHANGE:String = "SCENE_DURATION_CHANGE";
       
      
      private var _offset:int = 0;
      
      private var _scene:AnimeScene;
      
      public function SceneDurationEvent(param1:String, param2:AnimeScene, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._offset = param3;
         this._scene = param2;
      }
      
      public function get offset() : int
      {
         return this._offset;
      }
      
      public function get scene() : AnimeScene
      {
         return this._scene;
      }
      
      override public function clone() : Event
      {
         return new SceneDurationEvent(this.type,this.scene,this.offset);
      }
   }
}
