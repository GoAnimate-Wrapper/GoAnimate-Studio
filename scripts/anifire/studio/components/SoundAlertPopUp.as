package anifire.studio.components
{
   import anifire.studio.managers.StudioStatusManager;
   import flash.display.DisplayObjectContainer;
   
   public class SoundAlertPopUp extends AlertPopUp
   {
       
      
      public function SoundAlertPopUp()
      {
         super();
      }
      
      override public function open(param1:DisplayObjectContainer, param2:Boolean = false) : void
      {
         super.open(param1,param2);
         StudioStatusManager.instance.increaseSoundAlertCounter();
      }
      
      override public function close(param1:Boolean = false, param2:* = null) : void
      {
         super.close(param1,param2);
         StudioStatusManager.instance.decreaseSoundAlertCounter();
      }
   }
}
