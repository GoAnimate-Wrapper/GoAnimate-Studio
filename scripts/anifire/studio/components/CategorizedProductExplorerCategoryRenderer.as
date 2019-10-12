package anifire.studio.components
{
   import anifire.studio.events.TutorialEvent;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.models.ProductCollection;
   import anifire.studio.models.tutorial.SceneTemplateTutorial;
   import anifire.studio.skins.CategoryFavoriteToggleButtonSkin;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
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
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.ToggleButton;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   import spark.primitives.Ellipse;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CategorizedProductExplorerCategoryRenderer extends ItemRenderer implements IBindingClient, IStateClient2
   {
      
      private static const TOOLTIP_MESSAGE_FEATURED:String = "This category might be useful for you!";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CategorizedProductExplorerCategoryRenderer_BitmapImage2:BitmapImage;
      
      public var _CategorizedProductExplorerCategoryRenderer_Ellipse1:Ellipse;
      
      public var _CategorizedProductExplorerCategoryRenderer_Group1:Group;
      
      private var _1471438686_CategorizedProductExplorerCategoryRenderer_HGroup1:HGroup;
      
      public var _CategorizedProductExplorerCategoryRenderer_PopUpAnchor1:spark.components.PopUpAnchor;
      
      private var _2039326973_CategorizedProductExplorerCategoryRenderer_SolidColor1:SolidColor;
      
      private var _1284010086arrowToolTip:ArrowToolTipGroup;
      
      private var _489039960descriptionLabel:Label;
      
      private var _2046441454favoriteButton:ToggleButton;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1651253870_productCollection:ProductCollection;
      
      protected var _locked:Boolean;
      
      private var _1494719488_tutorialMode:Boolean;
      
      private var _embed_mxml__styles_images_tray_lock_icon_png_423648535:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CategorizedProductExplorerCategoryRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_lock_icon_png_423648535 = CategorizedProductExplorerCategoryRenderer__embed_mxml__styles_images_tray_lock_icon_png_423648535;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._CategorizedProductExplorerCategoryRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CategorizedProductExplorerCategoryRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CategorizedProductExplorerCategoryRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.buttonMode = true;
         this.minWidth = 0;
         this.mxmlContent = [this._CategorizedProductExplorerCategoryRenderer_Rect1_c(),this._CategorizedProductExplorerCategoryRenderer_Rect2_c(),this._CategorizedProductExplorerCategoryRenderer_HGroup1_i()];
         this.currentState = "normal";
         this.addEventListener("mouseDown",this.___CategorizedProductExplorerCategoryRenderer_ItemRenderer1_mouseDown);
         this.addEventListener("addedToStage",this.___CategorizedProductExplorerCategoryRenderer_ItemRenderer1_addedToStage);
         this.addEventListener("removedFromStage",this.___CategorizedProductExplorerCategoryRenderer_ItemRenderer1_removedFromStage);
         var _CategorizedProductExplorerCategoryRenderer_BitmapImage2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CategorizedProductExplorerCategoryRenderer_BitmapImage2_i);
         var _CategorizedProductExplorerCategoryRenderer_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CategorizedProductExplorerCategoryRenderer_PopUpAnchor1_i);
         states = [new State({
            "name":"normal",
            "stateGroups":["upStates"],
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CategorizedProductExplorerCategoryRenderer_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CategorizedProductExplorerCategoryRenderer_HGroup1"]
            }),new SetProperty().initializeFromObject({
               "target":"_CategorizedProductExplorerCategoryRenderer_SolidColor1",
               "name":"color",
               "value":14477039
            })]
         }),new State({
            "name":"locked",
            "stateGroups":["lockedStates","upStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CategorizedProductExplorerCategoryRenderer_BitmapImage2_factory,
               "destination":"_CategorizedProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["favoriteButton"]
            })]
         }),new State({
            "name":"hoveredAndLocked",
            "stateGroups":["lockedStates","hoveredStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CategorizedProductExplorerCategoryRenderer_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CategorizedProductExplorerCategoryRenderer_HGroup1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_CategorizedProductExplorerCategoryRenderer_BitmapImage2_factory,
               "destination":"_CategorizedProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["favoriteButton"]
            }),new SetProperty().initializeFromObject({
               "target":"_CategorizedProductExplorerCategoryRenderer_SolidColor1",
               "name":"color",
               "value":14477039
            })]
         }),new State({
            "name":"selectedAndLocked",
            "stateGroups":["selectedStates","lockedStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CategorizedProductExplorerCategoryRenderer_BitmapImage2_factory,
               "destination":"_CategorizedProductExplorerCategoryRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["favoriteButton"]
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
         CategorizedProductExplorerCategoryRenderer._watcherSetupUtil = param1;
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
      
      public function get locked() : Boolean
      {
         return this._locked;
      }
      
      public function set locked(param1:Boolean) : void
      {
         if(this._locked != param1)
         {
            this._locked = param1;
            invalidateRendererState();
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._productCollection = data as ProductCollection;
         if(this._productCollection)
         {
            this.locked = this._productCollection.locked;
            this.descriptionLabel.text = this._productCollection.description;
            this.iconDisplay.source = this._productCollection.iconUrl;
         }
         else
         {
            this.locked = false;
         }
      }
      
      private function tutorialStepStartHandler(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.tutorialId;
         var _loc3_:String = param1.data;
         if(_loc2_ == TutorialManager.STARTER_TUTORIAL_ID)
         {
            if(_loc3_ == SceneTemplateTutorial.STEP_ID_SELECT_CATEGORY_DEFAULT || _loc3_ == SceneTemplateTutorial.STEP_ID_SELECT_CATEGORY)
            {
               this._tutorialMode = true;
            }
         }
      }
      
      private function tutorialStepCompleteHandler(param1:TutorialEvent) : void
      {
         var _loc2_:String = param1.tutorialId;
         var _loc3_:String = param1.data;
         if(_loc2_ == TutorialManager.STARTER_TUTORIAL_ID)
         {
            if(_loc3_ == SceneTemplateTutorial.STEP_ID_SELECT_CATEGORY_DEFAULT || _loc3_ == SceneTemplateTutorial.STEP_ID_SELECT_CATEGORY)
            {
               this._tutorialMode = false;
            }
         }
      }
      
      private function tutorialCompleteHandler(param1:TutorialEvent) : void
      {
         this._tutorialMode = false;
      }
      
      override protected function getCurrentRendererState() : String
      {
         if(this.locked)
         {
            if(down && hasState("downAndLocked"))
            {
               return "downAndLocked";
            }
            if(selected && hasState("selectedAndLocked"))
            {
               return "selectedAndLocked";
            }
            if(hovered && hasState("hoveredAndLocked"))
            {
               return "hoveredAndLocked";
            }
            if(hasState("locked"))
            {
               return "locked";
            }
         }
         if(this.selected)
         {
            return !!this.hovered?"hovered":"normal";
         }
         return super.getCurrentRendererState();
      }
      
      protected function favoriteButton_mouseDownHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      protected function favoriteButton_mouseUpHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      protected function favoriteButton_rollOverHandler(param1:MouseEvent) : void
      {
         this.currentState = "normal";
      }
      
      protected function favoriteButton_rollOutHandler(param1:MouseEvent) : void
      {
         this.currentState = "hovered";
      }
      
      protected function favoriteButton_changeHandler(param1:Event) : void
      {
         if(this._productCollection)
         {
            if(this._productCollection.isFeatured)
            {
               this._productCollection.isFeatured = false;
            }
            this._productCollection.isFavorited = this.favoriteButton.selected;
         }
      }
      
      protected function favoriteButton_clickHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         if(this._productCollection)
         {
            this._productCollection.isFeatured = false;
         }
      }
      
      protected function addedToStageHandler(param1:Event) : void
      {
         TutorialManager.instance.addEventListener(TutorialEvent.TUTORIAL_STEP_START,this.tutorialStepStartHandler);
         TutorialManager.instance.addEventListener(TutorialEvent.TUTORIAL_STEP_COMPLETE,this.tutorialStepCompleteHandler);
         TutorialManager.instance.addEventListener(TutorialEvent.TUTORIAL_COMPLETE,this.tutorialCompleteHandler);
      }
      
      protected function removedFromStageHandler(param1:Event) : void
      {
         TutorialManager.instance.removeEventListener(TutorialEvent.TUTORIAL_STEP_START,this.tutorialStepStartHandler);
         TutorialManager.instance.removeEventListener(TutorialEvent.TUTORIAL_STEP_COMPLETE,this.tutorialStepCompleteHandler);
         TutorialManager.instance.removeEventListener(TutorialEvent.TUTORIAL_COMPLETE,this.tutorialCompleteHandler);
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.radiusY = 3;
         _loc1_.stroke = this._CategorizedProductExplorerCategoryRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 12964056;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 3;
         _loc1_.radiusY = 3;
         _loc1_.fill = this._CategorizedProductExplorerCategoryRenderer_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._CategorizedProductExplorerCategoryRenderer_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerCategoryRenderer_SolidColor1",this._CategorizedProductExplorerCategoryRenderer_SolidColor1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 8;
         _loc1_.paddingLeft = 8;
         _loc1_.paddingRight = 8;
         _loc1_.paddingTop = 8;
         _loc1_.paddingBottom = 8;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CategorizedProductExplorerCategoryRenderer_BitmapImage1_i(),this._CategorizedProductExplorerCategoryRenderer_VGroup1_c(),this._CategorizedProductExplorerCategoryRenderer_Ellipse1_i(),this._CategorizedProductExplorerCategoryRenderer_ToggleButton1_i()];
         _loc1_.id = "_CategorizedProductExplorerCategoryRenderer_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CategorizedProductExplorerCategoryRenderer_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerCategoryRenderer_HGroup1",this._CategorizedProductExplorerCategoryRenderer_HGroup1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 88;
         _loc1_.height = 50;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerCategoryRenderer_Label1_i(),this._CategorizedProductExplorerCategoryRenderer_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.setStyle("fontSize",16);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("color",5265768);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("color",10792380);
         _loc1_.id = "descriptionLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.descriptionLabel = _loc1_;
         BindingManager.executeBindings(this,"descriptionLabel",this.descriptionLabel);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 10;
         _loc1_.height = 10;
         _loc1_.fill = this._CategorizedProductExplorerCategoryRenderer_SolidColor2_c();
         _loc1_.initialized(this,"_CategorizedProductExplorerCategoryRenderer_Ellipse1");
         this._CategorizedProductExplorerCategoryRenderer_Ellipse1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerCategoryRenderer_Ellipse1",this._CategorizedProductExplorerCategoryRenderer_Ellipse1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15890484;
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",CategoryFavoriteToggleButtonSkin);
         _loc1_.addEventListener("mouseDown",this.__favoriteButton_mouseDown);
         _loc1_.addEventListener("mouseUp",this.__favoriteButton_mouseUp);
         _loc1_.addEventListener("rollOver",this.__favoriteButton_rollOver);
         _loc1_.addEventListener("rollOut",this.__favoriteButton_rollOut);
         _loc1_.addEventListener("change",this.__favoriteButton_change);
         _loc1_.addEventListener("click",this.__favoriteButton_click);
         _loc1_.id = "favoriteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.favoriteButton = _loc1_;
         BindingManager.executeBindings(this,"favoriteButton",this.favoriteButton);
         return _loc1_;
      }
      
      public function __favoriteButton_mouseDown(param1:MouseEvent) : void
      {
         this.favoriteButton_mouseDownHandler(param1);
      }
      
      public function __favoriteButton_mouseUp(param1:MouseEvent) : void
      {
         this.favoriteButton_mouseUpHandler(param1);
      }
      
      public function __favoriteButton_rollOver(param1:MouseEvent) : void
      {
         this.favoriteButton_rollOverHandler(param1);
      }
      
      public function __favoriteButton_rollOut(param1:MouseEvent) : void
      {
         this.favoriteButton_rollOutHandler(param1);
      }
      
      public function __favoriteButton_change(param1:Event) : void
      {
         this.favoriteButton_changeHandler(param1);
      }
      
      public function __favoriteButton_click(param1:MouseEvent) : void
      {
         this.favoriteButton_clickHandler(param1);
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_tray_lock_icon_png_423648535;
         _loc1_.initialized(this,"_CategorizedProductExplorerCategoryRenderer_BitmapImage2");
         this._CategorizedProductExplorerCategoryRenderer_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerCategoryRenderer_BitmapImage2",this._CategorizedProductExplorerCategoryRenderer_BitmapImage2);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_PopUpAnchor1_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "right";
         _loc1_.displayPopUp = true;
         _loc1_.popUpWidthMatchesAnchorWidth = true;
         _loc1_.popUpHeightMatchesAnchorHeight = true;
         _loc1_.popUp = this._CategorizedProductExplorerCategoryRenderer_Group1_i();
         _loc1_.id = "_CategorizedProductExplorerCategoryRenderer_PopUpAnchor1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CategorizedProductExplorerCategoryRenderer_PopUpAnchor1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerCategoryRenderer_PopUpAnchor1",this._CategorizedProductExplorerCategoryRenderer_PopUpAnchor1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CategorizedProductExplorerCategoryRenderer_ArrowToolTipGroup1_i()];
         _loc1_.id = "_CategorizedProductExplorerCategoryRenderer_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CategorizedProductExplorerCategoryRenderer_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_CategorizedProductExplorerCategoryRenderer_Group1",this._CategorizedProductExplorerCategoryRenderer_Group1);
         return _loc1_;
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_ArrowToolTipGroup1_i() : ArrowToolTipGroup
      {
         var _loc1_:ArrowToolTipGroup = new ArrowToolTipGroup();
         _loc1_.arrowDirection = "left";
         _loc1_.textWidth = 150;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "arrowToolTip";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrowToolTip = _loc1_;
         BindingManager.executeBindings(this,"arrowToolTip",this.arrowToolTip);
         return _loc1_;
      }
      
      public function ___CategorizedProductExplorerCategoryRenderer_ItemRenderer1_mouseDown(param1:MouseEvent) : void
      {
         this.mouseDownHandler(param1);
      }
      
      public function ___CategorizedProductExplorerCategoryRenderer_ItemRenderer1_addedToStage(param1:Event) : void
      {
         this.addedToStageHandler(param1);
      }
      
      public function ___CategorizedProductExplorerCategoryRenderer_ItemRenderer1_removedFromStage(param1:Event) : void
      {
         this.removedFromStageHandler(param1);
      }
      
      private function _CategorizedProductExplorerCategoryRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return _productCollection.valid;
         },null,"this.enabled");
         result[1] = new Binding(this,function():Boolean
         {
            return _productCollection.isFeatured;
         },null,"_CategorizedProductExplorerCategoryRenderer_Ellipse1.visible");
         result[2] = new Binding(this,function():Boolean
         {
            return _productCollection.isFeatured;
         },null,"_CategorizedProductExplorerCategoryRenderer_Ellipse1.includeInLayout");
         result[3] = new Binding(this,function():Boolean
         {
            return _productCollection.isFavorited;
         },null,"favoriteButton.selected");
         result[4] = new Binding(this,function():Boolean
         {
            return !_tutorialMode;
         },null,"favoriteButton.mouseEnabled");
         result[5] = new Binding(this,function():Boolean
         {
            return _productCollection.isFeatured;
         },null,"_CategorizedProductExplorerCategoryRenderer_Group1.visible");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate(TOOLTIP_MESSAGE_FEATURED);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"arrowToolTip.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _CategorizedProductExplorerCategoryRenderer_HGroup1() : HGroup
      {
         return this._1471438686_CategorizedProductExplorerCategoryRenderer_HGroup1;
      }
      
      public function set _CategorizedProductExplorerCategoryRenderer_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._1471438686_CategorizedProductExplorerCategoryRenderer_HGroup1;
         if(_loc2_ !== param1)
         {
            this._1471438686_CategorizedProductExplorerCategoryRenderer_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategorizedProductExplorerCategoryRenderer_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _CategorizedProductExplorerCategoryRenderer_SolidColor1() : SolidColor
      {
         return this._2039326973_CategorizedProductExplorerCategoryRenderer_SolidColor1;
      }
      
      public function set _CategorizedProductExplorerCategoryRenderer_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._2039326973_CategorizedProductExplorerCategoryRenderer_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._2039326973_CategorizedProductExplorerCategoryRenderer_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_CategorizedProductExplorerCategoryRenderer_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowToolTip() : ArrowToolTipGroup
      {
         return this._1284010086arrowToolTip;
      }
      
      public function set arrowToolTip(param1:ArrowToolTipGroup) : void
      {
         var _loc2_:Object = this._1284010086arrowToolTip;
         if(_loc2_ !== param1)
         {
            this._1284010086arrowToolTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowToolTip",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get descriptionLabel() : Label
      {
         return this._489039960descriptionLabel;
      }
      
      public function set descriptionLabel(param1:Label) : void
      {
         var _loc2_:Object = this._489039960descriptionLabel;
         if(_loc2_ !== param1)
         {
            this._489039960descriptionLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"descriptionLabel",_loc2_,param1));
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
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _productCollection() : ProductCollection
      {
         return this._1651253870_productCollection;
      }
      
      protected function set _productCollection(param1:ProductCollection) : void
      {
         var _loc2_:Object = this._1651253870_productCollection;
         if(_loc2_ !== param1)
         {
            this._1651253870_productCollection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_productCollection",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _tutorialMode() : Boolean
      {
         return this._1494719488_tutorialMode;
      }
      
      private function set _tutorialMode(param1:Boolean) : void
      {
         var _loc2_:Object = this._1494719488_tutorialMode;
         if(_loc2_ !== param1)
         {
            this._1494719488_tutorialMode = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_tutorialMode",_loc2_,param1));
            }
         }
      }
   }
}
