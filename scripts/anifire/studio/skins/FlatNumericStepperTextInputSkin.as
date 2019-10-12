package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.RichEditableText;
   import spark.components.TextInput;
   import spark.skins.SparkSkin;
   
   public class FlatNumericStepperTextInputSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _831827669textDisplay:RichEditableText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:TextInput;
      
      public function FlatNumericStepperTextInputSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._FlatNumericStepperTextInputSkin_RichEditableText1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetStyle().initializeFromObject({
               "target":"textDisplay",
               "name":"color",
               "value":11184810
            })]
         }),new State({
            "name":"normalWithPrompt",
            "overrides":[]
         }),new State({
            "name":"disabledWithPrompt",
            "stateGroups":["disabledStates"],
            "overrides":[]
         })];
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
      
      private function _FlatNumericStepperTextInputSkin_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.lineBreak = "explicit";
         _loc1_.multiline = false;
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.setStyle("backgroundAlpha",0);
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("paddingLeft",2);
         _loc1_.setStyle("paddingTop",3);
         _loc1_.setStyle("paddingRight",4);
         _loc1_.setStyle("paddingBottom",3);
         _loc1_.id = "textDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textDisplay = _loc1_;
         BindingManager.executeBindings(this,"textDisplay",this.textDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get textDisplay() : RichEditableText
      {
         return this._831827669textDisplay;
      }
      
      public function set textDisplay(param1:RichEditableText) : void
      {
         var _loc2_:Object = this._831827669textDisplay;
         if(_loc2_ !== param1)
         {
            this._831827669textDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : TextInput
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:TextInput) : void
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
