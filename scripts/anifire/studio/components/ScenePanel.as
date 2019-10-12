package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.studio.core.Theme;
   import anifire.studio.events.SceneViewEvent;
   import anifire.studio.managers.ColorManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.skins.ForwardLinkButtonSkin;
   import anifire.studio.skins.LinkArrowBlackButtonSkin;
   import anifire.util.UtilDict;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
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
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.effects.Animate;
   import spark.effects.animation.MotionPath;
   import spark.effects.animation.SimpleMotionPath;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class ScenePanel extends spark.components.NavigatorContent implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ScenePanel_Button1:Button;
      
      public var _ScenePanel_Label1:Label;
      
      public var _ScenePanel_LinkArrowButton1:LinkArrowButton;
      
      private var _1588047998_ScenePanel_SetProperty1:SetProperty;
      
      private var _1118509956animation:Animate;
      
      private var _2120592602colorComponent:BackgroundColorComponent;
      
      private var _833446526containerGroup:HGroup;
      
      private var _387568761currentBackground:BitmapImage;
      
      private var _28899128currentBackgroundGroup:Group;
      
      private var _126232784durationPanel:SceneDurationPanel;
      
      private var _1255815146normalPage:Group;
      
      private var _502431124settingPanel:SceneDurationSettingPanel;
      
      private var _176267333swapBackDropButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:AnimeScene;
      
      private var console:Console;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ScenePanel()
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
         bindings = this._ScenePanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ScenePanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ScenePanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.transitions = [this._ScenePanel_Transition1_c()];
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ScenePanel_Array3_c);
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"reset",
            "overrides":[this._ScenePanel_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"containerGroup",
               "name":"horizontalScrollPosition",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_ScenePanel_SetProperty1",this._ScenePanel_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ScenePanel._watcherSetupUtil = param1;
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
      
      public function set target(param1:Object) : void
      {
         var _loc3_:SceneView = null;
         this.console = Console.getConsole();
         var _loc2_:AnimeScene = param1 as AnimeScene;
         if(_loc2_)
         {
            this._target = _loc2_;
            createDeferredContent();
            this.updateBackgroundCapture();
            this.updateSwapBackdropUI();
            this.durationPanel.sceneModel = _loc2_;
            this.settingPanel.sceneModel = _loc2_;
            _loc3_ = Console.getConsole().mainStage.sceneEditor.sceneView;
            _loc3_.addEventListener(SceneViewEvent.VIEW_CHANGE,this.sceneView_changeHandler);
            currentState = "normal";
         }
      }
      
      private function sceneView_changeHandler(param1:Event) : void
      {
         this.updateBackgroundCapture();
         if(this._target.background)
         {
            if(this._target.background.baseVisible)
            {
               this.colorComponent.target = Console.getConsole().sceneEditor.getBackgroundAssetView();
            }
            else
            {
               this.colorComponent.target = this._target.background.scene;
            }
         }
         else
         {
            this.colorComponent.target = this._target;
         }
      }
      
      private function updateBackgroundCapture() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:Group = null;
         var _loc3_:Matrix = null;
         if(this._target)
         {
            if(this._target.background && this._target.background.baseVisible)
            {
               _loc2_ = Console.getConsole().mainStage.sceneEditor.sceneView.bgLayer;
               _loc1_ = new BitmapData(AnimeConstants.TILE_BACKGROUND_WIDTH,AnimeConstants.TILE_BACKGROUND_HEIGHT);
               _loc3_ = new Matrix();
               _loc3_.translate(-AnimeConstants.SCREEN_X,-AnimeConstants.screenY);
               _loc3_.scale(AnimeConstants.TILE_BACKGROUND_WIDTH / AnimeConstants.SCREEN_WIDTH,AnimeConstants.TILE_BACKGROUND_HEIGHT / AnimeConstants.screenHeight);
               _loc1_.draw(_loc2_,_loc3_);
            }
            else
            {
               _loc1_ = new BitmapData(AnimeConstants.TILE_BACKGROUND_WIDTH,AnimeConstants.TILE_BACKGROUND_HEIGHT,false,this._target.baseColor);
            }
         }
         this.currentBackground.source = _loc1_;
      }
      
      private function updateSwapBackdropUI() : void
      {
         var _loc1_:Theme = ThemeManager.instance.currentTheme;
         var _loc2_:Boolean = ThemeManager.instance.supportSwapBackdrop(_loc1_.id);
         if(_loc2_)
         {
            this.currentBackgroundGroup.addEventListener(MouseEvent.CLICK,this.swapBackDropButton_clickHandler);
            this.currentBackgroundGroup.buttonMode = true;
         }
         else
         {
            this.currentBackgroundGroup.removeEventListener(MouseEvent.CLICK,this.swapBackDropButton_clickHandler);
            this.currentBackgroundGroup.buttonMode = false;
         }
         this.swapBackDropButton.enabled = _loc2_;
      }
      
      private function resetButton_clickHandler(param1:Event) : void
      {
         currentState = "reset";
      }
      
      private function backButton_clickHandler(param1:Event) : void
      {
         currentState = "normal";
      }
      
      protected function swapBackDropButton_clickHandler(param1:MouseEvent) : void
      {
         this.colorComponent.updateAssignedColors();
         ColorManager.instance.lock();
         Console.getConsole().displaySwapPanel();
      }
      
      public function reset() : void
      {
         ColorManager.instance.unlock();
      }
      
      private function _ScenePanel_Transition1_c() : Transition
      {
         var _loc1_:Transition = new Transition();
         _loc1_.fromState = "*";
         _loc1_.toState = "*";
         _loc1_.effect = this._ScenePanel_Animate1_i();
         return _loc1_;
      }
      
      private function _ScenePanel_Animate1_i() : Animate
      {
         var _loc1_:Animate = new Animate();
         _loc1_.duration = 200;
         _loc1_.motionPaths = new <MotionPath>[this._ScenePanel_SimpleMotionPath1_c()];
         this.animation = _loc1_;
         BindingManager.executeBindings(this,"animation",this.animation);
         return _loc1_;
      }
      
      private function _ScenePanel_SimpleMotionPath1_c() : SimpleMotionPath
      {
         var _loc1_:SimpleMotionPath = new SimpleMotionPath();
         _loc1_.property = "horizontalScrollPosition";
         return _loc1_;
      }
      
      private function _ScenePanel_Array3_c() : Array
      {
         var _loc1_:Array = [this._ScenePanel_HGroup1_i()];
         return _loc1_;
      }
      
      private function _ScenePanel_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.gap = 0;
         _loc1_.top = 20;
         _loc1_.mxmlContent = [this._ScenePanel_Group1_i(),this._ScenePanel_VGroup3_c()];
         _loc1_.id = "containerGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.containerGroup = _loc1_;
         BindingManager.executeBindings(this,"containerGroup",this.containerGroup);
         return _loc1_;
      }
      
      private function _ScenePanel_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 310;
         _loc1_.mxmlContent = [this._ScenePanel_VGroup1_c()];
         _loc1_.id = "normalPage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.normalPage = _loc1_;
         BindingManager.executeBindings(this,"normalPage",this.normalPage);
         return _loc1_;
      }
      
      private function _ScenePanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._ScenePanel_Group2_c(),this._ScenePanel_Line1_c(),this._ScenePanel_Group3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenePanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ScenePanel_SceneDurationPanel1_i(),this._ScenePanel_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenePanel_SceneDurationPanel1_i() : SceneDurationPanel
      {
         var _loc1_:SceneDurationPanel = new SceneDurationPanel();
         _loc1_.percentWidth = 100;
         _loc1_.id = "durationPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationPanel = _loc1_;
         BindingManager.executeBindings(this,"durationPanel",this.durationPanel);
         return _loc1_;
      }
      
      private function _ScenePanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.right = 15;
         _loc1_.setStyle("skinClass",ForwardLinkButtonSkin);
         _loc1_.addEventListener("click",this.___ScenePanel_Button1_click);
         _loc1_.id = "_ScenePanel_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ScenePanel_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_ScenePanel_Button1",this._ScenePanel_Button1);
         return _loc1_;
      }
      
      public function ___ScenePanel_Button1_click(param1:MouseEvent) : void
      {
         this.resetButton_clickHandler(param1);
      }
      
      private function _ScenePanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ScenePanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScenePanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _ScenePanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ScenePanel_VGroup2_c(),this._ScenePanel_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenePanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 10;
         _loc1_.paddingTop = 0;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 18;
         _loc1_.mxmlContent = [this._ScenePanel_Label1_i(),this._ScenePanel_Group4_i(),this._ScenePanel_Spacer1_c(),this._ScenePanel_BackgroundColorComponent1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenePanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5724523);
         _loc1_.id = "_ScenePanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ScenePanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ScenePanel_Label1",this._ScenePanel_Label1);
         return _loc1_;
      }
      
      private function _ScenePanel_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.buttonMode = true;
         _loc1_.mxmlContent = [this._ScenePanel_BitmapImage1_i()];
         _loc1_.id = "currentBackgroundGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.currentBackgroundGroup = _loc1_;
         BindingManager.executeBindings(this,"currentBackgroundGroup",this.currentBackgroundGroup);
         return _loc1_;
      }
      
      private function _ScenePanel_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"currentBackground");
         this.currentBackground = _loc1_;
         BindingManager.executeBindings(this,"currentBackground",this.currentBackground);
         return _loc1_;
      }
      
      private function _ScenePanel_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 10;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenePanel_BackgroundColorComponent1_i() : BackgroundColorComponent
      {
         var _loc1_:BackgroundColorComponent = new BackgroundColorComponent();
         _loc1_.percentWidth = 100;
         _loc1_.id = "colorComponent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorComponent = _loc1_;
         BindingManager.executeBindings(this,"colorComponent",this.colorComponent);
         return _loc1_;
      }
      
      private function _ScenePanel_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.right = 15;
         _loc1_.setStyle("skinClass",ForwardLinkButtonSkin);
         _loc1_.addEventListener("click",this.__swapBackDropButton_click);
         _loc1_.id = "swapBackDropButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.swapBackDropButton = _loc1_;
         BindingManager.executeBindings(this,"swapBackDropButton",this.swapBackDropButton);
         return _loc1_;
      }
      
      public function __swapBackDropButton_click(param1:MouseEvent) : void
      {
         this.swapBackDropButton_clickHandler(param1);
      }
      
      private function _ScenePanel_VGroup3_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 310;
         _loc1_.gap = 15;
         _loc1_.mxmlContent = [this._ScenePanel_VGroup4_c(),this._ScenePanel_Line2_c(),this._ScenePanel_SceneDurationSettingPanel1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenePanel_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.mxmlContent = [this._ScenePanel_LinkArrowButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenePanel_LinkArrowButton1_i() : LinkArrowButton
      {
         var _loc1_:LinkArrowButton = new LinkArrowButton();
         _loc1_.setStyle("skinClass",LinkArrowBlackButtonSkin);
         _loc1_.setStyle("arrowPosition","left");
         _loc1_.setStyle("arrowDirection","left");
         _loc1_.addEventListener("click",this.___ScenePanel_LinkArrowButton1_click);
         _loc1_.id = "_ScenePanel_LinkArrowButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ScenePanel_LinkArrowButton1 = _loc1_;
         BindingManager.executeBindings(this,"_ScenePanel_LinkArrowButton1",this._ScenePanel_LinkArrowButton1);
         return _loc1_;
      }
      
      public function ___ScenePanel_LinkArrowButton1_click(param1:MouseEvent) : void
      {
         this.backButton_clickHandler(param1);
      }
      
      private function _ScenePanel_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._ScenePanel_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScenePanel_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _ScenePanel_SceneDurationSettingPanel1_i() : SceneDurationSettingPanel
      {
         var _loc1_:SceneDurationSettingPanel = new SceneDurationSettingPanel();
         _loc1_.id = "settingPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.settingPanel = _loc1_;
         BindingManager.executeBindings(this,"settingPanel",this.settingPanel);
         return _loc1_;
      }
      
      private function _ScenePanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"animation.target","containerGroup");
         result[1] = new Binding(this,function():*
         {
            return normalPage.width;
         },null,"_ScenePanel_SetProperty1.value");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Customize");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ScenePanel_Button1.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Backdrop");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ScenePanel_Label1.text");
         result[4] = new Binding(this,function():Number
         {
            return AnimeConstants.TILE_BACKGROUND_WIDTH;
         },null,"currentBackgroundGroup.width");
         result[5] = new Binding(this,function():Number
         {
            return AnimeConstants.TILE_BACKGROUND_HEIGHT;
         },null,"currentBackgroundGroup.height");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Swap Backdrop");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"swapBackDropButton.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Back");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_ScenePanel_LinkArrowButton1.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ScenePanel_SetProperty1() : SetProperty
      {
         return this._1588047998_ScenePanel_SetProperty1;
      }
      
      public function set _ScenePanel_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1588047998_ScenePanel_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1588047998_ScenePanel_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScenePanel_SetProperty1",_loc2_,param1));
            }
         }
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
      public function get colorComponent() : BackgroundColorComponent
      {
         return this._2120592602colorComponent;
      }
      
      public function set colorComponent(param1:BackgroundColorComponent) : void
      {
         var _loc2_:Object = this._2120592602colorComponent;
         if(_loc2_ !== param1)
         {
            this._2120592602colorComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorComponent",_loc2_,param1));
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
      public function get currentBackground() : BitmapImage
      {
         return this._387568761currentBackground;
      }
      
      public function set currentBackground(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._387568761currentBackground;
         if(_loc2_ !== param1)
         {
            this._387568761currentBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get currentBackgroundGroup() : Group
      {
         return this._28899128currentBackgroundGroup;
      }
      
      public function set currentBackgroundGroup(param1:Group) : void
      {
         var _loc2_:Object = this._28899128currentBackgroundGroup;
         if(_loc2_ !== param1)
         {
            this._28899128currentBackgroundGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentBackgroundGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get durationPanel() : SceneDurationPanel
      {
         return this._126232784durationPanel;
      }
      
      public function set durationPanel(param1:SceneDurationPanel) : void
      {
         var _loc2_:Object = this._126232784durationPanel;
         if(_loc2_ !== param1)
         {
            this._126232784durationPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get normalPage() : Group
      {
         return this._1255815146normalPage;
      }
      
      public function set normalPage(param1:Group) : void
      {
         var _loc2_:Object = this._1255815146normalPage;
         if(_loc2_ !== param1)
         {
            this._1255815146normalPage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"normalPage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get settingPanel() : SceneDurationSettingPanel
      {
         return this._502431124settingPanel;
      }
      
      public function set settingPanel(param1:SceneDurationSettingPanel) : void
      {
         var _loc2_:Object = this._502431124settingPanel;
         if(_loc2_ !== param1)
         {
            this._502431124settingPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"settingPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swapBackDropButton() : Button
      {
         return this._176267333swapBackDropButton;
      }
      
      public function set swapBackDropButton(param1:Button) : void
      {
         var _loc2_:Object = this._176267333swapBackDropButton;
         if(_loc2_ !== param1)
         {
            this._176267333swapBackDropButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swapBackDropButton",_loc2_,param1));
            }
         }
      }
   }
}
