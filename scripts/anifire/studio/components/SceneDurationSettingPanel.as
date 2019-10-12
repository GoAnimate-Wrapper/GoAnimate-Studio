package anifire.studio.components
{
   import anifire.studio.commands.ChangeSceneDurationOptionCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.events.SceneEvent;
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
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.Button;
   import spark.components.CheckBox;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class SceneDurationSettingPanel extends VGroup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneDurationSettingPanel_Label1:Label;
      
      public var _SceneDurationSettingPanel_Label2:Label;
      
      public var _SceneDurationSettingPanel_Label3:Label;
      
      private var _1622536185actionCheckBox:CheckBox;
      
      private var _1472688207bubbleCheckBox:CheckBox;
      
      private var _370584017minimumCheckBox:CheckBox;
      
      private var _1249819808restoreButton:Button;
      
      private var _1427239259speechCheckBox:CheckBox;
      
      private var _341028840transitionCheckBox:CheckBox;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _scene:AnimeScene;
      
      private var _isAllChecked:Boolean;
      
      private var _1901494541_duration:Number;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneDurationSettingPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneDurationSettingPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneDurationSettingPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneDurationSettingPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.gap = 15;
         this.percentWidth = 100;
         this.horizontalAlign = "center";
         this.mxmlContent = [this._SceneDurationSettingPanel_VGroup2_c(),this._SceneDurationSettingPanel_Line1_c(),this._SceneDurationSettingPanel_Button1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneDurationSettingPanel._watcherSetupUtil = param1;
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
               this._scene.removeEventListener(SceneEvent.DURATION_OPTION_CHANGE,this.onSceneDurationChange);
            }
            this._scene = param1;
            if(this._scene)
            {
               this._scene.addEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
               this._scene.addEventListener(SceneEvent.DURATION_MODE_CHANGE,this.onSceneDurationChange);
               this._scene.addEventListener(SceneEvent.DURATION_OPTION_CHANGE,this.onSceneDurationChange);
               this.updateUI();
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isAllChecked() : Boolean
      {
         return this._isAllChecked;
      }
      
      private function set _9700240isAllChecked(param1:Boolean) : void
      {
         this._isAllChecked = param1;
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
            if(this._scene.durationMode == AnimeScene.DURATION_MODE_CUSTOM)
            {
               this.minimumCheckBox.selected = false;
               this.transitionCheckBox.selected = false;
               this.actionCheckBox.selected = false;
               this.bubbleCheckBox.selected = false;
               this.speechCheckBox.selected = false;
            }
            else
            {
               this.minimumCheckBox.selected = this._scene.countMinimumDuration;
               this.transitionCheckBox.selected = this._scene.countTransitionDuration;
               this.actionCheckBox.selected = this._scene.countActionDuration;
               this.bubbleCheckBox.selected = this._scene.countBubbleDuration;
               this.speechCheckBox.selected = this._scene.countSpeechDuration;
            }
            this.updateStatus();
         }
      }
      
      private function checkBox_changeHandler(param1:Event = null) : void
      {
         var _loc2_:ChangeSceneDurationOptionCommand = null;
         if(this._scene)
         {
            _loc2_ = new ChangeSceneDurationOptionCommand(this._scene,true,this.minimumCheckBox.selected,this.transitionCheckBox.selected,this.actionCheckBox.selected,this.bubbleCheckBox.selected,this.speechCheckBox.selected);
            _loc2_.execute();
            this.updateStatus();
         }
      }
      
      protected function restoreButton_clickHandler(param1:MouseEvent) : void
      {
         this.minimumCheckBox.selected = true;
         this.transitionCheckBox.selected = true;
         this.actionCheckBox.selected = true;
         this.bubbleCheckBox.selected = true;
         this.speechCheckBox.selected = true;
         this.checkBox_changeHandler();
      }
      
      private function updateStatus() : void
      {
         this.isAllChecked = this.minimumCheckBox.selected && this.transitionCheckBox.selected && this.actionCheckBox.selected && this.bubbleCheckBox.selected && this.speechCheckBox.selected;
      }
      
      private function _SceneDurationSettingPanel_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.percentWidth = 100;
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._SceneDurationSettingPanel_Label1_i(),this._SceneDurationSettingPanel_CheckBox1_i(),this._SceneDurationSettingPanel_CheckBox2_i(),this._SceneDurationSettingPanel_CheckBox3_i(),this._SceneDurationSettingPanel_CheckBox4_i(),this._SceneDurationSettingPanel_CheckBox5_i(),this._SceneDurationSettingPanel_Spacer1_c(),this._SceneDurationSettingPanel_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneDurationSettingPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.id = "_SceneDurationSettingPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneDurationSettingPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneDurationSettingPanel_Label1",this._SceneDurationSettingPanel_Label1);
         return _loc1_;
      }
      
      private function _SceneDurationSettingPanel_CheckBox1_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__minimumCheckBox_change);
         _loc1_.id = "minimumCheckBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.minimumCheckBox = _loc1_;
         BindingManager.executeBindings(this,"minimumCheckBox",this.minimumCheckBox);
         return _loc1_;
      }
      
      public function __minimumCheckBox_change(param1:Event) : void
      {
         this.checkBox_changeHandler(param1);
      }
      
      private function _SceneDurationSettingPanel_CheckBox2_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__transitionCheckBox_change);
         _loc1_.id = "transitionCheckBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transitionCheckBox = _loc1_;
         BindingManager.executeBindings(this,"transitionCheckBox",this.transitionCheckBox);
         return _loc1_;
      }
      
      public function __transitionCheckBox_change(param1:Event) : void
      {
         this.checkBox_changeHandler(param1);
      }
      
      private function _SceneDurationSettingPanel_CheckBox3_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__actionCheckBox_change);
         _loc1_.id = "actionCheckBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionCheckBox = _loc1_;
         BindingManager.executeBindings(this,"actionCheckBox",this.actionCheckBox);
         return _loc1_;
      }
      
      public function __actionCheckBox_change(param1:Event) : void
      {
         this.checkBox_changeHandler(param1);
      }
      
      private function _SceneDurationSettingPanel_CheckBox4_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__bubbleCheckBox_change);
         _loc1_.id = "bubbleCheckBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubbleCheckBox = _loc1_;
         BindingManager.executeBindings(this,"bubbleCheckBox",this.bubbleCheckBox);
         return _loc1_;
      }
      
      public function __bubbleCheckBox_change(param1:Event) : void
      {
         this.checkBox_changeHandler(param1);
      }
      
      private function _SceneDurationSettingPanel_CheckBox5_i() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("change",this.__speechCheckBox_change);
         _loc1_.id = "speechCheckBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.speechCheckBox = _loc1_;
         BindingManager.executeBindings(this,"speechCheckBox",this.speechCheckBox);
         return _loc1_;
      }
      
      public function __speechCheckBox_change(param1:Event) : void
      {
         this.checkBox_changeHandler(param1);
      }
      
      private function _SceneDurationSettingPanel_Spacer1_c() : Spacer
      {
         var _loc1_:Spacer = new Spacer();
         _loc1_.height = 5;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneDurationSettingPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._SceneDurationSettingPanel_Label2_i(),this._SceneDurationSettingPanel_Label3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneDurationSettingPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "_SceneDurationSettingPanel_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneDurationSettingPanel_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_SceneDurationSettingPanel_Label2",this._SceneDurationSettingPanel_Label2);
         return _loc1_;
      }
      
      private function _SceneDurationSettingPanel_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_SceneDurationSettingPanel_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneDurationSettingPanel_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_SceneDurationSettingPanel_Label3",this._SceneDurationSettingPanel_Label3);
         return _loc1_;
      }
      
      private function _SceneDurationSettingPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._SceneDurationSettingPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneDurationSettingPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _SceneDurationSettingPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__restoreButton_click);
         _loc1_.id = "restoreButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.restoreButton = _loc1_;
         BindingManager.executeBindings(this,"restoreButton",this.restoreButton);
         return _loc1_;
      }
      
      public function __restoreButton_click(param1:MouseEvent) : void
      {
         this.restoreButton_clickHandler(param1);
      }
      
      private function _SceneDurationSettingPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Tick the content you want to include in the calculation of this scene\'s duration");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneDurationSettingPanel_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("2.5s minimum");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"minimumCheckBox.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Scene transition and motions");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"transitionCheckBox.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Character actions");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"actionCheckBox.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Text (allow time for your audience to read)");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"bubbleCheckBox.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Voice clip");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"speechCheckBox.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","New scene duration:") + " ";
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneDurationSettingPanel_Label2.text");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = _duration.toFixed(3) + "s";
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneDurationSettingPanel_Label3.text");
         result[8] = new Binding(this,function():Boolean
         {
            return !isAllChecked;
         },null,"restoreButton.enabled");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Restore default");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"restoreButton.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get actionCheckBox() : CheckBox
      {
         return this._1622536185actionCheckBox;
      }
      
      public function set actionCheckBox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1622536185actionCheckBox;
         if(_loc2_ !== param1)
         {
            this._1622536185actionCheckBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionCheckBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleCheckBox() : CheckBox
      {
         return this._1472688207bubbleCheckBox;
      }
      
      public function set bubbleCheckBox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1472688207bubbleCheckBox;
         if(_loc2_ !== param1)
         {
            this._1472688207bubbleCheckBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleCheckBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get minimumCheckBox() : CheckBox
      {
         return this._370584017minimumCheckBox;
      }
      
      public function set minimumCheckBox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._370584017minimumCheckBox;
         if(_loc2_ !== param1)
         {
            this._370584017minimumCheckBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"minimumCheckBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get restoreButton() : Button
      {
         return this._1249819808restoreButton;
      }
      
      public function set restoreButton(param1:Button) : void
      {
         var _loc2_:Object = this._1249819808restoreButton;
         if(_loc2_ !== param1)
         {
            this._1249819808restoreButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"restoreButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get speechCheckBox() : CheckBox
      {
         return this._1427239259speechCheckBox;
      }
      
      public function set speechCheckBox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._1427239259speechCheckBox;
         if(_loc2_ !== param1)
         {
            this._1427239259speechCheckBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"speechCheckBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionCheckBox() : CheckBox
      {
         return this._341028840transitionCheckBox;
      }
      
      public function set transitionCheckBox(param1:CheckBox) : void
      {
         var _loc2_:Object = this._341028840transitionCheckBox;
         if(_loc2_ !== param1)
         {
            this._341028840transitionCheckBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionCheckBox",_loc2_,param1));
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
      
      public function set isAllChecked(param1:Boolean) : void
      {
         var _loc2_:Object = this.isAllChecked;
         if(_loc2_ !== param1)
         {
            this._9700240isAllChecked = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isAllChecked",_loc2_,param1));
            }
         }
      }
   }
}
