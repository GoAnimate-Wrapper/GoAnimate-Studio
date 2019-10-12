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
   import spark.primitives.Ellipse;
   import spark.primitives.Path;
   import spark.skins.SparkButtonSkin;
   
   public class FlatNextButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _1310878572_FlatNextButtonSkin_SolidColor1:SolidColor;
      
      private var _1703319812_FlatNextButtonSkin_SolidColorStroke1:SolidColorStroke;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function FlatNextButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._FlatNextButtonSkin_Ellipse1_c(),this._FlatNextButtonSkin_Path1_c()];
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
            }),new SetProperty().initializeFromObject({
               "target":"_FlatNextButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":13882333
            }),new SetProperty().initializeFromObject({
               "target":"_FlatNextButtonSkin_SolidColor1",
               "name":"color",
               "value":13882333
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
      
      private function _FlatNextButtonSkin_Ellipse1_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 22;
         _loc1_.height = 22;
         _loc1_.stroke = this._FlatNextButtonSkin_SolidColorStroke1_i();
         _loc1_.fill = this._FlatNextButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlatNextButtonSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6142119;
         this._FlatNextButtonSkin_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_FlatNextButtonSkin_SolidColorStroke1",this._FlatNextButtonSkin_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _FlatNextButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         this._FlatNextButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_FlatNextButtonSkin_SolidColor1",this._FlatNextButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _FlatNextButtonSkin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = -0.5;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 0 l 5 4 l -5 4";
         _loc1_.stroke = this._FlatNextButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlatNextButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FlatNextButtonSkin_SolidColor1() : SolidColor
      {
         return this._1310878572_FlatNextButtonSkin_SolidColor1;
      }
      
      public function set _FlatNextButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1310878572_FlatNextButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1310878572_FlatNextButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FlatNextButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FlatNextButtonSkin_SolidColorStroke1() : SolidColorStroke
      {
         return this._1703319812_FlatNextButtonSkin_SolidColorStroke1;
      }
      
      public function set _FlatNextButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1703319812_FlatNextButtonSkin_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._1703319812_FlatNextButtonSkin_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FlatNextButtonSkin_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
   }
}
