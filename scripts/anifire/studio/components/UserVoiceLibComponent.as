package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.event.ExtraDataEvent;
   import anifire.studio.commands.ChangeSoundLineCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.SpeechData;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.core.sound.SoundThumbEvent;
   import anifire.studio.events.ProductExplorerEvent;
   import anifire.studio.events.VoicePanelEvent;
   import anifire.studio.interfaces.ISpeechSubComponent;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.studio.skins.VoiceExplorerProductListSkin;
   import anifire.studio.skins.VoiceProductExplorerSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilErrorLogger;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextArea;
   import spark.components.VGroup;
   import spark.effects.Fade;
   import spark.events.TextOperationEvent;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class UserVoiceLibComponent extends Group implements ISpeechSubComponent, IBindingClient, IStateClient2
   {
      
      private static const ADD_VOICE_COPY:String = UtilDict.toDisplay("go","Add Voice");
      
      private static const UPDATE_VOICE_COPY:String = UtilDict.toDisplay("go","Update");
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1482912637_UserVoiceLibComponent_Button4:Button;
      
      private var _1847271374_UserVoiceLibComponent_Group2:Group;
      
      private var _1847271370_UserVoiceLibComponent_Group6:Group;
      
      public var _UserVoiceLibComponent_Label1:Label;
      
      public var _UserVoiceLibComponent_Label3:Label;
      
      private var _558539462_UserVoiceLibComponent_Spacer1:Spacer;
      
      private var _558539463_UserVoiceLibComponent_Spacer2:Spacer;
      
      private var _2063327979_UserVoiceLibComponent_VGroup3:VGroup;
      
      private var _76216227addVoiceButton:Button;
      
      private var _1990131276cancelButton:Button;
      
      private var _637393480controlGrp:DialogDetailControlGroup;
      
      private var _1818284309lineGroup:VGroup;
      
      private var _1890776210lineTextArea:TextArea;
      
      private var _106433028panel:Panel;
      
      private var _1643119082selectFileButton:Button;
      
      private var _1348981393thumbSelected:Label;
      
      private var _1689324643userSoundExplorer:ProductExplorer;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:Object;
      
      private var _1203236063errorMessage:String;
      
      private var _1895618663_userAssetManager:UserAssetManager;
      
      private var _1883088414_userSoundReady:Boolean;
      
      private var _soundThumb:SoundThumb;
      
      private var _volume:Number = -1;
      
      private var _sound:AnimeSound;
      
      private var _834112942_addVoiceButtonLabel:String;
      
      private var _503942753_lineChanged:Boolean;
      
      private var _embed_mxml__styles_images_voicetab_file_back_png_1679321139:Class;
      
      private var _embed_mxml__styles_images_voicetab_yourlibrary_png_283938743:Class;
      
      private var _embed_mxml__styles_images_voicetab_fileicon_png_774652023:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function UserVoiceLibComponent()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._834112942_addVoiceButtonLabel = ADD_VOICE_COPY;
         this._embed_mxml__styles_images_voicetab_file_back_png_1679321139 = UserVoiceLibComponent__embed_mxml__styles_images_voicetab_file_back_png_1679321139;
         this._embed_mxml__styles_images_voicetab_yourlibrary_png_283938743 = UserVoiceLibComponent__embed_mxml__styles_images_voicetab_yourlibrary_png_283938743;
         this._embed_mxml__styles_images_voicetab_fileicon_png_774652023 = UserVoiceLibComponent__embed_mxml__styles_images_voicetab_fileicon_png_774652023;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._UserVoiceLibComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_UserVoiceLibComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return UserVoiceLibComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._UserVoiceLibComponent_Panel1_i()];
         this.currentState = "ready";
         this.addEventListener("creationComplete",this.___UserVoiceLibComponent_Group1_creationComplete);
         var _UserVoiceLibComponent_Button2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._UserVoiceLibComponent_Button2_i);
         var _UserVoiceLibComponent_Button3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._UserVoiceLibComponent_Button3_i);
         states = [new State({
            "name":"ready",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_UserVoiceLibComponent_Button3_factory,
               "destination":"panel",
               "propertyName":"controlBarContent",
               "position":"after",
               "relativeTo":["cancelButton"]
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Group2",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Group2",
               "name":"includeInLayout",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Spacer1",
               "name":"height",
               "value":12
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Button4",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Button4",
               "name":"includeInLayout",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Spacer2",
               "name":"height",
               "value":12
            })]
         }),new State({
            "name":"listing",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_UserVoiceLibComponent_Button2_factory,
               "destination":"panel",
               "propertyName":"controlBarContent",
               "position":"after",
               "relativeTo":["cancelButton"]
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Group6",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Group6",
               "name":"includeInLayout",
               "value":true
            })]
         }),new State({
            "name":"selected",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_UserVoiceLibComponent_Button3_factory,
               "destination":"panel",
               "propertyName":"controlBarContent",
               "position":"after",
               "relativeTo":["cancelButton"]
            }),new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"addVoiceButton",
               "name":"enabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Group2",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_Group2",
               "name":"includeInLayout",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_VGroup3",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_UserVoiceLibComponent_VGroup3",
               "name":"includeInLayout",
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
         UserVoiceLibComponent._watcherSetupUtil = param1;
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
      }
      
      private function init() : void
      {
         this._userAssetManager = UserAssetManager.instance;
         this._userAssetManager.addEventListener(CoreEvent.USER_SOUND_COMPLETE,this.onUserSoundLoaded);
         this.userSoundExplorer.addEventListener(ProductExplorerEvent.PRODUCT_SELECTED,this.onUserSelectThumb);
         this.controlGrp.addEventListener(ExtraDataEvent.UPDATE,this.onVolumeUpdate);
      }
      
      private function updateForm() : void
      {
         var _loc1_:AnimeScene = null;
         var _loc2_:String = null;
         var _loc3_:AnimeSound = null;
         var _loc5_:Character = null;
         var _loc4_:SpeechData = null;
         if(this.target is Character)
         {
            _loc5_ = this.target as Character;
            _loc1_ = _loc5_.scene;
         }
         else if(this.target is AnimeScene)
         {
            _loc1_ = this.target as AnimeScene;
         }
         if(!_loc1_)
         {
         }
      }
      
      private function onVolumeUpdate(param1:ExtraDataEvent) : void
      {
         this._volume = param1.getData() as Number;
      }
      
      private function onUserClickDelete(param1:Event) : void
      {
         currentState = "ready";
      }
      
      private function onUserSelectThumb(param1:Event) : void
      {
         this.selectFileButton.enabled = true;
      }
      
      private function onUserSoundLoaded(param1:CoreEvent) : void
      {
         this.userSoundExplorer.hideInvalidCategories();
         if(!this._userSoundReady)
         {
            this._userSoundReady = true;
            this.userSoundExplorer.displayNaturally();
         }
      }
      
      public function commit(param1:Object) : void
      {
      }
      
      public function saveSound(param1:ByteArray, param2:XML) : void
      {
         var _loc3_:SoundThumb = Console.getConsole().speechManager.createSoundThumbByByte(param1,param2);
         this.saveSoundBySoundThumb(_loc3_);
      }
      
      public function saveSoundBySoundThumb(param1:SoundThumb) : void
      {
         var _loc2_:SpeechData = new SpeechData();
         _loc2_.type = SpeechData.SOURCE_TYPE_LIB;
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
      
      private function addVoiceButton_clickHandler() : void
      {
         var _loc1_:ChangeSoundLineCommand = null;
         UtilErrorLogger.getInstance().info("UserVoiceLibComponenet::addVoiceButton_clickHandler");
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
         this.saveSoundBySoundThumb(this._soundThumb);
      }
      
      public function updateSoundThumb(param1:SoundThumb) : void
      {
      }
      
      private function onSelectClick() : void
      {
         if(!this._userSoundReady)
         {
            UserAssetManager.instance.loadSound();
         }
         this.userSoundExplorer.selectProperCategoryIfNoSelection();
         currentState = "listing";
      }
      
      private function selectFileButton_clickHandler() : void
      {
         var _loc1_:SoundThumb = null;
         var _loc2_:AnimeSound = null;
         if(this.userSoundExplorer.selectedProduct)
         {
            _loc1_ = this.userSoundExplorer.selectedProduct.thumb as SoundThumb;
            this._soundThumb = _loc1_;
            this.thumbSelected.text = this._soundThumb.name;
            _loc2_ = new AnimeSound();
            _loc2_.init(this._soundThumb,0,999);
            this.controlGrp._btnPlay.animeSound = _loc2_;
            this.controlGrp._speechVolumeControl.volume = _loc2_.volume;
            currentState = "selected";
         }
      }
      
      private function cancelButton_clickHandler() : void
      {
         dispatchEvent(new Event("close"));
      }
      
      public function destroy() : void
      {
         this.controlGrp._btnPlay.stopSound();
      }
      
      protected function onSearchSubmitted(param1:Event) : void
      {
         var _loc2_:Fade = new Fade();
         _loc2_.alphaTo = 0;
         _loc2_.duration = 500;
         _loc2_.play([this.userSoundExplorer.productList.scroller]);
      }
      
      protected function onSearchDone(param1:Event) : void
      {
         var _loc2_:Fade = new Fade();
         _loc2_.alphaTo = 1;
         _loc2_.duration = 500;
         _loc2_.play([this.userSoundExplorer.productList.scroller]);
      }
      
      protected function onProductCategoryChange(param1:ProductExplorerEvent) : void
      {
         this.userSoundExplorer.selectedProduct = null;
      }
      
      protected function lineTextArea_changeHandler(param1:TextOperationEvent) : void
      {
         this._lineChanged = true;
      }
      
      private function _UserVoiceLibComponent_Panel1_i() : Panel
      {
         var _loc1_:Panel = new Panel();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.controlBarContent = [this._UserVoiceLibComponent_Button1_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._UserVoiceLibComponent_Array4_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Button1_i() : Button
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
      
      private function _UserVoiceLibComponent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.__selectFileButton_click);
         _loc1_.id = "selectFileButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectFileButton = _loc1_;
         BindingManager.executeBindings(this,"selectFileButton",this.selectFileButton);
         return _loc1_;
      }
      
      public function __selectFileButton_click(param1:MouseEvent) : void
      {
         this.selectFileButton_clickHandler();
      }
      
      private function _UserVoiceLibComponent_Button3_i() : Button
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
      
      private function _UserVoiceLibComponent_Array4_c() : Array
      {
         var _loc1_:Array = [this._UserVoiceLibComponent_PopUpContentBackground1_c(),this._UserVoiceLibComponent_Group2_i(),this._UserVoiceLibComponent_Group6_i()];
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_PopUpContentBackground1_c() : PopUpContentBackground
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
      
      private function _UserVoiceLibComponent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_VGroup1_c()];
         _loc1_.id = "_UserVoiceLibComponent_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserVoiceLibComponent_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_UserVoiceLibComponent_Group2",this._UserVoiceLibComponent_Group2);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 12;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_Group3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = 12;
         _loc1_.top = 18;
         _loc1_.bottom = 18;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_BitmapImage1_c(),this._UserVoiceLibComponent_Label1_i(),this._UserVoiceLibComponent_Spacer1_i(),this._UserVoiceLibComponent_Button4_i(),this._UserVoiceLibComponent_Spacer2_i(),this._UserVoiceLibComponent_VGroup3_i(),this._UserVoiceLibComponent_VGroup4_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_voicetab_yourlibrary_png_283938743;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_UserVoiceLibComponent_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserVoiceLibComponent_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_UserVoiceLibComponent_Label1",this._UserVoiceLibComponent_Label1);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Spacer1_i() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.id = "_UserVoiceLibComponent_Spacer1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserVoiceLibComponent_Spacer1 = _loc1_;
         BindingManager.executeBindings(this,"_UserVoiceLibComponent_Spacer1",this._UserVoiceLibComponent_Spacer1);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___UserVoiceLibComponent_Button4_click);
         _loc1_.id = "_UserVoiceLibComponent_Button4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserVoiceLibComponent_Button4 = _loc1_;
         BindingManager.executeBindings(this,"_UserVoiceLibComponent_Button4",this._UserVoiceLibComponent_Button4);
         return _loc1_;
      }
      
      public function ___UserVoiceLibComponent_Button4_click(param1:MouseEvent) : void
      {
         this.onSelectClick();
      }
      
      private function _UserVoiceLibComponent_Spacer2_i() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.id = "_UserVoiceLibComponent_Spacer2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserVoiceLibComponent_Spacer2 = _loc1_;
         BindingManager.executeBindings(this,"_UserVoiceLibComponent_Spacer2",this._UserVoiceLibComponent_Spacer2);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_Group4_c(),this._UserVoiceLibComponent_DialogDetailControlGroup1_i()];
         _loc1_.id = "_UserVoiceLibComponent_VGroup3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserVoiceLibComponent_VGroup3 = _loc1_;
         BindingManager.executeBindings(this,"_UserVoiceLibComponent_VGroup3",this._UserVoiceLibComponent_VGroup3);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 80;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_Group5_c(),this._UserVoiceLibComponent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_BitmapImage2_c(),this._UserVoiceLibComponent_Rect1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_voicetab_file_back_png_1679321139;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._UserVoiceLibComponent_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_BitmapImage3_c(),this._UserVoiceLibComponent_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_voicetab_fileicon_png_774652023;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 12;
         _loc1_.left = 24;
         _loc1_.bottom = 12;
         _loc1_.right = 24;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "thumbSelected";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumbSelected = _loc1_;
         BindingManager.executeBindings(this,"thumbSelected",this.thumbSelected);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_DialogDetailControlGroup1_i() : DialogDetailControlGroup
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
         this.onUserClickDelete(param1);
      }
      
      private function _UserVoiceLibComponent_VGroup4_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_Line1_c(),this._UserVoiceLibComponent_Spacer3_c(),this._UserVoiceLibComponent_Label3_i(),this._UserVoiceLibComponent_TextArea1_i()];
         _loc1_.id = "lineGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lineGroup = _loc1_;
         BindingManager.executeBindings(this,"lineGroup",this.lineGroup);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._UserVoiceLibComponent_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 14;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_UserVoiceLibComponent_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserVoiceLibComponent_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_UserVoiceLibComponent_Label3",this._UserVoiceLibComponent_Label3);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_TextArea1_i() : TextArea
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
      
      private function _UserVoiceLibComponent_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_VGroup5_c()];
         _loc1_.id = "_UserVoiceLibComponent_Group6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UserVoiceLibComponent_Group6 = _loc1_;
         BindingManager.executeBindings(this,"_UserVoiceLibComponent_Group6",this._UserVoiceLibComponent_Group6);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_VGroup5_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.height = 400;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_VGroup6_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_VGroup6_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 24;
         _loc1_.paddingRight = 24;
         _loc1_.paddingTop = 24;
         _loc1_.paddingBottom = 24;
         _loc1_.mxmlContent = [this._UserVoiceLibComponent_ProductExplorer1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_ProductExplorer1_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._UserVoiceLibComponent_ClassFactory1_c();
         _loc1_.productListSkin = VoiceExplorerProductListSkin;
         _loc1_.searchDelay = 500;
         _loc1_.setStyle("skinClass",VoiceProductExplorerSkin);
         _loc1_.addEventListener("productSearchSubmitted",this.__userSoundExplorer_productSearchSubmitted);
         _loc1_.addEventListener("productSearched",this.__userSoundExplorer_productSearched);
         _loc1_.addEventListener("productCategoryChanged",this.__userSoundExplorer_productCategoryChanged);
         _loc1_.id = "userSoundExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.userSoundExplorer = _loc1_;
         BindingManager.executeBindings(this,"userSoundExplorer",this.userSoundExplorer);
         return _loc1_;
      }
      
      private function _UserVoiceLibComponent_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = VoiceThumbRenderer;
         return _loc1_;
      }
      
      public function __userSoundExplorer_productSearchSubmitted(param1:ProductExplorerEvent) : void
      {
         this.onSearchSubmitted(param1);
      }
      
      public function __userSoundExplorer_productSearched(param1:ProductExplorerEvent) : void
      {
         this.onSearchDone(param1);
      }
      
      public function __userSoundExplorer_productCategoryChanged(param1:ProductExplorerEvent) : void
      {
         this.onProductCategoryChange(param1);
      }
      
      public function ___UserVoiceLibComponent_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _UserVoiceLibComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Select from Your Library");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Cancel");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"cancelButton.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Select a File");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"selectFileButton.label");
         result[3] = new Binding(this,function():Boolean
         {
            return userSoundExplorer.selectedProduct != null;
         },null,"selectFileButton.enabled");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = _addVoiceButtonLabel;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"addVoiceButton.label");
         result[5] = new Binding(this,function():Boolean
         {
            return _lineChanged;
         },null,"addVoiceButton.enabled");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Select a file from your Vyond Library");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_UserVoiceLibComponent_Label1.text");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","SELECT A FILE");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_UserVoiceLibComponent_Button4.label");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Line (optional)");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_UserVoiceLibComponent_Label3.text");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Type in a line");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"lineTextArea.prompt");
         result[10] = new Binding(this,function():ProductGroupCollection
         {
            return _userAssetManager.voiceTabSoundSource;
         },null,"userSoundExplorer.productProvider");
         result[11] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","No results found");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"userSoundExplorer.emptyPrompt");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _UserVoiceLibComponent_Button4() : Button
      {
         return this._1482912637_UserVoiceLibComponent_Button4;
      }
      
      public function set _UserVoiceLibComponent_Button4(param1:Button) : void
      {
         var _loc2_:Object = this._1482912637_UserVoiceLibComponent_Button4;
         if(_loc2_ !== param1)
         {
            this._1482912637_UserVoiceLibComponent_Button4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_UserVoiceLibComponent_Button4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _UserVoiceLibComponent_Group2() : Group
      {
         return this._1847271374_UserVoiceLibComponent_Group2;
      }
      
      public function set _UserVoiceLibComponent_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1847271374_UserVoiceLibComponent_Group2;
         if(_loc2_ !== param1)
         {
            this._1847271374_UserVoiceLibComponent_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_UserVoiceLibComponent_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _UserVoiceLibComponent_Group6() : Group
      {
         return this._1847271370_UserVoiceLibComponent_Group6;
      }
      
      public function set _UserVoiceLibComponent_Group6(param1:Group) : void
      {
         var _loc2_:Object = this._1847271370_UserVoiceLibComponent_Group6;
         if(_loc2_ !== param1)
         {
            this._1847271370_UserVoiceLibComponent_Group6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_UserVoiceLibComponent_Group6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _UserVoiceLibComponent_Spacer1() : Spacer
      {
         return this._558539462_UserVoiceLibComponent_Spacer1;
      }
      
      public function set _UserVoiceLibComponent_Spacer1(param1:Spacer) : void
      {
         var _loc2_:Object = this._558539462_UserVoiceLibComponent_Spacer1;
         if(_loc2_ !== param1)
         {
            this._558539462_UserVoiceLibComponent_Spacer1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_UserVoiceLibComponent_Spacer1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _UserVoiceLibComponent_Spacer2() : Spacer
      {
         return this._558539463_UserVoiceLibComponent_Spacer2;
      }
      
      public function set _UserVoiceLibComponent_Spacer2(param1:Spacer) : void
      {
         var _loc2_:Object = this._558539463_UserVoiceLibComponent_Spacer2;
         if(_loc2_ !== param1)
         {
            this._558539463_UserVoiceLibComponent_Spacer2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_UserVoiceLibComponent_Spacer2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _UserVoiceLibComponent_VGroup3() : VGroup
      {
         return this._2063327979_UserVoiceLibComponent_VGroup3;
      }
      
      public function set _UserVoiceLibComponent_VGroup3(param1:VGroup) : void
      {
         var _loc2_:Object = this._2063327979_UserVoiceLibComponent_VGroup3;
         if(_loc2_ !== param1)
         {
            this._2063327979_UserVoiceLibComponent_VGroup3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_UserVoiceLibComponent_VGroup3",_loc2_,param1));
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
      public function get selectFileButton() : Button
      {
         return this._1643119082selectFileButton;
      }
      
      public function set selectFileButton(param1:Button) : void
      {
         var _loc2_:Object = this._1643119082selectFileButton;
         if(_loc2_ !== param1)
         {
            this._1643119082selectFileButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectFileButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbSelected() : Label
      {
         return this._1348981393thumbSelected;
      }
      
      public function set thumbSelected(param1:Label) : void
      {
         var _loc2_:Object = this._1348981393thumbSelected;
         if(_loc2_ !== param1)
         {
            this._1348981393thumbSelected = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbSelected",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get userSoundExplorer() : ProductExplorer
      {
         return this._1689324643userSoundExplorer;
      }
      
      public function set userSoundExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._1689324643userSoundExplorer;
         if(_loc2_ !== param1)
         {
            this._1689324643userSoundExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"userSoundExplorer",_loc2_,param1));
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
      private function get _userAssetManager() : UserAssetManager
      {
         return this._1895618663_userAssetManager;
      }
      
      private function set _userAssetManager(param1:UserAssetManager) : void
      {
         var _loc2_:Object = this._1895618663_userAssetManager;
         if(_loc2_ !== param1)
         {
            this._1895618663_userAssetManager = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userAssetManager",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _userSoundReady() : Boolean
      {
         return this._1883088414_userSoundReady;
      }
      
      private function set _userSoundReady(param1:Boolean) : void
      {
         var _loc2_:Object = this._1883088414_userSoundReady;
         if(_loc2_ !== param1)
         {
            this._1883088414_userSoundReady = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_userSoundReady",_loc2_,param1));
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
