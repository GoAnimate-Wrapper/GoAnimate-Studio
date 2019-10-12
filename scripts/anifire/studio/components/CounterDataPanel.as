package anifire.studio.components
{
   import anifire.event.WidgetEvent;
   import anifire.studio.commands.ChangeWidgetDataCommand;
   import anifire.studio.commands.ICommand;
   import anifire.util.UtilDict;
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
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class CounterDataPanel extends WidgetPanelBase implements IBindingClient
   {
      
      private static const DEFAULT_HELP_TEXT:String = "Set the target value and the counter will count towards it when there is an enter effect.";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CounterDataPanel_Label1:Label;
      
      public var _CounterDataPanel_Label2:Label;
      
      public var _CounterDataPanel_Label3:Label;
      
      private var _735423955helpButton:HelpButton;
      
      private var _371842341startValueInput:DefaultValueTextInput;
      
      private var _1037197642targetValueInput:DefaultValueTextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var helpText:String;
      
      private var _command:ICommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CounterDataPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CounterDataPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CounterDataPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CounterDataPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._CounterDataPanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CounterDataPanel._watcherSetupUtil = param1;
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
      
      override protected function init() : void
      {
         this.helpButton.helpText = UtilDict.toDisplay("go",DEFAULT_HELP_TEXT);
         super.init();
      }
      
      override protected function onWidgetDataChange(param1:WidgetEvent) : void
      {
         this.updateUI();
      }
      
      override protected function updateUI() : void
      {
         if(initialized && _widget)
         {
            this.startValueInput.defaultText = "0";
            if(_widget.dataRows && _widget.dataRows.length >= 3)
            {
               this.startValueInput.value = _widget.dataRows[0].value;
               this.targetValueInput.value = _widget.dataRows[1].value;
            }
            else
            {
               this.startValueInput.value = 0;
               this.targetValueInput.value = 0;
            }
         }
      }
      
      private function generateDataXml() : XML
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc1_:XML = <data/>;
         _loc2_ = <row/>;
         _loc1_.appendChild(_loc2_);
         _loc3_ = <cell></cell>;
         _loc2_.appendChild(_loc3_);
         _loc3_ = <cell>{String(this.startValueInput.value)}</cell>;
         _loc2_.appendChild(_loc3_);
         _loc2_ = <row/>;
         _loc1_.appendChild(_loc2_);
         _loc3_ = <cell></cell>;
         _loc2_.appendChild(_loc3_);
         _loc3_ = <cell>{String(this.targetValueInput.value)}</cell>;
         _loc2_.appendChild(_loc3_);
         _loc2_ = <row/>;
         _loc1_.appendChild(_loc2_);
         _loc3_ = <cell></cell>;
         _loc2_.appendChild(_loc3_);
         _loc3_ = <cell>{String(this.targetValueInput.value)}</cell>;
         _loc2_.appendChild(_loc3_);
         return _loc1_;
      }
      
      protected function targetValueInput_changeHandler(param1:Event) : void
      {
         if(_widget)
         {
            _widget.data = this.generateDataXml().toXMLString();
         }
      }
      
      protected function targetValueInput_focusInHandler(param1:Event) : void
      {
         if(_widget)
         {
            this.editTargetValue();
         }
      }
      
      protected function targetValueInput_focusOutHandler(param1:Event) : void
      {
         this.commitTargetValue();
      }
      
      protected function targetValueInput_enterHandler(param1:Event) : void
      {
         if(this.commitTargetValue())
         {
            this.editTargetValue();
         }
      }
      
      protected function editTargetValue() : void
      {
         this._command = new ChangeWidgetDataCommand(_widget,"");
      }
      
      protected function commitTargetValue() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc1_:ChangeWidgetDataCommand = this._command as ChangeWidgetDataCommand;
         if(_loc1_)
         {
            _loc2_ = Number(this.targetValueInput.value);
            if(isNaN(_loc2_))
            {
               _loc2_ = 0;
               this.targetValueInput.value = _loc2_;
            }
            _loc3_ = this.generateDataXml().toXMLString();
            _loc1_.executeNow(_loc3_);
            return true;
         }
         return false;
      }
      
      protected function startValueInput_changeHandler(param1:Event) : void
      {
         if(_widget)
         {
            _widget.data = this.generateDataXml().toXMLString();
         }
      }
      
      protected function startValueInput_focusInHandler(param1:Event) : void
      {
         if(_widget)
         {
            this.editStartValue();
         }
      }
      
      protected function startValueInput_focusOutHandler(param1:Event) : void
      {
         this.commitStartValue();
      }
      
      protected function startValueInput_enterHandler(param1:Event) : void
      {
         if(this.commitStartValue())
         {
            this.editStartValue();
         }
      }
      
      protected function editStartValue() : void
      {
         this._command = new ChangeWidgetDataCommand(_widget,"");
      }
      
      protected function commitStartValue() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc1_:ChangeWidgetDataCommand = this._command as ChangeWidgetDataCommand;
         if(_loc1_)
         {
            _loc2_ = Number(this.startValueInput.value);
            if(isNaN(_loc2_))
            {
               _loc2_ = 0;
            }
            this.startValueInput.value = _loc2_;
            _loc3_ = this.generateDataXml().toXMLString();
            _loc1_.executeNow(_loc3_);
            return true;
         }
         return false;
      }
      
      private function _CounterDataPanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._CounterDataPanel_VGroup1_c()];
         return _loc1_;
      }
      
      private function _CounterDataPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 20;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingTop = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.mxmlContent = [this._CounterDataPanel_HGroup1_c(),this._CounterDataPanel_HGroup2_c(),this._CounterDataPanel_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CounterDataPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CounterDataPanel_Label1_i(),this._CounterDataPanel_HelpButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CounterDataPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "_CounterDataPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CounterDataPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_CounterDataPanel_Label1",this._CounterDataPanel_Label1);
         return _loc1_;
      }
      
      private function _CounterDataPanel_HelpButton1_i() : HelpButton
      {
         var _loc1_:HelpButton = new HelpButton();
         _loc1_.id = "helpButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.helpButton = _loc1_;
         BindingManager.executeBindings(this,"helpButton",this.helpButton);
         return _loc1_;
      }
      
      private function _CounterDataPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 5;
         _loc1_.mxmlContent = [this._CounterDataPanel_Label2_i(),this._CounterDataPanel_DefaultValueTextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CounterDataPanel_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 100;
         _loc1_.setStyle("color",9803424);
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_CounterDataPanel_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CounterDataPanel_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_CounterDataPanel_Label2",this._CounterDataPanel_Label2);
         return _loc1_;
      }
      
      private function _CounterDataPanel_DefaultValueTextInput1_i() : DefaultValueTextInput
      {
         var _loc1_:DefaultValueTextInput = new DefaultValueTextInput();
         _loc1_.restrict = "0-9\\-.";
         _loc1_.width = 120;
         _loc1_.addEventListener("focusIn",this.__targetValueInput_focusIn);
         _loc1_.addEventListener("focusOut",this.__targetValueInput_focusOut);
         _loc1_.addEventListener("enter",this.__targetValueInput_enter);
         _loc1_.id = "targetValueInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.targetValueInput = _loc1_;
         BindingManager.executeBindings(this,"targetValueInput",this.targetValueInput);
         return _loc1_;
      }
      
      public function __targetValueInput_focusIn(param1:FocusEvent) : void
      {
         this.targetValueInput_focusInHandler(param1);
      }
      
      public function __targetValueInput_focusOut(param1:FocusEvent) : void
      {
         this.targetValueInput_focusOutHandler(param1);
      }
      
      public function __targetValueInput_enter(param1:FlexEvent) : void
      {
         this.targetValueInput_enterHandler(param1);
      }
      
      private function _CounterDataPanel_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 5;
         _loc1_.mxmlContent = [this._CounterDataPanel_Label3_i(),this._CounterDataPanel_DefaultValueTextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CounterDataPanel_Label3_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 100;
         _loc1_.setStyle("color",9803424);
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_CounterDataPanel_Label3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CounterDataPanel_Label3 = _loc1_;
         BindingManager.executeBindings(this,"_CounterDataPanel_Label3",this._CounterDataPanel_Label3);
         return _loc1_;
      }
      
      private function _CounterDataPanel_DefaultValueTextInput2_i() : DefaultValueTextInput
      {
         var _loc1_:DefaultValueTextInput = new DefaultValueTextInput();
         _loc1_.restrict = "0-9\\-.";
         _loc1_.width = 120;
         _loc1_.addEventListener("focusIn",this.__startValueInput_focusIn);
         _loc1_.addEventListener("focusOut",this.__startValueInput_focusOut);
         _loc1_.addEventListener("enter",this.__startValueInput_enter);
         _loc1_.id = "startValueInput";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.startValueInput = _loc1_;
         BindingManager.executeBindings(this,"startValueInput",this.startValueInput);
         return _loc1_;
      }
      
      public function __startValueInput_focusIn(param1:FocusEvent) : void
      {
         this.startValueInput_focusInHandler(param1);
      }
      
      public function __startValueInput_focusOut(param1:FocusEvent) : void
      {
         this.startValueInput_focusOutHandler(param1);
      }
      
      public function __startValueInput_enter(param1:FlexEvent) : void
      {
         this.startValueInput_enterHandler(param1);
      }
      
      private function _CounterDataPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Number counter");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CounterDataPanel_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Target value");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CounterDataPanel_Label2.text");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Count from");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CounterDataPanel_Label3.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get helpButton() : HelpButton
      {
         return this._735423955helpButton;
      }
      
      public function set helpButton(param1:HelpButton) : void
      {
         var _loc2_:Object = this._735423955helpButton;
         if(_loc2_ !== param1)
         {
            this._735423955helpButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get startValueInput() : DefaultValueTextInput
      {
         return this._371842341startValueInput;
      }
      
      public function set startValueInput(param1:DefaultValueTextInput) : void
      {
         var _loc2_:Object = this._371842341startValueInput;
         if(_loc2_ !== param1)
         {
            this._371842341startValueInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"startValueInput",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetValueInput() : DefaultValueTextInput
      {
         return this._1037197642targetValueInput;
      }
      
      public function set targetValueInput(param1:DefaultValueTextInput) : void
      {
         var _loc2_:Object = this._1037197642targetValueInput;
         if(_loc2_ !== param1)
         {
            this._1037197642targetValueInput = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetValueInput",_loc2_,param1));
            }
         }
      }
   }
}
