package anifire.studio.skins
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.DataRenderer;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class RangeSelectorSliderSkinInnerClass0 extends DataRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1751797770arrowGroup:Group;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _726617523borderGroup:Group;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _1184053038labelDisplay:Label;
      
      private var _88844982outerDocument:RangeSelectorSliderSkin;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RangeSelectorSliderSkinInnerClass0()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._RangeSelectorSliderSkinInnerClass0_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_RangeSelectorSliderSkinInnerClass0WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RangeSelectorSliderSkinInnerClass0[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minHeight = 24;
         this.minWidth = 40;
         this.y = -30;
         this.mxmlContent = [this._RangeSelectorSliderSkinInnerClass0_Group1_i(),this._RangeSelectorSliderSkinInnerClass0_Group2_i(),this._RangeSelectorSliderSkinInnerClass0_Label1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RangeSelectorSliderSkinInnerClass0._watcherSetupUtil = param1;
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
      
      private function _RangeSelectorSliderSkinInnerClass0_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 8;
         _loc1_.mxmlContent = [this._RangeSelectorSliderSkinInnerClass0_RectangularDropShadow1_i(),this._RangeSelectorSliderSkinInnerClass0_Rect1_i()];
         _loc1_.id = "borderGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.borderGroup = _loc1_;
         BindingManager.executeBindings(this,"borderGroup",this.borderGroup);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0.45;
         _loc1_.distance = 7;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.blRadius = 3;
         _loc1_.brRadius = 3;
         _loc1_.tlRadius = 3;
         _loc1_.trRadius = 3;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.stroke = this._RangeSelectorSliderSkinInnerClass0_SolidColorStroke1_i();
         _loc1_.fill = this._RangeSelectorSliderSkinInnerClass0_SolidColor1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10526623;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._RangeSelectorSliderSkinInnerClass0_Path1_c(),this._RangeSelectorSliderSkinInnerClass0_Path2_c()];
         _loc1_.id = "arrowGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrowGroup = _loc1_;
         BindingManager.executeBindings(this,"arrowGroup",this.arrowGroup);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 0 0 l 6 8 l 6 -8 Z";
         _loc1_.fill = this._RangeSelectorSliderSkinInnerClass0_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_Path2_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 0 0 l 6 8 l 6 -8";
         _loc1_.stroke = this._RangeSelectorSliderSkinInnerClass0_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 10526623;
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 13;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontWeight","normal");
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _RangeSelectorSliderSkinInnerClass0_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"labelDisplay.text","data");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowGroup() : Group
      {
         return this._1751797770arrowGroup;
      }
      
      public function set arrowGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1751797770arrowGroup;
         if(_loc2_ !== param1)
         {
            this._1751797770arrowGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderGroup() : Group
      {
         return this._726617523borderGroup;
      }
      
      public function set borderGroup(param1:Group) : void
      {
         var _loc2_:Object = this._726617523borderGroup;
         if(_loc2_ !== param1)
         {
            this._726617523borderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderStroke() : SolidColorStroke
      {
         return this._1395787140borderStroke;
      }
      
      public function set borderStroke(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1395787140borderStroke;
         if(_loc2_ !== param1)
         {
            this._1395787140borderStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropShadow() : RectangularDropShadow
      {
         return this._906978543dropShadow;
      }
      
      public function set dropShadow(param1:RectangularDropShadow) : void
      {
         var _loc2_:Object = this._906978543dropShadow;
         if(_loc2_ !== param1)
         {
            this._906978543dropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
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
      public function get outerDocument() : RangeSelectorSliderSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:RangeSelectorSliderSkin) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}
