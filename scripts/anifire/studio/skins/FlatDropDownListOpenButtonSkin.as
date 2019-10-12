package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class FlatDropDownListOpenButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function FlatDropDownListOpenButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 30;
         this.minHeight = 21;
         this.mxmlContent = [this._FlatDropDownListOpenButtonSkin_Rect1_c(),this._FlatDropDownListOpenButtonSkin_Path1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDownStates"],
            "overrides":[]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"triangle",
               "name":"visible",
               "value":false
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
      
      private function _FlatDropDownListOpenButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FlatDropDownListOpenButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.right = 10;
         _loc1_.data = "M 0 0 l 4 4 l 4 -4";
         _loc1_.stroke = this._FlatDropDownListOpenButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _FlatDropDownListOpenButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4439205;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get triangle() : Path
      {
         return this._1497762312triangle;
      }
      
      public function set triangle(param1:Path) : void
      {
         var _loc2_:Object = this._1497762312triangle;
         if(_loc2_ !== param1)
         {
            this._1497762312triangle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triangle",_loc2_,param1));
            }
         }
      }
   }
}
