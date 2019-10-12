package anifire.studio.components
{
   import anifire.studio.commands.ChangeSceneDurationCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.events.SceneEvent;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Form;
   import spark.components.Group;
   import spark.components.Label;
   import spark.layouts.VerticalLayout;
   
   use namespace mx_internal;
   
   public class SceneDurationPanel extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneDurationPanel_Label1:Label;
      
      private var _1893554479stepper:NumericStepper;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _scene:AnimeScene;
      
      private var _command:ChangeSceneDurationCommand;
      
      private var _1901494541_duration:Number;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneDurationPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneDurationPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneDurationPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneDurationPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SceneDurationPanel_Form1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneDurationPanel._watcherSetupUtil = param1;
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
      
      [Bindable(event="propertyChange")]
      public function get sceneModel() : AnimeScene
      {
         return this._scene;
      }
      
      private function set _2063821309sceneModel(param1:AnimeScene) : void
      {
         if(this._scene != param1)
         {
            if(this._scene)
            {
               this._scene.removeEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
               this._scene.removeEventListener(SceneEvent.DURATION_MODE_CHANGE,this.onSceneDurationChange);
            }
            this._scene = param1;
            if(this._scene)
            {
               this._scene.addEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
               this._scene.addEventListener(SceneEvent.DURATION_MODE_CHANGE,this.onSceneDurationChange);
               this.updateUI();
            }
         }
      }
      
      private function onSceneDurationChange(param1:Event) : void
      {
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         if(this._scene)
         {
            this._duration = this._scene.duration;
         }
      }
      
      protected function stepper_changeHandler(param1:Event) : void
      {
         if(this._scene)
         {
            this._scene.customTotalFrames = UtilUnitConvert.durationToFrame(this.stepper.value);
            this._scene.durationMode = AnimeScene.DURATION_MODE_CUSTOM;
         }
      }
      
      protected function stepper_buttonPressHandler(param1:Event) : void
      {
         if(this._scene)
         {
            this._command = new ChangeSceneDurationCommand(this._scene);
         }
      }
      
      protected function stepper_buttonReleaseHandler(param1:Event) : void
      {
         if(this._command)
         {
            this._command.executeNow(UtilUnitConvert.durationToFrame(this.stepper.value),AnimeScene.DURATION_MODE_CUSTOM);
            this._command = new ChangeSceneDurationCommand(this._scene);
         }
      }
      
      protected function stepper_focusInHandler(param1:FocusEvent) : void
      {
         if(this._scene)
         {
            this._command = new ChangeSceneDurationCommand(this._scene);
         }
      }
      
      protected function stepper_focusOutHandler(param1:FocusEvent) : void
      {
         if(this._command)
         {
            this._command.executeNow(UtilUnitConvert.durationToFrame(this.stepper.value),AnimeScene.DURATION_MODE_CUSTOM);
            this._command = null;
         }
      }
      
      protected function stepper_enterHandler(param1:FlexEvent) : void
      {
         if(this._command)
         {
            this._command.executeNow(UtilUnitConvert.durationToFrame(this.stepper.value),AnimeScene.DURATION_MODE_CUSTOM);
            this._command = null;
         }
      }
      
      private function _SceneDurationPanel_Form1_c() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.width = 310;
         _loc1_.styleName = "compact";
         _loc1_.layout = this._SceneDurationPanel_VerticalLayout1_c();
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._SceneDurationPanel_Array2_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneDurationPanel_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 10;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         return _loc1_;
      }
      
      private function _SceneDurationPanel_Array2_c() : Array
      {
         var _loc1_:Array = [this._SceneDurationPanel_Label1_i(),this._SceneDurationPanel_NumericStepper1_i()];
         return _loc1_;
      }
      
      private function _SceneDurationPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5724523);
         _loc1_.id = "_SceneDurationPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneDurationPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneDurationPanel_Label1",this._SceneDurationPanel_Label1);
         return _loc1_;
      }
      
      private function _SceneDurationPanel_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.precision = 3;
         _loc1_.minimum = 0.25;
         _loc1_.maximum = 240;
         _loc1_.stepSize = 0.125;
         _loc1_.addEventListener("incrementButtonPress",this.__stepper_incrementButtonPress);
         _loc1_.addEventListener("incrementButtonRelease",this.__stepper_incrementButtonRelease);
         _loc1_.addEventListener("decrementButtonPress",this.__stepper_decrementButtonPress);
         _loc1_.addEventListener("decrementButtonRelease",this.__stepper_decrementButtonRelease);
         _loc1_.addEventListener("change",this.__stepper_change);
         _loc1_.addEventListener("enter",this.__stepper_enter);
         _loc1_.addEventListener("focusIn",this.__stepper_focusIn);
         _loc1_.addEventListener("focusOut",this.__stepper_focusOut);
         _loc1_.id = "stepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stepper = _loc1_;
         BindingManager.executeBindings(this,"stepper",this.stepper);
         return _loc1_;
      }
      
      public function __stepper_incrementButtonPress(param1:Event) : void
      {
         this.stepper_buttonPressHandler(param1);
      }
      
      public function __stepper_incrementButtonRelease(param1:Event) : void
      {
         this.stepper_buttonReleaseHandler(param1);
      }
      
      public function __stepper_decrementButtonPress(param1:Event) : void
      {
         this.stepper_buttonPressHandler(param1);
      }
      
      public function __stepper_decrementButtonRelease(param1:Event) : void
      {
         this.stepper_buttonReleaseHandler(param1);
      }
      
      public function __stepper_change(param1:Event) : void
      {
         this.stepper_changeHandler(param1);
      }
      
      public function __stepper_enter(param1:FlexEvent) : void
      {
         this.stepper_enterHandler(param1);
      }
      
      public function __stepper_focusIn(param1:FocusEvent) : void
      {
         this.stepper_focusInHandler(param1);
      }
      
      public function __stepper_focusOut(param1:FocusEvent) : void
      {
         this.stepper_focusOutHandler(param1);
      }
      
      private function _SceneDurationPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("SCENE DURATION");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneDurationPanel_Label1.text");
         result[1] = new Binding(this,function():Number
         {
            return _duration;
         },null,"stepper.value");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get stepper() : NumericStepper
      {
         return this._1893554479stepper;
      }
      
      public function set stepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._1893554479stepper;
         if(_loc2_ !== param1)
         {
            this._1893554479stepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _duration() : Number
      {
         return this._1901494541_duration;
      }
      
      private function set _duration(param1:Number) : void
      {
         var _loc2_:Object = this._1901494541_duration;
         if(_loc2_ !== param1)
         {
            this._1901494541_duration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_duration",_loc2_,param1));
            }
         }
      }
      
      public function set sceneModel(param1:AnimeScene) : void
      {
         var _loc2_:Object = this.sceneModel;
         if(_loc2_ !== param1)
         {
            this._2063821309sceneModel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneModel",_loc2_,param1));
            }
         }
      }
   }
}
