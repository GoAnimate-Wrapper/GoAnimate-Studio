package anifire.studio.models.tutorial
{
   public class InfographicsTutorial extends SceneTemplateTutorial
   {
       
      
      public function InfographicsTutorial()
      {
         super();
      }
      
      override protected function createTutorial() : void
      {
         var _loc1_:TutorialStepModel = null;
         tutorialId = "scene_template";
         totalUserStep = 14;
         enableTracking = true;
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = STEP_ID_SHOW_TUTORIAL_BACKGROUND;
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = EXPECTED_ACTION_SHOW_TUTORIAL_BACKGROUND;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "find_bubble";
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = "find_bubble";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.isPreparation = true;
         _loc1_.flagName = "bubble_not_found";
         _loc1_.destStepId = "find_scene1";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "select_bubble";
         _loc1_.message = "Double click the placeholder and give your video an opening title.";
         _loc1_.componentId = "tutorial_bubble";
         _loc1_.expectedAction = "tutorial_bubble_updated";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.waitForNext = true;
         _loc1_.offsetY = 20;
         _loc1_.userStepIndex = 1;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "find_scene1";
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = "find_scene1";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "add_scene";
         _loc1_.message = "Click here to add a scene.";
         _loc1_.componentId = "timeline_add_scene";
         _loc1_.expectedAction = "scene_add";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 2;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "wait_add_scene";
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = "scene_editor_change";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = STEP_ID_SELECT_CATEGORY_DEFAULT;
         _loc1_.message = "Select a category.";
         _loc1_.componentId = "bg-cat";
         _loc1_.expectedAction = "prod-collection-selected";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 3;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "add_a_template";
         _loc1_.message = "Select a template to put it on the timeline.";
         _loc1_.componentId = "categorized-template-selection";
         _loc1_.expectedAction = "scene_editor_change";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 4;
         _loc1_.waitForNext = true;
         steps.push(_loc1_);
         quickStartIndex = steps.length;
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "find_scene2";
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = "find_scene2";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "add_scene";
         _loc1_.message = "Let’s add a third scene.";
         _loc1_.componentId = "timeline_add_scene";
         _loc1_.expectedAction = "scene_add";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 10;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "wait_add_scene";
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = "scene_editor_change";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = STEP_ID_SELECT_CATEGORY;
         _loc1_.message = "Select a category.";
         _loc1_.componentId = "bg-cat";
         _loc1_.expectedAction = "prod-collection-selected";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 11;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "add_a_template";
         _loc1_.message = "Click on a template to put it on the timeline.";
         _loc1_.componentId = "categorized-template-selection";
         _loc1_.expectedAction = "add_com_bg";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 12;
         _loc1_.waitForNext = true;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "select_sound_tab";
         _loc1_.message = "Click on the “Sound” tab.";
         _loc1_.componentId = "theme_sound_tab";
         _loc1_.expectedAction = "theme_sound_panel_select";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 13;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "prepare_sound";
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = "sound_prepared";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "add_sound";
         _loc1_.message = "Browse and select a song.";
         _loc1_.componentId = COMPONENT_ID_SOUND_EXPLORER_PRODUCT_LIST;
         _loc1_.expectedAction = "add_sound";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 14;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "preview";
         _loc1_.title = "Congratulations!";
         _loc1_.message = "Those are the basics! Use the “Preview” button to view your video.\nLearn more at our Help Center.";
         _loc1_.expectedAction = "toolbar_preview";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_STUDIO_CENTER;
         _loc1_.proceedButtonText = "Preview Video";
         _loc1_.helpText = "You can restart the tutorial using the menu in the top right.";
         _loc1_.userStepIndex = TutorialStepModel.STEP_INDEX_LAST;
         steps.push(_loc1_);
      }
   }
}
