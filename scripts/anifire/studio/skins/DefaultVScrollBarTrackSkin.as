package anifire.studio.skins
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import spark.components.Button;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class DefaultVScrollBarTrackSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function DefaultVScrollBarTrackSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._DefaultVScrollBarTrackSkin_Rect1_c(),this._DefaultVScrollBarTrackSkin_Line1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"disabled",
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
      
      private function _DefaultVScrollBarTrackSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.minWidth = 15;
         _loc1_.minHeight = 14;
         _loc1_.fill = this._DefaultVScrollBarTrackSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DefaultVScrollBarTrackSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.entries = [this._DefaultVScrollBarTrackSkin_GradientEntry1_c(),this._DefaultVScrollBarTrackSkin_GradientEntry2_c(),this._DefaultVScrollBarTrackSkin_GradientEntry3_c()];
         return _loc1_;
      }
      
      private function _DefaultVScrollBarTrackSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15921906;
         return _loc1_;
      }
      
      private function _DefaultVScrollBarTrackSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16448250;
         _loc1_.ratio = 0.75;
         return _loc1_;
      }
      
      private function _DefaultVScrollBarTrackSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14671839;
         _loc1_.ratio = 1;
         return _loc1_;
      }
      
      private function _DefaultVScrollBarTrackSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._DefaultVScrollBarTrackSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DefaultVScrollBarTrackSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15000804;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
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
