package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.managers.ExternalLinkManager;
   import anifire.studio.commands.CommandStack;
   import anifire.studio.core.Console;
   import anifire.studio.events.MenuItemEvent;
   import anifire.studio.events.SelectedAreaEvent;
   import anifire.studio.managers.StudioManager;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.skins.TopToolBarButtonSkin;
   import anifire.studio.utils.AssetSnapTool;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import com.adobe.images.JPGEncoder;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.net.FileReference;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.managers.PopUpManager;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class GoToolBar extends Group implements IBindingClient
   {
      
      private static const SAVE_STARTER_SCENE:String = "starterScene";
      
      private static const SAVE_STARTER_MOVIE:String = "starterMovie";
      
      private static const SAVE_TEXT_COMPONENT:String = "saveTextComponent";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _GoToolBar_Group3:Group;
      
      private var _1781625235buttonGroup:HGroup;
      
      private var _1397778681copyButton:IconButton;
      
      private var _335348240exitButton:IconButton;
      
      private var _253520497extraMenu:MenuItemList;
      
      private var _2130837921extraMenuButton:IconButton;
      
      private var _1233089485extraMenuDisplay:PopUpAnchor;
      
      private var _1228621915pasteButton:IconButton;
      
      private var _122158822previewButton:Button;
      
      private var _1120171728redoButton:IconButton;
      
      private var _584254223saveButton:Button;
      
      private var _1443410230undoButton:IconButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _copyEnabled:Boolean;
      
      protected var _tutorialManager:TutorialManager;
      
      protected var _console:Console;
      
      private var _1552725268_showExitButton:Boolean;
      
      protected var _pasteEnabled:Boolean;
      
      protected var _commandStack:CommandStack;
      
      protected var _logWindow:LogWindow;
      
      protected var qualitySubItems:ArrayCollection;
      
      protected var tutorialSubItems:ArrayCollection;
      
      protected var snapObjectsItem:MenuItemModel;
      
      protected var snapCameraItem:MenuItemModel;
      
      protected var referencePointItem:MenuItemModel;
      
      protected var workNoteSidebarItem:MenuItemModel;
      
      private var _embed_mxml__styles_images_toolbar_main_undo_disable_png_1777962859:Class;
      
      private var _embed_mxml__styles_images_toolbar_main_redo_disable_png_1026457833:Class;
      
      private var _embed_mxml__styles_images_toolbar_main_paste_enable_png_1627225975:Class;
      
      private var _embed_mxml__styles_images_toolbar_main_undo_enable_png_1535614633:Class;
      
      private var _embed_mxml__styles_images_toolbar_main_copy_disable_png_1509801751:Class;
      
      private var _embed_mxml__styles_images_toolbar_top_settings_png_1456650295:Class;
      
      private var _embed_mxml__styles_images_toolbar_main_paste_disable_png_818353749:Class;
      
      private var _embed_mxml__styles_images_stage_preview_icon_png_468634825:Class;
      
      private var _embed_mxml__styles_images_toolbar_top_exit_png_1324951753:Class;
      
      private var _embed_mxml__styles_images_toolbar_main_redo_enable_png_1501854693:Class;
      
      private var _embed_mxml__styles_images_toolbar_main_copy_enable_png_1166821205:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function GoToolBar()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._tutorialManager = TutorialManager.instance;
         this._embed_mxml__styles_images_toolbar_main_undo_disable_png_1777962859 = GoToolBar__embed_mxml__styles_images_toolbar_main_undo_disable_png_1777962859;
         this._embed_mxml__styles_images_toolbar_main_redo_disable_png_1026457833 = GoToolBar__embed_mxml__styles_images_toolbar_main_redo_disable_png_1026457833;
         this._embed_mxml__styles_images_toolbar_main_paste_enable_png_1627225975 = GoToolBar__embed_mxml__styles_images_toolbar_main_paste_enable_png_1627225975;
         this._embed_mxml__styles_images_toolbar_main_undo_enable_png_1535614633 = GoToolBar__embed_mxml__styles_images_toolbar_main_undo_enable_png_1535614633;
         this._embed_mxml__styles_images_toolbar_main_copy_disable_png_1509801751 = GoToolBar__embed_mxml__styles_images_toolbar_main_copy_disable_png_1509801751;
         this._embed_mxml__styles_images_toolbar_top_settings_png_1456650295 = GoToolBar__embed_mxml__styles_images_toolbar_top_settings_png_1456650295;
         this._embed_mxml__styles_images_toolbar_main_paste_disable_png_818353749 = GoToolBar__embed_mxml__styles_images_toolbar_main_paste_disable_png_818353749;
         this._embed_mxml__styles_images_stage_preview_icon_png_468634825 = GoToolBar__embed_mxml__styles_images_stage_preview_icon_png_468634825;
         this._embed_mxml__styles_images_toolbar_top_exit_png_1324951753 = GoToolBar__embed_mxml__styles_images_toolbar_top_exit_png_1324951753;
         this._embed_mxml__styles_images_toolbar_main_redo_enable_png_1501854693 = GoToolBar__embed_mxml__styles_images_toolbar_main_redo_enable_png_1501854693;
         this._embed_mxml__styles_images_toolbar_main_copy_enable_png_1166821205 = GoToolBar__embed_mxml__styles_images_toolbar_main_copy_enable_png_1166821205;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._GoToolBar_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_GoToolBarWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return GoToolBar[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._GoToolBar_Rect1_c(),this._GoToolBar_HGroup1_c(),this._GoToolBar_HGroup2_i()];
         this.addEventListener("creationComplete",this.___GoToolBar_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         GoToolBar._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      [Bindable(event="propertyChange")]
      public function get copyEnabled() : Boolean
      {
         return this._copyEnabled;
      }
      
      private function set _2062554636copyEnabled(param1:Boolean) : void
      {
         this._copyEnabled = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get pasteEnabled() : Boolean
      {
         return this._pasteEnabled;
      }
      
      private function set _1283520210pasteEnabled(param1:Boolean) : void
      {
         this._pasteEnabled = param1;
      }
      
      private function onCreationComplete() : void
      {
         this._console = Console.getConsole();
         this.createMenuModel();
         this._commandStack = CommandStack.getInstance();
         this._commandStack.addEventListener(Event.CHANGE,this.onCommandStackChange);
         this._tutorialManager.registerComponent("toolbar_preview",this.previewButton);
         this._tutorialManager.registerComponent("toolbar_menu",this.extraMenuButton);
         this._showExitButton = ServerConstants.IS_WIX;
      }
      
      private function onCommandStackChange(param1:Event) : void
      {
         this.undoButton.enabled = this._commandStack.index > 0;
         this.redoButton.enabled = this._commandStack.index < this._commandStack.size;
      }
      
      private function showDebugWindow() : void
      {
         this._logWindow = new LogWindow();
         this._logWindow.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
         PopUpManager.centerPopUp(this._logWindow);
      }
      
      protected function createMenuModel() : void
      {
         var _loc4_:ArrayCollection = null;
         var _loc5_:MenuItemModel = null;
         var _loc6_:MenuItemModel = null;
         var _loc7_:ArrayCollection = null;
         var _loc8_:MenuItemModel = null;
         var _loc9_:ArrayCollection = null;
         var _loc10_:MenuItemModel = null;
         var _loc11_:MenuItemModel = null;
         var _loc1_:ArrayCollection = new ArrayCollection();
         var _loc2_:MenuItemModel = new MenuItemModel(UtilDict.translate("topbtnbar_screenshot"),"screenshot");
         _loc1_.addItem(_loc2_);
         this.qualitySubItems = new ArrayCollection();
         this.qualitySubItems.addItem(new MenuItemModel(UtilDict.translate("Low"),StageQuality.LOW,MenuItemModel.MENU_TYPE_RADIO));
         this.qualitySubItems.addItem(new MenuItemModel(UtilDict.translate("Medium"),StageQuality.MEDIUM,MenuItemModel.MENU_TYPE_RADIO));
         this.qualitySubItems.addItem(new MenuItemModel(UtilDict.translate("High"),StageQuality.HIGH,MenuItemModel.MENU_TYPE_RADIO));
         this.qualitySubItems.addItem(new MenuItemModel(UtilDict.translate("Best"),StageQuality.BEST,MenuItemModel.MENU_TYPE_RADIO));
         var _loc3_:MenuItemModel = new MenuItemModel(UtilDict.translate("Quality"),null,MenuItemModel.MENU_TYPE_NORMAL,this.qualitySubItems);
         _loc1_.addItem(_loc3_);
         if(UtilUser.hasPlusFeatures() && !UtilUser.isTrialAccount)
         {
            _loc4_ = new ArrayCollection();
            _loc4_.addItem(new MenuItemModel(UtilDict.translate("Current Scene"),SAVE_STARTER_SCENE));
            _loc4_.addItem(new MenuItemModel(UtilDict.toDisplay("go","Whole Video"),SAVE_STARTER_MOVIE));
            _loc5_ = new MenuItemModel(UtilDict.toDisplay("go","Save As Starter"),null,MenuItemModel.MENU_TYPE_NORMAL,_loc4_);
            _loc1_.addItem(_loc5_);
         }
         if(UtilUser.isContentAdmin)
         {
            _loc6_ = new MenuItemModel(UtilDict.translate("Save As Text Component"),SAVE_TEXT_COMPONENT);
            _loc1_.addItem(_loc6_);
         }
         if(UtilUser.hasBusinessFeatures)
         {
            _loc7_ = new ArrayCollection();
            this.snapObjectsItem = new MenuItemModel(UtilDict.toDisplay("go","Snap to objects"),"snapObjects",MenuItemModel.MENU_TYPE_CHECKBOX);
            _loc7_.addItem(this.snapObjectsItem);
            this.snapCameraItem = new MenuItemModel(UtilDict.toDisplay("go","Snap to camera"),"snapCamera",MenuItemModel.MENU_TYPE_CHECKBOX);
            _loc7_.addItem(this.snapCameraItem);
            this.referencePointItem = new MenuItemModel(UtilDict.toDisplay("go","Reference Point"),"referencePoint",MenuItemModel.MENU_TYPE_CHECKBOX);
            _loc7_.addItem(this.referencePointItem);
            _loc8_ = new MenuItemModel(UtilDict.translate("Asset Handling"),null,MenuItemModel.MENU_TYPE_NORMAL,_loc7_);
            _loc1_.addItem(_loc8_);
         }
         if(this._console.hasCollaboration)
         {
            _loc9_ = new ArrayCollection();
            this.workNoteSidebarItem = new MenuItemModel(UtilDict.toDisplay("go","Show notes"),"showNotes",MenuItemModel.MENU_TYPE_CHECKBOX);
            this.workNoteSidebarItem.selected = this._console.workNoteSidebarVisible;
            _loc9_.addItem(this.workNoteSidebarItem);
            _loc10_ = new MenuItemModel(UtilDict.translate("Collaboration"),null,MenuItemModel.MENU_TYPE_NORMAL,_loc9_);
            _loc1_.addItem(_loc10_);
         }
         if(UtilSite.isDevelopmentSite || UtilUser.hasAdminFeatures)
         {
            _loc1_.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
            _loc11_ = new MenuItemModel(UtilDict.translate("Debug"),"debug");
            _loc1_.addItem(_loc11_);
         }
         _loc1_.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc1_.addItem(new MenuItemModel(UtilDict.translate("Interactive Tutorial"),"tutorial-restart"));
         _loc1_.addItem(new MenuItemModel(UtilDict.translate("Help Center"),"help-center"));
         this.extraMenu.dataProvider = _loc1_;
      }
      
      protected function updateStageQualitySelectedItem() : void
      {
         var _loc3_:MenuItemModel = null;
         var _loc4_:String = null;
         var _loc1_:String = this.stage.quality;
         _loc1_ = _loc1_.toLowerCase();
         var _loc2_:int = 0;
         while(_loc2_ < this.qualitySubItems.length)
         {
            _loc3_ = this.qualitySubItems.getItemAt(_loc2_) as MenuItemModel;
            _loc4_ = _loc3_.value;
            if(_loc4_.toLowerCase() == _loc1_)
            {
               _loc3_.selected = true;
               break;
            }
            _loc2_++;
         }
      }
      
      private function captureMainStage() : void
      {
         var _loc3_:DisplayObject = null;
         var _loc1_:MainStage = this._console.mainStage;
         var _loc2_:DisplayObject = _loc1_._stageArea;
         this._console.currentScene.selectedAsset = null;
         this._console.screenCapTool.addEventListener(SelectedAreaEvent.AREA_SELECTED,this.onSelectedCaptureArea);
         if(UtilUser.userType == UtilUser.ADMIN_USER)
         {
            _loc3_ = FlexGlobals.topLevelApplication as DisplayObject;
            this._console.screenCapTool.show(0,0,_loc3_.width,_loc3_.height);
         }
         else
         {
            this._console.screenCapTool.show(_loc1_.x + _loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
         }
      }
      
      private function onSelectedCaptureArea(param1:SelectedAreaEvent) : void
      {
         var _loc4_:BitmapData = null;
         var _loc11_:FileReference = null;
         var _loc12_:JPGEncoder = null;
         var _loc13_:ByteArray = null;
         var _loc14_:URLRequest = null;
         this._console.screenCapTool.removeEventListener(SelectedAreaEvent.AREA_SELECTED,this.onSelectedCaptureArea);
         var _loc2_:Point = param1.startPt;
         var _loc3_:Point = param1.endPt;
         var _loc5_:Matrix = new Matrix();
         var _loc6_:Number = 85;
         var _loc7_:Number = 2;
         if(UtilUser.userType == UtilUser.ADMIN_USER)
         {
            _loc6_ = 95;
         }
         var _loc8_:Number = Math.abs(_loc3_.x - _loc2_.x);
         var _loc9_:Number = Math.abs(_loc3_.y - _loc2_.y);
         if(_loc8_ == 0 || _loc9_ == 0)
         {
            return;
         }
         var _loc10_:String = this.stage.quality;
         if(_loc8_ * _loc9_ < 100)
         {
            if(AnimeConstants.SCREEN_WIDTH * _loc7_ <= 2880 && AnimeConstants.SCREEN_HEIGHT * _loc7_ <= 2880)
            {
               _loc4_ = new BitmapData(AnimeConstants.SCREEN_WIDTH * _loc7_,AnimeConstants.screenHeight * _loc7_);
               _loc5_.translate(-AnimeConstants.SCREEN_X,-AnimeConstants.screenY);
               _loc5_.scale(_loc7_,_loc7_);
               this.stage.quality = StageQuality.BEST;
               _loc4_.draw(this._console.mainStage.sceneEditor.view.view,_loc5_);
            }
         }
         else if(_loc8_ * _loc7_ <= 2880 && _loc9_ * _loc7_ <= 2880)
         {
            _loc4_ = new BitmapData(_loc8_ * _loc7_,_loc9_ * _loc7_);
            _loc5_.translate(-_loc2_.x + stage.x,-_loc2_.y + stage.y);
            _loc5_.scale(_loc7_,_loc7_);
            this.stage.quality = StageQuality.BEST;
            _loc4_.draw(stage,_loc5_);
         }
         this.stage.quality = _loc10_;
         if(_loc4_)
         {
            _loc11_ = new FileReference();
            _loc12_ = new JPGEncoder(_loc6_);
            _loc13_ = _loc12_.encode(_loc4_);
            if(UtilUser.hasBizFeatures)
            {
               _loc11_.save(_loc13_,"screen.jpg");
            }
            else
            {
               _loc14_ = UtilNetwork.getSaveJpegReuqest("screen.jpg",_loc13_);
               _loc11_.download(_loc14_);
            }
         }
      }
      
      private function onPreviewClick() : void
      {
         Console.getConsole().preview();
      }
      
      private function onSaveBtnClick() : void
      {
         Console.getConsole().showPublishWindow();
      }
      
      protected function getStudioPreferences() : SharedObject
      {
         var preferences:SharedObject = null;
         try
         {
            preferences = SharedObject.getLocal("studioPreferences");
         }
         catch(e:Error)
         {
            preferences = null;
            UtilErrorLogger.getInstance().appendCustomError("TopButtonBar: getStudioPreferences",e);
         }
         return preferences;
      }
      
      protected function onExitButtonClick(param1:MouseEvent) : void
      {
         if(ExternalInterface)
         {
            ExternalInterface.call("quitStudio");
         }
      }
      
      protected function onMenuItemClick(param1:MenuItemEvent) : void
      {
         var _loc2_:String = param1.item.value;
         var _loc3_:SharedObject = this.getStudioPreferences();
         switch(_loc2_)
         {
            case "screenshot":
               this.captureMainStage();
               break;
            case StageQuality.LOW:
            case StageQuality.MEDIUM:
            case StageQuality.HIGH:
            case StageQuality.BEST:
               this.stage.quality = _loc2_;
               if(_loc3_)
               {
                  _loc3_.data.stageQuality = _loc2_;
                  _loc3_.flush();
               }
               break;
            case SAVE_STARTER_SCENE:
               this._console.showSaveStarterWindow(false);
               break;
            case SAVE_STARTER_MOVIE:
               this._console.showSaveStarterWindow(true);
               break;
            case SAVE_TEXT_COMPONENT:
               this._console.showSaveTextComponentWindow();
               break;
            case "snapObjects":
               this._console.sceneEditor.snapTool.toggleSnapMode(_loc2_);
               break;
            case "snapCamera":
               this._console.sceneEditor.snapTool.toggleSnapMode(_loc2_);
               break;
            case "referencePoint":
               this._console.sceneEditor.toggleReferencePoint();
               if(_loc3_)
               {
                  _loc3_.data.showReferencePoint = this._console.sceneEditor.showReferencePoint;
                  _loc3_.flush();
               }
               break;
            case "showNotes":
               this._console.showWorkNoteSidebar(param1.item.selected);
               break;
            case "tutorial-hub":
               this.openTutorialHub();
               break;
            case "help-center":
               this.openHelpCenter();
               break;
            case "tutorial-restart":
               this.restartTutorial();
               break;
            case "debug":
               this.showDebugWindow();
         }
      }
      
      protected function displayMenu() : void
      {
         this.updateStageQualitySelectedItem();
         var _loc1_:AssetSnapTool = this._console.sceneEditor.snapTool;
         if(this.snapObjectsItem)
         {
            this.snapObjectsItem.selected = _loc1_.snapObjectsEnabled;
         }
         if(this.snapCameraItem)
         {
            this.snapCameraItem.selected = _loc1_.snapCameraEnabled;
         }
         if(this.referencePointItem)
         {
            this.referencePointItem.selected = this._console.sceneEditor.showReferencePoint;
         }
         this.extraMenuDisplay.displayPopUp = true;
      }
      
      protected function onExtraMenuButtonClick(param1:MouseEvent) : void
      {
         this.displayMenu();
      }
      
      public function updateAutoSaveToolTip(param1:String) : void
      {
         this.saveButton.toolTip = param1;
      }
      
      private function onCopyClick() : void
      {
         this.pasteEnabled = true;
         this._console.copyAsset();
      }
      
      private function openTutorialHub() : void
      {
         ExternalLinkManager.instance.navigate("http://ga.vyond.com/video-maker-tips/topic/tutorials/","wndtutorial");
      }
      
      private function openHelpCenter() : void
      {
         ExternalLinkManager.instance.navigate("https://support.vyond.com/","wndhc");
      }
      
      private function restartTutorial() : void
      {
         Console.getConsole().restartTutorial();
      }
      
      public function updateWorkNoteSidebarItem(param1:Boolean) : void
      {
         if(this.workNoteSidebarItem)
         {
            this.workNoteSidebarItem.selected = param1;
         }
      }
      
      private function _GoToolBar_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._GoToolBar_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _GoToolBar_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2570082;
         return _loc1_;
      }
      
      private function _GoToolBar_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = -1;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._GoToolBar_IconButton1_i(),this._GoToolBar_IconButton2_i(),this._GoToolBar_IconButton3_i(),this._GoToolBar_IconButton4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _GoToolBar_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",TopToolBarButtonSkin);
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_main_copy_enable_png_1166821205);
         _loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_toolbar_main_copy_disable_png_1509801751);
         _loc1_.addEventListener("click",this.__copyButton_click);
         _loc1_.id = "copyButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.copyButton = _loc1_;
         BindingManager.executeBindings(this,"copyButton",this.copyButton);
         return _loc1_;
      }
      
      public function __copyButton_click(param1:MouseEvent) : void
      {
         this.onCopyClick();
      }
      
      private function _GoToolBar_IconButton2_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",TopToolBarButtonSkin);
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_main_paste_enable_png_1627225975);
         _loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_toolbar_main_paste_disable_png_818353749);
         _loc1_.addEventListener("click",this.__pasteButton_click);
         _loc1_.id = "pasteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pasteButton = _loc1_;
         BindingManager.executeBindings(this,"pasteButton",this.pasteButton);
         return _loc1_;
      }
      
      public function __pasteButton_click(param1:MouseEvent) : void
      {
         this._console.pasteAsset();
      }
      
      private function _GoToolBar_IconButton3_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = false;
         _loc1_.setStyle("skinClass",TopToolBarButtonSkin);
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_main_undo_enable_png_1535614633);
         _loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_toolbar_main_undo_disable_png_1777962859);
         _loc1_.addEventListener("click",this.__undoButton_click);
         _loc1_.id = "undoButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.undoButton = _loc1_;
         BindingManager.executeBindings(this,"undoButton",this.undoButton);
         return _loc1_;
      }
      
      public function __undoButton_click(param1:MouseEvent) : void
      {
         StudioManager.instance.undo();
      }
      
      private function _GoToolBar_IconButton4_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.enabled = false;
         _loc1_.setStyle("skinClass",TopToolBarButtonSkin);
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_main_redo_enable_png_1501854693);
         _loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_toolbar_main_redo_disable_png_1026457833);
         _loc1_.addEventListener("click",this.__redoButton_click);
         _loc1_.id = "redoButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.redoButton = _loc1_;
         BindingManager.executeBindings(this,"redoButton",this.redoButton);
         return _loc1_;
      }
      
      public function __redoButton_click(param1:MouseEvent) : void
      {
         StudioManager.instance.redo();
      }
      
      private function _GoToolBar_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 0;
         _loc1_.paddingRight = 5;
         _loc1_.mxmlContent = [this._GoToolBar_HGroup3_c(),this._GoToolBar_Line1_c(),this._GoToolBar_Group2_c(),this._GoToolBar_Group3_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _GoToolBar_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 10;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.mxmlContent = [this._GoToolBar_Button1_i(),this._GoToolBar_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _GoToolBar_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_stage_preview_icon_png_468634825);
         _loc1_.addEventListener("click",this.__previewButton_click);
         _loc1_.id = "previewButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewButton = _loc1_;
         BindingManager.executeBindings(this,"previewButton",this.previewButton);
         return _loc1_;
      }
      
      public function __previewButton_click(param1:MouseEvent) : void
      {
         this.onPreviewClick();
      }
      
      private function _GoToolBar_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__saveButton_click);
         _loc1_.id = "saveButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.saveButton = _loc1_;
         BindingManager.executeBindings(this,"saveButton",this.saveButton);
         return _loc1_;
      }
      
      public function __saveButton_click(param1:MouseEvent) : void
      {
         this.onSaveBtnClick();
      }
      
      private function _GoToolBar_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._GoToolBar_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _GoToolBar_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3558527;
         return _loc1_;
      }
      
      private function _GoToolBar_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._GoToolBar_IconButton5_i(),this._GoToolBar_PopUpAnchor1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _GoToolBar_IconButton5_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.width = 50;
         _loc1_.percentHeight = 100;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_top_settings_png_1456650295);
         _loc1_.addEventListener("click",this.__extraMenuButton_click);
         _loc1_.id = "extraMenuButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.extraMenuButton = _loc1_;
         BindingManager.executeBindings(this,"extraMenuButton",this.extraMenuButton);
         return _loc1_;
      }
      
      public function __extraMenuButton_click(param1:MouseEvent) : void
      {
         this.onExtraMenuButtonClick(param1);
      }
      
      private function _GoToolBar_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = -2;
         _loc1_.popUpPosition = "belowRight";
         _loc1_.popUp = this._GoToolBar_MenuItemList1_i();
         _loc1_.id = "extraMenuDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.extraMenuDisplay = _loc1_;
         BindingManager.executeBindings(this,"extraMenuDisplay",this.extraMenuDisplay);
         return _loc1_;
      }
      
      private function _GoToolBar_MenuItemList1_i() : MenuItemList
      {
         var _loc1_:MenuItemList = new MenuItemList();
         _loc1_.addEventListener("itemClick",this.__extraMenu_itemClick);
         _loc1_.id = "extraMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.extraMenu = _loc1_;
         BindingManager.executeBindings(this,"extraMenu",this.extraMenu);
         return _loc1_;
      }
      
      public function __extraMenu_itemClick(param1:MenuItemEvent) : void
      {
         this.onMenuItemClick(param1);
      }
      
      private function _GoToolBar_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._GoToolBar_HGroup4_c()];
         _loc1_.id = "_GoToolBar_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GoToolBar_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_GoToolBar_Group3",this._GoToolBar_Group3);
         return _loc1_;
      }
      
      private function _GoToolBar_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = -1;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._GoToolBar_Line2_c(),this._GoToolBar_IconButton6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _GoToolBar_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._GoToolBar_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _GoToolBar_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3558527;
         return _loc1_;
      }
      
      private function _GoToolBar_IconButton6_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.width = 50;
         _loc1_.percentHeight = 100;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_toolbar_top_exit_png_1324951753);
         _loc1_.setStyle("skinClass",TopToolBarButtonSkin);
         _loc1_.addEventListener("click",this.__exitButton_click);
         _loc1_.id = "exitButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.exitButton = _loc1_;
         BindingManager.executeBindings(this,"exitButton",this.exitButton);
         return _loc1_;
      }
      
      public function __exitButton_click(param1:MouseEvent) : void
      {
         this.onExitButtonClick(param1);
      }
      
      public function ___GoToolBar_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      private function _GoToolBar_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Copy");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"copyButton.label");
         result[1] = new Binding(this,null,null,"copyButton.enabled","copyEnabled");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Paste");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"pasteButton.label");
         result[3] = new Binding(this,null,null,"pasteButton.enabled","pasteEnabled");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Undo");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"undoButton.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Redo");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"redoButton.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Preview");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"previewButton.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Save");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"saveButton.label");
         result[8] = new Binding(this,function():Boolean
         {
            return _showExitButton;
         },null,"_GoToolBar_Group3.visible");
         result[9] = new Binding(this,function():Boolean
         {
            return _showExitButton;
         },null,"_GoToolBar_Group3.includeInLayout");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Exit");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"exitButton.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : HGroup
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1781625235buttonGroup;
         if(_loc2_ !== param1)
         {
            this._1781625235buttonGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get copyButton() : IconButton
      {
         return this._1397778681copyButton;
      }
      
      public function set copyButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1397778681copyButton;
         if(_loc2_ !== param1)
         {
            this._1397778681copyButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"copyButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get exitButton() : IconButton
      {
         return this._335348240exitButton;
      }
      
      public function set exitButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._335348240exitButton;
         if(_loc2_ !== param1)
         {
            this._335348240exitButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"exitButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraMenu() : MenuItemList
      {
         return this._253520497extraMenu;
      }
      
      public function set extraMenu(param1:MenuItemList) : void
      {
         var _loc2_:Object = this._253520497extraMenu;
         if(_loc2_ !== param1)
         {
            this._253520497extraMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraMenuButton() : IconButton
      {
         return this._2130837921extraMenuButton;
      }
      
      public function set extraMenuButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._2130837921extraMenuButton;
         if(_loc2_ !== param1)
         {
            this._2130837921extraMenuButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraMenuButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraMenuDisplay() : PopUpAnchor
      {
         return this._1233089485extraMenuDisplay;
      }
      
      public function set extraMenuDisplay(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1233089485extraMenuDisplay;
         if(_loc2_ !== param1)
         {
            this._1233089485extraMenuDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraMenuDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pasteButton() : IconButton
      {
         return this._1228621915pasteButton;
      }
      
      public function set pasteButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1228621915pasteButton;
         if(_loc2_ !== param1)
         {
            this._1228621915pasteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pasteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previewButton() : Button
      {
         return this._122158822previewButton;
      }
      
      public function set previewButton(param1:Button) : void
      {
         var _loc2_:Object = this._122158822previewButton;
         if(_loc2_ !== param1)
         {
            this._122158822previewButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get redoButton() : IconButton
      {
         return this._1120171728redoButton;
      }
      
      public function set redoButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1120171728redoButton;
         if(_loc2_ !== param1)
         {
            this._1120171728redoButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"redoButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get saveButton() : Button
      {
         return this._584254223saveButton;
      }
      
      public function set saveButton(param1:Button) : void
      {
         var _loc2_:Object = this._584254223saveButton;
         if(_loc2_ !== param1)
         {
            this._584254223saveButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"saveButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get undoButton() : IconButton
      {
         return this._1443410230undoButton;
      }
      
      public function set undoButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1443410230undoButton;
         if(_loc2_ !== param1)
         {
            this._1443410230undoButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"undoButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showExitButton() : Boolean
      {
         return this._1552725268_showExitButton;
      }
      
      private function set _showExitButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._1552725268_showExitButton;
         if(_loc2_ !== param1)
         {
            this._1552725268_showExitButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showExitButton",_loc2_,param1));
            }
         }
      }
      
      public function set copyEnabled(param1:Boolean) : void
      {
         var _loc2_:Object = this.copyEnabled;
         if(_loc2_ !== param1)
         {
            this._2062554636copyEnabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"copyEnabled",_loc2_,param1));
            }
         }
      }
      
      public function set pasteEnabled(param1:Boolean) : void
      {
         var _loc2_:Object = this.pasteEnabled;
         if(_loc2_ !== param1)
         {
            this._1283520210pasteEnabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pasteEnabled",_loc2_,param1));
            }
         }
      }
   }
}
