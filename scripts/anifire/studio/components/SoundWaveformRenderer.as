package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.SoundWaveformData;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.core.SpriteVisualElement;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class SoundWaveformRenderer extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1481167054_SoundWaveformRenderer_Line1:Line;
      
      private var _1504135049_SoundWaveformRenderer_SetProperty1:SetProperty;
      
      public var _SoundWaveformRenderer_SolidColorStroke1:SolidColorStroke;
      
      private var _1766135109messageDisplay:Label;
      
      private var _1522034438waveGroup:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _animeSound:AnimeSound;
      
      private var _samples:Array;
      
      private var _drawnWidth:Number;
      
      private var _drawnHeight:Number;
      
      private var _1480355228_color:uint;
      
      private var _repeat:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundWaveformRenderer()
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
         bindings = this._SoundWaveformRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SoundWaveformRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundWaveformRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.clipAndEnableScrolling = true;
         this.mxmlContent = [this._SoundWaveformRenderer_SpriteVisualElement1_i(),this._SoundWaveformRenderer_Line1_i()];
         this.currentState = "loading";
         this.addEventListener("creationComplete",this.___SoundWaveformRenderer_Group1_creationComplete);
         var _SoundWaveformRenderer_Label1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SoundWaveformRenderer_Label1_i);
         states = [new State({
            "name":"loading",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SoundWaveformRenderer_Label1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SoundWaveformRenderer_Line1"]
            })]
         }),new State({
            "name":"error",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SoundWaveformRenderer_Label1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SoundWaveformRenderer_Line1"]
            }),this._SoundWaveformRenderer_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "isBaseValueDataBound":true,
               "target":"messageDisplay",
               "name":"text",
               "value":undefined
            }))]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"waveGroup",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_SoundWaveformRenderer_Line1",
               "name":"visible",
               "value":true
            })]
         })];
         BindingManager.executeBindings(this,"_SoundWaveformRenderer_SetProperty1",this._SoundWaveformRenderer_SetProperty1);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundWaveformRenderer._watcherSetupUtil = param1;
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
      
      public function init() : void
      {
      }
      
      public function reset(param1:Boolean = true) : void
      {
         if(param1)
         {
            this._samples = null;
         }
         this._drawnWidth = 0;
         this._drawnHeight = 0;
         this.waveGroup.graphics.clear();
      }
      
      public function draw(param1:AnimeSound, param2:Boolean, param3:int = 1, param4:int = -1) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!this._samples)
         {
            currentState = "loading";
            this._drawnWidth = 0;
            this._animeSound = param1;
            this._samples = param1.soundThumb.waveform.samples;
            this._color = this._animeSound.waveformColor;
            this._repeat = param2;
            if(param3 > 1 || param4 > 1)
            {
               _loc5_ = 1;
               _loc6_ = -1;
               if(param3 > 1)
               {
                  _loc5_ = param3 * AnimeConstants.PIXEL_PER_FRAME / SoundWaveformData.PIXEL_PER_SAMPLE - 1;
               }
               if(param4 > 1)
               {
                  _loc6_ = param4 * AnimeConstants.PIXEL_PER_FRAME / SoundWaveformData.PIXEL_PER_SAMPLE - 1;
               }
               this._samples = this._samples.slice((_loc5_ - 1) * 2,(_loc6_ - 1) * 2);
            }
         }
         invalidateDisplayList();
      }
      
      private function redraw() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Function = null;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:Number = getLayoutBoundsWidth();
         if(this._samples && _loc1_ > this._drawnWidth)
         {
            this._color = this._animeSound.waveformColor;
            this.waveGroup.cacheAsBitmap = false;
            this.waveGroup.graphics.lineStyle(1,this._color);
            _loc2_ = getLayoutBoundsHeight();
            _loc3_ = _loc2_ / 2;
            _loc4_ = this.samples.length / 2;
            _loc7_ = Math.abs;
            _loc10_ = this._drawnWidth;
            while(_loc10_ <= _loc1_)
            {
               this.waveGroup.graphics.moveTo(_loc10_ * SoundWaveformData.PIXEL_PER_SAMPLE,_loc3_);
               _loc6_ = _loc10_;
               if(_loc6_ >= _loc4_)
               {
                  if(!this._repeat)
                  {
                     break;
                  }
                  _loc6_ = _loc6_ % _loc4_;
               }
               _loc9_ = _loc6_ * 2;
               _loc8_ = this.samples[_loc9_];
               _loc5_ = _loc3_ - _loc7_(_loc8_) * _loc3_;
               this.waveGroup.graphics.lineTo(_loc10_ * SoundWaveformData.PIXEL_PER_SAMPLE,_loc5_);
               _loc8_ = this.samples[_loc9_ + 1];
               _loc5_ = _loc3_ + _loc7_(_loc8_) * _loc3_;
               this.waveGroup.graphics.lineTo(_loc10_ * SoundWaveformData.PIXEL_PER_SAMPLE,_loc5_);
               _loc10_++;
            }
            this.waveGroup.graphics.moveTo(this._drawnWidth,_loc3_);
            this.waveGroup.graphics.lineTo(_loc1_,_loc3_);
            this._drawnWidth = _loc1_;
            this._drawnHeight = _loc2_;
            this.waveGroup.cacheAsBitmap = true;
            currentState = "ready";
         }
      }
      
      public function get samples() : Array
      {
         return this._samples;
      }
      
      public function showWarning() : void
      {
         currentState = "error";
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this._drawnHeight != param2)
         {
            this._drawnWidth = 0;
            this.waveGroup.graphics.clear();
         }
         this.redraw();
      }
      
      public function set offset(param1:Number) : void
      {
         this.waveGroup.x = param1;
      }
      
      private function _SoundWaveformRenderer_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.visible = false;
         _loc1_.initialized(this,"waveGroup");
         this.waveGroup = _loc1_;
         BindingManager.executeBindings(this,"waveGroup",this.waveGroup);
         return _loc1_;
      }
      
      private function _SoundWaveformRenderer_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.visible = false;
         _loc1_.stroke = this._SoundWaveformRenderer_SolidColorStroke1_i();
         _loc1_.initialized(this,"_SoundWaveformRenderer_Line1");
         this._SoundWaveformRenderer_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundWaveformRenderer_Line1",this._SoundWaveformRenderer_Line1);
         return _loc1_;
      }
      
      private function _SoundWaveformRenderer_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         this._SoundWaveformRenderer_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_SoundWaveformRenderer_SolidColorStroke1",this._SoundWaveformRenderer_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _SoundWaveformRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("paddingLeft",6);
         _loc1_.setStyle("paddingRight",6);
         _loc1_.id = "messageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageDisplay = _loc1_;
         BindingManager.executeBindings(this,"messageDisplay",this.messageDisplay);
         return _loc1_;
      }
      
      public function ___SoundWaveformRenderer_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _SoundWaveformRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():uint
         {
            return _color;
         },null,"_SoundWaveformRenderer_SolidColorStroke1.color");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Generating waveform...");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"messageDisplay.text");
         result[2] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("go","Cannot generate waveform");
         },null,"_SoundWaveformRenderer_SetProperty1.value");
         result[3] = new Binding(this,function():uint
         {
            return _color;
         },function(param1:uint):void
         {
            messageDisplay.setStyle("color",param1);
         },"messageDisplay.color");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundWaveformRenderer_Line1() : Line
      {
         return this._1481167054_SoundWaveformRenderer_Line1;
      }
      
      public function set _SoundWaveformRenderer_Line1(param1:Line) : void
      {
         var _loc2_:Object = this._1481167054_SoundWaveformRenderer_Line1;
         if(_loc2_ !== param1)
         {
            this._1481167054_SoundWaveformRenderer_Line1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundWaveformRenderer_Line1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _SoundWaveformRenderer_SetProperty1() : SetProperty
      {
         return this._1504135049_SoundWaveformRenderer_SetProperty1;
      }
      
      public function set _SoundWaveformRenderer_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._1504135049_SoundWaveformRenderer_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._1504135049_SoundWaveformRenderer_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SoundWaveformRenderer_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageDisplay() : Label
      {
         return this._1766135109messageDisplay;
      }
      
      public function set messageDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1766135109messageDisplay;
         if(_loc2_ !== param1)
         {
            this._1766135109messageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get waveGroup() : SpriteVisualElement
      {
         return this._1522034438waveGroup;
      }
      
      public function set waveGroup(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1522034438waveGroup;
         if(_loc2_ !== param1)
         {
            this._1522034438waveGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"waveGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _color() : uint
      {
         return this._1480355228_color;
      }
      
      private function set _color(param1:uint) : void
      {
         var _loc2_:Object = this._1480355228_color;
         if(_loc2_ !== param1)
         {
            this._1480355228_color = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_color",_loc2_,param1));
            }
         }
      }
   }
}
