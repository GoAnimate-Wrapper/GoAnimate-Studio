package anifire.studio.components
{
   import anifire.studio.commands.ChangeChapterBreakCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.events.SceneOptionEvent;
   import anifire.studio.managers.AccessRightManager;
   import anifire.studio.skins.MinimalScrollerSkin;
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
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.CheckBox;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.effects.Move;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class JoinEffectPanel extends spark.components.NavigatorContent implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _JoinEffectPanel_Label1:Label;
      
      private var _3016401base:HGroup;
      
      private var _1244380523chapterBreakCheckbox:CheckBox;
      
      private var _1625230065clipGroup:Group;
      
      private var _1553298370effectOptionPanel:SceneEffectOptionPanel;
      
      private var _1319193655effectSelectionPanel:SceneEffectSelectionPanel;
      
      private var _633402133presentationModelPanel:VGroup;
      
      private var _796716712slideLeft:Move;
      
      private var _1077246699slideRight:Move;
      
      private var _1652200954transitionOptionPanel:SceneTransitionOptionPanel;
      
      private var _591691635transitionSelectionPanel:SceneTransitionSelectionPanel;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _target:AnimeScene;
      
      protected var _36275840_displayPresentationSettings:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function JoinEffectPanel()
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
         bindings = this._JoinEffectPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_JoinEffectPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return JoinEffectPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 310;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._JoinEffectPanel_Array4_c);
         this.currentState = "leftPanel";
         this._JoinEffectPanel_Move2_i();
         this._JoinEffectPanel_Move1_i();
         this.addEventListener("creationComplete",this.___JoinEffectPanel_NavigatorContent1_creationComplete);
         states = [new State({
            "name":"leftPanel",
            "overrides":[]
         }),new State({
            "name":"transition",
            "stateGroups":["rightPanel"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"transitionSelectionPanel",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"effect",
            "stateGroups":["rightPanel"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"effectSelectionPanel",
               "name":"visible",
               "value":true
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
         JoinEffectPanel._watcherSetupUtil = param1;
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
         if(this._target)
         {
            this._target.removeEventListener(SceneEvent.CHAPTER_BREAK_CHANGE,this._target_chapterBreakChangeHandler);
         }
         var _loc2_:AnimeScene = param1 as AnimeScene;
         if(_loc2_)
         {
            this._target = _loc2_;
            this.transitionOptionPanel.target = _loc2_;
            this.effectOptionPanel.target = _loc2_;
            this._target.addEventListener(SceneEvent.CHAPTER_BREAK_CHANGE,this._target_chapterBreakChangeHandler);
            if(initialized)
            {
               this.updateChapterBreakValue();
            }
         }
         this.base.x = this.slideLeft.xTo;
      }
      
      private function init() : void
      {
         this.transitionOptionPanel.addEventListener(SceneOptionEvent.REMOVE_TRANSITION,this.transitionSelectionPanel.onRemoveSelection);
         this.transitionSelectionPanel.addEventListener(SceneOptionEvent.TYPE_CHANGED,this.onTypeChange);
         this.transitionSelectionPanel.addEventListener(SceneOptionEvent.TYPE_CHANGED,this.transitionOptionPanel.onTypeChange);
         this.transitionSelectionPanel.addEventListener(SceneOptionEvent.BACK,this.onBackRelease);
         this.effectSelectionPanel.addEventListener(SceneOptionEvent.EFFECT_ADD,this.onEffectAdd);
         this.effectSelectionPanel.addEventListener(SceneOptionEvent.EFFECT_ADD,this.effectOptionPanel.onEffectAdd);
         this.effectSelectionPanel.addEventListener(SceneOptionEvent.BACK,this.onBackRelease);
         this._displayPresentationSettings = AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_RIGHT_PRESENTATION_MODE);
         if(this._target)
         {
            this.updateChapterBreakValue();
         }
      }
      
      protected function updateChapterBreakValue() : void
      {
         this.chapterBreakCheckbox.selected = this._target.chapterBreak;
      }
      
      private function onAddTransition() : void
      {
         currentState = "transition";
         this.slideRight.play();
         this.transitionSelectionPanel.reset();
      }
      
      private function onTypeChange(param1:Event) : void
      {
         currentState = "leftPanel";
         this.slideLeft.play();
      }
      
      private function onAddEffect() : void
      {
         currentState = "effect";
         this.effectSelectionPanel.init();
         this.slideRight.play();
      }
      
      private function onEffectAdd(param1:Event) : void
      {
         currentState = "leftPanel";
         this.slideLeft.play();
      }
      
      private function onBackRelease(param1:Event) : void
      {
         currentState = "leftPanel";
         this.slideLeft.play();
      }
      
      protected function _target_chapterBreakChangeHandler(param1:SceneEvent) : void
      {
         this.updateChapterBreakValue();
      }
      
      protected function chapterBreakCheckbox_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:ChangeChapterBreakCommand = null;
         if(this._target)
         {
            _loc2_ = new ChangeChapterBreakCommand(this._target,this.chapterBreakCheckbox.selected);
            _loc2_.execute();
         }
      }
      
      private function _JoinEffectPanel_Move2_i() : Move
      {
         var _loc1_:Move = new Move();
         _loc1_.xTo = 0;
         _loc1_.xFrom = -310;
         _loc1_.duration = 200;
         this.slideLeft = _loc1_;
         BindingManager.executeBindings(this,"slideLeft",this.slideLeft);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_Move1_i() : Move
      {
         var _loc1_:Move = new Move();
         _loc1_.xFrom = 0;
         _loc1_.xTo = -310;
         _loc1_.duration = 200;
         this.slideRight = _loc1_;
         BindingManager.executeBindings(this,"slideRight",this.slideRight);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_Array4_c() : Array
      {
         var _loc1_:Array = [this._JoinEffectPanel_Group1_i()];
         return _loc1_;
      }
      
      private function _JoinEffectPanel_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.mxmlContent = [this._JoinEffectPanel_HGroup1_i()];
         _loc1_.id = "clipGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clipGroup = _loc1_;
         BindingManager.executeBindings(this,"clipGroup",this.clipGroup);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.width = 620;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._JoinEffectPanel_Group2_c(),this._JoinEffectPanel_Group3_c()];
         _loc1_.id = "base";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.base = _loc1_;
         BindingManager.executeBindings(this,"base",this.base);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 310;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._JoinEffectPanel_Rect1_c(),this._JoinEffectPanel_VGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _JoinEffectPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.height = 10;
         _loc1_.top = 11;
         _loc1_.fill = this._JoinEffectPanel_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._JoinEffectPanel_GradientEntry1_c(),this._JoinEffectPanel_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _JoinEffectPanel_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.1;
         return _loc1_;
      }
      
      private function _JoinEffectPanel_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _JoinEffectPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 310;
         _loc1_.percentHeight = 100;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._JoinEffectPanel_Scroller1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _JoinEffectPanel_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.width = 310;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._JoinEffectPanel_VGroup2_c();
         _loc1_.setStyle("skinClass",MinimalScrollerSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _JoinEffectPanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.width = 310;
         _loc1_.gap = 0;
         _loc1_.paddingTop = 10;
         _loc1_.mxmlContent = [this._JoinEffectPanel_SceneTransitionOptionPanel1_i(),this._JoinEffectPanel_SceneEffectOptionPanel1_i(),this._JoinEffectPanel_VGroup3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _JoinEffectPanel_SceneTransitionOptionPanel1_i() : SceneTransitionOptionPanel
      {
         var _loc1_:SceneTransitionOptionPanel = new SceneTransitionOptionPanel();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("add_new_transition",this.__transitionOptionPanel_add_new_transition);
         _loc1_.id = "transitionOptionPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transitionOptionPanel = _loc1_;
         BindingManager.executeBindings(this,"transitionOptionPanel",this.transitionOptionPanel);
         return _loc1_;
      }
      
      public function __transitionOptionPanel_add_new_transition(param1:SceneOptionEvent) : void
      {
         this.onAddTransition();
      }
      
      private function _JoinEffectPanel_SceneEffectOptionPanel1_i() : SceneEffectOptionPanel
      {
         var _loc1_:SceneEffectOptionPanel = new SceneEffectOptionPanel();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("add_new_effect",this.__effectOptionPanel_add_new_effect);
         _loc1_.id = "effectOptionPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectOptionPanel = _loc1_;
         BindingManager.executeBindings(this,"effectOptionPanel",this.effectOptionPanel);
         return _loc1_;
      }
      
      public function __effectOptionPanel_add_new_effect(param1:SceneOptionEvent) : void
      {
         this.onAddEffect();
      }
      
      private function _JoinEffectPanel_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._JoinEffectPanel_VGroup4_c(),this._JoinEffectPanel_Line1_c()];
         _loc1_.id = "presentationModelPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.presentationModelPanel = _loc1_;
         BindingManager.executeBindings(this,"presentationModelPanel",this.presentationModelPanel);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_VGroup4_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 12;
         _loc1_.paddingTop = 15;
         _loc1_.paddingBottom = 12;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 18;
         _loc1_.mxmlContent = [this._JoinEffectPanel_Label1_i(),this._JoinEffectPanel_CheckBox1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _JoinEffectPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5724523);
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "_JoinEffectPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._JoinEffectPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_JoinEffectPanel_Label1",this._JoinEffectPanel_Label1);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.addEventListener("click",this.__chapterBreakCheckbox_click);
         _loc1_.id = "chapterBreakCheckbox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.chapterBreakCheckbox = _loc1_;
         BindingManager.executeBindings(this,"chapterBreakCheckbox",this.chapterBreakCheckbox);
         return _loc1_;
      }
      
      public function __chapterBreakCheckbox_click(param1:MouseEvent) : void
      {
         this.chapterBreakCheckbox_clickHandler(param1);
      }
      
      private function _JoinEffectPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._JoinEffectPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      private function _JoinEffectPanel_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._JoinEffectPanel_SceneTransitionSelectionPanel1_i(),this._JoinEffectPanel_SceneEffectSelectionPanel1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _JoinEffectPanel_SceneTransitionSelectionPanel1_i() : SceneTransitionSelectionPanel
      {
         var _loc1_:SceneTransitionSelectionPanel = new SceneTransitionSelectionPanel();
         _loc1_.visible = false;
         _loc1_.id = "transitionSelectionPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transitionSelectionPanel = _loc1_;
         BindingManager.executeBindings(this,"transitionSelectionPanel",this.transitionSelectionPanel);
         return _loc1_;
      }
      
      private function _JoinEffectPanel_SceneEffectSelectionPanel1_i() : SceneEffectSelectionPanel
      {
         var _loc1_:SceneEffectSelectionPanel = new SceneEffectSelectionPanel();
         _loc1_.visible = false;
         _loc1_.id = "effectSelectionPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectSelectionPanel = _loc1_;
         BindingManager.executeBindings(this,"effectSelectionPanel",this.effectSelectionPanel);
         return _loc1_;
      }
      
      public function ___JoinEffectPanel_NavigatorContent1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _JoinEffectPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"slideRight.target","base");
         result[1] = new Binding(this,null,null,"slideLeft.target","base");
         result[2] = new Binding(this,function():Boolean
         {
            return _displayPresentationSettings;
         },null,"presentationModelPanel.visible");
         result[3] = new Binding(this,function():Boolean
         {
            return _displayPresentationSettings;
         },null,"presentationModelPanel.includeInLayout");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Auto-pause");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_JoinEffectPanel_Label1.text");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Pause at end of the scene");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"chapterBreakCheckbox.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get base() : HGroup
      {
         return this._3016401base;
      }
      
      public function set base(param1:HGroup) : void
      {
         var _loc2_:Object = this._3016401base;
         if(_loc2_ !== param1)
         {
            this._3016401base = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"base",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get chapterBreakCheckbox() : CheckBox
      {
         return this._1244380523chapterBreakCheckbox;
      }
      
      public function set chapterBreakCheckbox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1244380523chapterBreakCheckbox;
         if(_loc2_ !== param1)
         {
            this._1244380523chapterBreakCheckbox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chapterBreakCheckbox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get clipGroup() : Group
      {
         return this._1625230065clipGroup;
      }
      
      public function set clipGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1625230065clipGroup;
         if(_loc2_ !== param1)
         {
            this._1625230065clipGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clipGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectOptionPanel() : SceneEffectOptionPanel
      {
         return this._1553298370effectOptionPanel;
      }
      
      public function set effectOptionPanel(param1:SceneEffectOptionPanel) : void
      {
         var _loc2_:Object = this._1553298370effectOptionPanel;
         if(_loc2_ !== param1)
         {
            this._1553298370effectOptionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectOptionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectSelectionPanel() : SceneEffectSelectionPanel
      {
         return this._1319193655effectSelectionPanel;
      }
      
      public function set effectSelectionPanel(param1:SceneEffectSelectionPanel) : void
      {
         var _loc2_:Object = this._1319193655effectSelectionPanel;
         if(_loc2_ !== param1)
         {
            this._1319193655effectSelectionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectSelectionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get presentationModelPanel() : VGroup
      {
         return this._633402133presentationModelPanel;
      }
      
      public function set presentationModelPanel(param1:VGroup) : void
      {
         var _loc2_:Object = this._633402133presentationModelPanel;
         if(_loc2_ !== param1)
         {
            this._633402133presentationModelPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"presentationModelPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get slideLeft() : Move
      {
         return this._796716712slideLeft;
      }
      
      public function set slideLeft(param1:Move) : void
      {
         var _loc2_:Object = this._796716712slideLeft;
         if(_loc2_ !== param1)
         {
            this._796716712slideLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slideLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get slideRight() : Move
      {
         return this._1077246699slideRight;
      }
      
      public function set slideRight(param1:Move) : void
      {
         var _loc2_:Object = this._1077246699slideRight;
         if(_loc2_ !== param1)
         {
            this._1077246699slideRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slideRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionOptionPanel() : SceneTransitionOptionPanel
      {
         return this._1652200954transitionOptionPanel;
      }
      
      public function set transitionOptionPanel(param1:SceneTransitionOptionPanel) : void
      {
         var _loc2_:Object = this._1652200954transitionOptionPanel;
         if(_loc2_ !== param1)
         {
            this._1652200954transitionOptionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionOptionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionSelectionPanel() : SceneTransitionSelectionPanel
      {
         return this._591691635transitionSelectionPanel;
      }
      
      public function set transitionSelectionPanel(param1:SceneTransitionSelectionPanel) : void
      {
         var _loc2_:Object = this._591691635transitionSelectionPanel;
         if(_loc2_ !== param1)
         {
            this._591691635transitionSelectionPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionSelectionPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _displayPresentationSettings() : Boolean
      {
         return this._36275840_displayPresentationSettings;
      }
      
      protected function set _displayPresentationSettings(param1:Boolean) : void
      {
         var _loc2_:Object = this._36275840_displayPresentationSettings;
         if(_loc2_ !== param1)
         {
            this._36275840_displayPresentationSettings = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_displayPresentationSettings",_loc2_,param1));
            }
         }
      }
   }
}
