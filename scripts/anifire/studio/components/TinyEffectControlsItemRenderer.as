package anifire.studio.components
{
   import anifire.studio.commands.ChangeEffectAssetTimingCommand;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.core.EffectThumb;
   import anifire.studio.events.EffectTrayEvent;
   import anifire.studio.models.ThumbModel;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.filters.DropShadowFilter;
   import spark.primitives.Rect;
   
   public class TinyEffectControlsItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      private var _1650744005effectThumb:Group;
      
      private var _2024940825imageDisplay:EffectThumbSparkImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _command:ChangeEffectAssetTimingCommand;
      
      protected var _target:EffectAsset;
      
      protected var _effectName:String;
      
      public function TinyEffectControlsItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.autoDrawBackground = false;
         this.percentWidth = 100;
         this.buttonMode = true;
         this.mxmlContent = [this._TinyEffectControlsItemRenderer_Rect1_c(),this._TinyEffectControlsItemRenderer_HGroup1_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "stateGroups":["overAndSelectedStates"],
            "overrides":[]
         }),new State({
            "name":"selected",
            "stateGroups":["borderStates","overAndSelectedStates"],
            "overrides":[]
         }),new State({
            "name":"dragging",
            "stateGroups":["borderStates"],
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
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:ThumbModel = null;
         super.data = param1;
         this.target = param1 as EffectAsset;
         if(this._target)
         {
            this._effectName = (this._target.thumb as EffectThumb).name;
            _loc2_ = new ThumbModel(this._target.thumb as EffectThumb);
            this.imageDisplay.model = _loc2_;
         }
      }
      
      public function set target(param1:Object) : void
      {
         if(this._target != param1)
         {
            this._target = param1 as EffectAsset;
         }
      }
      
      private function onTinyEffectClick() : void
      {
         var _loc1_:EffectTrayEvent = new EffectTrayEvent(EffectTrayEvent.EFFECT_TRAY_ACTION,EffectTrayEvent.EDIT_EFFECT,this._target);
         dispatchEvent(_loc1_);
      }
      
      private function _TinyEffectControlsItemRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._TinyEffectControlsItemRenderer_SolidColor1_c();
         _loc1_.filters = [this._TinyEffectControlsItemRenderer_DropShadowFilter1_c()];
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TinyEffectControlsItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _TinyEffectControlsItemRenderer_DropShadowFilter1_c() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.alpha = 0.12;
         _loc1_.blurY = 2;
         _loc1_.distance = 2;
         _loc1_.angle = 90;
         return _loc1_;
      }
      
      private function _TinyEffectControlsItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 0;
         _loc1_.paddingRight = 0;
         _loc1_.paddingTop = 0;
         _loc1_.paddingBottom = 0;
         _loc1_.mxmlContent = [this._TinyEffectControlsItemRenderer_EffectThumbSparkImage1_i(),this._TinyEffectControlsItemRenderer_Group1_i()];
         _loc1_.addEventListener("click",this.___TinyEffectControlsItemRenderer_HGroup1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TinyEffectControlsItemRenderer_EffectThumbSparkImage1_i() : EffectThumbSparkImage
      {
         var _loc1_:EffectThumbSparkImage = new EffectThumbSparkImage();
         _loc1_.width = 30;
         _loc1_.height = 30;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _TinyEffectControlsItemRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "effectThumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectThumb = _loc1_;
         BindingManager.executeBindings(this,"effectThumb",this.effectThumb);
         return _loc1_;
      }
      
      public function ___TinyEffectControlsItemRenderer_HGroup1_click(param1:MouseEvent) : void
      {
         this.onTinyEffectClick();
      }
      
      [Bindable(event="propertyChange")]
      public function get effectThumb() : Group
      {
         return this._1650744005effectThumb;
      }
      
      public function set effectThumb(param1:Group) : void
      {
         var _loc2_:Object = this._1650744005effectThumb;
         if(_loc2_ !== param1)
         {
            this._1650744005effectThumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectThumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : EffectThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:EffectThumbSparkImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
   }
}
