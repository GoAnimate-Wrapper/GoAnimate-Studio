package anifire.studio.components
{
   import anifire.component.UploadHelper;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.ExtraDataEvent;
   import anifire.managers.AppConfigManager;
   import anifire.studio.commands.ChangeSoundLineCommand;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.SpeechData;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.core.sound.SoundThumbEvent;
   import anifire.studio.events.VoicePanelEvent;
   import anifire.studio.interfaces.ISpeechSubComponent;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilUser;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.FileFilter;
   import flash.net.FileReference;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.effects.Parallel;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextArea;
   import spark.components.VGroup;
   import spark.effects.Fade;
   import spark.effects.Resize;
   import spark.events.TextOperationEvent;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FileUploadComponent extends Group implements ISpeechSubComponent, IBindingClient, IStateClient2
   {
      
      private static const ADD_VOICE_COPY:String = UtilDict.toDisplay("go","Add Voice");
      
      private static const UPDATE_VOICE_COPY:String = UtilDict.toDisplay("go","Update");
      
      private static var FILTER_FLVMOVIE:FileFilter;
      
      private static var FILTER_FLASH:FileFilter;
      
      private static var FILTER_IMAGE:FileFilter;
      
      private static var FILTER_SOUND:FileFilter;
      
      private static var MAX_FILE_SIZE:Number;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FileUploadComponent_Label1:Label;
      
      public var _FileUploadComponent_Label2:Label;
      
      public var _FileUploadComponent_Label4:Label;
      
      public var _FileUploadComponent_Label5:Label;
      
      public var _FileUploadComponent_Parallel1:Parallel;
      
      public var _FileUploadComponent_Parallel2:Parallel;
      
      public var _FileUploadComponent_Parallel3:Parallel;
      
      private var _1929427368_FileUploadComponent_SetProperty1:SetProperty;
      
      private var _1929427367_FileUploadComponent_SetProperty2:SetProperty;
      
      private var _1820782830_loadProgress:StudioProgressBar;
      
      private var _76216227addVoiceButton:Button;
      
      private var _398731868browseButton:Button;
      
      private var _1990131276cancelButton:Button;
      
      private var _637393480controlGrp:DialogDetailControlGroup;
      
      private var _1325686188finishGroup:VGroup;
      
      private var _1818284309lineGroup:VGroup;
      
      private var _1890776210lineTextArea:TextArea;
      
      private var _106433028panel:Panel;
      
      private var _1188833284uploadedFile:Label;
      
      private var _427521858uploadingGroup:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var MAX_SIZE_MB:Number;
      
      private var _file:FileReference;
      
      private var _filter:FileFilter;
      
      private var _isZoomSelected:Boolean;
      
      private var _isActionSelected:Boolean;
      
      private var _target:Object;
      
      private var _soundThumb:SoundThumb;
      
      private var _volume:Number = -1;
      
      private var _sound:AnimeSound;
      
      private var _834112942_addVoiceButtonLabel:String;
      
      private var _503942753_lineChanged:Boolean;
      
      private var _embed_mxml__styles_images_voicetab_file_back_png_1679321139:Class;
      
      private var _embed_mxml__styles_images_voicetab_uploadfile_png_1227471351:Class;
      
      private var _embed_mxml__styles_images_voicetab_fileicon_png_774652023:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FileUploadComponent()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._filter = FILTER_IMAGE;
         this._834112942_addVoiceButtonLabel = ADD_VOICE_COPY;
         this._embed_mxml__styles_images_voicetab_file_back_png_1679321139 = FileUploadComponent__embed_mxml__styles_images_voicetab_file_back_png_1679321139;
         this._embed_mxml__styles_images_voicetab_uploadfile_png_1227471351 = FileUploadComponent__embed_mxml__styles_images_voicetab_uploadfile_png_1227471351;
         this._embed_mxml__styles_images_voicetab_fileicon_png_774652023 = FileUploadComponent__embed_mxml__styles_images_voicetab_fileicon_png_774652023;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._FileUploadComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FileUploadComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FileUploadComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [this._FileUploadComponent_Transition1_c(),this._FileUploadComponent_Transition2_c(),this._FileUploadComponent_Transition3_c()];
         this.mxmlContent = [this._FileUploadComponent_Panel1_i()];
         this.currentState = "ready";
         this.addEventListener("creationComplete",this.___FileUploadComponent_Group1_creationComplete);
         states = [new State({
            "name":"ready",
            "stateGroups":["step_one"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"browseButton",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"browseButton",
               "name":"includeInLayout",
               "value":true
            }),this._FileUploadComponent_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"browseButton",
               "name":"label",
               "value":undefined
            }))]
         }),new State({
            "name":"selecting",
            "stateGroups":["step_one"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"browseButton",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"browseButton",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"browseButton",
               "name":"includeInLayout",
               "value":true
            }),this._FileUploadComponent_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "target":"browseButton",
               "name":"label",
               "value":undefined
            }))]
         }),new State({
            "name":"uploading",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"uploadingGroup",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"uploadingGroup",
               "name":"includeInLayout",
               "value":true
            })]
         }),new State({
            "name":"finish",
            "overrides":[new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"addVoiceButton",
               "name":"enabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"finishGroup",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"finishGroup",
               "name":"includeInLayout",
               "value":true
            })]
         })];
         BindingManager.executeBindings(this,"_FileUploadComponent_SetProperty1",this._FileUploadComponent_SetProperty1);
         BindingManager.executeBindings(this,"_FileUploadComponent_SetProperty2",this._FileUploadComponent_SetProperty2);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FileUploadComponent._watcherSetupUtil = param1;
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
      
      public function set soundThumb(param1:SoundThumb) : void
      {
         this._soundThumb = param1;
      }
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         currentState = "ready";
         this._target = param1;
         this.updateForm();
      }
      
      public function set sound#1(param1:AnimeSound) : void
      {
         this._sound = param1;
         this._lineChanged = false;
         this.lineTextArea.text = "";
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
         }
      }
      
      public function set loadProgress(param1:Number) : void
      {
         this._loadProgress.setProgress(param1);
      }
      
      private function init() : void
      {
         FILTER_SOUND = new FileFilter(UtilDict.toDisplay("go","Sound File(*.mp3;*.wav;*.m4a)"),"*.mp3;*.wav;*.m4a");
         if(UtilUser.hasBusinessFeatures)
         {
            this.MAX_SIZE_MB = 15;
         }
         else
         {
            this.MAX_SIZE_MB = 4;
         }
         MAX_FILE_SIZE = this.MAX_SIZE_MB * 1024 * 1024;
         this._filter = FILTER_SOUND;
         this.controlGrp.addEventListener(ExtraDataEvent.UPDATE,this.onVolumeUpdate);
         currentState = "ready";
      }
      
      private function updateForm() : void
      {
      }
      
      private function onVolumeUpdate(param1:ExtraDataEvent) : void
      {
         this._volume = param1.getData() as Number;
      }
      
      private function onClickDelete(param1:Event = null) : void
      {
         this.destroy();
         currentState = "ready";
      }
      
      private function browseButton_clickHandler() : void
      {
         if(this._file == null)
         {
            this._file = new FileReference();
            this._file.addEventListener(Event.CANCEL,this.file_cancelHandler);
            this._file.addEventListener(Event.SELECT,this.file_selectHandler);
         }
         currentState = "selecting";
         this._file.browse([this._filter]);
      }
      
      private function file_cancelHandler(param1:Event) : void
      {
         this.clearFileReference();
      }
      
      private function file_selectHandler(param1:Event) : void
      {
         var _loc2_:String = null;
         this._loadProgress.setProgress(0);
         if(this._file.size > MAX_FILE_SIZE)
         {
            this.clearFileReference();
         }
         else
         {
            this.onFileChangeHandler();
         }
      }
      
      private function clearFileReference() : void
      {
         currentState = "ready";
         if(this._file != null)
         {
            this._file.cancel();
            this._file = null;
         }
      }
      
      private function onFileChangeHandler() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
         currentState = "uploading";
         this.upload();
      }
      
      private function upload() : void
      {
         var request:URLRequest = null;
         var variables:URLVariables = null;
         var fileUploadHelper:UploadHelper = null;
         if(this._file)
         {
            request = new URLRequest(ServerConstants.ACTION_SAVE_SOUND);
            variables = AppConfigManager.instance.createURLVariables();
            variables["title"] = this._file.name;
            variables["keywords"] = "voice";
            variables["subtype"] = AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER;
            variables["type"] = AnimeConstants.ASSET_TYPE_SOUND;
            variables["is_published"] = "0";
            request.data = variables;
            request.method = URLRequestMethod.POST;
            try
            {
               fileUploadHelper = new UploadHelper();
               fileUploadHelper.init(this._file,request);
               fileUploadHelper.addEventListener(ProgressEvent.PROGRESS,this.onUploadProgress);
               fileUploadHelper.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,this.onUploadComplete);
               fileUploadHelper.addEventListener(IOErrorEvent.IO_ERROR,this.onUploadError);
               fileUploadHelper.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onUploadError);
               fileUploadHelper.upload();
               currentState = "uploading";
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().appendCustomError("FileUploadComponent:upload",e);
               return;
            }
         }
         else
         {
            dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function onUploadComplete(param1:DataEvent) : void
      {
         this.clearProgress();
         dispatchEvent(param1);
      }
      
      private function onUploadError(param1:Event) : void
      {
         UtilErrorLogger.getInstance().error("FileUploadComponent: " + param1);
         dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
      }
      
      public function saveSound(param1:ByteArray, param2:XML) : void
      {
         var _loc3_:SoundThumb = Console.getConsole().speechManager.createSoundThumbByByte(param1,param2);
         this.saveSoundBySoundThumb(_loc3_);
      }
      
      public function saveSoundBySoundThumb(param1:SoundThumb) : void
      {
         var _loc2_:SpeechData = new SpeechData();
         _loc2_.type = SpeechData.SOURCE_TYPE_VOICE_FILE;
         _loc2_.text = !!this.lineTextArea.text?this.lineTextArea.text:"";
         param1.ttsData = _loc2_;
         var _loc3_:SoundThumbEvent = new SoundThumbEvent(SoundThumbEvent.SOUND_CREATED);
         _loc3_.soundThumb = param1;
         this.dispatchEvent(_loc3_);
      }
      
      private function onSoundAdded(param1:SoundEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function onUploadProgress(param1:ProgressEvent) : void
      {
         var _loc2_:Number = param1.bytesLoaded / param1.bytesTotal;
         this.updateProgress(_loc2_);
      }
      
      public function commit(param1:Object) : void
      {
         this.upload();
      }
      
      private function clearProgress() : void
      {
         this._loadProgress.setProgress(0);
      }
      
      private function updateProgress(param1:Number) : void
      {
         this._loadProgress.setProgress(param1 * 100);
      }
      
      private function addVoiceButton_clickHandler() : void
      {
         var _loc1_:ChangeSoundLineCommand = null;
         UtilErrorLogger.getInstance().info("FileUploadComponent::addVoiceButton_clickHandler");
         if(this.currentState == "ready")
         {
            if(this._sound && this._sound.soundThumb && this._sound.soundThumb.ttsData)
            {
               _loc1_ = new ChangeSoundLineCommand(this._sound,this.lineTextArea.text);
               _loc1_.execute();
            }
            dispatchEvent(new Event("close"));
            return;
         }
         this.saveSoundBySoundThumb(this.soundThumb);
      }
      
      public function updateSoundThumb(param1:SoundThumb) : void
      {
         currentState = "finish";
         this.soundThumb = param1;
         this.uploadedFile.text = param1.name;
         var _loc2_:AnimeSound = new AnimeSound();
         _loc2_.init(param1,0,999);
         this.controlGrp._btnPlay.animeSound = _loc2_;
         this.controlGrp._speechVolumeControl.volume = _loc2_.volume;
      }
      
      private function cancelButton_clickHandler() : void
      {
         dispatchEvent(new Event("close"));
      }
      
      public function destroy() : void
      {
         this.controlGrp._btnPlay.stopSound();
      }
      
      protected function lineTextArea_changeHandler(param1:TextOperationEvent) : void
      {
         this._lineChanged = true;
      }
      
      private function _FileUploadComponent_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "uploading";
         _loc1_.effect = this._FileUploadComponent_Parallel1_i();
         return _loc1_;
      }
      
      private function _FileUploadComponent_Parallel1_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._FileUploadComponent_Fade1_c()];
         this._FileUploadComponent_Parallel1 = _loc1_;
         BindingManager.executeBindings(this,"_FileUploadComponent_Parallel1",this._FileUploadComponent_Parallel1);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Fade1_c() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _FileUploadComponent_Transition2_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "finish";
         _loc1_.effect = this._FileUploadComponent_Parallel2_i();
         return _loc1_;
      }
      
      private function _FileUploadComponent_Parallel2_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._FileUploadComponent_Fade2_c(),this._FileUploadComponent_Resize1_c()];
         this._FileUploadComponent_Parallel2 = _loc1_;
         BindingManager.executeBindings(this,"_FileUploadComponent_Parallel2",this._FileUploadComponent_Parallel2);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Fade2_c() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _FileUploadComponent_Resize1_c() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _FileUploadComponent_Transition3_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "ready";
         _loc1_.effect = this._FileUploadComponent_Parallel3_i();
         return _loc1_;
      }
      
      private function _FileUploadComponent_Parallel3_i() : Parallel
      {
         var _loc1_:Parallel = new Parallel();
         _loc1_.children = [this._FileUploadComponent_Fade3_c(),this._FileUploadComponent_Resize2_c()];
         this._FileUploadComponent_Parallel3 = _loc1_;
         BindingManager.executeBindings(this,"_FileUploadComponent_Parallel3",this._FileUploadComponent_Parallel3);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Fade3_c() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _FileUploadComponent_Resize2_c() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 500;
         return _loc1_;
      }
      
      private function _FileUploadComponent_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.controlBarContent = [this._FileUploadComponent_Button1_i(),this._FileUploadComponent_Button2_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._FileUploadComponent_Array10_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Button1_i() : Button
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
      
      private function _FileUploadComponent_Button2_i() : Button
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
      
      private function _FileUploadComponent_Array10_c() : Array
      {
         var _loc1_:Array = [this._FileUploadComponent_PopUpContentBackground1_c(),this._FileUploadComponent_VGroup1_c()];
         return _loc1_;
      }
      
      private function _FileUploadComponent_PopUpContentBackground1_c() : PopUpContentBackground
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
      
      private function _FileUploadComponent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.paddingTop = 21;
         _loc1_.paddingBottom = 21;
         _loc1_.mxmlContent = [this._FileUploadComponent_BitmapImage1_c(),this._FileUploadComponent_Spacer1_c(),this._FileUploadComponent_Label1_i(),this._FileUploadComponent_Label2_i(),this._FileUploadComponent_Spacer2_c(),this._FileUploadComponent_VGroup2_i(),this._FileUploadComponent_VGroup3_i(),this._FileUploadComponent_Button3_i(),this._FileUploadComponent_Spacer3_c(),this._FileUploadComponent_VGroup4_c(),this._FileUploadComponent_Spacer4_c(),this._FileUploadComponent_VGroup5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_voicetab_uploadfile_png_1227471351;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 14;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("color",5200489);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_FileUploadComponent_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FileUploadComponent_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_FileUploadComponent_Label1",this._FileUploadComponent_Label1);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",9937845);
         _loc1_.id = "_FileUploadComponent_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FileUploadComponent_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_FileUploadComponent_Label2",this._FileUploadComponent_Label2);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 7;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._FileUploadComponent_Group2_c(),this._FileUploadComponent_DialogDetailControlGroup1_i()];
         _loc1_.id = "finishGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.finishGroup = _loc1_;
         BindingManager.executeBindings(this,"finishGroup",this.finishGroup);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 80;
         _loc1_.mxmlContent = [this._FileUploadComponent_Group3_c(),this._FileUploadComponent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._FileUploadComponent_BitmapImage2_c(),this._FileUploadComponent_Rect1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_voicetab_file_back_png_1679321139;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._FileUploadComponent_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FileUploadComponent_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FileUploadComponent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._FileUploadComponent_BitmapImage3_c(),this._FileUploadComponent_Label3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_voicetab_fileicon_png_774652023;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 300;
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 12;
         _loc1_.left = 24;
         _loc1_.bottom = 12;
         _loc1_.right = 24;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "uploadedFile";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.uploadedFile = _loc1_;
         BindingManager.executeBindings(this,"uploadedFile",this.uploadedFile);
         return _loc1_;
      }
      
      private function _FileUploadComponent_DialogDetailControlGroup1_i() : DialogDetailControlGroup
      {
         var _loc1_:DialogDetailControlGroup = new DialogDetailControlGroup();
         _loc1_.currentState = "fileAndAdded";
         _loc1_.addEventListener("deleteVoice",this.__controlGrp_deleteVoice);
         _loc1_.id = "controlGrp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.controlGrp = _loc1_;
         BindingManager.executeBindings(this,"controlGrp",this.controlGrp);
         return _loc1_;
      }
      
      public function __controlGrp_deleteVoice(param1:VoicePanelEvent) : void
      {
         this.onClickDelete(param1);
      }
      
      private function _FileUploadComponent_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 60;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._FileUploadComponent_StudioProgressBar1_i(),this._FileUploadComponent_Label4_i()];
         _loc1_.id = "uploadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.uploadingGroup = _loc1_;
         BindingManager.executeBindings(this,"uploadingGroup",this.uploadingGroup);
         return _loc1_;
      }
      
      private function _FileUploadComponent_StudioProgressBar1_i() : StudioProgressBar
      {
         var _loc1_:StudioProgressBar = new StudioProgressBar();
         _loc1_.top = 21;
         _loc1_.id = "_loadProgress";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._loadProgress = _loc1_;
         BindingManager.executeBindings(this,"_loadProgress",this._loadProgress);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 28;
         _loc1_.setStyle("color",5200489);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_FileUploadComponent_Label4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FileUploadComponent_Label4 = _loc1_;
         BindingManager.executeBindings(this,"_FileUploadComponent_Label4",this._FileUploadComponent_Label4);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.enabled = true;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.addEventListener("click",this.__browseButton_click);
         _loc1_.id = "browseButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.browseButton = _loc1_;
         BindingManager.executeBindings(this,"browseButton",this.browseButton);
         return _loc1_;
      }
      
      public function __browseButton_click(param1:MouseEvent) : void
      {
         this.browseButton_clickHandler();
      }
      
      private function _FileUploadComponent_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 14;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.mxmlContent = [this._FileUploadComponent_Line1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._FileUploadComponent_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FileUploadComponent_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14870509;
         return _loc1_;
      }
      
      private function _FileUploadComponent_Spacer4_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 14;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FileUploadComponent_VGroup5_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.mxmlContent = [this._FileUploadComponent_Label5_i(),this._FileUploadComponent_TextArea1_i()];
         _loc1_.id = "lineGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lineGroup = _loc1_;
         BindingManager.executeBindings(this,"lineGroup",this.lineGroup);
         return _loc1_;
      }
      
      private function _FileUploadComponent_Label5_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_FileUploadComponent_Label5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FileUploadComponent_Label5 = _loc1_;
         BindingManager.executeBindings(this,"_FileUploadComponent_Label5",this._FileUploadComponent_Label5);
         return _loc1_;
      }
      
      private function _FileUploadComponent_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.height = 60;
         _loc1_.heightInLines = 3;
         _loc1_.maxChars = 255;
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
      
      public function ___FileUploadComponent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _FileUploadComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_FileUploadComponent_Parallel1.target","uploadingGroup");
         result[1] = new Binding(this,null,null,"_FileUploadComponent_Parallel2.target","finishGroup");
         result[2] = new Binding(this,null,null,"_FileUploadComponent_Parallel3.target","browseButton");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Upload File");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Cancel");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"cancelButton.label");
         result[5] = new Binding(this,function():Boolean
         {
            return _lineChanged;
         },null,"addVoiceButton.enabled");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = _addVoiceButtonLabel;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"addVoiceButton.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Upload a file from your computer");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_FileUploadComponent_Label1.text");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Audio file must be in MP3, WAV, M4A format");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_FileUploadComponent_Label2.text");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Uploading...");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_FileUploadComponent_Label4.text");
         result[10] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Upload a file");
         },null,"_FileUploadComponent_SetProperty1.value");
         result[11] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Selecting");
         },null,"_FileUploadComponent_SetProperty2.value");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Line (optional)");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_FileUploadComponent_Label5.text");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Type in a line");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"lineTextArea.prompt");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FileUploadComponent_SetProperty1() : SetProperty
      {
         return this._1929427368_FileUploadComponent_SetProperty1;
      }
      
      public function set _FileUploadComponent_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1929427368_FileUploadComponent_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1929427368_FileUploadComponent_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FileUploadComponent_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FileUploadComponent_SetProperty2() : SetProperty
      {
         return this._1929427367_FileUploadComponent_SetProperty2;
      }
      
      public function set _FileUploadComponent_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1929427367_FileUploadComponent_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._1929427367_FileUploadComponent_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FileUploadComponent_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _loadProgress() : StudioProgressBar
      {
         return this._1820782830_loadProgress;
      }
      
      public function set _loadProgress(param1:StudioProgressBar) : void
      {
         var _loc2_:Object = this._1820782830_loadProgress;
         if(_loc2_ !== param1)
         {
            this._1820782830_loadProgress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_loadProgress",_loc2_,param1));
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
      public function get browseButton() : Button
      {
         return this._398731868browseButton;
      }
      
      public function set browseButton(param1:Button) : void
      {
         var _loc2_:Object = this._398731868browseButton;
         if(_loc2_ !== param1)
         {
            this._398731868browseButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"browseButton",_loc2_,param1));
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
      public function get controlGrp() : DialogDetailControlGroup
      {
         return this._637393480controlGrp;
      }
      
      public function set controlGrp(param1:DialogDetailControlGroup) : void
      {
         var _loc2_:Object = this._637393480controlGrp;
         if(_loc2_ !== param1)
         {
            this._637393480controlGrp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlGrp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get finishGroup() : VGroup
      {
         return this._1325686188finishGroup;
      }
      
      public function set finishGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1325686188finishGroup;
         if(_loc2_ !== param1)
         {
            this._1325686188finishGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"finishGroup",_loc2_,param1));
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
      public function get uploadedFile() : Label
      {
         return this._1188833284uploadedFile;
      }
      
      public function set uploadedFile(param1:Label) : void
      {
         var _loc2_:Object = this._1188833284uploadedFile;
         if(_loc2_ !== param1)
         {
            this._1188833284uploadedFile = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"uploadedFile",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get uploadingGroup() : VGroup
      {
         return this._427521858uploadingGroup;
      }
      
      public function set uploadingGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._427521858uploadingGroup;
         if(_loc2_ !== param1)
         {
            this._427521858uploadingGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"uploadingGroup",_loc2_,param1));
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
