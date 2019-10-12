package anifire.studio.skins
{
   import anifire.studio.components.ChartDataGrid;
   import anifire.studio.components.IconButton;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
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
   import spark.components.Button;
   import spark.components.Grid;
   import spark.components.GridColumnHeaderGroup;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.components.gridClasses.GridLayer;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   import spark.skins.spark.DefaultGridItemRenderer;
   
   use namespace mx_internal;
   
   public class WidgetDataGridSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static const exclusions:Array = ["scroller","background","columnHeaderGroup"];
      
      private static const contentFill:Array = ["bgFill"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _WidgetDataGridSkin_Group2:Group;
      
      public var _WidgetDataGridSkin_Group3:Group;
      
      public var _WidgetDataGridSkin_Group6:Group;
      
      public var _WidgetDataGridSkin_Group8:Group;
      
      public var _WidgetDataGridSkin_Line2:Line;
      
      public var _WidgetDataGridSkin_Rect2:Rect;
      
      private var _1140027753addColumnButton:Button;
      
      private var _389041675addRowButton:Button;
      
      private var _1277490047alternatingRowColorsBackground:ClassFactory;
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _502679092caretIndicator:ClassFactory;
      
      private var _61783163columnDragIndicator:Group;
      
      private var _1482148164columnHeaderGroup:GridColumnHeaderGroup;
      
      private var _237342767columnSeparator:ClassFactory;
      
      private var _1245745987deleteButton:Button;
      
      private var _1555036382editorIndicator:ClassFactory;
      
      private var _3181382grid:Grid;
      
      private var _832945652gridViewport:VGroup;
      
      private var _1346001378headerColumnSeparator:ClassFactory;
      
      private var _1027582576headerRenderer:ClassFactory;
      
      private var _1683467992headerSeparator:Line;
      
      private var _1933789133hoverIndicator:ClassFactory;
      
      private var _562923931maxRowCountLabel:Label;
      
      private var _810554241rowDragIndicator:Group;
      
      private var _1763950123rowSeparator:ClassFactory;
      
      private var _402164678scroller:Scroller;
      
      private var _627206627selectionIndicator:ClassFactory;
      
      private var _1062186970swapAxisButton:IconButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_widget_img_swaprange_hover_png_249078071:Class;
      
      private var _embed_mxml__styles_images_widget_img_swaprange_init_png_1728204937:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ChartDataGrid;
      
      public function WidgetDataGridSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_widget_img_swaprange_hover_png_249078071 = WidgetDataGridSkin__embed_mxml__styles_images_widget_img_swaprange_hover_png_249078071;
         this._embed_mxml__styles_images_widget_img_swaprange_init_png_1728204937 = WidgetDataGridSkin__embed_mxml__styles_images_widget_img_swaprange_init_png_1728204937;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._WidgetDataGridSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_WidgetDataGridSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return WidgetDataGridSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 89;
         this.minHeight = 84;
         this.mxmlContent = [this._WidgetDataGridSkin_Rect1_i(),this._WidgetDataGridSkin_VGroup1_c(),this._WidgetDataGridSkin_Group6_i(),this._WidgetDataGridSkin_Rect4_i(),this._WidgetDataGridSkin_Group8_i()];
         this.currentState = "normal";
         this._WidgetDataGridSkin_ClassFactory1_i();
         this._WidgetDataGridSkin_ClassFactory2_i();
         this._WidgetDataGridSkin_ClassFactory3_i();
         this._WidgetDataGridSkin_ClassFactory9_i();
         this._WidgetDataGridSkin_ClassFactory4_i();
         this._WidgetDataGridSkin_ClassFactory5_i();
         this._WidgetDataGridSkin_ClassFactory6_i();
         this._WidgetDataGridSkin_ClassFactory7_i();
         this._WidgetDataGridSkin_ClassFactory8_i();
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
         WidgetDataGridSkin._watcherSetupUtil = param1;
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override public function get contentItems() : Array
      {
         return contentFill;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(getStyle("borderVisible") == true)
         {
            this.border.visible = true;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 1;
            this.scroller.minViewportInset = 1;
         }
         else
         {
            this.border.visible = false;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 0;
            this.scroller.minViewportInset = 0;
         }
         this.borderStroke.color = getStyle("borderColor");
         this.borderStroke.alpha = getStyle("borderAlpha");
         super.updateDisplayList(param1,param2);
      }
      
      private function _WidgetDataGridSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.alternatingRowColorsBackground = _loc1_;
         BindingManager.executeBindings(this,"alternatingRowColorsBackground",this.alternatingRowColorsBackground);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory2_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass1;
         _loc1_.properties = {"outerDocument":this};
         this.caretIndicator = _loc1_;
         BindingManager.executeBindings(this,"caretIndicator",this.caretIndicator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory3_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass2;
         _loc1_.properties = {"outerDocument":this};
         this.columnSeparator = _loc1_;
         BindingManager.executeBindings(this,"columnSeparator",this.columnSeparator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory9_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass8;
         _loc1_.properties = {"outerDocument":this};
         this.editorIndicator = _loc1_;
         BindingManager.executeBindings(this,"editorIndicator",this.editorIndicator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory4_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass3;
         _loc1_.properties = {"outerDocument":this};
         this.headerColumnSeparator = _loc1_;
         BindingManager.executeBindings(this,"headerColumnSeparator",this.headerColumnSeparator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory5_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass4;
         _loc1_.properties = {"outerDocument":this};
         this.headerRenderer = _loc1_;
         BindingManager.executeBindings(this,"headerRenderer",this.headerRenderer);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory6_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass5;
         _loc1_.properties = {"outerDocument":this};
         this.hoverIndicator = _loc1_;
         BindingManager.executeBindings(this,"hoverIndicator",this.hoverIndicator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory7_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass6;
         _loc1_.properties = {"outerDocument":this};
         this.rowSeparator = _loc1_;
         BindingManager.executeBindings(this,"rowSeparator",this.rowSeparator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory8_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = WidgetDataGridSkinInnerClass7;
         _loc1_.properties = {"outerDocument":this};
         this.selectionIndicator = _loc1_;
         BindingManager.executeBindings(this,"selectionIndicator",this.selectionIndicator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._WidgetDataGridSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "justify";
         _loc1_.gap = -1;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_HGroup1_c(),this._WidgetDataGridSkin_Line1_i(),this._WidgetDataGridSkin_Group1_c(),this._WidgetDataGridSkin_Group5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_GridColumnHeaderGroup1_i(),this._WidgetDataGridSkin_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_GridColumnHeaderGroup1_i() : GridColumnHeaderGroup
      {
         var _loc1_:GridColumnHeaderGroup = new GridColumnHeaderGroup();
         _loc1_.percentWidth = 100;
         _loc1_.minHeight = 21;
         _loc1_.setStyle("paddingLeft",1);
         _loc1_.setStyle("paddingTop",1);
         _loc1_.setStyle("paddingRight",1);
         _loc1_.id = "columnHeaderGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.columnHeaderGroup = _loc1_;
         BindingManager.executeBindings(this,"columnHeaderGroup",this.columnHeaderGroup);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",ChartDataGridAddColumnButtonSkin);
         _loc1_.id = "addColumnButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.addColumnButton = _loc1_;
         BindingManager.executeBindings(this,"addColumnButton",this.addColumnButton);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.stroke = this._WidgetDataGridSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"headerSeparator");
         this.headerSeparator = _loc1_;
         BindingManager.executeBindings(this,"headerSeparator",this.headerSeparator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15132390;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Scroller1_i(),this._WidgetDataGridSkin_Rect2_i(),this._WidgetDataGridSkin_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.minViewportInset = 0;
         _loc1_.hasFocusableChildren = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._WidgetDataGridSkin_VGroup2_i();
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Grid1_i(),this._WidgetDataGridSkin_Button2_i(),this._WidgetDataGridSkin_Group2_i()];
         _loc1_.id = "gridViewport";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gridViewport = _loc1_;
         BindingManager.executeBindings(this,"gridViewport",this.gridViewport);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Grid1_i() : Grid
      {
         var _loc1_:Grid = new Grid();
         _loc1_.itemRenderer = this._WidgetDataGridSkin_ClassFactory10_c();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_GridLayer1_c(),this._WidgetDataGridSkin_GridLayer2_c(),this._WidgetDataGridSkin_GridLayer3_c(),this._WidgetDataGridSkin_GridLayer4_c(),this._WidgetDataGridSkin_GridLayer5_c()];
         _loc1_.id = "grid";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.grid = _loc1_;
         BindingManager.executeBindings(this,"grid",this.grid);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_ClassFactory10_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultGridItemRenderer;
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_GridLayer1_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "backgroundLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_GridLayer2_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "selectionLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_GridLayer3_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "editorIndicatorLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_GridLayer4_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "rendererLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_GridLayer5_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "overlayLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",AddWidgetDataRowButtonSkin);
         _loc1_.id = "addRowButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.addRowButton = _loc1_;
         BindingManager.executeBindings(this,"addRowButton",this.addRowButton);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 20;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Line2_i(),this._WidgetDataGridSkin_Label1_i()];
         _loc1_.id = "_WidgetDataGridSkin_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WidgetDataGridSkin_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetDataGridSkin_Group2",this._WidgetDataGridSkin_Group2);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.stroke = this._WidgetDataGridSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,"_WidgetDataGridSkin_Line2");
         this._WidgetDataGridSkin_Line2 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetDataGridSkin_Line2",this._WidgetDataGridSkin_Line2);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15132390;
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 5;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("color",12303291);
         _loc1_.setStyle("fontSize",10);
         _loc1_.id = "maxRowCountLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.maxRowCountLabel = _loc1_;
         BindingManager.executeBindings(this,"maxRowCountLabel",this.maxRowCountLabel);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.height = 10;
         _loc1_.fill = this._WidgetDataGridSkin_LinearGradient1_c();
         _loc1_.initialized(this,"_WidgetDataGridSkin_Rect2");
         this._WidgetDataGridSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetDataGridSkin_Rect2",this._WidgetDataGridSkin_Rect2);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._WidgetDataGridSkin_GradientEntry1_c(),this._WidgetDataGridSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 15;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Group4_i()];
         _loc1_.id = "_WidgetDataGridSkin_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WidgetDataGridSkin_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetDataGridSkin_Group3",this._WidgetDataGridSkin_Group3);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.height = 2;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Line3_c()];
         _loc1_.id = "rowDragIndicator";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rowDragIndicator = _loc1_;
         BindingManager.executeBindings(this,"rowDragIndicator",this.rowDragIndicator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.height = 2;
         _loc1_.stroke = this._WidgetDataGridSkin_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16762237;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group5_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Rect3_c(),this._WidgetDataGridSkin_Button3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._WidgetDataGridSkin_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15132390;
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.height = 25;
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.setStyle("skinClass",WidgetDataGridDeleteButtonSkin);
         _loc1_.id = "deleteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deleteButton = _loc1_;
         BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Group7_c()];
         _loc1_.id = "_WidgetDataGridSkin_Group6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WidgetDataGridSkin_Group6 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetDataGridSkin_Group6",this._WidgetDataGridSkin_Group6);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group7_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 80;
         _loc1_.height = 30;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_IconButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.buttonMode = true;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("icon",this._embed_mxml__styles_images_widget_img_swaprange_init_png_1728204937);
         _loc1_.setStyle("iconOver",this._embed_mxml__styles_images_widget_img_swaprange_hover_png_249078071);
         _loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_widget_img_swaprange_hover_png_249078071);
         _loc1_.id = "swapAxisButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swapAxisButton = _loc1_;
         BindingManager.executeBindings(this,"swapAxisButton",this.swapAxisButton);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._WidgetDataGridSkin_SolidColorStroke5_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_SolidColorStroke5_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.bottom = 26;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Group9_i()];
         _loc1_.id = "_WidgetDataGridSkin_Group8";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._WidgetDataGridSkin_Group8 = _loc1_;
         BindingManager.executeBindings(this,"_WidgetDataGridSkin_Group8",this._WidgetDataGridSkin_Group8);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Group9_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 2;
         _loc1_.visible = false;
         _loc1_.mxmlContent = [this._WidgetDataGridSkin_Line4_c()];
         _loc1_.id = "columnDragIndicator";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.columnDragIndicator = _loc1_;
         BindingManager.executeBindings(this,"columnDragIndicator",this.columnDragIndicator);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 2;
         _loc1_.stroke = this._WidgetDataGridSkin_SolidColorStroke6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_SolidColorStroke6_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16762237;
         _loc1_.weight = 2;
         return _loc1_;
      }
      
      private function _WidgetDataGridSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"columnHeaderGroup.columnSeparator","headerColumnSeparator");
         result[1] = new Binding(this,null,null,"columnHeaderGroup.headerRenderer","headerRenderer");
         result[2] = new Binding(this,function():Number
         {
            return gridViewport.horizontalScrollPosition;
         },null,"columnHeaderGroup.horizontalScrollPosition");
         result[3] = new Binding(this,function():Number
         {
            return grid.width;
         },null,"addRowButton.width");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Add data");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"addRowButton.label");
         result[5] = new Binding(this,function():Boolean
         {
            return hostComponent.showMaxRowCountLabel;
         },null,"_WidgetDataGridSkin_Group2.visible");
         result[6] = new Binding(this,function():Boolean
         {
            return hostComponent.showMaxRowCountLabel;
         },null,"_WidgetDataGridSkin_Group2.includeInLayout");
         result[7] = new Binding(this,function():Number
         {
            return grid.width;
         },null,"_WidgetDataGridSkin_Line2.width");
         result[8] = new Binding(this,function():Boolean
         {
            return gridViewport.verticalScrollPosition > 0;
         },null,"_WidgetDataGridSkin_Rect2.visible");
         result[9] = new Binding(this,function():Number
         {
            return gridViewport.verticalScrollPosition;
         },null,"_WidgetDataGridSkin_Group3.verticalScrollPosition");
         result[10] = new Binding(this,function():Number
         {
            return gridViewport.horizontalScrollPosition;
         },null,"_WidgetDataGridSkin_Group6.horizontalScrollPosition");
         result[11] = new Binding(this,function():Number
         {
            return gridViewport.horizontalScrollPosition;
         },null,"_WidgetDataGridSkin_Group8.horizontalScrollPosition");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get addColumnButton() : Button
      {
         return this._1140027753addColumnButton;
      }
      
      public function set addColumnButton(param1:Button) : void
      {
         var _loc2_:Object = this._1140027753addColumnButton;
         if(_loc2_ !== param1)
         {
            this._1140027753addColumnButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addColumnButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get addRowButton() : Button
      {
         return this._389041675addRowButton;
      }
      
      public function set addRowButton(param1:Button) : void
      {
         var _loc2_:Object = this._389041675addRowButton;
         if(_loc2_ !== param1)
         {
            this._389041675addRowButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addRowButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get alternatingRowColorsBackground() : ClassFactory
      {
         return this._1277490047alternatingRowColorsBackground;
      }
      
      public function set alternatingRowColorsBackground(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1277490047alternatingRowColorsBackground;
         if(_loc2_ !== param1)
         {
            this._1277490047alternatingRowColorsBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"alternatingRowColorsBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderStroke() : SolidColorStroke
      {
         return this._1395787140borderStroke;
      }
      
      public function set borderStroke(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1395787140borderStroke;
         if(_loc2_ !== param1)
         {
            this._1395787140borderStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get caretIndicator() : ClassFactory
      {
         return this._502679092caretIndicator;
      }
      
      public function set caretIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._502679092caretIndicator;
         if(_loc2_ !== param1)
         {
            this._502679092caretIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"caretIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get columnDragIndicator() : Group
      {
         return this._61783163columnDragIndicator;
      }
      
      public function set columnDragIndicator(param1:Group) : void
      {
         var _loc2_:Object = this._61783163columnDragIndicator;
         if(_loc2_ !== param1)
         {
            this._61783163columnDragIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnDragIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get columnHeaderGroup() : GridColumnHeaderGroup
      {
         return this._1482148164columnHeaderGroup;
      }
      
      public function set columnHeaderGroup(param1:GridColumnHeaderGroup) : void
      {
         var _loc2_:Object = this._1482148164columnHeaderGroup;
         if(_loc2_ !== param1)
         {
            this._1482148164columnHeaderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnHeaderGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get columnSeparator() : ClassFactory
      {
         return this._237342767columnSeparator;
      }
      
      public function set columnSeparator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._237342767columnSeparator;
         if(_loc2_ !== param1)
         {
            this._237342767columnSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get deleteButton() : Button
      {
         return this._1245745987deleteButton;
      }
      
      public function set deleteButton(param1:Button) : void
      {
         var _loc2_:Object = this._1245745987deleteButton;
         if(_loc2_ !== param1)
         {
            this._1245745987deleteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deleteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editorIndicator() : ClassFactory
      {
         return this._1555036382editorIndicator;
      }
      
      public function set editorIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1555036382editorIndicator;
         if(_loc2_ !== param1)
         {
            this._1555036382editorIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editorIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get grid() : Grid
      {
         return this._3181382grid;
      }
      
      public function set grid(param1:Grid) : void
      {
         var _loc2_:Object = this._3181382grid;
         if(_loc2_ !== param1)
         {
            this._3181382grid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"grid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gridViewport() : VGroup
      {
         return this._832945652gridViewport;
      }
      
      public function set gridViewport(param1:VGroup) : void
      {
         var _loc2_:Object = this._832945652gridViewport;
         if(_loc2_ !== param1)
         {
            this._832945652gridViewport = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gridViewport",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerColumnSeparator() : ClassFactory
      {
         return this._1346001378headerColumnSeparator;
      }
      
      public function set headerColumnSeparator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1346001378headerColumnSeparator;
         if(_loc2_ !== param1)
         {
            this._1346001378headerColumnSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerColumnSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerRenderer() : ClassFactory
      {
         return this._1027582576headerRenderer;
      }
      
      public function set headerRenderer(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1027582576headerRenderer;
         if(_loc2_ !== param1)
         {
            this._1027582576headerRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerRenderer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerSeparator() : Line
      {
         return this._1683467992headerSeparator;
      }
      
      public function set headerSeparator(param1:Line) : void
      {
         var _loc2_:Object = this._1683467992headerSeparator;
         if(_loc2_ !== param1)
         {
            this._1683467992headerSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hoverIndicator() : ClassFactory
      {
         return this._1933789133hoverIndicator;
      }
      
      public function set hoverIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1933789133hoverIndicator;
         if(_loc2_ !== param1)
         {
            this._1933789133hoverIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hoverIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maxRowCountLabel() : Label
      {
         return this._562923931maxRowCountLabel;
      }
      
      public function set maxRowCountLabel(param1:Label) : void
      {
         var _loc2_:Object = this._562923931maxRowCountLabel;
         if(_loc2_ !== param1)
         {
            this._562923931maxRowCountLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maxRowCountLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rowDragIndicator() : Group
      {
         return this._810554241rowDragIndicator;
      }
      
      public function set rowDragIndicator(param1:Group) : void
      {
         var _loc2_:Object = this._810554241rowDragIndicator;
         if(_loc2_ !== param1)
         {
            this._810554241rowDragIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowDragIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rowSeparator() : ClassFactory
      {
         return this._1763950123rowSeparator;
      }
      
      public function set rowSeparator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1763950123rowSeparator;
         if(_loc2_ !== param1)
         {
            this._1763950123rowSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionIndicator() : ClassFactory
      {
         return this._627206627selectionIndicator;
      }
      
      public function set selectionIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._627206627selectionIndicator;
         if(_loc2_ !== param1)
         {
            this._627206627selectionIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swapAxisButton() : IconButton
      {
         return this._1062186970swapAxisButton;
      }
      
      public function set swapAxisButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1062186970swapAxisButton;
         if(_loc2_ !== param1)
         {
            this._1062186970swapAxisButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapAxisButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ChartDataGrid
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ChartDataGrid) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
