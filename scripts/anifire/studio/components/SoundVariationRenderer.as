package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.Thumb;
   import anifire.studio.core.sound.ISoundable;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.managers.SoundPlaybackManager;
   import anifire.studio.managers.StudioDragManager;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilDict;
   import anifire.util.UtilString;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SoundVariationRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
   {
      
      public static const EVENT_PLAY_BUT_CLICK:String = "play_but_click";
      
      public static const LABEL_GOTEAM_ONLY:String = "GoTeam only";
      
      public static const LABEL_GOPREMIUM_GOTEAM_ONLY:String = "GoPremium & GoTeam only";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundVariationRenderer_Group1:Group;
      
      private var _74926431_SoundVariationRenderer_HGroup1:HGroup;
      
      public var _SoundVariationRenderer_HGroup2:HGroup;
      
      public var _SoundVariationRenderer_Line2:Line;
      
      private var _1588210835_SoundVariationRenderer_SetProperty1:SetProperty;
      
      private var _25512041_SoundVariationRenderer_SetStyle1:SetStyle;
      
      private var _25512042_SoundVariationRenderer_SetStyle2:SetStyle;
      
      private var _682043432_SoundVariationRenderer_SolidColorStroke1:SolidColorStroke;
      
      public var _SoundVariationRenderer_UpgradeIcon1:UpgradeIcon;
      
      private var _1781625235buttonGroup:HGroup;
      
      private var _809612678contentGroup:VGroup;
      
      private var _775506802durationDisplay:Label;
      
      private var _1097557894playButton:IconButton;
      
      private var _1653553920variationBar:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _1934183932_dataSource:SoundThumb;
      
      protected var _2096654142_labelText:String;
      
      protected var _256018112_durationText:String;
      
      protected var _1864660719_playing:Boolean = false;
      
      protected var _1913409067_previewOnly:Boolean;
      
      protected var _sound:ISoundable;
      
      protected var _375930756_upsellNotice:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundVariationRenderer()
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
         bindings = this._SoundVariationRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SoundVariationRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundVariationRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = false;
         this.percentWidth = 100;
         this.mxmlContent = [this._SoundVariationRenderer_Group1_i()];
         this.currentState = "normal";
         var _SoundVariationRenderer_HGroup2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundVariationRenderer_HGroup2_i);
         var _SoundVariationRenderer_HGroup4_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundVariationRenderer_HGroup4_i);
         var _SoundVariationRenderer_Line2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundVariationRenderer_Line2_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SoundVariationRenderer_Line2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SoundVariationRenderer_Group1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundVariationRenderer_HGroup4_factory,
               "destination":"_SoundVariationRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundVariationRenderer_HGroup2_factory,
               "destination":"contentGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SoundVariationRenderer_Line2_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SoundVariationRenderer_Group1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundVariationRenderer_HGroup4_factory,
               "destination":"_SoundVariationRenderer_HGroup1",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["contentGroup"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SoundVariationRenderer_HGroup2_factory,
               "destination":"contentGroup",
               "propertyName":"mxmlContent",
               "position":"first"
            }),this._SoundVariationRenderer_SetStyle1 = SetStyle(new SetStyle().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"durationDisplay",
               "name":"color",
               "value":undefined
            })),this._SoundVariationRenderer_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"_SoundVariationRenderer_SolidColorStroke1",
               "name":"color",
               "value":undefined
            })),this._SoundVariationRenderer_SetStyle2 = SetStyle(new SetStyle().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"labelDisplay",
               "name":"color",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"buttonGroup",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"dragging",
            "overrides":[]
         })];
         BindingManager.executeBindings(this,"_SoundVariationRenderer_SetStyle1",this._SoundVariationRenderer_SetStyle1);
         BindingManager.executeBindings(this,"_SoundVariationRenderer_SetProperty1",this._SoundVariationRenderer_SetProperty1);
         BindingManager.executeBindings(this,"_SoundVariationRenderer_SetStyle2",this._SoundVariationRenderer_SetStyle2);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundVariationRenderer._watcherSetupUtil = param1;
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
         super.data = param1;
         if(this._dataSource)
         {
            if(!dragging)
            {
               this._dataSource.removeEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
            }
         }
         var _loc2_:ThumbModel = data as ThumbModel;
         if(_loc2_)
         {
            this._dataSource = _loc2_.thumb as SoundThumb;
            if(this._dataSource)
            {
               this._previewOnly = this._dataSource.previewOnly;
               this.sound#1 = this._dataSource.sound#1;
               this.updateLabel();
               if(!dragging)
               {
                  this._dataSource.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onSoundThumbLoaded);
               }
            }
         }
      }
      
      public function get sound#1() : ISoundable
      {
         return this._sound;
      }
      
      public function set sound#1(param1:ISoundable) : void
      {
         if(this._sound != param1)
         {
            if(this._sound)
            {
               this._sound.removeEventListener(SoundEvent.STOPPED,this.onSoundStopped);
               this._sound.removeEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
            }
            this._sound = param1;
            if(this._sound)
            {
               this._playing = this._sound.isPlaying;
               this._sound.addEventListener(SoundEvent.STOPPED,this.onSoundStopped);
               this._sound.addEventListener(SoundEvent.PLAYED,this.onSoundPlayed);
            }
            else
            {
               this._playing = false;
            }
         }
      }
      
      private function onSoundThumbLoaded(param1:Event) : void
      {
         this.sound#1 = this._dataSource.sound#1;
      }
      
      private function onSoundPlayed(param1:Event) : void
      {
         this._playing = true;
      }
      
      private function onSoundStopped(param1:Event) : void
      {
         this._playing = false;
         this.dispatchEvent(new CoreEvent(CoreEvent.PLAY_SOUND_COMPLETE,this));
      }
      
      protected function updateLabel() : void
      {
         this._labelText = this._dataSource.name;
         this._durationText = UtilString.secToTimeString(this._dataSource.duration * 0.001,false);
      }
      
      protected function playButtonHandler(param1:MouseEvent) : void
      {
         if(this._playing)
         {
            SoundPlaybackManager.stop();
         }
         else
         {
            SoundPlaybackManager.playSoundThumb(this._dataSource,0,null,1,-1,0,0,0,0,false);
         }
         param1.stopImmediatePropagation();
      }
      
      override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
      {
         var _loc3_:DragSource = new DragSource();
         _loc3_.addData(this._dataSource,Thumb.DRAG_DATA_FORMAT);
         _loc3_.addData(this._dataSource,SoundThumb.DRAG_DATA_FORMAT);
         _loc3_.addData(param1,StudioDragManager.DRAG_IMAGE);
         return _loc3_;
      }
      
      override protected function createDragProxy() : IFlexDisplayObject
      {
         var _loc1_:SoundThumbRenderer = new SoundThumbRenderer();
         _loc1_.dragging = true;
         _loc1_.data = data;
         return _loc1_;
      }
      
      override protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return !this._dataSource.previewOnly;
      }
      
      private function _SoundVariationRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._SoundVariationRenderer_Rect1_c(),this._SoundVariationRenderer_HGroup1_i()];
         _loc1_.id = "_SoundVariationRenderer_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundVariationRenderer_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationRenderer_Group1",this._SoundVariationRenderer_Group1);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._SoundVariationRenderer_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.paddingTop = 8;
         _loc1_.paddingBottom = 8;
         _loc1_.mxmlContent = [this._SoundVariationRenderer_VGroup1_i()];
         _loc1_.id = "_SoundVariationRenderer_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundVariationRenderer_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationRenderer_HGroup1",this._SoundVariationRenderer_HGroup1);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 4;
         _loc1_.paddingLeft = 7;
         _loc1_.mouseChildren = true;
         _loc1_.mouseEnabledWhereTransparent = true;
         _loc1_.mxmlContent = [];
         _loc1_.id = "contentGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentGroup = _loc1_;
         BindingManager.executeBindings(this,"contentGroup",this.contentGroup);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 8;
         _loc1_.mxmlContent = [this._SoundVariationRenderer_Label1_i(),this._SoundVariationRenderer_Group2_i(),this._SoundVariationRenderer_HGroup3_c()];
         _loc1_.id = "_SoundVariationRenderer_HGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundVariationRenderer_HGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationRenderer_HGroup2",this._SoundVariationRenderer_HGroup2);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.id = "durationDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.durationDisplay = _loc1_;
         BindingManager.executeBindings(this,"durationDisplay",this.durationDisplay);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SoundVariationRenderer_Line1_c()];
         _loc1_.id = "variationBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.variationBar = _loc1_;
         BindingManager.executeBindings(this,"variationBar",this.variationBar);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.height = 10;
         _loc1_.stroke = this._SoundVariationRenderer_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._SoundVariationRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationRenderer_SolidColorStroke1",this._SoundVariationRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 8;
         _loc1_.mxmlContent = [this._SoundVariationRenderer_Label2_i(),this._SoundVariationRenderer_UpgradeIcon1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("verticalAlign","bottom");
         _loc1_.setStyle("textAlign","left");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_UpgradeIcon1_i() : UpgradeIcon
      {
         var _loc1_:UpgradeIcon = new UpgradeIcon();
         _loc1_.isGoTeamOnly = true;
         _loc1_.id = "_SoundVariationRenderer_UpgradeIcon1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SoundVariationRenderer_UpgradeIcon1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationRenderer_UpgradeIcon1",this._SoundVariationRenderer_UpgradeIcon1);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_HGroup4_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentHeight = 100;
         _loc1_.paddingLeft = 4;
         _loc1_.paddingRight = 4;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._SoundVariationRenderer_IconButton1_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
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
      
      private function _SoundVariationRenderer_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._SoundVariationRenderer_SolidColorStroke2_c();
         _loc1_.initialized(this,"_SoundVariationRenderer_Line2");
         this._SoundVariationRenderer_Line2 = _loc1_;
         BindingManager.executeBindings(this,"_SoundVariationRenderer_Line2",this._SoundVariationRenderer_Line2);
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16250871;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _SoundVariationRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _durationText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"durationDisplay.text");
         result[1] = new Binding(this,function():uint
         {
            return !!_previewOnly?uint(13160918):uint(10068392);
         },function(param1:uint):void
         {
            durationDisplay.setStyle("color",param1);
         },"durationDisplay.color");
         result[2] = new Binding(this,function():Object
         {
            return !!_previewOnly?13160918:3586726;
         },null,"_SoundVariationRenderer_SetStyle1.value");
         result[3] = new Binding(this,function():uint
         {
            return !!_previewOnly?uint(13160918):uint(10068392);
         },null,"_SoundVariationRenderer_SolidColorStroke1.color");
         result[4] = new Binding(this,function():*
         {
            return !!_previewOnly?13160918:3586726;
         },null,"_SoundVariationRenderer_SetProperty1.value");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = _labelText;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"labelDisplay.text");
         result[6] = new Binding(this,function():uint
         {
            return !!_previewOnly?uint(13160918):uint(10068392);
         },function(param1:uint):void
         {
            labelDisplay.setStyle("color",param1);
         },"labelDisplay.color");
         result[7] = new Binding(this,function():Object
         {
            return !!_previewOnly?13160918:3586726;
         },null,"_SoundVariationRenderer_SetStyle2.value");
         result[8] = new Binding(this,function():Boolean
         {
            return _previewOnly;
         },null,"_SoundVariationRenderer_UpgradeIcon1.visible");
         result[9] = new Binding(this,function():Boolean
         {
            return _previewOnly;
         },null,"_SoundVariationRenderer_UpgradeIcon1.includeInLayout");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate(LABEL_GOTEAM_ONLY);
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SoundVariationRenderer_UpgradeIcon1.toolTipLabel");
         result[11] = new Binding(this,function():Boolean
         {
            return _playing;
         },null,"buttonGroup.visible");
         result[12] = new Binding(this,function():Object
         {
            return !!_playing?"stopSmall":"playSmall";
         },null,"playButton.styleName");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundVariationRenderer_HGroup1() : HGroup
      {
         return this._74926431_SoundVariationRenderer_HGroup1;
      }
      
      public function set _SoundVariationRenderer_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._74926431_SoundVariationRenderer_HGroup1;
         if(_loc2_ !== param1)
         {
            this._74926431_SoundVariationRenderer_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundVariationRenderer_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundVariationRenderer_SetProperty1() : SetProperty
      {
         return this._1588210835_SoundVariationRenderer_SetProperty1;
      }
      
      public function set _SoundVariationRenderer_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1588210835_SoundVariationRenderer_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1588210835_SoundVariationRenderer_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundVariationRenderer_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundVariationRenderer_SetStyle1() : SetStyle
      {
         return this._25512041_SoundVariationRenderer_SetStyle1;
      }
      
      public function set _SoundVariationRenderer_SetStyle1(param1:SetStyle) : void
      {
         var _loc2_:Object = this._25512041_SoundVariationRenderer_SetStyle1;
         if(_loc2_ !== param1)
         {
            this._25512041_SoundVariationRenderer_SetStyle1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundVariationRenderer_SetStyle1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundVariationRenderer_SetStyle2() : SetStyle
      {
         return this._25512042_SoundVariationRenderer_SetStyle2;
      }
      
      public function set _SoundVariationRenderer_SetStyle2(param1:SetStyle) : void
      {
         var _loc2_:Object = this._25512042_SoundVariationRenderer_SetStyle2;
         if(_loc2_ !== param1)
         {
            this._25512042_SoundVariationRenderer_SetStyle2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundVariationRenderer_SetStyle2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundVariationRenderer_SolidColorStroke1() : SolidColorStroke
      {
         return this._682043432_SoundVariationRenderer_SolidColorStroke1;
      }
      
      public function set _SoundVariationRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._682043432_SoundVariationRenderer_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._682043432_SoundVariationRenderer_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundVariationRenderer_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : HGroup
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1781625235buttonGroup;
         if(_loc2_ !== param1)
         {
            this._1781625235buttonGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentGroup() : VGroup
      {
         return this._809612678contentGroup;
      }
      
      public function set contentGroup(param1:VGroup) : void
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
      public function get durationDisplay() : Label
      {
         return this._775506802durationDisplay;
      }
      
      public function set durationDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._775506802durationDisplay;
         if(_loc2_ !== param1)
         {
            this._775506802durationDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"durationDisplay",_loc2_,param1));
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
      public function get variationBar() : Group
      {
         return this._1653553920variationBar;
      }
      
      public function set variationBar(param1:Group) : void
      {
         var _loc2_:Object = this._1653553920variationBar;
         if(_loc2_ !== param1)
         {
            this._1653553920variationBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"variationBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _dataSource() : SoundThumb
      {
         return this._1934183932_dataSource;
      }
      
      protected function set _dataSource(param1:SoundThumb) : void
      {
         var _loc2_:Object = this._1934183932_dataSource;
         if(_loc2_ !== param1)
         {
            this._1934183932_dataSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_dataSource",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _labelText() : String
      {
         return this._2096654142_labelText;
      }
      
      protected function set _labelText(param1:String) : void
      {
         var _loc2_:Object = this._2096654142_labelText;
         if(_loc2_ !== param1)
         {
            this._2096654142_labelText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_labelText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _durationText() : String
      {
         return this._256018112_durationText;
      }
      
      protected function set _durationText(param1:String) : void
      {
         var _loc2_:Object = this._256018112_durationText;
         if(_loc2_ !== param1)
         {
            this._256018112_durationText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_durationText",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      protected function get _previewOnly() : Boolean
      {
         return this._1913409067_previewOnly;
      }
      
      protected function set _previewOnly(param1:Boolean) : void
      {
         var _loc2_:Object = this._1913409067_previewOnly;
         if(_loc2_ !== param1)
         {
            this._1913409067_previewOnly = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_previewOnly",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _upsellNotice() : String
      {
         return this._375930756_upsellNotice;
      }
      
      protected function set _upsellNotice(param1:String) : void
      {
         var _loc2_:Object = this._375930756_upsellNotice;
         if(_loc2_ !== param1)
         {
            this._375930756_upsellNotice = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_upsellNotice",_loc2_,param1));
            }
         }
      }
   }
}
