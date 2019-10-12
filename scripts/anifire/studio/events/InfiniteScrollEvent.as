package anifire.studio.events
{
   import flash.events.Event;
   
   public class InfiniteScrollEvent extends Event
   {
      
      public static const INFINITE_SCROLL:String = "infiniteScroll";
       
      
      public function InfiniteScrollEvent()
      {
         super(INFINITE_SCROLL);
      }
   }
}
