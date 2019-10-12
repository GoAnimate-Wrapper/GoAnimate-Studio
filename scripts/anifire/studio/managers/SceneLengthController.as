package anifire.studio.managers
{
   import anifire.studio.components.Timeline;
   
   public class SceneLengthController
   {
      
      public static const FULL_AUTO:String = "full_auto";
      
      public static const ONLY_LENGTHEN:String = "lengthen";
      
      public static const FULL_MANUAL:String = "full_manual";
       
      
      private var _timelineControl:Timeline = null;
      
      private var _userPreference:String = "full_auto";
      
      public function SceneLengthController()
      {
         super();
      }
      
      public function get userPreference() : String
      {
         return this._userPreference;
      }
      
      public function set userPreference(param1:String) : void
      {
         this._userPreference = param1;
      }
      
      private function get timelineControl() : Timeline
      {
         return this._timelineControl;
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
         this._timelineControl = param1;
      }
      
      public function doChangeSceneLength(param1:Number, param2:int = -1, param3:Boolean = false) : void
      {
         this.timelineControl.updateSceneLength(param1,param2,param3);
      }
   }
}
