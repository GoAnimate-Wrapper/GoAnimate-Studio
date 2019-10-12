package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.events.TimelineEvent;
   import anifire.studio.events.TutorialEvent;
   import anifire.studio.interfaces.ITimelineMenuSource;
   import anifire.studio.managers.SceneLengthController;
   import anifire.studio.managers.SceneThumbnailManager;
   import anifire.studio.managers.SoundCollectionController;
   import anifire.studio.managers.TimelineController;
   import anifire.studio.managers.TutorialManager;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilUser;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.managers.DragManager;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.filters.DropShadowFilter;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class Timeline extends Group implements IBindingClient
   {
      
      public static const SCENE:String = "scene";
      
      public static const SOUND:String = "sound";
      
      public static const BBAR:String = "bbar";
      
      public static const BITMAP:String = "bitmap";
      
      public static const BLANK:String = "blank";
      
      public static const SCENECONTAINER_VISUAL_HEIGHT:int = 70;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1336746749_maskCanvas:Rect;
      
      private var _362247270_timelineScrollbar:TimelineHScrollBar;
      
      private var _684863166autoScrollDetector:AutoScrollGroup;
      
      private var _790224346musicTrack:SoundTrackArea;
      
      private var _108873974ruler:TimelineRuler;
      
      private var _1989488981sceneContainer:SceneContainer;
      
      private var _65731834scrollArea:Group;
      
      private var _1956980552shadowFilter:DropShadowFilter;
      
      private var _1385617962soundTrackScroller:Scroller;
      
      private var _1353634029starterRect:Rect;
      
      private var _1058085932timelineActiveArea:Group;
      
      private var _1140124837toolBar:TimelineToolBar;
      
      private var _1525084359voiceTrack:SoundTrackArea;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const SCENECONTAINER_HEIGHT:int = 187;
      
      private const BBARCONTAINER_HEIGHT:int = 25;
      
      private const HSCROLLBAR_HEIGHT:int = 22;
      
      private var _totalSceneCount:Number = 0;
      
      private var _currBgStartIndex:Number = 0;
      
      private var _sceneLengthController:SceneLengthController;
      
      private var _showWaveform:Boolean = false;
      
      private var _timelineController:TimelineController;
      
      private var _collapsed:Boolean = false;
      
      private var _scrollPosition:Number;
      
      private var _scrollContentHeight:Number;
      
      private var _tutorialManager:TutorialManager;
      
      private var _processingStarter:Boolean;
      
      public var disableScenePopUpMenu:Boolean;
      
      public var activeMenuItem:ITimelineMenuSource;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function Timeline()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._tutorialManager = TutorialManager.instance;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._Timeline_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_TimelineWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return Timeline[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 206;
         this.mxmlContent = [this._Timeline_Rect1_c(),this._Timeline_Group2_c(),this._Timeline_Rect5_i()];
         this._Timeline_DropShadowFilter1_i();
         this.addEventListener("creationComplete",this.___Timeline_Group1_creationComplete);
         this.addEventListener("resize",this.___Timeline_Group1_resize);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         Timeline._watcherSetupUtil = param1;
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
      public function get processingStarter() : Boolean
      {
         return this._processingStarter;
      }
      
      private function set _581770748processingStarter(param1:Boolean) : void
      {
         if(this._processingStarter != param1)
         {
            this._processingStarter = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollContentHeight() : Number
      {
         return this._scrollContentHeight;
      }
      
      private function set _1552494899scrollContentHeight(param1:Number) : void
      {
         this._scrollContentHeight = param1;
      }
      
      public function get showWaveform() : Boolean
      {
         return this._showWaveform;
      }
      
      public function get sceneLengthController() : SceneLengthController
      {
         return this._sceneLengthController;
      }
      
      public function set sceneLengthController(param1:SceneLengthController) : void
      {
         this._sceneLengthController = param1;
      }
      
      public function get currBgStartIndex() : Number
      {
         return this._currBgStartIndex;
      }
      
      private function initApp() : void
      {
         this._timelineScrollbar.addContainerToScrollBar(this.sceneContainer as SceneContainer);
         this.sceneContainer.disableFocus();
         this.sceneContainer.setTimelineReferer(this);
         this.voiceTrack.setTimelineReferer(this);
         this.musicTrack.setTimelineReferer(this);
         this.voiceTrack.addEventListener(TimelineEvent.SOUND_MOUSE_UP,this.soundMouseUpHandler);
         this.musicTrack.addEventListener(TimelineEvent.SOUND_MOUSE_UP,this.soundMouseUpHandler);
         this.sceneContainer.addEventListener(TimelineEvent.SCENE_MOUSE_DOWN,this.onSceneMouseDownHandler);
         this.sceneContainer.addEventListener(TimelineEvent.SCENE_MOUSE_UP,this.onSceneMouseUpHandler);
         this.sceneLengthController = new SceneLengthController();
         this.sceneLengthController.setTimelineReferer(this);
         if(UtilUser.hasAdminFeatures)
         {
            this.autoScrollDetector.scrollBar = this._timelineScrollbar;
         }
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_START,this.onTutorialStart);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_SKIP,this.onTutorialSkip);
         this._tutorialManager.addEventListener(TutorialEvent.TUTORIAL_COMPLETE,this.onTutorialComplete);
      }
      
      public function set soundsController(param1:SoundCollectionController) : void
      {
         this.musicTrack.soundsController = param1;
      }
      
      public function set voicesController(param1:SoundCollectionController) : void
      {
         this.voiceTrack.soundsController = param1;
      }
      
      public function set timelineController(param1:TimelineController) : void
      {
         if(this._timelineController != param1)
         {
            if(this._timelineController)
            {
               this._timelineController.removeEventListener(TimelineEvent.SCENE_DURATION_CHANGE,this.onTimelineSceneDurationChange);
            }
            this._timelineController = param1;
            if(this._timelineController)
            {
               this._timelineController.addEventListener(TimelineEvent.SCENE_DURATION_CHANGE,this.onTimelineSceneDurationChange);
            }
         }
      }
      
      public function setCurrentSceneByIndex(param1:int) : void
      {
         if(this.sceneContainer is SceneContainer)
         {
            SceneContainer(this.sceneContainer).setCurrentItemByIndex(param1);
         }
      }
      
      public function addScene(param1:String, param2:String = "bitmap", param3:Number = 0, param4:AnimeScene = null, param5:int = -1) : SceneElement
      {
         if(param3 == -1)
         {
            AnimeConstants.SCENE_LENGTH_DEFAULT;
         }
         var _loc6_:SceneElement = new SceneElement();
         _loc6_.scene = param4;
         _loc6_.id = param1;
         _loc6_.label = String(++this._totalSceneCount);
         _loc6_.width = param3;
         _loc6_.setWaveformVisible(this._showWaveform);
         var _loc7_:int = SceneContainer(this.sceneContainer).length;
         if(param5 >= 0)
         {
            this.sceneContainer.addItemAt(_loc6_,param5);
            this.updateAllScenesLabel();
         }
         else
         {
            this.sceneContainer.addItem(_loc6_);
         }
         Console.getConsole().refreshAllSpeechText();
         var _loc8_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_UPDATED);
         dispatchEvent(_loc8_);
         return _loc6_;
      }
      
      public function removeScene(param1:int = -1) : void
      {
         var _loc2_:int = 0;
         if(param1 < 0)
         {
            _loc2_ = this.sceneContainer.getCurrIndex();
         }
         else
         {
            _loc2_ = param1;
         }
         if(this.sceneContainer.removeItem(param1))
         {
            this.updateAllScenesLabel();
            this._totalSceneCount--;
         }
         Console.getConsole().refreshAllSpeechText();
         var _loc3_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_UPDATED);
         dispatchEvent(_loc3_);
      }
      
      public function getAllSceneWidth() : Number
      {
         return UtilUnitConvert.frameToPixel(this._timelineController.movieTotalFrame);
      }
      
      public function moveScene(param1:Number, param2:Number) : void
      {
         var _loc4_:TimelineEvent = null;
         var _loc3_:SceneElement = this.getSceneElementByIndex(param1);
         if(_loc3_)
         {
            this.sceneContainer.removeItem(param1);
            if(param1 < param2)
            {
               this.sceneContainer.addItemAt(_loc3_,param2 - 1);
            }
            else
            {
               this.sceneContainer.addItemAt(_loc3_,param2);
            }
            this.updateAllScenesLabel();
            _loc4_ = new TimelineEvent(TimelineEvent.SCENE_UPDATED);
            dispatchEvent(_loc4_);
         }
      }
      
      public function removeAllScenes() : void
      {
         this._totalSceneCount = 0;
         this.sceneContainer.removeAllItems();
         this.scroll(0);
         Console.getConsole().refreshAllSpeechText();
         var _loc1_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_UPDATED);
         dispatchEvent(_loc1_);
      }
      
      public function getSceneImageBitmapByIndex(param1:int) : BitmapData
      {
         var _loc2_:SceneElement = this.sceneContainer.getItemAt(param1) as SceneElement;
         if(_loc2_)
         {
            return _loc2_.source;
         }
         return null;
      }
      
      public function updateSceneImageByBitmapData(param1:int, param2:BitmapData) : void
      {
         var update:Boolean = false;
         var bd:BitmapData = null;
         var index:int = param1;
         var bitmapData:BitmapData = param2;
         try
         {
            if(bitmapData)
            {
               if(index < 0)
               {
                  index = this.sceneContainer.getCurrIndex();
               }
               update = true;
               bd = this.getSceneImageBitmapByIndex(index);
               if(bd && bd.compare(bitmapData) == 0)
               {
                  update = false;
               }
               if(update)
               {
                  this.sceneContainer.changeProperty(index,"source",bitmapData);
               }
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().error("Timeline::updateSceneImageByBitmapData" + e);
            return;
         }
      }
      
      public function updateSceneThumbnail(param1:SceneThumbnailManager, param2:AnimeScene, param3:int) : void
      {
         this.captureSceneThumbnailImpl(param1,param2,param3);
      }
      
      private function captureSceneThumbnailImpl(param1:SceneThumbnailManager, param2:AnimeScene, param3:int) : void
      {
         var _loc4_:BitmapData = param1.captureDefaultThumbnail(param2);
         this.updateSceneImageByBitmapData(param3,_loc4_);
      }
      
      public function updateSceneLength(param1:Number = 100, param2:int = -1, param3:Boolean = false) : void
      {
         if(param2 < 0)
         {
            param2 = this.sceneContainer.getCurrIndex();
         }
         this.sceneContainer.changeProperty(param2,"width",param1);
         var _loc4_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_UPDATED);
         dispatchEvent(_loc4_);
      }
      
      public function addSceneMotionTimeByIndex(param1:int = -1) : void
      {
         SceneContainer(this.sceneContainer).addSceneMotionTimeByIndex(param1);
      }
      
      public function removeSceneMotionTimeByIndex(param1:int = -1) : void
      {
         SceneContainer(this.sceneContainer).removeSceneMotionTimeByIndex(param1);
      }
      
      protected function getSceneElementByIndex(param1:int = -1) : SceneElement
      {
         if(param1 < 0)
         {
            param1 = this.sceneContainer.getCurrIndex();
         }
         return this.sceneContainer.getItemAt(param1) as SceneElement;
      }
      
      public function addSound(param1:AnimeSound) : void
      {
         var _loc2_:SoundContainer = null;
         if(param1)
         {
            _loc2_ = !!param1.isVoice?this.voiceTrack.addSound(param1):this.musicTrack.addSound(param1);
            if(_loc2_)
            {
               _loc2_.soundItem.setWaveformVisible(this._showWaveform);
               this._timelineScrollbar.addContainerToScrollBar(_loc2_);
               this.expand();
            }
            dispatchEvent(new TimelineEvent(TimelineEvent.SOUND_UPDATED));
            this._tutorialManager.notifyTutorialAction("add_sound");
         }
      }
      
      public function removeSoundById(param1:String) : void
      {
         this.voiceTrack.removeSoundById(param1);
         this.musicTrack.removeSoundById(param1);
         this._timelineScrollbar.removeSoundBar(param1);
         dispatchEvent(new TimelineEvent(TimelineEvent.SOUND_UPDATED));
      }
      
      public function removeAllSounds() : void
      {
         this.voiceTrack.removeAllSounds();
         this.musicTrack.removeAllSounds();
         this._timelineScrollbar.removeSoundBar(null,true);
         dispatchEvent(new TimelineEvent(TimelineEvent.SOUND_UPDATED));
      }
      
      public function getSceneLocalPosition(param1:Number) : Number
      {
         var _loc4_:Number = NaN;
         if(param1 < 0)
         {
            return 0;
         }
         var _loc2_:Array = SceneContainer(this.sceneContainer).getSceneBounds();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_].x;
            if(param1 < _loc4_)
            {
               return _loc2_[_loc3_ - 1].x;
            }
            _loc3_++;
         }
         return _loc2_[_loc3_ - 1].x;
      }
      
      public function getSceneLocalPositionByIndex(param1:Number) : Number
      {
         var _loc2_:Array = SceneContainer(this.sceneContainer).getSceneBounds();
         return _loc2_[param1].x;
      }
      
      public function getSceneLocalPositionIndex(param1:Number) : Number
      {
         var _loc4_:Number = NaN;
         if(param1 < 0)
         {
            return 0;
         }
         var _loc2_:Array = SceneContainer(this.sceneContainer).getSceneBounds();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_].x;
            if(param1 < _loc4_)
            {
               return _loc3_ - 1;
            }
            _loc3_++;
         }
         return _loc3_ - 1;
      }
      
      public function setLoadingStatus(param1:Boolean) : void
      {
         this._maskCanvas.visible = param1;
         this.mouseEnabled = this.mouseChildren = !param1;
      }
      
      public function updateSceneSpeechByIndex(param1:int, param2:String, param3:AnimeSound) : void
      {
         SceneContainer(this.sceneContainer).updateSpeechTxtByIndex(param1,param2,param3);
      }
      
      public function updateAllScenesLabel() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.sceneContainer.length)
         {
            this.sceneContainer.changeProperty(_loc1_,"label",_loc1_ + 1);
            _loc1_++;
         }
      }
      
      private function soundMouseUpHandler(param1:TimelineEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function onSceneMouseDownHandler(param1:TimelineEvent) : void
      {
         var _loc2_:Number = param1.index;
         var _loc3_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_MOUSE_DOWN,_loc2_,"");
         _loc3_.shiftKey = param1.shiftKey;
         dispatchEvent(_loc3_);
      }
      
      private function onSceneMouseUpHandler(param1:TimelineEvent) : void
      {
         var _loc2_:Number = this.sceneContainer.getCurrIndex();
         var _loc3_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_MOUSE_UP,_loc2_,"");
         _loc3_.shiftKey = param1.shiftKey;
         dispatchEvent(_loc3_);
         var _loc4_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_UPDATED);
         dispatchEvent(_loc4_);
      }
      
      public function startResizingScene(param1:AnimeScene, param2:int) : void
      {
         this._timelineController.startResizingScene(param1,param2);
      }
      
      public function resizingScene(param1:AnimeScene, param2:int) : Boolean
      {
         return this._timelineController.resizingScene(param1,param2);
      }
      
      public function endResizingScene(param1:AnimeScene, param2:int) : void
      {
         this._timelineController.endResizingScene(param1,param2);
         var _loc3_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_UPDATED);
         dispatchEvent(_loc3_);
      }
      
      private function onResize(param1:Event) : void
      {
         this.refreshInterface();
      }
      
      private function refreshInterface() : void
      {
      }
      
      public function triggerAllSoundTrackSize() : void
      {
         if(!this._collapsed)
         {
            this.collapse();
         }
         else
         {
            this.expand();
         }
      }
      
      public function triggerAllSoundWaveFormDisplay() : void
      {
         var _loc2_:SceneElement = null;
         this._showWaveform = !this._showWaveform;
         var _loc1_:uint = 0;
         this.voiceTrack.setWaveformVisible(this._showWaveform);
         this.musicTrack.setWaveformVisible(this._showWaveform);
         if(this.sceneContainer.length > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < this.sceneContainer.length)
            {
               _loc2_ = this.sceneContainer.getItemAt(_loc1_) as SceneElement;
               if(SceneElement)
               {
                  _loc2_.setWaveformVisible(this._showWaveform);
               }
               _loc1_++;
            }
         }
      }
      
      public function collapse() : void
      {
         if(!this._collapsed)
         {
            this.height = 126;
            this.scrollContentHeight = 72;
            this.toolBar.collapse();
            this._collapsed = true;
            dispatchEvent(new TimelineEvent(TimelineEvent.DISPLAY_MODE_CHANGE));
         }
      }
      
      public function expand() : void
      {
         if(this._collapsed)
         {
            this.height = 206;
            this.scrollContentHeight = 152;
            this.toolBar.expand();
            this._collapsed = false;
            dispatchEvent(new TimelineEvent(TimelineEvent.DISPLAY_MODE_CHANGE));
         }
      }
      
      public function scroll(param1:Number) : void
      {
         this._scrollPosition = param1;
         this.sceneContainer.scroll(param1);
         this.ruler.scroll(param1);
         this.musicTrack.scroll(param1);
         this.voiceTrack.scroll(param1);
      }
      
      public function get scrollPosition() : Number
      {
         return this._scrollPosition;
      }
      
      protected function onScrollAreaMouseMove(param1:MouseEvent) : void
      {
         if(UtilUser.hasAdminFeatures)
         {
            if(DragManager.isDragging && !this.autoScrollDetector.visible)
            {
               this.autoScrollDetector.visible = true;
               stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
            }
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         this.autoScrollDetector.visible = false;
      }
      
      protected function onTimelineSceneDurationChange(param1:TimelineEvent) : void
      {
         this._timelineScrollbar.updateScrollBar();
         var _loc2_:TimelineEvent = new TimelineEvent(TimelineEvent.SCENE_UPDATED);
         dispatchEvent(_loc2_);
      }
      
      protected function onToggleExpand() : void
      {
         this.triggerAllSoundTrackSize();
      }
      
      protected function onToggleWaveform() : void
      {
         this.triggerAllSoundWaveFormDisplay();
      }
      
      public function clearChildrenMenu() : void
      {
         if(this.activeMenuItem)
         {
            this.activeMenuItem.removeMenu();
            this.activeMenuItem = null;
         }
      }
      
      private function onTutorialStart(param1:TutorialEvent) : void
      {
         this.disableScenePopUpMenu = true;
      }
      
      private function onTutorialSkip(param1:TutorialEvent) : void
      {
         this.disableScenePopUpMenu = false;
      }
      
      private function onTutorialComplete(param1:TutorialEvent) : void
      {
         this.disableScenePopUpMenu = false;
      }
      
      public function enableSoundTrackScroller() : void
      {
         this.soundTrackScroller.setStyle("verticalScrollPolicy","auto");
      }
      
      private function _Timeline_DropShadowFilter1_i() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.angle = 90;
         _loc1_.color = 6710886;
         _loc1_.distance = 2;
         this.shadowFilter = _loc1_;
         BindingManager.executeBindings(this,"shadowFilter",this.shadowFilter);
         return _loc1_;
      }
      
      private function _Timeline_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._Timeline_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14936045;
         return _loc1_;
      }
      
      private function _Timeline_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._Timeline_Group3_c(),this._Timeline_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.height = 39;
         _loc1_.mxmlContent = [this._Timeline_Rect2_c(),this._Timeline_Line1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._Timeline_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14936045;
         return _loc1_;
      }
      
      private function _Timeline_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._Timeline_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13355733;
         _loc1_.weight = 3;
         return _loc1_;
      }
      
      private function _Timeline_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._Timeline_TimelineToolBar1_i(),this._Timeline_Group4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_TimelineToolBar1_i() : TimelineToolBar
      {
         var _loc1_:TimelineToolBar = new TimelineToolBar();
         _loc1_.width = 72;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("timelineToggleExpand",this.__toolBar_timelineToggleExpand);
         _loc1_.addEventListener("timelineToggleWaveform",this.__toolBar_timelineToggleWaveform);
         _loc1_.id = "toolBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toolBar = _loc1_;
         BindingManager.executeBindings(this,"toolBar",this.toolBar);
         return _loc1_;
      }
      
      public function __toolBar_timelineToggleExpand(param1:Event) : void
      {
         this.onToggleExpand();
      }
      
      public function __toolBar_timelineToggleWaveform(param1:Event) : void
      {
         this.onToggleWaveform();
      }
      
      private function _Timeline_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._Timeline_VGroup1_c(),this._Timeline_Rect4_i()];
         _loc1_.id = "timelineActiveArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timelineActiveArea = _loc1_;
         BindingManager.executeBindings(this,"timelineActiveArea",this.timelineActiveArea);
         return _loc1_;
      }
      
      private function _Timeline_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._Timeline_TimelineRuler1_i(),this._Timeline_Group5_i(),this._Timeline_TimelineHScrollBar1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Timeline_TimelineRuler1_i() : TimelineRuler
      {
         var _loc1_:TimelineRuler = new TimelineRuler();
         _loc1_.percentWidth = 100;
         _loc1_.height = 39;
         _loc1_.id = "ruler";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.ruler = _loc1_;
         BindingManager.executeBindings(this,"ruler",this.ruler);
         return _loc1_;
      }
      
      private function _Timeline_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._Timeline_Rect3_c(),this._Timeline_SceneContainer1_i(),this._Timeline_SoundTrackArea1_i(),this._Timeline_Scroller1_i(),this._Timeline_AutoScrollGroup1_i()];
         _loc1_.addEventListener("mouseMove",this.__scrollArea_mouseMove);
         _loc1_.id = "scrollArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scrollArea = _loc1_;
         BindingManager.executeBindings(this,"scrollArea",this.scrollArea);
         return _loc1_;
      }
      
      private function _Timeline_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._Timeline_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15988732;
         return _loc1_;
      }
      
      private function _Timeline_SceneContainer1_i() : SceneContainer
      {
         var _loc1_:SceneContainer = new SceneContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 152;
         _loc1_.id = "sceneContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sceneContainer = _loc1_;
         BindingManager.executeBindings(this,"sceneContainer",this.sceneContainer);
         return _loc1_;
      }
      
      private function _Timeline_SoundTrackArea1_i() : SoundTrackArea
      {
         var _loc1_:SoundTrackArea = new SoundTrackArea();
         _loc1_.percentWidth = 100;
         _loc1_.height = 42;
         _loc1_.y = 52;
         _loc1_.isVoiceTrack = true;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.id = "voiceTrack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.voiceTrack = _loc1_;
         BindingManager.executeBindings(this,"voiceTrack",this.voiceTrack);
         return _loc1_;
      }
      
      private function _Timeline_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.height = 60;
         _loc1_.y = 92;
         _loc1_.viewport = this._Timeline_SoundTrackArea2_i();
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "soundTrackScroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundTrackScroller = _loc1_;
         BindingManager.executeBindings(this,"soundTrackScroller",this.soundTrackScroller);
         return _loc1_;
      }
      
      private function _Timeline_SoundTrackArea2_i() : SoundTrackArea
      {
         var _loc1_:SoundTrackArea = new SoundTrackArea();
         _loc1_.percentWidth = 100;
         _loc1_.id = "musicTrack";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.musicTrack = _loc1_;
         BindingManager.executeBindings(this,"musicTrack",this.musicTrack);
         return _loc1_;
      }
      
      private function _Timeline_AutoScrollGroup1_i() : AutoScrollGroup
      {
         var _loc1_:AutoScrollGroup = new AutoScrollGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.id = "autoScrollDetector";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.autoScrollDetector = _loc1_;
         BindingManager.executeBindings(this,"autoScrollDetector",this.autoScrollDetector);
         return _loc1_;
      }
      
      public function __scrollArea_mouseMove(param1:MouseEvent) : void
      {
         this.onScrollAreaMouseMove(param1);
      }
      
      private function _Timeline_TimelineHScrollBar1_i() : TimelineHScrollBar
      {
         var _loc1_:TimelineHScrollBar = new TimelineHScrollBar();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_timelineScrollbar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._timelineScrollbar = _loc1_;
         BindingManager.executeBindings(this,"_timelineScrollbar",this._timelineScrollbar);
         return _loc1_;
      }
      
      private function _Timeline_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.top = 39;
         _loc1_.bottom = 0;
         _loc1_.fill = this._Timeline_SolidColor4_c();
         _loc1_.initialized(this,"starterRect");
         this.starterRect = _loc1_;
         BindingManager.executeBindings(this,"starterRect",this.starterRect);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15791611;
         _loc1_.alpha = 0.85;
         return _loc1_;
      }
      
      private function _Timeline_Rect5_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.fill = this._Timeline_SolidColor5_c();
         _loc1_.initialized(this,"_maskCanvas");
         this._maskCanvas = _loc1_;
         BindingManager.executeBindings(this,"_maskCanvas",this._maskCanvas);
         return _loc1_;
      }
      
      private function _Timeline_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function ___Timeline_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      public function ___Timeline_Group1_resize(param1:ResizeEvent) : void
      {
         this.onResize(param1);
      }
      
      private function _Timeline_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"scrollArea.height","scrollContentHeight");
         _loc1_[1] = new Binding(this,null,null,"starterRect.visible","processingStarter");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _maskCanvas() : Rect
      {
         return this._1336746749_maskCanvas;
      }
      
      public function set _maskCanvas(param1:Rect) : void
      {
         var _loc2_:Object = this._1336746749_maskCanvas;
         if(_loc2_ !== param1)
         {
            this._1336746749_maskCanvas = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_maskCanvas",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _timelineScrollbar() : TimelineHScrollBar
      {
         return this._362247270_timelineScrollbar;
      }
      
      public function set _timelineScrollbar(param1:TimelineHScrollBar) : void
      {
         var _loc2_:Object = this._362247270_timelineScrollbar;
         if(_loc2_ !== param1)
         {
            this._362247270_timelineScrollbar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_timelineScrollbar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get autoScrollDetector() : AutoScrollGroup
      {
         return this._684863166autoScrollDetector;
      }
      
      public function set autoScrollDetector(param1:AutoScrollGroup) : void
      {
         var _loc2_:Object = this._684863166autoScrollDetector;
         if(_loc2_ !== param1)
         {
            this._684863166autoScrollDetector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoScrollDetector",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get musicTrack() : SoundTrackArea
      {
         return this._790224346musicTrack;
      }
      
      public function set musicTrack(param1:SoundTrackArea) : void
      {
         var _loc2_:Object = this._790224346musicTrack;
         if(_loc2_ !== param1)
         {
            this._790224346musicTrack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"musicTrack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ruler() : TimelineRuler
      {
         return this._108873974ruler;
      }
      
      public function set ruler(param1:TimelineRuler) : void
      {
         var _loc2_:Object = this._108873974ruler;
         if(_loc2_ !== param1)
         {
            this._108873974ruler = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ruler",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sceneContainer() : SceneContainer
      {
         return this._1989488981sceneContainer;
      }
      
      public function set sceneContainer(param1:SceneContainer) : void
      {
         var _loc2_:Object = this._1989488981sceneContainer;
         if(_loc2_ !== param1)
         {
            this._1989488981sceneContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollArea() : Group
      {
         return this._65731834scrollArea;
      }
      
      public function set scrollArea(param1:Group) : void
      {
         var _loc2_:Object = this._65731834scrollArea;
         if(_loc2_ !== param1)
         {
            this._65731834scrollArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadowFilter() : DropShadowFilter
      {
         return this._1956980552shadowFilter;
      }
      
      public function set shadowFilter(param1:DropShadowFilter) : void
      {
         var _loc2_:Object = this._1956980552shadowFilter;
         if(_loc2_ !== param1)
         {
            this._1956980552shadowFilter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadowFilter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundTrackScroller() : Scroller
      {
         return this._1385617962soundTrackScroller;
      }
      
      public function set soundTrackScroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._1385617962soundTrackScroller;
         if(_loc2_ !== param1)
         {
            this._1385617962soundTrackScroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundTrackScroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get starterRect() : Rect
      {
         return this._1353634029starterRect;
      }
      
      public function set starterRect(param1:Rect) : void
      {
         var _loc2_:Object = this._1353634029starterRect;
         if(_loc2_ !== param1)
         {
            this._1353634029starterRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starterRect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timelineActiveArea() : Group
      {
         return this._1058085932timelineActiveArea;
      }
      
      public function set timelineActiveArea(param1:Group) : void
      {
         var _loc2_:Object = this._1058085932timelineActiveArea;
         if(_loc2_ !== param1)
         {
            this._1058085932timelineActiveArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timelineActiveArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolBar() : TimelineToolBar
      {
         return this._1140124837toolBar;
      }
      
      public function set toolBar(param1:TimelineToolBar) : void
      {
         var _loc2_:Object = this._1140124837toolBar;
         if(_loc2_ !== param1)
         {
            this._1140124837toolBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get voiceTrack() : SoundTrackArea
      {
         return this._1525084359voiceTrack;
      }
      
      public function set voiceTrack(param1:SoundTrackArea) : void
      {
         var _loc2_:Object = this._1525084359voiceTrack;
         if(_loc2_ !== param1)
         {
            this._1525084359voiceTrack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceTrack",_loc2_,param1));
            }
         }
      }
      
      public function set processingStarter(param1:Boolean) : void
      {
         var _loc2_:Object = this.processingStarter;
         if(_loc2_ !== param1)
         {
            this._581770748processingStarter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"processingStarter",_loc2_,param1));
            }
         }
      }
      
      public function set scrollContentHeight(param1:Number) : void
      {
         var _loc2_:Object = this.scrollContentHeight;
         if(_loc2_ !== param1)
         {
            this._1552494899scrollContentHeight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollContentHeight",_loc2_,param1));
            }
         }
      }
   }
}
