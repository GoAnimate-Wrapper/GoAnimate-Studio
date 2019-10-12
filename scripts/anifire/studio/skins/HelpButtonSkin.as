package anifire.studio.skins
{
   import anifire.studio.components.ArrowTipContainer;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.PopUpAnchor;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class HelpButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["labelDisplay"];
       
      
      public var _HelpButtonSkin_BitmapImage1:BitmapImage;
      
      private var _433014735dropDown:Group;
      
      private var _3143043fill:Rect;
      
      private var _1279270963helpLabel:Label;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      private var _embed_mxml__styles_images_icons_icon_help_png_1589982355:Class;
      
      public function HelpButtonSkin()
      {
         this._embed_mxml__styles_images_icons_icon_help_png_1589982355 = HelpButtonSkin__embed_mxml__styles_images_icons_icon_help_png_1589982355;
         super();
         mx_internal::_document = this;
         this.minWidth = 10;
         this.minHeight = 10;
         this.mxmlContent = [this._HelpButtonSkin_Rect1_i(),this._HelpButtonSkin_BitmapImage1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._HelpButtonSkin_PopUpAnchor1_i,this._HelpButtonSkin_PopUpAnchor1_r);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new AddItems().initializeFromObject({
               "destructionPolicy":"auto",
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_HelpButtonSkin_BitmapImage1"]
            }),new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":true
            })]
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
            this.fill.radiusX = this.cornerRadius;
         }
         super.updateDisplayList(param1,param2);
      }
      
      private function _HelpButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._HelpButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _HelpButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _HelpButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_icons_icon_help_png_1589982355;
         _loc1_.initialized(this,"_HelpButtonSkin_BitmapImage1");
         this._HelpButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_HelpButtonSkin_BitmapImage1",this._HelpButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _HelpButtonSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.displayPopUp = false;
         _loc1_.left = -3;
         _loc1_.top = 10;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "below";
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUp = this._HelpButtonSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _HelpButtonSkin_PopUpAnchor1_r() : void
      {
      }
      
      private function _HelpButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._HelpButtonSkin_ArrowTipContainer1_c()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _HelpButtonSkin_ArrowTipContainer1_c() : ArrowTipContainer
      {
         var _loc1_:ArrowTipContainer = new ArrowTipContainer();
         _loc1_.tipPosition = "below";
         _loc1_.targetWidth = 25;
         _loc1_.offset = 0;
         _loc1_.content = [this._HelpButtonSkin_Label1_i()];
         _loc1_.setStyle("skinClass",HelpButtonArrowTipContainerSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _HelpButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.top = 10;
         _loc1_.bottom = 10;
         _loc1_.width = 180;
         _loc1_.minHeight = 20;
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "helpLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.helpLabel = _loc1_;
         BindingManager.executeBindings(this,"helpLabel",this.helpLabel);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get dropDown() : Group
      {
         return this._433014735dropDown;
      }
      
      public function set dropDown(param1:Group) : void
      {
         var _loc2_:Object = this._433014735dropDown;
         if(_loc2_ !== param1)
         {
            this._433014735dropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get helpLabel() : Label
      {
         return this._1279270963helpLabel;
      }
      
      public function set helpLabel(param1:Label) : void
      {
         var _loc2_:Object = this._1279270963helpLabel;
         if(_loc2_ !== param1)
         {
            this._1279270963helpLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"helpLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popUp() : PopUpAnchor
      {
         return this._106851532popUp;
      }
      
      public function set popUp(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._106851532popUp;
         if(_loc2_ !== param1)
         {
            this._106851532popUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUp",_loc2_,param1));
            }
         }
      }
   }
}
