package anifire.studio.components
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.SpeechData;
   import anifire.studio.core.sound.ImporterSoundAsset;
   import anifire.studio.core.sound.SoundThumbEvent;
   import anifire.studio.events.VoicePanelEvent;
   import anifire.studio.interfaces.ISpeechSubComponent;
   import anifire.studio.managers.TTSManager;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.managers.VoiceInfoManager;
   import anifire.studio.models.LanguageModel;
   import anifire.studio.models.VoiceModel;
   import anifire.studio.skins.LanguageDropDownListSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilURLStream;
   import anifire.util.UtilUser;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.Proxy;
   import flash.utils.getDefinitionByName;
   import flashx.textLayout.elements.LinkElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.events.FlowElementMouseEvent;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.effects.Parallel;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import mx.utils.StringUtil;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.RichEditableText;
   import spark.components.TextArea;
   import spark.components.VGroup;
   import spark.effects.Fade;
   import spark.effects.Resize;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class TTSComponent extends Group implements ISpeechSubComponent, IBindingClient, IStateClient2
   {
      
      private static const MAX_CHAR_ALLOWED:int = 180;
      
      private static const RESTRICT_TEXT:String = "^<^>^`";
      
      private static const DEFAULT_TTS_VOICE:String = "joey";
      
      private static const REMOVED_MALE_VOICES:Array = ["eric"];
      
      private static const REMOVED_FEMALE_VOICES:Array = ["jennifer"];
      
      private static const FALLBACK_MALE_VOICE:String = "joey";
      
      private static const FALLBACK_FEMALE_VOICE:String = "joanna";
      
      private static const ADD_VOICE_BUTTON_LABEL:String = "Add Voice";
      
      private static const UPDATE_VOICE_BUTTON_LABEL:String = "Update";
      
      private static const CANCEL_BUTTON_LABEL:String = "Cancel";
      
      private static const TITLE_TEXT:String = "Add Text-to-Speech Voice";
      
      private static const GENERATE_VOICE_BUTTON_LABEL:String = "Generate Voice";
      
      private static const GENERATING_VOICE_BUTTON_LABEL:String = "Generating...";
      
      private static const TEXT_AREA_PROMPT:String = "Type in a line, max 180 chars";
      
      private static const REMAINING_CHARACTER_PROMPT:String = "{0} Characters Remaining";
      
      private static const TEXT_AREA_TITLE:String = "Line";
      
      private static const ADVICE_TEXT:String = "p.s. Text-to-Speech robot voices might sound, well…robotic.";
      
      private static const ADVICE_TEXT_WHEN_GENERATING_VOICE:String = "p.s. Most folks use the robots as placeholders in rough cuts";
      
      private static const ADVICE_TEXT_WHEN_VOICE_PREPARED:String = "Sounds too robotic? Hire a human at inWhatLanguage or VoiceBunny";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TTSComponent_Fade3:Fade;
      
      public var _TTSComponent_Label1:Label;
      
      public var _TTSComponent_Label2:Label;
      
      private var _1028920981_TTSComponent_Label3:Label;
      
      public var _TTSComponent_Line1:Line;
      
      public var _TTSComponent_Parallel1:Parallel;
      
      public var _TTSComponent_Parallel2:Parallel;
      
      public var _TTSComponent_Resize3:Resize;
      
      public var _TTSComponent_RichEditableText1:RichEditableText;
      
      private var _1467495152_TTSComponent_SetProperty1:SetProperty;
      
      private var _1467495151_TTSComponent_SetProperty2:SetProperty;
      
      private var _76216227addVoiceButton:Button;
      
      private var _2086216067btnGroup:HGroup;
      
      private var _1990131276cancelButton:Button;
      
      private var _1645186270controlGroup:DialogDetailControlGroup;
      
      private var _939471105genderList:DropDownList;
      
      private var _322449841generateVoiceButton:Button;
      
      private var _1209425521infoGroup:VGroup;
      
      private var _2092086250languageList:DropDownList;
      
      private var _1376562741languageSelectionGroup:HGroup;
      
      private var _106433028panel:Panel;
      
      private var _1004197030textArea:TextArea;
      
      private var _1019274000voiceList:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _uploadType:String = "tts";
      
      public var sound#1:ImporterSoundAsset;
      
      private var _91291148_text:String = "";
      
      private var _voiceId:String = "joey";
      
      private var _assetId:String;
      
      private var _2016932717_genders:Array;
      
      private var _1897480864_voices:Array;
      
      private var _1472458938_langs:Array;
      
      private var _682593732genderSource:ArrayCollection;
      
      private var _244185709languageSource:ArrayCollection;
      
      private var _63764499voiceSource:ArrayCollection;
      
      private var _voiceInfoReady:Boolean;
      
      private var _speechData:SpeechData;
      
      private var _target:Object;
      
      private var _voiceInfoMangaer:VoiceInfoManager;
      
      private var _soundThumb:SoundThumb;
      
      private var _soundId:String;
      
      private var _834112942_addVoiceButtonLabel:String;
      
      private var _103831255_charLeftText:String;
      
      private var _tutorialManager:TutorialManager;
      
      private var _embed_mxml__styles_images_voicetab_robot_icon_png_1858994797:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TTSComponent()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._834112942_addVoiceButtonLabel = UtilDict.toDisplay("go",ADD_VOICE_BUTTON_LABEL);
         this._tutorialManager = TutorialManager.instance;
         this._embed_mxml__styles_images_voicetab_robot_icon_png_1858994797 = TTSComponent__embed_mxml__styles_images_voicetab_robot_icon_png_1858994797;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TTSComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_TTSComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TTSComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [this._TTSComponent_Transition1_c(),this._TTSComponent_Transition2_c(),this._TTSComponent_Transition3_c()];
         this.mxmlContent = [this._TTSComponent_Panel1_i()];
         this.currentState = "notReady";
         this.addEventListener("creationComplete",this.___TTSComponent_Group1_creationComplete);
         var _TTSComponent_Label3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TTSComponent_Label3_i);
         var _TTSComponent_RichEditableText1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._TTSComponent_RichEditableText1_i);
         states = [new State({
            "name":"notReady",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TTSComponent_Label3_factory,
               "destination":"infoGroup",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TTSComponent_Line1"]
            }),new SetProperty().initializeFromObject({
               "target":"generateVoiceButton",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"generateVoiceButton",
               "name":"includeInLayout",
               "value":true
            })]
         }),new State({
            "name":"ready",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TTSComponent_Label3_factory,
               "destination":"infoGroup",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TTSComponent_Line1"]
            }),new SetProperty().initializeFromObject({
               "target":"generateVoiceButton",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"generateVoiceButton",
               "name":"enabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"generateVoiceButton",
               "name":"includeInLayout",
               "value":true
            })]
         }),new State({
            "name":"generating",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TTSComponent_Label3_factory,
               "destination":"infoGroup",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TTSComponent_Line1"]
            }),new SetProperty().initializeFromObject({
               "target":"generateVoiceButton",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"generateVoiceButton",
               "name":"includeInLayout",
               "value":true
            }),this._TTSComponent_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"generateVoiceButton",
               "name":"label",
               "value":undefined
            })),this._TTSComponent_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_TTSComponent_Label3",
               "name":"text",
               "value":undefined
            }))]
         }),new State({
            "name":"voicePrepared",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_TTSComponent_RichEditableText1_factory,
               "destination":"infoGroup",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_TTSComponent_Line1"]
            }),new SetProperty().initializeFromObject({
               "target":"addVoiceButton",
               "name":"enabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"controlGroup",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"controlGroup",
               "name":"includeInLayout",
               "value":true
            })]
         })];
         BindingManager.executeBindings(this,"_TTSComponent_SetProperty1",this._TTSComponent_SetProperty1);
         BindingManager.executeBindings(this,"_TTSComponent_SetProperty2",this._TTSComponent_SetProperty2);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TTSComponent._watcherSetupUtil = param1;
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
      
      public function get soundId() : String
      {
         return this._soundId;
      }
      
      public function set soundId(param1:String) : void
      {
         var _loc2_:AnimeSound = null;
         this._soundId = param1;
         this._speechData = null;
         this._text = "";
         if(this._soundId)
         {
            _loc2_ = Console.getConsole().getSoundById(this._soundId);
            if(_loc2_ && _loc2_.soundThumb)
            {
               this._speechData = _loc2_.soundThumb.ttsData;
               if(this._speechData)
               {
                  this._text = this._speechData.text;
                  if(this._speechData.type == SpeechData.SOURCE_TYPE_TTS)
                  {
                     this._voiceId = this._speechData.voice;
                  }
               }
            }
         }
         this._addVoiceButtonLabel = UtilDict.toDisplay("go",!!this._soundId?UPDATE_VOICE_BUTTON_LABEL:ADD_VOICE_BUTTON_LABEL);
         this.selectVoiceById(this._voiceId);
         this.updateCharacterCounter();
         currentState = "notReady";
      }
      
      public function get soundThumb() : SoundThumb
      {
         return this._soundThumb;
      }
      
      public function set soundThumb(param1:SoundThumb) : void
      {
         this._soundThumb = param1;
      }
      
      private function get manager() : VoiceInfoManager
      {
         if(!this._voiceInfoMangaer)
         {
            this._voiceInfoMangaer = VoiceInfoManager.instance;
         }
         return this._voiceInfoMangaer;
      }
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         var _loc2_:Character = null;
         this._target = param1;
         this._voiceId = DEFAULT_TTS_VOICE;
         if(this._target is Character)
         {
            _loc2_ = this._target as Character;
            if(_loc2_.speechVoice)
            {
               this._voiceId = _loc2_.speechVoice;
            }
         }
         this.selectVoiceById(this._voiceId);
         this.textArea.stage.focus = this.textArea;
      }
      
      public function set loadProgress(param1:Number) : void
      {
      }
      
      private function init() : void
      {
         this.updateCharacterCounter();
         this.textArea.prompt = UtilDict.toDisplay("go",TEXT_AREA_PROMPT);
         this._tutorialManager.registerComponent("tts_textbox",this.textArea);
         currentState = "notReady";
      }
      
      private function initVoiceInfo() : void
      {
         var _loc1_:VoiceInfoManager = VoiceInfoManager.instance;
         if(_loc1_.isReady)
         {
            this.initVoiceDropDown();
         }
         else
         {
            _loc1_.addEventListener(Event.COMPLETE,this.onVoiceInfoReady);
            _loc1_.load();
         }
      }
      
      private function onVoiceInfoReady(param1:Event = null) : void
      {
         var _loc2_:VoiceInfoManager = VoiceInfoManager.instance;
         _loc2_.removeEventListener(Event.COMPLETE,this.onVoiceInfoReady);
         this.initVoiceDropDown();
      }
      
      private function initVoiceDropDown() : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:LanguageModel = null;
         this.languageSource = this.manager.languages;
         var _loc1_:Sort = new Sort();
         var _loc2_:SortField = new SortField("desc");
         _loc1_.fields = [_loc2_];
         this.languageSource.sort = _loc1_;
         this.languageSource.refresh();
         if(this.languageSource)
         {
            _loc4_ = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE);
            if(_loc4_)
            {
               _loc3_ = _loc4_.substr(0,2);
               _loc5_ = this.manager.getLanguageById(_loc3_);
            }
            else
            {
               _loc5_ = this.languageSource.getItemAt(0) as LanguageModel;
            }
            this.languageList.selectedItem = _loc5_;
            if(_loc5_)
            {
               this.genderSource = this.manager.getGenderByLangId(_loc5_.id);
               this.genderList.selectedItem = this.genderSource.getItemAt(0);
               this.updateVoiceList(_loc5_.id);
            }
            this._voiceInfoReady = true;
            this.selectVoiceById(this._voiceId);
         }
      }
      
      private function updateVoiceList(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Sort = null;
         var _loc2_:LanguageModel = this.manager.getLanguageById(param1);
         if(_loc2_)
         {
            this.voiceSource = _loc2_.voices;
            this.voiceSource.filterFunction = this.filterGender;
            _loc3_ = [];
            if(UtilUser.userType == UtilUser.BASIC_USER)
            {
               _loc3_.push(new SortField("plus",false,true));
            }
            _loc3_.push(new SortField("desc"));
            _loc4_ = new Sort();
            _loc4_.fields = _loc3_;
            this.voiceSource.sort = _loc4_;
            this.voiceSource.refresh();
            this.voiceList.selectedItem = this.voiceSource.getItemAt(0);
         }
      }
      
      private function filterGender(param1:Object) : Boolean
      {
         return param1.gender == this.genderList.selectedItem.data;
      }
      
      protected function selectVoiceById(param1:String) : void
      {
         var _loc3_:LanguageModel = null;
         var _loc4_:Object = null;
         if(!param1)
         {
            return;
         }
         if(!this._voiceInfoReady)
         {
            this.initVoiceInfo();
            return;
         }
         var _loc2_:VoiceModel = this.manager.getVoiceById(param1);
         if(!_loc2_)
         {
            _loc2_ = this.getFallbackVoice(param1);
         }
         if(_loc2_)
         {
            _loc3_ = this.manager.getLanguageById(_loc2_.languageId);
            if(_loc3_)
            {
               this.languageList.selectedItem = _loc3_;
               this.genderSource = this.manager.getGenderByLangId(_loc3_.id);
               for each(_loc4_ in this.genderSource)
               {
                  if(_loc2_.gender == _loc4_.data)
                  {
                     this.genderList.selectedItem = _loc4_;
                  }
               }
               this.updateVoiceList(_loc2_.languageId);
               this.voiceList.selectedItem = _loc2_;
            }
         }
      }
      
      private function getFallbackVoice(param1:String) : VoiceModel
      {
         var _loc2_:String = DEFAULT_TTS_VOICE;
         if(REMOVED_MALE_VOICES.indexOf(param1) >= 0)
         {
            _loc2_ = FALLBACK_MALE_VOICE;
         }
         else if(REMOVED_FEMALE_VOICES.indexOf(param1) >= 0)
         {
            _loc2_ = FALLBACK_FEMALE_VOICE;
         }
         return this.manager.getVoiceById(_loc2_);
      }
      
      private function textArea_changeHandler() : void
      {
         this._text = this.textArea.text;
         this.updateCharacterCounter();
         currentState = !!this._text?"ready":"notReady";
      }
      
      private function updateCharacterCounter() : void
      {
         this._charLeftText = StringUtil.substitute(UtilDict.toDisplay("go",REMAINING_CHARACTER_PROMPT),MAX_CHAR_ALLOWED - this._text.length);
      }
      
      public function commit(param1:Object) : void
      {
         if(this.sound#1 != null)
         {
            this.sound#1.stop();
         }
         var _loc2_:Boolean = false;
         if(this._text)
         {
            _loc2_ = this.getTextSpeechAsset();
         }
         if(!_loc2_)
         {
            this.currentState = "notReady";
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function getTextSpeechAsset() : Boolean
      {
         var _loc1_:RegExp = new RegExp(String.fromCharCode(13),"g");
         this._text = this._text.replace(_loc1_," ");
         if(this._text.length == 0)
         {
            return false;
         }
         var _loc2_:VoiceModel = this.voiceList.selectedItem as VoiceModel;
         this._voiceId = _loc2_.id;
         var _loc3_:URLRequest = TTSManager.getRequestOfTextToSpeech(this._text,this._voiceId);
         AppConfigManager.instance.appendURLVariables(_loc3_.data as URLVariables);
         var _loc4_:UtilURLStream = new UtilURLStream();
         _loc4_.addEventListener(Event.COMPLETE,this.onLoadComplete);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
         _loc4_.addEventListener(UtilURLStream.TIME_OUT,this.onLoadError);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
         _loc4_.load(_loc3_);
         return true;
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         var _loc2_:DataEvent = new DataEvent(DataEvent.UPLOAD_COMPLETE_DATA);
         var _loc3_:UtilURLStream = param1.target as UtilURLStream;
         var _loc4_:ByteArray = new ByteArray();
         _loc3_.readBytes(_loc4_);
         _loc2_.data = _loc4_.toString();
         dispatchEvent(_loc2_);
      }
      
      private function onLoadError(param1:Event) : void
      {
         this.dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
         this.sound#1 = null;
      }
      
      public function saveSound(param1:ByteArray, param2:XML) : void
      {
         var _loc3_:SoundThumb = Console.getConsole().speechManager.createSoundThumbByByte(param1,param2);
         this.saveSoundBySoundThumb(_loc3_);
      }
      
      public function updateSoundThumb(param1:SoundThumb) : void
      {
         currentState = "voicePrepared";
         this.soundThumb = param1;
         var _loc2_:AnimeSound = new AnimeSound();
         _loc2_.init(param1,0,999);
         this.controlGroup._btnPlay.animeSound = _loc2_;
         this.controlGroup._speechVolumeControl.volume = _loc2_.volume;
         _loc2_.previewSound();
      }
      
      public function saveSoundBySoundThumb(param1:SoundThumb) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:SpeechData = new SpeechData();
         _loc2_.type = SpeechData.SOURCE_TYPE_TTS;
         _loc2_.text = this._text;
         _loc2_.voice = this._voiceId;
         param1.ttsData = _loc2_;
         var _loc3_:SoundThumbEvent = new SoundThumbEvent(SoundThumbEvent.SOUND_CREATED);
         _loc3_.soundThumb = param1;
         _loc3_.volume = this.controlGroup._speechVolumeControl.volume;
         this.dispatchEvent(_loc3_);
      }
      
      protected function textArea_doubleClickHandler(param1:MouseEvent) : void
      {
         this.textArea.selectAll();
      }
      
      protected function genderList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:LanguageModel = this.languageList.selectedItem as LanguageModel;
         this.updateVoiceList(_loc2_.id);
         currentState = !!this._text?"ready":"notReady";
      }
      
      protected function languageList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc2_:LanguageModel = this.languageList.selectedItem as LanguageModel;
         if(_loc2_)
         {
            if(this.genderList.selectedItem)
            {
               _loc3_ = this.genderList.selectedItem.data;
            }
            this.genderSource = this.manager.getGenderByLangId(_loc2_.id);
            this.genderList.selectedItem = this.genderSource.getItemAt(0);
            _loc4_ = 0;
            while(_loc4_ < this.genderSource.length)
            {
               if(this.genderSource.getItemAt(_loc4_).data == _loc3_)
               {
                  this.genderList.selectedItem = this.genderSource.getItemAt(_loc4_);
               }
               _loc4_++;
            }
            this.updateVoiceList(_loc2_.id);
            currentState = !!this._text?"ready":"notReady";
         }
      }
      
      protected function voiceList_changeHandler(param1:IndexChangeEvent) : void
      {
         currentState = !!this._text?"ready":"notReady";
      }
      
      private function controlGroup_deleteVoiceHandler(param1:Event) : void
      {
         this.controlGroup._btnPlay.stopSound();
         this.controlGroup._btnPlay.animeSound = null;
         this.controlGroup._speechVolumeControl.volume = 0;
         currentState = !!this._text?"ready":"notReady";
         this.soundThumb = null;
      }
      
      private function generateVoiceButton_clickHandler() : void
      {
         currentState = "generating";
         var _loc1_:Object = {};
         _loc1_["zoom"] = false;
         _loc1_["action"] = false;
         this.commit(_loc1_);
      }
      
      private function addVoiceButton_clickHandler() : void
      {
         UtilErrorLogger.getInstance().info("TTSComponent::addVoiceButton_clickHandler");
         this.saveSoundBySoundThumb(this.soundThumb);
      }
      
      private function cancelButton_clickHandler() : void
      {
         this._target = null;
         this._soundId = null;
         currentState = "notReady";
         dispatchEvent(new Event("close"));
      }
      
      public function destroy() : void
      {
         this.controlGroup._btnPlay.stopSound();
      }
      
      private function inWhatLanguage_clickHandler(param1:FlowElementMouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
         if(ExternalInterface.available)
         {
            ExternalInterface.call("voiceBanner","iw");
         }
      }
      
      private function voiceBunny_clickHandler(param1:FlowElementMouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
         if(ExternalInterface.available)
         {
            ExternalInterface.call("voiceBanner","vb");
         }
      }
      
      private function _TTSComponent_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "ready";
         _loc1_.effect = this._TTSComponent_Parallel1_i();
         return _loc1_;
      }
      
      private function _TTSComponent_Parallel1_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._TTSComponent_Fade1_c(),this._TTSComponent_Resize1_c()];
         this._TTSComponent_Parallel1 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Parallel1",this._TTSComponent_Parallel1);
         return _loc1_;
      }
      
      private function _TTSComponent_Fade1_c() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _TTSComponent_Resize1_c() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _TTSComponent_Transition2_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "generating";
         _loc1_.effect = this._TTSComponent_Parallel2_i();
         return _loc1_;
      }
      
      private function _TTSComponent_Parallel2_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._TTSComponent_Fade2_c(),this._TTSComponent_Resize2_c()];
         this._TTSComponent_Parallel2 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Parallel2",this._TTSComponent_Parallel2);
         return _loc1_;
      }
      
      private function _TTSComponent_Fade2_c() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _TTSComponent_Resize2_c() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _TTSComponent_Transition3_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "voicePrepared";
         _loc1_.effect = this._TTSComponent_Parallel3_c();
         return _loc1_;
      }
      
      private function _TTSComponent_Parallel3_c() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._TTSComponent_Fade3_i(),this._TTSComponent_Resize3_i()];
         return _loc1_;
      }
      
      private function _TTSComponent_Fade3_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         this._TTSComponent_Fade3 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Fade3",this._TTSComponent_Fade3);
         return _loc1_;
      }
      
      private function _TTSComponent_Resize3_i() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 500;
         this._TTSComponent_Resize3 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Resize3",this._TTSComponent_Resize3);
         return _loc1_;
      }
      
      private function _TTSComponent_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.controlBarContent = [this._TTSComponent_Button1_i(),this._TTSComponent_Button2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TTSComponent_Array8_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _TTSComponent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "grey";
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
      
      private function _TTSComponent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.enabled = false;
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
      
      private function _TTSComponent_Array8_c() : Array
      {
         var _loc1_:Array = [this._TTSComponent_PopUpContentBackground1_c(),this._TTSComponent_VGroup1_c()];
         return _loc1_;
      }
      
      private function _TTSComponent_PopUpContentBackground1_c() : PopUpContentBackground
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
      
      private function _TTSComponent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.paddingTop = 21;
         _loc1_.paddingBottom = 21;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.mxmlContent = [this._TTSComponent_HGroup1_c(),this._TTSComponent_TextArea1_i(),this._TTSComponent_HGroup2_i(),this._TTSComponent_HGroup3_i(),this._TTSComponent_VGroup2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TTSComponent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TTSComponent_Label1_i(),this._TTSComponent_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TTSComponent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_TTSComponent_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TTSComponent_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Label1",this._TTSComponent_Label1);
         return _loc1_;
      }
      
      private function _TTSComponent_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","right");
         _loc1_.id = "_TTSComponent_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TTSComponent_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Label2",this._TTSComponent_Label2);
         return _loc1_;
      }
      
      private function _TTSComponent_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.height = 84;
         _loc1_.maxChars = 180;
         _loc1_.doubleClickEnabled = true;
         _loc1_.setStyle("color",2500134);
         _loc1_.setStyle("fontSize",14);
         _loc1_.addEventListener("change",this.__textArea_change);
         _loc1_.addEventListener("doubleClick",this.__textArea_doubleClick);
         _loc1_.id = "textArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textArea = _loc1_;
         BindingManager.executeBindings(this,"textArea",this.textArea);
         return _loc1_;
      }
      
      public function __textArea_change(param1:TextOperationEvent) : void
      {
         this.textArea_changeHandler();
      }
      
      public function __textArea_doubleClick(param1:MouseEvent) : void
      {
         this.textArea_doubleClickHandler(param1);
      }
      
      private function _TTSComponent_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 7;
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.mxmlContent = [this._TTSComponent_DropDownList1_i(),this._TTSComponent_DropDownList2_i(),this._TTSComponent_DropDownList3_i()];
         _loc1_.id = "languageSelectionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.languageSelectionGroup = _loc1_;
         BindingManager.executeBindings(this,"languageSelectionGroup",this.languageSelectionGroup);
         return _loc1_;
      }
      
      private function _TTSComponent_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.requireSelection = true;
         _loc1_.buttonMode = true;
         _loc1_.itemRenderer = this._TTSComponent_ClassFactory1_c();
         _loc1_.setStyle("skinClass",LanguageDropDownListSkin);
         _loc1_.addEventListener("change",this.__genderList_change);
         _loc1_.id = "genderList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.genderList = _loc1_;
         BindingManager.executeBindings(this,"genderList",this.genderList);
         return _loc1_;
      }
      
      private function _TTSComponent_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LanguageItemRenderer;
         return _loc1_;
      }
      
      public function __genderList_change(param1:IndexChangeEvent) : void
      {
         this.genderList_changeHandler(param1);
      }
      
      private function _TTSComponent_DropDownList2_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.requireSelection = true;
         _loc1_.buttonMode = true;
         _loc1_.itemRenderer = this._TTSComponent_ClassFactory2_c();
         _loc1_.setStyle("skinClass",LanguageDropDownListSkin);
         _loc1_.addEventListener("change",this.__languageList_change);
         _loc1_.id = "languageList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.languageList = _loc1_;
         BindingManager.executeBindings(this,"languageList",this.languageList);
         return _loc1_;
      }
      
      private function _TTSComponent_ClassFactory2_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LanguageItemRenderer;
         return _loc1_;
      }
      
      public function __languageList_change(param1:IndexChangeEvent) : void
      {
         this.languageList_changeHandler(param1);
      }
      
      private function _TTSComponent_DropDownList3_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.buttonMode = true;
         _loc1_.itemRenderer = this._TTSComponent_ClassFactory3_c();
         _loc1_.setStyle("skinClass",LanguageDropDownListSkin);
         _loc1_.addEventListener("change",this.__voiceList_change);
         _loc1_.id = "voiceList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.voiceList = _loc1_;
         BindingManager.executeBindings(this,"voiceList",this.voiceList);
         return _loc1_;
      }
      
      private function _TTSComponent_ClassFactory3_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LanguageItemRenderer;
         return _loc1_;
      }
      
      public function __voiceList_change(param1:IndexChangeEvent) : void
      {
         this.voiceList_changeHandler(param1);
      }
      
      private function _TTSComponent_HGroup3_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingTop = 21;
         _loc1_.paddingBottom = 21;
         _loc1_.mxmlContent = [this._TTSComponent_Button3_i(),this._TTSComponent_DialogDetailControlGroup1_i()];
         _loc1_.id = "btnGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnGroup = _loc1_;
         BindingManager.executeBindings(this,"btnGroup",this.btnGroup);
         return _loc1_;
      }
      
      private function _TTSComponent_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.height = 40;
         _loc1_.visible = false;
         _loc1_.enabled = false;
         _loc1_.includeInLayout = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_robot_icon_png_1858994797);
         _loc1_.addEventListener("click",this.__generateVoiceButton_click);
         _loc1_.id = "generateVoiceButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.generateVoiceButton = _loc1_;
         BindingManager.executeBindings(this,"generateVoiceButton",this.generateVoiceButton);
         return _loc1_;
      }
      
      public function __generateVoiceButton_click(param1:MouseEvent) : void
      {
         this.generateVoiceButton_clickHandler();
      }
      
      private function _TTSComponent_DialogDetailControlGroup1_i() : DialogDetailControlGroup
      {
         var _loc1_:DialogDetailControlGroup = new DialogDetailControlGroup();
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.currentState = "ttsAndAdded";
         _loc1_.addEventListener("deleteVoice",this.__controlGroup_deleteVoice);
         _loc1_.id = "controlGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.controlGroup = _loc1_;
         BindingManager.executeBindings(this,"controlGroup",this.controlGroup);
         return _loc1_;
      }
      
      public function __controlGroup_deleteVoice(param1:VoicePanelEvent) : void
      {
         this.controlGroup_deleteVoiceHandler(param1);
      }
      
      private function _TTSComponent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 14;
         _loc1_.mxmlContent = [this._TTSComponent_Line1_i()];
         _loc1_.id = "infoGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoGroup = _loc1_;
         BindingManager.executeBindings(this,"infoGroup",this.infoGroup);
         return _loc1_;
      }
      
      private function _TTSComponent_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._TTSComponent_SolidColorStroke1_c();
         _loc1_.initialized(this,"_TTSComponent_Line1");
         this._TTSComponent_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Line1",this._TTSComponent_Line1);
         return _loc1_;
      }
      
      private function _TTSComponent_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _TTSComponent_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","justify");
         _loc1_.setStyle("color",5923698);
         _loc1_.id = "_TTSComponent_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TTSComponent_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_Label3",this._TTSComponent_Label3);
         return _loc1_;
      }
      
      private function _TTSComponent_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.editable = false;
         _loc1_.focusEnabled = false;
         _loc1_.textFlow = this._TTSComponent_TextFlow1_c();
         _loc1_.setStyle("color",5923698);
         _loc1_.id = "_TTSComponent_RichEditableText1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TTSComponent_RichEditableText1 = _loc1_;
         BindingManager.executeBindings(this,"_TTSComponent_RichEditableText1",this._TTSComponent_RichEditableText1);
         return _loc1_;
      }
      
      private function _TTSComponent_TextFlow1_c() : TextFlow
      {
         var _loc1_:TextFlow = new TextFlow();
         _loc1_.mxmlChildren = ["\n                                    ",this._TTSComponent_ParagraphElement1_c(),"\n                                "];
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TTSComponent_ParagraphElement1_c() : ParagraphElement
      {
         var _loc1_:ParagraphElement = new ParagraphElement();
         _loc1_.mxmlChildren = ["\n                                        Too robotic? Hire a human at\n                                        ",this._TTSComponent_LinkElement1_c(),"\n                                        or\n                                        ",this._TTSComponent_LinkElement2_c(),"\n                                    "];
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TTSComponent_LinkElement1_c() : LinkElement
      {
         var _loc1_:LinkElement = new LinkElement();
         _loc1_.target = "_blank";
         _loc1_.mxmlChildren = ["\n                                            ",this._TTSComponent_SpanElement1_c(),"\n                                        "];
         _loc1_.addEventListener("click",this.___TTSComponent_LinkElement1_click);
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TTSComponent_SpanElement1_c() : SpanElement
      {
         var _loc1_:SpanElement = new SpanElement();
         _loc1_.color = 1808298;
         _loc1_.textDecoration = "none";
         _loc1_.mxmlChildren = ["\n                                                inWhatLanguage\n                                            "];
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      public function ___TTSComponent_LinkElement1_click(param1:FlowElementMouseEvent) : void
      {
         this.inWhatLanguage_clickHandler(param1);
      }
      
      private function _TTSComponent_LinkElement2_c() : LinkElement
      {
         var _loc1_:LinkElement = new LinkElement();
         _loc1_.target = "_blank";
         _loc1_.mxmlChildren = ["\n                                            ",this._TTSComponent_SpanElement2_c(),"\n                                        "];
         _loc1_.addEventListener("click",this.___TTSComponent_LinkElement2_click);
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TTSComponent_SpanElement2_c() : SpanElement
      {
         var _loc1_:SpanElement = new SpanElement();
         _loc1_.color = 1808298;
         _loc1_.textDecoration = "none";
         _loc1_.mxmlChildren = ["\n                                                VoiceBunny\n                                            "];
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      public function ___TTSComponent_LinkElement2_click(param1:FlowElementMouseEvent) : void
      {
         this.voiceBunny_clickHandler(param1);
      }
      
      public function ___TTSComponent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _TTSComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [btnGroup];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_TTSComponent_Parallel1.targets");
         result[1] = new Binding(this,function():Array
         {
            var _loc1_:* = [btnGroup];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_TTSComponent_Parallel2.targets");
         result[2] = new Binding(this,function():Array
         {
            var _loc1_:* = [btnGroup];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_TTSComponent_Fade3.targets");
         result[3] = new Binding(this,function():Array
         {
            var _loc1_:* = [infoGroup];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_TTSComponent_Resize3.targets");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",TITLE_TEXT);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",CANCEL_BUTTON_LABEL);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"cancelButton.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = _addVoiceButtonLabel;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"addVoiceButton.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = TEXT_AREA_TITLE;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TTSComponent_Label1.text");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = _charLeftText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TTSComponent_Label2.text");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = _text;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"textArea.text");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = RESTRICT_TEXT;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"textArea.restrict");
         result[11] = new Binding(this,function():IList
         {
            return genderSource;
         },null,"genderList.dataProvider");
         result[12] = new Binding(this,function():IList
         {
            return languageSource;
         },null,"languageList.dataProvider");
         result[13] = new Binding(this,function():IList
         {
            return voiceSource;
         },null,"voiceList.dataProvider");
         result[14] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",GENERATE_VOICE_BUTTON_LABEL);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"generateVoiceButton.label");
         result[15] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go",GENERATING_VOICE_BUTTON_LABEL);
         },null,"_TTSComponent_SetProperty1.value");
         result[16] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",ADVICE_TEXT);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TTSComponent_Label3.text");
         result[17] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go",ADVICE_TEXT_WHEN_GENERATING_VOICE);
         },null,"_TTSComponent_SetProperty2.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TTSComponent_Label3() : Label
      {
         return this._1028920981_TTSComponent_Label3;
      }
      
      public function set _TTSComponent_Label3(param1:Label) : void
      {
         var _loc2_:Object = this._1028920981_TTSComponent_Label3;
         if(_loc2_ !== param1)
         {
            this._1028920981_TTSComponent_Label3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TTSComponent_Label3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TTSComponent_SetProperty1() : SetProperty
      {
         return this._1467495152_TTSComponent_SetProperty1;
      }
      
      public function set _TTSComponent_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1467495152_TTSComponent_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1467495152_TTSComponent_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TTSComponent_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _TTSComponent_SetProperty2() : SetProperty
      {
         return this._1467495151_TTSComponent_SetProperty2;
      }
      
      public function set _TTSComponent_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1467495151_TTSComponent_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._1467495151_TTSComponent_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TTSComponent_SetProperty2",_loc2_,param1));
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
      public function get btnGroup() : HGroup
      {
         return this._2086216067btnGroup;
      }
      
      public function set btnGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._2086216067btnGroup;
         if(_loc2_ !== param1)
         {
            this._2086216067btnGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGroup",_loc2_,param1));
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
      public function get controlGroup() : DialogDetailControlGroup
      {
         return this._1645186270controlGroup;
      }
      
      public function set controlGroup(param1:DialogDetailControlGroup) : void
      {
         var _loc2_:Object = this._1645186270controlGroup;
         if(_loc2_ !== param1)
         {
            this._1645186270controlGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get genderList() : DropDownList
      {
         return this._939471105genderList;
      }
      
      public function set genderList(param1:DropDownList) : void
      {
         var _loc2_:Object = this._939471105genderList;
         if(_loc2_ !== param1)
         {
            this._939471105genderList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"genderList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get generateVoiceButton() : Button
      {
         return this._322449841generateVoiceButton;
      }
      
      public function set generateVoiceButton(param1:Button) : void
      {
         var _loc2_:Object = this._322449841generateVoiceButton;
         if(_loc2_ !== param1)
         {
            this._322449841generateVoiceButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"generateVoiceButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoGroup() : VGroup
      {
         return this._1209425521infoGroup;
      }
      
      public function set infoGroup(param1:VGroup) : void
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
      public function get languageList() : DropDownList
      {
         return this._2092086250languageList;
      }
      
      public function set languageList(param1:DropDownList) : void
      {
         var _loc2_:Object = this._2092086250languageList;
         if(_loc2_ !== param1)
         {
            this._2092086250languageList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"languageList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get languageSelectionGroup() : HGroup
      {
         return this._1376562741languageSelectionGroup;
      }
      
      public function set languageSelectionGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1376562741languageSelectionGroup;
         if(_loc2_ !== param1)
         {
            this._1376562741languageSelectionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"languageSelectionGroup",_loc2_,param1));
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
      public function get textArea() : TextArea
      {
         return this._1004197030textArea;
      }
      
      public function set textArea(param1:TextArea) : void
      {
         var _loc2_:Object = this._1004197030textArea;
         if(_loc2_ !== param1)
         {
            this._1004197030textArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get voiceList() : DropDownList
      {
         return this._1019274000voiceList;
      }
      
      public function set voiceList(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1019274000voiceList;
         if(_loc2_ !== param1)
         {
            this._1019274000voiceList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _text() : String
      {
         return this._91291148_text;
      }
      
      private function set _text(param1:String) : void
      {
         var _loc2_:Object = this._91291148_text;
         if(_loc2_ !== param1)
         {
            this._91291148_text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_text",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _genders() : Array
      {
         return this._2016932717_genders;
      }
      
      private function set _genders(param1:Array) : void
      {
         var _loc2_:Object = this._2016932717_genders;
         if(_loc2_ !== param1)
         {
            this._2016932717_genders = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_genders",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _voices() : Array
      {
         return this._1897480864_voices;
      }
      
      private function set _voices(param1:Array) : void
      {
         var _loc2_:Object = this._1897480864_voices;
         if(_loc2_ !== param1)
         {
            this._1897480864_voices = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_voices",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _langs() : Array
      {
         return this._1472458938_langs;
      }
      
      private function set _langs(param1:Array) : void
      {
         var _loc2_:Object = this._1472458938_langs;
         if(_loc2_ !== param1)
         {
            this._1472458938_langs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_langs",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get genderSource() : ArrayCollection
      {
         return this._682593732genderSource;
      }
      
      private function set genderSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._682593732genderSource;
         if(_loc2_ !== param1)
         {
            this._682593732genderSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"genderSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get languageSource() : ArrayCollection
      {
         return this._244185709languageSource;
      }
      
      private function set languageSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._244185709languageSource;
         if(_loc2_ !== param1)
         {
            this._244185709languageSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"languageSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get voiceSource() : ArrayCollection
      {
         return this._63764499voiceSource;
      }
      
      private function set voiceSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._63764499voiceSource;
         if(_loc2_ !== param1)
         {
            this._63764499voiceSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"voiceSource",_loc2_,param1));
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
      private function get _charLeftText() : String
      {
         return this._103831255_charLeftText;
      }
      
      private function set _charLeftText(param1:String) : void
      {
         var _loc2_:Object = this._103831255_charLeftText;
         if(_loc2_ !== param1)
         {
            this._103831255_charLeftText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_charLeftText",_loc2_,param1));
            }
         }
      }
   }
}
