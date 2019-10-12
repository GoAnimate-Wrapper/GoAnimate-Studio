package anifire.studio.skins
{
   import anifire.studio.components.BusyIndicator;
   import anifire.studio.components.ProductExplorer;
   import anifire.studio.components.PropThumbRenderer;
   import anifire.studio.components.SearchSuggestionInput;
   import anifire.util.UtilDict;
   import flash.utils.Proxy;
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
   import mx.events.EffectEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.List;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   import spark.effects.Animate;
   import spark.effects.Resize;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ProductExplorerSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static const TRAY_WIDTH:Number = 310;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ProductExplorerSkin_Animate1:Animate;
      
      public var _ProductExplorerSkin_HGroup2:HGroup;
      
      public var _ProductExplorerSkin_Resize1:Resize;
      
      private var _1713077805_ProductExplorerSkin_SetProperty1:SetProperty;
      
      private var _1713077806_ProductExplorerSkin_SetProperty2:SetProperty;
      
      public var _ProductExplorerSkin_VGroup1:VGroup;
      
      private var _425996988categoryList:List;
      
      private var _1135072989categoryListGroup:Group;
      
      private var _434221093chromeGroup:Group;
      
      private var _1707945992contentContainer:HGroup;
      
      private var _1973266937folderBackButton:Button;
      
      private var _1502872353folderProductList:List;
      
      private var _710425824folderProductListGroup:Group;
      
      private var _1041072474folderSubtitle:Label;
      
      private var _100313738folderTitle:Label;
      
      private var _1389660835loadingGroup:Group;
      
      private var _1491869139productList:List;
      
      private var _263438014promptDisplay:Label;
      
      private var _559723774searchInput:SearchSuggestionInput;
      
      private var _767865699searchInputGroup:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ProductExplorer;
      
      public function ProductExplorerSkin()
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
         bindings = this._ProductExplorerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_ProductExplorerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProductExplorerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [this._ProductExplorerSkin_Transition1_c(),this._ProductExplorerSkin_Transition2_c()];
         this.mxmlContent = [this._ProductExplorerSkin_HGroup1_i()];
         this.currentState = "normal";
         var _ProductExplorerSkin_Group6_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductExplorerSkin_Group6_i);
         states = [new State({
            "name":"normal",
            "overrides":[this._ProductExplorerSkin_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "target":"categoryListGroup",
               "name":"width",
               "value":undefined
            }))]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductExplorerSkin_Group6_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentContainer"]
            })]
         }),new State({
            "name":"categoryExpanded",
            "overrides":[]
         }),new State({
            "name":"folderOpened",
            "overrides":[this._ProductExplorerSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"contentContainer",
               "name":"horizontalScrollPosition",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_ProductExplorerSkin_SetProperty2",this._ProductExplorerSkin_SetProperty2);
         BindingManager.executeBindings(this,"_ProductExplorerSkin_SetProperty1",this._ProductExplorerSkin_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ProductExplorerSkin._watcherSetupUtil = param1;
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
      
      protected function onResizeComplete(param1:EffectEvent) : void
      {
         if(currentState == "categoryExpanded")
         {
            this.categoryList.setStyle("verticalScrollPolicy","auto");
         }
         this.categoryList.autoLayout = true;
      }
      
      protected function onResizeStart(param1:EffectEvent) : void
      {
         if(currentState == "normal")
         {
            this.categoryList.setStyle("verticalScrollPolicy","off");
         }
         this.categoryList.autoLayout = false;
      }
      
      private function _ProductExplorerSkin_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "*";
         _loc1_.effect = this._ProductExplorerSkin_Resize1_i();
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Resize1_i() : Resize
      {
         var _loc1_:Resize = new Resize();
         _loc1_.duration = 250;
         _loc1_.addEventListener("effectStart",this.___ProductExplorerSkin_Resize1_effectStart);
         _loc1_.addEventListener("effectEnd",this.___ProductExplorerSkin_Resize1_effectEnd);
         this._ProductExplorerSkin_Resize1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerSkin_Resize1",this._ProductExplorerSkin_Resize1);
         return _loc1_;
      }
      
      public function ___ProductExplorerSkin_Resize1_effectStart(param1:EffectEvent) : void
      {
         this.onResizeStart(param1);
      }
      
      public function ___ProductExplorerSkin_Resize1_effectEnd(param1:EffectEvent) : void
      {
         this.onResizeComplete(param1);
      }
      
      private function _ProductExplorerSkin_Transition2_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "folderOpened";
         _loc1_.autoReverse = true;
         _loc1_.effect = this._ProductExplorerSkin_Animate1_i();
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Animate1_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 200;
         _loc1_.motionPaths = new <MotionPath>[this._ProductExplorerSkin_SimpleMotionPath1_c()];
         this._ProductExplorerSkin_Animate1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerSkin_Animate1",this._ProductExplorerSkin_Animate1);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SimpleMotionPath1_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "horizontalScrollPosition";
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_Group1_i(),this._ProductExplorerSkin_Group5_i()];
         _loc1_.id = "contentContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentContainer = _loc1_;
         BindingManager.executeBindings(this,"contentContainer",this.contentContainer);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_Rect1_c(),this._ProductExplorerSkin_HGroup2_i(),this._ProductExplorerSkin_Group3_i()];
         _loc1_.id = "chromeGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chromeGroup = _loc1_;
         BindingManager.executeBindings(this,"chromeGroup",this.chromeGroup);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ProductExplorerSkin_SolidColorStroke1_c();
         _loc1_.fill = this._ProductExplorerSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 14737632;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 1;
         _loc1_.paddingBottom = 1;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_Group2_c()];
         _loc1_.id = "_ProductExplorerSkin_HGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductExplorerSkin_HGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerSkin_HGroup2",this._ProductExplorerSkin_HGroup2);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_List1_i(),this._ProductExplorerSkin_VGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",ProductExplorerProductListSkin);
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.id = "productList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.productList = _loc1_;
         BindingManager.executeBindings(this,"productList",this.productList);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._ProductExplorerSkin_Spacer1_c(),this._ProductExplorerSkin_Label1_i(),this._ProductExplorerSkin_Spacer2_c()];
         _loc1_.id = "_ProductExplorerSkin_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductExplorerSkin_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductExplorerSkin_VGroup1",this._ProductExplorerSkin_VGroup1);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 30;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",26);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",6710886);
         _loc1_.id = "promptDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.promptDisplay = _loc1_;
         BindingManager.executeBindings(this,"promptDisplay",this.promptDisplay);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentHeight = 70;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_Rect2_c(),this._ProductExplorerSkin_VGroup2_c()];
         _loc1_.id = "categoryListGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categoryListGroup = _loc1_;
         BindingManager.executeBindings(this,"categoryListGroup",this.categoryListGroup);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ProductExplorerSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3233154;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 1;
         _loc1_.paddingBottom = 1;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_VGroup3_i(),this._ProductExplorerSkin_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_SearchSuggestionInput1_i(),this._ProductExplorerSkin_Line1_c()];
         _loc1_.id = "searchInputGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.searchInputGroup = _loc1_;
         BindingManager.executeBindings(this,"searchInputGroup",this.searchInputGroup);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SearchSuggestionInput1_i() : SearchSuggestionInput
      {
         var _loc1_:SearchSuggestionInput = new SearchSuggestionInput();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("skinClass",SearchSuggestionInputSkin);
         _loc1_.id = "searchInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.searchInput = _loc1_;
         BindingManager.executeBindings(this,"searchInput",this.searchInput);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ProductExplorerSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2771827;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_List2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_List2_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.useVirtualLayout = false;
         _loc1_.setStyle("skinClass",ProductExplorerCategoryListSkin);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.id = "categoryList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categoryList = _loc1_;
         BindingManager.executeBindings(this,"categoryList",this.categoryList);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_Rect3_c(),this._ProductExplorerSkin_VGroup4_c()];
         _loc1_.id = "folderProductListGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.folderProductListGroup = _loc1_;
         BindingManager.executeBindings(this,"folderProductListGroup",this.folderProductListGroup);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ProductExplorerSkin_SolidColor3_c();
         _loc1_.stroke = this._ProductExplorerSkin_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15594230;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14737632;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_VGroup5_c(),this._ProductExplorerSkin_List3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_VGroup5_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 5;
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 8;
         _loc1_.paddingBottom = 8;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_HGroup3_c(),this._ProductExplorerSkin_Line2_c(),this._ProductExplorerSkin_Spacer4_c(),this._ProductExplorerSkin_Label3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 8;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ProductExplorerSkin_Button1_i(),this._ProductExplorerSkin_Label2_i(),this._ProductExplorerSkin_Spacer3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",BackButtonSkin);
         _loc1_.id = "folderBackButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.folderBackButton = _loc1_;
         BindingManager.executeBindings(this,"folderBackButton",this.folderBackButton);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",9937845);
         _loc1_.id = "folderTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.folderTitle = _loc1_;
         BindingManager.executeBindings(this,"folderTitle",this.folderTitle);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 18;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ProductExplorerSkin_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13620453;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Spacer4_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 8;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "folderSubtitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.folderSubtitle = _loc1_;
         BindingManager.executeBindings(this,"folderSubtitle",this.folderSubtitle);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_List3_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ProductExplorerSkin_ClassFactory1_c();
         _loc1_.setStyle("skinClass",WidgetProductListSkin);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.id = "folderProductList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.folderProductList = _loc1_;
         BindingManager.executeBindings(this,"folderProductList",this.folderProductList);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = PropThumbRenderer;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 1;
         _loc1_.right = 0;
         _loc1_.bottom = 1;
         _loc1_.mxmlContent = [this._ProductExplorerSkin_Rect4_c(),this._ProductExplorerSkin_BusyIndicator1_c()];
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ProductExplorerSkin_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_BusyIndicator1_c() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProductExplorerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"_ProductExplorerSkin_Resize1.target","categoryListGroup");
         result[1] = new Binding(this,function():Array
         {
            var _loc1_:* = [contentContainer];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_ProductExplorerSkin_Animate1.targets");
         result[2] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"contentContainer.width");
         result[3] = new Binding(this,function():*
         {
            return TRAY_WIDTH;
         },null,"_ProductExplorerSkin_SetProperty1.value");
         result[4] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"chromeGroup.width");
         result[5] = new Binding(this,function():Object
         {
            return hostComponent.categoryListWidth;
         },null,"_ProductExplorerSkin_HGroup2.left");
         result[6] = new Binding(this,function():Boolean
         {
            return hostComponent.shouldDisplayPrompt();
         },null,"_ProductExplorerSkin_VGroup1.visible");
         result[7] = new Binding(this,function():Number
         {
            return hostComponent.categoryListWidth;
         },null,"categoryListGroup.minWidth");
         result[8] = new Binding(this,function():*
         {
            return hostComponent.categoryListWidth;
         },null,"_ProductExplorerSkin_SetProperty2.value");
         result[9] = new Binding(this,function():Number
         {
            return chromeGroup.width * 0.5;
         },null,"categoryListGroup.maxWidth");
         result[10] = new Binding(this,function():Number
         {
            return categoryList.height;
         },null,"searchInput.suggestionListMaxHeight");
         result[11] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Search...");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"searchInput.prompt");
         result[12] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"folderProductListGroup.width");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ProductExplorerSkin_SetProperty1() : SetProperty
      {
         return this._1713077805_ProductExplorerSkin_SetProperty1;
      }
      
      public function set _ProductExplorerSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1713077805_ProductExplorerSkin_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1713077805_ProductExplorerSkin_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ProductExplorerSkin_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ProductExplorerSkin_SetProperty2() : SetProperty
      {
         return this._1713077806_ProductExplorerSkin_SetProperty2;
      }
      
      public function set _ProductExplorerSkin_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1713077806_ProductExplorerSkin_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._1713077806_ProductExplorerSkin_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ProductExplorerSkin_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryList() : List
      {
         return this._425996988categoryList;
      }
      
      public function set categoryList(param1:List) : void
      {
         var _loc2_:Object = this._425996988categoryList;
         if(_loc2_ !== param1)
         {
            this._425996988categoryList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryListGroup() : Group
      {
         return this._1135072989categoryListGroup;
      }
      
      public function set categoryListGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1135072989categoryListGroup;
         if(_loc2_ !== param1)
         {
            this._1135072989categoryListGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryListGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chromeGroup() : Group
      {
         return this._434221093chromeGroup;
      }
      
      public function set chromeGroup(param1:Group) : void
      {
         var _loc2_:Object = this._434221093chromeGroup;
         if(_loc2_ !== param1)
         {
            this._434221093chromeGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chromeGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentContainer() : HGroup
      {
         return this._1707945992contentContainer;
      }
      
      public function set contentContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this._1707945992contentContainer;
         if(_loc2_ !== param1)
         {
            this._1707945992contentContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get folderBackButton() : Button
      {
         return this._1973266937folderBackButton;
      }
      
      public function set folderBackButton(param1:Button) : void
      {
         var _loc2_:Object = this._1973266937folderBackButton;
         if(_loc2_ !== param1)
         {
            this._1973266937folderBackButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"folderBackButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get folderProductList() : List
      {
         return this._1502872353folderProductList;
      }
      
      public function set folderProductList(param1:List) : void
      {
         var _loc2_:Object = this._1502872353folderProductList;
         if(_loc2_ !== param1)
         {
            this._1502872353folderProductList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"folderProductList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get folderProductListGroup() : Group
      {
         return this._710425824folderProductListGroup;
      }
      
      public function set folderProductListGroup(param1:Group) : void
      {
         var _loc2_:Object = this._710425824folderProductListGroup;
         if(_loc2_ !== param1)
         {
            this._710425824folderProductListGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"folderProductListGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get folderSubtitle() : Label
      {
         return this._1041072474folderSubtitle;
      }
      
      public function set folderSubtitle(param1:Label) : void
      {
         var _loc2_:Object = this._1041072474folderSubtitle;
         if(_loc2_ !== param1)
         {
            this._1041072474folderSubtitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"folderSubtitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get folderTitle() : Label
      {
         return this._100313738folderTitle;
      }
      
      public function set folderTitle(param1:Label) : void
      {
         var _loc2_:Object = this._100313738folderTitle;
         if(_loc2_ !== param1)
         {
            this._100313738folderTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"folderTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loadingGroup() : Group
      {
         return this._1389660835loadingGroup;
      }
      
      public function set loadingGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1389660835loadingGroup;
         if(_loc2_ !== param1)
         {
            this._1389660835loadingGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loadingGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productList() : List
      {
         return this._1491869139productList;
      }
      
      public function set productList(param1:List) : void
      {
         var _loc2_:Object = this._1491869139productList;
         if(_loc2_ !== param1)
         {
            this._1491869139productList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get promptDisplay() : Label
      {
         return this._263438014promptDisplay;
      }
      
      public function set promptDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._263438014promptDisplay;
         if(_loc2_ !== param1)
         {
            this._263438014promptDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"promptDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get searchInput() : SearchSuggestionInput
      {
         return this._559723774searchInput;
      }
      
      public function set searchInput(param1:SearchSuggestionInput) : void
      {
         var _loc2_:Object = this._559723774searchInput;
         if(_loc2_ !== param1)
         {
            this._559723774searchInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get searchInputGroup() : VGroup
      {
         return this._767865699searchInputGroup;
      }
      
      public function set searchInputGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._767865699searchInputGroup;
         if(_loc2_ !== param1)
         {
            this._767865699searchInputGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"searchInputGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ProductExplorer
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ProductExplorer) : void
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
