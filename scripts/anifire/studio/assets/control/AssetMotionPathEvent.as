package anifire.studio.assets.control
{
   import flash.events.Event;
   
   public class AssetMotionPathEvent extends Event
   {
      
      public static const CONTROL_POINT_ADDED:String = "CONTROL_POINT_ADDED";
      
      public static const CONTROL_POINT_REMOVED:String = "CONTROL_POINT_REMOVED";
      
      public static const CONTROL_POINT_MOVED:String = "CONTROL_POINT_MOVED";
      
      public static const CONTROL_POINT_MOVING:String = "CONTROL_POINT_MOVING";
      
      public static const PATH_ORIENTED_CHANGED:String = "PATH_ORIENTED_CHANGED";
      
      public static const MOTION_PATH_REMOVED:String = "MOTION_PATH_REMOVED";
       
      
      public function AssetMotionPathEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
