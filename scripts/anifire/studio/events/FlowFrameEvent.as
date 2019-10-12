package anifire.studio.events
{
   import flash.events.Event;
   
   public class FlowFrameEvent extends Event
   {
      
      public static const IMAGE_CHANGE:String = "imageChange";
      
      public static const IMAGE_MOVE:String = "imageMove";
      
      public static const IMAGE_SCALE:String = "imageScale";
      
      public static const IMAGE_ROTATE:String = "imageRotate";
      
      public static const FRAME_RESIZE:String = "frameResize";
      
      public static const EDIT_MODE_START:String = "editModeStart";
      
      public static const EDIT_MODE_COMPLETE:String = "editModeComplete";
      
      public static const FIT_MODE_CHANGE:String = "fitModeChange";
      
      public static const FLOWFRAME_CLICKED:String = "flowFrameClicked";
       
      
      public function FlowFrameEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
