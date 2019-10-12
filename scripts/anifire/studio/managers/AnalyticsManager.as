package anifire.studio.managers
{
   import anifire.managers.AppConfigManager;
   import anifire.studio.models.tutorial.TutorialStepModel;
   import anifire.util.UtilUser;
   import flash.external.ExternalInterface;
   
   public class AnalyticsManager
   {
      
      public static const EVENT_CATEGORY_ASSET_SEARCH:String = "Studio - Tray";
      
      public static const EVENT_CATEGORY_TUTORIAL:String = "InteractiveTutorial";
      
      public static const EVENT_ACTION_PREFIX_SEARCH_LIST:String = "Search List ";
      
      public static const EVENT_ACTION_PREFIX_SEARCH_TEXT:String = "Search Text ";
      
      public static const EVENT_ACTION_TERM_HIT:String = "Term Hit";
      
      public static const EVENT_ACTION_TERM_MISS:String = "Term Miss";
      
      public static const EVENT_ACTION_TUTORIAL_START:String = "Start";
      
      public static const EVENT_ACTION_TUTORIAL_START_STEP:String = "StartStep";
      
      public static const EVENT_ACTION_TUTORIAL_SPECIAL_STEP_SUFFIX:String = "b";
      
      public static const EVENT_ACTION_TUTORIAL_SKIP:String = "Skip";
      
      public static const EVENT_ACTION_TUTORIAL_COMPLETE:String = "Complete";
      
      public static const EVENT_ACTION_SEARCH_PROP:String = "Search Prop";
      
      public static const EVENT_ACTION_SEARCH_CHARACTER:String = "Search Character";
      
      public static const EVENT_ACTION_SEARCH_SOUND:String = "Search Sound";
      
      private static var __instance:AnalyticsManager;
       
      
      private var _userPrefix:String;
      
      public function AnalyticsManager()
      {
         super();
         this.init();
      }
      
      public static function get instance() : AnalyticsManager
      {
         if(!__instance)
         {
            __instance = new AnalyticsManager();
         }
         return __instance;
      }
      
      private function init() : void
      {
         if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_TEAM_SHARING))
         {
            this._userPrefix = "Team";
         }
         else if(UtilUser.hasBusinessFeatures && !UtilUser.isFreeTrial)
         {
            this._userPrefix = "Biz";
         }
         else
         {
            this._userPrefix = "Free";
         }
      }
      
      public function trackEventByUserGroup(param1:String, param2:String = null, param3:String = null, param4:String = null) : void
      {
         var _loc5_:String = null;
         if(param3)
         {
            _loc5_ = "<" + this._userPrefix + "> " + param3;
         }
         else
         {
            _loc5_ = this._userPrefix;
         }
         this.trackEvent(_loc5_,param1,param2,param4);
      }
      
      public function trackEvent(param1:String, param2:String, param3:String = null, param4:String = null) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("gaClientTrack",param1,param2,param3,param4);
         }
      }
      
      public function trackTutorialEvent(param1:String, param2:String = null) : void
      {
         this.trackEvent(EVENT_CATEGORY_TUTORIAL,param1,param2);
      }
      
      public function trackTutorialStep(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:String = null;
         if(param1 == TutorialStepModel.STEP_INDEX_FIRST)
         {
            this.trackEvent(EVENT_CATEGORY_TUTORIAL,EVENT_ACTION_TUTORIAL_START,AppConfigManager.instance.getValue("userId"));
         }
         else if(param1 > 0)
         {
            _loc3_ = param1 + (!!param2?EVENT_ACTION_TUTORIAL_SPECIAL_STEP_SUFFIX:"");
            this.trackEvent(EVENT_CATEGORY_TUTORIAL,EVENT_ACTION_TUTORIAL_START_STEP + _loc3_);
         }
      }
      
      public function trackAssetSearchEvent(param1:String, param2:String, param3:Boolean = false) : void
      {
         var _loc4_:String = (!!param3?EVENT_ACTION_PREFIX_SEARCH_LIST:EVENT_ACTION_PREFIX_SEARCH_TEXT) + param1;
         this.trackEventByUserGroup(_loc4_,param2,EVENT_CATEGORY_ASSET_SEARCH);
      }
      
      public function trackSearchControlTerm(param1:String, param2:Boolean) : void
      {
         this.trackEventByUserGroup(!!param2?EVENT_ACTION_TERM_HIT:EVENT_ACTION_TERM_MISS,param1,EVENT_CATEGORY_ASSET_SEARCH);
      }
   }
}
