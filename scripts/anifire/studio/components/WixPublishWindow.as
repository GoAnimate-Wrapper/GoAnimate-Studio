package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.studio.core.Console;
   import anifire.studio.validators.AssetTitleValidator;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import mx.validators.Validator;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.FormItem;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class WixPublishWindow extends DefaultPopUpContainer implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _WixPublishWindow_Label2:Label;
      
      private var _1663941215_WixPublishWindow_SetProperty1:SetProperty;
      
      private var _2122106277_btnClose:Button;
      
      private var _2106366127_btnPostToProfile:Button;
      
      private var _1730556742_btnSave:Button;
      
      private var _1114913131_btnSaveNShare:Button;
      
      private var _1361128838chrome:Group;
      
      private var _312699062closeButton:Button;
      
      private var _335076258movieTitleInput:TextInput;
      
      private var _1928848325movieTitleItem:FormItem;
      
      private var _1850661981normalOptionGroup:VGroup;
      
      private var _106433028panel:PublishPanel;
      
      private var _135448711schoolTip:VGroup;
      
      private var _909318622statusLabel:Label;
      
      private var _781644463thumbnailChooser:SceneThumbnailChooser;
      
      private var _259861466titleValidator:AssetTitleValidator;
      
      private var _528206064validatorList:Array;
      
      private var _676548608watermarkPanel:WatermarkPanel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private const SAVE_SHARE:String = "Save and Share";
      
      private const SAVE_CLOSE:String = "Save and Close";
      
      private const SAVE_SIGNUP:String = "pubwin_save_signup";
      
      private const TIP_SAVE_SHARE_CLOSE:String = "pubwin_savensharetips";
      
      private const TIP_SAVE_CLOSE:String = "pubwin_savenclosetips";
      
      private const TIP_SAVE:String = "pubwin_saveonlytips";
      
      private var _41509777_published:Boolean = false;
      
      private var _1154689974_pShared:Boolean = false;
      
      private var _854738457showWatermark:Boolean;
      
      private var _movieName:String;
      
      private var _thumbnails:Vector.<BitmapData>;
      
      private var _thumbnailIndex:int;
      
      private var _temp_is_redirect:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function WixPublishWindow()
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
         bindings = this._WixPublishWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_WixPublishWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WixPublishWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._WixPublishWindow_Array6_c);
         this.currentState = "normal";
         this._WixPublishWindow_Array5_i();
         var _WixPublishWindow_Button5_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WixPublishWindow_Button5_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_WixPublishWindow_Button5_factory,
               "destination":"chrome",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["panel"]
            })]
         }),new State({
            "name":"watermark",
            "overrides":[this._WixPublishWindow_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"panel",
               "name":"title",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"panel",
               "name":"showBackButton",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"normalOptionGroup",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"watermarkPanel",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"loading",
            "stateGroups":["processing"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"panel",
               "name":"enabled",
               "value":false
            }),new SetStyle().initializeFromObject({
               "target":"statusLabel",
               "name":"color",
               "value":0
            })]
         }),new State({
            "name":"error",
            "stateGroups":["processing"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"panel",
               "name":"enabled",
               "value":false
            })]
         }),new State({
            "name":"complete",
            "stateGroups":["processing"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"panel",
               "name":"enabled",
               "value":false
            }),new SetStyle().initializeFromObject({
               "target":"statusLabel",
               "name":"color",
               "value":32768
            })]
         })];
         BindingManager.executeBindings(this,"_WixPublishWindow_SetProperty1",this._WixPublishWindow_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         WixPublishWindow._watcherSetupUtil = param1;
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
      
      public function initPublishWindow(param1:Boolean, param2:Boolean, param3:Vector.<BitmapData>, param4:String = "", param5:String = "", param6:String = "", param7:int = 0) : void
      {
         this._published = param1;
         this._pShared = param2;
         this._movieName = param4;
         this._thumbnails = param3;
         this._thumbnailIndex = param7;
      }
      
      private function validateMovieDetail() : Boolean
      {
         var _loc1_:Array = Validator.validateAll(this.validatorList);
         if(_loc1_.length == 0)
         {
            return true;
         }
         return false;
      }
      
      private function doSaveMovie(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false) : void
      {
         if(this.validateMovieDetail() == false)
         {
            return;
         }
         this._temp_is_redirect = param1;
         if(!param3)
         {
            this.setTempPrivateShared();
            this.setTempPublished();
         }
         this.orderConsoleToSaveMovie();
         if(!param1 && (UtilSite.siteId == UtilSite.ED || UtilSite.siteId == UtilSite.SCHOOLOGY))
         {
            this._btnSave.includeInLayout = false;
            this._btnSave.visible = false;
            this._btnClose.includeInLayout = true;
            this._btnClose.visible = true;
            this.enabled = true;
            this._btnSaveNShare.label = UtilDict.toDisplay("go","Turn-in as Assignment") + " >";
            this._btnSaveNShare.enabled = true;
         }
      }
      
      private function orderConsoleToSaveMovie() : void
      {
         currentState = "loading";
         this.statusLabel.text = UtilDict.toDisplay("go","Preparing...");
         var _loc1_:Console = Console.getConsole();
         _loc1_.metaData.title = this.movieTitleInput.text;
         _loc1_.addEventListener(CoreEvent.SERIALIZE_COMPLETE,this.onSerializeComplete);
         _loc1_.addEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.onSaveMovieComplete);
         _loc1_.addEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.onSaveMovieFail);
         _loc1_.publishMovie(this.thumbnailChooser.selectedIndex,this._temp_is_redirect);
      }
      
      private function removeConsoleListeners() : void
      {
         var _loc1_:Console = Console.getConsole();
         _loc1_.removeEventListener(CoreEvent.SERIALIZE_COMPLETE,this.onSerializeComplete);
         _loc1_.removeEventListener(CoreEvent.SAVE_MOVIE_COMPLETE,this.onSaveMovieComplete);
         _loc1_.removeEventListener(CoreEvent.SAVE_MOVIE_ERROR_OCCUR,this.onSaveMovieFail);
      }
      
      private function initSavingOption(param1:int = -1) : void
      {
         var _loc2_:Console = Console.getConsole();
         this.setTempPublished();
      }
      
      private function setTempPublished() : void
      {
         Console.getConsole().tempPrivateShared = true;
      }
      
      private function setTempPrivateShared() : void
      {
         Console.getConsole().tempPublished = true;
         Console.getConsole().tempPrivateShared = false;
      }
      
      private function enableButton(param1:Button, param2:Boolean = true, param3:Boolean = true) : void
      {
         if(param1 != null)
         {
            param1.enabled = param2;
            param1.buttonMode = param2;
            if(param1 == this._btnSaveNShare)
            {
               this._btnSaveNShare.label = UtilDict.toDisplay("go",this.SAVE_CLOSE) + " >";
               this._btnSaveNShare.toolTip = UtilDict.toDisplay("go",this.TIP_SAVE_CLOSE);
            }
         }
      }
      
      private function onSaveMovieFromMusicPanel() : void
      {
         this.doSaveMovie(true,true);
      }
      
      private function onSaveBtnClick() : void
      {
         currentState = "normal";
         if(UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            Console.getConsole().tempPublished = false;
            Console.getConsole().tempPrivateShared = false;
            this.doSaveMovie(false,false,true);
         }
         else
         {
            this.doSaveMovie();
         }
      }
      
      private function onCloseBtnClick() : void
      {
         this.doSaveMovie(true);
      }
      
      private function onPostToProfile() : void
      {
         Console.getConsole().edSaveAssignment("post");
         this.doSaveMovie(true);
      }
      
      private function onSaveAndShareBtnClick() : void
      {
         if(UtilSite.siteId == UtilSite.ED || UtilSite.siteId == UtilSite.SCHOOLOGY)
         {
            Console.getConsole().edSaveAssignment("submit");
         }
         this.doSaveMovie(true);
      }
      
      private function onSerializeComplete(param1:Event) : void
      {
         this.statusLabel.text = UtilDict.toDisplay("go","Connecting to server...");
      }
      
      private function onSaveMovieComplete(param1:Event) : void
      {
         this.removeConsoleListeners();
         currentState = "complete";
         this.statusLabel.text = UtilDict.toDisplay("go","Project saved.");
         if(UtilSite.siteId != UtilSite.ED && UtilSite.siteId != UtilSite.SCHOOLOGY)
         {
            setTimeout(confirm,2000);
         }
         else
         {
            setTimeout(this.reset,2000);
         }
      }
      
      private function onSaveMovieFail(param1:Event) : void
      {
         this.removeConsoleListeners();
         currentState = "error";
         this.statusLabel.text = UtilDict.toDisplay("go","Fail to save!");
         setTimeout(cancel,2000);
      }
      
      private function reset() : void
      {
         currentState = "normal";
      }
      
      private function onSaveAsPublic() : void
      {
         Console.getConsole().tempPublished = true;
         Console.getConsole().tempPrivateShared = false;
         this.doSaveMovie(true,true);
      }
      
      private function onSaveAsPrivate() : void
      {
         Console.getConsole().tempPublished = false;
         Console.getConsole().tempPrivateShared = true;
         this.doSaveMovie(true,true);
      }
      
      override protected function init() : void
      {
         super.init();
         this.movieTitleInput.text = this._movieName;
         if(this._thumbnails)
         {
            this.thumbnailChooser.init(this._thumbnails,this._thumbnailIndex);
         }
         this.enableButton(this._btnSaveNShare,true,this._published || this._pShared);
         this.initSavingOption();
         this.onSharingOptionChange();
      }
      
      private function onSharingOptionChange() : void
      {
         this.setTempPublished();
         this.setTempPrivateShared();
      }
      
      private function _WixPublishWindow_Array5_i() : Array
      {
         var _loc1_:Array = [this._WixPublishWindow_AssetTitleValidator1_i()];
         this.validatorList = _loc1_;
         BindingManager.executeBindings(this,"validatorList",this.validatorList);
         return _loc1_;
      }
      
      private function _WixPublishWindow_AssetTitleValidator1_i() : AssetTitleValidator
      {
         var _loc1_:AssetTitleValidator = new AssetTitleValidator();
         _loc1_.property = "text";
         _loc1_.initialized(this,"titleValidator");
         this.titleValidator = _loc1_;
         BindingManager.executeBindings(this,"titleValidator",this.titleValidator);
         return _loc1_;
      }
      
      private function _WixPublishWindow_Array6_c() : Array
      {
         var _loc1_:Array = [this._WixPublishWindow_Group1_i()];
         return _loc1_;
      }
      
      private function _WixPublishWindow_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._WixPublishWindow_PublishPanel1_i()];
         _loc1_.id = "chrome";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chrome = _loc1_;
         BindingManager.executeBindings(this,"chrome",this.chrome);
         return _loc1_;
      }
      
      private function _WixPublishWindow_PublishPanel1_i() : PublishPanel
      {
         var _loc1_:PublishPanel = new PublishPanel();
         _loc1_.width = 559;
         _loc1_.controlBarContent = [this._WixPublishWindow_Button1_i(),this._WixPublishWindow_Button2_i(),this._WixPublishWindow_Button3_i(),this._WixPublishWindow_Button4_i()];
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._WixPublishWindow_Array9_c);
         _loc1_.id = "panel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.panel = _loc1_;
         BindingManager.executeBindings(this,"panel",this.panel);
         return _loc1_;
      }
      
      private function _WixPublishWindow_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___btnSave_click);
         _loc1_.id = "_btnSave";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnSave = _loc1_;
         BindingManager.executeBindings(this,"_btnSave",this._btnSave);
         return _loc1_;
      }
      
      public function ___btnSave_click(param1:MouseEvent) : void
      {
         this.onSaveBtnClick();
      }
      
      private function _WixPublishWindow_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.includeInLayout = false;
         _loc1_.visible = false;
         _loc1_.addEventListener("click",this.___btnClose_click);
         _loc1_.id = "_btnClose";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnClose = _loc1_;
         BindingManager.executeBindings(this,"_btnClose",this._btnClose);
         return _loc1_;
      }
      
      public function ___btnClose_click(param1:MouseEvent) : void
      {
         this.onCloseBtnClick();
      }
      
      private function _WixPublishWindow_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.addEventListener("click",this.___btnPostToProfile_click);
         _loc1_.id = "_btnPostToProfile";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnPostToProfile = _loc1_;
         BindingManager.executeBindings(this,"_btnPostToProfile",this._btnPostToProfile);
         return _loc1_;
      }
      
      public function ___btnPostToProfile_click(param1:MouseEvent) : void
      {
         this.onPostToProfile();
      }
      
      private function _WixPublishWindow_Button4_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.styleName = "primary";
         _loc1_.addEventListener("click",this.___btnSaveNShare_click);
         _loc1_.id = "_btnSaveNShare";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._btnSaveNShare = _loc1_;
         BindingManager.executeBindings(this,"_btnSaveNShare",this._btnSaveNShare);
         return _loc1_;
      }
      
      public function ___btnSaveNShare_click(param1:MouseEvent) : void
      {
         this.onSaveAndShareBtnClick();
      }
      
      private function _WixPublishWindow_Array9_c() : Array
      {
         var _loc1_:Array = [this._WixPublishWindow_Group2_c()];
         return _loc1_;
      }
      
      private function _WixPublishWindow_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._WixPublishWindow_PopUpContentBackground1_c(),this._WixPublishWindow_VGroup1_i(),this._WixPublishWindow_WatermarkPanel1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WixPublishWindow_PopUpContentBackground1_c() : PopUpContentBackground
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
      
      private function _WixPublishWindow_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 20;
         _loc1_.gap = 20;
         _loc1_.mxmlContent = [this._WixPublishWindow_VGroup2_c(),this._WixPublishWindow_Label1_i(),this._WixPublishWindow_VGroup3_i()];
         _loc1_.id = "normalOptionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.normalOptionGroup = _loc1_;
         BindingManager.executeBindings(this,"normalOptionGroup",this.normalOptionGroup);
         return _loc1_;
      }
      
      private function _WixPublishWindow_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 28;
         _loc1_.paddingRight = 28;
         _loc1_.gap = 25;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._WixPublishWindow_Form1_c(),this._WixPublishWindow_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WixPublishWindow_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "publish";
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._WixPublishWindow_Array13_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WixPublishWindow_Array13_c() : Array
      {
         var _loc1_:Array = [this._WixPublishWindow_FormItem1_i()];
         return _loc1_;
      }
      
      private function _WixPublishWindow_FormItem1_i() : FormItem
      {
         var _loc1_:FormItem = new FormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._WixPublishWindow_Array14_c);
         _loc1_.id = "movieTitleItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieTitleItem = _loc1_;
         BindingManager.executeBindings(this,"movieTitleItem",this.movieTitleItem);
         return _loc1_;
      }
      
      private function _WixPublishWindow_Array14_c() : Array
      {
         var _loc1_:Array = [this._WixPublishWindow_TextInput1_i()];
         return _loc1_;
      }
      
      private function _WixPublishWindow_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.maxChars = 50;
         _loc1_.id = "movieTitleInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.movieTitleInput = _loc1_;
         BindingManager.executeBindings(this,"movieTitleInput",this.movieTitleInput);
         return _loc1_;
      }
      
      private function _WixPublishWindow_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 14;
         _loc1_.paddingTop = 5;
         _loc1_.mxmlContent = [this._WixPublishWindow_SceneThumbnailChooser1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WixPublishWindow_SceneThumbnailChooser1_i() : SceneThumbnailChooser
      {
         var _loc1_:SceneThumbnailChooser = new SceneThumbnailChooser();
         _loc1_.id = "thumbnailChooser";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumbnailChooser = _loc1_;
         BindingManager.executeBindings(this,"thumbnailChooser",this.thumbnailChooser);
         return _loc1_;
      }
      
      private function _WixPublishWindow_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16711680);
         _loc1_.id = "statusLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.statusLabel = _loc1_;
         BindingManager.executeBindings(this,"statusLabel",this.statusLabel);
         return _loc1_;
      }
      
      private function _WixPublishWindow_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 20;
         _loc1_.paddingRight = 20;
         _loc1_.paddingBottom = 15;
         _loc1_.gap = 10;
         _loc1_.horizontalAlign = "center";
         _loc1_.includeInLayout = false;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._WixPublishWindow_Label2_i(),this._WixPublishWindow_Line1_c()];
         _loc1_.id = "schoolTip";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.schoolTip = _loc1_;
         BindingManager.executeBindings(this,"schoolTip",this.schoolTip);
         return _loc1_;
      }
      
      private function _WixPublishWindow_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontSize",16);
         _loc1_.setStyle("color",11184810);
         _loc1_.id = "_WixPublishWindow_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WixPublishWindow_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_WixPublishWindow_Label2",this._WixPublishWindow_Label2);
         return _loc1_;
      }
      
      private function _WixPublishWindow_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._WixPublishWindow_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WixPublishWindow_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _WixPublishWindow_WatermarkPanel1_i() : WatermarkPanel
      {
         var _loc1_:WatermarkPanel = new WatermarkPanel();
         _loc1_.visible = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "watermarkPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.watermarkPanel = _loc1_;
         BindingManager.executeBindings(this,"watermarkPanel",this.watermarkPanel);
         return _loc1_;
      }
      
      private function _WixPublishWindow_Button5_i() : Button
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
         cancel();
      }
      
      private function _WixPublishWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"titleValidator.source","movieTitleInput");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Save Your Video");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"panel.title");
         result[2] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Switch watermark for this video");
         },null,"_WixPublishWindow_SetProperty1.value");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","pubwin_saveonly");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_btnSave.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","pubwin_saveonlytips");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_btnSave.toolTip");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Close Studio");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_btnClose.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Close the Studio");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_btnClose.toolTip");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Post to Profile >");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_btnPostToProfile.label");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","pubwin_movietitle");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"movieTitleItem.label");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","When you are finished with your video, you can post it to a group from the Video page");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_WixPublishWindow_Label2.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _WixPublishWindow_SetProperty1() : SetProperty
      {
         return this._1663941215_WixPublishWindow_SetProperty1;
      }
      
      public function set _WixPublishWindow_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1663941215_WixPublishWindow_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1663941215_WixPublishWindow_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_WixPublishWindow_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnClose() : Button
      {
         return this._2122106277_btnClose;
      }
      
      public function set _btnClose(param1:Button) : void
      {
         var _loc2_:Object = this._2122106277_btnClose;
         if(_loc2_ !== param1)
         {
            this._2122106277_btnClose = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnClose",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnPostToProfile() : Button
      {
         return this._2106366127_btnPostToProfile;
      }
      
      public function set _btnPostToProfile(param1:Button) : void
      {
         var _loc2_:Object = this._2106366127_btnPostToProfile;
         if(_loc2_ !== param1)
         {
            this._2106366127_btnPostToProfile = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPostToProfile",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSave() : Button
      {
         return this._1730556742_btnSave;
      }
      
      public function set _btnSave(param1:Button) : void
      {
         var _loc2_:Object = this._1730556742_btnSave;
         if(_loc2_ !== param1)
         {
            this._1730556742_btnSave = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSave",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSaveNShare() : Button
      {
         return this._1114913131_btnSaveNShare;
      }
      
      public function set _btnSaveNShare(param1:Button) : void
      {
         var _loc2_:Object = this._1114913131_btnSaveNShare;
         if(_loc2_ !== param1)
         {
            this._1114913131_btnSaveNShare = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSaveNShare",_loc2_,param1));
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
      public function get movieTitleInput() : TextInput
      {
         return this._335076258movieTitleInput;
      }
      
      public function set movieTitleInput(param1:TextInput) : void
      {
         var _loc2_:Object = this._335076258movieTitleInput;
         if(_loc2_ !== param1)
         {
            this._335076258movieTitleInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieTitleInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get movieTitleItem() : FormItem
      {
         return this._1928848325movieTitleItem;
      }
      
      public function set movieTitleItem(param1:FormItem) : void
      {
         var _loc2_:Object = this._1928848325movieTitleItem;
         if(_loc2_ !== param1)
         {
            this._1928848325movieTitleItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieTitleItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get normalOptionGroup() : VGroup
      {
         return this._1850661981normalOptionGroup;
      }
      
      public function set normalOptionGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1850661981normalOptionGroup;
         if(_loc2_ !== param1)
         {
            this._1850661981normalOptionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"normalOptionGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panel() : PublishPanel
      {
         return this._106433028panel;
      }
      
      public function set panel(param1:PublishPanel) : void
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
      public function get schoolTip() : VGroup
      {
         return this._135448711schoolTip;
      }
      
      public function set schoolTip(param1:VGroup) : void
      {
         var _loc2_:Object = this._135448711schoolTip;
         if(_loc2_ !== param1)
         {
            this._135448711schoolTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"schoolTip",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get statusLabel() : Label
      {
         return this._909318622statusLabel;
      }
      
      public function set statusLabel(param1:Label) : void
      {
         var _loc2_:Object = this._909318622statusLabel;
         if(_loc2_ !== param1)
         {
            this._909318622statusLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"statusLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnailChooser() : SceneThumbnailChooser
      {
         return this._781644463thumbnailChooser;
      }
      
      public function set thumbnailChooser(param1:SceneThumbnailChooser) : void
      {
         var _loc2_:Object = this._781644463thumbnailChooser;
         if(_loc2_ !== param1)
         {
            this._781644463thumbnailChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnailChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleValidator() : AssetTitleValidator
      {
         return this._259861466titleValidator;
      }
      
      public function set titleValidator(param1:AssetTitleValidator) : void
      {
         var _loc2_:Object = this._259861466titleValidator;
         if(_loc2_ !== param1)
         {
            this._259861466titleValidator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleValidator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get validatorList() : Array
      {
         return this._528206064validatorList;
      }
      
      public function set validatorList(param1:Array) : void
      {
         var _loc2_:Object = this._528206064validatorList;
         if(_loc2_ !== param1)
         {
            this._528206064validatorList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validatorList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get watermarkPanel() : WatermarkPanel
      {
         return this._676548608watermarkPanel;
      }
      
      public function set watermarkPanel(param1:WatermarkPanel) : void
      {
         var _loc2_:Object = this._676548608watermarkPanel;
         if(_loc2_ !== param1)
         {
            this._676548608watermarkPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _published() : Boolean
      {
         return this._41509777_published;
      }
      
      private function set _published(param1:Boolean) : void
      {
         var _loc2_:Object = this._41509777_published;
         if(_loc2_ !== param1)
         {
            this._41509777_published = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_published",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _pShared() : Boolean
      {
         return this._1154689974_pShared;
      }
      
      private function set _pShared(param1:Boolean) : void
      {
         var _loc2_:Object = this._1154689974_pShared;
         if(_loc2_ !== param1)
         {
            this._1154689974_pShared = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_pShared",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get showWatermark() : Boolean
      {
         return this._854738457showWatermark;
      }
      
      private function set showWatermark(param1:Boolean) : void
      {
         var _loc2_:Object = this._854738457showWatermark;
         if(_loc2_ !== param1)
         {
            this._854738457showWatermark = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showWatermark",_loc2_,param1));
            }
         }
      }
   }
}
