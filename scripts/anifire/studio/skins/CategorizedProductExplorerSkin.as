package anifire.studio.skins
{
   import anifire.studio.components.BusyIndicator;
   import anifire.studio.components.CategorizedProductExplorer;
   import anifire.studio.components.SearchSuggestionInput;
   import anifire.util.UtilDict;
   import flash.utils.Proxy;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
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
   import spark.components.Scroller;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   import spark.components.supportClasses.Skin;
   import spark.effects.Animate;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CategorizedProductExplorerSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static const TRAY_WIDTH:Number = 310;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CategorizedProductExplorerSkin_Animate1:Animate;
      
      private var _1885322674_CategorizedProductExplorerSkin_Group1:Group;
      
      public var _CategorizedProductExplorerSkin_Label2:Label;
      
      public var _CategorizedProductExplorerSkin_Label3:Label;
      
      private var _1214424358_CategorizedProductExplorerSkin_SetProperty1:SetProperty;
      
      private var _1214424357_CategorizedProductExplorerSkin_SetProperty2:SetProperty;
      
      private var _1214424356_CategorizedProductExplorerSkin_SetProperty3:SetProperty;
      
      private var _1214424355_CategorizedProductExplorerSkin_SetProperty4:SetProperty;
      
      public var _CategorizedProductExplorerSkin_VGroup1:VGroup;
      
      public var _CategorizedProductExplorerSkin_VGroup2:VGroup;
      
      private var _1906413305backButton:Button;
      
      private var _316651553categoryGroup:Scroller;
      
      private var _425996988categoryList:List;
      
      private var _948531402categorySubtitle:Label;
      
      private var _328393722categoryTitle:Label;
      
      private var _1707945992contentContainer:HGroup;
      
      private var _1133789276controlContainer:HGroup;
      
      private var _2046441454favoriteButton:ToggleButton;
      
      private var _371487417favoritedCategoryGroup:VGroup;
      
      private var _1674691876favoritedCategoryList:List;
      
      private var _1389660835loadingGroup:Group;
      
      private var _1491869139productList:List;
      
      private var _990807982productListGroup:VGroup;
      
      private var _559723774searchInput:SearchSuggestionInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_tray_icon_cat_png_1886397303:Class;
      
      private var _embed_mxml__styles_images_tray_icon_cat_favorite_png_755736795:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:CategorizedProductExplorer;
      
      public function CategorizedProductExplorerSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_icon_cat_png_1886397303 = CategorizedProductExplorerSkin__embed_mxml__styles_images_tray_icon_cat_png_1886397303;
         this._embed_mxml__styles_images_tray_icon_cat_favorite_png_755736795 = CategorizedProductExplorerSkin__embed_mxml__styles_images_tray_icon_cat_favorite_png_755736795;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._CategorizedProductExplorerSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_CategorizedProductExplorerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CategorizedProductExplorerSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.transitions = [this._CategorizedProductExplorerSkin_Transition1_c()];
         this.mxmlContent = [this._CategorizedProductExplorerSkin_Group1_i()];
         this.currentState = "normal";
         var _CategorizedProductExplorerSkin_Group2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CategorizedProductExplorerSkin_Group2_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CategorizedProductExplorerSkin_Group2_factory,
               "destination":"_CategorizedProductExplorerSkin_Group1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CategorizedProductExplorerSkin_VGroup1"]
            })]
         }),new State({
            "name":"categoryExpanded",
            "overrides":[]
         }),new State({
            "name":"productListing",
            "stateGroups":["listing"],
            "overrides":[this._CategorizedProductExplorerSkin_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"controlContainer",
               "name":"horizontalScrollPosition",
               "value":undefined
            })),this._CategorizedProductExplorerSkin_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
               "target":"contentContainer",
               "name":"horizontalScrollPosition",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"favoriteButton",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"productListingSearch",
            "stateGroups":["listing"],
            "overrides":[this._CategorizedProductExplorerSkin_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "target":"contentContainer",
               "name":"horizontalScrollPosition",
               "value":undefined
            }))]
         }),new State({
            "name":"resultListing",
            "stateGroups":["listing"],
            "overrides":[this._CategorizedProductExplorerSkin_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "target":"contentContainer",
               "name":"horizontalScrollPosition",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_SetProperty1",this._CategorizedProductExplorerSkin_SetProperty1);
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_SetProperty4",this._CategorizedProductExplorerSkin_SetProperty4);
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_SetProperty2",this._CategorizedProductExplorerSkin_SetProperty2);
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_SetProperty3",this._CategorizedProductExplorerSkin_SetProperty3);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CategorizedProductExplorerSkin._watcherSetupUtil = param1;
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
      
      private function _CategorizedProductExplorerSkin_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "*";
         _loc1_.effect = this._CategorizedProductExplorerSkin_Animate1_i();
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Animate1_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 200;
         _loc1_.motionPaths = new <MotionPath>[this._CategorizedProductExplorerSkin_SimpleMotionPath1_c()];
         this._CategorizedProductExplorerSkin_Animate1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_Animate1",this._CategorizedProductExplorerSkin_Animate1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_SimpleMotionPath1_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "horizontalScrollPosition";
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_Rect1_c(),this._CategorizedProductExplorerSkin_VGroup1_i()];
         _loc1_.id = "_CategorizedProductExplorerSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CategorizedProductExplorerSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_Group1",this._CategorizedProductExplorerSkin_Group1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._CategorizedProductExplorerSkin_SolidColor1_c();
         _loc1_.stroke = this._CategorizedProductExplorerSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15594230;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14737632;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_HGroup1_i(),this._CategorizedProductExplorerSkin_HGroup3_i()];
         _loc1_.id = "_CategorizedProductExplorerSkin_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CategorizedProductExplorerSkin_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_VGroup1",this._CategorizedProductExplorerSkin_VGroup1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_SearchSuggestionInput1_i(),this._CategorizedProductExplorerSkin_VGroup2_i()];
         _loc1_.id = "controlContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.controlContainer = _loc1_;
         BindingManager.executeBindings(this,"controlContainer",this.controlContainer);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_SearchSuggestionInput1_i() : SearchSuggestionInput
      {
         var _loc1_:SearchSuggestionInput = new SearchSuggestionInput();
         _loc1_.setStyle("skinClass",CategorizedProductExplorerSearchSuggestionInputSkin);
         _loc1_.id = "searchInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.searchInput = _loc1_;
         BindingManager.executeBindings(this,"searchInput",this.searchInput);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 5;
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 8;
         _loc1_.paddingBottom = 8;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_HGroup2_c(),this._CategorizedProductExplorerSkin_Line1_c()];
         _loc1_.id = "_CategorizedProductExplorerSkin_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CategorizedProductExplorerSkin_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_VGroup2",this._CategorizedProductExplorerSkin_VGroup2);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 8;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_Button1_i(),this._CategorizedProductExplorerSkin_Label1_i(),this._CategorizedProductExplorerSkin_Spacer1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",BackButtonSkin);
         _loc1_.id = "backButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backButton = _loc1_;
         BindingManager.executeBindings(this,"backButton",this.backButton);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("color",9937845);
         _loc1_.id = "categoryTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categoryTitle = _loc1_;
         BindingManager.executeBindings(this,"categoryTitle",this.categoryTitle);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.width = 18;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._CategorizedProductExplorerSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13620453;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_HGroup3_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_Scroller1_i(),this._CategorizedProductExplorerSkin_VGroup5_i()];
         _loc1_.id = "contentContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentContainer = _loc1_;
         BindingManager.executeBindings(this,"contentContainer",this.contentContainer);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._CategorizedProductExplorerSkin_VGroup3_c();
         _loc1_.id = "categoryGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categoryGroup = _loc1_;
         BindingManager.executeBindings(this,"categoryGroup",this.categoryGroup);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 8;
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 8;
         _loc1_.paddingBottom = 8;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_VGroup4_i(),this._CategorizedProductExplorerSkin_HGroup5_c(),this._CategorizedProductExplorerSkin_List2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_VGroup4_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 8;
         _loc1_.paddingBottom = 20;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_HGroup4_c(),this._CategorizedProductExplorerSkin_List1_i()];
         _loc1_.id = "favoritedCategoryGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.favoritedCategoryGroup = _loc1_;
         BindingManager.executeBindings(this,"favoritedCategoryGroup",this.favoritedCategoryGroup);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_BitmapImage1_c(),this._CategorizedProductExplorerSkin_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_cat_favorite_png_755736795;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_CategorizedProductExplorerSkin_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CategorizedProductExplorerSkin_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_Label2",this._CategorizedProductExplorerSkin_Label2);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.useVirtualLayout = false;
         _loc1_.dragEnabled = true;
         _loc1_.dragMoveEnabled = true;
         _loc1_.dropEnabled = true;
         _loc1_.setStyle("skinClass",CategorizedProductExplorerCategoryListSkin);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","off");
         _loc1_.id = "favoritedCategoryList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.favoritedCategoryList = _loc1_;
         BindingManager.executeBindings(this,"favoritedCategoryList",this.favoritedCategoryList);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_BitmapImage2_c(),this._CategorizedProductExplorerSkin_Label3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_BitmapImage2_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_cat_png_1886397303;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_CategorizedProductExplorerSkin_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CategorizedProductExplorerSkin_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerSkin_Label3",this._CategorizedProductExplorerSkin_Label3);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_List2_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.useVirtualLayout = false;
         _loc1_.setStyle("skinClass",CategorizedProductExplorerCategoryListSkin);
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
      
      private function _CategorizedProductExplorerSkin_VGroup5_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentHeight = 100;
         _loc1_.gap = 8;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_HGroup6_c(),this._CategorizedProductExplorerSkin_List3_i()];
         _loc1_.id = "productListGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.productListGroup = _loc1_;
         BindingManager.executeBindings(this,"productListGroup",this.productListGroup);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_HGroup6_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 8;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 8;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_Label4_i(),this._CategorizedProductExplorerSkin_ToggleButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Label4_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "categorySubtitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.categorySubtitle = _loc1_;
         BindingManager.executeBindings(this,"categorySubtitle",this.categorySubtitle);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.buttonMode = true;
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",CategoryFavoriteToggleButtonSkin);
         _loc1_.id = "favoriteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.favoriteButton = _loc1_;
         BindingManager.executeBindings(this,"favoriteButton",this.favoriteButton);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_List3_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",CategorizedProductExplorerProductListSkin);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.setStyle("verticalScrollPolicy","on");
         _loc1_.id = "productList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.productList = _loc1_;
         BindingManager.executeBindings(this,"productList",this.productList);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.top = 1;
         _loc1_.right = 0;
         _loc1_.bottom = 1;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerSkin_Rect2_c(),this._CategorizedProductExplorerSkin_BusyIndicator1_c()];
         _loc1_.id = "loadingGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loadingGroup = _loc1_;
         BindingManager.executeBindings(this,"loadingGroup",this.loadingGroup);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._CategorizedProductExplorerSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerSkin_BusyIndicator1_c() : BusyIndicator
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
      
      private function _CategorizedProductExplorerSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Array
         {
            var _loc1_:* = [contentContainer,controlContainer];
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy?_loc1_:[_loc1_];
         },null,"_CategorizedProductExplorerSkin_Animate1.targets");
         result[1] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"controlContainer.width");
         result[2] = new Binding(this,function():*
         {
            return TRAY_WIDTH;
         },null,"_CategorizedProductExplorerSkin_SetProperty1.value");
         result[3] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"searchInput.width");
         result[4] = new Binding(this,function():Number
         {
            return contentContainer.height;
         },null,"searchInput.suggestionListMaxHeight");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Search Templates...");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"searchInput.prompt");
         result[6] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"_CategorizedProductExplorerSkin_VGroup2.width");
         result[7] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"contentContainer.width");
         result[8] = new Binding(this,function():*
         {
            return TRAY_WIDTH;
         },null,"_CategorizedProductExplorerSkin_SetProperty2.value");
         result[9] = new Binding(this,function():*
         {
            return TRAY_WIDTH;
         },null,"_CategorizedProductExplorerSkin_SetProperty3.value");
         result[10] = new Binding(this,function():*
         {
            return TRAY_WIDTH;
         },null,"_CategorizedProductExplorerSkin_SetProperty4.value");
         result[11] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"categoryGroup.width");
         result[12] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Favorited");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CategorizedProductExplorerSkin_Label2.text");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Categories");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CategorizedProductExplorerSkin_Label3.text");
         result[14] = new Binding(this,function():Number
         {
            return TRAY_WIDTH;
         },null,"productListGroup.width");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CategorizedProductExplorerSkin_Group1() : Group
      {
         return this._1885322674_CategorizedProductExplorerSkin_Group1;
      }
      
      public function set _CategorizedProductExplorerSkin_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._1885322674_CategorizedProductExplorerSkin_Group1;
         if(_loc2_ !== param1)
         {
            this._1885322674_CategorizedProductExplorerSkin_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategorizedProductExplorerSkin_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CategorizedProductExplorerSkin_SetProperty1() : SetProperty
      {
         return this._1214424358_CategorizedProductExplorerSkin_SetProperty1;
      }
      
      public function set _CategorizedProductExplorerSkin_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1214424358_CategorizedProductExplorerSkin_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1214424358_CategorizedProductExplorerSkin_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategorizedProductExplorerSkin_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CategorizedProductExplorerSkin_SetProperty2() : SetProperty
      {
         return this._1214424357_CategorizedProductExplorerSkin_SetProperty2;
      }
      
      public function set _CategorizedProductExplorerSkin_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1214424357_CategorizedProductExplorerSkin_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._1214424357_CategorizedProductExplorerSkin_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategorizedProductExplorerSkin_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CategorizedProductExplorerSkin_SetProperty3() : SetProperty
      {
         return this._1214424356_CategorizedProductExplorerSkin_SetProperty3;
      }
      
      public function set _CategorizedProductExplorerSkin_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1214424356_CategorizedProductExplorerSkin_SetProperty3;
         if(_loc2_ !== param1)
         {
            this._1214424356_CategorizedProductExplorerSkin_SetProperty3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategorizedProductExplorerSkin_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CategorizedProductExplorerSkin_SetProperty4() : SetProperty
      {
         return this._1214424355_CategorizedProductExplorerSkin_SetProperty4;
      }
      
      public function set _CategorizedProductExplorerSkin_SetProperty4(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1214424355_CategorizedProductExplorerSkin_SetProperty4;
         if(_loc2_ !== param1)
         {
            this._1214424355_CategorizedProductExplorerSkin_SetProperty4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategorizedProductExplorerSkin_SetProperty4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backButton() : Button
      {
         return this._1906413305backButton;
      }
      
      public function set backButton(param1:Button) : void
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
      public function get categoryGroup() : Scroller
      {
         return this._316651553categoryGroup;
      }
      
      public function set categoryGroup(param1:Scroller) : void
      {
         var _loc2_:Object = this._316651553categoryGroup;
         if(_loc2_ !== param1)
         {
            this._316651553categoryGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryGroup",_loc2_,param1));
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
      public function get categorySubtitle() : Label
      {
         return this._948531402categorySubtitle;
      }
      
      public function set categorySubtitle(param1:Label) : void
      {
         var _loc2_:Object = this._948531402categorySubtitle;
         if(_loc2_ !== param1)
         {
            this._948531402categorySubtitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categorySubtitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryTitle() : Label
      {
         return this._328393722categoryTitle;
      }
      
      public function set categoryTitle(param1:Label) : void
      {
         var _loc2_:Object = this._328393722categoryTitle;
         if(_loc2_ !== param1)
         {
            this._328393722categoryTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryTitle",_loc2_,param1));
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
      public function get controlContainer() : HGroup
      {
         return this._1133789276controlContainer;
      }
      
      public function set controlContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this._1133789276controlContainer;
         if(_loc2_ !== param1)
         {
            this._1133789276controlContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get favoriteButton() : ToggleButton
      {
         return this._2046441454favoriteButton;
      }
      
      public function set favoriteButton(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._2046441454favoriteButton;
         if(_loc2_ !== param1)
         {
            this._2046441454favoriteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"favoriteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get favoritedCategoryGroup() : VGroup
      {
         return this._371487417favoritedCategoryGroup;
      }
      
      public function set favoritedCategoryGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._371487417favoritedCategoryGroup;
         if(_loc2_ !== param1)
         {
            this._371487417favoritedCategoryGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"favoritedCategoryGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get favoritedCategoryList() : List
      {
         return this._1674691876favoritedCategoryList;
      }
      
      public function set favoritedCategoryList(param1:List) : void
      {
         var _loc2_:Object = this._1674691876favoritedCategoryList;
         if(_loc2_ !== param1)
         {
            this._1674691876favoritedCategoryList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"favoritedCategoryList",_loc2_,param1));
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
      public function get productListGroup() : VGroup
      {
         return this._990807982productListGroup;
      }
      
      public function set productListGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._990807982productListGroup;
         if(_loc2_ !== param1)
         {
            this._990807982productListGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productListGroup",_loc2_,param1));
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
      public function get hostComponent() : CategorizedProductExplorer
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:CategorizedProductExplorer) : void
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
