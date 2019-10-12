package anifire.studio.components
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.AnimeSoundEvent;
   import anifire.studio.core.sound.ISoundable;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.interfaces.ITimelineElement;
   import anifire.util.UtilDict;
   import anifire.util.UtilString;
   import anifire.util.UtilUnitConvert;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.Label;
   import spark.core.SpriteVisualElement;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SoundElement extends Group implements ITimelineElement, IBindingClient
   {
      
      private static const PLAYBACK_INDICATOR_HIDE_DELAY:int = 500;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _180316221backgroundDrawTarget:SpriteVisualElement;
      
      private var _653225663borderDrawTarget:SpriteVisualElement;
      
      private var _329473036errorRect:Rect;
      
      private var _1209425521infoGroup:Group;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1710589249playbackMonitor:SoundPlaybackMonitor;
      
      private var _992137725volumeRenderer:SoundVolumeRenderer;
      
      private var _1699641659waveformDisplay:SoundWaveformRenderer;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _focus:Boolean = false;
      
      private var _animeSound:AnimeSound;
      
      private var _speechMode:Boolean;
      
      private var _waveformDrawn:Boolean;
      
      private var _showWaveform:Boolean;
      
      private var _noWaveform:Boolean;
      
      protected var _backgroundInvalidateFlag:Boolean;
      
      protected var _waveformInvalidateFlag:Boolean;
      
      protected var _1742481591_textColor:uint;
      
      protected var _1783211133_displayVolume:Boolean;
      
      protected var _hovered:Boolean = false;
      
      private var _hidePlaybackIndicatorTimer:Timer;
      
      protected var _displayError:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundElement()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundElement_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SoundElementWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundElement[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.height = 18;
         this.clipAndEnableScrolling = true;
         this.mouseChildren = false;
         this.mxmlContent = [this._SoundElement_SpriteVisualElement1_i(),this._SoundElement_SoundWaveformRenderer1_i(),this._SoundElement_SoundVolumeRenderer1_i(),this._SoundElement_SpriteVisualElement2_i(),this._SoundElement_SoundPlaybackMonitor1_i(),this._SoundElement_Group2_i(),this._SoundElement_Rect1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundElement._watcherSetupUtil = param1;
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
      public function get hovered() : Boolean
      {
         return this._hovered;
      }
      
      private function set _1101035227hovered(param1:Boolean) : void
      {
         if(this._hovered != param1)
         {
            this._hovered = param1;
            this._backgroundInvalidateFlag = true;
            invalidateDisplayList();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displayError() : Boolean
      {
         return this._displayError;
      }
      
      private function set _1591210598displayError(param1:Boolean) : void
      {
         if(this._displayError != param1)
         {
            this._displayError = param1;
         }
      }
      
      public function set speechMode(param1:Boolean) : void
      {
         if(this._speechMode != param1)
         {
            this._speechMode = param1;
            this.invalidateWaveform();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animeSound() : AnimeSound
      {
         return this._animeSound;
      }
      
      private function set _398295291animeSound(param1:AnimeSound) : void
      {
         if(this._animeSound != param1)
         {
            if(this._animeSound)
            {
               this._animeSound.removeEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.animeSound_changeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.animeSound_changeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.TRIMMED_START_FRAME_CHANGE,this.animeSound_trimmedChangeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.TRIMMED_END_FRAME_CHANGE,this.animeSound_trimmedChangeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.animeSound_changeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.SCENE_ATTACHMENT_CHANGE,this.animeSound_sceneAttachmentChangeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.WAVEFORM_DELAY_CHANGE,this.animeSound_changeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.SOUND_THUMB_CHANGE,this.animeSound_soundThumbChangeHandler);
               this._animeSound.removeEventListener(AnimeSoundEvent.FADING_CHANGE,this.animeSound_changeHandler);
            }
            this.waveformDisplay.reset();
            this._waveformDrawn = false;
            this._noWaveform = false;
            this._animeSound = param1;
            if(this._animeSound)
            {
               this.updateUI();
               this.setWaveformVisible(this._showWaveform);
               this._animeSound.addEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.animeSound_changeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.TOTAL_FRAME_CHANGE,this.animeSound_changeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.TRIMMED_START_FRAME_CHANGE,this.animeSound_trimmedChangeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.TRIMMED_END_FRAME_CHANGE,this.animeSound_trimmedChangeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.animeSound_changeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.SCENE_ATTACHMENT_CHANGE,this.animeSound_sceneAttachmentChangeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.WAVEFORM_DELAY_CHANGE,this.animeSound_changeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.SOUND_THUMB_CHANGE,this.animeSound_soundThumbChangeHandler);
               this._animeSound.addEventListener(AnimeSoundEvent.FADING_CHANGE,this.animeSound_changeHandler);
            }
         }
      }
      
      private function animeSound_changeHandler(param1:AnimeSoundEvent) : void
      {
         this.updateUI();
      }
      
      private function animeSound_sceneAttachmentChangeHandler(param1:AnimeSoundEvent) : void
      {
         this.updateUI();
         this.waveformDisplay.reset(false);
         this.invalidateWaveform();
      }
      
      private function animeSound_trimmedChangeHandler(param1:AnimeSoundEvent) : void
      {
         this.redrawWaveform();
         if(this._animeSound.trimStartFrame > 1)
         {
            this.playbackMonitor.horizontalScrollPosition = UtilUnitConvert.frameToX(this._animeSound.trimStartFrame);
         }
      }
      
      private function animeSound_soundThumbChangeHandler(param1:AnimeSoundEvent) : void
      {
         this.redrawWaveform();
      }
      
      private function redrawWaveform() : void
      {
         this.waveformDisplay.reset();
         this._waveformDrawn = false;
         this.setWaveformVisible(this._showWaveform);
      }
      
      private function updateUI() : void
      {
         var _loc1_:Number = NaN;
         if(this._animeSound)
         {
            this.width = UtilUnitConvert.frameToPixel(this._animeSound.totalFrame);
            this.labelDisplay.text = this.getLabel();
            this.labelDisplay.setStyle("color",this._animeSound.textColor);
            if(this._animeSound.trimStartFrame > 1)
            {
               this.playbackMonitor.horizontalScrollPosition = UtilUnitConvert.frameToX(this._animeSound.trimStartFrame);
            }
            this.speechMode = this._animeSound.isVoice;
            this._displayVolume = this._animeSound.hasActualFading;
            _loc1_ = UtilUnitConvert.frameToPixel(this._animeSound.waveformDelay);
            this.waveformDisplay.offset = _loc1_;
            this.playbackMonitor.offset = _loc1_;
            this.drawBackground();
         }
      }
      
      public function getLabel() : String
      {
         return this.getDetailLabel();
      }
      
      private function getDetailLabel() : String
      {
         var _loc1_:String = "";
         if(this.animeSound)
         {
            _loc1_ = _loc1_ + this.animeSound.getLabel();
            _loc1_ = _loc1_ + (" [" + UtilDict.translate("timeline_starttime") + ": " + UtilString.secToTimeString(UtilUnitConvert.frameToTime(this.animeSound.startFrame)));
            _loc1_ = _loc1_ + (", " + UtilDict.translate("timeline_duration") + ": " + UtilString.secToTimeString(UtilUnitConvert.frameToDuration(this.animeSound.totalFrame)));
            _loc1_ = _loc1_ + (", " + UtilDict.translate("timeline_volume") + ": " + Math.round(this.animeSound.volume * 100) + "%]");
         }
         return _loc1_;
      }
      
      private function invalidateWaveform() : void
      {
         this._waveformInvalidateFlag = true;
         invalidateDisplayList();
      }
      
      private function drawWaveform() : void
      {
         if(this._animeSound && this._animeSound.soundThumb && this._animeSound.soundThumb.isWaveformDataReady)
         {
            this.waveformDisplay.draw(this._animeSound,!this._speechMode,this._animeSound.trimStartFrame,this._animeSound.trimEndFrame);
            this.drawBackground();
         }
         this._waveformInvalidateFlag = false;
      }
      
      private function onSoundWaveformLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onSoundWaveformLoaded);
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onSoundWaveformLoadError);
         this.invalidateWaveform();
         this._noWaveform = false;
         this.setWaveformVisible(this._showWaveform);
      }
      
      private function onSoundWaveformLoadError(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onSoundWaveformLoaded);
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onSoundWaveformLoadError);
         this._noWaveform = true;
         this.setWaveformVisible(this._showWaveform);
      }
      
      public function get focus() : Boolean
      {
         return this._focus;
      }
      
      public function set focus(param1:Boolean) : void
      {
         this._focus = param1;
      }
      
      public function startIndicator(param1:Number = 0, param2:ISoundable = null) : void
      {
         this.stage.removeEventListener(MouseEvent.CLICK,this.stage_clickHandler);
         if(this._hidePlaybackIndicatorTimer)
         {
            this._hidePlaybackIndicatorTimer.stop();
            this._hidePlaybackIndicatorTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.hidePlaybackIndicatorTimer_completeHandler);
         }
         this.playbackMonitor.startMonitor(param1,param2);
         this.playbackMonitor.visible = true;
      }
      
      public function stopIndicator(param1:Boolean = false) : void
      {
         this.playbackMonitor.stopMonitor();
         if(param1)
         {
            if(!this._hidePlaybackIndicatorTimer)
            {
               this._hidePlaybackIndicatorTimer = new Timer(PLAYBACK_INDICATOR_HIDE_DELAY,1);
            }
            this._hidePlaybackIndicatorTimer.reset();
            this._hidePlaybackIndicatorTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.hidePlaybackIndicatorTimer_completeHandler);
            this._hidePlaybackIndicatorTimer.start();
         }
         else if(this.stage)
         {
            this.stage.addEventListener(MouseEvent.CLICK,this.stage_clickHandler);
         }
      }
      
      private function stage_clickHandler(param1:MouseEvent) : void
      {
         if(param1.target != this)
         {
            this.stage.removeEventListener(MouseEvent.CLICK,this.stage_clickHandler);
            this.playbackMonitor.visible = false;
         }
      }
      
      private function hidePlaybackIndicatorTimer_completeHandler(param1:TimerEvent) : void
      {
         if(this._hidePlaybackIndicatorTimer)
         {
            this._hidePlaybackIndicatorTimer.stop();
            this._hidePlaybackIndicatorTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.hidePlaybackIndicatorTimer_completeHandler);
         }
         this.playbackMonitor.visible = false;
      }
      
      public function setWaveformVisible(param1:Boolean) : void
      {
         this._showWaveform = param1;
         if(this._noWaveform)
         {
            param1 = false;
         }
         this.waveformDisplay.visible = param1;
         this.labelDisplay.visible = !param1;
         if(!this._waveformDrawn && param1 && this._animeSound && this._animeSound.soundThumb)
         {
            this._waveformDrawn = true;
            if(this._animeSound.soundThumb.isWaveformDataReady)
            {
               this.invalidateWaveform();
            }
            else
            {
               this._animeSound.soundThumb.addEventListener(SoundEvent.WAVEFORM_LOADED,this.onSoundWaveformLoaded);
               this._animeSound.soundThumb.addEventListener(SoundEvent.WAVEFORM_LOAD_ERROR,this.onSoundWaveformLoadError);
               this._animeSound.soundThumb.loadWaveform();
            }
         }
      }
      
      public function setTimelineReferer(param1:Timeline) : void
      {
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.backgroundDrawTarget.width = param1;
         this.errorRect.width = param1;
         this.infoGroup.width = param1 - 12;
         this.waveformDisplay.width = param1;
         this.playbackMonitor.width = param1;
         this.volumeRenderer.width = param1;
      }
      
      protected function drawBackground() : void
      {
         var _loc1_:Graphics = this.backgroundDrawTarget.graphics;
         _loc1_.clear();
         _loc1_.beginFill(!!this._hovered?uint(this._animeSound.hoverColor):uint(this._animeSound.backgroundColor));
         _loc1_.drawRect(0,0,width,height);
         _loc1_.endFill();
         _loc1_ = this.borderDrawTarget.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(1,this._animeSound.borderColor);
         _loc1_.moveTo(0,0);
         _loc1_.lineTo(0,height);
         _loc1_.moveTo(width,0);
         _loc1_.lineTo(width,height);
         this._backgroundInvalidateFlag = false;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this._waveformInvalidateFlag)
         {
            this.drawWaveform();
         }
         else if(this._backgroundInvalidateFlag)
         {
            this.drawBackground();
         }
      }
      
      private function _SoundElement_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.height = 18;
         _loc1_.initialized(this,"backgroundDrawTarget");
         this.backgroundDrawTarget = _loc1_;
         BindingManager.executeBindings(this,"backgroundDrawTarget",this.backgroundDrawTarget);
         return _loc1_;
      }
      
      private function _SoundElement_SoundWaveformRenderer1_i() : SoundWaveformRenderer
      {
         var _loc1_:SoundWaveformRenderer = new SoundWaveformRenderer();
         _loc1_.visible = false;
         _loc1_.height = 18;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.id = "waveformDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.waveformDisplay = _loc1_;
         BindingManager.executeBindings(this,"waveformDisplay",this.waveformDisplay);
         return _loc1_;
      }
      
      private function _SoundElement_SoundVolumeRenderer1_i() : SoundVolumeRenderer
      {
         var _loc1_:SoundVolumeRenderer = new SoundVolumeRenderer();
         _loc1_.height = 18;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.id = "volumeRenderer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.volumeRenderer = _loc1_;
         BindingManager.executeBindings(this,"volumeRenderer",this.volumeRenderer);
         return _loc1_;
      }
      
      private function _SoundElement_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.height = 18;
         _loc1_.initialized(this,"borderDrawTarget");
         this.borderDrawTarget = _loc1_;
         BindingManager.executeBindings(this,"borderDrawTarget",this.borderDrawTarget);
         return _loc1_;
      }
      
      private function _SoundElement_SoundPlaybackMonitor1_i() : SoundPlaybackMonitor
      {
         var _loc1_:SoundPlaybackMonitor = new SoundPlaybackMonitor();
         _loc1_.visible = false;
         _loc1_.height = 18;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.id = "playbackMonitor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playbackMonitor = _loc1_;
         BindingManager.executeBindings(this,"playbackMonitor",this.playbackMonitor);
         return _loc1_;
      }
      
      private function _SoundElement_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 6;
         _loc1_.height = 18;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._SoundElement_Label1_i()];
         _loc1_.id = "infoGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoGroup = _loc1_;
         BindingManager.executeBindings(this,"infoGroup",this.infoGroup);
         return _loc1_;
      }
      
      private function _SoundElement_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.mouseEnabled = false;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _SoundElement_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.height = 18;
         _loc1_.fill = this._SoundElement_SolidColor1_c();
         _loc1_.initialized(this,"errorRect");
         this.errorRect = _loc1_;
         BindingManager.executeBindings(this,"errorRect",this.errorRect);
         return _loc1_;
      }
      
      private function _SoundElement_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _SoundElement_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return hovered && _displayVolume;
         },null,"volumeRenderer.visible");
         result[1] = new Binding(this,null,null,"volumeRenderer.animeSound","animeSound");
         result[2] = new Binding(this,null,null,"errorRect.visible","displayError");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundDrawTarget() : SpriteVisualElement
      {
         return this._180316221backgroundDrawTarget;
      }
      
      public function set backgroundDrawTarget(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._180316221backgroundDrawTarget;
         if(_loc2_ !== param1)
         {
            this._180316221backgroundDrawTarget = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundDrawTarget",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderDrawTarget() : SpriteVisualElement
      {
         return this._653225663borderDrawTarget;
      }
      
      public function set borderDrawTarget(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._653225663borderDrawTarget;
         if(_loc2_ !== param1)
         {
            this._653225663borderDrawTarget = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderDrawTarget",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get errorRect() : Rect
      {
         return this._329473036errorRect;
      }
      
      public function set errorRect(param1:Rect) : void
      {
         var _loc2_:Object = this._329473036errorRect;
         if(_loc2_ !== param1)
         {
            this._329473036errorRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorRect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoGroup() : Group
      {
         return this._1209425521infoGroup;
      }
      
      public function set infoGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1209425521infoGroup;
         if(_loc2_ !== param1)
         {
            this._1209425521infoGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playbackMonitor() : SoundPlaybackMonitor
      {
         return this._1710589249playbackMonitor;
      }
      
      public function set playbackMonitor(param1:SoundPlaybackMonitor) : void
      {
         var _loc2_:Object = this._1710589249playbackMonitor;
         if(_loc2_ !== param1)
         {
            this._1710589249playbackMonitor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playbackMonitor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get volumeRenderer() : SoundVolumeRenderer
      {
         return this._992137725volumeRenderer;
      }
      
      public function set volumeRenderer(param1:SoundVolumeRenderer) : void
      {
         var _loc2_:Object = this._992137725volumeRenderer;
         if(_loc2_ !== param1)
         {
            this._992137725volumeRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"volumeRenderer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get waveformDisplay() : SoundWaveformRenderer
      {
         return this._1699641659waveformDisplay;
      }
      
      public function set waveformDisplay(param1:SoundWaveformRenderer) : void
      {
         var _loc2_:Object = this._1699641659waveformDisplay;
         if(_loc2_ !== param1)
         {
            this._1699641659waveformDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"waveformDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _textColor() : uint
      {
         return this._1742481591_textColor;
      }
      
      protected function set _textColor(param1:uint) : void
      {
         var _loc2_:Object = this._1742481591_textColor;
         if(_loc2_ !== param1)
         {
            this._1742481591_textColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_textColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _displayVolume() : Boolean
      {
         return this._1783211133_displayVolume;
      }
      
      protected function set _displayVolume(param1:Boolean) : void
      {
         var _loc2_:Object = this._1783211133_displayVolume;
         if(_loc2_ !== param1)
         {
            this._1783211133_displayVolume = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayVolume",_loc2_,param1));
            }
         }
      }
      
      public function set hovered(param1:Boolean) : void
      {
         var _loc2_:Object = this.hovered;
         if(_loc2_ !== param1)
         {
            this._1101035227hovered = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hovered",_loc2_,param1));
            }
         }
      }
      
      public function set displayError(param1:Boolean) : void
      {
         var _loc2_:Object = this.displayError;
         if(_loc2_ !== param1)
         {
            this._1591210598displayError = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayError",_loc2_,param1));
            }
         }
      }
      
      public function set animeSound(param1:AnimeSound) : void
      {
         var _loc2_:Object = this.animeSound;
         if(_loc2_ !== param1)
         {
            this._398295291animeSound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animeSound",_loc2_,param1));
            }
         }
      }
   }
}
