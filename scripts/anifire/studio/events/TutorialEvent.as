package anifire.studio.events
{
   import flash.events.Event;
   
   public class TutorialEvent extends Event
   {
      
      public static const TUTORIAL_START:String = "tutorialStart";
      
      public static const TUTORIAL_COMPLETE:String = "tutorialComplete";
      
      public static const TUTORIAL_STEP_START:String = "tutorialStepStart";
      
      public static const TUTORIAL_STEP_COMPLETE:String = "tutorialStepComplete";
      
      public static const TUTORIAL_SKIP:String = "tutorialSkip";
      
      public static const TUTORIAL_LAYER_REMOVE:String = "tutorialLayerRemove";
       
      
      protected var _tutorialId:String;
      
      protected var _data;
      
      public function TutorialEvent(param1:String, param2:String, param3:* = null)
      {
         super(param1);
         this._tutorialId = param2;
         this._data = param3;
      }
      
      public function get tutorialId() : String
      {
         return this._tutorialId;
      }
      
      public function get data() : *
      {
         return this._data;
      }
   }
}
