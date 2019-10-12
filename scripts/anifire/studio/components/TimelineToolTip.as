package anifire.studio.components
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.IToolTip;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   public class TimelineToolTip extends Group implements IStateClient2, IToolTip
   {
       
      
      private var _1791980707_TimelineToolTip_SolidColor1:SolidColor;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _warning:Boolean;
      
      public function TimelineToolTip()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._TimelineToolTip_RectangularDropShadow1_c(),this._TimelineToolTip_Rect1_c(),this._TimelineToolTip_Label1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"warning",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_TimelineToolTip_SolidColor1",
               "name":"color",
               "value":12660001
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":16777215
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
      
      public function get warning() : Boolean
      {
         return this._warning;
      }
      
      public function set warning(param1:Boolean) : void
      {
         this._warning = param1;
         currentState = !!this._warning?"warning":"normal";
      }
      
      public function get text() : String
      {
         return this.labelDisplay.text;
      }
      
      public function set text(param1:String) : void
      {
         this.labelDisplay.text = param1;
      }
      
      private function _TimelineToolTip_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.angle = 90;
         _loc1_.distance = 2;
         _loc1_.color = 6710886;
         _loc1_.tlRadius = 2;
         _loc1_.trRadius = 2;
         _loc1_.blRadius = 2;
         _loc1_.brRadius = 2;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimelineToolTip_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.radiusX = 2;
         _loc1_.radiusY = 2;
         _loc1_.fill = this._TimelineToolTip_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TimelineToolTip_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 5550527;
         this._TimelineToolTip_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_TimelineToolTip_SolidColor1",this._TimelineToolTip_SolidColor1);
         return _loc1_;
      }
      
      private function _TimelineToolTip_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",3355443);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _TimelineToolTip_SolidColor1() : SolidColor
      {
         return this._1791980707_TimelineToolTip_SolidColor1;
      }
      
      public function set _TimelineToolTip_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1791980707_TimelineToolTip_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1791980707_TimelineToolTip_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TimelineToolTip_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
   }
}
