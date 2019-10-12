package anifire.studio.components
{
   import anifire.component.widgets.WidgetConstants;
   import anifire.constant.ThemeConstants;
   import anifire.event.ColorPaletteEvent;
   import anifire.event.WidgetEvent;
   import anifire.models.FontModel;
   import anifire.studio.commands.ChangeWidgetAxisDisplayOptionCommand;
   import anifire.studio.commands.ChangeWidgetColorCommand;
   import anifire.studio.commands.ChangeWidgetDataLabelDisplayOptionCommand;
   import anifire.studio.commands.ChangeWidgetLegendDisplayOptionCommand;
   import anifire.studio.commands.ChangeWidgetNumberFormatCommand;
   import anifire.studio.commands.ChangeWidgetPercentageLabelDisplayOptionCommand;
   import anifire.studio.commands.ChangeWidgetStyleCommand;
   import anifire.studio.commands.ChangeWidgetValueLabelDisplayOptionCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Widget;
   import anifire.studio.core.WidgetStyleFactory;
   import anifire.studio.events.MenuItemEvent;
   import anifire.studio.managers.StudioFontManager;
   import anifire.studio.skins.CompactFormSkin;
   import anifire.studio.skins.WidgetStyleListSkin;
   import anifire.util.FontManager;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Form;
   import spark.components.HGroup;
   import spark.components.List;
   import spark.components.Scroller;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.layouts.HorizontalLayout;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ChartStylePanel extends WidgetPanelBase implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ChartStylePanel_VGroup3:VGroup;
      
      private var _1528293814axisDisplayOption:ToggleButton;
      
      private var _885706193colorPicker:ColorPaletteDropDown;
      
      private var _1518138642displayOptionFormItem:WidgetFormItem;
      
      private var _1923333726fontDropDownList:FontDropDownList;
      
      private var _426529946fontFormItem:WidgetFormItem;
      
      private var _1369182531labelDisplayOption:ToggleButton;
      
      private var _341408488layoutList:List;
      
      private var _1475960010legendDisplayOption:ToggleButton;
      
      private var _694606545numberFormatDropDownList:NumberFormatDropDownList;
      
      private var _1490107229percentageDisplayOption:ToggleButton;
      
      private var _1804885525styleForm:Form;
      
      private var _1067954662valueDisplayOption:ToggleButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1317665878_widgetDataGridModel:ArrayCollection;
      
      private var _command:ICommand;
      
      private var _1429721223_layoutList:ArrayCollection;
      
      private var _2075479207_displayAxisOption:Boolean;
      
      private var _523000526_displayCounterOption:Boolean;
      
      private var _1166122491_displayLegendOption:Boolean;
      
      private var _393795246_displayPercentageOption:Boolean;
      
      private var counterLabelOptionText:String;
      
      private var chartLabelOptionText:String;
      
      private var counterPercentageOptionText:String;
      
      private var chartPercentageOptionText:String;
      
      private var _changeWidgetColorCommand:ChangeWidgetColorCommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ChartStylePanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._1317665878_widgetDataGridModel = new ArrayCollection();
         this._1429721223_layoutList = new ArrayCollection();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ChartStylePanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ChartStylePanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ChartStylePanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ChartStylePanel_Array1_c);
         this.addEventListener("creationComplete",this.___ChartStylePanel_WidgetPanelBase1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ChartStylePanel._watcherSetupUtil = param1;
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
         this.counterLabelOptionText = UtilDict.toDisplay("go","Value");
         this.chartLabelOptionText = UtilDict.toDisplay("go","Values");
         this.counterPercentageOptionText = UtilDict.toDisplay("go","Percentage");
         this.chartPercentageOptionText = UtilDict.toDisplay("go","Percentages");
         super.init();
      }
      
      override public function set widget(param1:Widget) : void
      {
         super.widget = param1;
         if(_widget)
         {
            this.updateLayoutList();
         }
      }
      
      protected function updateLayoutList() : void
      {
         this._layoutList = WidgetStyleFactory.instance.getStyleVariants(_widget.chartType);
      }
      
      override protected function onWidgetOptionChange(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      override protected function onWidgetStyleChange(param1:WidgetEvent) : void
      {
         this.updateFont();
      }
      
      protected function updateFont() : void
      {
         this.fontDropDownList.selectCffFont(_widget.styleModel.font);
         this.colorPicker.selectedColor = _widget.styleModel.color;
      }
      
      protected function changeChartType(param1:String) : void
      {
         switch(param1)
         {
            default:
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
               this._displayCounterOption = false;
               this._displayAxisOption = true;
               this._displayLegendOption = true;
               this._displayPercentageOption = false;
               break;
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
               this._displayCounterOption = false;
               this._displayAxisOption = false;
               this._displayLegendOption = false;
               this._displayPercentageOption = true;
               break;
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
               this._displayCounterOption = true;
               this._displayAxisOption = false;
               this._displayLegendOption = false;
               this._displayPercentageOption = true;
         }
         if(this._displayCounterOption)
         {
            this.valueDisplayOption.label = this.counterLabelOptionText;
            this.percentageDisplayOption.label = this.counterPercentageOptionText;
         }
         else
         {
            this.valueDisplayOption.label = this.chartLabelOptionText;
            this.percentageDisplayOption.label = this.chartPercentageOptionText;
         }
      }
      
      override protected function updateUI() : void
      {
         if(initialized && _widget)
         {
            this.labelDisplayOption.selected = _widget.displayDataLabel;
            this.valueDisplayOption.selected = _widget.displayValueLabel;
            this.percentageDisplayOption.selected = _widget.displayInPercentage;
            this.axisDisplayOption.selected = _widget.displayAxis;
            this.legendDisplayOption.selected = _widget.displayLegend;
            this.numberFormatDropDownList.selectedItem = _widget.numberFormatType;
            this.changeChartType(_widget.chartType);
            this.updateFont();
         }
      }
      
      protected function onLayoutStyleButtonClick(param1:String) : void
      {
         if(_widget)
         {
            _widget.changeLayoutProperties(param1);
         }
      }
      
      protected function layoutList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:ICommand = null;
         if(_widget)
         {
            _loc2_ = new ChangeWidgetStyleCommand(_widget,this.layoutList.selectedItem.id);
            _loc2_.execute();
         }
      }
      
      protected function fontDropDown_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:FontModel = this.fontDropDownList.selectedItem as FontModel;
         this.changeFont(_loc2_);
      }
      
      protected function fontDropDownList_itemClickHandler(param1:MenuItemEvent) : void
      {
         var _loc2_:FontModel = param1.item.value as FontModel;
         this.changeFont(_loc2_);
      }
      
      private function changeFont(param1:FontModel) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:String = param1.cffValue;
         _widget.changeFont(_loc2_);
         StudioFontManager.instance.addRecentFont(_loc2_,param1.source == FontManager.FONT_TYPE_USER?ThemeConstants.UGC_THEME_ID:null);
      }
      
      protected function axisDisplayOption_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         if(_widget)
         {
            _loc2_ = new ChangeWidgetAxisDisplayOptionCommand(_widget,ToggleButton(param1.currentTarget).selected);
            _loc2_.execute();
         }
      }
      
      protected function valueDisplayOption_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         if(_widget)
         {
            _loc2_ = new ChangeWidgetValueLabelDisplayOptionCommand(_widget,ToggleButton(param1.currentTarget).selected);
            _loc2_.execute();
         }
      }
      
      protected function percentageDisplayOption_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         if(_widget)
         {
            _loc2_ = new ChangeWidgetPercentageLabelDisplayOptionCommand(_widget,ToggleButton(param1.currentTarget).selected);
            _loc2_.execute();
         }
      }
      
      protected function labelDisplayOption_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         if(_widget)
         {
            _loc2_ = new ChangeWidgetDataLabelDisplayOptionCommand(_widget,ToggleButton(param1.currentTarget).selected);
            _loc2_.execute();
         }
      }
      
      protected function numberFormatDropDownList_changeHandler(param1:IndexChangeEvent) : void
      {
         var _loc2_:ICommand = null;
         if(_widget)
         {
            _loc2_ = new ChangeWidgetNumberFormatCommand(_widget,this.numberFormatDropDownList.selectedItem);
            _loc2_.execute();
         }
      }
      
      protected function legendDisplayOption_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         if(_widget)
         {
            _loc2_ = new ChangeWidgetLegendDisplayOptionCommand(_widget,ToggleButton(param1.currentTarget).selected);
            _loc2_.execute();
         }
      }
      
      protected function colorPicker_colorChangeHandler(param1:ColorPaletteEvent) : void
      {
         if(_widget)
         {
            this.startChangingWidgetColor(param1.colorCode as uint);
            _widget.changeWidgetColor(param1.colorCode as uint);
            this._changeWidgetColorCommand = null;
         }
      }
      
      protected function colorPicker_colorPreviewHandler(param1:ColorPaletteEvent) : void
      {
         if(_widget)
         {
            this.startChangingWidgetColor(param1.colorCode as uint);
            _widget.changeWidgetColor(param1.colorCode as uint);
         }
      }
      
      protected function startChangingWidgetColor(param1:uint) : void
      {
         if(!this._changeWidgetColorCommand)
         {
            this._changeWidgetColorCommand = new ChangeWidgetColorCommand(_widget,param1);
            this._changeWidgetColorCommand.execute();
         }
         else
         {
            this._changeWidgetColorCommand.newColor = param1;
         }
      }
      
      private function _ChartStylePanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._ChartStylePanel_Rect1_c(),this._ChartStylePanel_VGroup1_c()];
         return _loc1_;
      }
      
      private function _ChartStylePanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ChartStylePanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ChartStylePanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ChartStylePanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._ChartStylePanel_Scroller1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ChartStylePanel_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._ChartStylePanel_VGroup2_c();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ChartStylePanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ChartStylePanel_Form1_i(),this._ChartStylePanel_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ChartStylePanel_Form1_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ChartStylePanel_Array4_c);
         _loc1_.setStyle("skinClass",CompactFormSkin);
         _loc1_.id = "styleForm";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.styleForm = _loc1_;
         BindingManager.executeBindings(this,"styleForm",this.styleForm);
         return _loc1_;
      }
      
      private function _ChartStylePanel_Array4_c() : Array
      {
         var _loc1_:Array = [this._ChartStylePanel_WidgetFormItem1_i(),this._ChartStylePanel_WidgetFormItem2_i()];
         return _loc1_;
      }
      
      private function _ChartStylePanel_WidgetFormItem1_i() : WidgetFormItem
      {
         var _loc1_:WidgetFormItem = new WidgetFormItem();
         _loc1_.layout = this._ChartStylePanel_HorizontalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ChartStylePanel_Array5_c);
         _loc1_.id = "displayOptionFormItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.displayOptionFormItem = _loc1_;
         BindingManager.executeBindings(this,"displayOptionFormItem",this.displayOptionFormItem);
         return _loc1_;
      }
      
      private function _ChartStylePanel_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.verticalAlign = "baseline";
         return _loc1_;
      }
      
      private function _ChartStylePanel_Array5_c() : Array
      {
         var _loc1_:Array = [this._ChartStylePanel_FlowGroup1_c()];
         return _loc1_;
      }
      
      private function _ChartStylePanel_FlowGroup1_c() : FlowGroup
      {
         var _loc1_:FlowGroup = new FlowGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ChartStylePanel_ToggleButton1_i(),this._ChartStylePanel_ToggleButton2_i(),this._ChartStylePanel_ToggleButton3_i(),this._ChartStylePanel_ToggleButton4_i(),this._ChartStylePanel_ToggleButton5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ChartStylePanel_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__valueDisplayOption_click);
         _loc1_.id = "valueDisplayOption";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.valueDisplayOption = _loc1_;
         BindingManager.executeBindings(this,"valueDisplayOption",this.valueDisplayOption);
         return _loc1_;
      }
      
      public function __valueDisplayOption_click(param1:MouseEvent) : void
      {
         this.valueDisplayOption_clickHandler(param1);
      }
      
      private function _ChartStylePanel_ToggleButton2_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__labelDisplayOption_click);
         _loc1_.id = "labelDisplayOption";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplayOption = _loc1_;
         BindingManager.executeBindings(this,"labelDisplayOption",this.labelDisplayOption);
         return _loc1_;
      }
      
      public function __labelDisplayOption_click(param1:MouseEvent) : void
      {
         this.labelDisplayOption_clickHandler(param1);
      }
      
      private function _ChartStylePanel_ToggleButton3_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__percentageDisplayOption_click);
         _loc1_.id = "percentageDisplayOption";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.percentageDisplayOption = _loc1_;
         BindingManager.executeBindings(this,"percentageDisplayOption",this.percentageDisplayOption);
         return _loc1_;
      }
      
      public function __percentageDisplayOption_click(param1:MouseEvent) : void
      {
         this.percentageDisplayOption_clickHandler(param1);
      }
      
      private function _ChartStylePanel_ToggleButton4_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__legendDisplayOption_click);
         _loc1_.id = "legendDisplayOption";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.legendDisplayOption = _loc1_;
         BindingManager.executeBindings(this,"legendDisplayOption",this.legendDisplayOption);
         return _loc1_;
      }
      
      public function __legendDisplayOption_click(param1:MouseEvent) : void
      {
         this.legendDisplayOption_clickHandler(param1);
      }
      
      private function _ChartStylePanel_ToggleButton5_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__axisDisplayOption_click);
         _loc1_.id = "axisDisplayOption";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.axisDisplayOption = _loc1_;
         BindingManager.executeBindings(this,"axisDisplayOption",this.axisDisplayOption);
         return _loc1_;
      }
      
      public function __axisDisplayOption_click(param1:MouseEvent) : void
      {
         this.axisDisplayOption_clickHandler(param1);
      }
      
      private function _ChartStylePanel_WidgetFormItem2_i() : WidgetFormItem
      {
         var _loc1_:WidgetFormItem = new WidgetFormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ChartStylePanel_Array7_c);
         _loc1_.id = "fontFormItem";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fontFormItem = _loc1_;
         BindingManager.executeBindings(this,"fontFormItem",this.fontFormItem);
         return _loc1_;
      }
      
      private function _ChartStylePanel_Array7_c() : Array
      {
         var _loc1_:Array = [this._ChartStylePanel_HGroup1_c()];
         return _loc1_;
      }
      
      private function _ChartStylePanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ChartStylePanel_FontDropDownList1_i(),this._ChartStylePanel_ColorPaletteDropDown1_i(),this._ChartStylePanel_NumberFormatDropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ChartStylePanel_FontDropDownList1_i() : FontDropDownList
      {
         var _loc1_:FontDropDownList = new FontDropDownList();
         _loc1_.percentWidth = 100;
         _loc1_.height = 30;
         _loc1_.cffMode = true;
         _loc1_.addEventListener("change",this.__fontDropDownList_change);
         _loc1_.addEventListener("itemClick",this.__fontDropDownList_itemClick);
         _loc1_.id = "fontDropDownList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fontDropDownList = _loc1_;
         BindingManager.executeBindings(this,"fontDropDownList",this.fontDropDownList);
         return _loc1_;
      }
      
      public function __fontDropDownList_change(param1:IndexChangeEvent) : void
      {
         this.fontDropDown_changeHandler(param1);
      }
      
      public function __fontDropDownList_itemClick(param1:MenuItemEvent) : void
      {
         this.fontDropDownList_itemClickHandler(param1);
      }
      
      private function _ChartStylePanel_ColorPaletteDropDown1_i() : ColorPaletteDropDown
      {
         var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
         _loc1_.addEventListener("colorPreview",this.__colorPicker_colorPreview);
         _loc1_.addEventListener("colorChange",this.__colorPicker_colorChange);
         _loc1_.id = "colorPicker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPicker = _loc1_;
         BindingManager.executeBindings(this,"colorPicker",this.colorPicker);
         return _loc1_;
      }
      
      public function __colorPicker_colorPreview(param1:ColorPaletteEvent) : void
      {
         this.colorPicker_colorPreviewHandler(param1);
      }
      
      public function __colorPicker_colorChange(param1:ColorPaletteEvent) : void
      {
         this.colorPicker_colorChangeHandler(param1);
      }
      
      private function _ChartStylePanel_NumberFormatDropDownList1_i() : NumberFormatDropDownList
      {
         var _loc1_:NumberFormatDropDownList = new NumberFormatDropDownList();
         _loc1_.addEventListener("change",this.__numberFormatDropDownList_change);
         _loc1_.id = "numberFormatDropDownList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.numberFormatDropDownList = _loc1_;
         BindingManager.executeBindings(this,"numberFormatDropDownList",this.numberFormatDropDownList);
         return _loc1_;
      }
      
      public function __numberFormatDropDownList_change(param1:IndexChangeEvent) : void
      {
         this.numberFormatDropDownList_changeHandler(param1);
      }
      
      private function _ChartStylePanel_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 0;
         _loc1_.paddingTop = 15;
         _loc1_.paddingBottom = 15;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._ChartStylePanel_List1_i()];
         _loc1_.id = "_ChartStylePanel_VGroup3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ChartStylePanel_VGroup3 = _loc1_;
         BindingManager.executeBindings(this,"_ChartStylePanel_VGroup3",this._ChartStylePanel_VGroup3);
         return _loc1_;
      }
      
      private function _ChartStylePanel_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.itemRenderer = this._ChartStylePanel_ClassFactory1_c();
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.setStyle("skinClass",WidgetStyleListSkin);
         _loc1_.addEventListener("change",this.__layoutList_change);
         _loc1_.id = "layoutList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.layoutList = _loc1_;
         BindingManager.executeBindings(this,"layoutList",this.layoutList);
         return _loc1_;
      }
      
      private function _ChartStylePanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetStyleThumbRenderer;
         return _loc1_;
      }
      
      public function __layoutList_change(param1:IndexChangeEvent) : void
      {
         this.layoutList_changeHandler(param1);
      }
      
      public function ___ChartStylePanel_WidgetPanelBase1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _ChartStylePanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"displayOptionFormItem.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Labels");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"labelDisplayOption.label");
         result[2] = new Binding(this,function():Boolean
         {
            return !_displayCounterOption;
         },null,"labelDisplayOption.visible");
         result[3] = new Binding(this,function():Boolean
         {
            return !_displayCounterOption;
         },null,"labelDisplayOption.includeInLayout");
         result[4] = new Binding(this,function():Boolean
         {
            return _displayPercentageOption;
         },null,"percentageDisplayOption.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return _displayPercentageOption;
         },null,"percentageDisplayOption.includeInLayout");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Legend");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"legendDisplayOption.label");
         result[7] = new Binding(this,function():Boolean
         {
            return _displayLegendOption;
         },null,"legendDisplayOption.visible");
         result[8] = new Binding(this,function():Boolean
         {
            return _displayLegendOption;
         },null,"legendDisplayOption.includeInLayout");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Axis");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"axisDisplayOption.label");
         result[10] = new Binding(this,function():Boolean
         {
            return _displayAxisOption;
         },null,"axisDisplayOption.visible");
         result[11] = new Binding(this,function():Boolean
         {
            return _displayAxisOption;
         },null,"axisDisplayOption.includeInLayout");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Text");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"fontFormItem.label");
         result[13] = new Binding(this,function():Boolean
         {
            return _layoutList.length > 0;
         },null,"_ChartStylePanel_VGroup3.visible");
         result[14] = new Binding(this,function():IList
         {
            return _layoutList;
         },null,"layoutList.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get axisDisplayOption() : ToggleButton
      {
         return this._1528293814axisDisplayOption;
      }
      
      public function set axisDisplayOption(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1528293814axisDisplayOption;
         if(_loc2_ !== param1)
         {
            this._1528293814axisDisplayOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"axisDisplayOption",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorPicker() : ColorPaletteDropDown
      {
         return this._885706193colorPicker;
      }
      
      public function set colorPicker(param1:ColorPaletteDropDown) : void
      {
         var _loc2_:Object = this._885706193colorPicker;
         if(_loc2_ !== param1)
         {
            this._885706193colorPicker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPicker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displayOptionFormItem() : WidgetFormItem
      {
         return this._1518138642displayOptionFormItem;
      }
      
      public function set displayOptionFormItem(param1:WidgetFormItem) : void
      {
         var _loc2_:Object = this._1518138642displayOptionFormItem;
         if(_loc2_ !== param1)
         {
            this._1518138642displayOptionFormItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayOptionFormItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontDropDownList() : FontDropDownList
      {
         return this._1923333726fontDropDownList;
      }
      
      public function set fontDropDownList(param1:FontDropDownList) : void
      {
         var _loc2_:Object = this._1923333726fontDropDownList;
         if(_loc2_ !== param1)
         {
            this._1923333726fontDropDownList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontDropDownList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fontFormItem() : WidgetFormItem
      {
         return this._426529946fontFormItem;
      }
      
      public function set fontFormItem(param1:WidgetFormItem) : void
      {
         var _loc2_:Object = this._426529946fontFormItem;
         if(_loc2_ !== param1)
         {
            this._426529946fontFormItem = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fontFormItem",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplayOption() : ToggleButton
      {
         return this._1369182531labelDisplayOption;
      }
      
      public function set labelDisplayOption(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1369182531labelDisplayOption;
         if(_loc2_ !== param1)
         {
            this._1369182531labelDisplayOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplayOption",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get layoutList() : List
      {
         return this._341408488layoutList;
      }
      
      public function set layoutList(param1:List) : void
      {
         var _loc2_:Object = this._341408488layoutList;
         if(_loc2_ !== param1)
         {
            this._341408488layoutList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layoutList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get legendDisplayOption() : ToggleButton
      {
         return this._1475960010legendDisplayOption;
      }
      
      public function set legendDisplayOption(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1475960010legendDisplayOption;
         if(_loc2_ !== param1)
         {
            this._1475960010legendDisplayOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"legendDisplayOption",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get numberFormatDropDownList() : NumberFormatDropDownList
      {
         return this._694606545numberFormatDropDownList;
      }
      
      public function set numberFormatDropDownList(param1:NumberFormatDropDownList) : void
      {
         var _loc2_:Object = this._694606545numberFormatDropDownList;
         if(_loc2_ !== param1)
         {
            this._694606545numberFormatDropDownList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"numberFormatDropDownList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get percentageDisplayOption() : ToggleButton
      {
         return this._1490107229percentageDisplayOption;
      }
      
      public function set percentageDisplayOption(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1490107229percentageDisplayOption;
         if(_loc2_ !== param1)
         {
            this._1490107229percentageDisplayOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"percentageDisplayOption",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleForm() : Form
      {
         return this._1804885525styleForm;
      }
      
      public function set styleForm(param1:Form) : void
      {
         var _loc2_:Object = this._1804885525styleForm;
         if(_loc2_ !== param1)
         {
            this._1804885525styleForm = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleForm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get valueDisplayOption() : ToggleButton
      {
         return this._1067954662valueDisplayOption;
      }
      
      public function set valueDisplayOption(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1067954662valueDisplayOption;
         if(_loc2_ !== param1)
         {
            this._1067954662valueDisplayOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"valueDisplayOption",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _widgetDataGridModel() : ArrayCollection
      {
         return this._1317665878_widgetDataGridModel;
      }
      
      private function set _widgetDataGridModel(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1317665878_widgetDataGridModel;
         if(_loc2_ !== param1)
         {
            this._1317665878_widgetDataGridModel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_widgetDataGridModel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _layoutList() : ArrayCollection
      {
         return this._1429721223_layoutList;
      }
      
      private function set _layoutList(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1429721223_layoutList;
         if(_loc2_ !== param1)
         {
            this._1429721223_layoutList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_layoutList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _displayAxisOption() : Boolean
      {
         return this._2075479207_displayAxisOption;
      }
      
      private function set _displayAxisOption(param1:Boolean) : void
      {
         var _loc2_:Object = this._2075479207_displayAxisOption;
         if(_loc2_ !== param1)
         {
            this._2075479207_displayAxisOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayAxisOption",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _displayCounterOption() : Boolean
      {
         return this._523000526_displayCounterOption;
      }
      
      private function set _displayCounterOption(param1:Boolean) : void
      {
         var _loc2_:Object = this._523000526_displayCounterOption;
         if(_loc2_ !== param1)
         {
            this._523000526_displayCounterOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayCounterOption",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _displayLegendOption() : Boolean
      {
         return this._1166122491_displayLegendOption;
      }
      
      private function set _displayLegendOption(param1:Boolean) : void
      {
         var _loc2_:Object = this._1166122491_displayLegendOption;
         if(_loc2_ !== param1)
         {
            this._1166122491_displayLegendOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayLegendOption",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _displayPercentageOption() : Boolean
      {
         return this._393795246_displayPercentageOption;
      }
      
      private function set _displayPercentageOption(param1:Boolean) : void
      {
         var _loc2_:Object = this._393795246_displayPercentageOption;
         if(_loc2_ !== param1)
         {
            this._393795246_displayPercentageOption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayPercentageOption",_loc2_,param1));
            }
         }
      }
   }
}
