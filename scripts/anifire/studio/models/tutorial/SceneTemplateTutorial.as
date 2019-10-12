package anifire.studio.models.tutorial
{
   public class SceneTemplateTutorial extends TutorialModel
   {
      
      public static const COMPONENT_ID_BACKGROUND_EXPLORER_PRODUCT_LIST:String = "backgroundExplorerProductList";
      
      public static const COMPONENT_ID_SOUND_EXPLORER_PRODUCT_LIST:String = "soundExplorerProductList";
      
      public static const STEP_ID_SHOW_TUTORIAL_BACKGROUND:String = "show_tutorial_background";
      
      public static const EXPECTED_ACTION_SHOW_TUTORIAL_BACKGROUND:String = "tutorial_background_shown";
      
      public static var DEFAULT_SEARCH_KEYWORD:String = "point";
      
      public static const STEP_ID_SELECT_CATEGORY_DEFAULT:String = "select_category_default";
      
      public static const STEP_ID_SELECT_CATEGORY:String = "select_category";
       
      
      public function SceneTemplateTutorial()
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
         _loc1_.stepId = "find_up_most_char";
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = "found_up_most_char";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.isPreparation = true;
         _loc1_.flagName = "up_most_char_not_found";
         _loc1_.destStepId = "find_scene2";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "select_char2";
         _loc1_.message = "Nice! Let’s select the character.";
         _loc1_.componentId = "up_most_char";
         _loc1_.expectedAction = "tutorial_char_select";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.offsetY = 20;
         _loc1_.userStepIndex = 5;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "wait_tray_open";
         _loc1_.isPreparation = true;
         _loc1_.expectedAction = "tray_open";
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "search_action";
         _loc1_.message = "Characters can have hundreds of actions -- have your character drive a forklift, give an MRI, or even repair power lines. For now, we\'ll just make the character point at something.\n\nEnter “point” in the search field.";
         _loc1_.componentId = "action_explorer_search";
         _loc1_.expectedAction = "search_point_complete";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 6;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "search_sitting_action";
         _loc1_.message = "Select an action from the results.";
         _loc1_.componentId = "action_explorer_product_list";
         _loc1_.expectedAction = "action_update";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT_STUDIO_TOP;
         _loc1_.waitForNext = true;
         _loc1_.offsetY = 100;
         _loc1_.userStepIndex = 7;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "select_char_swap";
         _loc1_.message = "All characters and props can be swapped.\n\nClick on this ”swap” icon.";
         _loc1_.componentId = "swap-char-button";
         _loc1_.expectedAction = "swap-char";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT;
         _loc1_.userStepIndex = 8;
         steps.push(_loc1_);
         _loc1_ = new TutorialStepModel();
         _loc1_.stepId = "swap_char";
         _loc1_.message = "Browse and select a character from the left tray and see it update on the stage.";
         _loc1_.componentId = "swap-char-selection";
         _loc1_.expectedAction = "swap-char-complete";
         _loc1_.infoPosition = TutorialStepModel.INFO_PLACEMENT_COMP_RIGHT_STUDIO_TOP;
         _loc1_.waitForNext = true;
         _loc1_.offsetY = 100;
         _loc1_.userStepIndex = 9;
         steps.push(_loc1_);
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
