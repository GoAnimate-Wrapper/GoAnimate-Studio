package anifire.studio.models.tutorial
{
   public class TutorialModel
   {
       
      
      public var tutorialId:String;
      
      protected var steps:Vector.<TutorialStepModel>;
      
      public var currentStep:TutorialStepModel;
      
      public var totalUserStep:int;
      
      public var nextStepIndex:int;
      
      public var presetFlags:Array;
      
      public var quickStartIndex:int;
      
      public var enableTracking:Boolean;
      
      public function TutorialModel()
      {
         this.presetFlags = [];
         super();
         this.steps = new Vector.<TutorialStepModel>();
         this.nextStepIndex = 0;
         this.createTutorial();
      }
      
      public function nextStep() : TutorialStepModel
      {
         if(this.nextStepIndex >= this.steps.length)
         {
            return null;
         }
         this.currentStep = this.steps[this.nextStepIndex++];
         return this.currentStep;
      }
      
      public function jumpToStep(param1:String) : TutorialStepModel
      {
         var _loc3_:TutorialStepModel = null;
         var _loc2_:int = this.steps.length;
         var _loc4_:int = this.nextStepIndex;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.steps[_loc4_];
            if(_loc3_.stepId == param1)
            {
               this.nextStepIndex = _loc4_ + 1;
               this.currentStep = _loc3_;
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      protected function createTutorial() : void
      {
      }
      
      public function reset() : void
      {
         this.nextStepIndex = 0;
      }
   }
}
