package anifire.bubble
{
   import flash.events.Event;
   
   public class BubbleEvent extends Event
   {
      
      public static const TEXT_TYPING:String = "textTyping";
      
      public static const TEXT_CHANGED:String = "textChanged";
      
      public static const TEXT_SIZE_CHANGED:String = "TEXT_SIZE_CHANGED";
      
      public static const BUBBLE_SIZE_CHANGED:String = "BUBBLE_SIZE_CHANGED";
      
      public static const TEXT_INPUT_NOT_SUPPORTED:String = "textInputNotSupported";
      
      public static const TEXT_FOCUS_IN:String = "textFocusIn";
      
      public static const TEXT_FOCUS_OUT:String = "textFocusOut";
       
      
      public var textInput:String;
      
      public function BubbleEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
