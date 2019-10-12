package anifire.studio.components
{
   import anifire.constant.ThemeConstants;
   import anifire.event.ColorPaletteEvent;
   import anifire.event.CoreEvent;
   import anifire.event.WidgetEvent;
   import anifire.models.FontModel;
   import anifire.studio.commands.ChangeWidgetColorCommand;
   import anifire.studio.commands.ChangeWidgetNumberFormatCommand;
   import anifire.studio.commands.ChangeWidgetPercentageLabelDisplayOptionCommand;
   import anifire.studio.commands.ChangeWidgetPropCommand;
   import anifire.studio.commands.ChangeWidgetValueLabelDisplayOptionCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.core.Widget;
   import anifire.studio.events.MenuItemEvent;
   import anifire.studio.events.ProductExplorerEvent;
   import anifire.studio.managers.AssetManager;
   import anifire.studio.managers.StudioFontManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.studio.models.SwapPropExplorerCollection;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.skins.CompactFormSkin;
   import anifire.studio.skins.ForwardLinkButtonSkin;
   import anifire.studio.skins.LinkArrowBlackButtonSkin;
   import anifire.util.FontManager;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
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
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Scroller;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   import spark.effects.Animate;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.events.IndexChangeEvent;
   import spark.layouts.HorizontalLayout;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class IconWidgetStylePanel extends WidgetPanelBase implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _IconWidgetStylePanel_WidgetFormItem1:WidgetFormItem;
      
      public var _IconWidgetStylePanel_WidgetFormItem2:WidgetFormItem;
      
      public var _IconWidgetStylePanel_WidgetFormItem3:WidgetFormItem;
      
      public var _IconWidgetStylePanel_WidgetFormItem4:WidgetFormItem;
      
      private var _1118509956animation:Animate;
      
      private var _1906413305backButton:LinkArrowButton;
      
      private var _885706193colorPicker:ColorPaletteDropDown;
      
      private var _833446526containerGroup:HGroup;
      
      private var _1923333726fontDropDownList:FontDropDownList;
      
      private var _1161933810headerGroup:Group;
      
      private var _966890705iconOptionGroup:Group;
      
      private var _421279679iconWidgetChangeButton:IconWidgetDisplay;
      
      private var _1679720505iconWidgetChangeLink:Button;
      
      private var _1850661981normalOptionGroup:Group;
      
      private var _694606545numberFormatDropDownList:NumberFormatDropDownList;
      
      private var _1490107229percentageDisplayOption:ToggleButton;
      
      private var _104484034propExplorer:ProductExplorer;
      
      private var _1804885525styleForm:Form;
      
      private var _1067954662valueDisplayOption:ToggleButton;
      
      private var _560879371widgetGridGroup:IconWidgetGridGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _iconThumb:PropThumb;
      
      private var _command:ICommand;
      
      private var _themeManager:ThemeManager;
      
      private var _355797251_propSource:SwapPropExplorerCollection;
      
      private var _1359579845showGridOptions:Boolean;
      
      private var _changeWidgetColorCommand:ChangeWidgetColorCommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function IconWidgetStylePanel()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._themeManager = ThemeManager.instance;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._IconWidgetStylePanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_IconWidgetStylePanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return IconWidgetStylePanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.transitions = [this._IconWidgetStylePanel_Transition1_c()];
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._IconWidgetStylePanel_Array3_c);
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"icon",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"containerGroup",
               "name":"horizontalScrollPosition",
               "value":310
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
         IconWidgetStylePanel._watcherSetupUtil = param1;
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
         this.propExplorer.clearProductSelection();
         this.widgetGridGroup.widget = _widget;
         if(param1)
         {
            this.updatePropSource();
         }
      }
      
      private function updatePropSource() : void
      {
         var _loc1_:Theme = null;
         if(!this._propSource)
         {
            _loc1_ = this._themeManager.getTheme(ThemeConstants.INFOGRAPHICS_THEME_ID);
            if(!_loc1_)
            {
               this._themeManager.addEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.themeManager_loadThemeCompleteHandler);
               this._themeManager.loadTheme(ThemeConstants.INFOGRAPHICS_THEME_ID,false,false);
               return;
            }
            this._propSource = AssetManager.instance.getPropCollection(_loc1_);
            this.propExplorer.displayNaturally();
         }
      }
      
      protected function themeManager_loadThemeCompleteHandler(param1:CoreEvent) : void
      {
         this.updateUI();
         this._themeManager.removeEventListener(CoreEvent.LOAD_THEME_COMPLETE,this.themeManager_loadThemeCompleteHandler);
         this.updatePropSource();
      }
      
      override protected function onWidgetStyleChange(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      override protected function onWidgetOptionChange(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      protected function updateFont() : void
      {
         this.fontDropDownList.selectCffFont(_widget.styleModel.font);
      }
      
      override protected function updateUI() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(initialized && _widget && _widget.propId)
         {
            this.showGridOptions = _widget.chartType == "repeatIcon";
            _loc1_ = _widget.propId.split(".");
            _loc2_ = _loc1_[0];
            _loc3_ = _loc1_.length == 4?_loc1_[1]:_loc1_[1] + "." + _loc1_[2];
            this._iconThumb = this._themeManager.getPropById(_loc2_,_loc3_);
            if(this._iconThumb)
            {
               this.iconWidgetChangeButton.data = new ThumbModel(this._iconThumb);
            }
            if(this.colorPicker)
            {
               this.colorPicker.selectedColor = _widget.styleModel.color;
            }
            this.valueDisplayOption.selected = _widget.displayValueLabel;
            this.percentageDisplayOption.selected = _widget.displayInPercentage;
            this.updateFont();
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
      
      protected function onBackButtonClick(param1:MouseEvent) : void
      {
         this.reset();
      }
      
      protected function propExplorer_productSelectedHandler(param1:Event) : void
      {
         var _loc3_:ICommand = null;
         var _loc2_:ThumbModel = this.propExplorer.selectedProduct as ThumbModel;
         if(_loc2_ && _loc2_.thumb is PropThumb)
         {
            _loc3_ = new ChangeWidgetPropCommand(_widget,_loc2_.thumb as PropThumb);
            _loc3_.execute();
         }
      }
      
      protected function iconWidgetChangeButton_clickHandler(param1:MouseEvent) : void
      {
         this.displayIconTray();
      }
      
      public function displayIconTray() : void
      {
         currentState = "icon";
      }
      
      public function reset() : void
      {
         currentState = "normal";
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
      
      private function _IconWidgetStylePanel_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "*";
         _loc1_.effect = this._IconWidgetStylePanel_Animate1_i();
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Animate1_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 200;
         _loc1_.motionPaths = new <MotionPath>[this._IconWidgetStylePanel_SimpleMotionPath1_c()];
         this.animation = _loc1_;
         BindingManager.executeBindings(this,"animation",this.animation);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_SimpleMotionPath1_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "horizontalScrollPosition";
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Array3_c() : Array
      {
         var _loc1_:Array = [this._IconWidgetStylePanel_HGroup1_i()];
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_Group1_i(),this._IconWidgetStylePanel_Group2_i()];
         _loc1_.id = "containerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.containerGroup = _loc1_;
         BindingManager.executeBindings(this,"containerGroup",this.containerGroup);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 310;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_Rect1_c(),this._IconWidgetStylePanel_VGroup1_c(),this._IconWidgetStylePanel_Rect2_c()];
         _loc1_.id = "normalOptionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.normalOptionGroup = _loc1_;
         BindingManager.executeBindings(this,"normalOptionGroup",this.normalOptionGroup);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._IconWidgetStylePanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_Scroller1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._IconWidgetStylePanel_VGroup2_c();
         _loc1_.setStyle("horizontalScrollPolicy","off");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_Form1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Form1_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._IconWidgetStylePanel_Array8_c);
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
      
      private function _IconWidgetStylePanel_Array8_c() : Array
      {
         var _loc1_:Array = [this._IconWidgetStylePanel_WidgetFormItem1_i(),this._IconWidgetStylePanel_WidgetFormItem2_i(),this._IconWidgetStylePanel_WidgetFormItem3_i(),this._IconWidgetStylePanel_WidgetFormItem4_i()];
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_WidgetFormItem1_i() : WidgetFormItem
      {
         var _loc1_:WidgetFormItem = new WidgetFormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._IconWidgetStylePanel_Array9_c);
         _loc1_.id = "_IconWidgetStylePanel_WidgetFormItem1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconWidgetStylePanel_WidgetFormItem1 = _loc1_;
         BindingManager.executeBindings(this,"_IconWidgetStylePanel_WidgetFormItem1",this._IconWidgetStylePanel_WidgetFormItem1);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Array9_c() : Array
      {
         var _loc1_:Array = [this._IconWidgetStylePanel_HGroup2_c()];
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "top";
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_IconWidgetDisplay1_i(),this._IconWidgetStylePanel_Spacer1_c(),this._IconWidgetStylePanel_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_IconWidgetDisplay1_i() : IconWidgetDisplay
      {
         var _loc1_:IconWidgetDisplay = new IconWidgetDisplay();
         _loc1_.addEventListener("click",this.__iconWidgetChangeButton_click);
         _loc1_.id = "iconWidgetChangeButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconWidgetChangeButton = _loc1_;
         BindingManager.executeBindings(this,"iconWidgetChangeButton",this.iconWidgetChangeButton);
         return _loc1_;
      }
      
      public function __iconWidgetChangeButton_click(param1:MouseEvent) : void
      {
         this.iconWidgetChangeButton_clickHandler(param1);
      }
      
      private function _IconWidgetStylePanel_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ForwardLinkButtonSkin);
         _loc1_.addEventListener("click",this.__iconWidgetChangeLink_click);
         _loc1_.id = "iconWidgetChangeLink";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconWidgetChangeLink = _loc1_;
         BindingManager.executeBindings(this,"iconWidgetChangeLink",this.iconWidgetChangeLink);
         return _loc1_;
      }
      
      public function __iconWidgetChangeLink_click(param1:MouseEvent) : void
      {
         this.iconWidgetChangeButton_clickHandler(param1);
      }
      
      private function _IconWidgetStylePanel_WidgetFormItem2_i() : WidgetFormItem
      {
         var _loc1_:WidgetFormItem = new WidgetFormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._IconWidgetStylePanel_Array11_c);
         _loc1_.id = "_IconWidgetStylePanel_WidgetFormItem2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconWidgetStylePanel_WidgetFormItem2 = _loc1_;
         BindingManager.executeBindings(this,"_IconWidgetStylePanel_WidgetFormItem2",this._IconWidgetStylePanel_WidgetFormItem2);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Array11_c() : Array
      {
         var _loc1_:Array = [this._IconWidgetStylePanel_IconWidgetGridGroup1_i()];
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_IconWidgetGridGroup1_i() : IconWidgetGridGroup
      {
         var _loc1_:IconWidgetGridGroup = new IconWidgetGridGroup();
         _loc1_.percentWidth = 100;
         _loc1_.id = "widgetGridGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.widgetGridGroup = _loc1_;
         BindingManager.executeBindings(this,"widgetGridGroup",this.widgetGridGroup);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_WidgetFormItem3_i() : WidgetFormItem
      {
         var _loc1_:WidgetFormItem = new WidgetFormItem();
         _loc1_.layout = this._IconWidgetStylePanel_HorizontalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._IconWidgetStylePanel_Array12_c);
         _loc1_.id = "_IconWidgetStylePanel_WidgetFormItem3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconWidgetStylePanel_WidgetFormItem3 = _loc1_;
         BindingManager.executeBindings(this,"_IconWidgetStylePanel_WidgetFormItem3",this._IconWidgetStylePanel_WidgetFormItem3);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_HorizontalLayout1_c() : HorizontalLayout
      {
         var _loc1_:HorizontalLayout = new HorizontalLayout();
         _loc1_.verticalAlign = "baseline";
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Array12_c() : Array
      {
         var _loc1_:Array = [this._IconWidgetStylePanel_FlowGroup1_c()];
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_FlowGroup1_c() : FlowGroup
      {
         var _loc1_:FlowGroup = new FlowGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_ToggleButton1_i(),this._IconWidgetStylePanel_ToggleButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_ToggleButton1_i() : ToggleButton
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
      
      private function _IconWidgetStylePanel_ToggleButton2_i() : ToggleButton
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
      
      private function _IconWidgetStylePanel_WidgetFormItem4_i() : WidgetFormItem
      {
         var _loc1_:WidgetFormItem = new WidgetFormItem();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._IconWidgetStylePanel_Array14_c);
         _loc1_.id = "_IconWidgetStylePanel_WidgetFormItem4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconWidgetStylePanel_WidgetFormItem4 = _loc1_;
         BindingManager.executeBindings(this,"_IconWidgetStylePanel_WidgetFormItem4",this._IconWidgetStylePanel_WidgetFormItem4);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Array14_c() : Array
      {
         var _loc1_:Array = [this._IconWidgetStylePanel_HGroup3_c()];
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 10;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_FontDropDownList1_i(),this._IconWidgetStylePanel_ColorPaletteDropDown1_i(),this._IconWidgetStylePanel_NumberFormatDropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_FontDropDownList1_i() : FontDropDownList
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
      
      private function _IconWidgetStylePanel_ColorPaletteDropDown1_i() : ColorPaletteDropDown
      {
         var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
         _loc1_.addEventListener("colorChange",this.__colorPicker_colorChange);
         _loc1_.addEventListener("colorPreview",this.__colorPicker_colorPreview);
         _loc1_.id = "colorPicker";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPicker = _loc1_;
         BindingManager.executeBindings(this,"colorPicker",this.colorPicker);
         return _loc1_;
      }
      
      public function __colorPicker_colorChange(param1:ColorPaletteEvent) : void
      {
         this.colorPicker_colorChangeHandler(param1);
      }
      
      public function __colorPicker_colorPreview(param1:ColorPaletteEvent) : void
      {
         this.colorPicker_colorPreviewHandler(param1);
      }
      
      private function _IconWidgetStylePanel_NumberFormatDropDownList1_i() : NumberFormatDropDownList
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
      
      private function _IconWidgetStylePanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 11;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.height = 10;
         _loc1_.fill = this._IconWidgetStylePanel_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._IconWidgetStylePanel_GradientEntry1_c(),this._IconWidgetStylePanel_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 310;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_VGroup3_c()];
         _loc1_.id = "iconOptionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconOptionGroup = _loc1_;
         BindingManager.executeBindings(this,"iconOptionGroup",this.iconOptionGroup);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_Group3_i(),this._IconWidgetStylePanel_ProductExplorer1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_Rect3_c(),this._IconWidgetStylePanel_HGroup4_c()];
         _loc1_.id = "headerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headerGroup = _loc1_;
         BindingManager.executeBindings(this,"headerGroup",this.headerGroup);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._IconWidgetStylePanel_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.paddingRight = 10;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._IconWidgetStylePanel_LinkArrowButton1_i(),this._IconWidgetStylePanel_Line1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_LinkArrowButton1_i() : LinkArrowButton
      {
         var _loc1_:LinkArrowButton = new LinkArrowButton();
         _loc1_.setStyle("arrowPosition","left");
         _loc1_.setStyle("arrowDirection","left");
         _loc1_.setStyle("skinClass",LinkArrowBlackButtonSkin);
         _loc1_.addEventListener("click",this.__backButton_click);
         _loc1_.id = "backButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backButton = _loc1_;
         BindingManager.executeBindings(this,"backButton",this.backButton);
         return _loc1_;
      }
      
      public function __backButton_click(param1:MouseEvent) : void
      {
         this.onBackButtonClick(param1);
      }
      
      private function _IconWidgetStylePanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.height = 16;
         _loc1_.stroke = this._IconWidgetStylePanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13750737;
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_ProductExplorer1_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._IconWidgetStylePanel_ClassFactory1_c();
         _loc1_.addEventListener("productSelected",this.__propExplorer_productSelected);
         _loc1_.id = "propExplorer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.propExplorer = _loc1_;
         BindingManager.executeBindings(this,"propExplorer",this.propExplorer);
         return _loc1_;
      }
      
      private function _IconWidgetStylePanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SwapPropRenderer;
         return _loc1_;
      }
      
      public function __propExplorer_productSelected(param1:ProductExplorerEvent) : void
      {
         this.propExplorer_productSelectedHandler(param1);
      }
      
      private function _IconWidgetStylePanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"animation.target","containerGroup");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Prop");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_IconWidgetStylePanel_WidgetFormItem1.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Swap Prop");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"iconWidgetChangeLink.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Grid");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_IconWidgetStylePanel_WidgetFormItem2.label");
         result[4] = new Binding(this,function():Boolean
         {
            return showGridOptions;
         },null,"_IconWidgetStylePanel_WidgetFormItem2.visible");
         result[5] = new Binding(this,function():Boolean
         {
            return showGridOptions;
         },null,"_IconWidgetStylePanel_WidgetFormItem2.includeInLayout");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Display");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_IconWidgetStylePanel_WidgetFormItem3.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Percentage");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"percentageDisplayOption.label");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Value");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"valueDisplayOption.label");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Font");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_IconWidgetStylePanel_WidgetFormItem4.label");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Back");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"backButton.label");
         result[11] = new Binding(this,function():ProductGroupCollection
         {
            return _propSource;
         },null,"propExplorer.productProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get animation() : Animate
      {
         return this._1118509956animation;
      }
      
      public function set animation(param1:Animate) : void
      {
         var _loc2_:Object = this._1118509956animation;
         if(_loc2_ !== param1)
         {
            this._1118509956animation = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animation",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backButton() : LinkArrowButton
      {
         return this._1906413305backButton;
      }
      
      public function set backButton(param1:LinkArrowButton) : void
      {
         var _loc2_:Object = this._1906413305backButton;
         if(_loc2_ !== param1)
         {
            this._1906413305backButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backButton",_loc2_,param1));
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
      public function get containerGroup() : HGroup
      {
         return this._833446526containerGroup;
      }
      
      public function set containerGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._833446526containerGroup;
         if(_loc2_ !== param1)
         {
            this._833446526containerGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"containerGroup",_loc2_,param1));
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
      public function get headerGroup() : Group
      {
         return this._1161933810headerGroup;
      }
      
      public function set headerGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1161933810headerGroup;
         if(_loc2_ !== param1)
         {
            this._1161933810headerGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconOptionGroup() : Group
      {
         return this._966890705iconOptionGroup;
      }
      
      public function set iconOptionGroup(param1:Group) : void
      {
         var _loc2_:Object = this._966890705iconOptionGroup;
         if(_loc2_ !== param1)
         {
            this._966890705iconOptionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconOptionGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconWidgetChangeButton() : IconWidgetDisplay
      {
         return this._421279679iconWidgetChangeButton;
      }
      
      public function set iconWidgetChangeButton(param1:IconWidgetDisplay) : void
      {
         var _loc2_:Object = this._421279679iconWidgetChangeButton;
         if(_loc2_ !== param1)
         {
            this._421279679iconWidgetChangeButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconWidgetChangeButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconWidgetChangeLink() : Button
      {
         return this._1679720505iconWidgetChangeLink;
      }
      
      public function set iconWidgetChangeLink(param1:Button) : void
      {
         var _loc2_:Object = this._1679720505iconWidgetChangeLink;
         if(_loc2_ !== param1)
         {
            this._1679720505iconWidgetChangeLink = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconWidgetChangeLink",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get normalOptionGroup() : Group
      {
         return this._1850661981normalOptionGroup;
      }
      
      public function set normalOptionGroup(param1:Group) : void
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
      public function get propExplorer() : ProductExplorer
      {
         return this._104484034propExplorer;
      }
      
      public function set propExplorer(param1:ProductExplorer) : void
      {
         var _loc2_:Object = this._104484034propExplorer;
         if(_loc2_ !== param1)
         {
            this._104484034propExplorer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"propExplorer",_loc2_,param1));
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
      public function get widgetGridGroup() : IconWidgetGridGroup
      {
         return this._560879371widgetGridGroup;
      }
      
      public function set widgetGridGroup(param1:IconWidgetGridGroup) : void
      {
         var _loc2_:Object = this._560879371widgetGridGroup;
         if(_loc2_ !== param1)
         {
            this._560879371widgetGridGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widgetGridGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _propSource() : SwapPropExplorerCollection
      {
         return this._355797251_propSource;
      }
      
      private function set _propSource(param1:SwapPropExplorerCollection) : void
      {
         var _loc2_:Object = this._355797251_propSource;
         if(_loc2_ !== param1)
         {
            this._355797251_propSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_propSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get showGridOptions() : Boolean
      {
         return this._1359579845showGridOptions;
      }
      
      private function set showGridOptions(param1:Boolean) : void
      {
         var _loc2_:Object = this._1359579845showGridOptions;
         if(_loc2_ !== param1)
         {
            this._1359579845showGridOptions = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showGridOptions",_loc2_,param1));
            }
         }
      }
   }
}
