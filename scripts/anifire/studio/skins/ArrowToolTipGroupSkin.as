package anifire.studio.skins
{
   import anifire.studio.components.ArrowToolTipGroup;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.RichEditableText;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ArrowToolTipGroupSkin extends Skin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1026432949arrowDown:Path;
      
      private var _1026204752arrowLeft:Path;
      
      private var _1741915245arrowRight:Path;
      
      private var _734027644arrowUp:Path;
      
      private var _268453613popUpGroup:Group;
      
      private var _2084362067richEditableText:RichEditableText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:ArrowToolTipGroup;
      
      public function ArrowToolTipGroupSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ArrowToolTipGroupSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_ArrowToolTipGroupSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ArrowToolTipGroupSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ArrowToolTipGroupSkin_Group1_i()];
         this.currentState = "left";
         states = [new State({
            "name":"left",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"arrowLeft",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"right",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"arrowRight",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"up",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"arrowUp",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"down",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"arrowDown",
               "name":"visible",
               "value":true
            })]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ArrowToolTipGroupSkin._watcherSetupUtil = param1;
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
      
      private function _ArrowToolTipGroupSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.blendMode = "layer";
         _loc1_.alpha = 1;
         _loc1_.mxmlContent = [this._ArrowToolTipGroupSkin_Group2_c(),this._ArrowToolTipGroupSkin_Path1_i(),this._ArrowToolTipGroupSkin_Path2_i(),this._ArrowToolTipGroupSkin_Path3_i(),this._ArrowToolTipGroupSkin_Path4_i()];
         _loc1_.id = "popUpGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUpGroup = _loc1_;
         BindingManager.executeBindings(this,"popUpGroup",this.popUpGroup);
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 10;
         _loc1_.bottom = 10;
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.mxmlContent = [this._ArrowToolTipGroupSkin_Rect1_c(),this._ArrowToolTipGroupSkin_RichEditableText1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ArrowToolTipGroupSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.multiline = true;
         _loc1_.editable = false;
         _loc1_.focusEnabled = false;
         _loc1_.selectable = false;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("paddingTop",5);
         _loc1_.setStyle("paddingBottom",5);
         _loc1_.id = "richEditableText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.richEditableText = _loc1_;
         BindingManager.executeBindings(this,"richEditableText",this.richEditableText);
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 5;
         _loc1_.data = "M 0 0 l 5 5 l 5 -5 Z";
         _loc1_.visible = false;
         _loc1_.fill = this._ArrowToolTipGroupSkin_SolidColor2_c();
         _loc1_.initialized(this,"arrowDown");
         this.arrowDown = _loc1_;
         BindingManager.executeBindings(this,"arrowDown",this.arrowDown);
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_Path2_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 5;
         _loc1_.data = "M 0 0 l 5 -5 l 5 5 Z";
         _loc1_.visible = false;
         _loc1_.fill = this._ArrowToolTipGroupSkin_SolidColor3_c();
         _loc1_.initialized(this,"arrowUp");
         this.arrowUp = _loc1_;
         BindingManager.executeBindings(this,"arrowUp",this.arrowUp);
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_Path3_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 5;
         _loc1_.data = "M 0 0 l -5 5 l 5 5 Z";
         _loc1_.visible = false;
         _loc1_.fill = this._ArrowToolTipGroupSkin_SolidColor4_c();
         _loc1_.initialized(this,"arrowLeft");
         this.arrowLeft = _loc1_;
         BindingManager.executeBindings(this,"arrowLeft",this.arrowLeft);
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_Path4_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.right = 5;
         _loc1_.data = "M 0 0 l 5 5 l -5 5 Z";
         _loc1_.visible = false;
         _loc1_.fill = this._ArrowToolTipGroupSkin_SolidColor5_c();
         _loc1_.initialized(this,"arrowRight");
         this.arrowRight = _loc1_;
         BindingManager.executeBindings(this,"arrowRight",this.arrowRight);
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _ArrowToolTipGroupSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return hostComponent.textWidth;
         },null,"richEditableText.width");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowDown() : Path
      {
         return this._1026432949arrowDown;
      }
      
      public function set arrowDown(param1:Path) : void
      {
         var _loc2_:Object = this._1026432949arrowDown;
         if(_loc2_ !== param1)
         {
            this._1026432949arrowDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowLeft() : Path
      {
         return this._1026204752arrowLeft;
      }
      
      public function set arrowLeft(param1:Path) : void
      {
         var _loc2_:Object = this._1026204752arrowLeft;
         if(_loc2_ !== param1)
         {
            this._1026204752arrowLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowRight() : Path
      {
         return this._1741915245arrowRight;
      }
      
      public function set arrowRight(param1:Path) : void
      {
         var _loc2_:Object = this._1741915245arrowRight;
         if(_loc2_ !== param1)
         {
            this._1741915245arrowRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowUp() : Path
      {
         return this._734027644arrowUp;
      }
      
      public function set arrowUp(param1:Path) : void
      {
         var _loc2_:Object = this._734027644arrowUp;
         if(_loc2_ !== param1)
         {
            this._734027644arrowUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowUp",_loc2_,param1));
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
      public function get richEditableText() : RichEditableText
      {
         return this._2084362067richEditableText;
      }
      
      public function set richEditableText(param1:RichEditableText) : void
      {
         var _loc2_:Object = this._2084362067richEditableText;
         if(_loc2_ !== param1)
         {
            this._2084362067richEditableText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"richEditableText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ArrowToolTipGroup
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ArrowToolTipGroup) : void
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
