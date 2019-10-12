package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IPlayable;
   import anifire.studio.assets.control.AssetControlBox;
   import anifire.studio.assets.control.AssetMotionControl;
   import anifire.studio.assets.controllers.AssetCollectionController;
   import anifire.studio.assets.controllers.AssetControllerFactory;
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.assets.views.AssetEditor;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.assets.views.FlowFrameEditor;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.MoveObjectCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.Thumb;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.events.SceneViewEvent;
   import anifire.studio.events.StageControlEvent;
   import anifire.studio.events.TutorialEvent;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.managers.ImporterManager;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.models.TextComponentThumb;
   import anifire.studio.utils.AssetSnapTool;
   import anifire.util.UtilUser;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.SharedObject;
   import flash.ui.Keyboard;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.managers.DragManager;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SceneEditor extends Group implements IBindingClient
   {
      
      private static const ASSET_MOVE_DISTANCE:int = 1;
      
      private static const ASSET_MOVE_DISTANCE_LARGE:int = 10;
      
      private static const OFF_STAGE_OPACITY:Number = 0.7;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _637388590controlBox:AssetControlBox;
      
      private var _47458229guideLayer:SceneAlignGuide;
      
      private var _69905979maskLayer:SpriteVisualElement;
      
      private var _367936711motionControl:AssetMotionControl;
      
      private var _1039444292selectionTool:AssetSelectionTool;
      
      private var _3619493view:ScenePreview;
      
      private var _380705099visualStageArea:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _console:Console;
      
      private var _lastControlBoxTarget:IAssetView;
      
      private var _tutorialCharacter:Character;
      
      private var _tutorialCharacterId:String;
      
      private var _expectCharacterCreation:Boolean;
      
      private var _expectCharacterSelection:Boolean;
      
      private var _expectBubbleSelection:Boolean;
      
      private var _expectShadowCreation:Boolean;
      
      private var _tutorialManager:TutorialManager;
      
      private var _scaleFactor:Number = 1;
      
      private var _allowedAsset:Asset;
      
      private var _lockSelection:Boolean;
      
      private var _backgroundSelected:Boolean;
      
      private var _showReferencePoint:Boolean;
      
      private var _sceneModel:AnimeScene;
      
      private var _selection:AssetViewCollection;
      
      private var _mouseDown:Point;
      
      private var _oldPos:Point;
      
      private var _oldRef:Point;
      
      private var _moveCommand:ICommand;
      
      private var _isDragging:Boolean;
      
      private var _controller:Object;
      
      private var _preSelectedAssets:Array;
      
      private var _switchVoiceTab:Boolean;
      
      private var _snapTool:AssetSnapTool;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneEditor()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._tutorialManager = TutorialManager.instance;
         this._oldPos = new Point();
         this._oldRef = new Point();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneEditor_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneEditorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneEditor[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SceneEditor_Group2_i(),this._SceneEditor_ScenePreview1_i(),this._SceneEditor_SpriteVisualElement1_i(),this._SceneEditor_AssetControlBox1_i(),this._SceneEditor_AssetMotionControl1_i(),this._SceneEditor_SceneAlignGuide1_i(),this._SceneEditor_AssetSelectionTool1_i()];
         this.addEventListener("creationComplete",this.___SceneEditor_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneEditor._watcherSetupUtil = param1;
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
      
      private function init() : void
      {
         this._console = Console.getConsole();
         this._selection = new AssetViewCollection();
         if(UtilUser.hasBusinessFeatures)
         {
            this._snapTool = new AssetSnapTool();
         }
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         addEventListener(MouseEvent.MOUSE_OVER,this.mouseOverHandler);
         addEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         this.view.addEventListener(MouseEvent.MOUSE_DOWN,this.view_mouseDownHandler);
         this.view.addEventListener(DragEvent.DRAG_ENTER,this.view_dragEnterHandler);
         this.view.addEventListener(DragEvent.DRAG_EXIT,this.view_dragExitHandler);
         this.view.addEventListener(DragEvent.DRAG_DROP,this.view_dragDropHandler);
         addEventListener(Event.COPY,this.copyHandler);
         addEventListener(Event.PASTE,this.pasteHandler);
         addEventListener(KeyboardEvent.KEY_UP,this.this_keyUpHandler);
         addEventListener(SceneViewEvent.ASSET_VIEW_ADDED,this.assetViewAddedHandler);
         addEventListener(SceneViewEvent.VIEW_LOAD_COMPLETE,this.viewLoadCompleteHandler);
         this.controlBox.addEventListener(MouseEvent.MOUSE_DOWN,this.controlBox_mouseDownHandler);
         scrollRect = new Rectangle(0,0,AnimeConstants.STAGE_WIDTH + AnimeConstants.STAGE_PADDING * 2,AnimeConstants.STAGE_HEIGHT + AnimeConstants.STAGE_PADDING * 2);
         this.redrawOffStageArea();
         this.motionControl.sceneEditor = this;
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_START,this.tutorialManager_tutorialStartHandler);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_STEP_START,this.tutorialManager_tutorialStepStartHandler);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_SKIP,this.tutorialManager_tutorialSkipHandler);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_COMPLETE,this.tutorialManager_tutorialCompleteHandler);
         this.loadPreferences();
      }
      
      private function loadPreferences() : void
      {
         var _loc1_:SharedObject = null;
         try
         {
            _loc1_ = SharedObject.getLocal("studioPreferences");
            if(_loc1_.data.showReferencePoint != null)
            {
               this._showReferencePoint = _loc1_.data.showReferencePoint;
               this.controlBox.showReferencePoint = this._showReferencePoint;
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function get sceneModel() : AnimeScene
      {
         return this._sceneModel;
      }
      
      public function set sceneModel(param1:AnimeScene) : void
      {
         if(this._sceneModel != param1)
         {
            this.controlBox.target = null;
            this.motionControl.target = null;
            this._selection.clearCollection();
            if(this._sceneModel)
            {
               this._sceneModel.removeEventListener(SceneEvent.ASSET_ADDED,this.scene_assetAddedHandler);
               this._sceneModel.removeEventListener(SceneEvent.ASSET_REMOVED,this.scene_assetRemovedHandler);
               this._sceneModel.selection.removeEventListener(Event.CHANGE,this.assetSelection_changeHandler);
               this._sceneModel.selection.clearCollection();
            }
            this._sceneModel = param1;
            this.view.sceneModel = param1;
            if(this._sceneModel)
            {
               this._sceneModel.addEventListener(SceneEvent.ASSET_ADDED,this.scene_assetAddedHandler);
               this._sceneModel.addEventListener(SceneEvent.ASSET_REMOVED,this.scene_assetRemovedHandler);
               this._sceneModel.selection.clearCollection();
               this._sceneModel.selection.addEventListener(Event.CHANGE,this.assetSelection_changeHandler);
            }
         }
      }
      
      public function get lockSelection() : Boolean
      {
         return this._lockSelection;
      }
      
      public function set lockSelection(param1:Boolean) : void
      {
         if(this._lockSelection != param1)
         {
            this._lockSelection = param1;
            if(!param1)
            {
               this._allowedAsset = null;
            }
         }
      }
      
      public function pause() : void
      {
         this.view.pause();
      }
      
      public function resume() : void
      {
         this.view.resume();
      }
      
      public function set interactive(param1:Boolean) : void
      {
      }
      
      public function redrawOffStageArea() : void
      {
         this.maskLayer.graphics.clear();
         this.maskLayer.graphics.lineStyle(0,0,0);
         this.maskLayer.graphics.beginFill(15790320,OFF_STAGE_OPACITY);
         this.maskLayer.graphics.drawRect(0,0,this.maskLayer.width,this.maskLayer.height);
         this.visualStageArea.x = (this.maskLayer.width - AnimeConstants.SCREEN_WIDTH) / 2;
         this.visualStageArea.y = (this.maskLayer.height - AnimeConstants.screenHeight) / 2;
         this.visualStageArea.width = AnimeConstants.SCREEN_WIDTH;
         this.visualStageArea.height = AnimeConstants.screenHeight;
         this.maskLayer.graphics.drawRect(this.visualStageArea.x,this.visualStageArea.y,this.visualStageArea.width,this.visualStageArea.height);
         this.maskLayer.graphics.endFill();
      }
      
      public function set guideVisble(param1:Boolean) : void
      {
         if(UtilUser.hasBusinessFeatures)
         {
            this.guideLayer.visible = param1;
         }
      }
      
      public function get scaleFactor() : Number
      {
         return this._scaleFactor;
      }
      
      public function set scaleFactor(param1:Number) : void
      {
         this._scaleFactor = param1;
         if(this.snapTool)
         {
            this.snapTool.scaleFactor = param1;
         }
         if(this.view)
         {
            this.view.scaleFactor = param1;
         }
         if(this.controlBox)
         {
            this.controlBox.drawingScale = param1;
         }
         if(this.motionControl)
         {
            this.motionControl.drawingScale = param1;
         }
      }
      
      public function get snapTool() : AssetSnapTool
      {
         return this._snapTool;
      }
      
      public function get selection() : AssetViewCollection
      {
         return this._selection;
      }
      
      private function viewLoadCompleteHandler(param1:SceneViewEvent) : void
      {
         this.showPreSelectedAssets();
         this._tutorialManager.notifyTutorialAction("scene_editor_change");
      }
      
      private function assetViewAddedHandler(param1:SceneViewEvent) : void
      {
         var _loc2_:IAssetView = null;
         if(this._expectCharacterCreation)
         {
            _loc2_ = this.getAssetViewByAsset(this._tutorialCharacter);
            if(_loc2_)
            {
               this._tutorialManager.registerComponent("tutorial_char",_loc2_ as DisplayObject);
               this._tutorialManager.notifyTutorialAction("add_char");
               this._expectCharacterCreation = false;
            }
         }
         this.showPreSelectedAssets();
         this.updateSelection();
         this.showControl();
      }
      
      private function showPreSelectedAssets() : void
      {
         var _loc1_:Asset = null;
         var _loc2_:Vector.<Asset> = null;
         var _loc3_:String = null;
         if(this._preSelectedAssets && this._preSelectedAssets.length > 0)
         {
            if(this._sceneModel && this._sceneModel.selection)
            {
               this._sceneModel.selection.clearCollection();
               _loc2_ = new Vector.<Asset>();
               for each(_loc3_ in this._preSelectedAssets)
               {
                  _loc1_ = AnimeScene(this._sceneModel).getAssetById(_loc3_);
                  if(_loc1_)
                  {
                     _loc2_.push(_loc1_);
                  }
               }
               this._sceneModel.selection.addAssets(_loc2_);
               this._preSelectedAssets = null;
               this.showControl();
            }
         }
         if(this._switchVoiceTab)
         {
            Console.getConsole().propertiesWindow.showSpeechPanel();
            this._switchVoiceTab = false;
         }
      }
      
      public function set preSelectedAssetIds(param1:Array) : void
      {
         this._preSelectedAssets = param1;
      }
      
      public function set showVoiceTab(param1:Boolean) : void
      {
         this._switchVoiceTab = param1;
      }
      
      private function assetSelection_changeHandler(param1:Event) : void
      {
         this.updateSelection();
      }
      
      private function updateSelection() : void
      {
         var _loc3_:IAssetView = null;
         var _loc4_:Asset = null;
         var _loc6_:Boolean = false;
         var _loc1_:IIterator = this._sceneModel.selection.iterator();
         var _loc2_:IIterator = this.view.iterator();
         var _loc5_:Array = new Array();
         this.motionControl.target = null;
         while(_loc1_.hasNext)
         {
            _loc4_ = _loc1_.next as Asset;
            if(_loc4_)
            {
               _loc2_.reset();
               while(_loc2_.hasNext)
               {
                  _loc3_ = _loc2_.next as IAssetView;
                  if(_loc3_ && _loc3_.asset == _loc4_)
                  {
                     _loc5_.push(_loc3_);
                  }
               }
               continue;
            }
         }
         this._selection.replaceAllAssets(_loc5_);
         if(this._selection.containsBubbleViewOnly)
         {
            this._controller = AssetControllerFactory.getTextCollectionController(this._selection);
            if(this._expectBubbleSelection)
            {
               this._tutorialManager.notifyTutorialAction("tutorial_bubble_select");
               this._expectBubbleSelection = false;
            }
         }
         else if(this._selection.selectedAsset)
         {
            this._controller = AssetControllerFactory.getController(this._selection.selectedAsset);
            if(this._controller)
            {
               IAssetController(this._controller).view = this._selection.selectedAsset;
            }
            if(this._expectCharacterSelection && this._selection.selectedAsset && this._selection.selectedAsset.asset == this._tutorialCharacter)
            {
               this._tutorialManager.notifyTutorialAction("tutorial_char_select");
               this._expectCharacterSelection = false;
            }
            if(this._selection.selectedAsset is FlowFrameEditor)
            {
               _loc6_ = true;
            }
         }
         else if(this._selection.length == 0)
         {
            if(!this._console.pptPanel.isTargetingScene())
            {
               this._console.showOverTray(false);
            }
         }
         else
         {
            this._controller = AssetControllerFactory.getCollectionController(this._selection);
         }
         if(_loc6_)
         {
            ImporterManager.instance.imageFrameSelected();
         }
         else
         {
            ImporterManager.instance.imageFrameDeselected();
         }
         this.hideControlBox();
         this.updateControlBox();
         this.hideButtonBar();
         this.updateButtonBar();
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function scene_assetAddedHandler(param1:SceneEvent) : void
      {
         if(this._tutorialManager.currentTutorial)
         {
            if(this._tutorialManager.currentTutorial.tutorialId == TutorialManager.DEFAULT_TUTORIAL_ID)
            {
               if(param1.asset is Background)
               {
                  this._tutorialManager.notifyTutorialAction("add_com_bg");
               }
               else if(param1.asset is Character)
               {
                  this._tutorialCharacter = param1.asset as Character;
                  this._tutorialCharacterId = this._tutorialCharacter.id;
                  this._expectCharacterCreation = true;
               }
            }
            else if(this._tutorialManager.currentTutorial.tutorialId == TutorialManager.NO_MOTION_TUTORIAL_ID)
            {
               if(param1.asset is Background)
               {
                  this._tutorialManager.notifyTutorialAction("add_com_bg");
               }
               else if(param1.asset is Character)
               {
                  this._tutorialCharacter = param1.asset as Character;
                  this._tutorialCharacterId = this._tutorialCharacter.id;
                  this._expectCharacterCreation = true;
               }
            }
         }
      }
      
      private function scene_assetRemovedHandler(param1:SceneEvent) : void
      {
      }
      
      private function tutorialManager_tutorialStartHandler(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.tutorialId;
         if(_loc2_ == TutorialManager.DEFAULT_TUTORIAL_ID)
         {
            this.selectionTool.visible = false;
            this._tutorialCharacter = null;
            this.lockSelection = true;
            this._allowedAsset = null;
            this._expectCharacterCreation = false;
            this._expectCharacterSelection = false;
            this._expectShadowCreation = false;
            this._tutorialManager.unregisterComponent("tutorial_char");
            this.motionControl.disableMotionPathMenu = true;
         }
         else if(_loc2_ == TutorialManager.NO_MOTION_TUTORIAL_ID)
         {
            this.selectionTool.visible = false;
            this._tutorialCharacter = null;
            this.lockSelection = true;
            this._allowedAsset = null;
            this._expectCharacterCreation = false;
            this._expectCharacterSelection = false;
            this._expectShadowCreation = false;
            this._tutorialManager.unregisterComponent("tutorial_char");
            this.motionControl.disableMotionPathMenu = true;
         }
         else if(_loc2_ == TutorialManager.STARTER_TUTORIAL_ID)
         {
            this.selectionTool.visible = false;
            this._tutorialCharacter = null;
            this.lockSelection = true;
            this._allowedAsset = null;
            this._expectCharacterCreation = false;
            this._expectCharacterSelection = false;
            this._expectShadowCreation = false;
            this._tutorialManager.unregisterComponent("tutorial_char");
            this.motionControl.disableMotionPathMenu = true;
         }
      }
      
      private function tutorialManager_tutorialStepStartHandler(param1:TutorialEvent) : void
      {
         var _loc4_:IAssetView = null;
         var _loc5_:IAssetView = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:BubbleAsset = null;
         var _loc9_:BubbleAsset = null;
         var _loc10_:Character = null;
         if(this._isDragging)
         {
            this._isDragging = false;
            removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         }
         var _loc2_:String = param1.tutorialId;
         var _loc3_:String = param1.data;
         if(_loc2_ == TutorialManager.DEFAULT_TUTORIAL_ID)
         {
            switch(_loc3_)
            {
               case "prepare_start_scene":
                  if(Console.getConsole().scenes.length > 1)
                  {
                     Console.getConsole().selectLastScene();
                     Console.getConsole().addNextScene(true);
                  }
                  else
                  {
                     this._sceneModel.selection.clearCollection();
                     this.updateSelection();
                     this._tutorialManager.notifyTutorialAction("scene_editor_change");
                  }
                  break;
               case "select_bubble":
                  this._expectBubbleSelection = true;
                  this._allowedAsset = this._sceneModel.bubbles.getValueByIndex(0);
                  break;
               case "select_char":
               case "select_char2":
               case "select_char2a":
               case "select_char3":
                  this._expectCharacterSelection = true;
                  this._allowedAsset = this._tutorialCharacter;
                  break;
               case "find_char":
               case "find_char2":
                  this._tutorialCharacter = this._sceneModel.getAssetById(this._tutorialCharacterId) as Character;
                  _loc4_ = this.getAssetViewByAsset(this._tutorialCharacter);
                  if(_loc4_)
                  {
                     this._tutorialManager.registerComponent("tutorial_char",_loc4_ as DisplayObject);
                     this._tutorialManager.notifyTutorialAction("find_char");
                  }
                  break;
               case "search_walk_action":
                  if(this._tutorialCharacter.facing == AnimeConstants.FACING_LEFT && this._tutorialCharacter.x < 80)
                  {
                     this._tutorialCharacter.facing = AnimeConstants.FACING_RIGHT;
                  }
                  else if(this._tutorialCharacter.facing == AnimeConstants.FACING_RIGHT && this._tutorialCharacter.x > AnimeConstants.SCREEN_WIDTH - 80)
                  {
                     this._tutorialCharacter.facing = AnimeConstants.FACING_LEFT;
                  }
                  break;
               case "move_motion_destination":
                  this._allowedAsset = null;
            }
         }
         else if(_loc2_ == TutorialManager.NO_MOTION_TUTORIAL_ID)
         {
            switch(_loc3_)
            {
               case "prepare_start_scene":
                  if(Console.getConsole().scenes.length > 1)
                  {
                     Console.getConsole().selectLastScene();
                     Console.getConsole().addNextScene(true);
                  }
                  else
                  {
                     this._sceneModel.selection.clearCollection();
                     this.updateSelection();
                     this._tutorialManager.notifyTutorialAction("scene_editor_change");
                  }
                  break;
               case "select_char":
               case "select_char2":
               case "select_char2a":
               case "select_char3":
                  this._expectCharacterSelection = true;
                  this._allowedAsset = this._tutorialCharacter;
                  break;
               case "find_char":
               case "find_char2":
                  this._tutorialCharacter = this._sceneModel.getAssetById(this._tutorialCharacterId) as Character;
                  _loc4_ = this.getAssetViewByAsset(this._tutorialCharacter);
                  if(_loc4_)
                  {
                     this._tutorialManager.registerComponent("tutorial_char",_loc4_ as DisplayObject);
                     this._tutorialManager.notifyTutorialAction("find_char");
                  }
            }
         }
         else if(_loc2_ == TutorialManager.STARTER_TUTORIAL_ID)
         {
            switch(_loc3_)
            {
               case "prepare_start_scene":
                  if(Console.getConsole().scenes.length > 1)
                  {
                     Console.getConsole().selectLastScene();
                     Console.getConsole().addNextScene(true);
                  }
                  else
                  {
                     this._sceneModel.selection.clearCollection();
                     this.updateSelection();
                     this._tutorialManager.notifyTutorialAction("scene_editor_change");
                  }
                  break;
               case "find_bubble":
                  _loc6_ = this._sceneModel.bubbles.length;
                  _loc7_ = 0;
                  while(_loc7_ < _loc6_)
                  {
                     _loc9_ = this._sceneModel.bubbles.getValueByIndex(_loc7_) as BubbleAsset;
                     if(!_loc8_ || _loc8_ && _loc8_.textSize < _loc9_.textSize)
                     {
                        _loc8_ = _loc9_;
                     }
                     _loc7_++;
                  }
                  this._allowedAsset = _loc8_;
                  if(this._allowedAsset)
                  {
                     _loc5_ = this.getAssetViewByAsset(this._allowedAsset);
                     this._tutorialManager.registerComponent("tutorial_bubble",_loc5_ as DisplayObject);
                  }
                  else
                  {
                     this._tutorialManager.setFlag("bubble_not_found");
                  }
                  this._tutorialManager.notifyTutorialAction("find_bubble");
                  break;
               case "find_up_most_char":
                  this._tutorialCharacter = null;
                  _loc6_ = this._sceneModel.characters.length;
                  _loc7_ = 0;
                  while(_loc7_ < _loc6_)
                  {
                     _loc10_ = this._sceneModel.characters.getValueByIndex(_loc7_);
                     if(this._tutorialCharacter)
                     {
                        if(this._sceneModel.getAssetOrdering(this._tutorialCharacter) < this._sceneModel.getAssetOrdering(_loc10_))
                        {
                           this._tutorialCharacter = _loc10_;
                        }
                     }
                     else
                     {
                        this._tutorialCharacter = _loc10_;
                     }
                     _loc7_++;
                  }
                  if(this._tutorialCharacter)
                  {
                     _loc4_ = this.getAssetViewByAsset(this._tutorialCharacter);
                     if(_loc4_)
                     {
                        this._tutorialManager.registerComponent("up_most_char",_loc4_ as DisplayObject);
                     }
                  }
                  else
                  {
                     this._tutorialManager.setFlag("up_most_char_not_found");
                  }
                  this._tutorialManager.notifyTutorialAction("found_up_most_char");
                  break;
               case "select_char2":
                  this._expectCharacterSelection = true;
                  this._allowedAsset = this._tutorialCharacter;
            }
         }
      }
      
      private function tutorialManager_tutorialSkipHandler(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.tutorialId;
         switch(_loc2_)
         {
            case TutorialManager.DEFAULT_TUTORIAL_ID:
            case TutorialManager.NO_MOTION_TUTORIAL_ID:
            case TutorialManager.STARTER_TUTORIAL_ID:
               this.selectionTool.visible = true;
               this.lockSelection = false;
               this.motionControl.disableMotionPathMenu = false;
               this._tutorialCharacter = null;
         }
      }
      
      private function tutorialManager_tutorialCompleteHandler(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.tutorialId;
         switch(_loc2_)
         {
            case TutorialManager.DEFAULT_TUTORIAL_ID:
            case TutorialManager.NO_MOTION_TUTORIAL_ID:
            case TutorialManager.STARTER_TUTORIAL_ID:
               this.selectionTool.visible = true;
               this.lockSelection = false;
               this.motionControl.disableMotionPathMenu = false;
               this._tutorialCharacter = null;
         }
      }
      
      private function getAssetViewByAsset(param1:Asset) : IAssetView
      {
         var _loc3_:IAssetView = null;
         var _loc2_:IIterator = this.view.iterator();
         while(_loc2_.hasNext)
         {
            _loc3_ = _loc2_.next as IAssetView;
            if(_loc3_ && _loc3_.asset == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function this_keyUpHandler(param1:KeyboardEvent) : void
      {
         if(this._tutorialManager.currentTutorial)
         {
            return;
         }
         var _loc2_:int = !!param1.shiftKey?int(ASSET_MOVE_DISTANCE_LARGE):int(ASSET_MOVE_DISTANCE);
         if(param1.keyCode == Keyboard.DELETE || param1.keyCode == Keyboard.BACKSPACE)
         {
            this._console.deleteAsset();
         }
         else if(param1.keyCode == Keyboard.LEFT)
         {
            this.moveGroup(-_loc2_,0);
         }
         else if(param1.keyCode == Keyboard.UP)
         {
            this.moveGroup(0,-_loc2_);
         }
         else if(param1.keyCode == Keyboard.RIGHT)
         {
            this.moveGroup(_loc2_,0);
         }
         else if(param1.keyCode == Keyboard.DOWN)
         {
            this.moveGroup(0,_loc2_);
         }
      }
      
      public function tutorialLayerDragEnter(param1:DragEvent, param2:UIComponent) : void
      {
         this.view_dragEnterHandler(param1);
      }
      
      public function tutorialLayerDragDrop(param1:DragEvent, param2:UIComponent) : void
      {
         var _loc3_:Point = param2.localToGlobal(new Point(param1.localX,param1.localY));
         var _loc4_:Point = this.view.globalToLocal(_loc3_);
         param1.localX = _loc4_.x;
         param1.localY = _loc4_.y;
         this.view_dragDropHandler(param1);
      }
      
      public function tutorialLayerDragExit(param1:DragEvent, param2:UIComponent) : void
      {
         this.view_dragExitHandler(param1);
      }
      
      private function view_dragEnterHandler(param1:DragEvent) : void
      {
         var _loc2_:Object = null;
         if(param1.dragSource.hasFormat(Thumb.DRAG_DATA_FORMAT))
         {
            _loc2_ = param1.dragSource.dataForFormat(Thumb.DRAG_DATA_FORMAT);
            if(_loc2_ is PropThumb && PropThumb(_loc2_).placeable == false)
            {
               return;
            }
            DragManager.acceptDragDrop(param1.target as UIComponent);
            this.view.hideAllEffect();
            DragManager.showFeedback(DragManager.COPY);
         }
      }
      
      private function view_dragExitHandler(param1:DragEvent) : void
      {
         this.view.showAllEffect();
      }
      
      private function view_dragDropHandler(param1:DragEvent) : void
      {
         var _loc2_:Thumb = Thumb(param1.dragSource.dataForFormat(Thumb.DRAG_DATA_FORMAT));
         var _loc3_:String = "";
         if(param1.dragSource.hasFormat("colorSetId"))
         {
            _loc3_ = String(param1.dragSource.dataForFormat("colorSetId"));
         }
         var _loc4_:DisplayObject = DisplayObject(param1.dragInitiator);
         if(_loc2_ is TextComponentThumb)
         {
            this._console.currentScene.applyTextComponent(_loc2_ as TextComponentThumb);
         }
         else if(_loc2_.isStarter)
         {
            this._console.addStarter(_loc2_ as BackgroundThumb,this._console.currentSceneIndex);
         }
         else
         {
            this._sceneModel.doCreateAsset(_loc2_,param1.localX,param1.localY,_loc3_);
         }
         this._console.currDragSource = null;
         this.view.showAllEffect();
      }
      
      private function copyHandler(param1:Event) : void
      {
         this._console.copyAsset();
      }
      
      private function pasteHandler(param1:Event) : void
      {
         this._console.pasteAsset();
      }
      
      private function controlBox_mouseDownHandler(param1:MouseEvent) : void
      {
         this.hideButtonBar();
      }
      
      private function hideButtonBar() : void
      {
         this._console.mainStage.hideButtonBar();
      }
      
      private function view_mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc3_:Asset = null;
         var _loc2_:IAssetView = param1.target as IAssetView;
         if(_loc2_)
         {
            _loc3_ = _loc2_.asset;
            if(this._lockSelection && (_loc3_ != this._allowedAsset || !_loc3_))
            {
               return;
            }
            this.hideButtonBar();
            this.hideControlBox();
            if(this._sceneModel && this._sceneModel.selection)
            {
               if(param1.shiftKey && !this._lockSelection)
               {
                  if(this._sceneModel.selection.isInCollection(_loc3_))
                  {
                     this._sceneModel.selection.removeAsset(_loc3_);
                  }
                  else
                  {
                     this._sceneModel.selection.addAsset(_loc3_);
                  }
               }
               else
               {
                  if(!this._sceneModel.selection.isInCollection(_loc3_))
                  {
                     this._sceneModel.selection.selectedAsset = _loc3_;
                  }
                  this.startDraggingGroup();
               }
            }
         }
      }
      
      private function startDraggingGroup() : void
      {
         if(!(this._selection.selectedAsset && this._selection.selectedAsset.asset is Background))
         {
            this._moveCommand = new MoveObjectCommand(this._controller as IMovable);
            this._isDragging = true;
            this._mouseDown = new Point(mouseX,mouseY);
            this.updateOriginalAssetPosition();
            if(this._snapTool)
            {
               this._snapTool.updateReference(this);
               if(this._controller is IMovable)
               {
                  this._snapTool.snapPoint(new Point(IMovable(this._controller).x,IMovable(this._controller).y));
               }
            }
            addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         }
      }
      
      private function updateOriginalAssetPosition() : void
      {
         if(this._controller is IMovable)
         {
            this._oldPos.x = IMovable(this._controller).x;
            this._oldPos.y = IMovable(this._controller).y;
         }
         if(this._controller is IReferencePoint)
         {
            this._oldRef.x = IReferencePoint(this._controller).referenceX;
            this._oldRef.y = IReferencePoint(this._controller).referenceY;
         }
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:AssetEditor = null;
         setFocus();
         if(this._lockSelection)
         {
            return;
         }
         this._backgroundSelected = param1.target == this.view.getSceneView().mySceneBg;
         if(param1.target is AssetEditor)
         {
            _loc2_ = param1.target as AssetEditor;
            if(_loc2_.asset is Background)
            {
               this._backgroundSelected = true;
            }
         }
         if(this._sceneModel && this._sceneModel.selection && !param1.shiftKey)
         {
            if(param1.target == this || param1.target == this.view || param1.target == this.view.mainLayer || param1.target == this.view.getSceneView().mySceneBg)
            {
               this._sceneModel.selection.clearCollection();
            }
         }
         dispatchEvent(new StageControlEvent(StageControlEvent.ASSET_DRAG_START));
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         if(this._isDragging && !this._lockSelection)
         {
            this.movingGroup(mouseX - this._mouseDown.x,mouseY - this._mouseDown.y,!param1.ctrlKey);
         }
      }
      
      private function mouseOverHandler(param1:MouseEvent) : void
      {
         if(this._lockSelection)
         {
            return;
         }
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:IAssetView = param1.target as IAssetView;
         if(_loc2_ == this || _loc2_ == this.view || _loc2_ == this.view.mainLayer || _loc2_ == this.view.getSceneView().mySceneBg || _loc3_ && _loc3_.asset is Background)
         {
            this.selectionTool.activate();
         }
         else
         {
            this.selectionTool.deactivate();
         }
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         if(Console.getConsole().isScrollThumbDragging)
         {
            return;
         }
         if(this._isDragging)
         {
            this.stopDraggingGroup();
         }
         else
         {
            this.showControl();
         }
         dispatchEvent(new StageControlEvent(StageControlEvent.ASSET_DRAG_COMPLETE));
      }
      
      private function rollOutHandler(param1:MouseEvent) : void
      {
         if(this._isDragging)
         {
            this.stopDraggingGroup();
         }
         dispatchEvent(new StageControlEvent(StageControlEvent.ASSET_DRAG_COMPLETE));
      }
      
      private function stopDraggingGroup() : void
      {
         if(this._isDragging)
         {
            this._isDragging = false;
            removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
            if(!this._mouseDown.equals(new Point(mouseX,mouseY)))
            {
               this._moveCommand.execute();
            }
            this.guideVisble = false;
            this.showControl();
         }
      }
      
      private function moveGroup(param1:Number, param2:Number) : void
      {
         this._moveCommand = new MoveObjectCommand(this._controller as IMovable);
         this._moveCommand.execute();
         this.updateOriginalAssetPosition();
         this.movingGroup(param1,param2);
      }
      
      private function movingGroup(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         var _loc4_:Point = null;
         if(this._controller is IMovable)
         {
            _loc4_ = new Point(this._oldPos.x + param1,this._oldPos.y + param2);
            if(this._snapTool)
            {
               this.guideVisble = false;
               if(param3)
               {
                  this._snapTool.snapPoint(_loc4_);
                  param1 = _loc4_.x - this._oldPos.x;
                  param2 = _loc4_.y - this._oldPos.y;
               }
            }
            IMovable(this._controller).move(_loc4_.x,_loc4_.y);
         }
         if(this._controller is IReferencePoint)
         {
            IReferencePoint(this._controller).setReferencePoint(this._oldRef.x + param1,this._oldRef.y + param2);
         }
      }
      
      public function showControl() : void
      {
         var _loc1_:IAssetView = null;
         if(this._selection.length == 1)
         {
            _loc1_ = this._selection.selectedAsset;
            if(!(_loc1_.asset is Background))
            {
               if(_loc1_ is IPlayable)
               {
                  IPlayable(_loc1_).pause();
               }
               this.showControlBox();
               this.showButtonBar();
            }
         }
         else if(this._selection.length > 1)
         {
            this.showControlBox();
            this.showButtonBar();
         }
         else
         {
            this.hideButtonBar();
            this.hideControlBox();
         }
         if(this._selection.containsBubbleViewOnly)
         {
            this._console.showOverTray(true,this._controller);
         }
         else if(this._selection.length == 0)
         {
            if(this._backgroundSelected)
            {
               this._console.showOverTray(true,this._sceneModel);
               this._backgroundSelected = false;
            }
            else
            {
               this._console.showOverTray(false);
            }
         }
         else if(this._selection.length > 1)
         {
            this._console.showOverTray(true,this._selection);
         }
         else
         {
            this._console.showOverTray(this._selection.selectedAsset != null);
         }
      }
      
      public function hideControl() : void
      {
         this.hideButtonBar();
         this.hideControlBox();
      }
      
      public function hideControlBox() : void
      {
         this.controlBox.visible = false;
         if(this.motionControl)
         {
            this.motionControl.visible = false;
         }
      }
      
      private function showControlBox() : void
      {
         if(!this.controlBox.visible)
         {
            if(this.controlBox.target == this.view.getCameraView())
            {
               if(this.view.cameraLayer.alpha != 0)
               {
                  this.controlBox.visible = true;
                  this.motionControl.visible = true;
               }
            }
            else
            {
               this.controlBox.visible = true;
               this.motionControl.visible = true;
            }
         }
      }
      
      public function showMotionControl() : void
      {
         this.motionControl.visible = true;
      }
      
      public function updateControl() : void
      {
         this.updateControlBox();
         this.updateButtonBar();
      }
      
      private function updateControlBox() : void
      {
         var _loc3_:Asset = null;
         var _loc1_:IAssetView = this._selection.selectedAsset;
         if(this._selection.length > 1)
         {
            this.controlBox.target = this._selection;
         }
         else if(_loc1_)
         {
            this.controlBox.target = _loc1_;
         }
         else
         {
            this.controlBox.target = null;
         }
         var _loc2_:AssetCollectionController = AssetControllerFactory.getCollectionController(this._selection);
         _loc2_.viewCollection = this._selection;
         if(this._selection.length > 1)
         {
            this.motionControl.target = _loc2_;
         }
         else if(this._selection.selectedAsset)
         {
            _loc3_ = this._selection.selectedAsset.asset;
            this.motionControl.target = _loc3_;
         }
         else
         {
            this.motionControl.target = null;
         }
      }
      
      private function showButtonBar() : void
      {
         this._console.mainStage.showButtonBar();
      }
      
      private function updateButtonBar() : void
      {
         this._console.mainStage.updateButtonBar();
      }
      
      public function getBackgroundAssetView() : IAssetView
      {
         return this.view.view.getBackgroundAssetView();
      }
      
      public function getCameraAssetView() : IAssetView
      {
         return this.view.getCameraView();
      }
      
      public function setCameraAsTarget() : void
      {
         this._lastControlBoxTarget = this._selection.selectedAsset;
         var _loc1_:IAssetView = this.view.getCameraView();
         var _loc2_:Asset = _loc1_.asset;
         this.controlBox.target = _loc1_;
         this.motionControl.target = _loc2_;
      }
      
      public function showCameraControlBox() : void
      {
         this.setCameraAsTarget();
         this.showControlBox();
      }
      
      public function showSelectedAssetControlBox() : void
      {
         this.controlBox.target = this._lastControlBoxTarget;
         this.motionControl.target = !!this._lastControlBoxTarget?this._lastControlBoxTarget.asset:null;
         if(this.controlBox.target && this.controlBox.target is IAssetView && IAssetView(this.controlBox.target).asset)
         {
            this.showControlBox();
         }
      }
      
      protected function motionControl_shadowMoveStartHandler(param1:AssetEvent) : void
      {
         if(this._tutorialCharacter && param1.asset == this._tutorialCharacter)
         {
            this._tutorialManager.tutorialLayer.sceneProxyMode = true;
         }
      }
      
      protected function motionControl_shadowMovedHandler(param1:AssetEvent) : void
      {
         if(this._tutorialCharacter && param1.asset == this._tutorialCharacter)
         {
            this._tutorialManager.notifyTutorialAction("tutorial_char_move");
            this._tutorialManager.tutorialLayer.sceneProxyMode = false;
         }
      }
      
      public function toggleReferencePoint() : void
      {
         this._showReferencePoint = !this._showReferencePoint;
         this.controlBox.showReferencePoint = this._showReferencePoint;
         this.motionControl.showReferencePoint = this._showReferencePoint;
      }
      
      public function get showReferencePoint() : Boolean
      {
         return this._showReferencePoint;
      }
      
      public function get sceneView() : SceneView
      {
         return this.view.view;
      }
      
      private function _SceneEditor_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SceneEditor_Rect1_c()];
         _loc1_.id = "visualStageArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.visualStageArea = _loc1_;
         BindingManager.executeBindings(this,"visualStageArea",this.visualStageArea);
         return _loc1_;
      }
      
      private function _SceneEditor_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SceneEditor_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneEditor_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _SceneEditor_ScenePreview1_i() : ScenePreview
      {
         var _loc1_:ScenePreview = new ScenePreview();
         _loc1_.id = "view";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.view = _loc1_;
         BindingManager.executeBindings(this,"view",this.view);
         return _loc1_;
      }
      
      private function _SceneEditor_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mouseEnabled = false;
         _loc1_.initialized(this,"maskLayer");
         this.maskLayer = _loc1_;
         BindingManager.executeBindings(this,"maskLayer",this.maskLayer);
         return _loc1_;
      }
      
      private function _SceneEditor_AssetControlBox1_i() : AssetControlBox
      {
         var _loc1_:AssetControlBox = new AssetControlBox();
         _loc1_.visible = false;
         _loc1_.id = "controlBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.controlBox = _loc1_;
         BindingManager.executeBindings(this,"controlBox",this.controlBox);
         return _loc1_;
      }
      
      private function _SceneEditor_AssetMotionControl1_i() : AssetMotionControl
      {
         var _loc1_:AssetMotionControl = new AssetMotionControl();
         _loc1_.addEventListener("shadowMoveStart",this.__motionControl_shadowMoveStart);
         _loc1_.addEventListener("shadowMoved",this.__motionControl_shadowMoved);
         _loc1_.id = "motionControl";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.motionControl = _loc1_;
         BindingManager.executeBindings(this,"motionControl",this.motionControl);
         return _loc1_;
      }
      
      public function __motionControl_shadowMoveStart(param1:AssetEvent) : void
      {
         this.motionControl_shadowMoveStartHandler(param1);
      }
      
      public function __motionControl_shadowMoved(param1:AssetEvent) : void
      {
         this.motionControl_shadowMovedHandler(param1);
      }
      
      private function _SceneEditor_SceneAlignGuide1_i() : SceneAlignGuide
      {
         var _loc1_:SceneAlignGuide = new SceneAlignGuide();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "guideLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.guideLayer = _loc1_;
         BindingManager.executeBindings(this,"guideLayer",this.guideLayer);
         return _loc1_;
      }
      
      private function _SceneEditor_AssetSelectionTool1_i() : AssetSelectionTool
      {
         var _loc1_:AssetSelectionTool = new AssetSelectionTool();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "selectionTool";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectionTool = _loc1_;
         BindingManager.executeBindings(this,"selectionTool",this.selectionTool);
         return _loc1_;
      }
      
      public function ___SceneEditor_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _SceneEditor_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_WIDTH + AnimeConstants.STAGE_PADDING * 2;
         },null,"this.width");
         result[1] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_HEIGHT + AnimeConstants.STAGE_PADDING * 2;
         },null,"this.height");
         result[2] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_PADDING;
         },null,"view.x");
         result[3] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_PADDING;
         },null,"view.y");
         result[4] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_PADDING;
         },null,"controlBox.x");
         result[5] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_PADDING;
         },null,"controlBox.y");
         result[6] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_PADDING;
         },null,"motionControl.x");
         result[7] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_PADDING;
         },null,"motionControl.y");
         result[8] = new Binding(this,function():SceneEditor
         {
            return this;
         },null,"selectionTool.sceneEditor");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get controlBox() : AssetControlBox
      {
         return this._637388590controlBox;
      }
      
      public function set controlBox(param1:AssetControlBox) : void
      {
         var _loc2_:Object = this._637388590controlBox;
         if(_loc2_ !== param1)
         {
            this._637388590controlBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get guideLayer() : SceneAlignGuide
      {
         return this._47458229guideLayer;
      }
      
      public function set guideLayer(param1:SceneAlignGuide) : void
      {
         var _loc2_:Object = this._47458229guideLayer;
         if(_loc2_ !== param1)
         {
            this._47458229guideLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"guideLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maskLayer() : SpriteVisualElement
      {
         return this._69905979maskLayer;
      }
      
      public function set maskLayer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._69905979maskLayer;
         if(_loc2_ !== param1)
         {
            this._69905979maskLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get motionControl() : AssetMotionControl
      {
         return this._367936711motionControl;
      }
      
      public function set motionControl(param1:AssetMotionControl) : void
      {
         var _loc2_:Object = this._367936711motionControl;
         if(_loc2_ !== param1)
         {
            this._367936711motionControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"motionControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionTool() : AssetSelectionTool
      {
         return this._1039444292selectionTool;
      }
      
      public function set selectionTool(param1:AssetSelectionTool) : void
      {
         var _loc2_:Object = this._1039444292selectionTool;
         if(_loc2_ !== param1)
         {
            this._1039444292selectionTool = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionTool",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get view() : ScenePreview
      {
         return this._3619493view;
      }
      
      public function set view(param1:ScenePreview) : void
      {
         var _loc2_:Object = this._3619493view;
         if(_loc2_ !== param1)
         {
            this._3619493view = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"view",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get visualStageArea() : Group
      {
         return this._380705099visualStageArea;
      }
      
      public function set visualStageArea(param1:Group) : void
      {
         var _loc2_:Object = this._380705099visualStageArea;
         if(_loc2_ !== param1)
         {
            this._380705099visualStageArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visualStageArea",_loc2_,param1));
            }
         }
      }
   }
}
