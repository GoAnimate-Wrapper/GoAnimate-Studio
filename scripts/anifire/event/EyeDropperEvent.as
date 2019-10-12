package anifire.event
{
   import flash.events.Event;
   
   public class EyeDropperEvent extends Event
   {
      
      public static const EYE_DROPPER_ACTIVATE:String = "eyeDropperActivate";
      
      public static const EYE_DROPPER_COMPLETE:String = "eyeDropperComplete";
      
      public static const EYE_DROPPER_CANCEL:String = "eyeDropperCancel";
       
      
      public var color:uint;
      
      public function EyeDropperEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:EyeDropperEvent = new EyeDropperEvent(type,bubbles,cancelable);
         _loc1_.color = this.color;
         return _loc1_;
      }
   }
}
