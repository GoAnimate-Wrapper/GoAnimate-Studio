package anifire.studio.components
{
	import anifire.event.ColorPaletteEvent;
	import anifire.event.WidgetEvent;
	import anifire.studio.commands.ChangeWidgetColorPaletteCommand;
	import anifire.studio.commands.ChangeWidgetColorSetCommand;
	import anifire.studio.commands.ChangeWidgetSelectedDayCommand;
	import anifire.studio.commands.ChangeWidgetSelectedMonthCommand;
	import anifire.studio.commands.ChangeWidgetSelectedYearCommand;
	import anifire.studio.commands.ChangeWidgetTitleCommand;
	import anifire.studio.commands.ICommand;
	import anifire.studio.core.Widget;
	import anifire.studio.core.WidgetStyleFactory;
	import anifire.studio.models.ColorPaletteModel;
	import anifire.studio.skins.DefaultValueTextInputEditButtonSkin;
	import anifire.util.UtilDict;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.globalization.DateTimeFormatter;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Spacer;
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
	import spark.components.ComboBox;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.VGroup;
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	import spark.primitives.Line;
	
	use namespace mx_internal;
	
	public class CalendarDataPanel extends WidgetPanelBase implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _191555869_CalendarDataPanel_Button1:Button;
		
		private var _97320454_CalendarDataPanel_HGroup3:HGroup;
		
		public var _CalendarDataPanel_HGroup5:HGroup;
		
		private var _97320449_CalendarDataPanel_HGroup8:HGroup;
		
		public var _CalendarDataPanel_HelpButton1:HelpButton;
		
		public var _CalendarDataPanel_Label1:Label;
		
		private var _273449504_CalendarDataPanel_Label2:Label;
		
		public var _CalendarDataPanel_Label3:Label;
		
		public var _CalendarDataPanel_Label4:Label;
		
		private var _273449507_CalendarDataPanel_Label5:Label;
		
		public var _CalendarDataPanel_Label6:Label;
		
		public var _CalendarDataPanel_Line2:Line;
		
		private var _1976803428_CalendarDataPanel_SetProperty1:SetProperty;
		
		private var _1976803427_CalendarDataPanel_SetProperty2:SetProperty;
		
		private var _557170808_CalendarDataPanel_VGroup3:VGroup;
		
		private var _1987098563backgroundColorPicker:ColorPaletteDropDown;
		
		private var _93510726colorPalettePicker:ColorPalettePicker;
		
		private var _377789318dataPanel:VGroup;
		
		private var _416040531dateSelector:HGroup;
		
		private var _429675989dayDropDownList:spark.components.DropDownList;
		
		private var _25385008endDayDropDownList:spark.components.DropDownList;
		
		private var _985746290foregroundColorPicker:ColorPaletteDropDown;
		
		private var _2085294863monthDropDownList:spark.components.DropDownList;
		
		private var _311588645titleTextInput:DefaultValueTextInput;
		
		private var _1486603596yearDropDownList:ComboBox;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _command:ICommand;
		
		protected var _palette:ColorPaletteModel;
		
		protected var _colorPaletteList:ArrayCollection;
		
		private var _1506017727_monthList:ArrayCollection;
		
		private var _1449560102_yearList:ArrayCollection;
		
		private var _639848184_defaultDayList:ArrayCollection;
		
		private var _489545445_dayList:ArrayCollection;
		
		private var _1531952482_endDayList:ArrayCollection;
		
		private var _formatter:DateTimeFormatter;
		
		private var _today:Date;
		
		private var _remainingTextHint:String;
		
		private var _monthArray:Array;
		
		private var _changeWidgetColorSetCommand:ChangeWidgetColorSetCommand;
		
		private var _defaultTextDate:Date;
		
		private var _embed_mxml__styles_images_icons_icon_trash_png_1084368649:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function CalendarDataPanel()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._1506017727_monthList = new ArrayCollection();
			this._1449560102_yearList = new ArrayCollection();
			this._639848184_defaultDayList = new ArrayCollection();
			this._489545445_dayList = new ArrayCollection();
			this._1531952482_endDayList = new ArrayCollection();
			this._today = new Date();
			this._monthArray = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
			this._embed_mxml__styles_images_icons_icon_trash_png_1084368649 = CalendarDataPanel__embed_mxml__styles_images_icons_icon_trash_png_1084368649;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._CalendarDataPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CalendarDataPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return CalendarDataPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CalendarDataPanel_Array2_c);
			this.currentState = "calendar";
			var _CalendarDataPanel_HelpButton1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CalendarDataPanel_HelpButton1_i);
			var _CalendarDataPanel_Line2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CalendarDataPanel_Line2_i);
			states = [new State({
				"name":"calendar",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_CalendarDataPanel_Line2_factory,
					"destination":"_CalendarDataPanel_VGroup3",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_CalendarDataPanel_HGroup5"]
				}),new AddItems().initializeFromObject({
					"itemsFactory":_CalendarDataPanel_HelpButton1_factory,
					"destination":"_CalendarDataPanel_HGroup3",
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_CalendarDataPanel_Label2"]
				})]
			}),new State({
				"name":"date",
				"overrides":[this._CalendarDataPanel_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
					"isBaseValueDataBound":true,
					"target":"_CalendarDataPanel_Label2",
					"name":"text",
					"value":undefined
				})),this._CalendarDataPanel_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
					"isBaseValueDataBound":true,
					"target":"_CalendarDataPanel_Label5",
					"name":"text",
					"value":undefined
				})),new SetProperty().initializeFromObject({
					"target":"_CalendarDataPanel_Button1",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_CalendarDataPanel_HGroup8",
					"name":"visible",
					"value":false
				})]
			})];
			BindingManager.executeBindings(this,"_CalendarDataPanel_SetProperty1",this._CalendarDataPanel_SetProperty1);
			BindingManager.executeBindings(this,"_CalendarDataPanel_SetProperty2",this._CalendarDataPanel_SetProperty2);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			CalendarDataPanel._watcherSetupUtil = param1;
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
		
		override public function set widget(param1:Widget) : void
		{
			super.widget = param1;
			this.updateLayoutList();
		}
		
		override protected function onWidgetDataChange(param1:WidgetEvent) : void
		{
			this.updateUI();
		}
		
		override protected function onWidgetStyleChange(param1:WidgetEvent) : void
		{
			this.updateColorPickers();
		}
		
		private function updateColorPickers() : void
		{
			if(_widget && _widget.styleModel && _widget.styleModel.colorSet)
			{
				if(_widget.styleModel.colorSet.length > 0)
				{
					this.backgroundColorPicker.selectedColor = _widget.styleModel.colorSet[0];
				}
				if(_widget.styleModel.colorSet.length > 1)
				{
					this.foregroundColorPicker.selectedColor = _widget.styleModel.colorSet[1];
				}
				this._palette = _widget.colorPalette;
				if(!this._palette)
				{
					this._palette = new ColorPaletteModel();
					this._palette.initByStyleModel(_widget.styleModel);
				}
				this.colorPalettePicker.selectedColorPalette = this._palette;
			}
		}
		
		private function getDefaultText(param1:Date) : String
		{
			this._defaultTextDate.month = param1.month;
			return this._monthArray[this._defaultTextDate.month] + " " + param1.fullYear;
		}
		
		private function updateLayoutList() : void
		{
			if(_widget.chartType == "calendar")
			{
				this.currentState = "calendar";
				if(_widget.selectedDate)
				{
					this.dateSelector.visible = true;
				}
				else
				{
					this.dateSelector.visible = false;
				}
			}
			else
			{
				this.currentState = "date";
				this.dateSelector.visible = true;
			}
		}
		
		override protected function updateUI() : void
		{
			var _loc1_:int = 0;
			if(initialized && _widget)
			{
				this.titleTextInput.defaultText = this.getDefaultText(_widget.currentDate);
				if(_widget.title)
				{
					this.titleTextInput.text = _widget.title;
				}
				else if(_widget.currentDate)
				{
					this.titleTextInput.text = this.titleTextInput.defaultText;
				}
				_loc1_ = _widget.selectedYear - this._yearList[0].data;
				if(_loc1_ >= 0 && _loc1_ < this._yearList.length)
				{
					this.yearDropDownList.selectedIndex = _loc1_;
					this.yearDropDownList.textInput.text = _widget.selectedYear.toString();
				}
				else
				{
					this.yearDropDownList.textInput.text = _widget.selectedYear.toString();
				}
				this.monthDropDownList.selectedIndex = _widget.selectedMonth - 1;
				this.updateDayList();
				this.updateEndDayList();
				this.dayDropDownList.selectedIndex = _widget.selectedDate - 1;
				if(_widget.selectedDateEnd)
				{
					this.endDayDropDownList.selectedIndex = _widget.selectedDateEnd - _widget.selectedDate;
				}
				else
				{
					this.endDayDropDownList.selectedIndex = 0;
				}
				if(_widget.chartType == "calendar")
				{
					if(_widget.selectedDate)
					{
						this.dateSelector.visible = true;
					}
					else
					{
						this.dateSelector.visible = false;
					}
				}
				this.updateColorPickers();
			}
		}
		
		private function updateDayList() : void
		{
			this._dayList.removeAll();
			var _loc1_:Date = new Date(_widget.selectedYear,_widget.selectedMonth,0);
			var _loc2_:Number = _loc1_.getDate();
			var _loc3_:uint = 0;
			while(_loc3_ < _loc2_)
			{
				this._dayList.addItem(this._defaultDayList.getItemAt(_loc3_));
				_loc3_++;
			}
		}
		
		private function updateEndDayList() : void
		{
			this._endDayList.removeAll();
			this._endDayList.addItem({
				"data":0,
				"label":"---"
			});
			var _loc1_:int = _widget.selectedDate;
			var _loc2_:uint = _loc1_;
			while(_loc2_ < this._dayList.length)
			{
				this._endDayList.addItem(this._dayList.getItemAt(_loc2_));
				_loc2_++;
			}
		}
		
		override protected function init() : void
		{
			var _loc2_:uint = 0;
			var _loc3_:uint = 0;
			var _loc4_:uint = 0;
			var _loc1_:uint = 0;
			_loc1_ = 0;
			while(_loc1_ < 22)
			{
				_loc2_ = this._today.fullYear - 20 + _loc1_;
				this._yearList.addItem({
					"data":_loc2_,
					"label":_loc2_
				});
				_loc1_++;
			}
			_loc1_ = 0;
			while(_loc1_ < 12)
			{
				_loc3_ = _loc1_ + 1;
				this._monthList.addItem({
					"data":_loc3_,
					"label":_loc3_
				});
				_loc1_++;
			}
			_loc1_ = 0;
			while(_loc1_ < 31)
			{
				_loc4_ = _loc1_ + 1;
				this._defaultDayList.addItem({
					"data":_loc4_,
					"label":_loc4_
				});
				_loc1_++;
			}
			this._formatter = new DateTimeFormatter("en-US");
			this._formatter.setDateTimePattern("MMMM ");
			this._remainingTextHint = UtilDict.toDisplay("go","{0} characters remaining");
			this._defaultTextDate = new Date();
			var _loc5_:WidgetStyleFactory = WidgetStyleFactory.instance;
			this._colorPaletteList = new ArrayCollection();
			this._colorPaletteList.addItem(_loc5_.businessLightCalendarPalette);
			this._colorPaletteList.addItem(_loc5_.businessDarkCalendarPalette);
			this._colorPaletteList.addItem(_loc5_.retroLightCalendarPalette);
			this._colorPaletteList.addItem(_loc5_.retroDarkCalendarPalette);
			this._colorPaletteList.addItem(_loc5_.pastelLightCalendarPalette);
			this._colorPaletteList.addItem(_loc5_.pastelDarkCalendarPalette);
			this.colorPalettePicker.dataProvider = this._colorPaletteList;
			super.init();
		}
		
		private function monthDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:int = 0;
			if(_widget)
			{
				_loc2_ = int(this.monthDropDownList.selectedItem.data);
				this._command = new ChangeWidgetSelectedMonthCommand(_widget,_loc2_);
				this._command.execute();
			}
		}
		
		private function yearDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:int = 0;
			if(_widget && this.yearDropDownList.selectedItem)
			{
				_loc2_ = int(this.yearDropDownList.selectedItem.data);
				this._command = new ChangeWidgetSelectedYearCommand(_widget,_loc2_);
				this._command.execute();
			}
		}
		
		private function labelToItemFunc(param1:String) : Object
		{
			return {
				"data":param1,
				"label":param1
			};
		}
		
		private function dayDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:int = 0;
			if(_widget)
			{
				_loc2_ = int(this.dayDropDownList.selectedItem.data);
				this._command = new ChangeWidgetSelectedDayCommand(_widget,_loc2_,_widget.selectedDateEnd);
				this._command.execute();
			}
		}
		
		private function endDayDropDownList_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:int = 0;
			if(_widget)
			{
				_loc2_ = int(this.endDayDropDownList.selectedItem.data);
				this._command = new ChangeWidgetSelectedDayCommand(_widget,_widget.selectedDate,_loc2_);
				this._command.execute();
			}
		}
		
		protected function titleTextInput_changeHandler(param1:TextOperationEvent) : void
		{
			var _loc2_:String = null;
			if(_widget)
			{
				_loc2_ = this.titleTextInput.text == this.titleTextInput.defaultText?"":this.titleTextInput.text;
				_widget.title = _loc2_;
			}
		}
		
		protected function titleTextInput_focusInHandler(param1:Event) : void
		{
			if(_widget)
			{
				this._command = new ChangeWidgetTitleCommand(_widget,_widget.title);
			}
		}
		
		protected function titleTextInput_focusOutHandler(param1:Event) : void
		{
			var _loc2_:String = null;
			if(this._command is ChangeWidgetTitleCommand)
			{
				_loc2_ = this.titleTextInput.text == this.titleTextInput.defaultText?"":this.titleTextInput.text;
				(this._command as ChangeWidgetTitleCommand).executeNow(_loc2_);
			}
		}
		
		protected function titleTextInput_enterHandler(param1:Event) : void
		{
			var _loc2_:String = null;
			if(this._command is ChangeWidgetTitleCommand)
			{
				_loc2_ = this.titleTextInput.text == this.titleTextInput.defaultText?"":this.titleTextInput.text;
				(this._command as ChangeWidgetTitleCommand).executeNow(_loc2_);
				this._command = new ChangeWidgetTitleCommand(_widget,_widget.title);
			}
		}
		
		protected function addDayButton_clickHandler(param1:MouseEvent) : void
		{
			var _loc2_:Date = null;
			if(_widget)
			{
				_loc2_ = new Date();
				this._command = new ChangeWidgetSelectedDayCommand(_widget,_loc2_.date,0);
				this._command.execute();
			}
		}
		
		protected function removeDay_clickHandler(param1:MouseEvent) : void
		{
			if(_widget)
			{
				this._command = new ChangeWidgetSelectedDayCommand(_widget,0,0);
				this._command.execute();
			}
		}
		
		protected function colorPicker_colorChangeHandler(param1:Event) : void
		{
			var _loc2_:Array = null;
			if(_widget)
			{
				_loc2_ = _widget.styleModel.colorSet.concat();
				_loc2_[0] = this.backgroundColorPicker.selectedColor;
				_loc2_[1] = this.foregroundColorPicker.selectedColor;
				this.startChangingColor(_loc2_);
				_widget.colorSet = _loc2_;
				this._changeWidgetColorSetCommand = null;
			}
		}
		
		protected function colorPicker_colorPreviewHandler(param1:ColorPaletteEvent) : void
		{
			var _loc2_:Array = null;
			if(_widget)
			{
				_loc2_ = _widget.styleModel.colorSet.concat();
				_loc2_[0] = this.backgroundColorPicker.previewColor;
				_loc2_[1] = this.foregroundColorPicker.previewColor;
				this.startChangingColor(_loc2_);
				_widget.colorSet = _loc2_;
			}
		}
		
		protected function startChangingColor(param1:Array) : void
		{
			if(!this._changeWidgetColorSetCommand)
			{
				this._changeWidgetColorSetCommand = new ChangeWidgetColorSetCommand(_widget,param1);
				this._changeWidgetColorSetCommand.execute();
			}
			else
			{
				this._changeWidgetColorSetCommand.newColorSet = param1;
			}
		}
		
		protected function colorPalettePicker_changeHandler(param1:IndexChangeEvent) : void
		{
			var _loc2_:ChangeWidgetColorPaletteCommand = null;
			if(_widget)
			{
				_loc2_ = new ChangeWidgetColorPaletteCommand(_widget,this.colorPalettePicker.selectedColorPalette);
				_loc2_.execute();
			}
		}
		
		private function _CalendarDataPanel_Array2_c() : Array
		{
			var _loc1_:Array = [this._CalendarDataPanel_VGroup1_i()];
			return _loc1_;
		}
		
		private function _CalendarDataPanel_VGroup1_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.clipAndEnableScrolling = true;
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.gap = 0;
			_loc1_.mxmlContent = [this._CalendarDataPanel_VGroup2_c(),this._CalendarDataPanel_Line1_c(),this._CalendarDataPanel_VGroup3_i()];
			_loc1_.id = "dataPanel";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dataPanel = _loc1_;
			BindingManager.executeBindings(this,"dataPanel",this.dataPanel);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_VGroup2_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.paddingLeft = 15;
			_loc1_.paddingRight = 15;
			_loc1_.paddingTop = 15;
			_loc1_.paddingBottom = 15;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._CalendarDataPanel_HGroup1_c(),this._CalendarDataPanel_HGroup2_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CalendarDataPanel_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._CalendarDataPanel_Label1_i(),this._CalendarDataPanel_Spacer1_c(),this._CalendarDataPanel_ColorPalettePicker1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.id = "_CalendarDataPanel_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_Label1",this._CalendarDataPanel_Label1);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Spacer1_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.percentWidth = 100;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CalendarDataPanel_ColorPalettePicker1_i() : ColorPalettePicker
		{
			var _loc1_:ColorPalettePicker = new ColorPalettePicker();
			_loc1_.addEventListener("change",this.__colorPalettePicker_change);
			_loc1_.id = "colorPalettePicker";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.colorPalettePicker = _loc1_;
			BindingManager.executeBindings(this,"colorPalettePicker",this.colorPalettePicker);
			return _loc1_;
		}
		
		public function __colorPalettePicker_change(param1:IndexChangeEvent) : void
		{
			this.colorPalettePicker_changeHandler(param1);
		}
		
		private function _CalendarDataPanel_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._CalendarDataPanel_DefaultValueTextInput1_i(),this._CalendarDataPanel_ColorPaletteDropDown1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CalendarDataPanel_DefaultValueTextInput1_i() : DefaultValueTextInput
		{
			var _loc1_:DefaultValueTextInput = new DefaultValueTextInput();
			_loc1_.percentWidth = 100;
			_loc1_.maxChars = 500;
			_loc1_.addEventListener("change",this.__titleTextInput_change);
			_loc1_.addEventListener("focusIn",this.__titleTextInput_focusIn);
			_loc1_.addEventListener("focusOut",this.__titleTextInput_focusOut);
			_loc1_.addEventListener("enter",this.__titleTextInput_enter);
			_loc1_.id = "titleTextInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.titleTextInput = _loc1_;
			BindingManager.executeBindings(this,"titleTextInput",this.titleTextInput);
			return _loc1_;
		}
		
		public function __titleTextInput_change(param1:TextOperationEvent) : void
		{
			this.titleTextInput_changeHandler(param1);
		}
		
		public function __titleTextInput_focusIn(param1:FocusEvent) : void
		{
			this.titleTextInput_focusInHandler(param1);
		}
		
		public function __titleTextInput_focusOut(param1:FocusEvent) : void
		{
			this.titleTextInput_focusOutHandler(param1);
		}
		
		public function __titleTextInput_enter(param1:FlexEvent) : void
		{
			this.titleTextInput_enterHandler(param1);
		}
		
		private function _CalendarDataPanel_ColorPaletteDropDown1_i() : ColorPaletteDropDown
		{
			var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
			_loc1_.addEventListener("colorChange",this.__backgroundColorPicker_colorChange);
			_loc1_.addEventListener("colorPreview",this.__backgroundColorPicker_colorPreview);
			_loc1_.id = "backgroundColorPicker";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.backgroundColorPicker = _loc1_;
			BindingManager.executeBindings(this,"backgroundColorPicker",this.backgroundColorPicker);
			return _loc1_;
		}
		
		public function __backgroundColorPicker_colorChange(param1:ColorPaletteEvent) : void
		{
			this.colorPicker_colorChangeHandler(param1);
		}
		
		public function __backgroundColorPicker_colorPreview(param1:ColorPaletteEvent) : void
		{
			this.colorPicker_colorPreviewHandler(param1);
		}
		
		private function _CalendarDataPanel_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.stroke = this._CalendarDataPanel_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 13421772;
			return _loc1_;
		}
		
		private function _CalendarDataPanel_VGroup3_i() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.percentWidth = 100;
			_loc1_.gap = 10;
			_loc1_.paddingLeft = 15;
			_loc1_.paddingRight = 15;
			_loc1_.paddingTop = 15;
			_loc1_.paddingBottom = 15;
			_loc1_.mxmlContent = [this._CalendarDataPanel_HGroup3_i(),this._CalendarDataPanel_HGroup4_c(),this._CalendarDataPanel_HGroup5_i(),this._CalendarDataPanel_HGroup6_c()];
			_loc1_.id = "_CalendarDataPanel_VGroup3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_VGroup3 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_VGroup3",this._CalendarDataPanel_VGroup3);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_HGroup3_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._CalendarDataPanel_Label2_i(),this._CalendarDataPanel_Spacer2_c(),this._CalendarDataPanel_ColorPaletteDropDown2_i()];
			_loc1_.id = "_CalendarDataPanel_HGroup3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_HGroup3 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_HGroup3",this._CalendarDataPanel_HGroup3);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("typographicCase","uppercase");
			_loc1_.id = "_CalendarDataPanel_Label2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_Label2 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_Label2",this._CalendarDataPanel_Label2);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_HelpButton1_i() : HelpButton
		{
			var _loc1_:HelpButton = new HelpButton();
			_loc1_.id = "_CalendarDataPanel_HelpButton1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_HelpButton1 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_HelpButton1",this._CalendarDataPanel_HelpButton1);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Spacer2_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.percentWidth = 100;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CalendarDataPanel_ColorPaletteDropDown2_i() : ColorPaletteDropDown
		{
			var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
			_loc1_.addEventListener("colorChange",this.__foregroundColorPicker_colorChange);
			_loc1_.addEventListener("colorPreview",this.__foregroundColorPicker_colorPreview);
			_loc1_.id = "foregroundColorPicker";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.foregroundColorPicker = _loc1_;
			BindingManager.executeBindings(this,"foregroundColorPicker",this.foregroundColorPicker);
			return _loc1_;
		}
		
		public function __foregroundColorPicker_colorChange(param1:ColorPaletteEvent) : void
		{
			this.colorPicker_colorChangeHandler(param1);
		}
		
		public function __foregroundColorPicker_colorPreview(param1:ColorPaletteEvent) : void
		{
			this.colorPicker_colorPreviewHandler(param1);
		}
		
		private function _CalendarDataPanel_HGroup4_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._CalendarDataPanel_Label3_i(),this._CalendarDataPanel_ComboBox1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Label3_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.width = 50;
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("color",9803424);
			_loc1_.id = "_CalendarDataPanel_Label3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_Label3 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_Label3",this._CalendarDataPanel_Label3);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_ComboBox1_i() : ComboBox
		{
			var _loc1_:ComboBox = new ComboBox();
			_loc1_.restrict = "0-9";
			_loc1_.maxChars = 4;
			_loc1_.width = 100;
			_loc1_.labelToItemFunction = this.labelToItemFunc;
			_loc1_.addEventListener("change",this.__yearDropDownList_change);
			_loc1_.id = "yearDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.yearDropDownList = _loc1_;
			BindingManager.executeBindings(this,"yearDropDownList",this.yearDropDownList);
			return _loc1_;
		}
		
		public function __yearDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.yearDropDownList_changeHandler(param1);
		}
		
		private function _CalendarDataPanel_HGroup5_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._CalendarDataPanel_Label4_i(),this._CalendarDataPanel_DropDownList1_i()];
			_loc1_.id = "_CalendarDataPanel_HGroup5";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_HGroup5 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_HGroup5",this._CalendarDataPanel_HGroup5);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Label4_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.width = 50;
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("color",9803424);
			_loc1_.id = "_CalendarDataPanel_Label4";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_Label4 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_Label4",this._CalendarDataPanel_Label4);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_DropDownList1_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.buttonMode = true;
			_loc1_.width = 60;
			_loc1_.addEventListener("change",this.__monthDropDownList_change);
			_loc1_.id = "monthDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.monthDropDownList = _loc1_;
			BindingManager.executeBindings(this,"monthDropDownList",this.monthDropDownList);
			return _loc1_;
		}
		
		public function __monthDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.monthDropDownList_changeHandler(param1);
		}
		
		private function _CalendarDataPanel_Line2_i() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentWidth = 100;
			_loc1_.stroke = this._CalendarDataPanel_SolidColorStroke2_c();
			_loc1_.initialized(this,"_CalendarDataPanel_Line2");
			this._CalendarDataPanel_Line2 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_Line2",this._CalendarDataPanel_Line2);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_SolidColorStroke2_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14540253;
			return _loc1_;
		}
		
		private function _CalendarDataPanel_HGroup6_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._CalendarDataPanel_Label5_i(),this._CalendarDataPanel_Group1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Label5_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.width = 50;
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("color",9803424);
			_loc1_.id = "_CalendarDataPanel_Label5";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_Label5 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_Label5",this._CalendarDataPanel_Label5);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Group1_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._CalendarDataPanel_Button1_i(),this._CalendarDataPanel_HGroup7_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.buttonMode = true;
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("skinClass",DefaultValueTextInputEditButtonSkin);
			_loc1_.addEventListener("click",this.___CalendarDataPanel_Button1_click);
			_loc1_.id = "_CalendarDataPanel_Button1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_Button1 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_Button1",this._CalendarDataPanel_Button1);
			return _loc1_;
		}
		
		public function ___CalendarDataPanel_Button1_click(param1:MouseEvent) : void
		{
			this.addDayButton_clickHandler(param1);
		}
		
		private function _CalendarDataPanel_HGroup7_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.verticalCenter = 0;
			_loc1_.mxmlContent = [this._CalendarDataPanel_DropDownList2_i(),this._CalendarDataPanel_HGroup8_i()];
			_loc1_.id = "dateSelector";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dateSelector = _loc1_;
			BindingManager.executeBindings(this,"dateSelector",this.dateSelector);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_DropDownList2_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.buttonMode = true;
			_loc1_.width = 60;
			_loc1_.addEventListener("change",this.__dayDropDownList_change);
			_loc1_.id = "dayDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dayDropDownList = _loc1_;
			BindingManager.executeBindings(this,"dayDropDownList",this.dayDropDownList);
			return _loc1_;
		}
		
		public function __dayDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.dayDropDownList_changeHandler(param1);
		}
		
		private function _CalendarDataPanel_HGroup8_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._CalendarDataPanel_Label6_i(),this._CalendarDataPanel_DropDownList3_i(),this._CalendarDataPanel_IconButton1_c()];
			_loc1_.id = "_CalendarDataPanel_HGroup8";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_HGroup8 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_HGroup8",this._CalendarDataPanel_HGroup8);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_Label6_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.id = "_CalendarDataPanel_Label6";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._CalendarDataPanel_Label6 = _loc1_;
			BindingManager.executeBindings(this,"_CalendarDataPanel_Label6",this._CalendarDataPanel_Label6);
			return _loc1_;
		}
		
		private function _CalendarDataPanel_DropDownList3_i() : spark.components.DropDownList
		{
			var _loc1_:spark.components.DropDownList = new spark.components.DropDownList();
			_loc1_.buttonMode = true;
			_loc1_.width = 60;
			_loc1_.prompt = "--";
			_loc1_.addEventListener("change",this.__endDayDropDownList_change);
			_loc1_.id = "endDayDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.endDayDropDownList = _loc1_;
			BindingManager.executeBindings(this,"endDayDropDownList",this.endDayDropDownList);
			return _loc1_;
		}
		
		public function __endDayDropDownList_change(param1:IndexChangeEvent) : void
		{
			this.endDayDropDownList_changeHandler(param1);
		}
		
		private function _CalendarDataPanel_IconButton1_c() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.buttonMode = true;
			_loc1_.width = 20;
			_loc1_.percentHeight = 100;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_icons_icon_trash_png_1084368649);
			_loc1_.addEventListener("click",this.___CalendarDataPanel_IconButton1_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___CalendarDataPanel_IconButton1_click(param1:MouseEvent) : void
		{
			this.removeDay_clickHandler(param1);
		}
		
		private function _CalendarDataPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Title");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_CalendarDataPanel_Label1.text");
			result[1] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Calendar");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_CalendarDataPanel_Label2.text");
			result[2] = new Binding(this,function():*
			{
				return UtilDict.toDisplay("go","Date");
			},null,"_CalendarDataPanel_SetProperty1.value");
			result[3] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","The calendar is dynamically generated based on the year and month you select. For years long past and future, type in manually.\n\nThe day(s) you choose will be highlighted. Click the trash to delete it if no highlight is needed.");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_CalendarDataPanel_HelpButton1.helpText");
			result[4] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Year");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_CalendarDataPanel_Label3.text");
			result[5] = new Binding(this,function():IList
			{
				return _yearList;
			},null,"yearDropDownList.dataProvider");
			result[6] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Month");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_CalendarDataPanel_Label4.text");
			result[7] = new Binding(this,function():IList
			{
				return _monthList;
			},null,"monthDropDownList.dataProvider");
			result[8] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Day(s)");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_CalendarDataPanel_Label5.text");
			result[9] = new Binding(this,function():*
			{
				return UtilDict.toDisplay("go","Day");
			},null,"_CalendarDataPanel_SetProperty2.value");
			result[10] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","None");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_CalendarDataPanel_Button1.label");
			result[11] = new Binding(this,function():IList
			{
				return _dayList;
			},null,"dayDropDownList.dataProvider");
			result[12] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","to");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_CalendarDataPanel_Label6.text");
			result[13] = new Binding(this,function():IList
			{
				return _endDayList;
			},null,"endDayDropDownList.dataProvider");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _CalendarDataPanel_Button1() : Button
		{
			return this._191555869_CalendarDataPanel_Button1;
		}
		
		public function set _CalendarDataPanel_Button1(param1:Button) : void
		{
			var _loc2_:Object = this._191555869_CalendarDataPanel_Button1;
			if(_loc2_ !== param1)
			{
				this._191555869_CalendarDataPanel_Button1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CalendarDataPanel_Button1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CalendarDataPanel_HGroup3() : HGroup
		{
			return this._97320454_CalendarDataPanel_HGroup3;
		}
		
		public function set _CalendarDataPanel_HGroup3(param1:HGroup) : void
		{
			var _loc2_:Object = this._97320454_CalendarDataPanel_HGroup3;
			if(_loc2_ !== param1)
			{
				this._97320454_CalendarDataPanel_HGroup3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CalendarDataPanel_HGroup3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CalendarDataPanel_HGroup8() : HGroup
		{
			return this._97320449_CalendarDataPanel_HGroup8;
		}
		
		public function set _CalendarDataPanel_HGroup8(param1:HGroup) : void
		{
			var _loc2_:Object = this._97320449_CalendarDataPanel_HGroup8;
			if(_loc2_ !== param1)
			{
				this._97320449_CalendarDataPanel_HGroup8 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CalendarDataPanel_HGroup8",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CalendarDataPanel_Label2() : Label
		{
			return this._273449504_CalendarDataPanel_Label2;
		}
		
		public function set _CalendarDataPanel_Label2(param1:Label) : void
		{
			var _loc2_:Object = this._273449504_CalendarDataPanel_Label2;
			if(_loc2_ !== param1)
			{
				this._273449504_CalendarDataPanel_Label2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CalendarDataPanel_Label2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CalendarDataPanel_Label5() : Label
		{
			return this._273449507_CalendarDataPanel_Label5;
		}
		
		public function set _CalendarDataPanel_Label5(param1:Label) : void
		{
			var _loc2_:Object = this._273449507_CalendarDataPanel_Label5;
			if(_loc2_ !== param1)
			{
				this._273449507_CalendarDataPanel_Label5 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CalendarDataPanel_Label5",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CalendarDataPanel_SetProperty1() : SetProperty
		{
			return this._1976803428_CalendarDataPanel_SetProperty1;
		}
		
		public function set _CalendarDataPanel_SetProperty1(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1976803428_CalendarDataPanel_SetProperty1;
			if(_loc2_ !== param1)
			{
				this._1976803428_CalendarDataPanel_SetProperty1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CalendarDataPanel_SetProperty1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CalendarDataPanel_SetProperty2() : SetProperty
		{
			return this._1976803427_CalendarDataPanel_SetProperty2;
		}
		
		public function set _CalendarDataPanel_SetProperty2(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1976803427_CalendarDataPanel_SetProperty2;
			if(_loc2_ !== param1)
			{
				this._1976803427_CalendarDataPanel_SetProperty2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CalendarDataPanel_SetProperty2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _CalendarDataPanel_VGroup3() : VGroup
		{
			return this._557170808_CalendarDataPanel_VGroup3;
		}
		
		public function set _CalendarDataPanel_VGroup3(param1:VGroup) : void
		{
			var _loc2_:Object = this._557170808_CalendarDataPanel_VGroup3;
			if(_loc2_ !== param1)
			{
				this._557170808_CalendarDataPanel_VGroup3 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CalendarDataPanel_VGroup3",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get backgroundColorPicker() : ColorPaletteDropDown
		{
			return this._1987098563backgroundColorPicker;
		}
		
		public function set backgroundColorPicker(param1:ColorPaletteDropDown) : void
		{
			var _loc2_:Object = this._1987098563backgroundColorPicker;
			if(_loc2_ !== param1)
			{
				this._1987098563backgroundColorPicker = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundColorPicker",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorPalettePicker() : ColorPalettePicker
		{
			return this._93510726colorPalettePicker;
		}
		
		public function set colorPalettePicker(param1:ColorPalettePicker) : void
		{
			var _loc2_:Object = this._93510726colorPalettePicker;
			if(_loc2_ !== param1)
			{
				this._93510726colorPalettePicker = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPalettePicker",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dataPanel() : VGroup
		{
			return this._377789318dataPanel;
		}
		
		public function set dataPanel(param1:VGroup) : void
		{
			var _loc2_:Object = this._377789318dataPanel;
			if(_loc2_ !== param1)
			{
				this._377789318dataPanel = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataPanel",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dateSelector() : HGroup
		{
			return this._416040531dateSelector;
		}
		
		public function set dateSelector(param1:HGroup) : void
		{
			var _loc2_:Object = this._416040531dateSelector;
			if(_loc2_ !== param1)
			{
				this._416040531dateSelector = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dateSelector",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dayDropDownList() : spark.components.DropDownList
		{
			return this._429675989dayDropDownList;
		}
		
		public function set dayDropDownList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._429675989dayDropDownList;
			if(_loc2_ !== param1)
			{
				this._429675989dayDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dayDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get endDayDropDownList() : spark.components.DropDownList
		{
			return this._25385008endDayDropDownList;
		}
		
		public function set endDayDropDownList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._25385008endDayDropDownList;
			if(_loc2_ !== param1)
			{
				this._25385008endDayDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"endDayDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get foregroundColorPicker() : ColorPaletteDropDown
		{
			return this._985746290foregroundColorPicker;
		}
		
		public function set foregroundColorPicker(param1:ColorPaletteDropDown) : void
		{
			var _loc2_:Object = this._985746290foregroundColorPicker;
			if(_loc2_ !== param1)
			{
				this._985746290foregroundColorPicker = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"foregroundColorPicker",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get monthDropDownList() : spark.components.DropDownList
		{
			return this._2085294863monthDropDownList;
		}
		
		public function set monthDropDownList(param1:spark.components.DropDownList) : void
		{
			var _loc2_:Object = this._2085294863monthDropDownList;
			if(_loc2_ !== param1)
			{
				this._2085294863monthDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"monthDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get titleTextInput() : DefaultValueTextInput
		{
			return this._311588645titleTextInput;
		}
		
		public function set titleTextInput(param1:DefaultValueTextInput) : void
		{
			var _loc2_:Object = this._311588645titleTextInput;
			if(_loc2_ !== param1)
			{
				this._311588645titleTextInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleTextInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get yearDropDownList() : ComboBox
		{
			return this._1486603596yearDropDownList;
		}
		
		public function set yearDropDownList(param1:ComboBox) : void
		{
			var _loc2_:Object = this._1486603596yearDropDownList;
			if(_loc2_ !== param1)
			{
				this._1486603596yearDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"yearDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _monthList() : ArrayCollection
		{
			return this._1506017727_monthList;
		}
		
		private function set _monthList(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._1506017727_monthList;
			if(_loc2_ !== param1)
			{
				this._1506017727_monthList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_monthList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _yearList() : ArrayCollection
		{
			return this._1449560102_yearList;
		}
		
		private function set _yearList(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._1449560102_yearList;
			if(_loc2_ !== param1)
			{
				this._1449560102_yearList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_yearList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _defaultDayList() : ArrayCollection
		{
			return this._639848184_defaultDayList;
		}
		
		private function set _defaultDayList(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._639848184_defaultDayList;
			if(_loc2_ !== param1)
			{
				this._639848184_defaultDayList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_defaultDayList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _dayList() : ArrayCollection
		{
			return this._489545445_dayList;
		}
		
		private function set _dayList(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._489545445_dayList;
			if(_loc2_ !== param1)
			{
				this._489545445_dayList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_dayList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		private function get _endDayList() : ArrayCollection
		{
			return this._1531952482_endDayList;
		}
		
		private function set _endDayList(param1:ArrayCollection) : void
		{
			var _loc2_:Object = this._1531952482_endDayList;
			if(_loc2_ !== param1)
			{
				this._1531952482_endDayList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_endDayList",_loc2_,param1));
				}
			}
		}
	}
}
