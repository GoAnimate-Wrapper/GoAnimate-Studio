package anifire.studio.events
{
   import flash.events.Event;
   
   public class StageControlEvent extends Event
   {
      
      public static const UPDATE_ZOOM:String = "updateZoom";
      
      public static const FIT_TO_STAGE:String = "fitToStage";
      
      public static const STAGE_ZOOM_UPDATE:String = "stageZoomUpdate";
      
      public static const STAGE_RESIZE:String = "stageResize";
      
      public static const ASSET_DRAG_START:String = "assetDragStart";
      
      public static const ASSET_DRAG_COMPLETE:String = "assetDragComplete";
       
      
      public var zoomValue:Number;
      
      public function StageControlEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
