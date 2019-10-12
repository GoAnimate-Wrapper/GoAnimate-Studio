package anifire.studio.events
{
   import anifire.studio.models.TextComponentThumb;
   import flash.events.Event;
   
   public class TextComponentEvent extends Event
   {
      
      public static const TEXT_COMPONENT_DELETED:String = "textComponentDeleted";
       
      
      public var thumb:TextComponentThumb;
      
      public function TextComponentEvent(param1:String, param2:TextComponentThumb, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.thumb = param2;
      }
   }
}
