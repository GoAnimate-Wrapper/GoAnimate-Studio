package anifire.studio.components
{
	import anifire.constant.ServerConstants;
	import anifire.event.CoreEvent;
	import anifire.managers.AppConfigManager;
	import anifire.managers.ServerConnector;
	import anifire.studio.core.Console;
	import anifire.studio.core.PublishGroup;
	import anifire.studio.managers.AccessRightManager;
	import anifire.studio.models.MenuItemModel;
	import anifire.studio.validators.AssetTitleValidator;
	import anifire.studio.validators.BadWordsValidator;
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
	import mx.collections.ArrayCollection;
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
	import spark.components.RadioButton;
	import spark.components.RadioButtonGroup;
	import spark.components.TextArea;
	import spark.components.TextInput;
	import spark.components.VGroup;
	import spark.events.IndexChangeEvent;
	import spark.primitives.Line;
	
	use namespace mx_internal;
	
	public class PublishWindow extends DefaultPopUpContainer implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _PublishWindow_Label1:Label;
		
		public var _PublishWindow_Label2:Label;
		
		public var _PublishWindow_Label4:Label;
		
		public var _PublishWindow_Label6:Label;
		
		private var _202291975_PublishWindow_SetProperty1:SetProperty;
		
		private var _2122106277_btnClose:Button;
		
		private var _2106366127_btnPostToProfile:Button;
		
		private var _1730556742_btnSave:Button;
		
		private var _1114913131_btnSaveNShare:Button;
		
		private var _1952108612_groupAlert:Label;
		
		private var _1061294085_radioDraft:RadioButton;
		
		private var _192196535_radioPasswordProtected:RadioButton;
		
		private var _230640921_radioPrivate:RadioButton;
		
		private var _1113266043_radioPublic:RadioButton;
		
		private var _1839914382_sharingOption:RadioButtonGroup;
		
		private var _1710757388_vbGroup:FormItem;
		
		private var _1361128838chrome:Group;
		
		private var _312699062closeButton:Button;
		
		private var _887448246descriptionValidator:BadWordsValidator;
		
		private var _160029570movieDescriptionInput:TextArea;
		
		private var _2073053151movieDescriptionItem:FormItem;
		
		private var _1463430687movieTagsInput:TextInput;
		
		private var _229892636movieTagsItem:FormItem;
		
		private var _335076258movieTitleInput:TextInput;
		
		private var _1928848325movieTitleItem:FormItem;
		
		private var _1850661981normalOptionGroup:VGroup;
		
		private var _106433028panel:PublishPanel;
		
		private var _1052739438publishGroupList:spark.components.DropDownList;
		
		private var _169721479savePanel:FormItem;
		
		private var _135448711schoolTip:VGroup;
		
		private var _909318622statusLabel:Label;
		
		private var _671317191tagsValidator:BadWordsValidator;
		
		private var _781644463thumbnailChooser:SceneThumbnailChooser;
		
		private var _259861466titleValidator:AssetTitleValidator;
		
		private var _528206064validatorList:Array;
		
		private var _1563553081watermarkBox:VGroup;
		
		private var _883973962watermarkButton:Button;
		
		private var _202977346watermarkDisplay:WatermarkPreview;
		
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
		
		private var _879855404_passwordProtected:Boolean = false;
		
		private var _854738457showWatermark:Boolean;
		
		private var _movieName:String;
		
		private var _movieTags:String;
		
		private var _movieDescription:String;
		
		private var _thumbnails:Vector.<BitmapData>;
		
		private var _thumbnailIndex:int;
		
		private var _temp_is_redirect:Boolean;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function PublishWindow()
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
			bindings = this._PublishWindow_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_PublishWindowWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return PublishWindow[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._PublishWindow_Array6_c);
			this.currentState = "normal";
			this._PublishWindow_RadioButtonGroup1_i();
			this._PublishWindow_Array5_i();
			var _PublishWindow_Button6_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PublishWindow_Button6_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_PublishWindow_Button6_factory,
					"destination":"chrome",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["panel"]
				})]
			}),new State({
				"name":"watermark",
				"overrides":[this._PublishWindow_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
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
			BindingManager.executeBindings(this,"_PublishWindow_SetProperty1",this._PublishWindow_SetProperty1);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			PublishWindow._watcherSetupUtil = param1;
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
		
		public function initPublishWindow(param1:Boolean, param2:Boolean, param3:Boolean, param4:Vector.<BitmapData>, param5:String = "", param6:String = "", param7:String = "", param8:int = 0) : void
		{
			this._published = param1;
			this._pShared = param2;
			this._passwordProtected = param3;
			this._movieName = param5;
			this._movieTags = param6;
			this._movieDescription = param7;
			this._thumbnails = param4;
			this._thumbnailIndex = param8;
		}
		
		private function doModifyGroup() : void
		{
			var _loc1_:MenuItemModel = this.publishGroupList.selectedItem as MenuItemModel;
			if(_loc1_)
			{
				Console.getConsole().groupController.tempCurrentGroup = _loc1_.value;
			}
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
			_loc1_.metaData.setUgcTagsByString(this.movieTagsInput.text);
			_loc1_.metaData.description = this.movieDescriptionInput.text;
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
			var _loc3_:Boolean = false;
			var _loc4_:String = null;
			var _loc2_:Console = Console.getConsole();
			if(_loc2_.teamDraftOnly && !_loc2_.publishedOnOpen)
			{
				this._radioPrivate.visible = false;
				this._radioPublic.visible = false;
				this._radioPasswordProtected.visible = false;
				this._radioPasswordProtected.includeInLayout = false;
			}
			else
			{
				this._radioPrivate.visible = true;
				this._radioPublic.visible = true;
				this._radioPasswordProtected.visible = _loc2_.passwordProtectedSharingEnabled;
				this._radioPasswordProtected.includeInLayout = _loc2_.passwordProtectedSharingEnabled;
			}
			if(UtilSite.siteId == UtilSite.GOANIMATE)
			{
				if(this._published || this._pShared)
				{
					this._sharingOption.selection = this._radioPrivate;
				}
				else if(this._passwordProtected)
				{
					this._sharingOption.selection = this._radioPasswordProtected;
				}
				else
				{
					this._sharingOption.selection = this._radioDraft;
				}
				this._radioPublic.visible = false;
				this._radioPublic.includeInLayout = false;
			}
			else if(UtilSite.siteId == UtilSite.SCHOOL)
			{
				this._vbGroup.includeInLayout = this._vbGroup.visible = false;
				this.movieTagsItem.includeInLayout = this.movieTagsItem.visible = false;
				this.savePanel.includeInLayout = this.savePanel.visible = false;
				this.schoolTip.visible = this.schoolTip.includeInLayout = true;
				this.movieTagsInput.text = "school";
				_loc3_ = Console.getConsole().groupController.isStudent;
				this._radioPublic.visible = !_loc3_;
				this._radioPublic.includeInLayout = !_loc3_;
				this._radioPublic.label = UtilDict.toDisplay("go","Lesson Gallery");
				if(!_loc3_)
				{
					this._radioPrivate.label = UtilDict.toDisplay("go","Students only");
				}
				else
				{
					this._radioPrivate.label = UtilDict.toDisplay("go","School only");
				}
				this._btnSaveNShare.label = UtilDict.toDisplay("go","Save and Go to Video Page") + " >";
				if(this._published && !_loc3_)
				{
					this._sharingOption.selection = this._radioPublic;
				}
				else
				{
					this._sharingOption.selection = !!this._pShared?this._radioPrivate:this._radioDraft;
				}
			}
			else if(UtilSite.siteId == UtilSite.SKOLETUBE)
			{
				this._radioPrivate.includeInLayout = this._radioPrivate.visible = false;
				this._sharingOption.selection = !!this._published?this._radioPublic:this._radioDraft;
				this._radioDraft.label = UtilDict.toDisplay("go","Private");
				this._radioPublic.label = UtilDict.toDisplay("go","pubwin_public");
				this._vbGroup.includeInLayout = this._vbGroup.visible = true;
				this._btnSave.label = UtilDict.toDisplay("go","Save Project");
				this.savePanel.label = UtilDict.toDisplay("go","Publish to SkoleTube as:");
				this.savePanel.visible = true;
				this._btnSaveNShare.label = UtilDict.toDisplay("go","Publish to SkoleTube") + " >";
				this.createPublishGroupModel();
			}
			else if(UtilSite.siteId == UtilSite.ED || UtilSite.siteId == UtilSite.SCHOOLOGY)
			{
				_loc4_ = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_ED_USER_TYPE);
				this._radioPrivate.includeInLayout = this._radioPrivate.visible = false;
				this._sharingOption.selection = !!this._published?this._radioPublic:this._radioDraft;
				this._radioDraft.label = UtilDict.toDisplay("go","Private");
				this._radioPublic.label = UtilDict.toDisplay("go","pubwin_public");
				this._btnSave.label = UtilDict.toDisplay("go","Save");
				this._btnSave.styleName = "primary";
				this._btnSaveNShare.label = UtilDict.toDisplay("go","Turn-in as Assignment") + " >";
				this._btnSaveNShare.styleName = "important";
				this.movieTagsItem.includeInLayout = false;
				this._vbGroup.includeInLayout = false;
				this.savePanel.includeInLayout = false;
				this.movieTagsItem.visible = false;
				this._vbGroup.visible = false;
				this.savePanel.visible = false;
				this._btnPostToProfile.includeInLayout = true;
				this._btnPostToProfile.visible = true;
				if(_loc4_ == "TEACHER")
				{
					this._btnSaveNShare.visible = false;
					this._btnSaveNShare.includeInLayout = false;
				}
				if(UtilSite.siteId == UtilSite.SCHOOLOGY)
				{
					this._btnSaveNShare.visible = this._btnSaveNShare.includeInLayout = false;
					this._btnPostToProfile.label = UtilDict.toDisplay("go","Post to Updates >");
				}
			}
			this.setTempPublished();
		}
		
		private function setTempPublished() : void
		{
			var _loc1_:Console = Console.getConsole();
			if(UtilSite.siteId == UtilSite.GOANIMATE)
			{
				if(this._radioDraft.selected)
				{
					_loc1_.tempPublished = false;
					_loc1_.tempPrivateShared = false;
					_loc1_.tempPasswordProtected = false;
					this.enableButton(this._btnSaveNShare,true,false);
				}
				else
				{
					this.setTempPrivateShared();
					this.enableButton(this._btnSaveNShare,true,true);
				}
			}
			else if(UtilSite.siteId == UtilSite.SCHOOL)
			{
				if(this._radioDraft.selected)
				{
					_loc1_.tempPublished = false;
					_loc1_.tempPrivateShared = false;
					_loc1_.tempPasswordProtected = false;
					this.enableButton(this._btnSaveNShare,true,false);
				}
				else
				{
					this.setTempPrivateShared();
					this.enableButton(this._btnSaveNShare,true,true);
				}
				if(!_loc1_.groupController.isTeacher)
				{
				}
			}
			else if(UtilSite.siteId == UtilSite.SKOLETUBE)
			{
				if(this._radioPublic.selected)
				{
					_loc1_.tempPublished = true;
					_loc1_.tempPrivateShared = false;
					_loc1_.tempPasswordProtected = false;
				}
			}
			else if(UtilSite.siteId == UtilSite.ED || UtilSite.siteId == UtilSite.SCHOOLOGY)
			{
				_loc1_.tempPrivateShared = true;
				_loc1_.tempPasswordProtected = false;
			}
		}
		
		private function setTempPrivateShared() : void
		{
			var _loc1_:Console = Console.getConsole();
			if(UtilSite.siteId == UtilSite.SCHOOL)
			{
				if(this._radioPublic.selected)
				{
					_loc1_.tempPublished = true;
					_loc1_.tempPrivateShared = true;
					_loc1_.tempPasswordProtected = false;
				}
				else if(this._radioPrivate.selected)
				{
					_loc1_.tempPublished = false;
					_loc1_.tempPrivateShared = true;
					_loc1_.tempPasswordProtected = false;
				}
				else
				{
					_loc1_.tempPublished = false;
					_loc1_.tempPrivateShared = false;
					_loc1_.tempPasswordProtected = false;
				}
			}
			else if(UtilSite.siteId == UtilSite.SKOLETUBE)
			{
				if(this._radioPublic.selected)
				{
					_loc1_.tempPublished = true;
					_loc1_.tempPrivateShared = false;
					_loc1_.tempPasswordProtected = false;
				}
				else
				{
					_loc1_.tempPublished = false;
					_loc1_.tempPrivateShared = true;
					_loc1_.tempPasswordProtected = false;
				}
			}
			else if(this._radioPublic.selected)
			{
				_loc1_.tempPublished = true;
				_loc1_.tempPrivateShared = false;
				_loc1_.tempPasswordProtected = false;
			}
			else if(this._radioPrivate.selected)
			{
				_loc1_.tempPublished = false;
				_loc1_.tempPrivateShared = true;
				_loc1_.tempPasswordProtected = false;
			}
			else if(this._radioPasswordProtected.selected)
			{
				_loc1_.tempPublished = false;
				_loc1_.tempPrivateShared = false;
				_loc1_.tempPasswordProtected = true;
			}
			else
			{
				_loc1_.tempPublished = false;
				_loc1_.tempPrivateShared = false;
				_loc1_.tempPasswordProtected = false;
			}
		}
		
		private function enableButton(param1:Button, param2:Boolean = true, param3:Boolean = true) : void
		{
			if(UtilSite.isGoAnimate)
			{
				param3 = false;
			}
			if(param1 != null)
			{
				param1.enabled = param2;
				param1.buttonMode = param2;
				if(param1 == this._btnSaveNShare)
				{
					if(UtilSite.siteId == UtilSite.SKOLETUBE)
					{
						this._btnSaveNShare.label = UtilDict.toDisplay("go",this.SAVE_SHARE) + " >";
						this._btnSaveNShare.toolTip = "Tip: udgiv først på Skoletube når din animationsfilm er helt færdig!";
					}
					else if(param3 && UtilSite.siteId != UtilSite.SCHOOL)
					{
						this._btnSaveNShare.label = UtilDict.toDisplay("go",this.SAVE_SHARE) + " >";
						this._btnSaveNShare.toolTip = UtilDict.toDisplay("go",this.TIP_SAVE_SHARE_CLOSE);
					}
					else if(UtilSite.siteId != UtilSite.SCHOOL)
					{
						this._btnSaveNShare.label = UtilDict.toDisplay("go",this.SAVE_CLOSE) + " >";
						this._btnSaveNShare.toolTip = UtilDict.toDisplay("go",this.TIP_SAVE_CLOSE);
					}
				}
			}
		}
		
		private function createPublishGroupModel() : void
		{
			var _loc1_:int = 0;
			var _loc5_:MenuItemModel = null;
			var _loc6_:Boolean = false;
			var _loc7_:PublishGroup = null;
			var _loc8_:MenuItemModel = null;
			var _loc2_:Array = Console.getConsole().groupController.getGroups();
			var _loc3_:PublishGroup = Console.getConsole().groupController.currentGroup;
			if(_loc3_ && _loc3_.id != "0")
			{
				_loc6_ = false;
				_loc1_ = 0;
				while(_loc1_ < _loc2_.length)
				{
					if(PublishGroup(_loc2_[_loc1_]).id == _loc3_.id)
					{
						_loc6_ = true;
					}
					_loc1_++;
				}
				if(!_loc6_)
				{
					_loc2_.push(_loc3_);
				}
			}
			_loc2_.sortOn("name");
			var _loc4_:ArrayCollection = new ArrayCollection();
			if(_loc2_.length > 0)
			{
				_loc1_ = 0;
				while(_loc1_ < _loc2_.length)
				{
					_loc7_ = _loc2_[_loc1_] as PublishGroup;
					_loc8_ = new MenuItemModel(_loc7_.name,_loc7_);
					_loc4_.addItem(_loc8_);
					if(_loc3_ && _loc3_.id == _loc7_.id)
					{
						Console.getConsole().groupController.tempCurrentGroup = _loc3_;
						_loc5_ = _loc8_;
					}
					_loc1_++;
				}
				this.publishGroupList.prompt = UtilDict.toDisplay("go","Select group...");
				this.publishGroupList.enabled = true;
			}
			else
			{
				Console.getConsole().groupController.tempCurrentGroup = new PublishGroup();
				this._vbGroup.required = false;
				if(UtilSite.siteId != UtilSite.SKOLETUBE)
				{
					this._groupAlert.includeInLayout = this._groupAlert.visible = true;
					this.allowDraftOnly();
				}
				this.publishGroupList.prompt = UtilDict.toDisplay("go","No existing group");
				this.publishGroupList.enabled = false;
			}
			this.publishGroupList.dataProvider = _loc4_;
			this.publishGroupList.selectedItem = _loc5_;
		}
		
		private function allowDraftOnly() : void
		{
			this._published = false;
			this._pShared = false;
			this._passwordProtected = false;
			this._radioPrivate.enabled = false;
			this._radioPublic.enabled = false;
			this._radioPasswordProtected.enabled = false;
			this._sharingOption.selection = this._radioDraft;
			this.setTempPublished();
		}
		
		private function onSaveMovieFromMusicPanel() : void
		{
			this.doSaveMovie(true,true);
		}
		
		private function onSaveBtnClick() : void
		{
			var _loc1_:Console = null;
			_loc1_ = Console.getConsole();
			currentState = "normal";
			this.updateWatermark();
			if(UtilSite.siteId == UtilSite.SKOLETUBE)
			{
				_loc1_.tempPublished = false;
				_loc1_.tempPrivateShared = false;
				_loc1_.tempPasswordProtected = false;
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
			this.updateWatermark();
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
			this.movieTagsInput.text = this._movieTags;
			this.movieDescriptionInput.text = this._movieDescription;
			if(this._thumbnails)
			{
				this.thumbnailChooser.init(this._thumbnails,this._thumbnailIndex);
			}
			this.showWatermark = UtilSite.siteId == UtilSite.GOANIMATE && AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_WATERMARK);
			if(this.showWatermark)
			{
				this.updateWatermark();
			}
			this.enableButton(this._btnSaveNShare,true,this._published || this._pShared);
			this.initSavingOption();
			this.onSharingOptionChange();
			if(UtilSite.siteId == UtilSite.ED && UtilSite.siteId == UtilSite.SCHOOLOGY)
			{
				this.tagsValidator.enabled = false;
			}
		}
		
		private function onSharingOptionChange() : void
		{
			this.setTempPublished();
			this.setTempPrivateShared();
		}
		
		private function onWatermarkBtnClick() : void
		{
			if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_WATERMARK))
			{
				currentState = "watermark";
			}
			else
			{
				ServerConnector.instance.displayUpsellHook("watermark");
			}
		}
		
		private function onWatermarkPopUpClose() : void
		{
			currentState = "normal";
			this.updateWatermark();
		}
		
		private function updateWatermark() : void
		{
			this.watermarkDisplay.data = Console.getConsole().watermarkManager.currentWatermark;
		}
		
		private function _PublishWindow_RadioButtonGroup1_i() : RadioButtonGroup
		{
			var _loc1_:RadioButtonGroup = new RadioButtonGroup();
			_loc1_.addEventListener("change",this.___sharingOption_change);
			_loc1_.initialized(this,"_sharingOption");
			this._sharingOption = _loc1_;
			BindingManager.executeBindings(this,"_sharingOption",this._sharingOption);
			return _loc1_;
		}
		
		public function ___sharingOption_change(param1:Event) : void
		{
			this.onSharingOptionChange();
		}
		
		private function _PublishWindow_Array5_i() : Array
		{
			var _loc1_:Array = [this._PublishWindow_AssetTitleValidator1_i(),this._PublishWindow_BadWordsValidator1_i(),this._PublishWindow_BadWordsValidator2_i()];
			this.validatorList = _loc1_;
			BindingManager.executeBindings(this,"validatorList",this.validatorList);
			return _loc1_;
		}
		
		private function _PublishWindow_AssetTitleValidator1_i() : AssetTitleValidator
		{
			var _loc1_:AssetTitleValidator = new AssetTitleValidator();
			_loc1_.property = "text";
			_loc1_.initialized(this,"titleValidator");
			this.titleValidator = _loc1_;
			BindingManager.executeBindings(this,"titleValidator",this.titleValidator);
			return _loc1_;
		}
		
		private function _PublishWindow_BadWordsValidator1_i() : BadWordsValidator
		{
			var _loc1_:BadWordsValidator = new BadWordsValidator();
			_loc1_.property = "text";
			_loc1_.initialized(this,"tagsValidator");
			this.tagsValidator = _loc1_;
			BindingManager.executeBindings(this,"tagsValidator",this.tagsValidator);
			return _loc1_;
		}
		
		private function _PublishWindow_BadWordsValidator2_i() : BadWordsValidator
		{
			var _loc1_:BadWordsValidator = new BadWordsValidator();
			_loc1_.property = "text";
			_loc1_.initialized(this,"descriptionValidator");
			this.descriptionValidator = _loc1_;
			BindingManager.executeBindings(this,"descriptionValidator",this.descriptionValidator);
			return _loc1_;
		}
		
		private function _PublishWindow_Array6_c() : Array
		{
			var _loc1_:Array = [this._PublishWindow_Group1_i()];
			return _loc1_;
		}
		
		private function _PublishWindow_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._PublishWindow_PublishPanel1_i()];
			_loc1_.id = "chrome";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.chrome = _loc1_;
			BindingManager.executeBindings(this,"chrome",this.chrome);
			return _loc1_;
		}
		
		private function _PublishWindow_PublishPanel1_i() : PublishPanel
		{
			var _loc1_:PublishPanel = new PublishPanel();
			_loc1_.width = 700;
			_loc1_.controlBarContent = [this._PublishWindow_Button1_i(),this._PublishWindow_Button2_i(),this._PublishWindow_Button3_i(),this._PublishWindow_Button4_i()];
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._PublishWindow_Array9_c);
			_loc1_.addEventListener("cancel",this.__panel_cancel);
			_loc1_.id = "panel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.panel = _loc1_;
			BindingManager.executeBindings(this,"panel",this.panel);
			return _loc1_;
		}
		
		private function _PublishWindow_Button1_i() : Button
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
		
		private function _PublishWindow_Button2_i() : Button
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
		
		private function _PublishWindow_Button3_i() : Button
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
		
		private function _PublishWindow_Button4_i() : Button
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
		
		private function _PublishWindow_Array9_c() : Array
		{
			var _loc1_:Array = [this._PublishWindow_Group2_c()];
			return _loc1_;
		}
		
		private function _PublishWindow_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._PublishWindow_PopUpContentBackground1_c(),this._PublishWindow_VGroup1_i(),this._PublishWindow_WatermarkPanel1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PublishWindow_PopUpContentBackground1_c() : PopUpContentBackground
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
		
		private function _PublishWindow_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.paddingTop = 20;
			_loc1_.gap = 20;
			_loc1_.mxmlContent = [this._PublishWindow_HGroup1_c(),this._PublishWindow_Label5_i(),this._PublishWindow_VGroup5_i()];
			_loc1_.id = "normalOptionGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.normalOptionGroup = _loc1_;
			BindingManager.executeBindings(this,"normalOptionGroup",this.normalOptionGroup);
			return _loc1_;
		}
		
		private function _PublishWindow_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.paddingLeft = 28;
			_loc1_.paddingRight = 28;
			_loc1_.gap = 25;
			_loc1_.horizontalAlign = "center";
			_loc1_.mxmlContent = [this._PublishWindow_Form1_c(),this._PublishWindow_VGroup3_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PublishWindow_Form1_c() : Form
		{
			var _loc1_:Form = new Form();
			_loc1_.percentWidth = 100;
			_loc1_.styleName = "publish";
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._PublishWindow_Array13_c);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PublishWindow_Array13_c() : Array
		{
			var _loc1_:Array = [this._PublishWindow_FormItem1_i(),this._PublishWindow_FormItem2_i(),this._PublishWindow_FormItem3_i(),this._PublishWindow_FormItem4_i(),this._PublishWindow_FormItem5_i()];
			return _loc1_;
		}
		
		private function _PublishWindow_FormItem1_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._PublishWindow_Array14_c);
			_loc1_.id = "movieTitleItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.movieTitleItem = _loc1_;
			BindingManager.executeBindings(this,"movieTitleItem",this.movieTitleItem);
			return _loc1_;
		}
		
		private function _PublishWindow_Array14_c() : Array
		{
			var _loc1_:Array = [this._PublishWindow_TextInput1_i()];
			return _loc1_;
		}
		
		private function _PublishWindow_TextInput1_i() : TextInput
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
		
		private function _PublishWindow_FormItem2_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.helpContent = [this._PublishWindow_Label1_i()];
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._PublishWindow_Array16_c);
			_loc1_.id = "movieTagsItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.movieTagsItem = _loc1_;
			BindingManager.executeBindings(this,"movieTagsItem",this.movieTagsItem);
			return _loc1_;
		}
		
		private function _PublishWindow_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",10066329);
			_loc1_.id = "_PublishWindow_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._PublishWindow_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_PublishWindow_Label1",this._PublishWindow_Label1);
			return _loc1_;
		}
		
		private function _PublishWindow_Array16_c() : Array
		{
			var _loc1_:Array = [this._PublishWindow_TextInput2_i()];
			return _loc1_;
		}
		
		private function _PublishWindow_TextInput2_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.maxChars = 50;
			_loc1_.id = "movieTagsInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.movieTagsInput = _loc1_;
			BindingManager.executeBindings(this,"movieTagsInput",this.movieTagsInput);
			return _loc1_;
		}
		
		private function _PublishWindow_FormItem3_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.helpContent = [this._PublishWindow_Label2_i()];
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._PublishWindow_Array18_c);
			_loc1_.id = "movieDescriptionItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.movieDescriptionItem = _loc1_;
			BindingManager.executeBindings(this,"movieDescriptionItem",this.movieDescriptionItem);
			return _loc1_;
		}
		
		private function _PublishWindow_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",10066329);
			_loc1_.id = "_PublishWindow_Label2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._PublishWindow_Label2 = _loc1_;
			BindingManager.executeBindings(this,"_PublishWindow_Label2",this._PublishWindow_Label2);
			return _loc1_;
		}
		
		private function _PublishWindow_Array18_c() : Array
		{
			var _loc1_:Array = [this._PublishWindow_TextArea1_i()];
			return _loc1_;
		}
		
		private function _PublishWindow_TextArea1_i() : TextArea
		{
			var _loc1_:TextArea = new TextArea();
			_loc1_.percentWidth = 100;
			_loc1_.heightInLines = 3;
			_loc1_.maxChars = 255;
			_loc1_.id = "movieDescriptionInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.movieDescriptionInput = _loc1_;
			BindingManager.executeBindings(this,"movieDescriptionInput",this.movieDescriptionInput);
			return _loc1_;
		}
		
		private function _PublishWindow_FormItem4_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._PublishWindow_Array19_c);
			_loc1_.id = "savePanel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.savePanel = _loc1_;
			BindingManager.executeBindings(this,"savePanel",this.savePanel);
			return _loc1_;
		}
		
		private function _PublishWindow_Array19_c() : Array
		{
			var _loc1_:Array = [this._PublishWindow_VGroup2_c()];
			return _loc1_;
		}
		
		private function _PublishWindow_VGroup2_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.mxmlContent = [this._PublishWindow_HGroup2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PublishWindow_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "baseline";
			_loc1_.gap = 25;
			_loc1_.mxmlContent = [this._PublishWindow_RadioButton1_i(),this._PublishWindow_RadioButton2_i(),this._PublishWindow_RadioButton3_i(),this._PublishWindow_RadioButton4_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PublishWindow_RadioButton1_i() : RadioButton
		{
			var _loc1_:RadioButton = new RadioButton();
			_loc1_.groupName = "_sharingOption";
			_loc1_.buttonMode = true;
			_loc1_.id = "_radioDraft";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._radioDraft = _loc1_;
			BindingManager.executeBindings(this,"_radioDraft",this._radioDraft);
			return _loc1_;
		}
		
		private function _PublishWindow_RadioButton2_i() : RadioButton
		{
			var _loc1_:RadioButton = new RadioButton();
			_loc1_.groupName = "_sharingOption";
			_loc1_.buttonMode = true;
			_loc1_.id = "_radioPrivate";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._radioPrivate = _loc1_;
			BindingManager.executeBindings(this,"_radioPrivate",this._radioPrivate);
			return _loc1_;
		}
		
		private function _PublishWindow_RadioButton3_i() : RadioButton
		{
			var _loc1_:RadioButton = new RadioButton();
			_loc1_.groupName = "_sharingOption";
			_loc1_.buttonMode = true;
			_loc1_.id = "_radioPublic";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._radioPublic = _loc1_;
			BindingManager.executeBindings(this,"_radioPublic",this._radioPublic);
			return _loc1_;
		}
		
		private function _PublishWindow_RadioButton4_i() : RadioButton
		{
			var _loc1_:RadioButton = new RadioButton();
			_loc1_.groupName = "_sharingOption";
			_loc1_.buttonMode = true;
			_loc1_.id = "_radioPasswordProtected";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._radioPasswordProtected = _loc1_;
			BindingManager.executeBindings(this,"_radioPasswordProtected",this._radioPasswordProtected);
			return _loc1_;
		}
		
		private function _PublishWindow_FormItem5_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.required = true;
			_loc1_.includeInLayout = false;
			_loc1_.visible = false;
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._PublishWindow_Array22_c);
			_loc1_.id = "_vbGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._vbGroup = _loc1_;
			BindingManager.executeBindings(this,"_vbGroup",this._vbGroup);
			return _loc1_;
		}
		
		private function _PublishWindow_Array22_c() : Array
		{
			var _loc1_:Array = [this._PublishWindow_DropDownList1_i(),this._PublishWindow_Label3_i()];
			return _loc1_;
		}
		
		private function _PublishWindow_DropDownList1_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.percentWidth = 100;
			_loc1_.setStyle("fontSize",14);
			_loc1_.addEventListener("change",this.__publishGroupList_change);
			_loc1_.id = "publishGroupList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.publishGroupList = _loc1_;
			BindingManager.executeBindings(this,"publishGroupList",this.publishGroupList);
			return _loc1_;
		}
		
		public function __publishGroupList_change(param1:IndexChangeEvent) : void
		{
			this.doModifyGroup();
		}
		
		private function _PublishWindow_Label3_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.includeInLayout = false;
			_loc1_.visible = false;
			_loc1_.setStyle("textAlign","center");
			_loc1_.setStyle("color",6954528);
			_loc1_.setStyle("fontSize",14);
			_loc1_.id = "_groupAlert";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._groupAlert = _loc1_;
			BindingManager.executeBindings(this,"_groupAlert",this._groupAlert);
			return _loc1_;
		}
		
		private function _PublishWindow_VGroup3_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 14;
			_loc1_.paddingTop = 5;
			_loc1_.mxmlContent = [this._PublishWindow_SceneThumbnailChooser1_i(),this._PublishWindow_VGroup4_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PublishWindow_SceneThumbnailChooser1_i() : SceneThumbnailChooser
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
		
		private function _PublishWindow_VGroup4_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._PublishWindow_Label4_i(),this._PublishWindow_WatermarkPreview1_i(),this._PublishWindow_Button5_i()];
			_loc1_.id = "watermarkBox";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.watermarkBox = _loc1_;
			BindingManager.executeBindings(this,"watermarkBox",this.watermarkBox);
			return _loc1_;
		}
		
		private function _PublishWindow_Label4_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.id = "_PublishWindow_Label4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._PublishWindow_Label4 = _loc1_;
			BindingManager.executeBindings(this,"_PublishWindow_Label4",this._PublishWindow_Label4);
			return _loc1_;
		}
		
		private function _PublishWindow_WatermarkPreview1_i() : WatermarkPreview
		{
			var _loc1_:WatermarkPreview = new WatermarkPreview();
			_loc1_.width = 120;
			_loc1_.height = 70;
			_loc1_.maxWidth = 120;
			_loc1_.maxHeight = 70;
			_loc1_.buttonMode = true;
			_loc1_.addEventListener("click",this.__watermarkDisplay_click);
			_loc1_.id = "watermarkDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.watermarkDisplay = _loc1_;
			BindingManager.executeBindings(this,"watermarkDisplay",this.watermarkDisplay);
			return _loc1_;
		}
		
		public function __watermarkDisplay_click(param1:MouseEvent) : void
		{
			this.onWatermarkBtnClick();
		}
		
		private function _PublishWindow_Button5_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.styleName = "link";
			_loc1_.buttonMode = true;
			_loc1_.addEventListener("click",this.__watermarkButton_click);
			_loc1_.id = "watermarkButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.watermarkButton = _loc1_;
			BindingManager.executeBindings(this,"watermarkButton",this.watermarkButton);
			return _loc1_;
		}
		
		public function __watermarkButton_click(param1:MouseEvent) : void
		{
			this.onWatermarkBtnClick();
		}
		
		private function _PublishWindow_Label5_i() : Label
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
		
		private function _PublishWindow_VGroup5_i() : VGroup
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
			_loc1_.mxmlContent = [this._PublishWindow_Label6_i(),this._PublishWindow_Line1_c()];
			_loc1_.id = "schoolTip";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.schoolTip = _loc1_;
			BindingManager.executeBindings(this,"schoolTip",this.schoolTip);
			return _loc1_;
		}
		
		private function _PublishWindow_Label6_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.horizontalCenter = 0;
			_loc1_.setStyle("fontSize",16);
			_loc1_.setStyle("color",11184810);
			_loc1_.id = "_PublishWindow_Label6";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._PublishWindow_Label6 = _loc1_;
			BindingManager.executeBindings(this,"_PublishWindow_Label6",this._PublishWindow_Label6);
			return _loc1_;
		}
		
		private function _PublishWindow_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.stroke = this._PublishWindow_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _PublishWindow_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 13421772;
			return _loc1_;
		}
		
		private function _PublishWindow_WatermarkPanel1_i() : WatermarkPanel
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
		
		public function __panel_cancel(param1:Event) : void
		{
			this.onWatermarkPopUpClose();
		}
		
		private function _PublishWindow_Button6_i() : Button
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
		
		private function _PublishWindow_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,null,null,"titleValidator.source","movieTitleInput");
			result[1] = new Binding(this,null,null,"tagsValidator.source","movieTagsInput");
			result[2] = new Binding(this,null,null,"descriptionValidator.source","movieDescriptionInput");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Save Your Video");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"panel.title");
			result[4] = new Binding(this,function():*
			{
				return UtilDict.toDisplay("go","Switch logo for this video");
			},null,"_PublishWindow_SetProperty1.value");
			result[5] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","pubwin_saveonly");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_btnSave.label");
			result[6] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","pubwin_saveonlytips");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_btnSave.toolTip");
			result[7] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Close Studio");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_btnClose.label");
			result[8] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Close the Studio");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_btnClose.toolTip");
			result[9] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Post to Profile >");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_btnPostToProfile.label");
			result[10] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","pubwin_movietitle");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"movieTitleItem.label");
			result[11] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","pubwin_tags");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"movieTagsItem.label");
			result[12] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","(Optional)");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_PublishWindow_Label1.text");
			result[13] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Separate with commas, e.g. Comedy, Romance");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"movieTagsInput.prompt");
			result[14] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","pubwin_description");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"movieDescriptionItem.label");
			result[15] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","(Optional)");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_PublishWindow_Label2.text");
			result[16] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Add a short description to your video");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"movieDescriptionInput.prompt");
			result[17] = new Binding(this,function():String
			{
				var _loc1_:* = null;
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"savePanel.label");
			result[18] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","pubwin_draft");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_radioDraft.label");
			result[19] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Private");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_radioPrivate.label");
			result[20] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","pubwin_public");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_radioPublic.label");
			result[21] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Password-Protected");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_radioPasswordProtected.label");
			result[22] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Group");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_vbGroup.label");
			result[23] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Create groups of students to enable publishing your animations.");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_groupAlert.text");
			result[24] = new Binding(this,function():Boolean
			{
				return showWatermark;
			},null,"watermarkBox.visible");
			result[25] = new Binding(this,function():Boolean
			{
				return showWatermark;
			},null,"watermarkBox.includeInLayout");
			result[26] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Logo");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_PublishWindow_Label4.text");
			result[27] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Switch logo");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"watermarkButton.label");
			result[28] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","When you are finished with your video, you can post it to a group from the video page");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_PublishWindow_Label6.text");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _PublishWindow_SetProperty1() : SetProperty
		{
			return this._202291975_PublishWindow_SetProperty1;
		}
		
		public function set _PublishWindow_SetProperty1(param1:SetProperty) : void
		{
			var _loc2_:Object = this._202291975_PublishWindow_SetProperty1;
			if(_loc2_ !== param1)
			{
				this._202291975_PublishWindow_SetProperty1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PublishWindow_SetProperty1",_loc2_,param1));
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
		public function get _groupAlert() : Label
		{
			return this._1952108612_groupAlert;
		}
		
		public function set _groupAlert(param1:Label) : void
		{
			var _loc2_:Object = this._1952108612_groupAlert;
			if(_loc2_ !== param1)
			{
				this._1952108612_groupAlert = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_groupAlert",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _radioDraft() : RadioButton
		{
			return this._1061294085_radioDraft;
		}
		
		public function set _radioDraft(param1:RadioButton) : void
		{
			var _loc2_:Object = this._1061294085_radioDraft;
			if(_loc2_ !== param1)
			{
				this._1061294085_radioDraft = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_radioDraft",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _radioPasswordProtected() : RadioButton
		{
			return this._192196535_radioPasswordProtected;
		}
		
		public function set _radioPasswordProtected(param1:RadioButton) : void
		{
			var _loc2_:Object = this._192196535_radioPasswordProtected;
			if(_loc2_ !== param1)
			{
				this._192196535_radioPasswordProtected = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_radioPasswordProtected",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _radioPrivate() : RadioButton
		{
			return this._230640921_radioPrivate;
		}
		
		public function set _radioPrivate(param1:RadioButton) : void
		{
			var _loc2_:Object = this._230640921_radioPrivate;
			if(_loc2_ !== param1)
			{
				this._230640921_radioPrivate = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_radioPrivate",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _radioPublic() : RadioButton
		{
			return this._1113266043_radioPublic;
		}
		
		public function set _radioPublic(param1:RadioButton) : void
		{
			var _loc2_:Object = this._1113266043_radioPublic;
			if(_loc2_ !== param1)
			{
				this._1113266043_radioPublic = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_radioPublic",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _sharingOption() : RadioButtonGroup
		{
			return this._1839914382_sharingOption;
		}
		
		public function set _sharingOption(param1:RadioButtonGroup) : void
		{
			var _loc2_:Object = this._1839914382_sharingOption;
			if(_loc2_ !== param1)
			{
				this._1839914382_sharingOption = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sharingOption",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _vbGroup() : FormItem
		{
			return this._1710757388_vbGroup;
		}
		
		public function set _vbGroup(param1:FormItem) : void
		{
			var _loc2_:Object = this._1710757388_vbGroup;
			if(_loc2_ !== param1)
			{
				this._1710757388_vbGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vbGroup",_loc2_,param1));
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
		public function get descriptionValidator() : BadWordsValidator
		{
			return this._887448246descriptionValidator;
		}
		
		public function set descriptionValidator(param1:BadWordsValidator) : void
		{
			var _loc2_:Object = this._887448246descriptionValidator;
			if(_loc2_ !== param1)
			{
				this._887448246descriptionValidator = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"descriptionValidator",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get movieDescriptionInput() : TextArea
		{
			return this._160029570movieDescriptionInput;
		}
		
		public function set movieDescriptionInput(param1:TextArea) : void
		{
			var _loc2_:Object = this._160029570movieDescriptionInput;
			if(_loc2_ !== param1)
			{
				this._160029570movieDescriptionInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieDescriptionInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get movieDescriptionItem() : FormItem
		{
			return this._2073053151movieDescriptionItem;
		}
		
		public function set movieDescriptionItem(param1:FormItem) : void
		{
			var _loc2_:Object = this._2073053151movieDescriptionItem;
			if(_loc2_ !== param1)
			{
				this._2073053151movieDescriptionItem = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieDescriptionItem",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get movieTagsInput() : TextInput
		{
			return this._1463430687movieTagsInput;
		}
		
		public function set movieTagsInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._1463430687movieTagsInput;
			if(_loc2_ !== param1)
			{
				this._1463430687movieTagsInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieTagsInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get movieTagsItem() : FormItem
		{
			return this._229892636movieTagsItem;
		}
		
		public function set movieTagsItem(param1:FormItem) : void
		{
			var _loc2_:Object = this._229892636movieTagsItem;
			if(_loc2_ !== param1)
			{
				this._229892636movieTagsItem = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"movieTagsItem",_loc2_,param1));
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
		public function get publishGroupList() : spark.components.DropDownList
		{
			return this._1052739438publishGroupList;
		}
		
		public function set publishGroupList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._1052739438publishGroupList;
			if(_loc2_ !== param1)
			{
				this._1052739438publishGroupList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"publishGroupList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get savePanel() : FormItem
		{
			return this._169721479savePanel;
		}
		
		public function set savePanel(param1:FormItem) : void
		{
			var _loc2_:Object = this._169721479savePanel;
			if(_loc2_ !== param1)
			{
				this._169721479savePanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"savePanel",_loc2_,param1));
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
		public function get tagsValidator() : BadWordsValidator
		{
			return this._671317191tagsValidator;
		}
		
		public function set tagsValidator(param1:BadWordsValidator) : void
		{
			var _loc2_:Object = this._671317191tagsValidator;
			if(_loc2_ !== param1)
			{
				this._671317191tagsValidator = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagsValidator",_loc2_,param1));
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
		public function get watermarkBox() : VGroup
		{
			return this._1563553081watermarkBox;
		}
		
		public function set watermarkBox(param1:VGroup) : void
		{
			var _loc2_:Object = this._1563553081watermarkBox;
			if(_loc2_ !== param1)
			{
				this._1563553081watermarkBox = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkBox",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get watermarkButton() : Button
		{
			return this._883973962watermarkButton;
		}
		
		public function set watermarkButton(param1:Button) : void
		{
			var _loc2_:Object = this._883973962watermarkButton;
			if(_loc2_ !== param1)
			{
				this._883973962watermarkButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get watermarkDisplay() : WatermarkPreview
		{
			return this._202977346watermarkDisplay;
		}
		
		public function set watermarkDisplay(param1:WatermarkPreview) : void
		{
			var _loc2_:Object = this._202977346watermarkDisplay;
			if(_loc2_ !== param1)
			{
				this._202977346watermarkDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkDisplay",_loc2_,param1));
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
		private function get _passwordProtected() : Boolean
		{
			return this._879855404_passwordProtected;
		}
		
		private function set _passwordProtected(param1:Boolean) : void
		{
			var _loc2_:Object = this._879855404_passwordProtected;
			if(_loc2_ !== param1)
			{
				this._879855404_passwordProtected = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_passwordProtected",_loc2_,param1));
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
