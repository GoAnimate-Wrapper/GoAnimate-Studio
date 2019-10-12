package anifire.studio.components
{
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.core.AnimeSound;
   import anifire.util.Util;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class DialogItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      private var _1126977803_DialogItemRenderer_Rect1:Rect;
      
      private var _1021776392lbSoundDur:Label;
      
      private var _1605973857lbSoundTitle:Label;
      
      private var _1097557894playButton:IconButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _transition:AssetTransition;
      
      private var _204380986_durationIconVisible:Boolean = true;
      
      protected var _1864660719_playing:Boolean = false;
      
      public function DialogItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.name = "dialogItem";
         this.percentWidth = 100;
         this.autoDrawBackground = false;
         this.mxmlContent = [this._DialogItemRenderer_Rect1_i(),this._DialogItemRenderer_VGroup1_c()];
         this.currentState = "normal";
         this.addEventListener("dataChange",this.___DialogItemRenderer_ItemRenderer1_dataChange);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DialogItemRenderer_Rect1",
               "name":"stroke",
               "value":this._DialogItemRenderer_SolidColorStroke1_c()
            })]
         }),new State({
            "name":"selected",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DialogItemRenderer_Rect1",
               "name":"fill",
               "value":this._DialogItemRenderer_SolidColor2_c()
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
      
      protected function onDataChange(param1:Event) : void
      {
         this.dispatchEvent(new Event("data_change"));
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:AnimeSound = null;
         super.data = param1;
         if(this.data)
         {
            _loc2_ = param1 as AnimeSound;
            this.lbSoundTitle.text = _loc2_.soundThumb.name;
            this.lbSoundDur.text = Util.cielNum(_loc2_.soundThumb.duration / 1000,2) + "s";
         }
      }
      
      private function refreshUI() : void
      {
      }
      
      protected function onAddLinkClick(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("addLinkage"));
      }
      
      protected function playButtonHandler(param1:MouseEvent) : void
      {
         AnimeSound(this.data).previewSound();
         param1.stopImmediatePropagation();
      }
      
      private function _DialogItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 0;
         _loc1_.fill = this._DialogItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_DialogItemRenderer_Rect1");
         this._DialogItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_DialogItemRenderer_Rect1",this._DialogItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _DialogItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _DialogItemRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 10;
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 10;
         _loc1_.paddingBottom = 10;
         _loc1_.gap = 14;
         _loc1_.mxmlContent = [this._DialogItemRenderer_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DialogItemRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingLeft = 15;
         _loc1_.paddingRight = 15;
         _loc1_.mxmlContent = [this._DialogItemRenderer_VGroup2_c(),this._DialogItemRenderer_IconButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DialogItemRenderer_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.mxmlContent = [this._DialogItemRenderer_Label1_i(),this._DialogItemRenderer_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DialogItemRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5200489);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "lbSoundTitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lbSoundTitle = _loc1_;
         BindingManager.executeBindings(this,"lbSoundTitle",this.lbSoundTitle);
         return _loc1_;
      }
      
      private function _DialogItemRenderer_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._DialogItemRenderer_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DialogItemRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "15s";
         _loc1_.setStyle("color",9937845);
         _loc1_.setStyle("fontSize",11);
         _loc1_.id = "lbSoundDur";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lbSoundDur = _loc1_;
         BindingManager.executeBindings(this,"lbSoundDur",this.lbSoundDur);
         return _loc1_;
      }
      
      private function _DialogItemRenderer_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "playSmall";
         _loc1_.addEventListener("mouseDown",this.__playButton_mouseDown);
         _loc1_.id = "playButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playButton = _loc1_;
         BindingManager.executeBindings(this,"playButton",this.playButton);
         return _loc1_;
      }
      
      public function __playButton_mouseDown(param1:MouseEvent) : void
      {
         this.playButtonHandler(param1);
      }
      
      public function ___DialogItemRenderer_ItemRenderer1_dataChange(param1:FlexEvent) : void
      {
         this.onDataChange(param1);
      }
      
      private function _DialogItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 5093288;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _DialogItemRenderer_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16772026;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DialogItemRenderer_Rect1() : Rect
      {
         return this._1126977803_DialogItemRenderer_Rect1;
      }
      
      public function set _DialogItemRenderer_Rect1(param1:Rect) : void
      {
         var _loc2_:Object = this._1126977803_DialogItemRenderer_Rect1;
         if(_loc2_ !== param1)
         {
            this._1126977803_DialogItemRenderer_Rect1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DialogItemRenderer_Rect1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSoundDur() : Label
      {
         return this._1021776392lbSoundDur;
      }
      
      public function set lbSoundDur(param1:Label) : void
      {
         var _loc2_:Object = this._1021776392lbSoundDur;
         if(_loc2_ !== param1)
         {
            this._1021776392lbSoundDur = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSoundDur",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lbSoundTitle() : Label
      {
         return this._1605973857lbSoundTitle;
      }
      
      public function set lbSoundTitle(param1:Label) : void
      {
         var _loc2_:Object = this._1605973857lbSoundTitle;
         if(_loc2_ !== param1)
         {
            this._1605973857lbSoundTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lbSoundTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playButton() : IconButton
      {
         return this._1097557894playButton;
      }
      
      public function set playButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1097557894playButton;
         if(_loc2_ !== param1)
         {
            this._1097557894playButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _durationIconVisible() : Boolean
      {
         return this._204380986_durationIconVisible;
      }
      
      private function set _durationIconVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._204380986_durationIconVisible;
         if(_loc2_ !== param1)
         {
            this._204380986_durationIconVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_durationIconVisible",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _playing() : Boolean
      {
         return this._1864660719_playing;
      }
      
      protected function set _playing(param1:Boolean) : void
      {
         var _loc2_:Object = this._1864660719_playing;
         if(_loc2_ !== param1)
         {
            this._1864660719_playing = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_playing",_loc2_,param1));
            }
         }
      }
   }
}
