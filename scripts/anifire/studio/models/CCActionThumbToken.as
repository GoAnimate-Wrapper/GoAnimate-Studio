package anifire.studio.models
{
   import anifire.component.CCActionThumb;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class CCActionThumbToken extends EventDispatcher
   {
      
      public static const TOKEN_QUEUED:int = 0;
      
      public static const TOKEN_LOADING:int = 1;
      
      public static const TOKEN_PROCESSING:int = 2;
      
      public static const TOKEN_FINISHED:int = 3;
      
      public static const TOKEN_CANCELLED:int = 4;
       
      
      private var _actionThumb:CCActionThumb;
      
      public var model:ActionThumbModel;
      
      public var state:int;
      
      public function CCActionThumbToken(param1:ActionThumbModel)
      {
         super();
         this.state = 0;
         this.model = param1;
      }
      
      public function get actionThumb() : CCActionThumb
      {
         return this._actionThumb;
      }
      
      public function set actionThumb(param1:CCActionThumb) : void
      {
         this._actionThumb = param1;
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
