package anifire.studio.components
{
   import anifire.studio.commands.ChangeEffectAssetTimingCommand;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.util.UtilDict;
   import anifire.util.UtilUnitConvert;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class EffectPanel extends spark.components.NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _2060497896subtitle:Label;
      
      private var _2001826798timingRangeSelector:RangeSelector;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:EffectAsset;
      
      private var _command:ChangeEffectAssetTimingCommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function EffectPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._EffectPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_EffectPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return EffectPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.creationPolicy = "all";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._EffectPanel_Array1_c);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         EffectPanel._watcherSetupUtil = param1;
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
      
      public function set target(param1:Object) : void
      {
         if(this._target != param1)
         {
            createDeferredContent();
            if(this._target)
            {
               this._target.removeEventListener(AssetEvent.ASSET_TIMING_CHANGE,this.onAssetTimingChange);
               if(this._target.scene)
               {
                  this._target.scene.removeEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
               }
            }
            this._target = param1 as EffectAsset;
            if(this._target)
            {
               this._target.addEventListener(AssetEvent.ASSET_TIMING_CHANGE,this.onAssetTimingChange);
               if(this._target.scene)
               {
                  this._target.scene.addEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
                  this.updateTimingRange();
               }
            }
         }
      }
      
      private function onAssetTimingChange(param1:AssetEvent) : void
      {
         this.updateTimingRangeValue();
      }
      
      private function onSceneDurationChange(param1:SceneEvent) : void
      {
         this.updateTimingRange();
      }
      
      private function updateTimingRange() : void
      {
         var _loc1_:Number = UtilUnitConvert.frameToDuration(this._target.scene.totalFrames);
         this.timingRangeSelector.minimum = 0;
         this.timingRangeSelector.maximum = _loc1_;
         this.updateTimingRangeValue();
      }
      
      private function updateTimingRangeValue() : void
      {
         if(this._target.spanWholeScene)
         {
            this.timingRangeSelector.startValue = this.timingRangeSelector.minimum;
            this.timingRangeSelector.endValue = this.timingRangeSelector.maximum;
         }
         else
         {
            this.timingRangeSelector.startValue = UtilUnitConvert.frameToTime(this._target.startFrame);
            this.timingRangeSelector.endValue = UtilUnitConvert.frameToTime(this._target.endFrame,false);
         }
      }
      
      protected function onTimingRangeSelectorChange(param1:Event) : void
      {
         this.updateEffectValue();
      }
      
      private function updateEffectValue() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.timingRangeSelector.startValue == this.timingRangeSelector.minimum && this.timingRangeSelector.endValue == this.timingRangeSelector.maximum)
         {
            this._target.spanWholeScene = true;
         }
         else
         {
            _loc1_ = UtilUnitConvert.timeToFrame(this.timingRangeSelector.startValue);
            _loc2_ = UtilUnitConvert.durationToFrame(this.timingRangeSelector.endValue - this.timingRangeSelector.startValue);
            this._target.startFrame = _loc1_;
            this._target.duration = _loc2_;
            this._target.spanWholeScene = false;
         }
      }
      
      protected function onRangeSelectorThumbRelease(param1:Event) : void
      {
         if(this._command)
         {
            if(this.timingRangeSelector.startValue == this.timingRangeSelector.minimum && this.timingRangeSelector.endValue == this.timingRangeSelector.maximum)
            {
               this._command.executeNow(true,this._target.startFrame,this._target.duration);
            }
            else
            {
               this._command.executeNow(false,UtilUnitConvert.timeToFrame(this.timingRangeSelector.startValue),UtilUnitConvert.durationToFrame(this.timingRangeSelector.endValue - this.timingRangeSelector.startValue));
            }
         }
      }
      
      protected function onRangeSelectorThumbPress(param1:Event) : void
      {
         this._command = new ChangeEffectAssetTimingCommand(this._target);
      }
      
      private function _EffectPanel_Array1_c() : Array
      {
         var _loc1_:Array = [this._EffectPanel_VGroup1_c()];
         return _loc1_;
      }
      
      private function _EffectPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 7;
         _loc1_.paddingTop = 4;
         _loc1_.paddingLeft = 14;
         _loc1_.paddingRight = 14;
         _loc1_.paddingBottom = 14;
         _loc1_.mxmlContent = [this._EffectPanel_Label1_i(),this._EffectPanel_RangeSelector1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _EffectPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.id = "subtitle";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.subtitle = _loc1_;
         BindingManager.executeBindings(this,"subtitle",this.subtitle);
         return _loc1_;
      }
      
      private function _EffectPanel_RangeSelector1_i() : RangeSelector
      {
         var _loc1_:RangeSelector = new RangeSelector();
         _loc1_.percentWidth = 100;
         _loc1_.snapInterval = 0.125;
         _loc1_.addEventListener("startThumbPress",this.__timingRangeSelector_startThumbPress);
         _loc1_.addEventListener("startThumbRelease",this.__timingRangeSelector_startThumbRelease);
         _loc1_.addEventListener("endThumbPress",this.__timingRangeSelector_endThumbPress);
         _loc1_.addEventListener("endThumbRelease",this.__timingRangeSelector_endThumbRelease);
         _loc1_.addEventListener("change",this.__timingRangeSelector_change);
         _loc1_.id = "timingRangeSelector";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timingRangeSelector = _loc1_;
         BindingManager.executeBindings(this,"timingRangeSelector",this.timingRangeSelector);
         return _loc1_;
      }
      
      public function __timingRangeSelector_startThumbPress(param1:Event) : void
      {
         this.onRangeSelectorThumbPress(param1);
      }
      
      public function __timingRangeSelector_startThumbRelease(param1:Event) : void
      {
         this.onRangeSelectorThumbRelease(param1);
      }
      
      public function __timingRangeSelector_endThumbPress(param1:Event) : void
      {
         this.onRangeSelectorThumbPress(param1);
      }
      
      public function __timingRangeSelector_endThumbRelease(param1:Event) : void
      {
         this.onRangeSelectorThumbRelease(param1);
      }
      
      public function __timingRangeSelector_change(param1:Event) : void
      {
         this.onTimingRangeSelectorChange(param1);
      }
      
      private function _EffectPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Modify timing of your effect");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"subtitle.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get subtitle() : Label
      {
         return this._2060497896subtitle;
      }
      
      public function set subtitle(param1:Label) : void
      {
         var _loc2_:Object = this._2060497896subtitle;
         if(_loc2_ !== param1)
         {
            this._2060497896subtitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"subtitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timingRangeSelector() : RangeSelector
      {
         return this._2001826798timingRangeSelector;
      }
      
      public function set timingRangeSelector(param1:RangeSelector) : void
      {
         var _loc2_:Object = this._2001826798timingRangeSelector;
         if(_loc2_ !== param1)
         {
            this._2001826798timingRangeSelector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingRangeSelector",_loc2_,param1));
            }
         }
      }
   }
}
