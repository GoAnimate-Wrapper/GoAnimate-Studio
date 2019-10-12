package anifire.studio.managers
{
   import anifire.constant.ThemeConstants;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.managers.ServerConnector;
   import anifire.studio.components.TutorialLayer;
   import anifire.studio.events.TutorialEvent;
   import anifire.studio.models.tutorial.BasicTutorial;
   import anifire.studio.models.tutorial.InfographicsTutorial;
   import anifire.studio.models.tutorial.SceneTemplateTutorial;
   import anifire.studio.models.tutorial.TutorialModel;
   import anifire.studio.models.tutorial.TutorialStepModel;
   import anifire.studio.models.tutorial.WithoutMotionTutorial;
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   import flash.external.ExternalInterface;
   import mx.core.UIComponent;
   
   public class TutorialManager extends EventDispatcher
   {
      
      public static const DEFAULT_TUTORIAL_ID:String = "basic";
      
      public static const STARTER_TUTORIAL_ID:String = "scene_template";
      
      public static const NO_MOTION_TUTORIAL_ID:String = "without_motion";
      
      public static const EVENT_STEP_START:String = "Step Start";
      
      public static const EVENT_START:String = "Start";
      
      public static const EVENT_COMPLETE:String = "Complete";
      
      public static const EVENT_SKIP:String = "Skip";
      
      protected static var __instance:TutorialManager;
       
      
      private var _serverConnector:ServerConnector;
      
      public var tutorialLayer:TutorialLayer;
      
      private var components:Object;
      
      private var _tutorialId:String;
      
      private var tutorials:Object;
      
      public var currentTutorial:TutorialModel;
      
      private var currentStep:TutorialStepModel;
      
      private var _expectedAction:String;
      
      private var _lastExpectedAction:String;
      
      private var _props:Object;
      
      public var shouldSkip:Boolean;
      
      private var _eventTracked:Boolean;
      
      public function TutorialManager()
      {
         super();
         this._serverConnector = ServerConnector.instance;
         this.shouldSkip = this._serverConnector.neverDisplayTutorial;
         this.components = {};
         this.tutorials = {};
      }
      
      public static function get instance() : TutorialManager
      {
         if(!__instance)
         {
            __instance = new TutorialManager();
         }
         return __instance;
      }
      
      private function createTutorialById(param1:String = "basic", param2:String = null) : void
      {
         switch(param1)
         {
            case DEFAULT_TUTORIAL_ID:
               this.tutorials[param1] = new BasicTutorial();
               break;
            case NO_MOTION_TUTORIAL_ID:
               this.tutorials[param1] = new WithoutMotionTutorial();
               break;
            case STARTER_TUTORIAL_ID:
               if(param2 == ThemeConstants.INFOGRAPHICS_THEME_ID)
               {
                  this.tutorials[param1] = new InfographicsTutorial();
               }
               else
               {
                  this.tutorials[param1] = new SceneTemplateTutorial();
               }
         }
      }
      
      public function registerComponent(param1:String, param2:DisplayObject) : void
      {
         this.components[param1] = param2;
      }
      
      public function getComponent(param1:String) : DisplayObject
      {
         return this.components[param1];
      }
      
      public function unregisterComponent(param1:String) : void
      {
         delete this.components[param1];
      }
      
      public function startTutorialByTheme(param1:String) : void
      {
         switch(param1)
         {
            case ThemeConstants.BUSINESS_THEME_ID:
            case ThemeConstants.WHITEBOARD_THEME_ID:
            case ThemeConstants.INFOGRAPHICS_THEME_ID:
               this.startTutorial(STARTER_TUTORIAL_ID,param1);
               break;
            case ThemeConstants.BIZ_MODEL_THEME_ID:
            case ThemeConstants.STICKLY_BIZ_THEME_ID:
               this.startTutorial(NO_MOTION_TUTORIAL_ID);
               break;
            default:
               this.startTutorial();
         }
      }
      
      private function startTutorial(param1:String = "basic", param2:String = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this._tutorialId)
         {
            this._tutorialId = param1;
            this.createTutorialById(this._tutorialId,param2);
            this.currentTutorial = this.tutorials[this._tutorialId];
            if(this.currentTutorial)
            {
               this.resetFlags();
               _loc3_ = this.currentTutorial.presetFlags.length;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  this.setFlag(this.currentTutorial.presetFlags[_loc4_]);
                  _loc4_++;
               }
               this.tutorialLayer.startTutorial();
               this.nextStep();
               dispatchEvent(new TutorialEvent(TutorialEvent.TUTORIAL_START,this._tutorialId));
            }
         }
      }
      
      public function nextStep() : Boolean
      {
         var _loc1_:UIComponent = null;
         this.currentStep = this.currentTutorial.nextStep();
         if(this.currentStep)
         {
            this._eventTracked = false;
            if(this.currentStep.flagName != null)
            {
               if(this.checkFlag(this.currentStep.flagName))
               {
                  this.currentStep = this.currentTutorial.jumpToStep(this.currentStep.destStepId);
               }
               else
               {
                  this.currentStep = this.currentTutorial.nextStep();
               }
            }
            this._expectedAction = this.currentStep.expectedAction;
            _loc1_ = !!this.currentStep.componentId?this.components[this.currentStep.componentId]:null;
            this.tutorialLayer.displayStep(this.currentStep,_loc1_);
            if(this.currentStep.stepId)
            {
               if(this.currentTutorial.enableTracking)
               {
                  AnalyticsManager.instance.trackTutorialStep(this.currentStep.userStepIndex);
               }
               dispatchEvent(new TutorialEvent(TutorialEvent.TUTORIAL_STEP_START,this._tutorialId,this.currentStep.stepId));
            }
            return true;
         }
         return false;
      }
      
      public function proceed() : void
      {
         this.notifyTutorialAction(this._expectedAction);
      }
      
      public function forbidTutorialAction(param1:String) : void
      {
         if(this.currentStep && this._expectedAction == TutorialStepModel.EXPECT_TUTORIAL_NEXT)
         {
            if(this._lastExpectedAction == param1)
            {
               this.tutorialLayer.disableNext();
               this._expectedAction = param1;
               this._lastExpectedAction = null;
            }
         }
      }
      
      public function notifyTutorialAction(param1:String) : void
      {
         var _loc2_:Boolean = false;
         if(this.currentStep && this._expectedAction == param1)
         {
            if(this.currentStep.waitForNext && this._expectedAction != TutorialStepModel.EXPECT_TUTORIAL_NEXT)
            {
               if(this.currentTutorial.enableTracking && !this._eventTracked)
               {
                  this._eventTracked = true;
                  AnalyticsManager.instance.trackTutorialStep(this.currentStep.userStepIndex,true);
               }
               this.tutorialLayer.allowNext();
               this._lastExpectedAction = this._expectedAction;
               this._expectedAction = TutorialStepModel.EXPECT_TUTORIAL_NEXT;
            }
            else
            {
               dispatchEvent(new TutorialEvent(TutorialEvent.TUTORIAL_STEP_COMPLETE,this._tutorialId,this.currentStep.stepId));
               _loc2_ = this.nextStep();
               if(!_loc2_)
               {
                  this.finishTutorial();
               }
            }
         }
      }
      
      public function finishTutorial(param1:Boolean = false) : void
      {
         var _loc2_:Object = null;
         if(param1)
         {
            dispatchEvent(new TutorialEvent(TutorialEvent.TUTORIAL_STEP_COMPLETE,this._tutorialId,this.currentStep.stepId));
            dispatchEvent(new TutorialEvent(TutorialEvent.TUTORIAL_SKIP,this._tutorialId,this.currentStep.stepId));
         }
         else
         {
            this.tutorialLayer.finishTutorial();
            dispatchEvent(new TutorialEvent(TutorialEvent.TUTORIAL_COMPLETE,this._tutorialId,param1));
         }
         if(this.currentTutorial.enableTracking)
         {
            AnalyticsManager.instance.trackTutorialEvent(!!param1?EVENT_SKIP:EVENT_COMPLETE);
            if(!param1 && ExternalInterface.available)
            {
               ExternalInterface.call("tutorialCompleted");
            }
         }
         var _loc3_:String = ThemeManager.instance.currentTheme.id;
         if(!param1)
         {
            _loc2_ = {"theme":_loc3_};
            AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_COMPLETED_TUTORIAL);
         }
         else
         {
            _loc2_ = {
               "step_number":this.currentStep.userStepIndex,
               "theme":_loc3_
            };
            AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_SKIP_TUTORIAL,_loc2_);
         }
         this._serverConnector.neverDisplayTutorial = true;
         this._tutorialId = null;
         this.currentTutorial = null;
         this.currentStep = null;
         this._expectedAction = null;
      }
      
      private function resetFlags() : void
      {
         this._props = {};
         this._props[TutorialStepModel.CONDITION_TRUE] = true;
      }
      
      public function setFlag(param1:String) : void
      {
         if(this._props)
         {
            this._props[param1] = true;
         }
      }
      
      public function unsetFlag(param1:String) : void
      {
         if(this._props)
         {
            this._props[param1] = false;
         }
      }
      
      private function checkFlag(param1:String) : Boolean
      {
         return this._props && this._props[param1];
      }
      
      public function get expectedAction() : String
      {
         return this._expectedAction;
      }
      
      public function handleTutorialLayerRemoval() : void
      {
         dispatchEvent(new TutorialEvent(TutorialEvent.TUTORIAL_LAYER_REMOVE,this._tutorialId));
      }
   }
}
