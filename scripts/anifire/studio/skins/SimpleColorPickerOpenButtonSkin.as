package anifire.studio.skins
{
   import anifire.studio.components.ColorDisplayGroup;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.skins.SparkButtonSkin;
   
   public class SimpleColorPickerOpenButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["labelDisplay"];
       
      
      private var _358089761colorDisplay:ColorDisplayGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      public function SimpleColorPickerOpenButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 5;
         this.minHeight = 5;
         this.mxmlContent = [this._SimpleColorPickerOpenButtonSkin_ColorDisplayGroup1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = getStyle("cornerRadius");
         if(this.cornerRadius != _loc3_)
         {
            this.cornerRadius = _loc3_;
         }
         super.updateDisplayList(param1,param2);
      }
      
      private function _SimpleColorPickerOpenButtonSkin_ColorDisplayGroup1_i() : ColorDisplayGroup
      {
         var _loc1_:ColorDisplayGroup = new ColorDisplayGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "colorDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorDisplay = _loc1_;
         BindingManager.executeBindings(this,"colorDisplay",this.colorDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get colorDisplay() : ColorDisplayGroup
      {
         return this._358089761colorDisplay;
      }
      
      public function set colorDisplay(param1:ColorDisplayGroup) : void
      {
         var _loc2_:Object = this._358089761colorDisplay;
         if(_loc2_ !== param1)
         {
            this._358089761colorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorDisplay",_loc2_,param1));
            }
         }
      }
   }
}
