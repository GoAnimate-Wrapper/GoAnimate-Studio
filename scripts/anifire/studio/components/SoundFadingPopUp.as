package anifire.studio.components
{
   import anifire.studio.commands.ChangeAdvancedSoundFadingCommand;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.ISoundable;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.managers.SoundPlaybackManager;
   import anifire.studio.skins.PlayFadingToggleButtonSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SoundFadingPopUp extends DefaultPopUpContainer implements IBindingClient
   {
      
      private static const DURATION_STEP_SIZE:Number = 0.125;
      
      private static const MIN_DURATION:Number = 0;
      
      private static const VOLUME_STEP_SIZE:Number = 5;
      
      private static const VOLUME_SNAP_INTERVAL:Number = 1;
      
      private static const MIN_VOLUME:Number = 0;
      
      private static const MAX_VOLUME:Number = 800;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundFadingPopUp_FormItem1:FormItem;
      
      public var _SoundFadingPopUp_FormItem2:FormItem;
      
      public var _SoundFadingPopUp_FormItem3:FormItem;
      
      public var _SoundFadingPopUp_Label1:Label;
      
      public var _SoundFadingPopUp_Label2:Label;
      
      private var _1990131276cancelButton:Button;
      
      private var _1361128838chrome:Group;
      
      private var _312699062closeButton:Button;
      
      private var _236983790confirmButton:Button;
      
      private var _358432834endDurationStepper:NumericStepper;
      
      private var _790419140endVolumeStepper:NumericStepper;
      
      private var _785099070middleVolumeStepper:NumericStepper;
      
      private var _106433028panel:Panel;
      
      private var _1097557894playButton:ToggleButton;
      
      private var _1710589249playbackMonitor:SoundPlaybackMonitor;
      
      private var _1126577081soundPreview:SoundFadingElement;
      
      private var _2110136084soundVolumeRenderer:SoundVolumeRenderer;
      
      private var _1648187941startDurationStepper:NumericStepper;
      
      private var _1436081899startVolumeStepper:NumericStepper;
      
      private var _908527938waveformGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _sound:AnimeSound;
      
      protected var _1732710949_isPlaying:Boolean;
      
      protected var _maxDuration:int = 0;
      
      protected var _maxDurationInSeconds:Number;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundFadingPopUp()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundFadingPopUp_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SoundFadingPopUpWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundFadingPopUp[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SoundFadingPopUp_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundFadingPopUp._watcherSetupUtil = param1;
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
      public function get sound#1() : AnimeSound
      {
         return this._sound;
      }
      
      private function set _109627663sound(param1:AnimeSound) : void
      {
         this._sound = param1;
         if(this._sound)
         {
            if(this._sound.isTrimmed)
            {
               this._maxDuration = this._sound.defaultTotalFrame;
            }
            else
            {
               this._maxDuration = this._sound.totalFrame;
            }
            if(initialized)
            {
               this.updateDurationLimit();
               this.updateValues();
            }
         }
      }
      
      override protected function init() : void
      {
         this.startDurationStepper.stepSize = DURATION_STEP_SIZE;
         this.startDurationStepper.minimum = MIN_DURATION;
         this.endDurationStepper.stepSize = DURATION_STEP_SIZE;
         this.endDurationStepper.minimum = MIN_DURATION;
         this.startVolumeStepper.stepSize = VOLUME_STEP_SIZE;
         this.startVolumeStepper.snapInterval = VOLUME_SNAP_INTERVAL;
         this.startVolumeStepper.minimum = MIN_VOLUME;
         this.startVolumeStepper.maximum = MAX_VOLUME;
         this.middleVolumeStepper.stepSize = VOLUME_STEP_SIZE;
         this.middleVolumeStepper.snapInterval = VOLUME_SNAP_INTERVAL;
         this.middleVolumeStepper.minimum = MIN_VOLUME;
         this.middleVolumeStepper.maximum = MAX_VOLUME;
         this.endVolumeStepper.stepSize = VOLUME_STEP_SIZE;
         this.endVolumeStepper.snapInterval = VOLUME_SNAP_INTERVAL;
         this.endVolumeStepper.minimum = MIN_VOLUME;
         this.endVolumeStepper.maximum = MAX_VOLUME;
         this.updateDurationLimit();
      }
      
      override public function open(param1:DisplayObjectContainer, param2:Boolean = false) : void
      {
         super.open(param1,param2);
         if(this._sound)
         {
            this._isPlaying = false;
            this.updateValues();
            if(initialized)
            {
               this.soundPreview.invalidateWaveform();
            }
         }
      }
      
      override protected function confirm() : void
      {
         var _loc1_:ChangeAdvancedSoundFadingCommand = new ChangeAdvancedSoundFadingCommand(this._sound);
         _loc1_.newFadeInDuration = UtilUnitConvert.secToFrame(this.startDurationStepper.value,true,true);
         _loc1_.newFadeInVolume = this.startVolumeStepper.value * 0.01;
         _loc1_.newFadeOutDuration = UtilUnitConvert.secToFrame(this.endDurationStepper.value,true,true);
         _loc1_.newFadeOutVolume = this.endVolumeStepper.value * 0.01;
         _loc1_.newMiddleVolume = this.middleVolumeStepper.value * 0.01;
         _loc1_.commit();
         _loc1_.execute();
         SoundPlaybackManager.stop();
         super.confirm();
      }
      
      override protected function cancel() : void
      {
         SoundPlaybackManager.stop();
         super.cancel();
      }
      
      protected function updateDurationLimit() : void
      {
         this._maxDurationInSeconds = UtilUnitConvert.frameToSec(this._maxDuration);
         this._maxDurationInSeconds = Math.ceil(this._maxDurationInSeconds / DURATION_STEP_SIZE) * DURATION_STEP_SIZE;
         this.startDurationStepper.maximum = this._maxDurationInSeconds;
         this.endDurationStepper.maximum = this._maxDurationInSeconds;
      }
      
      protected function updateValues() : void
      {
         this.startVolumeStepper.value = this._sound.fadeInVolume * 100;
         this.startDurationStepper.value = UtilUnitConvert.frameToSec(this._sound.effectiveFadeInDuration);
         this.middleVolumeStepper.value = this._sound.volume * 100;
         this.endVolumeStepper.value = this._sound.fadeOutVolume * 100;
         this.endDurationStepper.value = UtilUnitConvert.frameToSec(this._sound.effectiveFadeOutDuration);
         this.updateVolumeIndicator();
         this.playbackMonitor.stopMonitor();
         this.playbackMonitor.fitToSound(this._sound);
      }
      
      protected function updateVolumeIndicator() : void
      {
         var _loc1_:int = UtilUnitConvert.secToFrame(this.startDurationStepper.value,true,true);
         var _loc2_:int = UtilUnitConvert.secToFrame(this.endDurationStepper.value,true,true);
         var _loc3_:Number = this.startVolumeStepper.value * 0.01;
         var _loc4_:Number = this.endVolumeStepper.value * 0.01;
         var _loc5_:Number = this.middleVolumeStepper.value * 0.01;
         this.soundVolumeRenderer.drawWithValues(_loc5_,_loc3_,_loc4_,_loc1_,_loc2_);
      }
      
      protected function startDurationStepper_changeHandler(param1:Event) : void
      {
         if(this.startDurationStepper.value + this.endDurationStepper.value > this._maxDurationInSeconds)
         {
            this.endDurationStepper.value = this._maxDurationInSeconds - this.startDurationStepper.value;
         }
         this.updateVolumeIndicator();
      }
      
      protected function startVolumeStepper_changeHandler(param1:Event) : void
      {
         if(this.startVolumeStepper.value > this.middleVolumeStepper.value)
         {
            this.middleVolumeStepper.value = this.startVolumeStepper.value;
         }
         this.updateVolumeIndicator();
      }
      
      protected function endDurationStepper_changeHandler(param1:Event) : void
      {
         if(this.startDurationStepper.value + this.endDurationStepper.value > this._maxDurationInSeconds)
         {
            this.startDurationStepper.value = this._maxDurationInSeconds - this.endDurationStepper.value;
         }
         this.updateVolumeIndicator();
      }
      
      protected function endVolumeStepper_changeHandler(param1:Event) : void
      {
         if(this.endVolumeStepper.value > this.middleVolumeStepper.value)
         {
            this.middleVolumeStepper.value = this.endVolumeStepper.value;
         }
         this.updateVolumeIndicator();
      }
      
      protected function middleVolumeStepper_changeHandler(param1:Event) : void
      {
         if(this.middleVolumeStepper.value < this.startVolumeStepper.value)
         {
            this.startVolumeStepper.value = this.middleVolumeStepper.value;
         }
         if(this.middleVolumeStepper.value < this.endVolumeStepper.value)
         {
            this.endVolumeStepper.value = this.middleVolumeStepper.value;
         }
         this.updateVolumeIndicator();
      }
      
      protected function playButton_clickHandler(param1:MouseEvent) : void
      {
         if(!this._isPlaying)
         {
            this.startPlayback();
         }
         else
         {
            this.stopPlayback();
         }
      }
      
      private function startPlayback() : void
      {
         if(!this._sound || !this._sound.soundThumb)
         {
            return;
         }
         if(this._sound.soundThumb.sound#1)
         {
            this._sound.soundThumb.sound#1.addEventListener(SoundEvent.PLAY_COMPLETE,this.sound_playCompleteHandler);
         }
         var _loc1_:Number = 0;
         if(this.playbackMonitor.selectedStartTime > 0)
         {
            _loc1_ = this.playbackMonitor.selectedStartTime;
         }
         if(this._sound.isTrimmed)
         {
            _loc1_ = _loc1_ + UtilUnitConvert.frameToDuration(this._sound.trimStartFrame) * 1000;
         }
         var _loc2_:Number = UtilUnitConvert.frameToDuration(!!this._sound.isTrimmed?uint(this._sound.trimEndFrame):uint(this._sound.endFrame)) * 1000;
         var _loc3_:Number = UtilUnitConvert.secToFrame(this.startDurationStepper.value,true,true);
         var _loc4_:Number = this.startVolumeStepper.value * 0.01;
         var _loc5_:Number = UtilUnitConvert.secToFrame(this.endDurationStepper.value,true,true);
         var _loc6_:Number = this.endVolumeStepper.value * 0.01;
         var _loc7_:Number = this.middleVolumeStepper.value * 0.01;
         var _loc8_:* = !this._sound.scene;
         SoundPlaybackManager.playSoundThumb(this._sound.soundThumb,_loc1_,null,_loc7_,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc8_);
         this.startIndicator(_loc1_,this._sound.soundThumb.sound#1,this._sound.isTrimmed,this._sound.trimStartFrame,this._sound.trimEndFrame);
         this._isPlaying = true;
      }
      
      private function stopPlayback() : void
      {
         this.stopIndicator();
         SoundPlaybackManager.stop();
         this._isPlaying = false;
      }
      
      protected function sound_playCompleteHandler(param1:Event) : void
      {
         this.stopIndicator();
         SoundPlaybackManager.stop();
         this._isPlaying = false;
      }
      
      public function startIndicator(param1:Number = 0, param2:ISoundable = null, param3:Boolean = false, param4:Number = 0, param5:Number = 0) : void
      {
         this.playbackMonitor.startMonitor(param1,param2,param3,param4,param5);
         this.playbackMonitor.visible = true;
      }
      
      public function stopIndicator() : void
      {
         this.playbackMonitor.stopMonitor();
      }
      
      protected function playbackMonitor_clickHandler(param1:MouseEvent) : void
      {
         if(this._isPlaying)
         {
            this.startPlayback();
         }
      }
      
      protected function waveformGroup_rollOverHandler(param1:MouseEvent) : void
      {
         this.soundPreview.hovered = true;
      }
      
      protected function waveformGroup_rollOutHandler(param1:MouseEvent) : void
      {
         this.soundPreview.hovered = false;
      }
      
      private function _SoundFadingPopUp_Array1_c() : Array
      {
         var _loc1_:Array = [this._SoundFadingPopUp_Group1_i()];
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SoundFadingPopUp_Panel1_i(),this._SoundFadingPopUp_Button3_i()];
         _loc1_.id = "chrome";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chrome = _loc1_;
         BindingManager.executeBindings(this,"chrome",this.chrome);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.width = 400;
         _loc1_.controlBarContent = [this._SoundFadingPopUp_Button1_i(),this._SoundFadingPopUp_Button2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SoundFadingPopUp_Array4_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "secondary";
         _loc1_.addEventListener("click",this.__cancelButton_click);
         _loc1_.id = "cancelButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cancelButton = _loc1_;
         BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
         return _loc1_;
      }
      
      public function __cancelButton_click(param1:MouseEvent) : void
      {
         this.cancel();
      }
      
      private function _SoundFadingPopUp_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.__confirmButton_click);
         _loc1_.id = "confirmButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmButton = _loc1_;
         BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
         return _loc1_;
      }
      
      public function __confirmButton_click(param1:MouseEvent) : void
      {
         this.confirm();
      }
      
      private function _SoundFadingPopUp_Array4_c() : Array
      {
         var _loc1_:Array = [this._SoundFadingPopUp_PopUpContentBackground1_c(),this._SoundFadingPopUp_VGroup1_c()];
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_PopUpContentBackground1_c() : PopUpContentBackground
      {
         var _loc1_:PopUpContentBackground = new PopUpContentBackground();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._SoundFadingPopUp_VGroup2_c(),this._SoundFadingPopUp_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingBottom = 10;
         _loc1_.paddingTop = 10;
         _loc1_.paddingLeft = 28;
         _loc1_.mxmlContent = [this._SoundFadingPopUp_Form1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.styleName = "compact";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SoundFadingPopUp_Array7_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Array7_c() : Array
      {
         var _loc1_:Array = [this._SoundFadingPopUp_FormItem1_i(),this._SoundFadingPopUp_FormItem2_i(),this._SoundFadingPopUp_FormItem3_i()];
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SoundFadingPopUp_Array8_c);
         _loc1_.id = "_SoundFadingPopUp_FormItem1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundFadingPopUp_FormItem1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundFadingPopUp_FormItem1",this._SoundFadingPopUp_FormItem1);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Array8_c() : Array
      {
         var _loc1_:Array = [this._SoundFadingPopUp_HGroup1_c()];
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._SoundFadingPopUp_NumericStepper1_i(),this._SoundFadingPopUp_Spacer1_c(),this._SoundFadingPopUp_Label1_i(),this._SoundFadingPopUp_NumericStepper2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.percentWidth = 100;
         _loc1_.usePercentageFormat = true;
         _loc1_.precision = 0;
         _loc1_.addEventListener("change",this.__startVolumeStepper_change);
         _loc1_.id = "startVolumeStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startVolumeStepper = _loc1_;
         BindingManager.executeBindings(this,"startVolumeStepper",this.startVolumeStepper);
         return _loc1_;
      }
      
      public function __startVolumeStepper_change(param1:Event) : void
      {
         this.startVolumeStepper_changeHandler(param1);
      }
      
      private function _SoundFadingPopUp_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 20;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_SoundFadingPopUp_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundFadingPopUp_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundFadingPopUp_Label1",this._SoundFadingPopUp_Label1);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.precision = 3;
         _loc1_.addEventListener("change",this.__startDurationStepper_change);
         _loc1_.id = "startDurationStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startDurationStepper = _loc1_;
         BindingManager.executeBindings(this,"startDurationStepper",this.startDurationStepper);
         return _loc1_;
      }
      
      public function __startDurationStepper_change(param1:Event) : void
      {
         this.startDurationStepper_changeHandler(param1);
      }
      
      private function _SoundFadingPopUp_FormItem2_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SoundFadingPopUp_Array10_c);
         _loc1_.id = "_SoundFadingPopUp_FormItem2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundFadingPopUp_FormItem2 = _loc1_;
         BindingManager.executeBindings(this,"_SoundFadingPopUp_FormItem2",this._SoundFadingPopUp_FormItem2);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Array10_c() : Array
      {
         var _loc1_:Array = [this._SoundFadingPopUp_HGroup2_c()];
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._SoundFadingPopUp_NumericStepper3_i(),this._SoundFadingPopUp_Spacer2_c(),this._SoundFadingPopUp_Spacer3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_NumericStepper3_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.percentWidth = 100;
         _loc1_.usePercentageFormat = true;
         _loc1_.precision = 0;
         _loc1_.addEventListener("change",this.__middleVolumeStepper_change);
         _loc1_.id = "middleVolumeStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.middleVolumeStepper = _loc1_;
         BindingManager.executeBindings(this,"middleVolumeStepper",this.middleVolumeStepper);
         return _loc1_;
      }
      
      public function __middleVolumeStepper_change(param1:Event) : void
      {
         this.middleVolumeStepper_changeHandler(param1);
      }
      
      private function _SoundFadingPopUp_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_FormItem3_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SoundFadingPopUp_Array12_c);
         _loc1_.id = "_SoundFadingPopUp_FormItem3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundFadingPopUp_FormItem3 = _loc1_;
         BindingManager.executeBindings(this,"_SoundFadingPopUp_FormItem3",this._SoundFadingPopUp_FormItem3);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Array12_c() : Array
      {
         var _loc1_:Array = [this._SoundFadingPopUp_HGroup3_c()];
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._SoundFadingPopUp_NumericStepper4_i(),this._SoundFadingPopUp_Spacer4_c(),this._SoundFadingPopUp_Label2_i(),this._SoundFadingPopUp_NumericStepper5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_NumericStepper4_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.percentWidth = 100;
         _loc1_.usePercentageFormat = true;
         _loc1_.precision = 0;
         _loc1_.addEventListener("change",this.__endVolumeStepper_change);
         _loc1_.id = "endVolumeStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endVolumeStepper = _loc1_;
         BindingManager.executeBindings(this,"endVolumeStepper",this.endVolumeStepper);
         return _loc1_;
      }
      
      public function __endVolumeStepper_change(param1:Event) : void
      {
         this.endVolumeStepper_changeHandler(param1);
      }
      
      private function _SoundFadingPopUp_Spacer4_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 20;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_SoundFadingPopUp_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundFadingPopUp_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_SoundFadingPopUp_Label2",this._SoundFadingPopUp_Label2);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_NumericStepper5_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.precision = 3;
         _loc1_.addEventListener("change",this.__endDurationStepper_change);
         _loc1_.id = "endDurationStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.endDurationStepper = _loc1_;
         BindingManager.executeBindings(this,"endDurationStepper",this.endDurationStepper);
         return _loc1_;
      }
      
      public function __endDurationStepper_change(param1:Event) : void
      {
         this.endDurationStepper_changeHandler(param1);
      }
      
      private function _SoundFadingPopUp_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._SoundFadingPopUp_Rect1_c(),this._SoundFadingPopUp_VGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SoundFadingPopUp_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3626361;
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 20;
         _loc1_.paddingBottom = 20;
         _loc1_.gap = 10;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._SoundFadingPopUp_Group3_i(),this._SoundFadingPopUp_ToggleButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._SoundFadingPopUp_SoundFadingElement1_i(),this._SoundFadingPopUp_SoundVolumeRenderer1_i(),this._SoundFadingPopUp_SoundPlaybackMonitor1_i()];
         _loc1_.addEventListener("rollOut",this.__waveformGroup_rollOut);
         _loc1_.addEventListener("rollOver",this.__waveformGroup_rollOver);
         _loc1_.id = "waveformGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.waveformGroup = _loc1_;
         BindingManager.executeBindings(this,"waveformGroup",this.waveformGroup);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_SoundFadingElement1_i() : SoundFadingElement
      {
         var _loc1_:SoundFadingElement = new SoundFadingElement();
         _loc1_.percentWidth = 100;
         _loc1_.id = "soundPreview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundPreview = _loc1_;
         BindingManager.executeBindings(this,"soundPreview",this.soundPreview);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_SoundVolumeRenderer1_i() : SoundVolumeRenderer
      {
         var _loc1_:SoundVolumeRenderer = new SoundVolumeRenderer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "soundVolumeRenderer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.soundVolumeRenderer = _loc1_;
         BindingManager.executeBindings(this,"soundVolumeRenderer",this.soundVolumeRenderer);
         return _loc1_;
      }
      
      private function _SoundFadingPopUp_SoundPlaybackMonitor1_i() : SoundPlaybackMonitor
      {
         var _loc1_:SoundPlaybackMonitor = new SoundPlaybackMonitor();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.allowSelection = true;
         _loc1_.addEventListener("click",this.__playbackMonitor_click);
         _loc1_.id = "playbackMonitor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playbackMonitor = _loc1_;
         BindingManager.executeBindings(this,"playbackMonitor",this.playbackMonitor);
         return _loc1_;
      }
      
      public function __playbackMonitor_click(param1:MouseEvent) : void
      {
         this.playbackMonitor_clickHandler(param1);
      }
      
      public function __waveformGroup_rollOut(param1:MouseEvent) : void
      {
         this.waveformGroup_rollOutHandler(param1);
      }
      
      public function __waveformGroup_rollOver(param1:MouseEvent) : void
      {
         this.waveformGroup_rollOverHandler(param1);
      }
      
      private function _SoundFadingPopUp_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",PlayFadingToggleButtonSkin);
         _loc1_.addEventListener("click",this.__playButton_click);
         _loc1_.id = "playButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playButton = _loc1_;
         BindingManager.executeBindings(this,"playButton",this.playButton);
         return _loc1_;
      }
      
      public function __playButton_click(param1:MouseEvent) : void
      {
         this.playButton_clickHandler(param1);
      }
      
      private function _SoundFadingPopUp_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.styleName = "closePopUp";
         _loc1_.buttonMode = true;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.width = 50;
         _loc1_.height = 50;
         _loc1_.addEventListener("click",this.__closeButton_click);
         _loc1_.id = "closeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeButton = _loc1_;
         BindingManager.executeBindings(this,"closeButton",this.closeButton);
         return _loc1_;
      }
      
      public function __closeButton_click(param1:MouseEvent) : void
      {
         this.cancel();
      }
      
      private function _SoundFadingPopUp_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Advanced Settings");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Cancel");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"cancelButton.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Save");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"confirmButton.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Begin at:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SoundFadingPopUp_FormItem1.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Duration:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SoundFadingPopUp_Label1.text");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Constant level:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SoundFadingPopUp_FormItem2.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("End at:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SoundFadingPopUp_FormItem3.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Duration:");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SoundFadingPopUp_Label2.text");
         result[8] = new Binding(this,null,null,"soundPreview.animeSound","sound");
         result[9] = new Binding(this,null,null,"soundVolumeRenderer.animeSound","sound");
         result[10] = new Binding(this,function():Boolean
         {
            return _isPlaying;
         },null,"playButton.selected");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get cancelButton() : Button
      {
         return this._1990131276cancelButton;
      }
      
      public function set cancelButton(param1:Button) : void
      {
         var _loc2_:Object = this._1990131276cancelButton;
         if(_loc2_ !== param1)
         {
            this._1990131276cancelButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chrome() : Group
      {
         return this._1361128838chrome;
      }
      
      public function set chrome(param1:Group) : void
      {
         var _loc2_:Object = this._1361128838chrome;
         if(_loc2_ !== param1)
         {
            this._1361128838chrome = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chrome",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get closeButton() : Button
      {
         return this._312699062closeButton;
      }
      
      public function set closeButton(param1:Button) : void
      {
         var _loc2_:Object = this._312699062closeButton;
         if(_loc2_ !== param1)
         {
            this._312699062closeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get confirmButton() : Button
      {
         return this._236983790confirmButton;
      }
      
      public function set confirmButton(param1:Button) : void
      {
         var _loc2_:Object = this._236983790confirmButton;
         if(_loc2_ !== param1)
         {
            this._236983790confirmButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endDurationStepper() : NumericStepper
      {
         return this._358432834endDurationStepper;
      }
      
      public function set endDurationStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._358432834endDurationStepper;
         if(_loc2_ !== param1)
         {
            this._358432834endDurationStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endDurationStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get endVolumeStepper() : NumericStepper
      {
         return this._790419140endVolumeStepper;
      }
      
      public function set endVolumeStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._790419140endVolumeStepper;
         if(_loc2_ !== param1)
         {
            this._790419140endVolumeStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endVolumeStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get middleVolumeStepper() : NumericStepper
      {
         return this._785099070middleVolumeStepper;
      }
      
      public function set middleVolumeStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._785099070middleVolumeStepper;
         if(_loc2_ !== param1)
         {
            this._785099070middleVolumeStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"middleVolumeStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panel() : Panel
      {
         return this._106433028panel;
      }
      
      public function set panel(param1:Panel) : void
      {
         var _loc2_:Object = this._106433028panel;
         if(_loc2_ !== param1)
         {
            this._106433028panel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playButton() : ToggleButton
      {
         return this._1097557894playButton;
      }
      
      public function set playButton(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1097557894playButton;
         if(_loc2_ !== param1)
         {
            this._1097557894playButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playButton",_loc2_,param1));
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
      public function get soundPreview() : SoundFadingElement
      {
         return this._1126577081soundPreview;
      }
      
      public function set soundPreview(param1:SoundFadingElement) : void
      {
         var _loc2_:Object = this._1126577081soundPreview;
         if(_loc2_ !== param1)
         {
            this._1126577081soundPreview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundPreview",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get soundVolumeRenderer() : SoundVolumeRenderer
      {
         return this._2110136084soundVolumeRenderer;
      }
      
      public function set soundVolumeRenderer(param1:SoundVolumeRenderer) : void
      {
         var _loc2_:Object = this._2110136084soundVolumeRenderer;
         if(_loc2_ !== param1)
         {
            this._2110136084soundVolumeRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"soundVolumeRenderer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startDurationStepper() : NumericStepper
      {
         return this._1648187941startDurationStepper;
      }
      
      public function set startDurationStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1648187941startDurationStepper;
         if(_loc2_ !== param1)
         {
            this._1648187941startDurationStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startDurationStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startVolumeStepper() : NumericStepper
      {
         return this._1436081899startVolumeStepper;
      }
      
      public function set startVolumeStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1436081899startVolumeStepper;
         if(_loc2_ !== param1)
         {
            this._1436081899startVolumeStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startVolumeStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get waveformGroup() : Group
      {
         return this._908527938waveformGroup;
      }
      
      public function set waveformGroup(param1:Group) : void
      {
         var _loc2_:Object = this._908527938waveformGroup;
         if(_loc2_ !== param1)
         {
            this._908527938waveformGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"waveformGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _isPlaying() : Boolean
      {
         return this._1732710949_isPlaying;
      }
      
      protected function set _isPlaying(param1:Boolean) : void
      {
         var _loc2_:Object = this._1732710949_isPlaying;
         if(_loc2_ !== param1)
         {
            this._1732710949_isPlaying = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_isPlaying",_loc2_,param1));
            }
         }
      }
      
      public function set sound#1(param1:AnimeSound) : void
      {
         var _loc2_:Object = this.sound#1;
         if(_loc2_ !== param1)
         {
            this._109627663sound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sound",_loc2_,param1));
            }
         }
      }
   }
}
