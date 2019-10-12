package anifire.studio.components
{
   import anifire.event.ColorPaletteEvent;
   import anifire.event.CoreEvent;
   import anifire.studio.commands.ChangeFlowFrameColorCommand;
   import anifire.studio.commands.ChangeFlowFrameFitModeCommand;
   import anifire.studio.commands.ChangeFlowFrameImageCommand;
   import anifire.studio.commands.ChangeFlowFrameOpacityCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Console;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.PropThumb;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.FlowFrameEvent;
   import anifire.studio.events.ProductExplorerEvent;
   import anifire.studio.managers.ImporterManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.models.ProductGroupCollection;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.skins.FlowFrameScaleImageButtonSkin;
   import anifire.studio.skins.ForwardLinkButtonSkin;
   import anifire.studio.skins.LinkArrowBlackButtonSkin;
   import anifire.util.UtilDict;
   import flash.events.Event;
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
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.CheckBox;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.effects.Animate;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FlowFrameStylePanel extends spark.components.NavigatorContent implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FlowFrameStylePanel_Label1:Label;
      
      public var _FlowFrameStylePanel_Label2:Label;
      
      public var _FlowFrameStylePanel_Label3:Label;
      
      private var _1118509956animation:Animate;
      
      private var _1906413305backButton:LinkArrowButton;
      
      private var _24609303colorPaletteDropDown:ColorPaletteDropDown;
      
      private var _833446526containerGroup:HGroup;
      
      private var _1350550249fitModeCheckBox:CheckBox;
      
      private var _1161933810headerGroup:Group;
      
      private var _966890705iconOptionGroup:VGroup;
      
      private var _2024940825imageDisplay:FlowFrameImageDisplay;
      
      private var _104484034propExplorer:ProductExplorer;
      
      private var _1305707236scaleButton:Button;
      
      private var _517539622swapImageButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _355797251_propSource:ProductGroupCollection;
      
      private var _flowFrame:FlowFrame;
      
      private var _389689440_showScaleButton:Boolean;
      
      private var _colorCommand:ChangeFlowFrameColorCommand;
      
      private var _opacityCommand:ChangeFlowFrameOpacityCommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FlowFrameStylePanel()
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
         bindings = this._FlowFrameStylePanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FlowFrameStylePanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FlowFrameStylePanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.transitions = [this._FlowFrameStylePanel_Transition1_c()];
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._FlowFrameStylePanel_Array3_c);
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"tray",
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
         FlowFrameStylePanel._watcherSetupUtil = param1;
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
      
      public function set flowFrame(param1:FlowFrame) : void
      {
         if(param1)
         {
            if(param1.isAddButtonClicked)
            {
               currentState = "tray";
            }
            else
            {
               currentState = "normal";
            }
            param1.resetAddButtonClick();
         }
         if(this._flowFrame == param1)
         {
            return;
         }
         if(this._flowFrame)
         {
            this._flowFrame.removeEventListener(FlowFrameEvent.IMAGE_CHANGE,this.flowFrame_imageChangeHandler);
            this._flowFrame.removeEventListener(FlowFrameEvent.FIT_MODE_CHANGE,this.flowFrame_fitModeChangeHandler);
            this._flowFrame.removeEventListener(AssetEvent.COLOR_CHANGE,this.flowFrame_colorChangeHandler);
         }
         this._flowFrame = param1;
         if(this._flowFrame)
         {
            this.updatePropSource();
            this.propExplorer.clearProductSelection();
            this.updateImageDisplay();
            this.colorPaletteDropDown.selectedColor = this._flowFrame.color;
            this.colorPaletteDropDown.selectedAlpha = this._flowFrame.opacity;
            this.fitModeCheckBox.selected = this._flowFrame.fitMode == FlowFrame.IMAGE_FIT_MODE_FIT_TO_IMAGE;
            this._colorCommand = new ChangeFlowFrameColorCommand(this._flowFrame);
            this._opacityCommand = new ChangeFlowFrameOpacityCommand(this._flowFrame);
            this._flowFrame.addEventListener(FlowFrameEvent.IMAGE_CHANGE,this.flowFrame_imageChangeHandler);
            this._flowFrame.addEventListener(FlowFrameEvent.FIT_MODE_CHANGE,this.flowFrame_fitModeChangeHandler);
            this._flowFrame.addEventListener(AssetEvent.COLOR_CHANGE,this.flowFrame_colorChangeHandler);
            this._flowFrame.addEventListener(FlowFrameEvent.FLOWFRAME_CLICKED,this.flowFrame_addButtonClickHanlder);
         }
      }
      
      private function flowFrame_addButtonClickHanlder(param1:FlowFrameEvent) : void
      {
         if(this._flowFrame.isAddButtonClicked)
         {
            currentState = "tray";
         }
         else
         {
            currentState = "normal";
         }
      }
      
      private function flowFrame_imageChangeHandler(param1:FlowFrameEvent) : void
      {
         this.propExplorer.clearProductSelection();
         this.updateImageDisplay();
      }
      
      private function flowFrame_fitModeChangeHandler(param1:FlowFrameEvent) : void
      {
         this.fitModeCheckBox.selected = this._flowFrame.fitMode == FlowFrame.IMAGE_FIT_MODE_FIT_TO_IMAGE;
      }
      
      private function flowFrame_colorChangeHandler(param1:AssetEvent) : void
      {
         this.colorPaletteDropDown.selectedColor = this._flowFrame.color;
         this.colorPaletteDropDown.selectedAlpha = this._flowFrame.opacity;
      }
      
      private function updatePropSource() : void
      {
         var _loc1_:UserAssetManager = null;
         if(!this._propSource)
         {
            _loc1_ = UserAssetManager.instance;
            this._propSource = _loc1_.flowFrameImageSource;
            if(!_loc1_.userPropReady)
            {
               _loc1_.addEventListener(CoreEvent.USER_PROP_COMPLETE,this.onUserPropLoaded);
               this.propExplorer.loading = true;
               _loc1_.loadProp();
            }
            else
            {
               this.propExplorer.hideInvalidCategories();
               this.propExplorer.selectProperCategoryIfNoSelection();
            }
            this.propExplorer.displayNaturally();
         }
      }
      
      protected function onUserPropLoaded(param1:CoreEvent) : void
      {
         this.propExplorer.hideInvalidCategories();
         this.propExplorer.selectProperCategoryIfNoSelection();
         this.propExplorer.loading = false;
         this.updateImageDisplay();
      }
      
      private function updateImageDisplay() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:PropThumb = null;
         if(!this._flowFrame)
         {
            return;
         }
         if(this._flowFrame.innerImageId)
         {
            _loc1_ = this._flowFrame.innerImageId.split(".");
            _loc2_ = _loc1_[0];
            _loc3_ = _loc1_.length == 4?_loc1_[1]:_loc1_[1] + "." + _loc1_[2];
            _loc4_ = ThemeManager.instance.getPropById(_loc2_,_loc3_);
            if(_loc4_)
            {
               this.imageDisplay.data = new ThumbModel(_loc4_);
            }
            this._showScaleButton = true;
         }
         else
         {
            this.imageDisplay.data = null;
            this._showScaleButton = false;
         }
      }
      
      protected function propExplorer_productSelectedHandler(param1:Event) : void
      {
         var _loc4_:ICommand = null;
         if(!this._flowFrame)
         {
            return;
         }
         var _loc2_:ThumbModel = this.propExplorer.selectedProduct as ThumbModel;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:PropThumb = _loc2_.thumb as PropThumb;
         if(_loc3_)
         {
            _loc4_ = new ChangeFlowFrameImageCommand(this._flowFrame,_loc3_.themeId + "." + _loc3_.id);
            _loc4_.execute();
         }
         else if(_loc2_.placeHolderValue == ThumbModel.PLACE_HOLDER_REMOVE_INNER_IMAGE)
         {
            _loc4_ = new ChangeFlowFrameImageCommand(this._flowFrame,null);
            _loc4_.execute();
         }
         else if(_loc2_.placeHolderValue == ThumbModel.PLACE_HOLDER_ADD_INNER_IMAGE)
         {
            ImporterManager.instance.showImporter();
            this.propExplorer.clearProductSelection();
         }
      }
      
      protected function swapImageButton_clickHandler(param1:MouseEvent) : void
      {
         this.displayInnerImageTray();
      }
      
      protected function flowFrameImageDisplay_clickHandler(param1:MouseEvent) : void
      {
         this.displayInnerImageTray();
      }
      
      protected function backButton_clickHandler(param1:MouseEvent) : void
      {
         currentState = "normal";
      }
      
      protected function scaleButton_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Console = Console.getConsole();
         _loc2_.openFlowFrameImageEditor(this._flowFrame);
      }
      
      protected function colorPaletteDropDown_colorChangeHandler(param1:ColorPaletteEvent) : void
      {
         if(this._flowFrame)
         {
            if(this._colorCommand)
            {
               this._colorCommand.executeNow(param1.colorCode as uint);
            }
            this._colorCommand = new ChangeFlowFrameColorCommand(this._flowFrame);
         }
      }
      
      protected function colorPaletteDropDown_colorPreviewHandler(param1:ColorPaletteEvent) : void
      {
         if(this._flowFrame)
         {
            this._flowFrame.color = param1.colorCode as uint;
         }
      }
      
      protected function colorPaletteDropDown_alphaChangeHandler(param1:ColorPaletteEvent) : void
      {
         if(this._flowFrame)
         {
            if(this._opacityCommand)
            {
               this._opacityCommand.executeNow(param1.alpha);
            }
            this._opacityCommand = new ChangeFlowFrameOpacityCommand(this._flowFrame);
         }
      }
      
      protected function colorPaletteDropDown_alphaPreviewHandler(param1:ColorPaletteEvent) : void
      {
         if(this._flowFrame)
         {
            this._flowFrame.opacity = param1.alpha;
         }
      }
      
      protected function fitModeCheckBox_changeHandler(param1:Event) : void
      {
         var _loc2_:ChangeFlowFrameFitModeCommand = null;
         if(this._flowFrame)
         {
            _loc2_ = new ChangeFlowFrameFitModeCommand(this._flowFrame,!!this.fitModeCheckBox.selected?int(FlowFrame.IMAGE_FIT_MODE_FIT_TO_IMAGE):int(FlowFrame.IMAGE_FIT_MODE_FIT_TO_FRAME));
            _loc2_.execute();
         }
      }
      
      public function displayInnerImageTray() : void
      {
         currentState = "tray";
      }
      
      private function _FlowFrameStylePanel_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "*";
         _loc1_.effect = this._FlowFrameStylePanel_Animate1_i();
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Animate1_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 200;
         _loc1_.motionPaths = new <MotionPath>[this._FlowFrameStylePanel_SimpleMotionPath1_c()];
         this.animation = _loc1_;
         BindingManager.executeBindings(this,"animation",this.animation);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_SimpleMotionPath1_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "horizontalScrollPosition";
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Array3_c() : Array
      {
         var _loc1_:Array = [this._FlowFrameStylePanel_Rect1_c(),this._FlowFrameStylePanel_HGroup1_i()];
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._FlowFrameStylePanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 0;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_Group1_c(),this._FlowFrameStylePanel_VGroup5_i()];
         _loc1_.id = "containerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.containerGroup = _loc1_;
         BindingManager.executeBindings(this,"containerGroup",this.containerGroup);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_Rect2_c(),this._FlowFrameStylePanel_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 14;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.height = 10;
         _loc1_.fill = this._FlowFrameStylePanel_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._FlowFrameStylePanel_GradientEntry1_c(),this._FlowFrameStylePanel_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 310;
         _loc1_.gap = 14;
         _loc1_.paddingTop = 28;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_VGroup2_c(),this._FlowFrameStylePanel_Line1_c(),this._FlowFrameStylePanel_VGroup3_c(),this._FlowFrameStylePanel_Line2_c(),this._FlowFrameStylePanel_VGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 7;
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_Label1_i(),this._FlowFrameStylePanel_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5724523);
         _loc1_.id = "_FlowFrameStylePanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FlowFrameStylePanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_FlowFrameStylePanel_Label1",this._FlowFrameStylePanel_Label1);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_FlowFrameImageDisplay1_i(),this._FlowFrameStylePanel_Button1_i(),this._FlowFrameStylePanel_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_FlowFrameImageDisplay1_i() : FlowFrameImageDisplay
      {
         var _loc1_:FlowFrameImageDisplay = new FlowFrameImageDisplay();
         _loc1_.addEventListener("click",this.__imageDisplay_click);
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      public function __imageDisplay_click(param1:MouseEvent) : void
      {
         this.flowFrameImageDisplay_clickHandler(param1);
      }
      
      private function _FlowFrameStylePanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.right = 0;
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.setStyle("skinClass",ForwardLinkButtonSkin);
         _loc1_.addEventListener("click",this.__swapImageButton_click);
         _loc1_.id = "swapImageButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swapImageButton = _loc1_;
         BindingManager.executeBindings(this,"swapImageButton",this.swapImageButton);
         return _loc1_;
      }
      
      public function __swapImageButton_click(param1:MouseEvent) : void
      {
         this.swapImageButton_clickHandler(param1);
      }
      
      private function _FlowFrameStylePanel_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.setStyle("skinClass",FlowFrameScaleImageButtonSkin);
         _loc1_.addEventListener("click",this.__scaleButton_click);
         _loc1_.id = "scaleButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scaleButton = _loc1_;
         BindingManager.executeBindings(this,"scaleButton",this.scaleButton);
         return _loc1_;
      }
      
      public function __scaleButton_click(param1:MouseEvent) : void
      {
         this.scaleButton_clickHandler(param1);
      }
      
      private function _FlowFrameStylePanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._FlowFrameStylePanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 7;
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_Label2_i(),this._FlowFrameStylePanel_CheckBox1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5724523);
         _loc1_.id = "_FlowFrameStylePanel_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FlowFrameStylePanel_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_FlowFrameStylePanel_Label2",this._FlowFrameStylePanel_Label2);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__fitModeCheckBox_change);
         _loc1_.id = "fitModeCheckBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fitModeCheckBox = _loc1_;
         BindingManager.executeBindings(this,"fitModeCheckBox",this.fitModeCheckBox);
         return _loc1_;
      }
      
      public function __fitModeCheckBox_change(param1:Event) : void
      {
         this.fitModeCheckBox_changeHandler(param1);
      }
      
      private function _FlowFrameStylePanel_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._FlowFrameStylePanel_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 7;
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_Label3_i(),this._FlowFrameStylePanel_ColorPaletteDropDown1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5724523);
         _loc1_.id = "_FlowFrameStylePanel_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FlowFrameStylePanel_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_FlowFrameStylePanel_Label3",this._FlowFrameStylePanel_Label3);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_ColorPaletteDropDown1_i() : ColorPaletteDropDown
      {
         var _loc1_:ColorPaletteDropDown = new ColorPaletteDropDown();
         _loc1_.allowTransparent = true;
         _loc1_.addEventListener("colorChange",this.__colorPaletteDropDown_colorChange);
         _loc1_.addEventListener("colorPreview",this.__colorPaletteDropDown_colorPreview);
         _loc1_.addEventListener("alphaChange",this.__colorPaletteDropDown_alphaChange);
         _loc1_.addEventListener("alphaPreview",this.__colorPaletteDropDown_alphaPreview);
         _loc1_.id = "colorPaletteDropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPaletteDropDown = _loc1_;
         BindingManager.executeBindings(this,"colorPaletteDropDown",this.colorPaletteDropDown);
         return _loc1_;
      }
      
      public function __colorPaletteDropDown_colorChange(param1:ColorPaletteEvent) : void
      {
         this.colorPaletteDropDown_colorChangeHandler(param1);
      }
      
      public function __colorPaletteDropDown_colorPreview(param1:ColorPaletteEvent) : void
      {
         this.colorPaletteDropDown_colorPreviewHandler(param1);
      }
      
      public function __colorPaletteDropDown_alphaChange(param1:ColorPaletteEvent) : void
      {
         this.colorPaletteDropDown_alphaChangeHandler(param1);
      }
      
      public function __colorPaletteDropDown_alphaPreview(param1:ColorPaletteEvent) : void
      {
         this.colorPaletteDropDown_alphaPreviewHandler(param1);
      }
      
      private function _FlowFrameStylePanel_VGroup5_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 310;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_Group3_i(),this._FlowFrameStylePanel_ProductExplorer1_i()];
         _loc1_.id = "iconOptionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.iconOptionGroup = _loc1_;
         BindingManager.executeBindings(this,"iconOptionGroup",this.iconOptionGroup);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_Rect3_c(),this._FlowFrameStylePanel_HGroup2_c()];
         _loc1_.id = "headerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.headerGroup = _loc1_;
         BindingManager.executeBindings(this,"headerGroup",this.headerGroup);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FlowFrameStylePanel_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.paddingRight = 10;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._FlowFrameStylePanel_LinkArrowButton1_i(),this._FlowFrameStylePanel_Line3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_LinkArrowButton1_i() : LinkArrowButton
      {
         var _loc1_:LinkArrowButton = new LinkArrowButton();
         _loc1_.setStyle("skinClass",LinkArrowBlackButtonSkin);
         _loc1_.setStyle("arrowPosition","left");
         _loc1_.setStyle("arrowDirection","left");
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
         this.backButton_clickHandler(param1);
      }
      
      private function _FlowFrameStylePanel_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.height = 16;
         _loc1_.stroke = this._FlowFrameStylePanel_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13750737;
         return _loc1_;
      }
      
      private function _FlowFrameStylePanel_ProductExplorer1_i() : ProductExplorer
      {
         var _loc1_:ProductExplorer = new ProductExplorer();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.categoryListWidth = 102;
         _loc1_.allowSelection = true;
         _loc1_.productRenderer = this._FlowFrameStylePanel_ClassFactory1_c();
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
      
      private function _FlowFrameStylePanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = SwapPropRenderer;
         return _loc1_;
      }
      
      public function __propExplorer_productSelected(param1:ProductExplorerEvent) : void
      {
         this.propExplorer_productSelectedHandler(param1);
      }
      
      private function _FlowFrameStylePanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"animation.target","containerGroup");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Image");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_FlowFrameStylePanel_Label1.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Swap/ delete image");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"swapImageButton.label");
         result[3] = new Binding(this,function():Boolean
         {
            return _showScaleButton;
         },null,"scaleButton.visible");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Scale");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"scaleButton.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Size");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_FlowFrameStylePanel_Label2.text");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Fit to image");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"fitModeCheckBox.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Background");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_FlowFrameStylePanel_Label3.text");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Back");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"backButton.label");
         result[9] = new Binding(this,function():ProductGroupCollection
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
      public function get colorPaletteDropDown() : ColorPaletteDropDown
      {
         return this._24609303colorPaletteDropDown;
      }
      
      public function set colorPaletteDropDown(param1:ColorPaletteDropDown) : void
      {
         var _loc2_:Object = this._24609303colorPaletteDropDown;
         if(_loc2_ !== param1)
         {
            this._24609303colorPaletteDropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPaletteDropDown",_loc2_,param1));
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
      public function get fitModeCheckBox() : CheckBox
      {
         return this._1350550249fitModeCheckBox;
      }
      
      public function set fitModeCheckBox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1350550249fitModeCheckBox;
         if(_loc2_ !== param1)
         {
            this._1350550249fitModeCheckBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fitModeCheckBox",_loc2_,param1));
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
      public function get iconOptionGroup() : VGroup
      {
         return this._966890705iconOptionGroup;
      }
      
      public function set iconOptionGroup(param1:VGroup) : void
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
      public function get imageDisplay() : FlowFrameImageDisplay
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:FlowFrameImageDisplay) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
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
      public function get scaleButton() : Button
      {
         return this._1305707236scaleButton;
      }
      
      public function set scaleButton(param1:Button) : void
      {
         var _loc2_:Object = this._1305707236scaleButton;
         if(_loc2_ !== param1)
         {
            this._1305707236scaleButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scaleButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swapImageButton() : Button
      {
         return this._517539622swapImageButton;
      }
      
      public function set swapImageButton(param1:Button) : void
      {
         var _loc2_:Object = this._517539622swapImageButton;
         if(_loc2_ !== param1)
         {
            this._517539622swapImageButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapImageButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _propSource() : ProductGroupCollection
      {
         return this._355797251_propSource;
      }
      
      private function set _propSource(param1:ProductGroupCollection) : void
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
      private function get _showScaleButton() : Boolean
      {
         return this._389689440_showScaleButton;
      }
      
      private function set _showScaleButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._389689440_showScaleButton;
         if(_loc2_ !== param1)
         {
            this._389689440_showScaleButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showScaleButton",_loc2_,param1));
            }
         }
      }
   }
}
