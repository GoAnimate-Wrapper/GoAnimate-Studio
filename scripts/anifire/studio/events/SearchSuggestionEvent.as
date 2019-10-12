package anifire.studio.events
{
   import flash.events.Event;
   
   public class SearchSuggestionEvent extends Event
   {
      
      public static const LEAVE:String = "leave";
      
      public static const SEARCH:String = "search";
       
      
      public var keyword:String;
      
      public function SearchSuggestionEvent(param1:String)
      {
         super(param1);
      }
   }
}
