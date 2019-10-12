package anifire.studio.components
{
   import anifire.event.ExtraDataEvent;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.RemoveSoundCommand;
   import anifire.studio.commands.RemoveSpeechCommand;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.SpeechData;
   import anifire.studio.core.sound.AnimeSoundEvent;
   import anifire.studio.events.VoicePanelEvent;
   import anifire.studio.skins.LinkButtonSkin;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.utils.StringUtil;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class VoiceAssignedItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1725138447_VoiceAssignedItemRenderer_SolidColor1:SolidColor;
      
      private var _1781625235buttonGroup:VGroup;
      
      private var _809612678contentGroup:VGroup;
      
      private var _951543133control:PlainDialogDetailControlGroup;
      
      private var _1021776392lbSoundDur:Label;
      
      private var _1605973857lbSoundTitle:Label;
      
      private var _244504090unassignButton:Button;
      
      private var _842884911voiceLineLabelGroup:VoiceLineLabelGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _soundThumb:SoundThumb;
      
      private var _sound:AnimeSound;
      
      private var _speechData:SpeechData;
      
      private var _204380986_durationIconVisible:Boolean = true;
      
      private var _1279164576_lineText:String;
      
      private var _1171052715_showVoiceLineLabelGroup:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function VoiceAssignedItemRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._VoiceAssignedItemRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_VoiceAssignedItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return VoiceAssignedItemRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.autoDrawBackground = false;
         this.buttonMode = false;
         this.mxmlContent = [this._VoiceAssignedItemRenderer_Rect1_c(),this._VoiceAssignedItemRenderer_Line1_c(),this._VoiceAssignedItemRenderer_VGroup1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VoiceAssignedItemRenderer_SolidColor1",
               "name":"color",
               "value":16772027
            }),new SetProperty().initializeFromObject({
               "target":"unassignButton",
               "name":"visible",
               "value":true
            })]
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
         VoiceAssignedItemRenderer._watcherSetupUtil = param1;
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
      
      public function get soundThumb() : SoundThumb
      {
         return this._soundThumb;
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:String = null;
         super.data = param1;
         if(this.data)
         {
            _loc2_ = String(this.data);
            this.sound = Console.getConsole().getSoundById(_loc2_);
         }
         else
         {
            this.sound = null;
            this._soundThumb = null;
            this.control._btnPlay.soundThumb = null;
         }
         dispatchEvent(new Event("data_change"));
      }
      
      private function set sound(param1:AnimeSound) : void
      {
         if(this._sound != param1)
         {
            if(this._sound)
            {
               this._soundThumb = null;
               if(this._speechData)
               {
                  this._speechData.removeEventListener(Event.CHANGE,this.speechData_changeHandler);
                  this._speechData = null;
               }
               this._sound.removeEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.sound_volumeChangeHandler);
               this._sound.removeEventListener(AnimeSoundEvent.SOUND_THUMB_CHANGE,this.sound_soundThumbChangeHandler);
            }
            this._sound = param1;
            if(this._sound)
            {
               this._soundThumb = this._sound.soundThumb;
               this.control._btnPlay.soundThumb = this._soundThumb;
               if(this._soundThumb)
               {
                  this._speechData = this._soundThumb.ttsData;
               }
               this.updateUI();
               if(this._speechData)
               {
                  this._speechData.addEventListener(Event.CHANGE,this.speechData_changeHandler);
               }
               this._sound.addEventListener(AnimeSoundEvent.VOLUME_CHANGE,this.sound_volumeChangeHandler);
               this._sound.addEventListener(AnimeSoundEvent.SOUND_THUMB_CHANGE,this.sound_soundThumbChangeHandler);
            }
         }
      }
      
      private function updateUI() : void
      {
         if(this._sound && this._sound.soundThumb)
         {
            this._lineText = "";
            this._showVoiceLineLabelGroup = false;
            this.lbSoundTitle.text = this._sound.soundThumb.name;
            this.control._speechVolumeControl.volume = this._sound.volume;
            this.control.setCurrentState("ttsAndAdded");
            this.lbSoundDur.text = Util.cielNum(this._sound.soundThumb.duration / 1000,2) + "s";
            if(this._speechData)
            {
               this._lineText = !!this._speechData.text?StringUtil.substitute(UtilDict.toDisplay("go","LINE: {0}"),this._speechData.text):"";
               this._showVoiceLineLabelGroup = !!this._speechData.text?true:false;
            }
         }
      }
      
      public function init(param1:Object) : void
      {
      }
      
      protected function refresh(param1:Event) : void
      {
      }
      
      private function sound_volumeChangeHandler(param1:AnimeSoundEvent) : void
      {
         if(this._sound)
         {
            this.control._speechVolumeControl.volume = this._sound.volume;
         }
      }
      
      private function sound_soundThumbChangeHandler(param1:AnimeSoundEvent) : void
      {
         this._soundThumb = this._sound.soundThumb;
         this.control._btnPlay.soundThumb = this._soundThumb;
         if(this._soundThumb)
         {
            if(this._speechData)
            {
               this._speechData.removeEventListener(Event.CHANGE,this.speechData_changeHandler);
            }
            this._speechData = this._soundThumb.ttsData;
            if(this._speechData)
            {
               this._speechData.addEventListener(Event.CHANGE,this.speechData_changeHandler);
            }
            this.updateUI();
         }
      }
      
      private function speechData_changeHandler(param1:Event) : void
      {
         if(this._speechData)
         {
            this._lineText = !!this._speechData.text?StringUtil.substitute(UtilDict.toDisplay("go","LINE: {0}"),this._speechData.text):"";
            this._showVoiceLineLabelGroup = !!this._speechData.text?true:false;
         }
      }
      
      protected function onRemoveLinkClick(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("removeLinkage"));
      }
      
      protected function onEditHandler(param1:VoicePanelEvent) : void
      {
         this.dispatchEvent(new Event("editSound"));
      }
      
      protected function onDeleteHandler(param1:VoicePanelEvent) : void
      {
         var _loc2_:ICommand = null;
         if(this._sound)
         {
            if(this._sound.isVoice)
            {
               _loc2_ = new RemoveSpeechCommand(this._sound);
               _loc2_.execute();
            }
            else
            {
               _loc2_ = new RemoveSoundCommand(this._sound,this._sound.soundsController.sounds);
               _loc2_.execute();
            }
            this.dispatchEvent(new Event("removeSound"));
         }
      }
      
      protected function volumeUpdateHandler(param1:ExtraDataEvent) : void
      {
         if(this._sound)
         {
            this._sound.volume = param1.getData() as Number;
         }
      }
      
      private function _VoiceAssignedItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._VoiceAssignedItemRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._VoiceAssignedItemRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceAssignedItemRenderer_SolidColor1",this._VoiceAssignedItemRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._VoiceAssignedItemRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 6;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.paddingBottom = 6;
         _loc1_.gap = 14;
         _loc1_.mxmlContent = [this._VoiceAssignedItemRenderer_HGroup1_c(),this._VoiceAssignedItemRenderer_VoiceLineLabelGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._VoiceAssignedItemRenderer_VGroup2_i(),this._VoiceAssignedItemRenderer_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 4;
         _loc1_.paddingLeft = 7;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 8;
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.mxmlContent = [this._VoiceAssignedItemRenderer_Label1_i(),this._VoiceAssignedItemRenderer_Label2_i()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("verticalAlign","bottom");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "lbSoundTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lbSoundTitle = _loc1_;
         BindingManager.executeBindings(this,"lbSoundTitle",this.lbSoundTitle);
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("color",8752789);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.id = "lbSoundDur";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lbSoundDur = _loc1_;
         BindingManager.executeBindings(this,"lbSoundDur",this.lbSoundDur);
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "right";
         _loc1_.paddingLeft = 4;
         _loc1_.paddingRight = 4;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._VoiceAssignedItemRenderer_PlainDialogDetailControlGroup1_i(),this._VoiceAssignedItemRenderer_Button1_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_PlainDialogDetailControlGroup1_i() : PlainDialogDetailControlGroup
      {
         var _loc1_:PlainDialogDetailControlGroup = new PlainDialogDetailControlGroup();
         _loc1_.percentWidth = 100;
         _loc1_.visible = true;
         _loc1_.addEventListener("editVoice",this.__control_editVoice);
         _loc1_.addEventListener("deleteVoice",this.__control_deleteVoice);
         _loc1_.addEventListener("update",this.__control_update);
         _loc1_.id = "control";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.control = _loc1_;
         BindingManager.executeBindings(this,"control",this.control);
         return _loc1_;
      }
      
      public function __control_editVoice(param1:VoicePanelEvent) : void
      {
         this.onEditHandler(param1);
      }
      
      public function __control_deleteVoice(param1:VoicePanelEvent) : void
      {
         this.onDeleteHandler(param1);
      }
      
      public function __control_update(param1:ExtraDataEvent) : void
      {
         this.volumeUpdateHandler(param1);
      }
      
      private function _VoiceAssignedItemRenderer_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",LinkButtonSkin);
         _loc1_.addEventListener("mouseDown",this.__unassignButton_mouseDown);
         _loc1_.id = "unassignButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.unassignButton = _loc1_;
         BindingManager.executeBindings(this,"unassignButton",this.unassignButton);
         return _loc1_;
      }
      
      public function __unassignButton_mouseDown(param1:MouseEvent) : void
      {
         this.onRemoveLinkClick(param1);
      }
      
      private function _VoiceAssignedItemRenderer_VoiceLineLabelGroup1_i() : VoiceLineLabelGroup
      {
         var _loc1_:VoiceLineLabelGroup = new VoiceLineLabelGroup();
         _loc1_.percentWidth = 100;
         _loc1_.id = "voiceLineLabelGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.voiceLineLabelGroup = _loc1_;
         BindingManager.executeBindings(this,"voiceLineLabelGroup",this.voiceLineLabelGroup);
         return _loc1_;
      }
      
      private function _VoiceAssignedItemRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Un-assign");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"unassignButton.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = _lineText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"voiceLineLabelGroup.text");
         result[2] = new Binding(this,function():Boolean
         {
            return _showVoiceLineLabelGroup;
         },null,"voiceLineLabelGroup.visible");
         result[3] = new Binding(this,function():Boolean
         {
            return _showVoiceLineLabelGroup;
         },null,"voiceLineLabelGroup.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _VoiceAssignedItemRenderer_SolidColor1() : SolidColor
      {
         return this._1725138447_VoiceAssignedItemRenderer_SolidColor1;
      }
      
      public function set _VoiceAssignedItemRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1725138447_VoiceAssignedItemRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1725138447_VoiceAssignedItemRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VoiceAssignedItemRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : VGroup
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:VGroup) : void
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
      public function get contentGroup() : VGroup
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get control() : PlainDialogDetailControlGroup
      {
         return this._951543133control;
      }
      
      public function set control(param1:PlainDialogDetailControlGroup) : void
      {
         var _loc2_:Object = this._951543133control;
         if(_loc2_ !== param1)
         {
            this._951543133control = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"control",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSoundDur() : Label
      {
         return this._1021776392lbSoundDur;
      }
      
      public function set lbSoundDur(param1:Label) : void
      {
         var _loc2_:Object = this._1021776392lbSoundDur;
         if(_loc2_ !== param1)
         {
            this._1021776392lbSoundDur = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSoundDur",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSoundTitle() : Label
      {
         return this._1605973857lbSoundTitle;
      }
      
      public function set lbSoundTitle(param1:Label) : void
      {
         var _loc2_:Object = this._1605973857lbSoundTitle;
         if(_loc2_ !== param1)
         {
            this._1605973857lbSoundTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSoundTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get unassignButton() : Button
      {
         return this._244504090unassignButton;
      }
      
      public function set unassignButton(param1:Button) : void
      {
         var _loc2_:Object = this._244504090unassignButton;
         if(_loc2_ !== param1)
         {
            this._244504090unassignButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"unassignButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get voiceLineLabelGroup() : VoiceLineLabelGroup
      {
         return this._842884911voiceLineLabelGroup;
      }
      
      public function set voiceLineLabelGroup(param1:VoiceLineLabelGroup) : void
      {
         var _loc2_:Object = this._842884911voiceLineLabelGroup;
         if(_loc2_ !== param1)
         {
            this._842884911voiceLineLabelGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceLineLabelGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _durationIconVisible() : Boolean
      {
         return this._204380986_durationIconVisible;
      }
      
      private function set _durationIconVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._204380986_durationIconVisible;
         if(_loc2_ !== param1)
         {
            this._204380986_durationIconVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_durationIconVisible",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _lineText() : String
      {
         return this._1279164576_lineText;
      }
      
      private function set _lineText(param1:String) : void
      {
         var _loc2_:Object = this._1279164576_lineText;
         if(_loc2_ !== param1)
         {
            this._1279164576_lineText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_lineText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showVoiceLineLabelGroup() : Boolean
      {
         return this._1171052715_showVoiceLineLabelGroup;
      }
      
      private function set _showVoiceLineLabelGroup(param1:Boolean) : void
      {
         var _loc2_:Object = this._1171052715_showVoiceLineLabelGroup;
         if(_loc2_ !== param1)
         {
            this._1171052715_showVoiceLineLabelGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showVoiceLineLabelGroup",_loc2_,param1));
            }
         }
      }
   }
}
