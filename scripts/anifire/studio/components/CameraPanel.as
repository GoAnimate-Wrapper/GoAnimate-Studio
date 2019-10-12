package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.LicenseConstants;
   import anifire.effect.ZoomEffect;
   import anifire.studio.commands.ChangeCameraTimingCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.RemoveCameraCommand;
   import anifire.studio.commands.ResizeCameraCompositionCommand;
   import anifire.studio.commands.SlideAssetCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.events.SceneOptionEvent;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.skins.OptionDropDownListSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilMath;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.controls.Spacer;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.FormHeading;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.Scroller;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.layouts.HorizontalLayout;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CameraPanel extends spark.components.NavigatorContent implements IBindingClient
   {
      
      private static const MENU_ITEM_ID_MATCH_STAGE:String = "matchStage";
      
      private static const MENU_ITEM_ID_MATCH_PREVIOUS:String = "matchPrevious";
      
      private static const MENU_ITEM_ID_MATCH_NEXT:String = "matchNext";
      
      private static const MENU_ITEM_ID_MATCH_START:String = "matchStart";
      
      private static const MENU_ITEM_ID_DELETE_CAMERA:String = "deleteCamera";
      
      private static const PIXEL_UNIT:String = "px";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CameraPanel_Button1:Button;
      
      public var _CameraPanel_Button2:Button;
      
      public var _CameraPanel_Button3:Button;
      
      public var _CameraPanel_Form2:Form;
      
      public var _CameraPanel_FormHeading1:FormHeading;
      
      public var _CameraPanel_FormHeading2:FormHeading;
      
      public var _CameraPanel_FormItem1:FormItem;
      
      public var _CameraPanel_FormItem2:FormItem;
      
      public var _CameraPanel_FormItem3:FormItem;
      
      public var _CameraPanel_FormItem4:FormItem;
      
      public var _CameraPanel_FormItem5:FormItem;
      
      public var _CameraPanel_HGroup2:HGroup;
      
      public var _CameraPanel_Label1:Label;
      
      public var _CameraPanel_Label2:Label;
      
      public var _CameraPanel_Label3:Label;
      
      public var _CameraPanel_VGroup3:VGroup;
      
      private var _2090402675emptyContentGroup:Group;
      
      private var _212200482endCompositionDropDownList:spark.components.DropDownList;
      
      private var _2025705170endHeightTxt:HintedTextInput;
      
      private var _1370546373endWidthTxt:HintedTextInput;
      
      private var _1607143853endXTxt:HintedTextInput;
      
      private var _1607114062endYTxt:HintedTextInput;
      
      private var _479145865startCompositionDropDownList:spark.components.DropDownList;
      
      private var _1968833145startHeightTxt:HintedTextInput;
      
      private var _1260018356startWidthTxt:HintedTextInput;
      
      private var _2129195430startXTxt:HintedTextInput;
      
      private var _2129165639startYTxt:HintedTextInput;
      
      private var _2001826798timingRangeSelector:RangeSelector;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1827565232_target:ProgramEffectAsset;
      
      private var _scene:AnimeScene;
      
      private var _763341725_hasCameraPan:Boolean;
      
      private var _conformToPrevMenuItem:MenuItemModel;
      
      private var _conformToNextMenuItem:MenuItemModel;
      
      private var _cam1:Rectangle;
      
      private var _cam2:Rectangle;
      
      private var _command:ChangeCameraTimingCommand;
      
      private var _embed_mxml__styles_images_panel_scenesetting_zoomin_png_534933897:Class;
      
      private var _embed_mxml__styles_images_panel_arrow_png_2077458411:Class;
      
      private var _embed_mxml__styles_images_panel_composition_splash_png_2072795853:Class;
      
      private var _embed_mxml__styles_images_panel_scenesetting_trash_png_1543272905:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CameraPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._cam1 = LicenseConstants.getStageRect();
         this._cam2 = LicenseConstants.getStageRect();
         this._embed_mxml__styles_images_panel_scenesetting_zoomin_png_534933897 = CameraPanel__embed_mxml__styles_images_panel_scenesetting_zoomin_png_534933897;
         this._embed_mxml__styles_images_panel_arrow_png_2077458411 = CameraPanel__embed_mxml__styles_images_panel_arrow_png_2077458411;
         this._embed_mxml__styles_images_panel_composition_splash_png_2072795853 = CameraPanel__embed_mxml__styles_images_panel_composition_splash_png_2072795853;
         this._embed_mxml__styles_images_panel_scenesetting_trash_png_1543272905 = CameraPanel__embed_mxml__styles_images_panel_scenesetting_trash_png_1543272905;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CameraPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CameraPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CameraPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.creationPolicy = "all";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraPanel_Array1_c);
         this.addEventListener("contentCreationComplete",this.___CameraPanel_NavigatorContent1_contentCreationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CameraPanel._watcherSetupUtil = param1;
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
      
      public function get cam2() : Rectangle
      {
         return this._cam2;
      }
      
      public function set cam2(param1:Rectangle) : void
      {
         this._cam2 = param1;
         this.endXTxt.text = this.localToDisplayX(this._cam2.x);
         this.endYTxt.text = this.localToDisplayY(this._cam2.y);
         this.endWidthTxt.text = this._cam2.width.toFixed(0) + PIXEL_UNIT;
         this.endHeightTxt.text = this._cam2.height.toFixed(0) + PIXEL_UNIT;
      }
      
      public function get cam1() : Rectangle
      {
         return this._cam1;
      }
      
      public function set cam1(param1:Rectangle) : void
      {
         this._cam1 = param1;
         this.startXTxt.text = this.localToDisplayX(this._cam1.x);
         this.startYTxt.text = this.localToDisplayY(this._cam1.y);
         this.startWidthTxt.text = this._cam1.width.toFixed(0) + PIXEL_UNIT;
         this.startHeightTxt.text = this._cam1.height.toFixed(0) + PIXEL_UNIT;
      }
      
      private function addEventListeners() : void
      {
         if(this._target)
         {
            this._target.addEventListener(AssetEvent.ASSET_MOVED,this.camera_movedHandler);
            this._target.addEventListener(AssetEvent.MOTION_CHANGE,this.camera_motionChangeHandler);
            this._target.addEventListener(AssetEvent.ASSET_TIMING_CHANGE,this.camera_timingChangeHandler);
            if(this._target.motionShadow)
            {
               this._target.motionShadow.addEventListener(AssetEvent.ASSET_MOVED,this.camera_movedHandler);
            }
            if(this._scene)
            {
               this._scene.addEventListener(SceneEvent.DURATION_CHANGE,this.scene_durationChangeHandler);
            }
         }
      }
      
      private function removeEventListeners() : void
      {
         if(this._target)
         {
            this._target.removeEventListener(AssetEvent.ASSET_MOVED,this.camera_movedHandler);
            this._target.removeEventListener(AssetEvent.MOTION_CHANGE,this.camera_motionChangeHandler);
            this._target.removeEventListener(AssetEvent.ASSET_TIMING_CHANGE,this.camera_timingChangeHandler);
            if(this._target.motionShadow)
            {
               this._target.motionShadow.removeEventListener(AssetEvent.ASSET_MOVED,this.camera_movedHandler);
            }
            if(this._scene)
            {
               this._scene.removeEventListener(SceneEvent.DURATION_CHANGE,this.scene_durationChangeHandler);
            }
         }
      }
      
      private function camera_timingChangeHandler(param1:AssetEvent) : void
      {
         this.updateTimingRangeValue();
      }
      
      public function set target(param1:Object) : void
      {
         this.removeEventListeners();
         createDeferredContent();
         this._target = param1 as ProgramEffectAsset;
         if(this._target)
         {
            this._scene = this._target.scene;
         }
         this.updateMenu();
         this.updateTimingRange();
         this.updateCameraUI();
         this.refreshSplash();
         this.addEventListeners();
      }
      
      private function updateMenu() : void
      {
         var _loc1_:Console = Console.getConsole();
         this._conformToPrevMenuItem.enabled = _loc1_.movie.getPrevScene(this._scene) != null;
         this._conformToNextMenuItem.enabled = _loc1_.movie.getNextScene(this._scene) != null;
      }
      
      private function refreshSplash() : void
      {
         this.emptyContentGroup.visible = this.shouldSplashShow;
      }
      
      private function scene_durationChangeHandler(param1:SceneEvent) : void
      {
         this.updateTimingRange();
      }
      
      private function updateTimingRange() : void
      {
         this.timingRangeSelector.minimum = 0;
         if(this._scene)
         {
            this.timingRangeSelector.maximum = this._scene.duration;
         }
         this.updateTimingRangeValue();
      }
      
      private function updateTimingRangeValue() : void
      {
         if(this._target.spanWholeScene)
         {
            this.timingRangeSelector.startValue = this.timingRangeSelector.minimum;
            this.timingRangeSelector.endValue = this.timingRangeSelector.maximum;
         }
         else
         {
            this.timingRangeSelector.startValue = UtilUnitConvert.frameToTime(this._target.startFrame);
            this.timingRangeSelector.endValue = UtilUnitConvert.frameToTime(this._target.startFrame + this._target.startDuration - 1,false);
         }
      }
      
      protected function onTimingRangeSelectorChange(param1:Event) : void
      {
         this.updateEffectValue();
      }
      
      private function updateEffectValue() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.timingRangeSelector.startValue == this.timingRangeSelector.minimum && this.timingRangeSelector.endValue == this.timingRangeSelector.maximum)
         {
            this._target.spanWholeScene = true;
         }
         else
         {
            _loc1_ = UtilUnitConvert.timeToFrame(this.timingRangeSelector.startValue);
            _loc2_ = UtilUnitConvert.durationToFrame(this.timingRangeSelector.endValue - this.timingRangeSelector.startValue);
            this._target.startFrame = _loc1_;
            this._target.startDuration = _loc2_;
            this._target.endFrame = UtilUnitConvert.durationToFrame(this.timingRangeSelector.maximum - this.timingRangeSelector.minimum);
            this._target.endDuration = 0;
            this._target.spanWholeScene = false;
         }
      }
      
      protected function onRangeSelectorThumbRelease(param1:Event) : void
      {
         if(this._command)
         {
            if(this.timingRangeSelector.startValue == this.timingRangeSelector.minimum && this.timingRangeSelector.endValue == this.timingRangeSelector.maximum)
            {
               this._command.executeNow(true,this._target.startFrame,this._target.duration);
            }
            else
            {
               this._command.executeNow(false,UtilUnitConvert.timeToFrame(this.timingRangeSelector.startValue),UtilUnitConvert.durationToFrame(this.timingRangeSelector.endValue - this.timingRangeSelector.startValue));
            }
         }
      }
      
      protected function onRangeSelectorThumbPress(param1:Event) : void
      {
         this._command = new ChangeCameraTimingCommand(this._target);
      }
      
      private function init() : void
      {
         this.initMenu();
      }
      
      private function initMenu() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         this._conformToPrevMenuItem = new MenuItemModel(UtilDict.translate("Conform to previous"),MENU_ITEM_ID_MATCH_PREVIOUS);
         _loc1_.addItem(this._conformToPrevMenuItem);
         _loc1_.addItem(new MenuItemModel(UtilDict.translate("Set to full stage"),MENU_ITEM_ID_MATCH_STAGE));
         _loc1_.addItem(new MenuItemModel("","",MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc1_.addItem(new MenuItemModel(UtilDict.translate("Delete composition"),MENU_ITEM_ID_DELETE_CAMERA));
         this.startCompositionDropDownList.dataProvider = _loc1_;
         _loc1_ = new ArrayCollection();
         this._conformToNextMenuItem = new MenuItemModel(UtilDict.translate("Conform to next"),MENU_ITEM_ID_MATCH_NEXT);
         _loc1_.addItem(this._conformToNextMenuItem);
         _loc1_.addItem(new MenuItemModel(UtilDict.translate("Match starting size"),MENU_ITEM_ID_MATCH_START));
         _loc1_.addItem(new MenuItemModel(UtilDict.translate("Set to full stage"),MENU_ITEM_ID_MATCH_STAGE));
         this.endCompositionDropDownList.dataProvider = _loc1_;
      }
      
      private function updateCam1(param1:Rectangle) : void
      {
         var _loc2_:ResizeCameraCompositionCommand = null;
         if(this._target)
         {
            _loc2_ = new ResizeCameraCompositionCommand(this._target,param1);
            _loc2_.execute();
         }
      }
      
      private function updateCam2(param1:Rectangle) : void
      {
         var _loc2_:ResizeCameraCompositionCommand = null;
         if(this._target && this._target.motionShadow)
         {
            param1.x = UtilMath.boundaryCheck(param1.x,AnimeConstants.SCREEN_X,AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH - param1.width);
            param1.y = UtilMath.boundaryCheck(param1.y,AnimeConstants.screenY,AnimeConstants.screenY + AnimeConstants.screenHeight - param1.height);
            _loc2_ = new ResizeCameraCompositionCommand(this._target.motionShadow,param1);
            _loc2_.execute();
         }
      }
      
      private function validateRectangle(param1:Rectangle) : Boolean
      {
         if(param1.size.length > 0 && param1.topLeft.length > 0)
         {
            return true;
         }
         return false;
      }
      
      private function onTextInputChange(param1:Event) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:SceneOptionEvent = null;
         var _loc11_:Rectangle = null;
         var _loc12_:Rectangle = null;
         var _loc13_:Rectangle = null;
         var _loc14_:Rectangle = null;
         var _loc2_:Rectangle = LicenseConstants.getStageRect();
         var _loc3_:Rectangle = this.cam1.clone();
         var _loc4_:Rectangle = this.cam2.clone();
         var _loc10_:TextInput = TextInput(param1.currentTarget);
         if(_loc10_.id.indexOf("start") > -1)
         {
            _loc5_ = this.displayToLocalX(UtilUnitConvert.removeUnit(this.startXTxt.text,PIXEL_UNIT));
            _loc6_ = this.displayToLocalY(UtilUnitConvert.removeUnit(this.startYTxt.text,PIXEL_UNIT));
            if(_loc10_.id.indexOf("Width") > -1)
            {
               _loc7_ = UtilUnitConvert.removeUnit(this.startWidthTxt.text,PIXEL_UNIT);
               _loc8_ = _loc7_ / LicenseConstants.getScreenRatio();
            }
            else if(_loc10_.id.indexOf("Height") > -1)
            {
               _loc8_ = UtilUnitConvert.removeUnit(this.startHeightTxt.text,PIXEL_UNIT);
               _loc7_ = LicenseConstants.getScreenRatio() * _loc8_;
            }
            else
            {
               _loc7_ = UtilUnitConvert.removeUnit(this.startWidthTxt.text,PIXEL_UNIT);
               _loc8_ = UtilUnitConvert.removeUnit(this.startHeightTxt.text,PIXEL_UNIT);
            }
            _loc11_ = new Rectangle(_loc5_,_loc6_,_loc7_,_loc8_);
            if(this.validateRectangle(_loc11_) && _loc2_.containsRect(_loc11_))
            {
               _loc12_ = _loc11_;
               if(!_loc12_.equals(_loc3_))
               {
                  this.updateCam1(_loc12_);
               }
               else
               {
                  this.cam1 = _loc3_;
               }
            }
            else
            {
               this.cam1 = _loc3_;
            }
         }
         if(_loc10_.id.indexOf("end") > -1)
         {
            _loc5_ = this.displayToLocalX(UtilUnitConvert.removeUnit(this.endXTxt.text,PIXEL_UNIT));
            _loc6_ = this.displayToLocalY(UtilUnitConvert.removeUnit(this.endYTxt.text,PIXEL_UNIT));
            if(_loc10_.id.indexOf("Width") > -1)
            {
               _loc7_ = UtilUnitConvert.removeUnit(this.endWidthTxt.text,PIXEL_UNIT);
               _loc8_ = _loc7_ / LicenseConstants.getScreenRatio();
            }
            else if(_loc10_.id.indexOf("Height") > -1)
            {
               _loc8_ = UtilUnitConvert.removeUnit(this.endHeightTxt.text,PIXEL_UNIT);
               _loc7_ = LicenseConstants.getScreenRatio() * _loc8_;
            }
            else
            {
               _loc7_ = UtilUnitConvert.removeUnit(this.endWidthTxt.text,PIXEL_UNIT);
               _loc8_ = UtilUnitConvert.removeUnit(this.endHeightTxt.text,PIXEL_UNIT);
            }
            _loc13_ = new Rectangle(_loc5_,_loc6_,_loc7_,_loc8_);
            if(this.validateRectangle(_loc13_) && _loc2_.containsRect(_loc13_))
            {
               _loc14_ = _loc13_;
               if(!_loc14_.equals(_loc4_))
               {
                  this.updateCam2(_loc14_);
               }
               else
               {
                  this.cam2 = _loc4_;
               }
            }
            else
            {
               this.cam2 = _loc4_;
            }
         }
      }
      
      private function camera_movedHandler(param1:Event) : void
      {
         this.updateCameraUI();
      }
      
      private function camera_motionChangeHandler(param1:AssetEvent) : void
      {
         this.updateCameraUI();
      }
      
      private function updateCameraUI() : void
      {
         var _loc1_:ProgramEffectAsset = null;
         if(this._target)
         {
            this.cam1 = new Rectangle(this._target.x,this._target.y,this._target.width,this._target.height);
            _loc1_ = this._target.motionShadow;
            if(_loc1_)
            {
               this.cam2 = new Rectangle(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
               this._hasCameraPan = true;
            }
            else
            {
               this._hasCameraPan = false;
            }
         }
      }
      
      private function addCameraMovementButton_clickHandler(param1:MouseEvent) : void
      {
         this.addCameraMovement();
      }
      
      private function addCameraMovement() : void
      {
         ZoomEffect(this._target.effect).isPan = true;
         var _loc1_:ICommand = new SlideAssetCommand(this._target,true);
         _loc1_.execute();
      }
      
      private function removeEndCompositionButton_clickHandler() : void
      {
         ZoomEffect(this._target.effect).isPan = false;
         var _loc1_:ICommand = new SlideAssetCommand(this._target,false);
         _loc1_.execute();
      }
      
      private function matchEndWithStage() : void
      {
         this.updateCam2(LicenseConstants.getStageRect());
      }
      
      private function matchStartWithStage() : void
      {
         this.updateCam1(LicenseConstants.getStageRect());
      }
      
      private function matchStartWithPreviousScene() : void
      {
         var _loc2_:ProgramEffectAsset = null;
         var _loc3_:Rectangle = null;
         var _loc1_:AnimeScene = Console.getConsole().getScene(Console.getConsole().currentSceneIndex - 1);
         if(_loc1_)
         {
            if(_loc1_.sizingAsset)
            {
               _loc2_ = ProgramEffectAsset(_loc1_.sizingAsset);
               _loc3_ = new Rectangle(_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
               if(_loc2_.motionShadow)
               {
                  _loc3_ = new Rectangle(_loc2_.motionShadow.x,_loc2_.motionShadow.y,_loc2_.motionShadow.width,_loc2_.motionShadow.height);
               }
               if(!_loc3_.equals(this.cam1))
               {
                  this.updateCam1(_loc3_);
               }
            }
         }
      }
      
      private function matchEndWithNextScene() : void
      {
         var _loc2_:ProgramEffectAsset = null;
         var _loc3_:Rectangle = null;
         var _loc1_:AnimeScene = Console.getConsole().getScene(Console.getConsole().currentSceneIndex + 1);
         if(_loc1_)
         {
            if(_loc1_.sizingAsset)
            {
               _loc2_ = ProgramEffectAsset(_loc1_.sizingAsset);
               _loc3_ = new Rectangle(_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
               if(!_loc3_.equals(this.cam2))
               {
                  this.updateCam2(_loc3_);
               }
            }
         }
      }
      
      private function matchEndWithStart() : void
      {
         var _loc1_:Rectangle = new Rectangle(this.cam2.x,this.cam2.y,this.cam1.width,this.cam1.height);
         if(!_loc1_.equals(this.cam2))
         {
            this.updateCam2(_loc1_);
         }
      }
      
      private function startCompositionDropDownList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:MenuItemModel = this.startCompositionDropDownList.selectedItem;
         var _loc3_:String = _loc2_.value as String;
         switch(_loc3_)
         {
            case MENU_ITEM_ID_MATCH_STAGE:
               this.matchStartWithStage();
               break;
            case MENU_ITEM_ID_MATCH_PREVIOUS:
               this.matchStartWithPreviousScene();
               break;
            case MENU_ITEM_ID_DELETE_CAMERA:
               this.removeCamera();
         }
         this.startCompositionDropDownList.selectedItem = null;
      }
      
      private function endCompositionDropDownList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:MenuItemModel = (param1.currentTarget as List).selectedItem;
         var _loc3_:String = _loc2_.value as String;
         switch(_loc3_)
         {
            case MENU_ITEM_ID_MATCH_STAGE:
               this.matchEndWithStage();
               break;
            case MENU_ITEM_ID_MATCH_NEXT:
               this.matchEndWithNextScene();
               break;
            case MENU_ITEM_ID_MATCH_START:
               this.matchEndWithStart();
         }
         this.endCompositionDropDownList.selectedItem = null;
      }
      
      private function removeCamera() : void
      {
         var _loc1_:RemoveCameraCommand = new RemoveCameraCommand(this._target);
         _loc1_.execute();
         var _loc2_:MainStage = Console.getConsole().mainStage;
         if(_loc2_)
         {
            _loc2_.sceneEditor.view.hideCameraLayerByOpacity();
            Console.getConsole().sceneEditor.hideControlBox();
         }
         this.refreshSplash();
      }
      
      private function zoomButton_clickHandler(param1:Event) : void
      {
         var _loc2_:MainStage = Console.getConsole().mainStage;
         if(_loc2_)
         {
            _loc2_.autoFitCamrea();
         }
      }
      
      private function localToDisplayX(param1:Number) : String
      {
         var _loc2_:Number = param1 - LicenseConstants.getStageRect().x;
         return _loc2_ == 0?"0" + PIXEL_UNIT:_loc2_.toFixed(0) + PIXEL_UNIT;
      }
      
      private function localToDisplayY(param1:Number) : String
      {
         var _loc2_:Number = param1 - LicenseConstants.getStageRect().y;
         return _loc2_ == 0?"0" + PIXEL_UNIT:_loc2_.toFixed(0) + PIXEL_UNIT;
      }
      
      private function displayToLocalX(param1:Number) : Number
      {
         return param1 + LicenseConstants.getStageRect().x;
      }
      
      private function displayToLocalY(param1:Number) : Number
      {
         return param1 + LicenseConstants.getStageRect().y;
      }
      
      private function composeButton_clickHandler() : void
      {
         var _loc1_:MainStage = Console.getConsole().mainStage;
         if(_loc1_)
         {
            _loc1_.sceneEditor.view.showCameraLayerByOpacity();
            Console.getConsole().sceneEditor.showCameraControlBox();
         }
         this.refreshSplash();
      }
      
      private function get shouldSplashShow() : Boolean
      {
         var _loc1_:MainStage = null;
         if(Console.getConsole().initialized)
         {
            _loc1_ = Console.getConsole().mainStage;
            if(_loc1_)
            {
               return _loc1_.sceneEditor.view.cameraLayer.alpha == 0;
            }
         }
         return true;
      }
      
      private function tutorialButton_clickHandler() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("videoTutorial.launch","composition");
         }
      }
      
      private function _CameraPanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._CameraPanel_Scroller1_c(),this._CameraPanel_Group4_i()];
         return _loc1_;
      }
      
      private function _CameraPanel_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._CameraPanel_VGroup1_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CameraPanel_Form1_c(),this._CameraPanel_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "compact";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraPanel_Array3_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_Array3_c() : Array
      {
         var _loc1_:Array = [this._CameraPanel_Group1_c(),this._CameraPanel_FormItem1_i(),this._CameraPanel_FormItem2_i()];
         return _loc1_;
      }
      
      private function _CameraPanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._CameraPanel_FormHeading1_i(),this._CameraPanel_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_FormHeading1_i() : FormHeading
      {
         var _loc1_:FormHeading = new FormHeading();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_CameraPanel_FormHeading1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_FormHeading1 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_FormHeading1",this._CameraPanel_FormHeading1);
         return _loc1_;
      }
      
      private function _CameraPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 4;
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingTop = 4;
         _loc1_.paddingRight = 4;
         _loc1_.paddingBottom = 6;
         _loc1_.mxmlContent = [this._CameraPanel_DropDownList1_i(),this._CameraPanel_IconButton1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_DropDownList1_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.useVirtualLayout = false;
         _loc1_.itemRenderer = this._CameraPanel_ClassFactory1_c();
         _loc1_.setStyle("skinClass",OptionDropDownListSkin);
         _loc1_.addEventListener("change",this.__startCompositionDropDownList_change);
         _loc1_.id = "startCompositionDropDownList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startCompositionDropDownList = _loc1_;
         BindingManager.executeBindings(this,"startCompositionDropDownList",this.startCompositionDropDownList);
         return _loc1_;
      }
      
      private function _CameraPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = MenuItemRenderer;
         return _loc1_;
      }
      
      public function __startCompositionDropDownList_change(param1:IndexChangeEvent) : void
      {
         this.startCompositionDropDownList_changeHandler(param1);
      }
      
      private function _CameraPanel_IconButton1_c() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 15;
         _loc1_.height = 20;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_panel_scenesetting_zoomin_png_534933897);
         _loc1_.addEventListener("click",this.___CameraPanel_IconButton1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___CameraPanel_IconButton1_click(param1:MouseEvent) : void
      {
         this.zoomButton_clickHandler(param1);
      }
      
      private function _CameraPanel_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._CameraPanel_HorizontalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraPanel_Array6_c);
         _loc1_.id = "_CameraPanel_FormItem1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_FormItem1 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_FormItem1",this._CameraPanel_FormItem1);
         return _loc1_;
      }
      
      private function _CameraPanel_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "baseline";
         return _loc1_;
      }
      
      private function _CameraPanel_Array6_c() : Array
      {
         var _loc1_:Array = [this._CameraPanel_HintedTextInput1_i(),this._CameraPanel_HintedTextInput2_i()];
         return _loc1_;
      }
      
      private function _CameraPanel_HintedTextInput1_i() : HintedTextInput
      {
         var _loc1_:HintedTextInput = new HintedTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__startWidthTxt_enter);
         _loc1_.addEventListener("focusOut",this.__startWidthTxt_focusOut);
         _loc1_.id = "startWidthTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startWidthTxt = _loc1_;
         BindingManager.executeBindings(this,"startWidthTxt",this.startWidthTxt);
         return _loc1_;
      }
      
      public function __startWidthTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __startWidthTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraPanel_HintedTextInput2_i() : HintedTextInput
      {
         var _loc1_:HintedTextInput = new HintedTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__startHeightTxt_enter);
         _loc1_.addEventListener("focusOut",this.__startHeightTxt_focusOut);
         _loc1_.id = "startHeightTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startHeightTxt = _loc1_;
         BindingManager.executeBindings(this,"startHeightTxt",this.startHeightTxt);
         return _loc1_;
      }
      
      public function __startHeightTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __startHeightTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraPanel_FormItem2_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._CameraPanel_HorizontalLayout2_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraPanel_Array7_c);
         _loc1_.id = "_CameraPanel_FormItem2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_FormItem2 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_FormItem2",this._CameraPanel_FormItem2);
         return _loc1_;
      }
      
      private function _CameraPanel_HorizontalLayout2_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "baseline";
         return _loc1_;
      }
      
      private function _CameraPanel_Array7_c() : Array
      {
         var _loc1_:Array = [this._CameraPanel_HintedTextInput3_i(),this._CameraPanel_HintedTextInput4_i()];
         return _loc1_;
      }
      
      private function _CameraPanel_HintedTextInput3_i() : HintedTextInput
      {
         var _loc1_:HintedTextInput = new HintedTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__startXTxt_enter);
         _loc1_.addEventListener("focusOut",this.__startXTxt_focusOut);
         _loc1_.id = "startXTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startXTxt = _loc1_;
         BindingManager.executeBindings(this,"startXTxt",this.startXTxt);
         return _loc1_;
      }
      
      public function __startXTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __startXTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraPanel_HintedTextInput4_i() : HintedTextInput
      {
         var _loc1_:HintedTextInput = new HintedTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__startYTxt_enter);
         _loc1_.addEventListener("focusOut",this.__startYTxt_focusOut);
         _loc1_.id = "startYTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startYTxt = _loc1_;
         BindingManager.executeBindings(this,"startYTxt",this.startYTxt);
         return _loc1_;
      }
      
      public function __startYTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __startYTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraPanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CameraPanel_Group2_c(),this._CameraPanel_Group3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._CameraPanel_FormHeading2_i(),this._CameraPanel_HGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_FormHeading2_i() : FormHeading
      {
         var _loc1_:FormHeading = new FormHeading();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_CameraPanel_FormHeading2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_FormHeading2 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_FormHeading2",this._CameraPanel_FormHeading2);
         return _loc1_;
      }
      
      private function _CameraPanel_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 4;
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingTop = 4;
         _loc1_.paddingRight = 4;
         _loc1_.paddingBottom = 4;
         _loc1_.mxmlContent = [this._CameraPanel_DropDownList2_i(),this._CameraPanel_IconButton2_c()];
         _loc1_.id = "_CameraPanel_HGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_HGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_HGroup2",this._CameraPanel_HGroup2);
         return _loc1_;
      }
      
      private function _CameraPanel_DropDownList2_i() : spark.components.DropDownList
      {
         var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
         _loc1_.useVirtualLayout = false;
         _loc1_.itemRenderer = this._CameraPanel_ClassFactory2_c();
         _loc1_.setStyle("skinClass",OptionDropDownListSkin);
         _loc1_.addEventListener("change",this.__endCompositionDropDownList_change);
         _loc1_.id = "endCompositionDropDownList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endCompositionDropDownList = _loc1_;
         BindingManager.executeBindings(this,"endCompositionDropDownList",this.endCompositionDropDownList);
         return _loc1_;
      }
      
      private function _CameraPanel_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = MenuItemRenderer;
         return _loc1_;
      }
      
      public function __endCompositionDropDownList_change(param1:IndexChangeEvent) : void
      {
         this.endCompositionDropDownList_changeHandler(param1);
      }
      
      private function _CameraPanel_IconButton2_c() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.width = 15;
         _loc1_.height = 20;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_panel_scenesetting_trash_png_1543272905);
         _loc1_.addEventListener("click",this.___CameraPanel_IconButton2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___CameraPanel_IconButton2_click(param1:MouseEvent) : void
      {
         this.removeEndCompositionButton_clickHandler();
      }
      
      private function _CameraPanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CameraPanel_Form2_i(),this._CameraPanel_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_Form2_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.styleName = "compact";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraPanel_Array12_c);
         _loc1_.id = "_CameraPanel_Form2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_Form2 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_Form2",this._CameraPanel_Form2);
         return _loc1_;
      }
      
      private function _CameraPanel_Array12_c() : Array
      {
         var _loc1_:Array = [this._CameraPanel_FormItem3_i(),this._CameraPanel_FormItem4_i(),this._CameraPanel_Spacer1_c(),this._CameraPanel_FormItem5_i(),this._CameraPanel_Spacer2_c()];
         return _loc1_;
      }
      
      private function _CameraPanel_FormItem3_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._CameraPanel_HorizontalLayout3_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraPanel_Array13_c);
         _loc1_.id = "_CameraPanel_FormItem3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_FormItem3 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_FormItem3",this._CameraPanel_FormItem3);
         return _loc1_;
      }
      
      private function _CameraPanel_HorizontalLayout3_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "baseline";
         return _loc1_;
      }
      
      private function _CameraPanel_Array13_c() : Array
      {
         var _loc1_:Array = [this._CameraPanel_HintedTextInput5_i(),this._CameraPanel_HintedTextInput6_i()];
         return _loc1_;
      }
      
      private function _CameraPanel_HintedTextInput5_i() : HintedTextInput
      {
         var _loc1_:HintedTextInput = new HintedTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__endWidthTxt_enter);
         _loc1_.addEventListener("focusOut",this.__endWidthTxt_focusOut);
         _loc1_.id = "endWidthTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endWidthTxt = _loc1_;
         BindingManager.executeBindings(this,"endWidthTxt",this.endWidthTxt);
         return _loc1_;
      }
      
      public function __endWidthTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __endWidthTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraPanel_HintedTextInput6_i() : HintedTextInput
      {
         var _loc1_:HintedTextInput = new HintedTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__endHeightTxt_enter);
         _loc1_.addEventListener("focusOut",this.__endHeightTxt_focusOut);
         _loc1_.id = "endHeightTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endHeightTxt = _loc1_;
         BindingManager.executeBindings(this,"endHeightTxt",this.endHeightTxt);
         return _loc1_;
      }
      
      public function __endHeightTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __endHeightTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraPanel_FormItem4_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.layout = this._CameraPanel_HorizontalLayout4_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraPanel_Array14_c);
         _loc1_.id = "_CameraPanel_FormItem4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_FormItem4 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_FormItem4",this._CameraPanel_FormItem4);
         return _loc1_;
      }
      
      private function _CameraPanel_HorizontalLayout4_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.gap = 7;
         _loc1_.verticalAlign = "baseline";
         return _loc1_;
      }
      
      private function _CameraPanel_Array14_c() : Array
      {
         var _loc1_:Array = [this._CameraPanel_HintedTextInput7_i(),this._CameraPanel_HintedTextInput8_i()];
         return _loc1_;
      }
      
      private function _CameraPanel_HintedTextInput7_i() : HintedTextInput
      {
         var _loc1_:HintedTextInput = new HintedTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__endXTxt_enter);
         _loc1_.addEventListener("focusOut",this.__endXTxt_focusOut);
         _loc1_.id = "endXTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endXTxt = _loc1_;
         BindingManager.executeBindings(this,"endXTxt",this.endXTxt);
         return _loc1_;
      }
      
      public function __endXTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __endXTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraPanel_HintedTextInput8_i() : HintedTextInput
      {
         var _loc1_:HintedTextInput = new HintedTextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("enter",this.__endYTxt_enter);
         _loc1_.addEventListener("focusOut",this.__endYTxt_focusOut);
         _loc1_.id = "endYTxt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endYTxt = _loc1_;
         BindingManager.executeBindings(this,"endYTxt",this.endYTxt);
         return _loc1_;
      }
      
      public function __endYTxt_enter(param1:FlexEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      public function __endYTxt_focusOut(param1:FocusEvent) : void
      {
         this.onTextInputChange(param1);
      }
      
      private function _CameraPanel_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = -11;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_FormItem5_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._CameraPanel_Array15_c);
         _loc1_.id = "_CameraPanel_FormItem5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_FormItem5 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_FormItem5",this._CameraPanel_FormItem5);
         return _loc1_;
      }
      
      private function _CameraPanel_Array15_c() : Array
      {
         var _loc1_:Array = [this._CameraPanel_RangeSelector1_i()];
         return _loc1_;
      }
      
      private function _CameraPanel_RangeSelector1_i() : RangeSelector
      {
         var _loc1_:RangeSelector = new RangeSelector();
         _loc1_.percentWidth = 100;
         _loc1_.snapInterval = 0.125;
         _loc1_.addEventListener("startThumbPress",this.__timingRangeSelector_startThumbPress);
         _loc1_.addEventListener("startThumbRelease",this.__timingRangeSelector_startThumbRelease);
         _loc1_.addEventListener("endThumbPress",this.__timingRangeSelector_endThumbPress);
         _loc1_.addEventListener("endThumbRelease",this.__timingRangeSelector_endThumbRelease);
         _loc1_.addEventListener("change",this.__timingRangeSelector_change);
         _loc1_.id = "timingRangeSelector";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timingRangeSelector = _loc1_;
         BindingManager.executeBindings(this,"timingRangeSelector",this.timingRangeSelector);
         return _loc1_;
      }
      
      public function __timingRangeSelector_startThumbPress(param1:Event) : void
      {
         this.onRangeSelectorThumbPress(param1);
      }
      
      public function __timingRangeSelector_startThumbRelease(param1:Event) : void
      {
         this.onRangeSelectorThumbRelease(param1);
      }
      
      public function __timingRangeSelector_endThumbPress(param1:Event) : void
      {
         this.onRangeSelectorThumbPress(param1);
      }
      
      public function __timingRangeSelector_endThumbRelease(param1:Event) : void
      {
         this.onRangeSelectorThumbRelease(param1);
      }
      
      public function __timingRangeSelector_change(param1:Event) : void
      {
         this.onTimingRangeSelectorChange(param1);
      }
      
      private function _CameraPanel_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = -4;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 7;
         _loc1_.bottom = 0;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._CameraPanel_Label1_i(),this._CameraPanel_Button1_i()];
         _loc1_.id = "_CameraPanel_VGroup3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_VGroup3 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_VGroup3",this._CameraPanel_VGroup3);
         return _loc1_;
      }
      
      private function _CameraPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_CameraPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_Label1",this._CameraPanel_Label1);
         return _loc1_;
      }
      
      private function _CameraPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___CameraPanel_Button1_click);
         _loc1_.id = "_CameraPanel_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_Button1",this._CameraPanel_Button1);
         return _loc1_;
      }
      
      public function ___CameraPanel_Button1_click(param1:MouseEvent) : void
      {
         this.addCameraMovementButton_clickHandler(param1);
      }
      
      private function _CameraPanel_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CameraPanel_Rect1_c(),this._CameraPanel_BitmapImage1_c(),this._CameraPanel_VGroup4_c()];
         _loc1_.id = "emptyContentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.emptyContentGroup = _loc1_;
         BindingManager.executeBindings(this,"emptyContentGroup",this.emptyContentGroup);
         return _loc1_;
      }
      
      private function _CameraPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._CameraPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2446725;
         return _loc1_;
      }
      
      private function _CameraPanel_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_panel_composition_splash_png_2072795853;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CameraPanel_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingTop = 28;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.gap = 14;
         _loc1_.mxmlContent = [this._CameraPanel_Label2_i(),this._CameraPanel_Label3_i(),this._CameraPanel_Spacer3_c(),this._CameraPanel_Button2_i(),this._CameraPanel_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontSize",17);
         _loc1_.id = "_CameraPanel_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_Label2",this._CameraPanel_Label2);
         return _loc1_;
      }
      
      private function _CameraPanel_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 80;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontSize",13);
         _loc1_.id = "_CameraPanel_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_Label3",this._CameraPanel_Label3);
         return _loc1_;
      }
      
      private function _CameraPanel_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 93;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "primary";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___CameraPanel_Button2_click);
         _loc1_.id = "_CameraPanel_Button2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_Button2 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_Button2",this._CameraPanel_Button2);
         return _loc1_;
      }
      
      public function ___CameraPanel_Button2_click(param1:MouseEvent) : void
      {
         this.composeButton_clickHandler();
      }
      
      private function _CameraPanel_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._CameraPanel_Button3_i(),this._CameraPanel_BitmapImage2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CameraPanel_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "link";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___CameraPanel_Button3_click);
         _loc1_.id = "_CameraPanel_Button3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CameraPanel_Button3 = _loc1_;
         BindingManager.executeBindings(this,"_CameraPanel_Button3",this._CameraPanel_Button3);
         return _loc1_;
      }
      
      public function ___CameraPanel_Button3_click(param1:MouseEvent) : void
      {
         this.tutorialButton_clickHandler();
      }
      
      private function _CameraPanel_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_panel_arrow_png_2077458411;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      public function ___CameraPanel_NavigatorContent1_contentCreationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _CameraPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Start Composition");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_FormHeading1.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Size");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_FormItem1.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("W:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"startWidthTxt.hint");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("H:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"startHeightTxt.hint");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Position");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_FormItem2.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("X:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"startXTxt.hint");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Y:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"startYTxt.hint");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("End Composition");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_FormHeading2.label");
         result[8] = new Binding(this,function():Boolean
         {
            return _hasCameraPan;
         },null,"_CameraPanel_HGroup2.visible");
         result[9] = new Binding(this,function():Boolean
         {
            return _hasCameraPan;
         },null,"_CameraPanel_Form2.visible");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Size");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_FormItem3.label");
         result[11] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("W:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"endWidthTxt.hint");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("H:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"endHeightTxt.hint");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Position");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_FormItem4.label");
         result[14] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("X:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"endXTxt.hint");
         result[15] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Y:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"endYTxt.hint");
         result[16] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Timing");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_FormItem5.label");
         result[17] = new Binding(this,function():Boolean
         {
            return !_hasCameraPan;
         },null,"_CameraPanel_VGroup3.visible");
         result[18] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Add camera movement to pan, zoom in/out to bring life to the story");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_Label1.text");
         result[19] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Add Camera Movement");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_Button1.label");
         result[20] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Composition tool");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_Label2.text");
         result[21] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Use the composition tool to frame shots like closeups, or create camera moves like zooms and pans.");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_Label3.text");
         result[22] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Compose Shot");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_Button2.label");
         result[23] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Watch Tutorial Video");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CameraPanel_Button3.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get emptyContentGroup() : Group
      {
         return this._2090402675emptyContentGroup;
      }
      
      public function set emptyContentGroup(param1:Group) : void
      {
         var _loc2_:Object = this._2090402675emptyContentGroup;
         if(_loc2_ !== param1)
         {
            this._2090402675emptyContentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emptyContentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endCompositionDropDownList() : spark.components.DropDownList
      {
         return this._212200482endCompositionDropDownList;
      }
      
      public function set endCompositionDropDownList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._212200482endCompositionDropDownList;
         if(_loc2_ !== param1)
         {
            this._212200482endCompositionDropDownList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endCompositionDropDownList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endHeightTxt() : HintedTextInput
      {
         return this._2025705170endHeightTxt;
      }
      
      public function set endHeightTxt(param1:HintedTextInput) : void
      {
         var _loc2_:Object = this._2025705170endHeightTxt;
         if(_loc2_ !== param1)
         {
            this._2025705170endHeightTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endHeightTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endWidthTxt() : HintedTextInput
      {
         return this._1370546373endWidthTxt;
      }
      
      public function set endWidthTxt(param1:HintedTextInput) : void
      {
         var _loc2_:Object = this._1370546373endWidthTxt;
         if(_loc2_ !== param1)
         {
            this._1370546373endWidthTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endWidthTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endXTxt() : HintedTextInput
      {
         return this._1607143853endXTxt;
      }
      
      public function set endXTxt(param1:HintedTextInput) : void
      {
         var _loc2_:Object = this._1607143853endXTxt;
         if(_loc2_ !== param1)
         {
            this._1607143853endXTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endXTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endYTxt() : HintedTextInput
      {
         return this._1607114062endYTxt;
      }
      
      public function set endYTxt(param1:HintedTextInput) : void
      {
         var _loc2_:Object = this._1607114062endYTxt;
         if(_loc2_ !== param1)
         {
            this._1607114062endYTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endYTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startCompositionDropDownList() : spark.components.DropDownList
      {
         return this._479145865startCompositionDropDownList;
      }
      
      public function set startCompositionDropDownList(param1:spark.components.DropDownList) : void
      {
         var _loc2_:Object = this._479145865startCompositionDropDownList;
         if(_loc2_ !== param1)
         {
            this._479145865startCompositionDropDownList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startCompositionDropDownList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startHeightTxt() : HintedTextInput
      {
         return this._1968833145startHeightTxt;
      }
      
      public function set startHeightTxt(param1:HintedTextInput) : void
      {
         var _loc2_:Object = this._1968833145startHeightTxt;
         if(_loc2_ !== param1)
         {
            this._1968833145startHeightTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startHeightTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startWidthTxt() : HintedTextInput
      {
         return this._1260018356startWidthTxt;
      }
      
      public function set startWidthTxt(param1:HintedTextInput) : void
      {
         var _loc2_:Object = this._1260018356startWidthTxt;
         if(_loc2_ !== param1)
         {
            this._1260018356startWidthTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startWidthTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startXTxt() : HintedTextInput
      {
         return this._2129195430startXTxt;
      }
      
      public function set startXTxt(param1:HintedTextInput) : void
      {
         var _loc2_:Object = this._2129195430startXTxt;
         if(_loc2_ !== param1)
         {
            this._2129195430startXTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startXTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startYTxt() : HintedTextInput
      {
         return this._2129165639startYTxt;
      }
      
      public function set startYTxt(param1:HintedTextInput) : void
      {
         var _loc2_:Object = this._2129165639startYTxt;
         if(_loc2_ !== param1)
         {
            this._2129165639startYTxt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startYTxt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timingRangeSelector() : RangeSelector
      {
         return this._2001826798timingRangeSelector;
      }
      
      public function set timingRangeSelector(param1:RangeSelector) : void
      {
         var _loc2_:Object = this._2001826798timingRangeSelector;
         if(_loc2_ !== param1)
         {
            this._2001826798timingRangeSelector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingRangeSelector",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _target() : ProgramEffectAsset
      {
         return this._1827565232_target;
      }
      
      private function set _target(param1:ProgramEffectAsset) : void
      {
         var _loc2_:Object = this._1827565232_target;
         if(_loc2_ !== param1)
         {
            this._1827565232_target = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_target",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasCameraPan() : Boolean
      {
         return this._763341725_hasCameraPan;
      }
      
      private function set _hasCameraPan(param1:Boolean) : void
      {
         var _loc2_:Object = this._763341725_hasCameraPan;
         if(_loc2_ !== param1)
         {
            this._763341725_hasCameraPan = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasCameraPan",_loc2_,param1));
            }
         }
      }
   }
}
