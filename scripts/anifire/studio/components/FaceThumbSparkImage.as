package anifire.studio.components
{
   import anifire.component.CustomHeadMaker;
   import anifire.component.SkinnedHeadMaker;
   import anifire.constant.RaceConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.managers.CCBodyManager;
   import anifire.managers.CCThemeManager;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.PropThumb;
   import anifire.studio.managers.CCThumbManager;
   import anifire.studio.managers.ImageDataManager;
   import anifire.studio.models.FacePreviewModel;
   import anifire.util.UtilCommonLoader;
   import anifire.util.UtilHashBytes;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.effects.Fade;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class FaceThumbSparkImage extends Group implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FaceThumbSparkImage_BusyIndicator1:BusyIndicator;
      
      private var _1282133823fadeIn:Fade;
      
      private var _1006495386imageContainer:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:FacePreviewModel;
      
      protected var _propThumb:PropThumb;
      
      protected var _captureTarget:DisplayObject;
      
      protected var _imageUpdated:Boolean;
      
      protected var _loading:Boolean;
      
      protected var _processing:Boolean;
      
      protected var _ccHeadMaker:CustomHeadMaker;
      
      protected var _skinnedHeadMaker:SkinnedHeadMaker;
      
      protected var _loader:Loader;
      
      protected var _thumbManager:CCThumbManager;
      
      public var showTransition:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FaceThumbSparkImage()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FaceThumbSparkImage_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FaceThumbSparkImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FaceThumbSparkImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._FaceThumbSparkImage_BitmapImage1_i()];
         this.currentState = "normal";
         this._FaceThumbSparkImage_Fade1_i();
         var _FaceThumbSparkImage_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FaceThumbSparkImage_BusyIndicator1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FaceThumbSparkImage_BusyIndicator1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageContainer"]
            }),new SetProperty().initializeFromObject({
               "name":"enabled",
               "value":false
            })]
         }),new State({
            "name":"processing",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_FaceThumbSparkImage_BusyIndicator1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageContainer"]
            }),new SetProperty().initializeFromObject({
               "name":"enabled",
               "value":false
            })]
         }),new State({
            "name":"ready",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"imageContainer",
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
         FaceThumbSparkImage._watcherSetupUtil = param1;
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
      
      public function get model() : FacePreviewModel
      {
         return this._model;
      }
      
      public function set model(param1:FacePreviewModel) : void
      {
         if(this._model != param1)
         {
            if(this._model)
            {
               this._model.removeEventListener(Event.CHANGE,this.onFaceModelChange);
               this.cancelLoading();
               this.cancelProcessing();
               this.removeImage();
            }
            this._model = param1;
            if(this._model)
            {
               this._model.addEventListener(Event.CHANGE,this.onFaceModelChange);
            }
            this.updateModel();
         }
      }
      
      protected function updateModel() : void
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:CCCharacterActionModel = null;
         if(this._model && this._model.state)
         {
            this._propThumb = this._model.propThumb;
            _loc1_ = ImageDataManager.instance.getImageData("faceThumb",this._propThumb.themeId,this._model.cacheId);
            if(_loc1_)
            {
               this.imageContainer.source = _loc1_ as BitmapData;
               this.displayImage();
            }
            else if(this._model.state.imageData)
            {
               this.processStateImageData();
            }
            else if(this._model.stateId && this._propThumb.isCC)
            {
               currentState = "loading";
               this._loading = true;
               this._ccHeadMaker = new CustomHeadMaker();
               this._ccHeadMaker.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onCCHeadMakerReady);
               _loc2_ = this._model.state.id;
               _loc3_ = CCThemeManager.instance.getThemeModel(CharThumb(this._model.character.thumb).ccThemeId).getCharacterFacialModel(CCBodyManager.instance.getBodyModel(this._model.character.thumb.id),_loc2_);
               this._ccHeadMaker.init(_loc3_);
            }
            else
            {
               currentState = "loading";
               this._loading = true;
               this._model.state.addEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onPropStateLoaded);
               this._model.state.loadImageData(ServerConstants.PARAM_CHAR_FACIAL,false,this._propThumb.path,true);
            }
         }
         else
         {
            currentState = "normal";
         }
      }
      
      protected function onFaceModelChange(param1:Event) : void
      {
         this.updateModel();
      }
      
      protected function cancelLoading() : void
      {
         if(this._loading)
         {
            this._loading = false;
            this._model.state.removeEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onPropStateLoaded);
         }
      }
      
      protected function onPropStateLoaded(param1:CoreEvent) : void
      {
         this.cancelLoading();
         this.processStateImageData();
      }
      
      protected function processStateImageData() : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:ByteArray = null;
         var _loc4_:UtilHashBytes = null;
         var _loc1_:Object = this._model.state.imageData;
         if(!_loc1_)
         {
            return;
         }
         switch(this._propThumb.raceCode)
         {
            case RaceConstants.CUSTOM_CHARACTER:
               this._ccHeadMaker = new CustomHeadMaker();
               this._ccHeadMaker.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onCCHeadMakerReady);
               this._ccHeadMaker.init(_loc1_["xml"] as XML);
               break;
            case RaceConstants.SKINNED_SWF:
               this._skinnedHeadMaker = new SkinnedHeadMaker();
               this._skinnedHeadMaker.themeId = this._propThumb.themeId;
               this._skinnedHeadMaker.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onSkinnedHeadMakerReady);
               if(_loc1_ is ByteArray)
               {
                  _loc2_ = _loc1_ as ByteArray;
                  this._skinnedHeadMaker.init(this._propThumb.xml,_loc2_,null,false,false,"",this._model.stateId);
               }
               else
               {
                  _loc3_ = _loc1_["figure"] as ByteArray;
                  _loc4_ = _loc1_["imageData"] as UtilHashBytes;
                  this._skinnedHeadMaker.init(this._propThumb.xml,_loc3_,_loc4_,false,false,"",this._model.stateId);
               }
               break;
            case RaceConstants.STATIC_SWF:
               this._loader = new Loader();
               this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onLoaderInit);
               if(_loc1_ is ByteArray)
               {
                  _loc2_ = _loc1_ as ByteArray;
                  this._loader.loadBytes(_loc2_,UtilCommonLoader.externalLoaderContext);
               }
               else
               {
                  _loc3_ = _loc1_["figure"] as ByteArray;
                  this._loader.loadBytes(_loc3_);
               }
         }
      }
      
      protected function onCCHeadMakerReady(param1:LoadEmbedMovieEvent) : void
      {
         this.cancelProcessing();
         this._captureTarget = this._ccHeadMaker;
         invalidateDisplayList();
      }
      
      protected function onSkinnedHeadMakerReady(param1:LoadEmbedMovieEvent) : void
      {
         this.cancelProcessing();
         this._captureTarget = this._skinnedHeadMaker;
         invalidateDisplayList();
      }
      
      protected function onLoaderInit(param1:Event) : void
      {
         this.cancelProcessing();
         this._captureTarget = this._loader;
         invalidateDisplayList();
      }
      
      protected function cancelProcessing() : void
      {
         if(this._processing)
         {
            this._processing = false;
            if(this._ccHeadMaker)
            {
               this._ccHeadMaker.removeEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onCCHeadMakerReady);
            }
            if(this._skinnedHeadMaker)
            {
               this._skinnedHeadMaker.removeEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onSkinnedHeadMakerReady);
            }
            if(this._loader)
            {
               this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onLoaderInit);
            }
         }
      }
      
      protected function displayImage() : void
      {
         currentState = "ready";
         if(this.showTransition)
         {
            this.fadeIn.play();
         }
      }
      
      protected function captureBitmapData() : void
      {
         var _loc2_:BitmapData = null;
         var _loc1_:Rectangle = this._captureTarget.getBounds(this._captureTarget);
         if(_loc1_.width > 0 && _loc1_.width < 1000 && _loc1_.height > 0 && _loc1_.height < 1000)
         {
            _loc2_ = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc2_.draw(this._captureTarget,new Matrix(1,0,0,1,-_loc1_.x,-_loc1_.y));
            ImageDataManager.instance.setImageData("faceThumb",this._propThumb.themeId,this._model.cacheId,_loc2_);
            this._captureTarget = null;
            this.imageContainer.source = _loc2_;
            this.displayImage();
         }
      }
      
      protected function removeImage() : void
      {
         this._imageUpdated = false;
         this.imageContainer.source = null;
         if(this._loader)
         {
            this._loader.unload();
            this._loader = null;
         }
         this._propThumb = null;
         this._ccHeadMaker = null;
         this._skinnedHeadMaker = null;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this._captureTarget)
         {
            this.captureBitmapData();
         }
      }
      
      private function _FaceThumbSparkImage_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         this.fadeIn = _loc1_;
         BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
         return _loc1_;
      }
      
      private function _FaceThumbSparkImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.scaleMode = "letterbox";
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.visible = false;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.initialized(this,"imageContainer");
         this.imageContainer = _loc1_;
         BindingManager.executeBindings(this,"imageContainer",this.imageContainer);
         return _loc1_;
      }
      
      private function _FaceThumbSparkImage_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",0);
         _loc1_.id = "_FaceThumbSparkImage_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FaceThumbSparkImage_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_FaceThumbSparkImage_BusyIndicator1",this._FaceThumbSparkImage_BusyIndicator1);
         return _loc1_;
      }
      
      private function _FaceThumbSparkImage_bindingsSetup() : Array
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
      
      [Bindable(event="propertyChange")]
      public function get imageContainer() : BitmapImage
      {
         return this._1006495386imageContainer;
      }
      
      public function set imageContainer(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1006495386imageContainer;
         if(_loc2_ !== param1)
         {
            this._1006495386imageContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageContainer",_loc2_,param1));
            }
         }
      }
   }
}
