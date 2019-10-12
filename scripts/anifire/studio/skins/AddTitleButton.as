package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Label;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class AddTitleButton extends SparkButtonSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["labelDisplay"];
       
      
      private var _346120186_AddTitleButton_GradientEntry1:GradientEntry;
      
      private var _346120185_AddTitleButton_GradientEntry2:GradientEntry;
      
      private var _3143043fill:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      public function AddTitleButton()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._AddTitleButton_Rect1_i(),this._AddTitleButton_Label1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_AddTitleButton_GradientEntry1",
               "name":"color",
               "value":12303805
            }),new SetProperty().initializeFromObject({
               "target":"_AddTitleButton_GradientEntry2",
               "name":"color",
               "value":10461345
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":170629
            })]
         }),new State({
            "name":"down",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_AddTitleButton_GradientEntry1",
               "name":"color",
               "value":11184810
            }),new SetProperty().initializeFromObject({
               "target":"_AddTitleButton_GradientEntry2",
               "name":"color",
               "value":9606294
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":13290444
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
            this.fill.radiusX = this.cornerRadius;
         }
         super.updateDisplayList(param1,param2);
      }
      
      private function _AddTitleButton_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 2;
         _loc1_.alpha = 0;
         _loc1_.fill = this._AddTitleButton_LinearGradient1_c();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _AddTitleButton_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._AddTitleButton_GradientEntry1_i(),this._AddTitleButton_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _AddTitleButton_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.85;
         this._AddTitleButton_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_AddTitleButton_GradientEntry1",this._AddTitleButton_GradientEntry1);
         return _loc1_;
      }
      
      private function _AddTitleButton_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14211288;
         _loc1_.alpha = 0.85;
         this._AddTitleButton_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_AddTitleButton_GradientEntry2",this._AddTitleButton_GradientEntry2);
         return _loc1_;
      }
      
      private function _AddTitleButton_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.setStyle("color",4439205);
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _AddTitleButton_GradientEntry1() : GradientEntry
      {
         return this._346120186_AddTitleButton_GradientEntry1;
      }
      
      public function set _AddTitleButton_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._346120186_AddTitleButton_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._346120186_AddTitleButton_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_AddTitleButton_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _AddTitleButton_GradientEntry2() : GradientEntry
      {
         return this._346120185_AddTitleButton_GradientEntry2;
      }
      
      public function set _AddTitleButton_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._346120185_AddTitleButton_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._346120185_AddTitleButton_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_AddTitleButton_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fill() : Rect
      {
         return this._3143043fill;
      }
      
      public function set fill(param1:Rect) : void
      {
         var _loc2_:Object = this._3143043fill;
         if(_loc2_ !== param1)
         {
            this._3143043fill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fill",_loc2_,param1));
            }
         }
      }
   }
}
