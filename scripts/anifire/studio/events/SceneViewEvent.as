package anifire.studio.events
{
   import flash.events.Event;
   
   public class SceneViewEvent extends Event
   {
      
      public static const VIEW_LOAD_COMPLETE:String = "SCENE_VIEW_LOAD_COMPLETE";
      
      public static const VIEW_CHANGE:String = "SCENE_VIEW_CHANGE";
      
      public static const ASSET_VIEW_ADDED:String = "ASSET_VIEW_ADDED";
       
      
      public function SceneViewEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
