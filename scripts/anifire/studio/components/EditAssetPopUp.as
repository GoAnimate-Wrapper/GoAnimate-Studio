package anifire.studio.components
{
	import anifire.constant.ResponseConstants;
	import anifire.constant.ServerConstants;
	import anifire.event.ServerRequestEvent;
	import anifire.studio.core.BackgroundThumb;
	import anifire.studio.core.CharThumb;
	import anifire.studio.core.Thumb;
	import anifire.studio.managers.AccessRightManager;
	import anifire.studio.managers.TeamManager;
	import anifire.studio.managers.ThemeStarterManager;
	import anifire.studio.models.AssetSharingCollection;
	import anifire.studio.models.TeamMemberModel;
	import anifire.studio.skins.DefaultDropDownListSkin;
	import anifire.studio.validators.AssetTitleValidator;
	import anifire.util.ApiRequest;
	import anifire.util.UtilDict;
	import anifire.util.UtilUser;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.ClassFactory;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.validators.Validator;
	import spark.components.Button;
	import spark.components.CheckBox;
	import spark.components.Form;
	import spark.components.FormItem;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Panel;
	import spark.components.RadioButton;
	import spark.components.TextArea;
	import spark.components.TextInput;
	import spark.components.VGroup;
	import spark.layouts.HorizontalLayout;
	
	use namespace mx_internal;
	
	public class EditAssetPopUp extends DefaultPopUpContainer implements IBindingClient, IStateClient2
	{
		
		public static const DATA_NAME:String = "name";
		
		public static const DATA_TAGS:String = "tags";
		
		public static const DATA_PUBLISHED:String = "published";
		
		public static const DATA_SHARE:String = "share";
		
		public static const FORM_SHARING_TITLE:String = "Sharing permission";
		
		public static const HEADER_TEXT:String = "Edit Info";
		
		private static const NAME_LABEL:String = "assetinfo_name";
		
		private static const CONFIRM_TEXT:String = "assetinfo_update";
		
		private static const CANCEL_TEXT:String = "assetinfo_cancel";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _EditAssetPopUp_AssetTitleValidator1:AssetTitleValidator;
		
		public var _EditAssetPopUp_BusyIndicator1:BusyIndicator;
		
		public var _EditAssetPopUp_FormItem1:FormItem;
		
		public var _EditAssetPopUp_FormItem4:FormItem;
		
		private var _1990131276cancelButton:Button;
		
		private var _318380396categoryInput:TextInput;
		
		private var _1361128838chrome:Group;
		
		private var _312699062closeButton:Button;
		
		private var _236983790confirmButton:Button;
		
		private var _1601624558editForm:Form;
		
		private var _1632326511idInput:TextInput;
		
		private var _1213385727nameInput:TextInput;
		
		private var _1840262206nameItem:FormItem;
		
		private var _1355827378optionPrivate:RadioButton;
		
		private var _1344289598optionPublic:RadioButton;
		
		private var _106433028panel:Panel;
		
		private var _2104639788publicCheckBox:CheckBox;
		
		private var _614961982publishItem:FormItem;
		
		private var _79172111sharingItem:FormItem;
		
		private var _1670653135tagsInput:TextArea;
		
		private var _746623284tagsItem:FormItem;
		
		private var _709119570teamDropDown:MultiSelectionDropDown;
		
		private var _528206064validatorList:Array;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _1215755049nameLabel:String;
		
		private var _1977152339nameLabelEditable:Boolean = true;
		
		private var _1668283813tagsLabel:String;
		
		private var _338838346showTags:Boolean = true;
		
		private var _1838430344sharingLabel:String;
		
		private var _537548202optionPublicLabel:String;
		
		private var _1182873670optionPrivateLabel:String;
		
		private var _411871980showPublishOptions:Boolean;
		
		private var _1627881550showTeamSelection:Boolean;
		
		private var _1106722044showIDLabel:Boolean;
		
		protected var _thumb:Thumb;
		
		private var _modelOwner:TeamMemberModel;
		
		private var _modelTeam:TeamMemberModel;
		
		private var _isAdmin:Boolean;
		
		private var _143186672_showCategoryInput:Boolean;
		
		private var _968601640_showPublicCheckBox:Boolean;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function EditAssetPopUp()
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
			bindings = this._EditAssetPopUp_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_EditAssetPopUpWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return EditAssetPopUp[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array3_c);
			this.currentState = "normal";
			this._EditAssetPopUp_Array1_i();
			var _EditAssetPopUp_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._EditAssetPopUp_BusyIndicator1_i);
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"loading",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_EditAssetPopUp_BusyIndicator1_factory,
					"destination":"chrome",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["closeButton"]
				}),new SetProperty().initializeFromObject({
					"target":"chrome",
					"name":"mouseEnabled",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"chrome",
					"name":"mouseChildren",
					"value":false
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
			EditAssetPopUp._watcherSetupUtil = param1;
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
		
		public function get thumb() : Thumb
		{
			return this._thumb;
		}
		
		public function set thumb(param1:Thumb) : void
		{
			if(this._thumb != param1)
			{
				this._thumb = param1;
				if(initialized)
				{
					this.updateValues();
				}
			}
		}
		
		override protected function confirm() : void
		{
			var _loc2_:AssetSharingCollection = null;
			var _loc1_:Array = Validator.validateAll(this.validatorList);
			if(_loc1_.length == 0)
			{
				_data = {};
				_data[DATA_NAME] = this.nameInput.text;
				_data[DATA_TAGS] = this.generateTagsData();
				if(this.showPublishOptions)
				{
					_data[DATA_PUBLISHED] = !!this.optionPublic.selected?1:0;
				}
				if(this.showTeamSelection)
				{
					_loc2_ = this.teamDropDown.dataProvider as AssetSharingCollection;
					_data[ResponseConstants.ASSET_SHARING_SHARE] = _loc2_.createRequestData();
				}
				super.confirm();
			}
		}
		
		private function generateTagsData() : String
		{
			var _loc2_:String = null;
			if(!this._isAdmin)
			{
				return this.tagsInput.text;
			}
			var _loc1_:Array = [];
			if(this.tagsInput.text)
			{
				_loc1_.push(this.tagsInput.text);
			}
			if(this.categoryInput.text)
			{
				_loc2_ = this._thumb is CharThumb?CharThumb.CATEGORY_TAG_PREFIX:BackgroundThumb.CATEGORY_TAG_PREFIX;
				_loc1_.push(_loc2_ + this.categoryInput.text);
			}
			if(this.publicCheckBox.selected)
			{
				_loc1_.push(ThemeStarterManager.THEME_STARTER_TAG_NAME);
			}
			return _loc1_.join();
		}
		
		override protected function init() : void
		{
			super.init();
			this._isAdmin = UtilUser.isContentAdmin;
			this._showCategoryInput = this._isAdmin;
			this._showPublicCheckBox = this._isAdmin;
			this.showIDLabel = this._isAdmin;
			if(AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_TEAM_SHARING))
			{
				this.showTeamSelection = true;
				this.sharingLabel = UtilDict.translate(FORM_SHARING_TITLE);
			}
			this.nameLabel = UtilDict.translate(NAME_LABEL);
			this.confirmText = UtilDict.translate(CONFIRM_TEXT);
			this.cancelText = UtilDict.translate(CANCEL_TEXT);
			this.updateValues();
		}
		
		protected function updateValues() : void
		{
			if(this._thumb)
			{
				this.idInput.text = this._thumb.id;
				this.nameInput.text = this._thumb.name;
				this.tagsInput.text = this._thumb.tags;
				if(this._thumb.isPublished)
				{
					this.optionPublic.selected = true;
				}
				else
				{
					this.optionPrivate.selected = true;
				}
				if(this.showTeamSelection)
				{
					this.loadSharingInfo();
				}
			}
		}
		
		protected function idInput_clickHandler(param1:MouseEvent) : void
		{
			this.idInput.selectAll();
		}
		
		protected function loadSharingInfo() : void
		{
			currentState = "loading";
			var _loc1_:ApiRequest = new ApiRequest();
			_loc1_.addEventListener(ServerRequestEvent.COMPLETE,this.loadAssetSharing_completeHandler);
			_loc1_.addEventListener(ServerRequestEvent.FAIL,this.loadAssetSharing_failHandler);
			var _loc2_:Object = {};
			if(this.thumb.isStarter)
			{
				_loc2_[ResponseConstants.ASSET_STARTER_ID] = (this.thumb as BackgroundThumb).starterId;
			}
			else
			{
				_loc2_[ResponseConstants.ID] = this.thumb.encAssetId;
			}
			_loc1_.post(ServerConstants.ACTION_GET_ASSET_V2,_loc2_);
		}
		
		protected function loadAssetSharing_completeHandler(param1:ServerRequestEvent) : void
		{
			this.processTagsData(param1.data[ResponseConstants.TAGS]);
			var _loc2_:Object = param1.data[ResponseConstants.ASSET_SHARING_SHARE];
			this.updateTeamDropDown(_loc2_);
		}
		
		private function processTagsData(param1:String) : void
		{
			var _loc6_:Array = null;
			var _loc7_:String = null;
			var _loc8_:Boolean = false;
			var _loc9_:String = null;
			if(!param1)
			{
				this.categoryInput.text = "";
				this.tagsInput.text = "";
				this.publicCheckBox.selected = false;
				return;
			}
			if(!this._isAdmin)
			{
				this.tagsInput.text = param1;
				return;
			}
			var _loc2_:Array = param1.split(",");
			var _loc3_:Array = [];
			var _loc4_:int = _loc2_.length;
			var _loc5_:RegExp = this._thumb is CharThumb?CharThumb.TAG_CATEGORY_PATTERN:BackgroundThumb.TAG_CATEGORY_PATTERN;
			var _loc10_:int = 0;
			while(_loc10_ < _loc4_)
			{
				_loc9_ = _loc2_[_loc10_];
				_loc6_ = _loc5_.exec(_loc9_);
				if(_loc6_)
				{
					_loc7_ = _loc6_[1];
				}
				else if(_loc9_ == ThemeStarterManager.THEME_STARTER_TAG_NAME)
				{
					_loc8_ = true;
				}
				else
				{
					_loc3_.push(_loc9_);
				}
				_loc10_++;
			}
			this.categoryInput.text = _loc7_;
			this.tagsInput.text = _loc3_.join();
			this.publicCheckBox.selected = _loc8_;
		}
		
		protected function loadAssetSharing_failHandler(param1:ServerRequestEvent) : void
		{
			currentState = "normal";
		}
		
		protected function updateTeamDropDown(param1:Object) : void
		{
			var _loc4_:Array = null;
			var _loc5_:int = 0;
			var _loc6_:int = 0;
			var _loc2_:AssetSharingCollection = TeamManager.instance.createAssetSharingCollection();
			var _loc3_:String = param1[ResponseConstants.ASSET_SHARING_TYPE];
			if(_loc3_ != ResponseConstants.ASSET_SHARING_TYPE_NONE)
			{
				if(_loc3_ == ResponseConstants.ASSET_SHARING_TYPE_TEAM)
				{
					_loc2_.selectTeamItem();
				}
				else
				{
					_loc4_ = param1[ResponseConstants.ASSET_SHARING_USER_IDS];
					if(_loc4_)
					{
						_loc5_ = _loc4_.length;
						_loc6_ = 0;
						while(_loc6_ < _loc5_)
						{
							_loc2_.selectMemberItem(_loc4_[_loc6_]);
							_loc6_++;
						}
						_loc2_.updateDefaultItems();
					}
				}
			}
			this.teamDropDown.dataProvider = _loc2_;
			currentState = "normal";
		}
		
		private function _EditAssetPopUp_Array1_i() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_AssetTitleValidator1_i()];
			this.validatorList = _loc1_;
			BindingManager.executeBindings(this,"validatorList",this.validatorList);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_AssetTitleValidator1_i() : AssetTitleValidator
		{
			var _loc1_:AssetTitleValidator = new AssetTitleValidator();
			_loc1_.property = "text";
			_loc1_.initialized(this,"_EditAssetPopUp_AssetTitleValidator1");
			this._EditAssetPopUp_AssetTitleValidator1 = _loc1_;
			BindingManager.executeBindings(this,"_EditAssetPopUp_AssetTitleValidator1",this._EditAssetPopUp_AssetTitleValidator1);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Array3_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_Group1_i()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._EditAssetPopUp_Panel1_i(),this._EditAssetPopUp_Button3_i()];
			_loc1_.id = "chrome";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.chrome = _loc1_;
			BindingManager.executeBindings(this,"chrome",this.chrome);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Panel1_i() : Panel
		{
			var _loc1_:Panel = new Panel();
			_loc1_.controlBarContent = [this._EditAssetPopUp_Button1_i(),this._EditAssetPopUp_Button2_i()];
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array6_c);
			_loc1_.id = "panel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.panel = _loc1_;
			BindingManager.executeBindings(this,"panel",this.panel);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Button1_i() : Button
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
			cancel();
		}
		
		private function _EditAssetPopUp_Button2_i() : Button
		{
			var _loc1_:Button = null;
			_loc1_ = new Button();
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
		
		private function _EditAssetPopUp_Array6_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_PopUpContentBackground1_c(),this._EditAssetPopUp_VGroup1_c()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_PopUpContentBackground1_c() : PopUpContentBackground
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
		
		private function _EditAssetPopUp_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.gap = 20;
			_loc1_.paddingTop = 25;
			_loc1_.paddingBottom = 25;
			_loc1_.paddingLeft = 28;
			_loc1_.paddingRight = 28;
			_loc1_.mxmlContent = [this._EditAssetPopUp_Form1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Form1_i() : Form
		{
			var _loc1_:Form = new Form();
			_loc1_.minWidth = 300;
			_loc1_.horizontalCenter = 0;
			_loc1_.styleName = "publish";
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array8_c);
			_loc1_.id = "editForm";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.editForm = _loc1_;
			BindingManager.executeBindings(this,"editForm",this.editForm);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Array8_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_FormItem1_i(),this._EditAssetPopUp_FormItem2_i(),this._EditAssetPopUp_FormItem3_i(),this._EditAssetPopUp_FormItem4_i(),this._EditAssetPopUp_CheckBox1_i(),this._EditAssetPopUp_FormItem5_i(),this._EditAssetPopUp_FormItem6_i()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_FormItem1_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array9_c);
			_loc1_.id = "_EditAssetPopUp_FormItem1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._EditAssetPopUp_FormItem1 = _loc1_;
			BindingManager.executeBindings(this,"_EditAssetPopUp_FormItem1",this._EditAssetPopUp_FormItem1);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Array9_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_TextInput1_i()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_TextInput1_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.editable = false;
			_loc1_.percentWidth = 100;
			_loc1_.addEventListener("click",this.__idInput_click);
			_loc1_.id = "idInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.idInput = _loc1_;
			BindingManager.executeBindings(this,"idInput",this.idInput);
			return _loc1_;
		}
		
		public function __idInput_click(param1:MouseEvent) : void
		{
			this.idInput_clickHandler(param1);
		}
		
		private function _EditAssetPopUp_FormItem2_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array10_c);
			_loc1_.id = "nameItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.nameItem = _loc1_;
			BindingManager.executeBindings(this,"nameItem",this.nameItem);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Array10_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_TextInput2_i()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_TextInput2_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.id = "nameInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.nameInput = _loc1_;
			BindingManager.executeBindings(this,"nameInput",this.nameInput);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_FormItem3_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array11_c);
			_loc1_.id = "tagsItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tagsItem = _loc1_;
			BindingManager.executeBindings(this,"tagsItem",this.tagsItem);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Array11_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_TextArea1_i()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_TextArea1_i() : TextArea
		{
			var _loc1_:TextArea = new TextArea();
			_loc1_.percentWidth = 100;
			_loc1_.height = 50;
			_loc1_.id = "tagsInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.tagsInput = _loc1_;
			BindingManager.executeBindings(this,"tagsInput",this.tagsInput);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_FormItem4_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array12_c);
			_loc1_.id = "_EditAssetPopUp_FormItem4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._EditAssetPopUp_FormItem4 = _loc1_;
			BindingManager.executeBindings(this,"_EditAssetPopUp_FormItem4",this._EditAssetPopUp_FormItem4);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Array12_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_TextInput3_i()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_TextInput3_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.id = "categoryInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.categoryInput = _loc1_;
			BindingManager.executeBindings(this,"categoryInput",this.categoryInput);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_CheckBox1_i() : CheckBox
		{
			var _loc1_:CheckBox = new CheckBox();
			_loc1_.id = "publicCheckBox";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.publicCheckBox = _loc1_;
			BindingManager.executeBindings(this,"publicCheckBox",this.publicCheckBox);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_FormItem5_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array13_c);
			_loc1_.id = "sharingItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.sharingItem = _loc1_;
			BindingManager.executeBindings(this,"sharingItem",this.sharingItem);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Array13_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_MultiSelectionDropDown1_i()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_MultiSelectionDropDown1_i() : MultiSelectionDropDown
		{
			var _loc1_:MultiSelectionDropDown = new MultiSelectionDropDown();
			_loc1_.percentWidth = 100;
			_loc1_.itemRenderer = this._EditAssetPopUp_ClassFactory1_c();
			_loc1_.setStyle("skinClass",DefaultDropDownListSkin);
			_loc1_.id = "teamDropDown";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.teamDropDown = _loc1_;
			BindingManager.executeBindings(this,"teamDropDown",this.teamDropDown);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_ClassFactory1_c() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = MultiSelectItemRenderer;
			return _loc1_;
		}
		
		private function _EditAssetPopUp_FormItem6_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.layout = this._EditAssetPopUp_HorizontalLayout1_c();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._EditAssetPopUp_Array14_c);
			_loc1_.id = "publishItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.publishItem = _loc1_;
			BindingManager.executeBindings(this,"publishItem",this.publishItem);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_HorizontalLayout1_c() : HorizontalLayout
		{
			var _loc1_:HorizontalLayout = new HorizontalLayout();
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Array14_c() : Array
		{
			var _loc1_:Array = [this._EditAssetPopUp_HGroup1_c()];
			return _loc1_;
		}
		
		private function _EditAssetPopUp_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._EditAssetPopUp_RadioButton1_i(),this._EditAssetPopUp_RadioButton2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _EditAssetPopUp_RadioButton1_i() : RadioButton
		{
			var _loc1_:RadioButton = new RadioButton();
			_loc1_.groupName = "privacyGroup";
			_loc1_.buttonMode = true;
			_loc1_.id = "optionPublic";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.optionPublic = _loc1_;
			BindingManager.executeBindings(this,"optionPublic",this.optionPublic);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_RadioButton2_i() : RadioButton
		{
			var _loc1_:RadioButton = new RadioButton();
			_loc1_.groupName = "privacyGroup";
			_loc1_.buttonMode = true;
			_loc1_.id = "optionPrivate";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.optionPrivate = _loc1_;
			BindingManager.executeBindings(this,"optionPrivate",this.optionPrivate);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_Button3_i() : Button
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
		
		private function _EditAssetPopUp_BusyIndicator1_i() : BusyIndicator
		{
			var _loc1_:BusyIndicator = new BusyIndicator();
			_loc1_.width = 60;
			_loc1_.height = 60;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.setStyle("symbolColor",16777215);
			_loc1_.id = "_EditAssetPopUp_BusyIndicator1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._EditAssetPopUp_BusyIndicator1 = _loc1_;
			BindingManager.executeBindings(this,"_EditAssetPopUp_BusyIndicator1",this._EditAssetPopUp_BusyIndicator1);
			return _loc1_;
		}
		
		private function _EditAssetPopUp_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,null,null,"_EditAssetPopUp_AssetTitleValidator1.source","nameInput");
			result[1] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate(HEADER_TEXT);
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"panel.title");
			result[2] = new Binding(this,null,null,"cancelButton.label","cancelText");
			result[3] = new Binding(this,null,null,"confirmButton.label","confirmText");
			result[4] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("ID:");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_EditAssetPopUp_FormItem1.label");
			result[5] = new Binding(this,null,null,"_EditAssetPopUp_FormItem1.visible","showIDLabel");
			result[6] = new Binding(this,null,null,"_EditAssetPopUp_FormItem1.includeInLayout","showIDLabel");
			result[7] = new Binding(this,null,null,"nameItem.label","nameLabel");
			result[8] = new Binding(this,null,null,"nameInput.enabled","nameLabelEditable");
			result[9] = new Binding(this,null,null,"tagsItem.label","tagsLabel");
			result[10] = new Binding(this,null,null,"tagsItem.visible","showTags");
			result[11] = new Binding(this,null,null,"tagsItem.includeInLayout","showTags");
			result[12] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Category");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_EditAssetPopUp_FormItem4.label");
			result[13] = new Binding(this,function():Boolean
			{
				return _showCategoryInput;
			},null,"_EditAssetPopUp_FormItem4.visible");
			result[14] = new Binding(this,function():Boolean
			{
				return _showCategoryInput;
			},null,"_EditAssetPopUp_FormItem4.includeInLayout");
			result[15] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Public");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"publicCheckBox.label");
			result[16] = new Binding(this,function():Boolean
			{
				return _showPublicCheckBox;
			},null,"publicCheckBox.visible");
			result[17] = new Binding(this,function():Boolean
			{
				return _showPublicCheckBox;
			},null,"publicCheckBox.includeInLayout");
			result[18] = new Binding(this,null,null,"sharingItem.label","sharingLabel");
			result[19] = new Binding(this,null,null,"sharingItem.visible","showTeamSelection");
			result[20] = new Binding(this,null,null,"sharingItem.includeInLayout","showTeamSelection");
			result[21] = new Binding(this,null,null,"publishItem.visible","showPublishOptions");
			result[22] = new Binding(this,null,null,"publishItem.includeInLayout","showPublishOptions");
			result[23] = new Binding(this,null,null,"optionPublic.label","optionPublicLabel");
			result[24] = new Binding(this,null,null,"optionPrivate.label","optionPrivateLabel");
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
		public function get categoryInput() : TextInput
		{
			return this._318380396categoryInput;
		}
		
		public function set categoryInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._318380396categoryInput;
			if(_loc2_ !== param1)
			{
				this._318380396categoryInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryInput",_loc2_,param1));
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
		public function get editForm() : Form
		{
			return this._1601624558editForm;
		}
		
		public function set editForm(param1:Form) : void
		{
			var _loc2_:Object = this._1601624558editForm;
			if(_loc2_ !== param1)
			{
				this._1601624558editForm = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editForm",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get idInput() : TextInput
		{
			return this._1632326511idInput;
		}
		
		public function set idInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._1632326511idInput;
			if(_loc2_ !== param1)
			{
				this._1632326511idInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"idInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get nameInput() : TextInput
		{
			return this._1213385727nameInput;
		}
		
		public function set nameInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._1213385727nameInput;
			if(_loc2_ !== param1)
			{
				this._1213385727nameInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get nameItem() : FormItem
		{
			return this._1840262206nameItem;
		}
		
		public function set nameItem(param1:FormItem) : void
		{
			var _loc2_:Object = this._1840262206nameItem;
			if(_loc2_ !== param1)
			{
				this._1840262206nameItem = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameItem",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get optionPrivate() : RadioButton
		{
			return this._1355827378optionPrivate;
		}
		
		public function set optionPrivate(param1:RadioButton) : void
		{
			var _loc2_:Object = this._1355827378optionPrivate;
			if(_loc2_ !== param1)
			{
				this._1355827378optionPrivate = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionPrivate",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get optionPublic() : RadioButton
		{
			return this._1344289598optionPublic;
		}
		
		public function set optionPublic(param1:RadioButton) : void
		{
			var _loc2_:Object = this._1344289598optionPublic;
			if(_loc2_ !== param1)
			{
				this._1344289598optionPublic = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionPublic",_loc2_,param1));
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
		public function get publicCheckBox() : CheckBox
		{
			return this._2104639788publicCheckBox;
		}
		
		public function set publicCheckBox(param1:CheckBox) : void
		{
			var _loc2_:Object = this._2104639788publicCheckBox;
			if(_loc2_ !== param1)
			{
				this._2104639788publicCheckBox = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"publicCheckBox",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get publishItem() : FormItem
		{
			return this._614961982publishItem;
		}
		
		public function set publishItem(param1:FormItem) : void
		{
			var _loc2_:Object = this._614961982publishItem;
			if(_loc2_ !== param1)
			{
				this._614961982publishItem = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"publishItem",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sharingItem() : FormItem
		{
			return this._79172111sharingItem;
		}
		
		public function set sharingItem(param1:FormItem) : void
		{
			var _loc2_:Object = this._79172111sharingItem;
			if(_loc2_ !== param1)
			{
				this._79172111sharingItem = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharingItem",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tagsInput() : TextArea
		{
			return this._1670653135tagsInput;
		}
		
		public function set tagsInput(param1:TextArea) : void
		{
			var _loc2_:Object = this._1670653135tagsInput;
			if(_loc2_ !== param1)
			{
				this._1670653135tagsInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagsInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tagsItem() : FormItem
		{
			return this._746623284tagsItem;
		}
		
		public function set tagsItem(param1:FormItem) : void
		{
			var _loc2_:Object = this._746623284tagsItem;
			if(_loc2_ !== param1)
			{
				this._746623284tagsItem = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagsItem",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get teamDropDown() : MultiSelectionDropDown
		{
			return this._709119570teamDropDown;
		}
		
		public function set teamDropDown(param1:MultiSelectionDropDown) : void
		{
			var _loc2_:Object = this._709119570teamDropDown;
			if(_loc2_ !== param1)
			{
				this._709119570teamDropDown = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"teamDropDown",_loc2_,param1));
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
		public function get nameLabel() : String
		{
			return this._1215755049nameLabel;
		}
		
		public function set nameLabel(param1:String) : void
		{
			var _loc2_:Object = this._1215755049nameLabel;
			if(_loc2_ !== param1)
			{
				this._1215755049nameLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get nameLabelEditable() : Boolean
		{
			return this._1977152339nameLabelEditable;
		}
		
		public function set nameLabelEditable(param1:Boolean) : void
		{
			var _loc2_:Object = this._1977152339nameLabelEditable;
			if(_loc2_ !== param1)
			{
				this._1977152339nameLabelEditable = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nameLabelEditable",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tagsLabel() : String
		{
			return this._1668283813tagsLabel;
		}
		
		public function set tagsLabel(param1:String) : void
		{
			var _loc2_:Object = this._1668283813tagsLabel;
			if(_loc2_ !== param1)
			{
				this._1668283813tagsLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagsLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get showTags() : Boolean
		{
			return this._338838346showTags;
		}
		
		public function set showTags(param1:Boolean) : void
		{
			var _loc2_:Object = this._338838346showTags;
			if(_loc2_ !== param1)
			{
				this._338838346showTags = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showTags",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sharingLabel() : String
		{
			return this._1838430344sharingLabel;
		}
		
		public function set sharingLabel(param1:String) : void
		{
			var _loc2_:Object = this._1838430344sharingLabel;
			if(_loc2_ !== param1)
			{
				this._1838430344sharingLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sharingLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get optionPublicLabel() : String
		{
			return this._537548202optionPublicLabel;
		}
		
		public function set optionPublicLabel(param1:String) : void
		{
			var _loc2_:Object = this._537548202optionPublicLabel;
			if(_loc2_ !== param1)
			{
				this._537548202optionPublicLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionPublicLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get optionPrivateLabel() : String
		{
			return this._1182873670optionPrivateLabel;
		}
		
		public function set optionPrivateLabel(param1:String) : void
		{
			var _loc2_:Object = this._1182873670optionPrivateLabel;
			if(_loc2_ !== param1)
			{
				this._1182873670optionPrivateLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"optionPrivateLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get showPublishOptions() : Boolean
		{
			return this._411871980showPublishOptions;
		}
		
		public function set showPublishOptions(param1:Boolean) : void
		{
			var _loc2_:Object = this._411871980showPublishOptions;
			if(_loc2_ !== param1)
			{
				this._411871980showPublishOptions = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showPublishOptions",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get showTeamSelection() : Boolean
		{
			return this._1627881550showTeamSelection;
		}
		
		public function set showTeamSelection(param1:Boolean) : void
		{
			var _loc2_:Object = this._1627881550showTeamSelection;
			if(_loc2_ !== param1)
			{
				this._1627881550showTeamSelection = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showTeamSelection",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get showIDLabel() : Boolean
		{
			return this._1106722044showIDLabel;
		}
		
		public function set showIDLabel(param1:Boolean) : void
		{
			var _loc2_:Object = this._1106722044showIDLabel;
			if(_loc2_ !== param1)
			{
				this._1106722044showIDLabel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showIDLabel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _showCategoryInput() : Boolean
		{
			return this._143186672_showCategoryInput;
		}
		
		private function set _showCategoryInput(param1:Boolean) : void
		{
			var _loc2_:Object = this._143186672_showCategoryInput;
			if(_loc2_ !== param1)
			{
				this._143186672_showCategoryInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showCategoryInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _showPublicCheckBox() : Boolean
		{
			return this._968601640_showPublicCheckBox;
		}
		
		private function set _showPublicCheckBox(param1:Boolean) : void
		{
			var _loc2_:Object = this._968601640_showPublicCheckBox;
			if(_loc2_ !== param1)
			{
				this._968601640_showPublicCheckBox = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showPublicCheckBox",_loc2_,param1));
				}
			}
		}
	}
}
