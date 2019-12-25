package anifire.studio.components
{
	import anifire.event.CoreEvent;
	import anifire.studio.core.Console;
	import anifire.studio.managers.ThemeStarterManager;
	import anifire.studio.validators.AssetTitleValidator;
	import anifire.studio.validators.BadWordsValidator;
	import anifire.util.UtilDict;
	import anifire.util.UtilUser;
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
	import mx.collections.IList;
	import mx.core.ClassFactory;
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
	import spark.components.CheckBox;
	import spark.components.Form;
	import spark.components.FormItem;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Image;
	import spark.components.Label;
	import spark.components.Panel;
	import spark.components.TextInput;
	import spark.components.VGroup;
	import spark.events.IndexChangeEvent;
	import spark.primitives.Line;
	
	use namespace mx_internal;
	
	public class SaveStarterWindow extends DefaultPopUpContainer implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _SaveStarterWindow_BusyIndicator1:BusyIndicator;
		
		public var _SaveStarterWindow_Button1:Button;
		
		private var _452932911_SaveStarterWindow_Group2:Group;
		
		public var _SaveStarterWindow_HGroup1:HGroup;
		
		public var _SaveStarterWindow_Label1:Label;
		
		public var _SaveStarterWindow_PopUpContentBackground1:PopUpContentBackground;
		
		private var _1361128838chrome:Group;
		
		private var _312699062closeButton:Button;
		
		private var _1463430687movieTagsInput:TextInput;
		
		private var _229892636movieTagsItem:FormItem;
		
		private var _335076258movieTitleInput:TextInput;
		
		private var _106433028panel:Panel;
		
		private var _738625566replaceStarterCheckbox:CheckBox;
		
		private var _505459474replaceStarterItem:FormItem;
		
		private var _756861508starterTitleItem:FormItem;
		
		private var _913416787statusGroup:VGroup;
		
		private var _909318622statusLabel:Label;
		
		private var _671317191tagsValidator:BadWordsValidator;
		
		private var _2102685764themeStarterList:spark.components.DropDownList;
		
		private var _781644463thumbnailChooser:SceneThumbnailChooser;
		
		private var _259861466titleValidator:AssetTitleValidator;
		
		private var _7414133updateStarterImage:Image;
		
		private var _528206064validatorList:Array;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _thumbnails:Vector.<BitmapData>;
		
		private var _thumbnailIndex:int;
		
		private var _thumbnailSelectable:Boolean;
		
		private var _1750162258_themeStarters:ArrayCollection;
		
		private var _1117619342_displayAdminOptions:Boolean;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function SaveStarterWindow()
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
			bindings = this._SaveStarterWindow_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SaveStarterWindowWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return SaveStarterWindow[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveStarterWindow_Array6_c);
			this.currentState = "normal";
			this._SaveStarterWindow_Array5_i();
			var _SaveStarterWindow_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveStarterWindow_BusyIndicator1_i);
			var _SaveStarterWindow_Button2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveStarterWindow_Button2_i);
			var _SaveStarterWindow_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveStarterWindow_HGroup1_i);
			var _SaveStarterWindow_VGroup2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SaveStarterWindow_VGroup2_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SaveStarterWindow_Button2_factory,
					"destination":"chrome",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["panel"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_SaveStarterWindow_HGroup1_factory,
					"destination":"_SaveStarterWindow_Group2",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SaveStarterWindow_PopUpContentBackground1"]
				})]
			}),new State({
				"name":"loading",
				"stateGroups":["processing"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SaveStarterWindow_BusyIndicator1_factory,
					"destination":"statusGroup",
					"propertyName":"mxmlContent",
					"position":"first"
				}),new AddItems().initializeFromObject({
					"itemsFactory":_SaveStarterWindow_VGroup2_factory,
					"destination":"_SaveStarterWindow_Group2",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SaveStarterWindow_PopUpContentBackground1"]
				}),new SetProperty().initializeFromObject({
					"target":"panel",
					"name":"enabled",
					"value":false
				})]
			}),new State({
				"name":"error",
				"stateGroups":["processing"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SaveStarterWindow_VGroup2_factory,
					"destination":"_SaveStarterWindow_Group2",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SaveStarterWindow_PopUpContentBackground1"]
				}),new SetProperty().initializeFromObject({
					"target":"panel",
					"name":"enabled",
					"value":false
				}),new SetStyle().initializeFromObject({
					"target":"statusLabel",
					"name":"color",
					"value":16711680
				})]
			}),new State({
				"name":"complete",
				"stateGroups":["processing"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SaveStarterWindow_VGroup2_factory,
					"destination":"_SaveStarterWindow_Group2",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_SaveStarterWindow_PopUpContentBackground1"]
				}),new SetProperty().initializeFromObject({
					"target":"panel",
					"name":"enabled",
					"value":false
				}),new SetStyle().initializeFromObject({
					"target":"statusLabel",
					"name":"color",
					"value":32768
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
			SaveStarterWindow._watcherSetupUtil = param1;
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
		
		override protected function init() : void
		{
			super.init();
			if(this._thumbnails)
			{
				this.thumbnailChooser.init(this._thumbnails,this._thumbnailIndex);
				this.thumbnailChooser.editable = this._thumbnailSelectable;
			}
			this._displayAdminOptions = UtilUser.isContentAdmin;
			if(this._displayAdminOptions)
			{
				this._themeStarters = ThemeStarterManager.instance.starters;
				this.updateTargetStarterData(ThemeStarterManager.instance.getLastThemeStarterData());
			}
		}
		
		protected function updateTargetStarterData(param1:Object) : void
		{
			if(param1)
			{
				this.themeStarterList.selectedItem = param1;
				this.movieTitleInput.text = param1["title"];
				this.updateStarterImage.source = param1["thumbnail"];
			}
		}
		
		public function initSaveStarterWindow(param1:Vector.<BitmapData>, param2:Boolean = true, param3:int = 0) : void
		{
			this._thumbnails = param1;
			this._thumbnailIndex = param3;
			this._thumbnailSelectable = param2;
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
		
		private function saveStarter() : void
		{
			var _loc3_:Object = null;
			if(!this.validateMovieDetail())
			{
				return;
			}
			currentState = "loading";
			this.statusLabel.text = UtilDict.toDisplay("go","Preparing...");
			var _loc1_:Console = Console.getConsole();
			_loc1_.starterMetaData.title = this.movieTitleInput.text;
			_loc1_.starterMetaData.setUgcTagsByString(this.movieTagsInput.text);
			_loc1_.addEventListener(CoreEvent.SERIALIZE_COMPLETE,this.onSerializeComplete);
			_loc1_.addEventListener(CoreEvent.SAVE_STARTER_COMPLETE,this.onSaveComplete);
			_loc1_.addEventListener(CoreEvent.SAVE_STARTER_ERROR,this.onSaveError);
			var _loc2_:String = "";
			if(this._displayAdminOptions && this.replaceStarterCheckbox.selected)
			{
				_loc3_ = this.themeStarterList.selectedItem;
				if(_loc3_)
				{
					_loc2_ = _loc3_["id"];
				}
			}
			_loc1_.publishStarter(this.thumbnailChooser.selectedIndex,_loc2_);
		}
		
		private function removeConsoleListeners() : void
		{
			var _loc1_:Console = Console.getConsole();
			_loc1_.removeEventListener(CoreEvent.SERIALIZE_COMPLETE,this.onSerializeComplete);
			_loc1_.removeEventListener(CoreEvent.SAVE_STARTER_COMPLETE,this.onSaveComplete);
			_loc1_.removeEventListener(CoreEvent.SAVE_STARTER_ERROR,this.onSaveError);
		}
		
		private function onSerializeComplete(param1:Event) : void
		{
			this.statusLabel.text = UtilDict.toDisplay("go","Connecting to server...");
		}
		
		private function onSaveComplete(param1:Event) : void
		{
			this.removeConsoleListeners();
			currentState = "complete";
			this.statusLabel.text = UtilDict.toDisplay("go","Starter saved to Your Library");
			setTimeout(confirm,2000);
		}
		
		private function onSaveError(param1:Event) : void
		{
			this.removeConsoleListeners();
			currentState = "error";
			this.statusLabel.text = UtilDict.toDisplay("go","Cannot save starter.\nPlease try again later.");
			setTimeout(this.reset,2000);
		}
		
		private function reset() : void
		{
			currentState = "normal";
		}
		
		protected function themeStarterList_changeHandler(param1:IndexChangeEvent) : void
		{
			this.updateTargetStarterData(this.themeStarterList.selectedItem);
		}
		
		private function _SaveStarterWindow_Array5_i() : Array
		{
			var _loc1_:Array = [this._SaveStarterWindow_AssetTitleValidator1_i(),this._SaveStarterWindow_BadWordsValidator1_i()];
			this.validatorList = _loc1_;
			BindingManager.executeBindings(this,"validatorList",this.validatorList);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_AssetTitleValidator1_i() : AssetTitleValidator
		{
			var _loc1_:AssetTitleValidator = new AssetTitleValidator();
			_loc1_.property = "text";
			_loc1_.initialized(this,"titleValidator");
			this.titleValidator = _loc1_;
			BindingManager.executeBindings(this,"titleValidator",this.titleValidator);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_BadWordsValidator1_i() : BadWordsValidator
		{
			var _loc1_:BadWordsValidator = new BadWordsValidator();
			_loc1_.property = "text";
			_loc1_.initialized(this,"tagsValidator");
			this.tagsValidator = _loc1_;
			BindingManager.executeBindings(this,"tagsValidator",this.tagsValidator);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Array6_c() : Array
		{
			var _loc1_:Array = [this._SaveStarterWindow_Group1_i()];
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._SaveStarterWindow_Panel1_i()];
			_loc1_.id = "chrome";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.chrome = _loc1_;
			BindingManager.executeBindings(this,"chrome",this.chrome);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Panel1_i() : Panel
		{
			var _loc1_:Panel = new Panel();
			_loc1_.width = 616;
			_loc1_.minHeight = 320;
			_loc1_.controlBarContent = [this._SaveStarterWindow_Button1_i()];
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveStarterWindow_Array9_c);
			_loc1_.id = "panel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.panel = _loc1_;
			BindingManager.executeBindings(this,"panel",this.panel);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.styleName = "primary";
			_loc1_.addEventListener("click",this.___SaveStarterWindow_Button1_click);
			_loc1_.id = "_SaveStarterWindow_Button1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SaveStarterWindow_Button1 = _loc1_;
			BindingManager.executeBindings(this,"_SaveStarterWindow_Button1",this._SaveStarterWindow_Button1);
			return _loc1_;
		}
		
		public function ___SaveStarterWindow_Button1_click(param1:MouseEvent) : void
		{
			this.saveStarter();
		}
		
		private function _SaveStarterWindow_Array9_c() : Array
		{
			var _loc1_:Array = [this._SaveStarterWindow_Group2_i()];
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._SaveStarterWindow_PopUpContentBackground1_i()];
			_loc1_.id = "_SaveStarterWindow_Group2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SaveStarterWindow_Group2 = _loc1_;
			BindingManager.executeBindings(this,"_SaveStarterWindow_Group2",this._SaveStarterWindow_Group2);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_PopUpContentBackground1_i() : PopUpContentBackground
		{
			var _loc1_:PopUpContentBackground = new PopUpContentBackground();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.id = "_SaveStarterWindow_PopUpContentBackground1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SaveStarterWindow_PopUpContentBackground1 = _loc1_;
			BindingManager.executeBindings(this,"_SaveStarterWindow_PopUpContentBackground1",this._SaveStarterWindow_PopUpContentBackground1);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 20;
			_loc1_.paddingLeft = 28;
			_loc1_.paddingRight = 28;
			_loc1_.paddingTop = 25;
			_loc1_.paddingBottom = 25;
			_loc1_.mxmlContent = [this._SaveStarterWindow_Form1_c(),this._SaveStarterWindow_Line1_c(),this._SaveStarterWindow_VGroup1_c()];
			_loc1_.id = "_SaveStarterWindow_HGroup1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SaveStarterWindow_HGroup1 = _loc1_;
			BindingManager.executeBindings(this,"_SaveStarterWindow_HGroup1",this._SaveStarterWindow_HGroup1);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Form1_c() : Form
		{
			var _loc1_:Form = new Form();
			_loc1_.percentWidth = 100;
			_loc1_.styleName = "publish";
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveStarterWindow_Array12_c);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Array12_c() : Array
		{
			var _loc1_:Array = [this._SaveStarterWindow_FormItem1_i(),this._SaveStarterWindow_FormItem2_i(),this._SaveStarterWindow_FormItem3_i()];
			return _loc1_;
		}
		
		private function _SaveStarterWindow_FormItem1_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.required = true;
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveStarterWindow_Array13_c);
			_loc1_.id = "starterTitleItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.starterTitleItem = _loc1_;
			BindingManager.executeBindings(this,"starterTitleItem",this.starterTitleItem);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Array13_c() : Array
		{
			var _loc1_:Array = [this._SaveStarterWindow_TextInput1_i()];
			return _loc1_;
		}
		
		private function _SaveStarterWindow_TextInput1_i() : TextInput
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
		
		private function _SaveStarterWindow_FormItem2_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveStarterWindow_Array14_c);
			_loc1_.id = "replaceStarterItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.replaceStarterItem = _loc1_;
			BindingManager.executeBindings(this,"replaceStarterItem",this.replaceStarterItem);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Array14_c() : Array
		{
			var _loc1_:Array = [this._SaveStarterWindow_HGroup2_c()];
			return _loc1_;
		}
		
		private function _SaveStarterWindow_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.verticalAlign = "baseline";
			_loc1_.mxmlContent = [this._SaveStarterWindow_CheckBox1_i(),this._SaveStarterWindow_DropDownList1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _SaveStarterWindow_CheckBox1_i() : CheckBox
		{
			var _loc1_:CheckBox = new CheckBox();
			_loc1_.id = "replaceStarterCheckbox";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.replaceStarterCheckbox = _loc1_;
			BindingManager.executeBindings(this,"replaceStarterCheckbox",this.replaceStarterCheckbox);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_DropDownList1_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.percentWidth = 100;
			_loc1_.useVirtualLayout = true;
			_loc1_.itemRenderer = this._SaveStarterWindow_ClassFactory1_c();
			_loc1_.labelField = "title";
			_loc1_.addEventListener("change",this.__themeStarterList_change);
			_loc1_.id = "themeStarterList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.themeStarterList = _loc1_;
			BindingManager.executeBindings(this,"themeStarterList",this.themeStarterList);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_ClassFactory1_c() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = StarterInfoRenderer;
			return _loc1_;
		}
		
		public function __themeStarterList_change(param1:IndexChangeEvent) : void
		{
			this.themeStarterList_changeHandler(param1);
		}
		
		private function _SaveStarterWindow_FormItem3_i() : FormItem
		{
			var _loc1_:FormItem = new FormItem();
			_loc1_.helpContent = [this._SaveStarterWindow_Label1_i()];
			_loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SaveStarterWindow_Array17_c);
			_loc1_.id = "movieTagsItem";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.movieTagsItem = _loc1_;
			BindingManager.executeBindings(this,"movieTagsItem",this.movieTagsItem);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("color",10066329);
			_loc1_.id = "_SaveStarterWindow_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SaveStarterWindow_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_SaveStarterWindow_Label1",this._SaveStarterWindow_Label1);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Array17_c() : Array
		{
			var _loc1_:Array = [this._SaveStarterWindow_TextInput2_i()];
			return _loc1_;
		}
		
		private function _SaveStarterWindow_TextInput2_i() : TextInput
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
		
		private function _SaveStarterWindow_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentHeight = 100;
			_loc1_.stroke = this._SaveStarterWindow_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 13421772;
			return _loc1_;
		}
		
		private function _SaveStarterWindow_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.width = 190;
			_loc1_.mxmlContent = [this._SaveStarterWindow_SceneThumbnailChooser1_i(),this._SaveStarterWindow_Image1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _SaveStarterWindow_SceneThumbnailChooser1_i() : SceneThumbnailChooser
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
		
		private function _SaveStarterWindow_Image1_i() : Image
		{
			var _loc1_:Image = new Image();
			_loc1_.width = 190;
			_loc1_.height = 110;
			_loc1_.id = "updateStarterImage";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.updateStarterImage = _loc1_;
			BindingManager.executeBindings(this,"updateStarterImage",this.updateStarterImage);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_VGroup2_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.verticalAlign = "middle";
			_loc1_.horizontalAlign = "center";
			_loc1_.gap = 20;
			_loc1_.mxmlContent = [this._SaveStarterWindow_Label2_i()];
			_loc1_.id = "statusGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.statusGroup = _loc1_;
			BindingManager.executeBindings(this,"statusGroup",this.statusGroup);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_BusyIndicator1_i() : BusyIndicator
		{
			var _loc1_:BusyIndicator = new BusyIndicator();
			_loc1_.width = 60;
			_loc1_.height = 60;
			_loc1_.id = "_SaveStarterWindow_BusyIndicator1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SaveStarterWindow_BusyIndicator1 = _loc1_;
			BindingManager.executeBindings(this,"_SaveStarterWindow_BusyIndicator1",this._SaveStarterWindow_BusyIndicator1);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("fontSize",14);
			_loc1_.id = "statusLabel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.statusLabel = _loc1_;
			BindingManager.executeBindings(this,"statusLabel",this.statusLabel);
			return _loc1_;
		}
		
		private function _SaveStarterWindow_Button2_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.styleName = "closePopUp";
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
		
		private function _SaveStarterWindow_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,null,null,"titleValidator.source","movieTitleInput");
			result[1] = new Binding(this,null,null,"tagsValidator.source","movieTagsInput");
			result[2] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Save a new starter");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"panel.title");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Save Starter");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_SaveStarterWindow_Button1.label");
			result[4] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Title");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"starterTitleItem.label");
			result[5] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Update Starter");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"replaceStarterItem.label");
			result[6] = new Binding(this,function():Boolean
			{
				return _displayAdminOptions;
			},null,"replaceStarterItem.visible");
			result[7] = new Binding(this,function():Boolean
			{
				return _displayAdminOptions;
			},null,"replaceStarterItem.includeInLayout");
			result[8] = new Binding(this,function():Boolean
			{
				return replaceStarterCheckbox.selected;
			},null,"themeStarterList.enabled");
			result[9] = new Binding(this,function():IList
			{
				return _themeStarters;
			},null,"themeStarterList.dataProvider");
			result[10] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Tags");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"movieTagsItem.label");
			result[11] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("(Optional)");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_SaveStarterWindow_Label1.text");
			result[12] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Separate with commas, e.g. Comedy, Romance");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"movieTagsInput.prompt");
			result[13] = new Binding(this,function():Boolean
			{
				return _displayAdminOptions;
			},null,"updateStarterImage.visible");
			result[14] = new Binding(this,function():Boolean
			{
				return _displayAdminOptions;
			},null,"updateStarterImage.includeInLayout");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _SaveStarterWindow_Group2() : Group
		{
			return this._452932911_SaveStarterWindow_Group2;
		}
		
		public function set _SaveStarterWindow_Group2(param1:Group) : void
		{
			var _loc2_:Object = this._452932911_SaveStarterWindow_Group2;
			if(_loc2_ !== param1)
			{
				this._452932911_SaveStarterWindow_Group2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SaveStarterWindow_Group2",_loc2_,param1));
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
		public function get replaceStarterCheckbox() : CheckBox
		{
			return this._738625566replaceStarterCheckbox;
		}
		
		public function set replaceStarterCheckbox(param1:CheckBox) : void
		{
			var _loc2_:Object = this._738625566replaceStarterCheckbox;
			if(_loc2_ !== param1)
			{
				this._738625566replaceStarterCheckbox = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"replaceStarterCheckbox",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get replaceStarterItem() : FormItem
		{
			return this._505459474replaceStarterItem;
		}
		
		public function set replaceStarterItem(param1:FormItem) : void
		{
			var _loc2_:Object = this._505459474replaceStarterItem;
			if(_loc2_ !== param1)
			{
				this._505459474replaceStarterItem = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"replaceStarterItem",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get starterTitleItem() : FormItem
		{
			return this._756861508starterTitleItem;
		}
		
		public function set starterTitleItem(param1:FormItem) : void
		{
			var _loc2_:Object = this._756861508starterTitleItem;
			if(_loc2_ !== param1)
			{
				this._756861508starterTitleItem = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"starterTitleItem",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get statusGroup() : VGroup
		{
			return this._913416787statusGroup;
		}
		
		public function set statusGroup(param1:VGroup) : void
		{
			var _loc2_:Object = this._913416787statusGroup;
			if(_loc2_ !== param1)
			{
				this._913416787statusGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"statusGroup",_loc2_,param1));
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
		public function get themeStarterList() : spark.components.DropDownList
		{
			return this._2102685764themeStarterList;
		}
		
		public function set themeStarterList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._2102685764themeStarterList;
			if(_loc2_ !== param1)
			{
				this._2102685764themeStarterList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeStarterList",_loc2_,param1));
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
		public function get updateStarterImage() : Image
		{
			return this._7414133updateStarterImage;
		}
		
		public function set updateStarterImage(param1:Image) : void
		{
			var _loc2_:Object = this._7414133updateStarterImage;
			if(_loc2_ !== param1)
			{
				this._7414133updateStarterImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"updateStarterImage",_loc2_,param1));
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
		private function get _themeStarters() : ArrayCollection
		{
			return this._1750162258_themeStarters;
		}
		
		private function set _themeStarters(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._1750162258_themeStarters;
			if(_loc2_ !== param1)
			{
				this._1750162258_themeStarters = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_themeStarters",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _displayAdminOptions() : Boolean
		{
			return this._1117619342_displayAdminOptions;
		}
		
		private function set _displayAdminOptions(param1:Boolean) : void
		{
			var _loc2_:Object = this._1117619342_displayAdminOptions;
			if(_loc2_ !== param1)
			{
				this._1117619342_displayAdminOptions = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayAdminOptions",_loc2_,param1));
				}
			}
		}
	}
}
