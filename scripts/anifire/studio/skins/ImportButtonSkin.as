package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.PopUpAnchor;
   import spark.components.supportClasses.Skin;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class ImportButtonSkin extends Skin implements IStateClient2
   {
       
      
      public var _ImportButtonSkin_PopUpAnchor1:PopUpAnchor;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var _268453613popUpGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function ImportButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.width = 50;
         this.height = 50;
         this.mxmlContent = [this._ImportButtonSkin_BitmapImage1_i()];
         this.currentState = "disabled";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ImportButtonSkin_PopUpAnchor1_i);
         states = [new State({
            "name":"disabled",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["iconDisplay"]
            })]
         }),new State({
            "name":"up",
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
      
      private function _ImportButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _ImportButtonSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 5;
         _loc1_.popUpPosition = "below";
         _loc1_.displayPopUp = true;
         _loc1_.popUp = this._ImportButtonSkin_Group1_i();
         _loc1_.id = "_ImportButtonSkin_PopUpAnchor1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ImportButtonSkin_PopUpAnchor1 = _loc1_;
         BindingManager.executeBindings(this,"_ImportButtonSkin_PopUpAnchor1",this._ImportButtonSkin_PopUpAnchor1);
         return _loc1_;
      }
      
      private function _ImportButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         _loc1_.width = 50;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.blendMode = "layer";
         _loc1_.alpha = 0.9;
         _loc1_.mxmlContent = [this._ImportButtonSkin_Path1_c(),this._ImportButtonSkin_Group2_c()];
         _loc1_.id = "popUpGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUpGroup = _loc1_;
         BindingManager.executeBindings(this,"popUpGroup",this.popUpGroup);
         return _loc1_;
      }
      
      private function _ImportButtonSkin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 5 l 5 -5 l 5 5 Z";
         _loc1_.fill = this._ImportButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ImportButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _ImportButtonSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.minWidth = 50;
         _loc1_.left = 0;
         _loc1_.top = 5;
         _loc1_.mxmlContent = [this._ImportButtonSkin_Rect1_c(),this._ImportButtonSkin_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ImportButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ImportButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _ImportButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("paddingTop",5);
         _loc1_.setStyle("paddingBottom",5);
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
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get popUpGroup() : Group
      {
         return this._268453613popUpGroup;
      }
      
      public function set popUpGroup(param1:Group) : void
      {
         var _loc2_:Object = this._268453613popUpGroup;
         if(_loc2_ !== param1)
         {
            this._268453613popUpGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpGroup",_loc2_,param1));
            }
         }
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
