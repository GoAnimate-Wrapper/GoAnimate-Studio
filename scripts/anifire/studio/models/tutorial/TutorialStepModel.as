package anifire.studio.models.tutorial
{
   public class TutorialStepModel
   {
      
      public static const INFO_PLACEMENT_STUDIO_CENTER:String = "studioCenter";
      
      public static const INFO_PLACEMENT_STAGE_CENTER:String = "stageCenter";
      
      public static const INFO_PLACEMENT_COMP_LEFT:String = "compLeft";
      
      public static const INFO_PLACEMENT_COMP_RIGHT:String = "compRight";
      
      public static const INFO_PLACEMENT_COMP_BOTTOM:String = "compBottom";
      
      public static const INFO_PLACEMENT_COMP_TOP:String = "compTop";
      
      public static const INFO_PLACEMENT_COMP_RIGHT_STUDIO_TOP:String = "compRightStudioTop";
      
      public static const EXPECT_TUTORIAL_NEXT:String = "tutorial_next";
      
      public static const CONDITION_TRUE:String = "true";
      
      public static const STEP_INDEX_HIDDEN:int = 0;
      
      public static const STEP_INDEX_FIRST:int = -1;
      
      public static const STEP_INDEX_LAST:int = -2;
      
      public static const STEP_INDEX_SKIPPED:int = -3;
       
      
      public var title:String;
      
      public var message:String;
      
      public var helpText:String;
      
      public var readyMessage:String;
      
      public var componentId:String;
      
      public var highlightComponents:Array;
      
      public var expectedAction:String;
      
      public var stepId:String;
      
      public var isPreparation:Boolean;
      
      public var allowDragForwarding:Boolean;
      
      public var proceedButtonText:String;
      
      public var nextButtonVisible:Boolean;
      
      public var arrowVisible:Boolean;
      
      public var waitForNext:Boolean;
      
      public var infoPosition:String;
      
      public var offsetX:Number = 0;
      
      public var offsetY:Number = 0;
      
      public var userStepIndex:int = 0;
      
      public var flagName:String;
      
      public var destStepId:String;
      
      public function TutorialStepModel()
      {
         super();
         this.infoPosition = INFO_PLACEMENT_STUDIO_CENTER;
      }
   }
}
