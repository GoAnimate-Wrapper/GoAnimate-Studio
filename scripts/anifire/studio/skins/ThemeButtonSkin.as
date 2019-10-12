package anifire.studio.skins
{
   import anifire.studio.components.ThemeIcon;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class ThemeButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _809612678contentGroup:HGroup;
      
      private var _766836075frameDisplay:Rect;
      
      private var _17045986themeIcon:ThemeIcon;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ThemeButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._ThemeButtonSkin_Rect1_i(),this._ThemeButtonSkin_HGroup1_i()];
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
      
      private function _ThemeButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ThemeButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"frameDisplay");
         this.frameDisplay = _loc1_;
         BindingManager.executeBindings(this,"frameDisplay",this.frameDisplay);
         return _loc1_;
      }
      
      private function _ThemeButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _ThemeButtonSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingTop = 3;
         _loc1_.paddingBottom = 3;
         _loc1_.gap = 8;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ThemeButtonSkin_ThemeIcon1_i(),this._ThemeButtonSkin_Label1_i(),this._ThemeButtonSkin_Group1_c()];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _ThemeButtonSkin_ThemeIcon1_i() : ThemeIcon
      {
         var _loc1_:ThemeIcon = new ThemeIcon();
         _loc1_.id = "themeIcon";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.themeIcon = _loc1_;
         BindingManager.executeBindings(this,"themeIcon",this.themeIcon);
         return _loc1_;
      }
      
      private function _ThemeButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("paddingTop",2);
         _loc1_.setStyle("fontSize",14);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _ThemeButtonSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ThemeButtonSkin_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ThemeButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 1;
         _loc1_.data = "M 0 0 l 4.5 4 l 4.5 -4";
         _loc1_.stroke = this._ThemeButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _ThemeButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : HGroup
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._809612678contentGroup;
         if(_loc2_ !== param1)
         {
            this._809612678contentGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get frameDisplay() : Rect
      {
         return this._766836075frameDisplay;
      }
      
      public function set frameDisplay(param1:Rect) : void
      {
         var _loc2_:Object = this._766836075frameDisplay;
         if(_loc2_ !== param1)
         {
            this._766836075frameDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get themeIcon() : ThemeIcon
      {
         return this._17045986themeIcon;
      }
      
      public function set themeIcon(param1:ThemeIcon) : void
      {
         var _loc2_:Object = this._17045986themeIcon;
         if(_loc2_ !== param1)
         {
            this._17045986themeIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeIcon",_loc2_,param1));
            }
         }
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
