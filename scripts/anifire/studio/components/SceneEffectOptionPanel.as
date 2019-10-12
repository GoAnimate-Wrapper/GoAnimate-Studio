package anifire.studio.components
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.studio.events.SceneOptionEvent;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Spacer;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class SceneEffectOptionPanel extends VGroup implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1477894644_SceneEffectOptionPanel_HGroup1:HGroup;
      
      public var _SceneEffectOptionPanel_Label1:Label;
      
      public var _SceneEffectOptionPanel_Label2:Label;
      
      public var _SceneEffectOptionPanel_LinkArrowButton1:LinkArrowButton;
      
      public var _SceneEffectOptionPanel_LinkArrowButton2:LinkArrowButton;
      
      private var _1937744996_SceneEffectOptionPanel_VGroup3:VGroup;
      
      private var _1715826791effectTray:EffectTray;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneEffectOptionPanel()
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
         bindings = this._SceneEffectOptionPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneEffectOptionPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneEffectOptionPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 310;
         this.gap = 0;
         this.mxmlContent = [this._SceneEffectOptionPanel_VGroup2_c(),this._SceneEffectOptionPanel_Line1_c()];
         this.currentState = "empty";
         this.addEventListener("creationComplete",this.___SceneEffectOptionPanel_VGroup1_creationComplete);
         states = [new State({
            "name":"empty",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SceneEffectOptionPanel_HGroup1",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_SceneEffectOptionPanel_HGroup1",
               "name":"includeInLayout",
               "value":true
            })]
         }),new State({
            "name":"exist",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_SceneEffectOptionPanel_VGroup3",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_SceneEffectOptionPanel_VGroup3",
               "name":"includeInLayout",
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
         SceneEffectOptionPanel._watcherSetupUtil = param1;
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
      
      private function init() : void
      {
         this.effectTray.addEventListener(Event.REMOVED,this.onDelEffect);
         this.refreshState();
      }
      
      public function set target(param1:Object) : void
      {
         var _loc2_:AnimeScene = param1 as AnimeScene;
         if(_loc2_)
         {
            this.refreshState();
         }
      }
      
      private function onAddEffect() : void
      {
         dispatchEvent(new SceneOptionEvent(SceneOptionEvent.ADD_NEW_EFFECT));
      }
      
      private function onDelEffect(param1:Event) : void
      {
         this.refreshState();
      }
      
      public function onEffectAdd(param1:SceneOptionEvent) : void
      {
         Console.getConsole().mainStage.sceneEditor.sceneModel.doCreateAsset(param1.thumb);
         this.refreshState();
      }
      
      private function refreshState() : void
      {
         if(this.effectTray.length > 0)
         {
            currentState = "exist";
         }
         else
         {
            currentState = "empty";
         }
      }
      
      private function _SceneEffectOptionPanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.paddingTop = 15;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 18;
         _loc1_.mxmlContent = [this._SceneEffectOptionPanel_Label1_i(),this._SceneEffectOptionPanel_Spacer1_c(),this._SceneEffectOptionPanel_HGroup1_i(),this._SceneEffectOptionPanel_VGroup3_i(),this._SceneEffectOptionPanel_Spacer3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5724523);
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "_SceneEffectOptionPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneEffectOptionPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneEffectOptionPanel_Label1",this._SceneEffectOptionPanel_Label1);
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 12;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._SceneEffectOptionPanel_Label2_i(),this._SceneEffectOptionPanel_Spacer2_c(),this._SceneEffectOptionPanel_LinkArrowButton1_i()];
         _loc1_.id = "_SceneEffectOptionPanel_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneEffectOptionPanel_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneEffectOptionPanel_HGroup1",this._SceneEffectOptionPanel_HGroup1);
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("color",13421772);
         _loc1_.id = "_SceneEffectOptionPanel_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneEffectOptionPanel_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_SceneEffectOptionPanel_Label2",this._SceneEffectOptionPanel_Label2);
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_Spacer2_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.percentWidth = 100;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_LinkArrowButton1_i() : LinkArrowButton
      {
         var _loc1_:LinkArrowButton = new LinkArrowButton();
         _loc1_.setStyle("arrowPosition","right");
         _loc1_.setStyle("arrowDirection","right");
         _loc1_.addEventListener("click",this.___SceneEffectOptionPanel_LinkArrowButton1_click);
         _loc1_.id = "_SceneEffectOptionPanel_LinkArrowButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneEffectOptionPanel_LinkArrowButton1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneEffectOptionPanel_LinkArrowButton1",this._SceneEffectOptionPanel_LinkArrowButton1);
         return _loc1_;
      }
      
      public function ___SceneEffectOptionPanel_LinkArrowButton1_click(param1:MouseEvent) : void
      {
         this.onAddEffect();
      }
      
      private function _SceneEffectOptionPanel_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.gap = 12;
         _loc1_.mxmlContent = [this._SceneEffectOptionPanel_EffectTray1_i(),this._SceneEffectOptionPanel_Group1_c()];
         _loc1_.id = "_SceneEffectOptionPanel_VGroup3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneEffectOptionPanel_VGroup3 = _loc1_;
         BindingManager.executeBindings(this,"_SceneEffectOptionPanel_VGroup3",this._SceneEffectOptionPanel_VGroup3);
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_EffectTray1_i() : EffectTray
      {
         var _loc1_:EffectTray = new EffectTray();
         _loc1_.percentWidth = 100;
         _loc1_.id = "effectTray";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectTray = _loc1_;
         BindingManager.executeBindings(this,"effectTray",this.effectTray);
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._SceneEffectOptionPanel_LinkArrowButton2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_LinkArrowButton2_i() : LinkArrowButton
      {
         var _loc1_:LinkArrowButton = new LinkArrowButton();
         _loc1_.right = 0;
         _loc1_.setStyle("arrowPosition","right");
         _loc1_.setStyle("arrowDirection","right");
         _loc1_.addEventListener("click",this.___SceneEffectOptionPanel_LinkArrowButton2_click);
         _loc1_.id = "_SceneEffectOptionPanel_LinkArrowButton2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneEffectOptionPanel_LinkArrowButton2 = _loc1_;
         BindingManager.executeBindings(this,"_SceneEffectOptionPanel_LinkArrowButton2",this._SceneEffectOptionPanel_LinkArrowButton2);
         return _loc1_;
      }
      
      public function ___SceneEffectOptionPanel_LinkArrowButton2_click(param1:MouseEvent) : void
      {
         this.onAddEffect();
      }
      
      private function _SceneEffectOptionPanel_Spacer3_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 15;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SceneEffectOptionPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneEffectOptionPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14540253;
         return _loc1_;
      }
      
      public function ___SceneEffectOptionPanel_VGroup1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _SceneEffectOptionPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Visual Effects");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneEffectOptionPanel_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("No Effect");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneEffectOptionPanel_Label2.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Add");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneEffectOptionPanel_LinkArrowButton1.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Add another effect");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneEffectOptionPanel_LinkArrowButton2.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SceneEffectOptionPanel_HGroup1() : HGroup
      {
         return this._1477894644_SceneEffectOptionPanel_HGroup1;
      }
      
      public function set _SceneEffectOptionPanel_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._1477894644_SceneEffectOptionPanel_HGroup1;
         if(_loc2_ !== param1)
         {
            this._1477894644_SceneEffectOptionPanel_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneEffectOptionPanel_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SceneEffectOptionPanel_VGroup3() : VGroup
      {
         return this._1937744996_SceneEffectOptionPanel_VGroup3;
      }
      
      public function set _SceneEffectOptionPanel_VGroup3(param1:VGroup) : void
      {
         var _loc2_:Object = this._1937744996_SceneEffectOptionPanel_VGroup3;
         if(_loc2_ !== param1)
         {
            this._1937744996_SceneEffectOptionPanel_VGroup3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SceneEffectOptionPanel_VGroup3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectTray() : EffectTray
      {
         return this._1715826791effectTray;
      }
      
      public function set effectTray(param1:EffectTray) : void
      {
         var _loc2_:Object = this._1715826791effectTray;
         if(_loc2_ !== param1)
         {
            this._1715826791effectTray = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectTray",_loc2_,param1));
            }
         }
      }
   }
}
