package anifire.studio.components
{
   import anifire.event.ExtraDataEvent;
   import anifire.studio.commands.ChangeSoundLineCommand;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.MicRecordingHelper;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.SpeechData;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.core.sound.SoundThumbEvent;
   import anifire.studio.events.MicRecordingEvent;
   import anifire.studio.events.VoicePanelEvent;
   import anifire.studio.interfaces.ISpeechSubComponent;
   import anifire.studio.managers.MicRecordingManager;
   import anifire.studio.skins.MicStopButtonSkin;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilString;
   import com.jac.ogg.events.OggEncoderEvent;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.media.Microphone;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.Proxy;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.effects.Parallel;
   import mx.events.EffectEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Image;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextArea;
   import spark.components.VGroup;
   import spark.effects.Fade;
   import spark.effects.Resize;
   import spark.effects.Scale;
   import spark.events.TextOperationEvent;
   import spark.primitives.BitmapImage;
   import spark.primitives.Ellipse;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class MicRecordingComponent extends Group implements ISpeechSubComponent, IBindingClient, IStateClient2
   {
      
      private static var PITCH_TIP_PREFIX:String = UtilDict.toDisplay("go","Pitch");
      
      private static var PITCH_UNCHANGED:String = UtilDict.toDisplay("go","Unchanged");
      
      private static const ADD_VOICE_COPY:String = UtilDict.toDisplay("go","Add Voice");
      
      private static const UPDATE_VOICE_COPY:String = UtilDict.toDisplay("go","Update");
      
      private static const DEFAULT_ALERTBOX_PADDING_BOTTOM:Number = 28;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _523135114_MicRecordingComponent_Button3:Button;
      
      public var _MicRecordingComponent_Button4:Button;
      
      public var _MicRecordingComponent_Button5:Button;
      
      public var _MicRecordingComponent_Fade1:Fade;
      
      private var _1093183170_MicRecordingComponent_Group6:Group;
      
      public var _MicRecordingComponent_Label4:Label;
      
      public var _MicRecordingComponent_Label5:Label;
      
      private var _835099118_MicRecordingComponent_MicRecordButton1:MicRecordButton;
      
      public var _MicRecordingComponent_Parallel2:Parallel;
      
      public var _MicRecordingComponent_Resize1:Resize;
      
      public var _MicRecordingComponent_Scale1:Scale;
      
      private var _1539829851_MicRecordingComponent_SetProperty1:SetProperty;
      
      private var _1539829850_MicRecordingComponent_SetProperty2:SetProperty;
      
      private var _1539829849_MicRecordingComponent_SetProperty3:SetProperty;
      
      private var _1271861795_MicRecordingComponent_VGroup1:VGroup;
      
      private var _1271861794_MicRecordingComponent_VGroup2:VGroup;
      
      private var _76216227addVoiceButton:Button;
      
      private var _1615376079alertBox:HGroup;
      
      private var _1781625235buttonGroup:Group;
      
      private var _1990131276cancelButton:Button;
      
      private var _1030655968countdown1:Image;
      
      private var _1030655967countdown2:Image;
      
      private var _1030655966countdown3:Image;
      
      private var _2112093941dialogControl:DialogDetailControlGroup;
      
      private var _1613969751errorGroup:Group;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1818284309lineGroup:VGroup;
      
      private var _1890776210lineTextArea:TextArea;
      
      private var _1098181693mainInfoPanel:Group;
      
      private var _1755463434mainInfoPanelText:Group;
      
      private var _1488472108mainInfoText:Label;
      
      private var _1432568646mainRecordPanel:HGroup;
      
      private var _1766135109messageDisplay:Label;
      
      private var _1304200403messageLabel:Label;
      
      private var _871873058micLevelImage:Image;
      
      private var _443658743micLevelMask:Group;
      
      private var _1841957693nextRecorded:Transition;
      
      private var _106433028panel:Panel;
      
      private var _1460446276recordFinish:Transition;
      
      private var _80023010sliderGroup:VGroup;
      
      private var _1919414987timeDisplay:Label;
      
      private var _1893287094titleDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var helper:MicRecordingHelper;
      
      private var _isZoomSelected:Boolean;
      
      private var _isActionSelected:Boolean;
      
      private var _target:Object;
      
      private var _1203236063errorMessage:String;
      
      private var _1649539652_pitchSource:ArrayCollection;
      
      private var _volume:Number = 1;
      
      private var _pitch:Number = 0;
      
      private var _834112942_addVoiceButtonLabel:String;
      
      private var _503942753_lineChanged:Boolean;
      
      private var _sound:AnimeSound;
      
      private var _timer:Timer;
      
      private var _embed_mxml__styles_images_voicetab_recording_2_png_1508568599:Class;
      
      private var _embed_mxml__styles_images_panel_recordingbar_png_113703831:Class;
      
      private var _embed_mxml__styles_images_voicetab_recording_1_png_1524809491:Class;
      
      private var _embed_mxml__styles_images_icons_message_alert_png_1504559595:Class;
      
      private var _embed_mxml__styles_images_voicetab_recording_3_png_1508556567:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MicRecordingComponent()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._834112942_addVoiceButtonLabel = ADD_VOICE_COPY;
         this._embed_mxml__styles_images_voicetab_recording_2_png_1508568599 = MicRecordingComponent__embed_mxml__styles_images_voicetab_recording_2_png_1508568599;
         this._embed_mxml__styles_images_panel_recordingbar_png_113703831 = MicRecordingComponent__embed_mxml__styles_images_panel_recordingbar_png_113703831;
         this._embed_mxml__styles_images_voicetab_recording_1_png_1524809491 = MicRecordingComponent__embed_mxml__styles_images_voicetab_recording_1_png_1524809491;
         this._embed_mxml__styles_images_icons_message_alert_png_1504559595 = MicRecordingComponent__embed_mxml__styles_images_icons_message_alert_png_1504559595;
         this._embed_mxml__styles_images_voicetab_recording_3_png_1508556567 = MicRecordingComponent__embed_mxml__styles_images_voicetab_recording_3_png_1508556567;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._MicRecordingComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_MicRecordingComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MicRecordingComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [this._MicRecordingComponent_Transition1_i(),this._MicRecordingComponent_Transition2_i()];
         this.mxmlContent = [this._MicRecordingComponent_Panel1_i()];
         this.currentState = "ready";
         var _MicRecordingComponent_Group9_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._MicRecordingComponent_Group9_i);
         states = [new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_MicRecordButton1",
               "name":"enabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"lineTextArea",
               "name":"enabled",
               "value":true
            })]
         }),new State({
            "name":"countdown",
            "overrides":[]
         }),new State({
            "name":"requesting",
            "overrides":[]
         }),new State({
            "name":"recording",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_MicRecordButton1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_Button3",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_Group6",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"messageDisplay",
               "name":"color",
               "value":16777215
            })]
         }),new State({
            "name":"closing",
            "stateGroups":["recordDone"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"percentWidth",
               "value":15
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingLeft",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingRight",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleX",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleY",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"alpha",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanel",
               "name":"percentWidth",
               "value":85
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanelText",
               "name":"width",
               "value":400
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoText",
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"record_none",
            "stateGroups":["previewing","recordDone"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"percentWidth",
               "value":15
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingLeft",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingRight",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleX",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleY",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"alpha",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_MicRecordButton1",
               "name":"enabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_MicRecordButton1",
               "name":"customToolTip",
               "value":"Record again"
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanel",
               "name":"percentWidth",
               "value":85
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanelText",
               "name":"width",
               "value":400
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoText",
               "name":"alpha",
               "value":1
            }),this._MicRecordingComponent_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"mainInfoText",
               "name":"text",
               "value":undefined
            }))]
         }),new State({
            "name":"recorded",
            "stateGroups":["previewing","recordDone"],
            "overrides":[new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"addVoiceButton",
               "name":"enabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"percentWidth",
               "value":15
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingLeft",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingRight",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleX",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleY",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"alpha",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_MicRecordButton1",
               "name":"enabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_MicRecordButton1",
               "name":"customToolTip",
               "value":"Record again"
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanel",
               "name":"percentWidth",
               "value":85
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanelText",
               "name":"width",
               "value":400
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoText",
               "name":"alpha",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"sliderGroup",
               "name":"paddingBottom",
               "value":28
            }),new SetProperty().initializeFromObject({
               "target":"dialogControl",
               "name":"includeInLayout",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"dialogControl",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"lineTextArea",
               "name":"enabled",
               "value":true
            })]
         }),new State({
            "name":"encoding",
            "stateGroups":["recordDone","generating"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"cancelButton",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"percentWidth",
               "value":15
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingLeft",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingRight",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleX",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleY",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"alpha",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanel",
               "name":"percentWidth",
               "value":85
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanelText",
               "name":"width",
               "value":400
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoText",
               "name":"alpha",
               "value":1
            }),this._MicRecordingComponent_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"mainInfoText",
               "name":"text",
               "value":undefined
            }))]
         }),new State({
            "name":"encoded",
            "stateGroups":["recordDone","generating"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"cancelButton",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"percentWidth",
               "value":15
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingLeft",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"mainRecordPanel",
               "name":"paddingRight",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleX",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"scaleY",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"buttonGroup",
               "name":"alpha",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup2",
               "name":"includeInLayout",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanel",
               "name":"percentWidth",
               "value":85
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoPanelText",
               "name":"width",
               "value":400
            }),new SetProperty().initializeFromObject({
               "target":"mainInfoText",
               "name":"alpha",
               "value":1
            }),this._MicRecordingComponent_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"mainInfoText",
               "name":"text",
               "value":undefined
            }))]
         }),new State({
            "name":"error",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_MicRecordingComponent_Group9_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["panel"]
            }),new SetProperty().initializeFromObject({
               "target":"_MicRecordingComponent_VGroup1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"alertBox",
               "name":"visible",
               "value":false
            })]
         })];
         BindingManager.executeBindings(this,"_MicRecordingComponent_SetProperty1",this._MicRecordingComponent_SetProperty1);
         BindingManager.executeBindings(this,"_MicRecordingComponent_SetProperty2",this._MicRecordingComponent_SetProperty2);
         BindingManager.executeBindings(this,"_MicRecordingComponent_SetProperty3",this._MicRecordingComponent_SetProperty3);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MicRecordingComponent._watcherSetupUtil = param1;
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
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         this.init();
         this._target = param1;
      }
      
      public function set sound#1(param1:AnimeSound) : void
      {
         this._sound = param1;
         this._lineChanged = false;
         if(this._sound)
         {
            this._addVoiceButtonLabel = UPDATE_VOICE_COPY;
            if(this._sound.soundThumb && this._sound.soundThumb.ttsData)
            {
               this.lineTextArea.text = this._sound.soundThumb.ttsData.text;
            }
         }
         else
         {
            this._addVoiceButtonLabel = ADD_VOICE_COPY;
            this.lineTextArea.text = "";
         }
      }
      
      public function set loadProgress(param1:Number) : void
      {
      }
      
      private function init() : void
      {
         this.countdown1.visible = this.countdown2.visible = this.countdown3.visible = false;
         this.dialogControl._speechPitchControl.pitch = this._pitch;
         this._volume = 1;
         this.dialogControl.addEventListener(ExtraDataEvent.UPDATE,this.onVolumeUpdate);
         this.dialogControl.addEventListener(ExtraDataEvent.PITCH_UPDATE,this.onPitchUpdate);
         this.dialogControl._speechVolumeControl.volume = this._volume;
         if(!Util.playerIsUpdated(10,1))
         {
            this.errorMessage = UtilDict.toDisplay("go","Please upgrade your Flash Player to enable Mic Recording.");
         }
         else if(Microphone.names.length == 0)
         {
            this.errorMessage = UtilDict.toDisplay("go","Mic recording cannot be started. Please make sure your sound card and micophone are correctly installed.");
         }
         else
         {
            this.errorMessage = UtilDict.toDisplay("go","You can enable mic recording by allowing the video maker to access your microphone.\n\nTo do that, click on \"Try mic recording again\" and check \"Allow\" and \"Remember\" in the Flash Player settings window that opens.\n\nIf you are using Chrome, make sure you also allow Chrome to access your mic via the notification on top of your browser window.");
            currentState = "error";
            this.helper = MicRecordingHelper.getInstance();
            this.helper.addEventListener(MicRecordingEvent.START,this.onMicRecordingStart);
            this.helper.addEventListener(MicRecordingEvent.STOP,this.onMicRecordingStop);
            this.helper.addEventListener(MicRecordingEvent.DENIED,this.onMicRecordingDenied);
            this.helper.addEventListener(MicRecordingEvent.APPROVED,this.onMicRecordingApproved);
            this.helper.addEventListener(MicRecordingEvent.ACTIVITY,this.onMicRecordingActivity);
            this.helper.addEventListener(MicRecordingEvent.OUT_OF_DATA,this.onRecordPlayEnd);
            this.helper.requestMicrophoneAccess();
            this.updateTimeText();
            return;
         }
         currentState = "error";
      }
      
      private function updateTimeText() : void
      {
         this.timeDisplay.text = UtilString.convertSecToTimeString(this.helper.micRecordedTime);
      }
      
      private function onMicRecordingStart(param1:MicRecordingEvent) : void
      {
         currentState = "recording";
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onMicRecordingStop(param1:MicRecordingEvent) : void
      {
         if(this.helper.recordByte.length > 0)
         {
            currentState = "closing";
         }
         else
         {
            currentState = "record_none";
         }
         this.micLevelMask.height = 0;
      }
      
      private function onMicRecordingApproved(param1:MicRecordingEvent) : void
      {
         this.setReadyState();
         this.updateTimeText();
      }
      
      private function onMicRecordingDenied(param1:MicRecordingEvent) : void
      {
         UtilErrorLogger.getInstance().appendDebug("MicRecordingComponent: User denied access.");
         this.errorMessage = UtilDict.toDisplay("go","You can enable mic recording by allowing the video maker to access your microphone.\n\nTo do that, click on \"Try mic recording again\" and check \"Allow\" and \"Remember\" in the Flash Player settings window that opens.\n\nIf you are using Chrome, make sure you also allow Chrome to access your mic via the notification on top of your browser window.");
         currentState = "error";
      }
      
      private function onMicRecordingActivity(param1:MicRecordingEvent) : void
      {
         this.updateTimeText();
         var _loc2_:Number = param1.data as Number;
         this.micLevelMask.height = Math.min(_loc2_ * 0.7,70);
      }
      
      private function recordButton_clickHandler() : void
      {
         this.timeDisplay.text = "00:00";
         currentState = "countdown";
         this.startCountDown();
      }
      
      private function setReadyState() : void
      {
         currentState = "ready";
         this.mainRecordPanel.enabled = true;
         this.cancelButton.enabled = true;
         this.lineGroup.visible = true;
         this.lineGroup.includeInLayout = true;
         this.alertBox.paddingBottom = DEFAULT_ALERTBOX_PADDING_BOTTOM;
      }
      
      private function startCountDown() : void
      {
         this.helper.removeEventListener(MicRecordingEvent.APPROVED,this.startCountDown);
         this.showStepDown();
         this._timer = new Timer(1000,3);
         this._timer.addEventListener(TimerEvent.TIMER,this.showStepDown);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onCountDownFinish);
         this._timer.start();
      }
      
      private function showStepDown(param1:TimerEvent = null) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            _loc2_ = 3 - this._timer.currentCount;
         }
         else
         {
            _loc2_ = 3;
         }
         this.countdown1.visible = this.countdown2.visible = this.countdown3.visible = false;
         if(_loc2_ > 0)
         {
            this["countdown" + _loc2_].visible = true;
         }
      }
      
      private function onCountDownFinish(param1:TimerEvent) : void
      {
         this._timer.stop();
         this._timer = null;
         currentState = "requesting";
         this.countdown1.visible = this.countdown2.visible = this.countdown3.visible = false;
         this.helper.startRecording();
      }
      
      private function stopButton_clickHandler() : void
      {
         this.helper.stopRecording();
      }
      
      private function onVoiceControlPlay(param1:Event) : void
      {
         this.helper.playRecording();
      }
      
      private function onVoiceControlStop(param1:Event) : void
      {
         this.helper.stopRecordingPlayback();
      }
      
      private function onRecordPlayEnd(param1:Event) : void
      {
         this.dialogControl.resetPlayButton();
      }
      
      private function onVoiceControlDelete(param1:Event) : void
      {
         this.destroy();
      }
      
      private function onVolumeUpdate(param1:ExtraDataEvent) : void
      {
         this._volume = param1.getData() as Number;
         if(this.helper)
         {
            this.helper.volume = this._volume;
         }
      }
      
      private function onPitchUpdate(param1:ExtraDataEvent) : void
      {
         this._pitch = param1.getData() as Number;
         this.pitchUpdate();
      }
      
      public function commit(param1:Object) : void
      {
         this.helper.stopRecording(true);
         this._isZoomSelected = param1["zoom"];
         this._isActionSelected = param1["action"];
         var _loc2_:ByteArray = this.helper.recordByte;
         if(_loc2_ != null && _loc2_.length > 0)
         {
            this.mainRecordPanel.enabled = false;
            this.dialogControl.visible = false;
            this.addVoiceButton.enabled = false;
            this.cancelButton.enabled = false;
            this.alertBox.paddingBottom = DEFAULT_ALERTBOX_PADDING_BOTTOM + this.lineGroup.height;
            this.lineGroup.visible = false;
            this.lineGroup.includeInLayout = false;
            this.mainInfoText.text = UtilDict.toDisplay("go","Loading voice...");
            this.helper.addEventListener(OggEncoderEvent.ENCODE_PROGRESS,this.oggEncoding);
            this.helper.addEventListener(Event.COMPLETE,this.oggEncodeComplete);
            setTimeout(this.helper.encodeOGG,100);
            Console.getConsole().getLoadProgress.setLabal(UtilDict.toDisplay("go","encoding"));
         }
         else
         {
            currentState = "encoded";
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function oggEncoding(param1:OggEncoderEvent) : void
      {
         Console.getConsole().loadProgress = Number(param1.data) * 100;
      }
      
      private function oggEncodeComplete(param1:Event) : void
      {
         this.helper.removeEventListener(Event.COMPLETE,this.oggEncodeComplete);
         var _loc2_:URLRequest = MicRecordingManager.getRequestOfMicRecording(this.helper.saveOGG());
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.addEventListener(Event.COMPLETE,this.onUploadComplete);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.onUploadError);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUploadError);
         _loc3_.load(_loc2_);
         Console.getConsole().getLoadProgress.resetLabel();
         Console.getConsole().getLoadProgress.setLabal(UtilDict.toDisplay("go","uploading"));
         Console.getConsole().getLoadProgress.startAnimation();
      }
      
      private function onUploadComplete(param1:Event) : void
      {
         Console.getConsole().getLoadProgress.stopAnimation();
         var _loc2_:DataEvent = new DataEvent(DataEvent.UPLOAD_COMPLETE_DATA);
         var _loc3_:ByteArray = new ByteArray();
         var _loc4_:URLLoader = param1.currentTarget as URLLoader;
         _loc2_.data = _loc4_.data as String;
         dispatchEvent(_loc2_);
      }
      
      private function onUploadError(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onUploadError);
         dispatchEvent(param1);
      }
      
      public function saveSound(param1:ByteArray, param2:XML) : void
      {
         var _loc3_:SoundThumb = Console.getConsole().speechManager.createSoundThumbByByte(param1,param2);
         this.saveSoundBySoundThumb(_loc3_);
      }
      
      public function saveSoundBySoundThumb(param1:SoundThumb) : void
      {
         var _loc2_:SpeechData = new SpeechData();
         _loc2_.type = SpeechData.SOURCE_TYPE_MIC_RECORDING;
         _loc2_.text = !!this.lineTextArea.text?this.lineTextArea.text:"";
         param1.ttsData = _loc2_;
         var _loc3_:SoundThumbEvent = new SoundThumbEvent(SoundThumbEvent.SOUND_CREATED);
         _loc3_.soundThumb = param1;
         this.dispatchEvent(_loc3_);
         Console.getConsole().requestLoadStatus(false);
         currentState = "encoded";
      }
      
      private function onSoundAdded(param1:SoundEvent) : void
      {
         Console.getConsole().requestLoadStatus(false);
         dispatchEvent(new Event(Event.COMPLETE));
         this.mainRecordPanel.enabled = true;
         this.cancelButton.enabled = true;
         this.lineGroup.visible = true;
         this.lineGroup.includeInLayout = true;
         this.alertBox.paddingBottom = DEFAULT_ALERTBOX_PADDING_BOTTOM;
         this.mainInfoText.text = UtilDict.toDisplay("go","Done! Play your recording below");
         currentState = "encoded";
      }
      
      private function pitchUpdate() : void
      {
         this.helper.pitchShiftFactor = this._pitch * 0.01;
      }
      
      private function pitchSliderDataTipFunction(param1:Number) : Object
      {
         var _loc2_:* = null;
         if(param1 > 0)
         {
            _loc2_ = PITCH_TIP_PREFIX + " +" + param1 + "%";
         }
         else if(param1 < 0)
         {
            _loc2_ = PITCH_TIP_PREFIX + " " + param1 + "%";
         }
         else
         {
            _loc2_ = PITCH_UNCHANGED;
         }
         return _loc2_;
      }
      
      private function addVoiceButton_clickHandler() : void
      {
         var _loc2_:ChangeSoundLineCommand = null;
         if(this.currentState == "ready")
         {
            if(this._sound && this._sound.soundThumb && this._sound.soundThumb.ttsData)
            {
               _loc2_ = new ChangeSoundLineCommand(this._sound,this.lineTextArea.text);
               _loc2_.execute();
            }
            dispatchEvent(new Event("close"));
            return;
         }
         UtilErrorLogger.getInstance().info("SpeechComponent::onClickSave");
         Console.getConsole().requestLoadStatus(true);
         var _loc1_:Object = {};
         _loc1_["zoom"] = false;
         _loc1_["action"] = false;
         dispatchEvent(new ExtraDataEvent(ExtraDataEvent.PROCESSING,this));
         this.commit(_loc1_);
      }
      
      private function cancelButton_clickHandler() : void
      {
         dispatchEvent(new Event("close"));
      }
      
      private function retryButton_clickHandler() : void
      {
         this.init();
      }
      
      public function updateSoundThumb(param1:SoundThumb) : void
      {
      }
      
      public function destroy() : void
      {
         if(this.helper)
         {
            this.helper.stopRecording(true);
            this.timeDisplay.text = "00:00";
            this.helper.stopRecordingPlayback();
         }
         if(this._timer)
         {
            this._timer.stop();
            this._timer = null;
         }
         this.setReadyState();
      }
      
      protected function onEffectEnd(param1:EffectEvent) : void
      {
         currentState = "recorded";
      }
      
      protected function lineTextArea_changeHandler(param1:TextOperationEvent) : void
      {
         this._lineChanged = true;
      }
      
      private function _MicRecordingComponent_Transition1_i() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "closing";
         _loc1_.effect = this._MicRecordingComponent_Parallel1_c();
         this.recordFinish = _loc1_;
         BindingManager.executeBindings(this,"recordFinish",this.recordFinish);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Parallel1_c() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._MicRecordingComponent_Resize1_i(),this._MicRecordingComponent_Scale1_i(),this._MicRecordingComponent_Fade1_i()];
         _loc1_.addEventListener("effectEnd",this.___MicRecordingComponent_Parallel1_effectEnd);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Resize1_i() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 500;
         this._MicRecordingComponent_Resize1 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Resize1",this._MicRecordingComponent_Resize1);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Scale1_i() : Scale
      {
         var _loc1_:Scale = new Scale();
         _loc1_.duration = 500;
         this._MicRecordingComponent_Scale1 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Scale1",this._MicRecordingComponent_Scale1);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         this._MicRecordingComponent_Fade1 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Fade1",this._MicRecordingComponent_Fade1);
         return _loc1_;
      }
      
      public function ___MicRecordingComponent_Parallel1_effectEnd(param1:EffectEvent) : void
      {
         this.onEffectEnd(param1);
      }
      
      private function _MicRecordingComponent_Transition2_i() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "previewing";
         _loc1_.effect = this._MicRecordingComponent_Parallel2_i();
         this.nextRecorded = _loc1_;
         BindingManager.executeBindings(this,"nextRecorded",this.nextRecorded);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Parallel2_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._MicRecordingComponent_Resize2_c(),this._MicRecordingComponent_Fade2_c()];
         this._MicRecordingComponent_Parallel2 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Parallel2",this._MicRecordingComponent_Parallel2);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Resize2_c() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 800;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Fade2_c() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 800;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.controlBarContent = [this._MicRecordingComponent_Button1_i(),this._MicRecordingComponent_Button2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._MicRecordingComponent_Array12_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "grey";
         _loc1_.enabled = true;
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
         this.cancelButton_clickHandler();
      }
      
      private function _MicRecordingComponent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.__addVoiceButton_click);
         _loc1_.id = "addVoiceButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.addVoiceButton = _loc1_;
         BindingManager.executeBindings(this,"addVoiceButton",this.addVoiceButton);
         return _loc1_;
      }
      
      public function __addVoiceButton_click(param1:MouseEvent) : void
      {
         this.addVoiceButton_clickHandler();
      }
      
      private function _MicRecordingComponent_Array12_c() : Array
      {
         var _loc1_:Array = [this._MicRecordingComponent_PopUpContentBackground1_c(),this._MicRecordingComponent_VGroup1_i()];
         return _loc1_;
      }
      
      private function _MicRecordingComponent_PopUpContentBackground1_c() : PopUpContentBackground
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
      
      private function _MicRecordingComponent_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Group2_c(),this._MicRecordingComponent_VGroup3_i(),this._MicRecordingComponent_HGroup2_i()];
         _loc1_.id = "_MicRecordingComponent_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_VGroup1",this._MicRecordingComponent_VGroup1);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 110;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect1_c(),this._MicRecordingComponent_HGroup1_i(),this._MicRecordingComponent_Group7_i(),this._MicRecordingComponent_Group8_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._MicRecordingComponent_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4551078;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 20;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 25;
         _loc1_.paddingRight = 25;
         _loc1_.paddingTop = 21;
         _loc1_.paddingBottom = 21;
         _loc1_.left = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Group3_i(),this._MicRecordingComponent_VGroup2_i()];
         _loc1_.id = "mainRecordPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainRecordPanel = _loc1_;
         BindingManager.executeBindings(this,"mainRecordPanel",this.mainRecordPanel);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._MicRecordingComponent_Ellipse1_c(),this._MicRecordingComponent_Group4_c(),this._MicRecordingComponent_MicRecordButton1_i(),this._MicRecordingComponent_Button3_i(),this._MicRecordingComponent_Image2_i(),this._MicRecordingComponent_Image3_i(),this._MicRecordingComponent_Image4_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Ellipse1_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 70;
         _loc1_.height = 70;
         _loc1_.verticalCenter = 0;
         _loc1_.fill = this._MicRecordingComponent_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Image1_i(),this._MicRecordingComponent_Group5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__styles_images_panel_recordingbar_png_113703831;
         _loc1_.id = "micLevelImage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.micLevelImage = _loc1_;
         BindingManager.executeBindings(this,"micLevelImage",this.micLevelImage);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 70;
         _loc1_.height = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect2_c()];
         _loc1_.id = "micLevelMask";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.micLevelMask = _loc1_;
         BindingManager.executeBindings(this,"micLevelMask",this.micLevelMask);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._MicRecordingComponent_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_MicRecordButton1_i() : MicRecordButton
      {
         var _loc1_:MicRecordButton = new MicRecordButton();
         _loc1_.buttonMode = true;
         _loc1_.verticalCenter = 0;
         _loc1_.enabled = false;
         _loc1_.addEventListener("click",this.___MicRecordingComponent_MicRecordButton1_click);
         _loc1_.id = "_MicRecordingComponent_MicRecordButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_MicRecordButton1 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_MicRecordButton1",this._MicRecordingComponent_MicRecordButton1);
         return _loc1_;
      }
      
      public function ___MicRecordingComponent_MicRecordButton1_click(param1:MouseEvent) : void
      {
         this.recordButton_clickHandler();
      }
      
      private function _MicRecordingComponent_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.verticalCenter = 0;
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",MicStopButtonSkin);
         _loc1_.addEventListener("click",this.___MicRecordingComponent_Button3_click);
         _loc1_.id = "_MicRecordingComponent_Button3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_Button3 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Button3",this._MicRecordingComponent_Button3);
         return _loc1_;
      }
      
      public function ___MicRecordingComponent_Button3_click(param1:MouseEvent) : void
      {
         this.stopButton_clickHandler();
      }
      
      private function _MicRecordingComponent_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.visible = false;
         _loc1_.source = this._embed_mxml__styles_images_voicetab_recording_3_png_1508556567;
         _loc1_.id = "countdown3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countdown3 = _loc1_;
         BindingManager.executeBindings(this,"countdown3",this.countdown3);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Image3_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.visible = false;
         _loc1_.source = this._embed_mxml__styles_images_voicetab_recording_2_png_1508568599;
         _loc1_.id = "countdown2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countdown2 = _loc1_;
         BindingManager.executeBindings(this,"countdown2",this.countdown2);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Image4_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.visible = false;
         _loc1_.source = this._embed_mxml__styles_images_voicetab_recording_1_png_1524809491;
         _loc1_.id = "countdown1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countdown1 = _loc1_;
         BindingManager.executeBindings(this,"countdown1",this.countdown1);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._MicRecordingComponent_Group6_i(),this._MicRecordingComponent_Label2_i()];
         _loc1_.id = "_MicRecordingComponent_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_VGroup2",this._MicRecordingComponent_VGroup2);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.alpha = 0.15;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect3_c(),this._MicRecordingComponent_Label1_i()];
         _loc1_.id = "_MicRecordingComponent_Group6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_Group6 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Group6",this._MicRecordingComponent_Group6);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = -5;
         _loc1_.right = -5;
         _loc1_.top = -5;
         _loc1_.bottom = -5;
         _loc1_.fill = this._MicRecordingComponent_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontSize",13);
         _loc1_.id = "timeDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timeDisplay = _loc1_;
         BindingManager.executeBindings(this,"timeDisplay",this.timeDisplay);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",2501951);
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "messageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageDisplay = _loc1_;
         BindingManager.executeBindings(this,"messageDisplay",this.messageDisplay);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 0;
         _loc1_.height = 110;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect4_c()];
         _loc1_.id = "mainInfoPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainInfoPanel = _loc1_;
         BindingManager.executeBindings(this,"mainInfoPanel",this.mainInfoPanel);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._MicRecordingComponent_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2243681;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 0;
         _loc1_.height = 110;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Label3_i()];
         _loc1_.id = "mainInfoPanelText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainInfoPanelText = _loc1_;
         BindingManager.executeBindings(this,"mainInfoPanelText",this.mainInfoPanelText);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.alpha = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "mainInfoText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainInfoText = _loc1_;
         BindingManager.executeBindings(this,"mainInfoText",this.mainInfoText);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.mxmlContent = [this._MicRecordingComponent_VGroup4_i(),this._MicRecordingComponent_Label4_i(),this._MicRecordingComponent_TextArea1_i()];
         _loc1_.id = "lineGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lineGroup = _loc1_;
         BindingManager.executeBindings(this,"lineGroup",this.lineGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_VGroup4_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingTop = 14;
         _loc1_.paddingBottom = 14;
         _loc1_.mxmlContent = [this._MicRecordingComponent_DialogDetailControlGroup1_i()];
         _loc1_.id = "sliderGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sliderGroup = _loc1_;
         BindingManager.executeBindings(this,"sliderGroup",this.sliderGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_DialogDetailControlGroup1_i() : DialogDetailControlGroup
      {
         var _loc1_:DialogDetailControlGroup = new DialogDetailControlGroup();
         _loc1_.includeInLayout = false;
         _loc1_.visible = false;
         _loc1_.currentState = "micAndAdded";
         _loc1_.addEventListener("playVoice",this.__dialogControl_playVoice);
         _loc1_.addEventListener("stopVoice",this.__dialogControl_stopVoice);
         _loc1_.addEventListener("deleteVoice",this.__dialogControl_deleteVoice);
         _loc1_.id = "dialogControl";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dialogControl = _loc1_;
         BindingManager.executeBindings(this,"dialogControl",this.dialogControl);
         return _loc1_;
      }
      
      public function __dialogControl_playVoice(param1:VoicePanelEvent) : void
      {
         this.onVoiceControlPlay(param1);
      }
      
      public function __dialogControl_stopVoice(param1:VoicePanelEvent) : void
      {
         this.onVoiceControlStop(param1);
      }
      
      public function __dialogControl_deleteVoice(param1:VoicePanelEvent) : void
      {
         this.onVoiceControlDelete(param1);
      }
      
      private function _MicRecordingComponent_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_MicRecordingComponent_Label4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_Label4 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Label4",this._MicRecordingComponent_Label4);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.height = 60;
         _loc1_.heightInLines = 3;
         _loc1_.maxChars = 255;
         _loc1_.enabled = false;
         _loc1_.addEventListener("change",this.__lineTextArea_change);
         _loc1_.id = "lineTextArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lineTextArea = _loc1_;
         BindingManager.executeBindings(this,"lineTextArea",this.lineTextArea);
         return _loc1_;
      }
      
      public function __lineTextArea_change(param1:TextOperationEvent) : void
      {
         this.lineTextArea_changeHandler(param1);
      }
      
      private function _MicRecordingComponent_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.paddingBottom = 25;
         _loc1_.paddingTop = 15;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._MicRecordingComponent_BitmapImage1_c(),this._MicRecordingComponent_Label5_i()];
         _loc1_.id = "alertBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.alertBox = _loc1_;
         BindingManager.executeBindings(this,"alertBox",this.alertBox);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.scaleX = 0.5;
         _loc1_.scaleY = 0.5;
         _loc1_.source = this._embed_mxml__styles_images_icons_message_alert_png_1504559595;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label5_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",3355443);
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "_MicRecordingComponent_Label5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_Label5 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Label5",this._MicRecordingComponent_Label5);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Group9_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Rect5_c(),this._MicRecordingComponent_VGroup5_c()];
         _loc1_.id = "errorGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.errorGroup = _loc1_;
         BindingManager.executeBindings(this,"errorGroup",this.errorGroup);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.radiusY = 3;
         _loc1_.fill = this._MicRecordingComponent_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_VGroup5_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._MicRecordingComponent_HGroup3_c(),this._MicRecordingComponent_Line1_c(),this._MicRecordingComponent_HGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 15;
         _loc1_.verticalAlign = "baseline";
         _loc1_.paddingTop = 30;
         _loc1_.paddingLeft = 25;
         _loc1_.paddingRight = 25;
         _loc1_.paddingBottom = 32;
         _loc1_.mxmlContent = [this._MicRecordingComponent_BitmapImage2_i(),this._MicRecordingComponent_VGroup6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.baseline = -15;
         _loc1_.source = this._embed_mxml__styles_images_icons_message_alert_png_1504559595;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_VGroup6_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Label6_i(),this._MicRecordingComponent_Label7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label6_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",21);
         _loc1_.setStyle("color",5267059);
         _loc1_.id = "titleDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleDisplay = _loc1_;
         BindingManager.executeBindings(this,"titleDisplay",this.titleDisplay);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Label7_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 90;
         _loc1_.top = 20;
         _loc1_.setStyle("color",3355443);
         _loc1_.id = "messageLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageLabel = _loc1_;
         BindingManager.executeBindings(this,"messageLabel",this.messageLabel);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._MicRecordingComponent_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MicRecordingComponent_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14870509;
         return _loc1_;
      }
      
      private function _MicRecordingComponent_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 10;
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 14;
         _loc1_.paddingLeft = 25;
         _loc1_.paddingRight = 25;
         _loc1_.paddingBottom = 14;
         _loc1_.horizontalAlign = "center";
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._MicRecordingComponent_Button4_i(),this._MicRecordingComponent_Button5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MicRecordingComponent_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "grey";
         _loc1_.addEventListener("click",this.___MicRecordingComponent_Button4_click);
         _loc1_.id = "_MicRecordingComponent_Button4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_Button4 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Button4",this._MicRecordingComponent_Button4);
         return _loc1_;
      }
      
      public function ___MicRecordingComponent_Button4_click(param1:MouseEvent) : void
      {
         this.cancelButton_clickHandler();
      }
      
      private function _MicRecordingComponent_Button5_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.___MicRecordingComponent_Button5_click);
         _loc1_.id = "_MicRecordingComponent_Button5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MicRecordingComponent_Button5 = _loc1_;
         BindingManager.executeBindings(this,"_MicRecordingComponent_Button5",this._MicRecordingComponent_Button5);
         return _loc1_;
      }
      
      public function ___MicRecordingComponent_Button5_click(param1:MouseEvent) : void
      {
         this.retryButton_clickHandler();
      }
      
      private function _MicRecordingComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [mainInfoPanel,buttonGroup,mainRecordPanel,mainInfoPanelText];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_MicRecordingComponent_Resize1.targets");
         result[1] = new Binding(this,function():Array
         {
            var _loc1_:* = [mainInfoPanel,buttonGroup,mainRecordPanel,mainInfoPanelText];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_MicRecordingComponent_Scale1.targets");
         result[2] = new Binding(this,function():Array
         {
            var _loc1_:* = [mainInfoText];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_MicRecordingComponent_Fade1.targets");
         result[3] = new Binding(this,null,null,"_MicRecordingComponent_Parallel2.target","sliderGroup");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Record Voice");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Cancel");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"cancelButton.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = _addVoiceButtonLabel;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"addVoiceButton.label");
         result[7] = new Binding(this,function():Boolean
         {
            return _lineChanged;
         },null,"addVoiceButton.enabled");
         result[8] = new Binding(this,null,null,"micLevelImage.mask","micLevelMask");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","max 20s");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"messageDisplay.text");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Done! Play your recording below");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"mainInfoText.text");
         result[11] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Oops… no audio detected. Try again");
         },null,"_MicRecordingComponent_SetProperty1.value");
         result[12] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Loading voice...");
         },null,"_MicRecordingComponent_SetProperty2.value");
         result[13] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Loading voice...");
         },null,"_MicRecordingComponent_SetProperty3.value");
         result[14] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Line (optional)");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_MicRecordingComponent_Label4.text");
         result[15] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Type in a line");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"lineTextArea.prompt");
         result[16] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Due to a recent Adobe Flash update, adding recorded voices might take some time. Sorry for the inconvenience.");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_MicRecordingComponent_Label5.text");
         result[17] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Mic Recording Disabled");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"titleDisplay.text");
         result[18] = new Binding(this,function():String
         {
            var _loc1_:* = errorMessage;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"messageLabel.text");
         result[19] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Cancel");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_MicRecordingComponent_Button4.label");
         result[20] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","try mic recording again");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_MicRecordingComponent_Button5.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_Button3() : Button
      {
         return this._523135114_MicRecordingComponent_Button3;
      }
      
      public function set _MicRecordingComponent_Button3(param1:Button) : void
      {
         var _loc2_:Object = this._523135114_MicRecordingComponent_Button3;
         if(_loc2_ !== param1)
         {
            this._523135114_MicRecordingComponent_Button3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_Button3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_Group6() : Group
      {
         return this._1093183170_MicRecordingComponent_Group6;
      }
      
      public function set _MicRecordingComponent_Group6(param1:Group) : void
      {
         var _loc2_:Object = this._1093183170_MicRecordingComponent_Group6;
         if(_loc2_ !== param1)
         {
            this._1093183170_MicRecordingComponent_Group6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_Group6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_MicRecordButton1() : MicRecordButton
      {
         return this._835099118_MicRecordingComponent_MicRecordButton1;
      }
      
      public function set _MicRecordingComponent_MicRecordButton1(param1:MicRecordButton) : void
      {
         var _loc2_:Object = this._835099118_MicRecordingComponent_MicRecordButton1;
         if(_loc2_ !== param1)
         {
            this._835099118_MicRecordingComponent_MicRecordButton1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_MicRecordButton1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_SetProperty1() : SetProperty
      {
         return this._1539829851_MicRecordingComponent_SetProperty1;
      }
      
      public function set _MicRecordingComponent_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1539829851_MicRecordingComponent_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1539829851_MicRecordingComponent_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_SetProperty2() : SetProperty
      {
         return this._1539829850_MicRecordingComponent_SetProperty2;
      }
      
      public function set _MicRecordingComponent_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1539829850_MicRecordingComponent_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._1539829850_MicRecordingComponent_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_SetProperty3() : SetProperty
      {
         return this._1539829849_MicRecordingComponent_SetProperty3;
      }
      
      public function set _MicRecordingComponent_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1539829849_MicRecordingComponent_SetProperty3;
         if(_loc2_ !== param1)
         {
            this._1539829849_MicRecordingComponent_SetProperty3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_VGroup1() : VGroup
      {
         return this._1271861795_MicRecordingComponent_VGroup1;
      }
      
      public function set _MicRecordingComponent_VGroup1(param1:VGroup) : void
      {
         var _loc2_:Object = this._1271861795_MicRecordingComponent_VGroup1;
         if(_loc2_ !== param1)
         {
            this._1271861795_MicRecordingComponent_VGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_VGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _MicRecordingComponent_VGroup2() : VGroup
      {
         return this._1271861794_MicRecordingComponent_VGroup2;
      }
      
      public function set _MicRecordingComponent_VGroup2(param1:VGroup) : void
      {
         var _loc2_:Object = this._1271861794_MicRecordingComponent_VGroup2;
         if(_loc2_ !== param1)
         {
            this._1271861794_MicRecordingComponent_VGroup2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_MicRecordingComponent_VGroup2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get addVoiceButton() : Button
      {
         return this._76216227addVoiceButton;
      }
      
      public function set addVoiceButton(param1:Button) : void
      {
         var _loc2_:Object = this._76216227addVoiceButton;
         if(_loc2_ !== param1)
         {
            this._76216227addVoiceButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addVoiceButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get alertBox() : HGroup
      {
         return this._1615376079alertBox;
      }
      
      public function set alertBox(param1:HGroup) : void
      {
         var _loc2_:Object = this._1615376079alertBox;
         if(_loc2_ !== param1)
         {
            this._1615376079alertBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"alertBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : Group
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:Group) : void
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
      public function get countdown1() : Image
      {
         return this._1030655968countdown1;
      }
      
      public function set countdown1(param1:Image) : void
      {
         var _loc2_:Object = this._1030655968countdown1;
         if(_loc2_ !== param1)
         {
            this._1030655968countdown1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countdown1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countdown2() : Image
      {
         return this._1030655967countdown2;
      }
      
      public function set countdown2(param1:Image) : void
      {
         var _loc2_:Object = this._1030655967countdown2;
         if(_loc2_ !== param1)
         {
            this._1030655967countdown2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countdown2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countdown3() : Image
      {
         return this._1030655966countdown3;
      }
      
      public function set countdown3(param1:Image) : void
      {
         var _loc2_:Object = this._1030655966countdown3;
         if(_loc2_ !== param1)
         {
            this._1030655966countdown3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countdown3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dialogControl() : DialogDetailControlGroup
      {
         return this._2112093941dialogControl;
      }
      
      public function set dialogControl(param1:DialogDetailControlGroup) : void
      {
         var _loc2_:Object = this._2112093941dialogControl;
         if(_loc2_ !== param1)
         {
            this._2112093941dialogControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dialogControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get errorGroup() : Group
      {
         return this._1613969751errorGroup;
      }
      
      public function set errorGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1613969751errorGroup;
         if(_loc2_ !== param1)
         {
            this._1613969751errorGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineGroup() : VGroup
      {
         return this._1818284309lineGroup;
      }
      
      public function set lineGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1818284309lineGroup;
         if(_loc2_ !== param1)
         {
            this._1818284309lineGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lineTextArea() : TextArea
      {
         return this._1890776210lineTextArea;
      }
      
      public function set lineTextArea(param1:TextArea) : void
      {
         var _loc2_:Object = this._1890776210lineTextArea;
         if(_loc2_ !== param1)
         {
            this._1890776210lineTextArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lineTextArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainInfoPanel() : Group
      {
         return this._1098181693mainInfoPanel;
      }
      
      public function set mainInfoPanel(param1:Group) : void
      {
         var _loc2_:Object = this._1098181693mainInfoPanel;
         if(_loc2_ !== param1)
         {
            this._1098181693mainInfoPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainInfoPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainInfoPanelText() : Group
      {
         return this._1755463434mainInfoPanelText;
      }
      
      public function set mainInfoPanelText(param1:Group) : void
      {
         var _loc2_:Object = this._1755463434mainInfoPanelText;
         if(_loc2_ !== param1)
         {
            this._1755463434mainInfoPanelText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainInfoPanelText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainInfoText() : Label
      {
         return this._1488472108mainInfoText;
      }
      
      public function set mainInfoText(param1:Label) : void
      {
         var _loc2_:Object = this._1488472108mainInfoText;
         if(_loc2_ !== param1)
         {
            this._1488472108mainInfoText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainInfoText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainRecordPanel() : HGroup
      {
         return this._1432568646mainRecordPanel;
      }
      
      public function set mainRecordPanel(param1:HGroup) : void
      {
         var _loc2_:Object = this._1432568646mainRecordPanel;
         if(_loc2_ !== param1)
         {
            this._1432568646mainRecordPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainRecordPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageDisplay() : Label
      {
         return this._1766135109messageDisplay;
      }
      
      public function set messageDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1766135109messageDisplay;
         if(_loc2_ !== param1)
         {
            this._1766135109messageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageLabel() : Label
      {
         return this._1304200403messageLabel;
      }
      
      public function set messageLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1304200403messageLabel;
         if(_loc2_ !== param1)
         {
            this._1304200403messageLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get micLevelImage() : Image
      {
         return this._871873058micLevelImage;
      }
      
      public function set micLevelImage(param1:Image) : void
      {
         var _loc2_:Object = this._871873058micLevelImage;
         if(_loc2_ !== param1)
         {
            this._871873058micLevelImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"micLevelImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get micLevelMask() : Group
      {
         return this._443658743micLevelMask;
      }
      
      public function set micLevelMask(param1:Group) : void
      {
         var _loc2_:Object = this._443658743micLevelMask;
         if(_loc2_ !== param1)
         {
            this._443658743micLevelMask = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"micLevelMask",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nextRecorded() : Transition
      {
         return this._1841957693nextRecorded;
      }
      
      public function set nextRecorded(param1:Transition) : void
      {
         var _loc2_:Object = this._1841957693nextRecorded;
         if(_loc2_ !== param1)
         {
            this._1841957693nextRecorded = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nextRecorded",_loc2_,param1));
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
      public function get recordFinish() : Transition
      {
         return this._1460446276recordFinish;
      }
      
      public function set recordFinish(param1:Transition) : void
      {
         var _loc2_:Object = this._1460446276recordFinish;
         if(_loc2_ !== param1)
         {
            this._1460446276recordFinish = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"recordFinish",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sliderGroup() : VGroup
      {
         return this._80023010sliderGroup;
      }
      
      public function set sliderGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._80023010sliderGroup;
         if(_loc2_ !== param1)
         {
            this._80023010sliderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timeDisplay() : Label
      {
         return this._1919414987timeDisplay;
      }
      
      public function set timeDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1919414987timeDisplay;
         if(_loc2_ !== param1)
         {
            this._1919414987timeDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timeDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleDisplay() : Label
      {
         return this._1893287094titleDisplay;
      }
      
      public function set titleDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1893287094titleDisplay;
         if(_loc2_ !== param1)
         {
            this._1893287094titleDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get errorMessage() : String
      {
         return this._1203236063errorMessage;
      }
      
      private function set errorMessage(param1:String) : void
      {
         var _loc2_:Object = this._1203236063errorMessage;
         if(_loc2_ !== param1)
         {
            this._1203236063errorMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"errorMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _pitchSource() : ArrayCollection
      {
         return this._1649539652_pitchSource;
      }
      
      private function set _pitchSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1649539652_pitchSource;
         if(_loc2_ !== param1)
         {
            this._1649539652_pitchSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_pitchSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _addVoiceButtonLabel() : String
      {
         return this._834112942_addVoiceButtonLabel;
      }
      
      private function set _addVoiceButtonLabel(param1:String) : void
      {
         var _loc2_:Object = this._834112942_addVoiceButtonLabel;
         if(_loc2_ !== param1)
         {
            this._834112942_addVoiceButtonLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_addVoiceButtonLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _lineChanged() : Boolean
      {
         return this._503942753_lineChanged;
      }
      
      private function set _lineChanged(param1:Boolean) : void
      {
         var _loc2_:Object = this._503942753_lineChanged;
         if(_loc2_ !== param1)
         {
            this._503942753_lineChanged = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lineChanged",_loc2_,param1));
            }
         }
      }
   }
}
