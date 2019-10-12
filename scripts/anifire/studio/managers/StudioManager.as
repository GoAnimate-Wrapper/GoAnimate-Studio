package anifire.studio.managers
{
   import anifire.event.StudioEvent;
   import anifire.studio.commands.CommandStack;
   import anifire.studio.core.Console;
   import anifire.util.UtilErrorLogger;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class StudioManager extends EventDispatcher
   {
      
      private static var __instance:StudioManager;
       
      
      public function StudioManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function get instance() : StudioManager
      {
         if(!__instance)
         {
            __instance = new StudioManager();
         }
         return __instance;
      }
      
      public function undo(param1:Boolean = true) : void
      {
         var redoable:Boolean = param1;
         try
         {
            CommandStack.getInstance().undo(redoable);
            Console.getConsole().refreshAllSpeechText();
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("StudioManager:undo",e);
            return;
         }
      }
      
      public function redo() : void
      {
         try
         {
            CommandStack.getInstance().redo();
            Console.getConsole().refreshAllSpeechText();
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("StudioManager:redo",e);
            return;
         }
      }
      
      public function closeSuggestionPopUp() : void
      {
         dispatchEvent(new StudioEvent(StudioEvent.CLOSE_SUGGESTION_POP_UP));
      }
   }
}
