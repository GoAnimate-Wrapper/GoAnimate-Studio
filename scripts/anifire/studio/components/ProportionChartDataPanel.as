package anifire.studio.components
{
   import anifire.component.widgets.WidgetConstants;
   import anifire.event.ColorPaletteEvent;
   import anifire.event.WidgetEvent;
   import anifire.studio.commands.ChangeWidgetColorPaletteCommand;
   import anifire.studio.commands.ChangeWidgetColorSetCommand;
   import anifire.studio.commands.ChangeWidgetDataCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Widget;
   import anifire.studio.core.WidgetStyleFactory;
   import anifire.studio.models.ColorPaletteModel;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.controls.Spacer;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class ProportionChartDataPanel extends WidgetPanelBase implements IBindingClient
   {
      
      private static const PIE_COUNTER_HELP_TEXT:String = "The chart will display the target value, and will count towards it when there is an enter effect.\n\nSet the max value to define the size of the pie.";
      
      private static const RING_COUNTER_HELP_TEXT:String = "The chart will display the target value, and will count towards it when there is an enter effect.\n\nSet the max value to define the size of the ring.";
      
      private static const DEFAULT_HELP_TEXT:String = "The chart will display the target value, and will count towards it when there is an enter effect.\n\nSet the max value to define the length of the chart.";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ProportionChartDataPanel_Label1:Label;
      
      public var _ProportionChartDataPanel_Label2:Label;
      
      public var _ProportionChartDataPanel_Label3:Label;
      
      public var _ProportionChartDataPanel_Label4:Label;
      
      private var _1987098563backgroundColorPicker:ColorPaletteDropDown;
      
      private var _93510726colorPalettePicker:ColorPalettePicker;
      
      private var _377789318dataPanel:VGroup;
      
      private var _985746290foregroundColorPicker:ColorPaletteDropDown;
      
      private var _735423955helpButton:HelpButton;
      
      private var _850471261maxValueInput:DefaultValueTextInput;
      
      private var _371842341startValueInput:DefaultValueTextInput;
      
      private var _1037197642targetValueInput:DefaultValueTextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _command:ICommand;
      
      protected var _palette:ColorPaletteModel;
      
      protected var _colorPaletteList:ArrayCollection;
      
      protected var _changeWidgetColorSetCommand:ChangeWidgetColorSetCommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ProportionChartDataPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ProportionChartDataPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ProportionChartDataPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProportionChartDataPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ProportionChartDataPanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ProportionChartDataPanel._watcherSetupUtil = param1;
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
      
      override protected function init() : void
      {
         var _loc1_:WidgetStyleFactory = WidgetStyleFactory.instance;
         this._colorPaletteList = new ArrayCollection();
         this._colorPaletteList.addItem(_loc1_.businessLightTwoColorPalette);
         this._colorPaletteList.addItem(_loc1_.businessDarkTwoColorPalette);
         this._colorPaletteList.addItem(_loc1_.retroLightTwoColorPalette);
         this._colorPaletteList.addItem(_loc1_.retroDarkTwoColorPalette);
         this._colorPaletteList.addItem(_loc1_.pastelLightTwoColorPalette);
         this._colorPaletteList.addItem(_loc1_.pastelDarkTwoColorPalette);
         this.colorPalettePicker.dataProvider = this._colorPaletteList;
         super.init();
      }
      
      override protected function onWidgetDataChange(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      override protected function onWidgetStyleChange(param1:WidgetEvent) : void
      {
         this.updateColorPickers();
      }
      
      override protected function onWidgetSwapStart(param1:WidgetEvent) : void
      {
         this.updateColorPickers();
      }
      
      private function updateColorPickers() : void
      {
         if(_widget)
         {
            if(_widget.styleModel && _widget.styleModel.colorSet && _widget.styleModel.colorSet.length >= 2)
            {
               this.foregroundColorPicker.selectedColor = _widget.styleModel.colorSet[1];
               this.backgroundColorPicker.selectedColor = _widget.styleModel.colorSet[0];
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
      
      override protected function updateUI() : void
      {
         if(initialized && _widget)
         {
            this.startValueInput.defaultText = "0";
            this.maxValueInput.defaultText = "100";
            if(_widget.dataRows && _widget.dataRows.length >= 3)
            {
               this.startValueInput.text = _widget.dataRows[0].rawValue;
               this.targetValueInput.text = _widget.dataRows[1].rawValue;
               this.maxValueInput.text = _widget.dataRows[2].rawValue;
            }
            else
            {
               this.maxValueInput.value = 100;
               this.startValueInput.value = 0;
               this.targetValueInput.value = 0;
            }
            this.updateColorPickers();
         }
      }
      
      private function updateLayoutList() : void
      {
         var _loc1_:String = null;
         switch(_widget.chartType)
         {
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
               _loc1_ = PIE_COUNTER_HELP_TEXT;
               break;
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
               _loc1_ = RING_COUNTER_HELP_TEXT;
               break;
            default:
               _loc1_ = DEFAULT_HELP_TEXT;
         }
         if(_loc1_)
         {
            this.helpButton.helpText = UtilDict.toDisplay("go",_loc1_);
         }
      }
      
      private function generateDataXml() : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc1_:XML = <data/>;
         _loc2_ = <row/>;
         _loc1_.appendChild(_loc2_);
         _loc3_ = <cell></cell>;
         _loc2_.appendChild(_loc3_);
         _loc3_ = <cell>{String(this.startValueInput.value)}</cell>;
         _loc2_.appendChild(_loc3_);
         _loc2_ = <row/>;
         _loc1_.appendChild(_loc2_);
         _loc3_ = <cell></cell>;
         _loc2_.appendChild(_loc3_);
         _loc3_ = <cell>{String(this.targetValueInput.value)}</cell>;
         _loc2_.appendChild(_loc3_);
         _loc2_ = <row/>;
         _loc1_.appendChild(_loc2_);
         _loc3_ = <cell></cell>;
         _loc2_.appendChild(_loc3_);
         _loc3_ = <cell>{String(this.maxValueInput.value)}</cell>;
         _loc2_.appendChild(_loc3_);
         return _loc1_;
      }
      
      protected function targetValueInput_changeHandler(param1:Event) : void
      {
         if(_widget)
         {
            _widget.data = this.generateDataXml().toXMLString();
         }
      }
      
      protected function targetValueInput_focusInHandler(param1:Event) : void
      {
         if(_widget)
         {
            this.editTargetValue();
         }
      }
      
      protected function targetValueInput_focusOutHandler(param1:Event) : void
      {
         this.commitTargetValue();
      }
      
      protected function targetValueInput_enterHandler(param1:Event) : void
      {
         if(this.commitTargetValue())
         {
            this.editTargetValue();
         }
      }
      
      protected function editTargetValue() : void
      {
         this._command = new ChangeWidgetDataCommand(_widget,"");
      }
      
      protected function commitTargetValue() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc1_:ChangeWidgetDataCommand = this._command as ChangeWidgetDataCommand;
         if(_loc1_)
         {
            _loc2_ = Number(this.targetValueInput.value);
            if(isNaN(_loc2_))
            {
               _loc2_ = 0;
               this.targetValueInput.value = _loc2_;
            }
            this.maxValueInput.value = Math.max(this.startValueInput.value,_loc2_,this.maxValueInput.value);
            _loc3_ = this.generateDataXml().toXMLString();
            _loc1_.executeNow(_loc3_);
            return true;
         }
         return false;
      }
      
      protected function startValueInput_changeHandler(param1:Event) : void
      {
         if(_widget)
         {
            _widget.data = this.generateDataXml().toXMLString();
         }
      }
      
      protected function startValueInput_focusInHandler(param1:Event) : void
      {
         if(_widget)
         {
            this.editStartValue();
         }
      }
      
      protected function startValueInput_focusOutHandler(param1:Event) : void
      {
         this.commitStartValue();
      }
      
      protected function startValueInput_enterHandler(param1:Event) : void
      {
         if(this.commitStartValue())
         {
            this.editStartValue();
         }
      }
      
      protected function editStartValue() : void
      {
         this._command = new ChangeWidgetDataCommand(_widget,"");
      }
      
      protected function commitStartValue() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc1_:ChangeWidgetDataCommand = this._command as ChangeWidgetDataCommand;
         if(_loc1_)
         {
            _loc2_ = Number(this.startValueInput.value);
            if(isNaN(_loc2_))
            {
               _loc2_ = 0;
               this.startValueInput.value = _loc2_;
            }
            this.maxValueInput.value = Math.max(_loc2_,this.targetValueInput.value,this.maxValueInput.value);
            _loc3_ = this.generateDataXml().toXMLString();
            _loc1_.executeNow(_loc3_);
            return true;
         }
         return false;
      }
      
      protected function maxValueInput_changeHandler(param1:Event) : void
      {
         if(_widget)
         {
            _widget.data = this.generateDataXml().toXMLString();
         }
      }
      
      protected function maxValueInput_focusInHandler(param1:Event) : void
      {
         if(_widget)
         {
            this.editMaxValue();
         }
      }
      
      protected function maxValueInput_focusOutHandler(param1:Event) : void
      {
         this.commitMaxValue();
      }
      
      protected function maxValueInput_enterHandler(param1:Event) : void
      {
         if(this.commitMaxValue())
         {
            this.editMaxValue();
         }
      }
      
      protected function editMaxValue() : void
      {
         this._command = new ChangeWidgetDataCommand(_widget,"");
      }
      
      protected function commitMaxValue() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc1_:ChangeWidgetDataCommand = this._command as ChangeWidgetDataCommand;
         if(_loc1_)
         {
            _loc2_ = Number(this.maxValueInput.value);
            if(isNaN(_loc2_) || _loc2_ == 0)
            {
               _loc2_ = 1;
               this.maxValueInput.value = _loc2_;
            }
            this.targetValueInput.value = Math.min(this.targetValueInput.value,_loc2_);
            this.startValueInput.value = Math.min(this.startValueInput.value,_loc2_);
            _loc3_ = this.generateDataXml().toXMLString();
            _loc1_.executeNow(_loc3_);
            return true;
         }
         return false;
      }
      
      protected function startChangingWidgetColorSet(param1:Array) : void
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
      
      protected function colorPicker_colorChangeHandler(param1:ColorPaletteEvent) : void
      {
         var _loc2_:Array = null;
         if(_widget)
         {
            _loc2_ = [this.backgroundColorPicker.selectedColor,this.foregroundColorPicker.selectedColor];
            this.startChangingWidgetColorSet(_loc2_);
            _widget.colorSet = _loc2_;
            this._changeWidgetColorSetCommand = null;
         }
      }
      
      protected function colorPicker_colorPreviewHandler(param1:ColorPaletteEvent) : void
      {
         var _loc2_:Array = null;
         if(_widget)
         {
            _loc2_ = [this.backgroundColorPicker.previewColor,this.foregroundColorPicker.previewColor];
            this.startChangingWidgetColorSet(_loc2_);
            _widget.colorSet = _loc2_;
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
      
      private function _ProportionChartDataPanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._ProportionChartDataPanel_VGroup1_i()];
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ProportionChartDataPanel_VGroup2_c()];
         _loc1_.id = "dataPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataPanel = _loc1_;
         BindingManager.executeBindings(this,"dataPanel",this.dataPanel);
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 10;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.paddingTop = 15;
         _loc1_.paddingBottom = 15;
         _loc1_.mxmlContent = [this._ProportionChartDataPanel_HGroup1_c(),this._ProportionChartDataPanel_HGroup2_c(),this._ProportionChartDataPanel_HGroup3_c(),this._ProportionChartDataPanel_Line1_c(),this._ProportionChartDataPanel_HGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ProportionChartDataPanel_Label1_i(),this._ProportionChartDataPanel_HelpButton1_i(),this._ProportionChartDataPanel_Spacer1_c(),this._ProportionChartDataPanel_ColorPalettePicker1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "_ProportionChartDataPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProportionChartDataPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ProportionChartDataPanel_Label1",this._ProportionChartDataPanel_Label1);
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_HelpButton1_i() : HelpButton
      {
         var _loc1_:HelpButton = new HelpButton();
         _loc1_.id = "helpButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.helpButton = _loc1_;
         BindingManager.executeBindings(this,"helpButton",this.helpButton);
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_ColorPalettePicker1_i() : ColorPalettePicker
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
      
      private function _ProportionChartDataPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 5;
         _loc1_.mxmlContent = [this._ProportionChartDataPanel_Label2_i(),this._ProportionChartDataPanel_DefaultValueTextInput1_i(),this._ProportionChartDataPanel_Spacer2_c(),this._ProportionChartDataPanel_ColorPaletteDropDown1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 100;
         _loc1_.setStyle("color",9803424);
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_ProportionChartDataPanel_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProportionChartDataPanel_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_ProportionChartDataPanel_Label2",this._ProportionChartDataPanel_Label2);
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_DefaultValueTextInput1_i() : DefaultValueTextInput
      {
         var _loc1_:DefaultValueTextInput = new DefaultValueTextInput();
         _loc1_.restrict = "0-9.";
         _loc1_.width = 120;
         _loc1_.addEventListener("focusIn",this.__targetValueInput_focusIn);
         _loc1_.addEventListener("focusOut",this.__targetValueInput_focusOut);
         _loc1_.addEventListener("enter",this.__targetValueInput_enter);
         _loc1_.id = "targetValueInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.targetValueInput = _loc1_;
         BindingManager.executeBindings(this,"targetValueInput",this.targetValueInput);
         return _loc1_;
      }
      
      public function __targetValueInput_focusIn(param1:FocusEvent) : void
      {
         this.targetValueInput_focusInHandler(param1);
      }
      
      public function __targetValueInput_focusOut(param1:FocusEvent) : void
      {
         this.targetValueInput_focusOutHandler(param1);
      }
      
      public function __targetValueInput_enter(param1:FlexEvent) : void
      {
         this.targetValueInput_enterHandler(param1);
      }
      
      private function _ProportionChartDataPanel_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_ColorPaletteDropDown1_i() : ColorPaletteDropDown
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
      
      private function _ProportionChartDataPanel_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 5;
         _loc1_.mxmlContent = [this._ProportionChartDataPanel_Label3_i(),this._ProportionChartDataPanel_DefaultValueTextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 100;
         _loc1_.setStyle("color",9803424);
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_ProportionChartDataPanel_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProportionChartDataPanel_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_ProportionChartDataPanel_Label3",this._ProportionChartDataPanel_Label3);
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_DefaultValueTextInput2_i() : DefaultValueTextInput
      {
         var _loc1_:DefaultValueTextInput = new DefaultValueTextInput();
         _loc1_.restrict = "0-9.";
         _loc1_.width = 120;
         _loc1_.addEventListener("focusIn",this.__startValueInput_focusIn);
         _loc1_.addEventListener("focusOut",this.__startValueInput_focusOut);
         _loc1_.addEventListener("enter",this.__startValueInput_enter);
         _loc1_.id = "startValueInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startValueInput = _loc1_;
         BindingManager.executeBindings(this,"startValueInput",this.startValueInput);
         return _loc1_;
      }
      
      public function __startValueInput_focusIn(param1:FocusEvent) : void
      {
         this.startValueInput_focusInHandler(param1);
      }
      
      public function __startValueInput_focusOut(param1:FocusEvent) : void
      {
         this.startValueInput_focusOutHandler(param1);
      }
      
      public function __startValueInput_enter(param1:FlexEvent) : void
      {
         this.startValueInput_enterHandler(param1);
      }
      
      private function _ProportionChartDataPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ProportionChartDataPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 5;
         _loc1_.mxmlContent = [this._ProportionChartDataPanel_Label4_i(),this._ProportionChartDataPanel_DefaultValueTextInput3_i(),this._ProportionChartDataPanel_Spacer3_c(),this._ProportionChartDataPanel_ColorPaletteDropDown2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 100;
         _loc1_.setStyle("color",9803424);
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_ProportionChartDataPanel_Label4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProportionChartDataPanel_Label4 = _loc1_;
         BindingManager.executeBindings(this,"_ProportionChartDataPanel_Label4",this._ProportionChartDataPanel_Label4);
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_DefaultValueTextInput3_i() : DefaultValueTextInput
      {
         var _loc1_:DefaultValueTextInput = new DefaultValueTextInput();
         _loc1_.restrict = "0-9.";
         _loc1_.width = 120;
         _loc1_.addEventListener("focusIn",this.__maxValueInput_focusIn);
         _loc1_.addEventListener("focusOut",this.__maxValueInput_focusOut);
         _loc1_.addEventListener("enter",this.__maxValueInput_enter);
         _loc1_.id = "maxValueInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.maxValueInput = _loc1_;
         BindingManager.executeBindings(this,"maxValueInput",this.maxValueInput);
         return _loc1_;
      }
      
      public function __maxValueInput_focusIn(param1:FocusEvent) : void
      {
         this.maxValueInput_focusInHandler(param1);
      }
      
      public function __maxValueInput_focusOut(param1:FocusEvent) : void
      {
         this.maxValueInput_focusOutHandler(param1);
      }
      
      public function __maxValueInput_enter(param1:FlexEvent) : void
      {
         this.maxValueInput_enterHandler(param1);
      }
      
      private function _ProportionChartDataPanel_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProportionChartDataPanel_ColorPaletteDropDown2_i() : ColorPaletteDropDown
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
      
      private function _ProportionChartDataPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Chart data");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ProportionChartDataPanel_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Target value");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ProportionChartDataPanel_Label2.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Animate from");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ProportionChartDataPanel_Label3.text");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Max value");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ProportionChartDataPanel_Label4.text");
         return result;
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
      public function get helpButton() : HelpButton
      {
         return this._735423955helpButton;
      }
      
      public function set helpButton(param1:HelpButton) : void
      {
         var _loc2_:Object = this._735423955helpButton;
         if(_loc2_ !== param1)
         {
            this._735423955helpButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maxValueInput() : DefaultValueTextInput
      {
         return this._850471261maxValueInput;
      }
      
      public function set maxValueInput(param1:DefaultValueTextInput) : void
      {
         var _loc2_:Object = this._850471261maxValueInput;
         if(_loc2_ !== param1)
         {
            this._850471261maxValueInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxValueInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startValueInput() : DefaultValueTextInput
      {
         return this._371842341startValueInput;
      }
      
      public function set startValueInput(param1:DefaultValueTextInput) : void
      {
         var _loc2_:Object = this._371842341startValueInput;
         if(_loc2_ !== param1)
         {
            this._371842341startValueInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startValueInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetValueInput() : DefaultValueTextInput
      {
         return this._1037197642targetValueInput;
      }
      
      public function set targetValueInput(param1:DefaultValueTextInput) : void
      {
         var _loc2_:Object = this._1037197642targetValueInput;
         if(_loc2_ !== param1)
         {
            this._1037197642targetValueInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetValueInput",_loc2_,param1));
            }
         }
      }
   }
}
