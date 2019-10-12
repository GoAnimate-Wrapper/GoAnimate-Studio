package anifire.studio.components
{
   import anifire.event.CoreEvent;
   import anifire.studio.core.Thumb;
   import anifire.studio.models.ThumbModel;
   import anifire.util.UtilColor;
   import anifire.util.UtilHashSelectedColor;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.State;
   import spark.components.Group;
   import spark.effects.Fade;
   
   use namespace mx_internal;
   
   public class ThumbImageBase extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1282133823fadeIn:Fade;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _loading:Boolean = false;
      
      protected var _processing:Boolean = false;
      
      public var showTransition:Boolean = true;
      
      protected var _model:ThumbModel;
      
      protected var _product:Thumb;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ThumbImageBase()
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
         bindings = this._ThumbImageBase_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ThumbImageBaseWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ThumbImageBase[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.currentState = "normal";
         this._ThumbImageBase_Fade1_i();
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "stateGroups":["busyStates"],
            "overrides":[]
         }),new State({
            "name":"processing",
            "stateGroups":["busyStates"],
            "overrides":[]
         }),new State({
            "name":"ready",
            "overrides":[]
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
         ThumbImageBase._watcherSetupUtil = param1;
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
      public function get model() : ThumbModel
      {
         return this._model;
      }
      
      private function set _104069929model(param1:ThumbModel) : void
      {
         if(this._model != param1)
         {
            if(this._model)
            {
               this.cancelLoading();
               this.cancelProcessing();
               this.removeImage();
            }
            this._model = param1;
            if(this._model && !this._model.isPlaceHolder)
            {
               this._product = this.model.thumb;
               currentState = "loading";
               this.loadProductImage();
            }
            else
            {
               currentState = "normal";
            }
         }
      }
      
      protected function loadProductImage() : void
      {
         this._loading = true;
         this._product.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onLoadingComplete);
         this._product.loadImageData();
      }
      
      protected function onLoadingComplete(param1:Event = null) : void
      {
         this.cancelLoading();
         currentState = "processing";
         this.processProductImage();
      }
      
      protected function cancelLoading() : void
      {
         if(this._loading)
         {
            this._product.removeEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onLoadingComplete);
            this._loading = false;
         }
      }
      
      protected function processProductImage() : void
      {
      }
      
      protected function cancelProcessing() : void
      {
      }
      
      protected function displayImage() : void
      {
         currentState = "ready";
         if(this.showTransition)
         {
            this.fadeIn.play();
         }
      }
      
      protected function removeImage() : void
      {
      }
      
      protected function updateThumbColor(param1:DisplayObject) : void
      {
         var _loc2_:UtilHashSelectedColor = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._model.colorSetId)
         {
            _loc2_ = this._product.getColorSetById(this._model.colorSetId);
            _loc3_ = _loc2_.length;
            if(_loc3_ > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  UtilColor.setAssetPartColor(param1,_loc2_.getKey(_loc4_),_loc2_.getValueByIndex(_loc4_).dstColor);
                  _loc4_++;
               }
            }
         }
      }
      
      private function _ThumbImageBase_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         this.fadeIn = _loc1_;
         BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
         return _loc1_;
      }
      
      private function _ThumbImageBase_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return this;
         },null,"fadeIn.target");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get fadeIn() : Fade
      {
         return this._1282133823fadeIn;
      }
      
      public function set fadeIn(param1:Fade) : void
      {
         var _loc2_:Object = this._1282133823fadeIn;
         if(_loc2_ !== param1)
         {
            this._1282133823fadeIn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fadeIn",_loc2_,param1));
            }
         }
      }
      
      public function set model(param1:ThumbModel) : void
      {
         var _loc2_:Object = this.model;
         if(_loc2_ !== param1)
         {
            this._104069929model = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"model",_loc2_,param1));
            }
         }
      }
   }
}
