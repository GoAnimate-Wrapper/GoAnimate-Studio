package anifire.studio.components
{
   import flash.events.Event;
   
   public class NavigatorContent extends spark.components.NavigatorContent
   {
       
      
      protected var _notificationCount:int;
      
      public function NavigatorContent()
      {
         super();
      }
      
      [Bindable(event="notificationChange")]
      public function get notificationCount() : int
      {
         return this._notificationCount;
      }
      
      public function set notificationCount(param1:int) : void
      {
         if(param1 > 99)
         {
            param1 = 99;
         }
         this._notificationCount = param1;
         dispatchEvent(new Event("notificationChange"));
      }
      
      public function addNotification() : void
      {
         this.notificationCount++;
      }
      
      public function clearNotification() : void
      {
         this.notificationCount = 0;
      }
   }
}
