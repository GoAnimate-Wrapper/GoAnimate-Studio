package anifire.event
{
   import flash.events.Event;
   
   public class LoadEmbedMovieEvent extends Event
   {
      
      public static const COMPLETE_EVENT:String = "Complete";
      
      public static const MOVIE_FINISH_EVENT:String = "Finish";
      
      public static const RELOAD_MOVIE_EVENT:String = "Reload";
       
      
      public function LoadEmbedMovieEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
