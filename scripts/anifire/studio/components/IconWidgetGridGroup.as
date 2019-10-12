package anifire.studio.components
{
   import anifire.studio.commands.ChangeWidgetAutoGridCommand;
   import anifire.studio.commands.ChangeWidgetGridCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Widget;
   import anifire.studio.skins.DefaultValueTextInputEditButtonSkin;
   import anifire.studio.skins.ResetButtonSkin;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.utils.StringUtil;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   
   use namespace mx_internal;
   
   public class IconWidgetGridGroup extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _956252696_IconWidgetGridGroup_HGroup1:HGroup;
      
      private var _956252697_IconWidgetGridGroup_HGroup2:HGroup;
      
      private var _587545164autoFitButton:Button;
      
      private var _703068110autoFitLabel:Label;
      
      private var _1454002652editButton:Button;
      
      private var _343161611gridColumnStepper:NumericStepper;
      
      private var _755049341gridRowStepper:NumericStepper;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _widget:Widget;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function IconWidgetGridGroup()
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
         bindings = this._IconWidgetGridGroup_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_IconWidgetGridGroupWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return IconWidgetGridGroup[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._IconWidgetGridGroup_HGroup1_i(),this._IconWidgetGridGroup_HGroup2_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_IconWidgetGridGroup_HGroup2",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_IconWidgetGridGroup_HGroup2",
               "name":"includeInLayout",
               "value":false
            })]
         }),new State({
            "name":"auto",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_IconWidgetGridGroup_HGroup1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_IconWidgetGridGroup_HGroup1",
               "name":"includeInLayout",
               "value":false
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
         IconWidgetGridGroup._watcherSetupUtil = param1;
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
      
      public function get widget() : Widget
      {
         return this._widget;
      }
      
      public function set widget(param1:Widget) : void
      {
         if(this._widget != param1)
         {
            this._widget = param1;
         }
         if(this._widget)
         {
            if(this._widget.autoGrid)
            {
               currentState = "auto";
            }
            else
            {
               currentState = "normal";
            }
            this.updateUI();
         }
      }
      
      protected function updateUI() : void
      {
         this.autoFitLabel.text = StringUtil.substitute(UtilDict.toDisplay("go","{0}x{1} (Auto-fit with max value)"),this._widget.gridColumns,this._widget.gridRows);
         this.gridColumnStepper.value = this._widget.gridColumns;
         this.gridRowStepper.value = this._widget.gridRows;
      }
      
      protected function changeGridValue() : void
      {
         var _loc1_:ICommand = new ChangeWidgetGridCommand(this._widget,this.gridRowStepper.value,this.gridColumnStepper.value);
         _loc1_.execute();
      }
      
      protected function useAutoGrid() : void
      {
         var _loc1_:ICommand = new ChangeWidgetAutoGridCommand(this._widget);
         _loc1_.execute();
         this.updateUI();
         currentState = "auto";
      }
      
      protected function editButton_clickHandler(param1:MouseEvent) : void
      {
         this.updateUI();
         currentState = "normal";
      }
      
      private function _IconWidgetGridGroup_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "baseline";
         _loc1_.mxmlContent = [this._IconWidgetGridGroup_NumericStepper1_i(),this._IconWidgetGridGroup_Label1_c(),this._IconWidgetGridGroup_NumericStepper2_i(),this._IconWidgetGridGroup_Button1_i()];
         _loc1_.id = "_IconWidgetGridGroup_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconWidgetGridGroup_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_IconWidgetGridGroup_HGroup1",this._IconWidgetGridGroup_HGroup1);
         return _loc1_;
      }
      
      private function _IconWidgetGridGroup_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.width = 60;
         _loc1_.minimum = 1;
         _loc1_.maximum = 10;
         _loc1_.precision = 0;
         _loc1_.useTimeFormat = false;
         _loc1_.addEventListener("change",this.__gridColumnStepper_change);
         _loc1_.id = "gridColumnStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gridColumnStepper = _loc1_;
         BindingManager.executeBindings(this,"gridColumnStepper",this.gridColumnStepper);
         return _loc1_;
      }
      
      public function __gridColumnStepper_change(param1:Event) : void
      {
         this.changeGridValue();
      }
      
      private function _IconWidgetGridGroup_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "×";
         _loc1_.setStyle("fontWeight","bold");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _IconWidgetGridGroup_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.width = 60;
         _loc1_.minimum = 1;
         _loc1_.maximum = 10;
         _loc1_.precision = 0;
         _loc1_.useTimeFormat = false;
         _loc1_.addEventListener("change",this.__gridRowStepper_change);
         _loc1_.id = "gridRowStepper";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gridRowStepper = _loc1_;
         BindingManager.executeBindings(this,"gridRowStepper",this.gridRowStepper);
         return _loc1_;
      }
      
      public function __gridRowStepper_change(param1:Event) : void
      {
         this.changeGridValue();
      }
      
      private function _IconWidgetGridGroup_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ResetButtonSkin);
         _loc1_.addEventListener("click",this.__autoFitButton_click);
         _loc1_.id = "autoFitButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.autoFitButton = _loc1_;
         BindingManager.executeBindings(this,"autoFitButton",this.autoFitButton);
         return _loc1_;
      }
      
      public function __autoFitButton_click(param1:MouseEvent) : void
      {
         this.useAutoGrid();
      }
      
      private function _IconWidgetGridGroup_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._IconWidgetGridGroup_Label2_i(),this._IconWidgetGridGroup_Button2_i()];
         _loc1_.id = "_IconWidgetGridGroup_HGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._IconWidgetGridGroup_HGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_IconWidgetGridGroup_HGroup2",this._IconWidgetGridGroup_HGroup2);
         return _loc1_;
      }
      
      private function _IconWidgetGridGroup_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",13421772);
         _loc1_.id = "autoFitLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.autoFitLabel = _loc1_;
         BindingManager.executeBindings(this,"autoFitLabel",this.autoFitLabel);
         return _loc1_;
      }
      
      private function _IconWidgetGridGroup_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",DefaultValueTextInputEditButtonSkin);
         _loc1_.addEventListener("click",this.__editButton_click);
         _loc1_.id = "editButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editButton = _loc1_;
         BindingManager.executeBindings(this,"editButton",this.editButton);
         return _loc1_;
      }
      
      public function __editButton_click(param1:MouseEvent) : void
      {
         this.editButton_clickHandler(param1);
      }
      
      private function _IconWidgetGridGroup_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Reset to auto-fit");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"autoFitButton.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconWidgetGridGroup_HGroup1() : HGroup
      {
         return this._956252696_IconWidgetGridGroup_HGroup1;
      }
      
      public function set _IconWidgetGridGroup_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._956252696_IconWidgetGridGroup_HGroup1;
         if(_loc2_ !== param1)
         {
            this._956252696_IconWidgetGridGroup_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconWidgetGridGroup_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _IconWidgetGridGroup_HGroup2() : HGroup
      {
         return this._956252697_IconWidgetGridGroup_HGroup2;
      }
      
      public function set _IconWidgetGridGroup_HGroup2(param1:HGroup) : void
      {
         var _loc2_:Object = this._956252697_IconWidgetGridGroup_HGroup2;
         if(_loc2_ !== param1)
         {
            this._956252697_IconWidgetGridGroup_HGroup2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_IconWidgetGridGroup_HGroup2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get autoFitButton() : Button
      {
         return this._587545164autoFitButton;
      }
      
      public function set autoFitButton(param1:Button) : void
      {
         var _loc2_:Object = this._587545164autoFitButton;
         if(_loc2_ !== param1)
         {
            this._587545164autoFitButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoFitButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get autoFitLabel() : Label
      {
         return this._703068110autoFitLabel;
      }
      
      public function set autoFitLabel(param1:Label) : void
      {
         var _loc2_:Object = this._703068110autoFitLabel;
         if(_loc2_ !== param1)
         {
            this._703068110autoFitLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"autoFitLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editButton() : Button
      {
         return this._1454002652editButton;
      }
      
      public function set editButton(param1:Button) : void
      {
         var _loc2_:Object = this._1454002652editButton;
         if(_loc2_ !== param1)
         {
            this._1454002652editButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gridColumnStepper() : NumericStepper
      {
         return this._343161611gridColumnStepper;
      }
      
      public function set gridColumnStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._343161611gridColumnStepper;
         if(_loc2_ !== param1)
         {
            this._343161611gridColumnStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gridColumnStepper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gridRowStepper() : NumericStepper
      {
         return this._755049341gridRowStepper;
      }
      
      public function set gridRowStepper(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._755049341gridRowStepper;
         if(_loc2_ !== param1)
         {
            this._755049341gridRowStepper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gridRowStepper",_loc2_,param1));
            }
         }
      }
   }
}
