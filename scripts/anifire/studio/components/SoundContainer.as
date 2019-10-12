package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.event.ExtraDataEvent;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.studio.commands.AddDefaultSoundFadingCommand;
   import anifire.studio.commands.AttachVoiceToScene;
   import anifire.studio.commands.ChangeVolumeCommand;
   import anifire.studio.commands.DettachSoundCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.MoveSoundCommand;
   import anifire.studio.commands.RemoveSoundCommand;
   import anifire.studio.commands.RemoveSoundFadingCommand;
   import anifire.studio.commands.RemoveSpeechCommand;
   import anifire.studio.commands.SplitSoundCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.sound.AnimeSoundEvent;
   import anifire.studio.core.sound.ISoundable;
   import anifire.studio.core.sound.SoundCollectionMemento;
   import anifire.studio.events.MenuItemEvent;
   import anifire.studio.interfaces.ITimelineContainer;
   import anifire.studio.interfaces.ITimelineElement;
   import anifire.studio.interfaces.ITimelineMenuSource;
   import anifire.studio.managers.SoundCollectionController;
   import anifire.studio.managers.SoundPlaybackManager;
   import anifire.studio.managers.StudioDragManager;
   import anifire.studio.models.MenuItemModel;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.DragSource;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.managers.CursorManager;
   import mx.managers.DragManager;
   import mx.states.State;
   import spark.components.Group;
   import spark.events.PopUpEvent;
   import spark.formatters.NumberFormatter;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SoundContainer extends Group implements ITimelineContainer, ITimelineMenuSource, IBindingClient, IStateClient2
   {
      
      public static const PERCENTAGE_SYMBOL:String = "%";
      
      public static const SOUNDCONTAINER_HEIGHT:int = 18;
      
      private static const MAX_WIDTH:Number = 90000;
      
      private static const CURSOR_LINE_OFFSET:int = 2;
      
      private static const OVERLAP_WARNING_FOR_LIP_SYNC:String = "Oh. Voice clips are overlapping. Lip-sync is disabled. You can drag them around if needed.";
      
      private static const OVERLAP_WARNING_FOR_SOUND:String = "You cannot have more than 3 audio clips overlap";
      
      private static const OVERLAP_WARNING_FOR_VOICE:String = "You cannot have more than 2 voice clips overlap";
      
      private static var _lastoverlapReminderAnchor:PopUpAnchor;
      
      private static const imgResize:Class = SoundContainer_imgResize;
      
      private static const MENU_LABEL_PLAY_SOUND:String = "Play";
      
      private static const MENU_LABEL_PLAY_SOUND_AT:String = "playSoundAt";
      
      private static const MENU_LABEL_STOP_SOUND:String = "Stop";
      
      private static const MENU_LABEL_REMOVE_SOUND:String = "Remove";
      
      private static const MENU_LABEL_DUPLICATE_SOUND:String = "Duplicate";
      
      private static const MENU_LABEL_SPLIT_SOUND:String = "Split";
      
      private static const ACTION_DUPLICATE_SOUND:String = "ACTION_DUPLICATE_SOUND";
      
      private static const ACTION_SPLIT_SOUND:String = "actionSplitSound";
      
      private static const ACTION_ATTACH_SCENE:String = "attachScene";
      
      private static const ACTION_ADD_DEFAULT_FADING:String = "addDefaultFading";
      
      private static const ACTION_REMOVE_FADING:String = "removeFading";
      
      private static const ACTION_SHOW_ADVANCED_FADING_SETTINGS:String = "showAdvancedFadingSettings";
      
      private static const MENU_LABEL_SOUND_LENGTH:String = "timeline_duration";
      
      private static const MENU_LABEL_SOUND_LENGTH_1:String = "timeline_1sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_2:String = "timeline_2sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_5:String = "timeline_5sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_10:String = "timeline_10sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_20:String = "timeline_20sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_30:String = "timeline_30sc";
      
      private static const MENU_LABEL_SOUND_LENGTH_FULL:String = "timeline_allsc";
      
      private static const MENU_LABEL_SOUND_LENGTH_RESET:String = "timeline_reset";
      
      private static const MENU_LABEL_SOUND_VOLUME:String = "timeline_volume";
      
      private static const MENU_LABEL_SOUND_VOLUME_LEVEL:String = "Volume Level:";
      
      private static const MENU_LABEL_SOUND_VOLUME_0:String = "0%";
      
      private static const MENU_LABEL_SOUND_VOLUME_10:String = "10%";
      
      private static const MENU_LABEL_SOUND_VOLUME_25:String = "25%";
      
      private static const MENU_LABEL_SOUND_VOLUME_50:String = "50%";
      
      private static const MENU_LABEL_SOUND_VOLUME_75:String = "75%";
      
      private static const MENU_LABEL_SOUND_VOLUME_100:String = "100%";
      
      private static const MENU_LABEL_SOUND_VOLUME_200:String = "200%";
      
      private static const MENU_LABEL_SOUND_VOLUME_300:String = "300%";
      
      private static const MENU_LABEL_SOUND_VOLUME_400:String = "400%";
      
      private static const MENU_LABEL_SOUND_VOLUME_800:String = "800%";
      
      private static const MENU_LABEL_ADD_DEFAULT_FADING:String = "Add Default Fading";
      
      private static const MENU_LABEL_REMOVE_FADING:String = "Remove Fading";
      
      private static const MENU_LABEL_ADVANCED_FADING_SETTINGS:String = "Advanced Settings...";
      
      private static const MENU_LABEL_DETACH_FROM_SCENE:String = "Detach from scene";
      
      private static const MENU_LABEL_ATTACH_TO_SCENE:String = "Attach to scene";
      
      private static const imgDuration:Class = SoundContainer_imgDuration;
      
      private static const imgPause:Class = SoundContainer_imgPause;
      
      private static const imgPlay:Class = SoundContainer_imgPlay;
      
      private static const imgPlayAt:Class = SoundContainer_imgPlayAt;
      
      private static const imgCopy:Class = SoundContainer_imgCopy;
      
      private static const imgSplit:Class = SoundContainer_imgSplit;
      
      private static const imgRemove:Class = SoundContainer_imgRemove;
      
      private static const imgVolume:Class = SoundContainer_imgVolume;
      
      private static const imgAttach:Class = SoundContainer_imgAttach;
      
      private static const imgDettach:Class = SoundContainer_imgDettach;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _87333994cursorLine:Line;
      
      private var _815023779dragHandleLeft:Group;
      
      private var _498405632dragHandleRight:Group;
      
      private var _1131896221menuDisplay:PopUpAnchor;
      
      private var _1694718446overlapReminderAnchor:PopUpAnchor;
      
      private var _1326088983playPositionMarker:Line;
      
      private var _1450429865playTimeFormatter:NumberFormatter;
      
      private var _1812817726soundItem:SoundElement;
      
      private var _1812712690soundMenu:MenuItemList;
      
      private var _1725759603soundWarning:SoundWarning;
      
      private var _482586504toolTipAnchor:PopUpAnchor;
      
      private var _459096927toolTipDisplay:TimelineToolTip;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _soundReady:Boolean;
      
      private var _enableFocus:Boolean = true;
      
      private var _id:String;
      
      private var _toolTipTimer:Timer;
      
      private var _timelineControl:Timeline;
      
      private var _oldSoundPos:Point;
      
      private var _oldStartFrame:int;
      
      private var _oldTotalFrame:int;
      
      private var _oldTrackNum:int;
      
      private var _oldSoundMemento:SoundCollectionMemento;
      
      private var _items:Array;
      
      private var _focus:Boolean;
      
      private var _itemsCollect:ArrayCollection;
      
      private var _currItem:ITimelineElement;
      
      private var _currDraggedControl:UIComponent;
      
      private var _soundsController:SoundCollectionController;
      
      private var _animeSound:AnimeSound;
      
      private var _command:MoveSoundCommand;
      
      private var _mouseDown:Point;
      
      private var isResizing:Boolean;
      
      private var cursorID:int = -1;
      
      private var isArrowCursor:Boolean;
      
      private var onArrow:Boolean;
      
      private var _1552968411_leftControlVisible:Boolean = true;
      
      private var _1408890158_rightControlVisible:Boolean = true;
      
      private var _resizable:Boolean = true;
      
      private var _selected:Boolean;
      
      private var _overlapReminderShown:Boolean;
      
      protected var _fadingPopUp:SoundFadingPopUp;
      
      protected var playPositionItem:MenuItemModel;
      
      protected var splitSoundItem:MenuItemModel;
      
      protected var attachSceneItem:MenuItemModel;
      
      protected var clearMarkerItem:MenuItemModel;
      
      protected var durationMenu:MenuItemModel;
      
      protected var durationItems:ArrayCollection;
      
      protected var volumeItems:ArrayCollection;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundContainer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._toolTipTimer = new Timer(200,1);
         this._oldSoundPos = new Point();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundContainer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SoundContainerWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundContainer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 10;
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._SoundContainer_PopUpAnchor1_i(),this._SoundContainer_PopUpAnchor2_i(),this._SoundContainer_SoundElement1_i(),this._SoundContainer_PopUpAnchor3_i(),this._SoundContainer_Group2_i(),this._SoundContainer_Group3_i(),this._SoundContainer_Line1_i(),this._SoundContainer_Line2_i()];
         this.currentState = "normal";
         this._SoundContainer_NumberFormatter1_i();
         this.addEventListener("creationComplete",this.___SoundContainer_Group1_creationComplete);
         this.addEventListener("rollOver",this.___SoundContainer_Group1_rollOver);
         this.addEventListener("rollOut",this.___SoundContainer_Group1_rollOut);
         this.addEventListener("mouseMove",this.___SoundContainer_Group1_mouseMove);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[]
         }),new State({
            "name":"invalid",
            "overrides":[]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundContainer._watcherSetupUtil = param1;
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
      
      public function get soundReady() : Boolean
      {
         return this._soundReady;
      }
      
      public function set soundReady(param1:Boolean) : void
      {
         this._soundReady = param1;
      }
      
      public function get animeSound() : AnimeSound
      {
         return this._animeSound;
      }
      
      public function set animeSound(param1:AnimeSound) : void
      {
         if(this._animeSound != param1)
         {
            if(this._animeSound)
            {
               this._animeSound.removeEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.TRIMMED_START_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.TRIMMED_END_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.TRACK_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.removeEventListener(AnimeSoundEvent.OVERLAP_CHANGE,this.onAnimeSoundChange);
            }
            this._animeSound = param1;
            if(this._animeSound)
            {
               this._animeSound.soundContainer = this;
               this.id = this._animeSound.getID();
               this.updateUI();
               this._animeSound.addEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.addEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.addEventListener(AnimeSoundEvent.TRIMMED_START_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.addEventListener(AnimeSoundEvent.TRIMMED_END_FRAME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.addEventListener(AnimeSoundEvent.TRACK_CHANGE,this.onAnimeSoundChange);
               this._animeSound.addEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.onAnimeSoundChange);
               this._animeSound.addEventListener(AnimeSoundEvent.OVERLAP_CHANGE,this.onAnimeSoundChange);
            }
         }
         this.soundItem.animeSound = param1;
      }
      
      private function onAnimeSoundChange(param1:AnimeSoundEvent) : void
      {
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         if(this._animeSound)
         {
            if(this._animeSound.isVoice)
            {
               this._resizable = false;
            }
            else if(this._animeSound.isTrimmed)
            {
               this._resizable = false;
            }
            else
            {
               this._resizable = true;
            }
            this.x = UtilUnitConvert.frameToX(this._animeSound.startFrame);
            this.y = SoundTrackArea.trackToPixel(this._animeSound.trackNum);
            this.width = UtilUnitConvert.frameToPixel(this._animeSound.totalFrame);
            this._leftControlVisible = this._resizable && this.width > 20;
            this._rightControlVisible = this._resizable;
            this.updateToolTip();
            this.updateOverlapReminder();
         }
      }
      
      private function updateOverlapReminder() : void
      {
         if(!this._animeSound || !this.soundWarning || !this.overlapReminderAnchor)
         {
            return;
         }
         if(this._animeSound.overlap)
         {
            if(this._animeSound.scene)
            {
               this.soundWarning.hideArrow();
            }
            this.showOverlapReminder();
         }
         else
         {
            this.overlapReminderAnchor.displayPopUp = false;
         }
      }
      
      public function set soundsController(param1:SoundCollectionController) : void
      {
         this._soundsController = param1;
      }
      
      private function initApp() : void
      {
         this._items = new Array();
         this._itemsCollect = new ArrayCollection(this._items);
      }
      
      override public function get id() : String
      {
         return this._id;
      }
      
      override public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get focus() : Boolean
      {
         return this._focus;
      }
      
      public function get count() : int
      {
         return this._itemsCollect.length;
      }
      
      public function set focus(param1:Boolean) : void
      {
         this._focus = param1;
         if(this._focus && this._enableFocus)
         {
            styleName = "containerClicked";
            this.soundItem.focus = true;
         }
         else
         {
            styleName = "containerNormal";
            this.soundItem.focus = false;
         }
      }
      
      public function get inner_volume() : Number
      {
         if(this._animeSound)
         {
            return this._animeSound.volume;
         }
         return 1;
      }
      
      public function enableFocus() : void
      {
         this._enableFocus = true;
      }
      
      public function disableFocus() : void
      {
         this._enableFocus = false;
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
         this._timelineControl = param1;
      }
      
      public function setHorizontalView(param1:Number = 0) : void
      {
      }
      
      public function getHorizontalView() : Number
      {
         if(this._timelineControl)
         {
            return this._timelineControl.scrollPosition;
         }
         return 0;
      }
      
      private function onToolTipTimer(param1:TimerEvent) : void
      {
         this._toolTipTimer.stop();
         this.showToolTip();
      }
      
      private function showToolTip() : void
      {
         this.toolTipAnchor.displayPopUp = true;
         this.toolTipDisplay.warning = false;
         this.updateToolTip();
      }
      
      private function showWarning(param1:String) : void
      {
         this.toolTipAnchor.displayPopUp = true;
         this.toolTipDisplay.warning = true;
         this.toolTipDisplay.text = param1;
      }
      
      private function showOverlapReminder() : void
      {
         try
         {
            if(this._overlapReminderShown)
            {
               return;
            }
            if(_lastoverlapReminderAnchor)
            {
               _lastoverlapReminderAnchor.displayPopUp = false;
            }
            _lastoverlapReminderAnchor = this.overlapReminderAnchor;
            this.overlapReminderAnchor.displayPopUp = true;
            this.soundWarning.warning = true;
            this.soundWarning.text = UtilDict.translate(OVERLAP_WARNING_FOR_LIP_SYNC);
            this._overlapReminderShown = true;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function updateToolTip() : void
      {
         if(!this.toolTipDisplay.warning)
         {
            this.toolTipDisplay.text = this.getLabel();
         }
      }
      
      private function removeToolTip() : void
      {
         this._toolTipTimer.stop();
         this.toolTipAnchor.displayPopUp = false;
      }
      
      public function addItem(param1:UIComponent) : void
      {
      }
      
      public function addItemAt(param1:UIComponent, param2:int) : void
      {
      }
      
      public function removeItem(param1:Number = -1) : Boolean
      {
         return false;
      }
      
      public function removeAllItems() : void
      {
      }
      
      public function changeProperty(param1:int, param2:String, param3:* = null) : void
      {
      }
      
      public function getCurrItem() : ITimelineElement
      {
         return null;
      }
      
      public function getCurrIndex() : int
      {
         return 0;
      }
      
      public function getItemAt(param1:int) : ITimelineElement
      {
         return null;
      }
      
      public function getLabel() : String
      {
         var _loc1_:String = "";
         if(this.soundItem)
         {
            return this.soundItem.getLabel();
         }
         return _loc1_;
      }
      
      private function getGlobalPosition() : Point
      {
         var _loc1_:Point = this.contentToGlobal(new Point(0,0));
         if(_loc1_.x < 0)
         {
            _loc1_.x = 0;
         }
         return _loc1_;
      }
      
      private function onSoundElementDown(param1:MouseEvent) : void
      {
         this._mouseDown = new Point(param1.stageX,param1.stageY);
         if(this._animeSound)
         {
            this._oldStartFrame = this._animeSound.startFrame;
            this._oldTotalFrame = this._animeSound.totalFrame;
            this._oldTrackNum = this._animeSound.trackNum;
            this._command = new MoveSoundCommand(this._animeSound,this._soundsController.sounds);
         }
         if(this._soundsController.wrapEnabled)
         {
            this._oldSoundMemento = this._soundsController.sounds.memento;
            this._soundsController.refreshOrder(this._animeSound);
         }
         this.removeToolTip();
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
      }
      
      private function turnRed(param1:Boolean = true) : void
      {
         this.soundItem.displayError = param1;
         this.removeToolTip();
         if(param1)
         {
            currentState = "invalid";
            if(this._animeSound.isVoice)
            {
               this.showWarning(UtilDict.translate(OVERLAP_WARNING_FOR_VOICE));
            }
            else
            {
               this.showWarning(UtilDict.translate(OVERLAP_WARNING_FOR_SOUND));
            }
         }
         else
         {
            this.soundItem.displayError = false;
            currentState = "hovered";
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Point = new Point(param1.stageX - this._mouseDown.x,param1.stageY - this._mouseDown.y);
         if(this._animeSound)
         {
            if(this._animeSound.scene)
            {
               return;
            }
            _loc3_ = this._oldStartFrame + UtilUnitConvert.widthToFrame(_loc2_.x);
            _loc4_ = SoundTrackArea.pixelToTrack(this.parent.mouseY);
            _loc5_ = this._soundsController.moveSound(this._animeSound,_loc3_,_loc4_);
            this.turnRed(_loc5_ != 0);
            this._animeSound.overlap = false;
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         if(this._selected)
         {
            this._selected = false;
            currentState = "normal";
            return;
         }
         this.turnRed(false);
         currentState = "normal";
         var _loc2_:Point = new Point(param1.stageX - this._mouseDown.x,param1.stageY - this._mouseDown.y);
         if(this._animeSound && this._animeSound.scene == null)
         {
            _loc3_ = this._oldStartFrame + UtilUnitConvert.widthToFrame(_loc2_.x);
            _loc4_ = SoundTrackArea.pixelToTrack(this.parent.mouseY);
            _loc5_ = this._soundsController.moveSound(this._animeSound,_loc3_,_loc4_);
            if(_loc5_)
            {
               if(this._soundsController.wrapEnabled)
               {
                  this._soundsController.sounds.memento = this._oldSoundMemento;
               }
               else
               {
                  this._soundsController.moveSound(this._animeSound,this._oldStartFrame,this._oldTrackNum);
               }
            }
            else if(_loc2_.x != 0)
            {
               this._command.executeNow(this._animeSound.startFrame,this._animeSound.totalFrame,this._animeSound.trackNum);
            }
            this._animeSound.overlap = false;
         }
         if(_loc2_.length == 0)
         {
            this.displayMenu(this.mouseX - CURSOR_LINE_OFFSET);
            currentState = "hovered";
            this._selected = true;
            this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         }
         else
         {
            this.dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this));
         }
      }
      
      private function onControlMouseDownHandler(param1:MouseEvent) : void
      {
         this._mouseDown = new Point(param1.stageX,param1.stageY);
         if(this._animeSound)
         {
            this._oldStartFrame = this._animeSound.startFrame;
            this._oldTotalFrame = this._animeSound.totalFrame;
            this._oldTrackNum = this._animeSound.trackNum;
            this._command = new MoveSoundCommand(this._animeSound,this._soundsController.sounds);
         }
         if(this._soundsController.wrapEnabled)
         {
            this._oldSoundMemento = this._soundsController.sounds.memento;
            this._soundsController.refreshOrder(this._animeSound);
         }
         this.isResizing = true;
         this._currDraggedControl = param1.currentTarget as UIComponent;
         this.showToolTip();
         this._timelineControl.clearChildrenMenu();
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMoveWhenResize);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUpWhenResize);
      }
      
      private function onStageMouseMoveWhenResize(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Number = UtilUnitConvert.widthToFrame(param1.stageX - this._mouseDown.x);
         var _loc3_:int = 0;
         if(this._animeSound)
         {
            if(this._currDraggedControl == this.dragHandleRight)
            {
               _loc4_ = this._oldStartFrame + this._oldTotalFrame - 1 + _loc2_;
               _loc3_ = this._soundsController.resizeSound(this._animeSound,this._oldStartFrame,_loc4_);
            }
            else
            {
               _loc5_ = this._oldStartFrame + _loc2_;
               _loc3_ = this._soundsController.resizeSound(this._animeSound,_loc5_,this._animeSound.endFrame);
            }
         }
         if(this._soundsController.wrapEnabled)
         {
            this.turnRed(_loc3_ != 0);
         }
      }
      
      private function onStageMouseUpWhenResize(param1:MouseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMoveWhenResize);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUpWhenResize);
         if(this.isArrowCursor)
         {
            this.isResizing = false;
            if(!this.onArrow)
            {
               CursorManager.removeCursor(this.cursorID);
            }
         }
         var _loc2_:Number = UtilUnitConvert.widthToFrame(param1.stageX - this._mouseDown.x);
         var _loc3_:int = 0;
         if(this._animeSound)
         {
            if(this._currDraggedControl == this.dragHandleRight)
            {
               _loc4_ = this._oldStartFrame + this._oldTotalFrame - 1 + _loc2_;
               _loc3_ = this._soundsController.resizeSound(this._animeSound,this._oldStartFrame,_loc4_);
            }
            else
            {
               _loc5_ = this._oldStartFrame + _loc2_;
               _loc3_ = this._soundsController.resizeSound(this._animeSound,_loc5_,this._oldStartFrame + this._oldTotalFrame - 1);
            }
            if(this._soundsController.wrapEnabled && _loc3_ != 0)
            {
               this._soundsController.sounds.memento = this._oldSoundMemento;
               _loc2_ = 0;
            }
            if(_loc2_ != 0)
            {
               this._command.executeNow(this._animeSound.startFrame,this._animeSound.totalFrame,this._animeSound.trackNum);
            }
         }
         this.removeToolTip();
         this.turnRed(false);
         this.currentState = "normal";
         if(_loc2_ != 0)
         {
            this.dispatchEvent(new ExtraDataEvent("TIMELINE_CHANGE",this));
         }
      }
      
      private function changeArrowCurosr(param1:Boolean) : void
      {
         this.onArrow = param1;
         if(!this.isResizing)
         {
            if(param1)
            {
               this.cursorID = CursorManager.setCursor(imgResize,3,-10.5,-6);
               this.isArrowCursor = true;
            }
            else
            {
               CursorManager.removeCursor(this.cursorID);
               this.isArrowCursor = false;
            }
         }
      }
      
      public function startIndicator(param1:Number = 0, param2:ISoundable = null) : void
      {
         this.soundItem.startIndicator(param1,param2);
      }
      
      public function stopIndicator(param1:Boolean = false) : void
      {
         this.soundItem.stopIndicator(param1);
      }
      
      protected function onRollOver(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            currentState = "hovered";
            this._toolTipTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onToolTipTimer);
            this._toolTipTimer.start();
            this.soundItem.hovered = true;
            this.cursorLine.visible = true;
         }
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
         if(!param1.buttonDown && !this._selected)
         {
            currentState = "normal";
            this.removeToolTip();
         }
         this.soundItem.hovered = false;
         this.cursorLine.visible = false;
      }
      
      public function get length() : Number
      {
         return 0;
      }
      
      public function get label() : String
      {
         return "";
      }
      
      public function set label(param1:String) : void
      {
      }
      
      protected function createMenuModel() : void
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem(new MenuItemModel(UtilDict.translate("Play from start"),MENU_LABEL_PLAY_SOUND,MenuItemModel.MENU_TYPE_NORMAL,null,imgPlay));
         this.playPositionItem = new MenuItemModel(UtilDict.translate("Play"),"",MenuItemModel.MENU_TYPE_NORMAL,null,imgPlayAt);
         _loc1_.addItem(this.playPositionItem);
         _loc1_.addItem(new MenuItemModel(UtilDict.translate("Pause"),MENU_LABEL_STOP_SOUND,MenuItemModel.MENU_TYPE_NORMAL,null,imgPause));
         _loc1_.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         this.durationItems = new ArrayCollection();
         this.durationItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_LENGTH_1),[MENU_LABEL_SOUND_LENGTH,1]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_LENGTH_2),[MENU_LABEL_SOUND_LENGTH,2]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_LENGTH_5),[MENU_LABEL_SOUND_LENGTH,5]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_LENGTH_10),[MENU_LABEL_SOUND_LENGTH,10]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_LENGTH_20),[MENU_LABEL_SOUND_LENGTH,20]));
         this.durationItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_LENGTH_30),[MENU_LABEL_SOUND_LENGTH,30]));
         this.durationItems.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         this.durationItems.addItem(new MenuItemModel(UtilDict.translate("All scenes"),MENU_LABEL_SOUND_LENGTH_FULL));
         this.durationItems.addItem(new MenuItemModel(UtilDict.translate("Reset"),MENU_LABEL_SOUND_LENGTH_RESET));
         this.durationMenu = new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_LENGTH),null,MenuItemModel.MENU_TYPE_NORMAL,this.durationItems,imgDuration);
         _loc1_.addItem(this.durationMenu);
         this.volumeItems = new ArrayCollection();
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_LEVEL),null));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_10),[MENU_LABEL_SOUND_VOLUME,0.1],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_25),[MENU_LABEL_SOUND_VOLUME,0.25],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_50),[MENU_LABEL_SOUND_VOLUME,0.5],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_75),[MENU_LABEL_SOUND_VOLUME,0.75],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_100),[MENU_LABEL_SOUND_VOLUME,1],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_200),[MENU_LABEL_SOUND_VOLUME,2],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_400),[MENU_LABEL_SOUND_VOLUME,4],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME_800),[MENU_LABEL_SOUND_VOLUME,8],MenuItemModel.MENU_TYPE_RADIO));
         this.volumeItems.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         if(this.animeSound.hasFading)
         {
            this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_REMOVE_FADING),ACTION_REMOVE_FADING));
         }
         else
         {
            this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_ADD_DEFAULT_FADING),ACTION_ADD_DEFAULT_FADING));
         }
         this.volumeItems.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_ADVANCED_FADING_SETTINGS),ACTION_SHOW_ADVANCED_FADING_SETTINGS));
         var _loc2_:MenuItemModel = new MenuItemModel(UtilDict.translate(MENU_LABEL_SOUND_VOLUME),null,MenuItemModel.MENU_TYPE_NORMAL,this.volumeItems,imgVolume);
         _loc1_.addItem(_loc2_);
         _loc1_.addItem(new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR));
         _loc1_.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_DUPLICATE_SOUND),ACTION_DUPLICATE_SOUND,MenuItemModel.MENU_TYPE_NORMAL,null,imgCopy));
         this.splitSoundItem = new MenuItemModel(UtilDict.translate(MENU_LABEL_SPLIT_SOUND),ACTION_SPLIT_SOUND,MenuItemModel.MENU_TYPE_NORMAL,null,imgSplit);
         _loc1_.addItem(this.splitSoundItem);
         this.attachSceneItem = new MenuItemModel(UtilDict.translate(MENU_LABEL_ATTACH_TO_SCENE),ACTION_ATTACH_SCENE,MenuItemModel.MENU_TYPE_NORMAL,null,imgAttach);
         _loc1_.addItem(this.attachSceneItem);
         _loc1_.addItem(new MenuItemModel(UtilDict.translate(MENU_LABEL_REMOVE_SOUND),MENU_LABEL_REMOVE_SOUND,MenuItemModel.MENU_TYPE_NORMAL,null,imgRemove));
         this.soundMenu.dataProvider = _loc1_;
      }
      
      protected function displayMenu(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:MenuItemModel = null;
         var _loc5_:Array = null;
         var _loc9_:Boolean = false;
         this.createMenuModel();
         this.menuDisplay.x = param1;
         this.playPositionMarker.x = param1;
         var _loc6_:Number = param1 / AnimeConstants.PIXEL_PER_SEC;
         this.playPositionItem.label = UtilDict.translate(MENU_LABEL_PLAY_SOUND) + " @ " + this.playTimeFormatter.format(_loc6_) + UtilDict.translate("timeline_sfsecond");
         this.playPositionItem.value = [MENU_LABEL_PLAY_SOUND_AT,_loc6_ * 1000];
         var _loc7_:int = Console.getConsole().scenes.length;
         _loc3_ = this.durationItems.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.durationItems.getItemAt(_loc2_) as MenuItemModel;
            _loc5_ = _loc4_.value as Array;
            if(_loc5_)
            {
               _loc4_.enabled = _loc5_[1] <= _loc7_;
            }
            _loc2_++;
         }
         var _loc8_:Number = this.animeSound.volume;
         _loc3_ = this.volumeItems.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this.volumeItems.getItemAt(_loc2_) as MenuItemModel;
            _loc5_ = _loc4_.value as Array;
            if(_loc5_ && _loc8_ == _loc5_[1] as Number)
            {
               _loc4_.selected = true;
               _loc9_ = true;
            }
            else
            {
               _loc4_.selected = false;
            }
            _loc2_++;
         }
         _loc4_ = this.volumeItems.getItemAt(0) as MenuItemModel;
         _loc4_.label = UtilDict.translate(MENU_LABEL_SOUND_VOLUME_LEVEL);
         if(!_loc9_)
         {
            _loc4_.label = _loc4_.label + (" (" + Math.round(_loc8_ * 100) + PERCENTAGE_SYMBOL + ")");
         }
         this.durationMenu.enabled = this._resizable;
         this.splitSoundItem.value = [ACTION_SPLIT_SOUND,_loc6_];
         this.splitSoundItem.enabled = !this._animeSound.isLooping && !this._animeSound.scene;
         if(this._animeSound.scene != null)
         {
            this.attachSceneItem.label = UtilDict.translate(MENU_LABEL_DETACH_FROM_SCENE);
            this.attachSceneItem.icon = imgDettach;
         }
         else
         {
            this.attachSceneItem.label = UtilDict.translate(MENU_LABEL_ATTACH_TO_SCENE);
            this.attachSceneItem.icon = imgAttach;
         }
         this.attachSceneItem.enabled = this._animeSound.isVoice;
         this.menuDisplay.displayPopUp = true;
         this.playPositionMarker.visible = true;
         this._timelineControl.activeMenuItem = this;
      }
      
      public function removeMenu() : void
      {
         this.menuDisplay.displayPopUp = false;
      }
      
      private function removeSound() : void
      {
         var _loc1_:ICommand = null;
         if(this.animeSound.isVoice)
         {
            _loc1_ = new RemoveSpeechCommand(this.animeSound);
            _loc1_.execute();
         }
         else
         {
            _loc1_ = new RemoveSoundCommand(this.animeSound,this.animeSound.soundsController.sounds);
            _loc1_.execute();
         }
      }
      
      protected function duplicateSound(param1:MouseEvent) : void
      {
         var _loc2_:DragSource = new DragSource();
         _loc2_.addData(this.animeSound.soundThumb,SoundThumb.DRAG_DATA_FORMAT);
         _loc2_.addData(this.animeSound,AnimeSound.DRAG_DATA_FORMAT);
         var _loc3_:SoundThumbRenderer = new SoundThumbRenderer();
         _loc3_.dragging = true;
         _loc3_.data = this.animeSound.soundThumb;
         _loc2_.addData(_loc3_,StudioDragManager.DRAG_IMAGE);
         var _loc4_:Point = new Point(param1.stageX,param1.stageY);
         var _loc5_:Point = globalToLocal(_loc4_);
         DragManager.doDrag(this,_loc2_,param1,_loc3_,20 - _loc5_.x,20 - _loc5_.y);
      }
      
      private function splitSound(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:SplitSoundCommand = null;
         if(this._animeSound)
         {
            _loc2_ = UtilUnitConvert.timeToFrame(param1);
            _loc3_ = new SplitSoundCommand(this._animeSound,_loc2_);
            _loc3_.execute();
         }
      }
      
      private function attachToScene() : void
      {
         var _loc1_:ICommand = null;
         var _loc2_:AnimeScene = null;
         var _loc3_:Object = null;
         if(this._animeSound)
         {
            _loc2_ = this._animeSound.scene;
            _loc3_ = {"target":(!!_loc2_?"unattach":"attach")};
            AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_TOGGLE_ATTACH_VOICE_TO_STAGE,_loc3_);
            if(_loc2_)
            {
               _loc1_ = new DettachSoundCommand(_loc2_);
               _loc1_.execute();
            }
            else
            {
               _loc2_ = Console.getConsole().timelineController.getSceneAtFrame(this._animeSound.startFrame);
               if(_loc2_)
               {
                  _loc1_ = new AttachVoiceToScene(_loc2_,this._animeSound);
                  _loc1_.execute();
               }
            }
         }
      }
      
      protected function soundMenu_itemClickHandler(param1:MenuItemEvent) : void
      {
         var _loc4_:String = null;
         var _loc2_:* = param1.item.value;
         var _loc3_:Array = _loc2_ as Array;
         if(_loc3_)
         {
            _loc4_ = _loc3_[0];
            _loc2_ = _loc3_[1];
         }
         else
         {
            _loc4_ = _loc2_ as String;
         }
         switch(_loc4_)
         {
            case MENU_LABEL_PLAY_SOUND:
               this.animeSound.playSound();
               break;
            case MENU_LABEL_PLAY_SOUND_AT:
               this.animeSound.playSound(_loc2_);
               break;
            case MENU_LABEL_STOP_SOUND:
               this.animeSound.stopSound();
               break;
            case MENU_LABEL_REMOVE_SOUND:
               this.removeSound();
               break;
            case ACTION_DUPLICATE_SOUND:
               this.duplicateSound(param1.mouseEvent);
               break;
            case ACTION_SPLIT_SOUND:
               this.splitSound(_loc2_);
               break;
            case ACTION_ATTACH_SCENE:
               this.attachToScene();
               break;
            case MENU_LABEL_SOUND_LENGTH:
               this.animeSound.changeDurationByScene(_loc2_);
               break;
            case MENU_LABEL_SOUND_LENGTH_FULL:
               this.animeSound.changeDurationByType(AnimeSound.DURATION_TYPE_FULL);
               break;
            case MENU_LABEL_SOUND_LENGTH_RESET:
               this.animeSound.changeDurationByType(AnimeSound.DURATION_TYPE_RESET);
               break;
            case MENU_LABEL_SOUND_VOLUME:
               this.changeVolume(_loc2_);
               break;
            case ACTION_ADD_DEFAULT_FADING:
               this.addDefaultFading();
               break;
            case ACTION_REMOVE_FADING:
               this.removeFading();
               break;
            case ACTION_SHOW_ADVANCED_FADING_SETTINGS:
               this.showAdvancedFadingSettings();
         }
      }
      
      private function changeVolume(param1:Number) : void
      {
         var _loc2_:ChangeVolumeCommand = new ChangeVolumeCommand(this.animeSound,param1);
         _loc2_.execute();
      }
      
      private function addDefaultFading() : void
      {
         var _loc1_:ICommand = new AddDefaultSoundFadingCommand(this.animeSound);
         _loc1_.execute();
      }
      
      private function removeFading() : void
      {
         var _loc1_:ICommand = new RemoveSoundFadingCommand(this.animeSound);
         _loc1_.execute();
      }
      
      public function destroy() : void
      {
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         }
      }
      
      protected function soundWarning_closeButtonClickHandler(param1:Event) : void
      {
         this.overlapReminderAnchor.displayPopUp = false;
      }
      
      protected function menuDisplay_popupAnchorCloseHandler(param1:MenuItemEvent) : void
      {
         this.playPositionMarker.visible = false;
      }
      
      protected function mouseMoveHandler(param1:MouseEvent) : void
      {
         this.cursorLine.x = this.mouseX - CURSOR_LINE_OFFSET;
      }
      
      protected function showAdvancedFadingSettings() : void
      {
         SoundPlaybackManager.stop();
         if(!this._fadingPopUp)
         {
            this._fadingPopUp = new SoundFadingPopUp();
            this._fadingPopUp.addEventListener(PopUpEvent.CLOSE,this.fadingPopUp_closeHandler);
         }
         this._fadingPopUp.sound#1 = this.animeSound;
         this._fadingPopUp.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      protected function fadingPopUp_closeHandler(param1:PopUpEvent) : void
      {
      }
      
      private function _SoundContainer_NumberFormatter1_i() : NumberFormatter
      {
         var _loc1_:NumberFormatter = new NumberFormatter();
         _loc1_.fractionalDigits = 1;
         _loc1_.initialized(this,"playTimeFormatter");
         this.playTimeFormatter = _loc1_;
         BindingManager.executeBindings(this,"playTimeFormatter",this.playTimeFormatter);
         return _loc1_;
      }
      
      private function _SoundContainer_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.top = -5;
         _loc1_.popUpPosition = "above";
         _loc1_.displayPopUp = false;
         _loc1_.popUp = this._SoundContainer_TimelineToolTip1_i();
         _loc1_.id = "toolTipAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toolTipAnchor = _loc1_;
         BindingManager.executeBindings(this,"toolTipAnchor",this.toolTipAnchor);
         return _loc1_;
      }
      
      private function _SoundContainer_TimelineToolTip1_i() : TimelineToolTip
      {
         var _loc1_:TimelineToolTip = new TimelineToolTip();
         _loc1_.id = "toolTipDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toolTipDisplay = _loc1_;
         BindingManager.executeBindings(this,"toolTipDisplay",this.toolTipDisplay);
         return _loc1_;
      }
      
      private function _SoundContainer_PopUpAnchor2_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.top = -5;
         _loc1_.popUpPosition = "above";
         _loc1_.displayPopUp = false;
         _loc1_.popUp = this._SoundContainer_MenuItemList1_i();
         _loc1_.addEventListener("popupAnchorClose",this.__menuDisplay_popupAnchorClose);
         _loc1_.id = "menuDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.menuDisplay = _loc1_;
         BindingManager.executeBindings(this,"menuDisplay",this.menuDisplay);
         return _loc1_;
      }
      
      private function _SoundContainer_MenuItemList1_i() : MenuItemList
      {
         var _loc1_:MenuItemList = new MenuItemList();
         _loc1_.right = 0;
         _loc1_.addEventListener("itemClick",this.__soundMenu_itemClick);
         _loc1_.id = "soundMenu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundMenu = _loc1_;
         BindingManager.executeBindings(this,"soundMenu",this.soundMenu);
         return _loc1_;
      }
      
      public function __soundMenu_itemClick(param1:MenuItemEvent) : void
      {
         this.soundMenu_itemClickHandler(param1);
      }
      
      public function __menuDisplay_popupAnchorClose(param1:MenuItemEvent) : void
      {
         this.menuDisplay_popupAnchorCloseHandler(param1);
      }
      
      private function _SoundContainer_SoundElement1_i() : SoundElement
      {
         var _loc1_:SoundElement = new SoundElement();
         _loc1_.height = 18;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("mouseDown",this.__soundItem_mouseDown);
         _loc1_.id = "soundItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundItem = _loc1_;
         BindingManager.executeBindings(this,"soundItem",this.soundItem);
         return _loc1_;
      }
      
      public function __soundItem_mouseDown(param1:MouseEvent) : void
      {
         this.onSoundElementDown(param1);
      }
      
      private function _SoundContainer_PopUpAnchor3_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.top = -2;
         _loc1_.popUpPosition = "above";
         _loc1_.displayPopUp = false;
         _loc1_.autoClose = false;
         _loc1_.popUp = this._SoundContainer_SoundWarning1_i();
         _loc1_.id = "overlapReminderAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.overlapReminderAnchor = _loc1_;
         BindingManager.executeBindings(this,"overlapReminderAnchor",this.overlapReminderAnchor);
         return _loc1_;
      }
      
      private function _SoundContainer_SoundWarning1_i() : SoundWarning
      {
         var _loc1_:SoundWarning = new SoundWarning();
         _loc1_.addEventListener("closeButtonClick",this.__soundWarning_closeButtonClick);
         _loc1_.id = "soundWarning";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundWarning = _loc1_;
         BindingManager.executeBindings(this,"soundWarning",this.soundWarning);
         return _loc1_;
      }
      
      public function __soundWarning_closeButtonClick(param1:Event) : void
      {
         this.soundWarning_closeButtonClickHandler(param1);
      }
      
      private function _SoundContainer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 6;
         _loc1_.percentHeight = 100;
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.mxmlContent = [this._SoundContainer_Rect1_c()];
         _loc1_.addEventListener("rollOver",this.__dragHandleLeft_rollOver);
         _loc1_.addEventListener("rollOut",this.__dragHandleLeft_rollOut);
         _loc1_.addEventListener("mouseDown",this.__dragHandleLeft_mouseDown);
         _loc1_.id = "dragHandleLeft";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dragHandleLeft = _loc1_;
         BindingManager.executeBindings(this,"dragHandleLeft",this.dragHandleLeft);
         return _loc1_;
      }
      
      private function _SoundContainer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SoundContainer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundContainer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function __dragHandleLeft_rollOver(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(true);
      }
      
      public function __dragHandleLeft_rollOut(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(false);
      }
      
      public function __dragHandleLeft_mouseDown(param1:MouseEvent) : void
      {
         this.onControlMouseDownHandler(param1);
      }
      
      private function _SoundContainer_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 6;
         _loc1_.percentHeight = 100;
         _loc1_.right = 0;
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.mxmlContent = [this._SoundContainer_Rect2_c()];
         _loc1_.addEventListener("rollOver",this.__dragHandleRight_rollOver);
         _loc1_.addEventListener("rollOut",this.__dragHandleRight_rollOut);
         _loc1_.addEventListener("mouseDown",this.__dragHandleRight_mouseDown);
         _loc1_.id = "dragHandleRight";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dragHandleRight = _loc1_;
         BindingManager.executeBindings(this,"dragHandleRight",this.dragHandleRight);
         return _loc1_;
      }
      
      private function _SoundContainer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SoundContainer_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundContainer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 65280;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      public function __dragHandleRight_rollOver(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(true);
      }
      
      public function __dragHandleRight_rollOut(param1:MouseEvent) : void
      {
         this.changeArrowCurosr(false);
      }
      
      public function __dragHandleRight_mouseDown(param1:MouseEvent) : void
      {
         this.onControlMouseDownHandler(param1);
      }
      
      private function _SoundContainer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 1;
         _loc1_.visible = false;
         _loc1_.stroke = this._SoundContainer_SolidColorStroke1_c();
         _loc1_.initialized(this,"playPositionMarker");
         this.playPositionMarker = _loc1_;
         BindingManager.executeBindings(this,"playPositionMarker",this.playPositionMarker);
         return _loc1_;
      }
      
      private function _SoundContainer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15949386;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _SoundContainer_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.visible = false;
         _loc1_.stroke = this._SoundContainer_SolidColorStroke2_c();
         _loc1_.initialized(this,"cursorLine");
         this.cursorLine = _loc1_;
         BindingManager.executeBindings(this,"cursorLine",this.cursorLine);
         return _loc1_;
      }
      
      private function _SoundContainer_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15158332;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      public function ___SoundContainer_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      public function ___SoundContainer_Group1_rollOver(param1:MouseEvent) : void
      {
         this.onRollOver(param1);
      }
      
      public function ___SoundContainer_Group1_rollOut(param1:MouseEvent) : void
      {
         this.onRollOut(param1);
      }
      
      public function ___SoundContainer_Group1_mouseMove(param1:MouseEvent) : void
      {
         this.mouseMoveHandler(param1);
      }
      
      private function _SoundContainer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return SOUNDCONTAINER_HEIGHT;
         },null,"this.height");
         result[1] = new Binding(this,function():Boolean
         {
            return _leftControlVisible;
         },null,"dragHandleLeft.visible");
         result[2] = new Binding(this,function():Boolean
         {
            return _rightControlVisible;
         },null,"dragHandleRight.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get cursorLine() : Line
      {
         return this._87333994cursorLine;
      }
      
      public function set cursorLine(param1:Line) : void
      {
         var _loc2_:Object = this._87333994cursorLine;
         if(_loc2_ !== param1)
         {
            this._87333994cursorLine = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cursorLine",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragHandleLeft() : Group
      {
         return this._815023779dragHandleLeft;
      }
      
      public function set dragHandleLeft(param1:Group) : void
      {
         var _loc2_:Object = this._815023779dragHandleLeft;
         if(_loc2_ !== param1)
         {
            this._815023779dragHandleLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragHandleLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dragHandleRight() : Group
      {
         return this._498405632dragHandleRight;
      }
      
      public function set dragHandleRight(param1:Group) : void
      {
         var _loc2_:Object = this._498405632dragHandleRight;
         if(_loc2_ !== param1)
         {
            this._498405632dragHandleRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dragHandleRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get menuDisplay() : PopUpAnchor
      {
         return this._1131896221menuDisplay;
      }
      
      public function set menuDisplay(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1131896221menuDisplay;
         if(_loc2_ !== param1)
         {
            this._1131896221menuDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"menuDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get overlapReminderAnchor() : PopUpAnchor
      {
         return this._1694718446overlapReminderAnchor;
      }
      
      public function set overlapReminderAnchor(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._1694718446overlapReminderAnchor;
         if(_loc2_ !== param1)
         {
            this._1694718446overlapReminderAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"overlapReminderAnchor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playPositionMarker() : Line
      {
         return this._1326088983playPositionMarker;
      }
      
      public function set playPositionMarker(param1:Line) : void
      {
         var _loc2_:Object = this._1326088983playPositionMarker;
         if(_loc2_ !== param1)
         {
            this._1326088983playPositionMarker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playPositionMarker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playTimeFormatter() : NumberFormatter
      {
         return this._1450429865playTimeFormatter;
      }
      
      public function set playTimeFormatter(param1:NumberFormatter) : void
      {
         var _loc2_:Object = this._1450429865playTimeFormatter;
         if(_loc2_ !== param1)
         {
            this._1450429865playTimeFormatter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playTimeFormatter",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundItem() : SoundElement
      {
         return this._1812817726soundItem;
      }
      
      public function set soundItem(param1:SoundElement) : void
      {
         var _loc2_:Object = this._1812817726soundItem;
         if(_loc2_ !== param1)
         {
            this._1812817726soundItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundMenu() : MenuItemList
      {
         return this._1812712690soundMenu;
      }
      
      public function set soundMenu(param1:MenuItemList) : void
      {
         var _loc2_:Object = this._1812712690soundMenu;
         if(_loc2_ !== param1)
         {
            this._1812712690soundMenu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundMenu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundWarning() : SoundWarning
      {
         return this._1725759603soundWarning;
      }
      
      public function set soundWarning(param1:SoundWarning) : void
      {
         var _loc2_:Object = this._1725759603soundWarning;
         if(_loc2_ !== param1)
         {
            this._1725759603soundWarning = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundWarning",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolTipAnchor() : PopUpAnchor
      {
         return this._482586504toolTipAnchor;
      }
      
      public function set toolTipAnchor(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._482586504toolTipAnchor;
         if(_loc2_ !== param1)
         {
            this._482586504toolTipAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipAnchor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolTipDisplay() : TimelineToolTip
      {
         return this._459096927toolTipDisplay;
      }
      
      public function set toolTipDisplay(param1:TimelineToolTip) : void
      {
         var _loc2_:Object = this._459096927toolTipDisplay;
         if(_loc2_ !== param1)
         {
            this._459096927toolTipDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _leftControlVisible() : Boolean
      {
         return this._1552968411_leftControlVisible;
      }
      
      private function set _leftControlVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1552968411_leftControlVisible;
         if(_loc2_ !== param1)
         {
            this._1552968411_leftControlVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_leftControlVisible",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _rightControlVisible() : Boolean
      {
         return this._1408890158_rightControlVisible;
      }
      
      private function set _rightControlVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1408890158_rightControlVisible;
         if(_loc2_ !== param1)
         {
            this._1408890158_rightControlVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_rightControlVisible",_loc2_,param1));
            }
         }
      }
   }
}
