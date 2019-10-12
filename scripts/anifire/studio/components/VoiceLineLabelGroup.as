package anifire.studio.components
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   
   use namespace mx_internal;
   
   public class VoiceLineLabelGroup extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1184053038labelDisplay:Label;
      
      private var _106851532popUp:Group;
      
      private var _92033697popUpAnchor:spark.components.PopUpAnchor;
      
      private var _1498293937toolTipLabelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _2064687053_shouldDisplayToolTip:Boolean;
      
      protected var _text:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function VoiceLineLabelGroup()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._VoiceLineLabelGroup_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_VoiceLineLabelGroupWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return VoiceLineLabelGroup[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._VoiceLineLabelGroup_RectangularDropShadow1_c(),this._VoiceLineLabelGroup_Rect1_c(),this._VoiceLineLabelGroup_Label1_i(),this._VoiceLineLabelGroup_PopUpAnchor1_i()];
         this.currentState = "normal";
         this.addEventListener("rollOver",this.___VoiceLineLabelGroup_Group1_rollOver);
         this.addEventListener("rollOut",this.___VoiceLineLabelGroup_Group1_rollOut);
         this.addEventListener("creationComplete",this.___VoiceLineLabelGroup_Group1_creationComplete);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"popUpAnchor",
               "name":"displayPopUp",
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
         VoiceLineLabelGroup._watcherSetupUtil = param1;
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
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._text;
      }
      
      private function set _3556653text(param1:String) : void
      {
         if(this._text != param1)
         {
            this._text = param1;
         }
      }
      
      protected function rollOverHandler(param1:MouseEvent) : void
      {
         currentState = "hovered";
      }
      
      protected function rollOutHandler(param1:MouseEvent) : void
      {
         currentState = "normal";
      }
      
      protected function init() : void
      {
         this._shouldDisplayToolTip = this.labelDisplay.isTruncated;
         this.labelDisplay.addEventListener("isTruncatedChanged",this.labelDisplay_isTruncatedChangedHandler);
      }
      
      protected function labelDisplay_isTruncatedChangedHandler(param1:Event) : void
      {
         this._shouldDisplayToolTip = this.labelDisplay.isTruncated;
      }
      
      private function _VoiceLineLabelGroup_RectangularDropShadow1_c() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.color = 15658734;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._VoiceLineLabelGroup_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15923196;
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("paddingLeft",14);
         _loc1_.setStyle("paddingRight",14);
         _loc1_.setStyle("paddingTop",14);
         _loc1_.setStyle("paddingBottom",14);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_PopUpAnchor1_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 3;
         _loc1_.height = 0;
         _loc1_.popUpPosition = "above";
         _loc1_.popUpWidthMatchesAnchorWidth = true;
         _loc1_.popUpHeightMatchesAnchorHeight = true;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.popUp = this._VoiceLineLabelGroup_Group2_i();
         _loc1_.id = "popUpAnchor";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUpAnchor = _loc1_;
         BindingManager.executeBindings(this,"popUpAnchor",this.popUpAnchor);
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.blendMode = "layer";
         _loc1_.alpha = 0.9;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._VoiceLineLabelGroup_VGroup1_c()];
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._VoiceLineLabelGroup_Group3_c(),this._VoiceLineLabelGroup_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._VoiceLineLabelGroup_Rect2_c(),this._VoiceLineLabelGroup_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._VoiceLineLabelGroup_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("paddingTop",5);
         _loc1_.setStyle("paddingBottom",5);
         _loc1_.id = "toolTipLabelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toolTipLabelDisplay = _loc1_;
         BindingManager.executeBindings(this,"toolTipLabelDisplay",this.toolTipLabelDisplay);
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._VoiceLineLabelGroup_Path1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 14;
         _loc1_.data = "M 0 0 l 6 6 l 6 -6 l -6 0";
         _loc1_.fill = this._VoiceLineLabelGroup_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceLineLabelGroup_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      public function ___VoiceLineLabelGroup_Group1_rollOver(param1:MouseEvent) : void
      {
         this.rollOverHandler(param1);
      }
      
      public function ___VoiceLineLabelGroup_Group1_rollOut(param1:MouseEvent) : void
      {
         this.rollOutHandler(param1);
      }
      
      public function ___VoiceLineLabelGroup_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _VoiceLineLabelGroup_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"labelDisplay.text","text");
         result[1] = new Binding(this,function():Boolean
         {
            return _shouldDisplayToolTip;
         },null,"popUp.visible");
         result[2] = new Binding(this,null,null,"toolTipLabelDisplay.text","text");
         return result;
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
      public function get popUp() : Group
      {
         return this._106851532popUp;
      }
      
      public function set popUp(param1:Group) : void
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
      
      [Bindable(event="propertyChange")]
      public function get popUpAnchor() : spark.components.PopUpAnchor
      {
         return this._92033697popUpAnchor;
      }
      
      public function set popUpAnchor(param1:spark.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._92033697popUpAnchor;
         if(_loc2_ !== param1)
         {
            this._92033697popUpAnchor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpAnchor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolTipLabelDisplay() : Label
      {
         return this._1498293937toolTipLabelDisplay;
      }
      
      public function set toolTipLabelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1498293937toolTipLabelDisplay;
         if(_loc2_ !== param1)
         {
            this._1498293937toolTipLabelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipLabelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _shouldDisplayToolTip() : Boolean
      {
         return this._2064687053_shouldDisplayToolTip;
      }
      
      protected function set _shouldDisplayToolTip(param1:Boolean) : void
      {
         var _loc2_:Object = this._2064687053_shouldDisplayToolTip;
         if(_loc2_ !== param1)
         {
            this._2064687053_shouldDisplayToolTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_shouldDisplayToolTip",_loc2_,param1));
            }
         }
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this.text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
   }
}
