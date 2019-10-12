package anifire.studio.events
{
   import anifire.event.ExtraDataEvent;
   import flash.geom.Point;
   
   public class SelectedAreaEvent extends ExtraDataEvent
   {
      
      public static const AREA_SELECTED:String = "area_selected";
       
      
      public var startPt:Point;
      
      public var endPt:Point;
      
      public function SelectedAreaEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
