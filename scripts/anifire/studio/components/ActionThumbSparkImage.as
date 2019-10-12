package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.core.CCManager;
   import anifire.event.ByteLoaderEvent;
   import anifire.event.CoreEvent;
   import anifire.interfaces.ICharacter;
   import anifire.studio.core.Action;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.managers.CCThumbManager;
   import anifire.studio.managers.ImageDataManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.models.ActionThumbModel;
   import anifire.studio.models.CCActionThumbToken;
   import anifire.util.UtilPlain;
   import anifire.util.UtilXmlInfo;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
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
   
   public class ActionThumbSparkImage extends Group implements IBindingClient, IStateClient2
   {
      
      public static const THUMB_WIDTH:Number = 48;
      
      public static const THUMB_HEIGHT:Number = 76;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ActionThumbSparkImage_BusyIndicator1:BusyIndicator;
      
      private var _1282133823fadeIn:Fade;
      
      private var _1006495386imageContainer:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ActionThumbModel;
      
      protected var _loader:Loader;
      
      protected var _propLoader:Loader;
      
      protected var _charCCManager:CCManager;
      
      protected var _ccToken:CCActionThumbToken;
      
      protected var _captureTarget:DisplayObject;
      
      protected var _imageUpdated:Boolean;
      
      protected var _loading:Boolean;
      
      protected var _processing:Boolean;
      
      protected var _loadingProp:Boolean;
      
      protected var _processingProp:Boolean;
      
      protected var _action:Action;
      
      protected var _actionPropThumb:PropThumb;
      
      protected var _propReady:Boolean;
      
      public var showTransition:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ActionThumbSparkImage()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ActionThumbSparkImage_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ActionThumbSparkImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ActionThumbSparkImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ActionThumbSparkImage_BitmapImage1_i()];
         this.currentState = "normal";
         this._ActionThumbSparkImage_Fade1_i();
         var _ActionThumbSparkImage_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ActionThumbSparkImage_BusyIndicator1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ActionThumbSparkImage_BusyIndicator1_factory,
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
               "itemsFactory":_ActionThumbSparkImage_BusyIndicator1_factory,
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
         ActionThumbSparkImage._watcherSetupUtil = param1;
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
      
      public function set model(param1:ActionThumbModel) : void
      {
         var _loc2_:Object = null;
         if(this._model != param1)
         {
            if(this._model)
            {
               this.cancelLoading();
               this.cancelProcessing();
               this.cancelLoadingProp();
               this.cancelProcessingProp();
               this.removeImage();
            }
            this._model = param1;
            if(this._model)
            {
               _loc2_ = ImageDataManager.instance.getCharacterActionData(this._model.charThumb.themeId,this._model.charThumbId,this._model.actionId);
               if(_loc2_)
               {
                  this.imageContainer.source = _loc2_ as BitmapData;
                  this.displayImage();
               }
               else if(this._model.characterAction)
               {
                  this.processCharacterActionModel();
               }
               else
               {
                  this._action = this._model.action;
                  if(this._action.imageData)
                  {
                     this.processAction();
                  }
                  else
                  {
                     currentState = "loading";
                     this._loading = true;
                     this._action.addEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onActionDataLoaded);
                     this._action.loadImageData(ServerConstants.PARAM_CHAR_ACTION,false,"",true);
                  }
               }
            }
            else
            {
               this._action = null;
               currentState = "normal";
            }
         }
      }
      
      protected function processCharacterActionModel() : void
      {
         currentState = "processing";
         this._processing = true;
         this.requestActionToken();
      }
      
      protected function processAction() : void
      {
         currentState = "processing";
         this._processing = true;
         if(this._action.imageData is ByteArray)
         {
            this._loader = new Loader();
            this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
            this._loader.loadBytes(this._action.imageData as ByteArray);
         }
         else
         {
            this.requestActionToken();
         }
      }
      
      protected function requestActionToken() : void
      {
         this._ccToken = CCThumbManager.instance.queueRequest(this._model);
         this._ccToken.addEventListener(Event.COMPLETE,this.onCharacterMakerReady);
      }
      
      protected function cancelLoading() : void
      {
         if(this._loading)
         {
            this._action.removeEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onActionDataLoaded);
            this._loading = false;
         }
      }
      
      protected function cancelProcessing() : void
      {
         if(this._processing)
         {
            if(this._loader)
            {
               this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onImageLoaderInit);
            }
            if(this._ccToken)
            {
               this._ccToken.removeEventListener(Event.COMPLETE,this.onCharacterMakerReady);
            }
            this._processing = false;
         }
      }
      
      protected function cancelLoadingProp() : void
      {
         if(this._loadingProp)
         {
            this._actionPropThumb.removeEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onPropLoaded);
            this._loadingProp = false;
         }
      }
      
      protected function cancelProcessingProp() : void
      {
         if(this._processingProp)
         {
            if(this._propLoader)
            {
               this._propLoader.removeEventListener(Event.INIT,this.onPropImageReady);
            }
            if(this._charCCManager)
            {
               this._charCCManager.removeEventListener(ByteLoaderEvent.LOAD_BYTES_COMPLETE,this.onLoadThumbForCcComplete);
            }
            this._processingProp = false;
         }
      }
      
      protected function onActionDataLoaded(param1:CoreEvent) : void
      {
         this.cancelLoading();
         this.processAction();
      }
      
      protected function onImageLoaderInit(param1:Event) : void
      {
         this.cancelProcessing();
         UtilPlain.stopFamily(this._loader.content);
         this._captureTarget = this._loader;
         if(this._action.propXML.length > 0)
         {
            this.insertProp(this._action.propXML[0],this._action.thumb.themeId);
            return;
         }
         this._propReady = true;
         this.captureBitmapData();
      }
      
      protected function onCharacterMakerReady(param1:Event) : void
      {
         var _loc2_:XML = null;
         this.cancelProcessing();
         this._ccToken.state = CCActionThumbToken.TOKEN_PROCESSING;
         this._captureTarget = this._ccToken.actionThumb.captureTarget;
         if(this._model.characterAction && this._model.characterAction.propXML)
         {
            _loc2_ = this._model.characterAction.propXML[0];
            this.insertProp(_loc2_,_loc2_.@theme.length() > 0?_loc2_.@theme:this._model.characterAction.themeId);
            return;
         }
         this._propReady = true;
         this.captureBitmapData();
      }
      
      protected function insertProp(param1:XML, param2:String) : void
      {
         var _loc7_:PropThumb = null;
         var _loc8_:XML = null;
         var _loc9_:XML = null;
         var _loc3_:String = param2 + "." + param1.@id;
         var _loc4_:String = UtilXmlInfo.getThumbIdFromFileName(_loc3_);
         var _loc5_:String = _loc3_.split(".").length != 4?_loc4_:UtilXmlInfo.getCharIdFromFileName(_loc3_);
         var _loc6_:Theme = Theme(ThemeManager.instance.getTheme(param2));
         if(_loc6_)
         {
            this._actionPropThumb = _loc6_.getPropThumbById(_loc5_) as PropThumb;
            if(!this._actionPropThumb)
            {
               _loc7_ = new PropThumb();
               _loc8_ = _loc6_.getThemeXML();
               for each(_loc9_ in _loc8_.child(PropThumb.XML_NODE_NAME))
               {
                  if(_loc9_.@aid == param1.@aid)
                  {
                     _loc7_.deSerialize(_loc9_,_loc6_);
                     _loc7_.xml = _loc9_;
                  }
               }
               if(_loc4_ != _loc5_)
               {
                  _loc7_.thumbId = _loc4_;
               }
               _loc6_.addThumb(_loc7_);
               this._actionPropThumb = _loc6_.getPropThumbById(_loc5_) as PropThumb;
            }
         }
         if(this._actionPropThumb)
         {
            if(this._actionPropThumb.isThumbReady())
            {
               this.addPropByThumb(this._actionPropThumb);
            }
            else
            {
               this._loadingProp = true;
               this._actionPropThumb.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.onPropLoaded);
               this._actionPropThumb.loadImageData();
            }
         }
         else
         {
            this._propReady = true;
            this.captureBitmapData();
         }
      }
      
      protected function onPropLoaded(param1:CoreEvent) : void
      {
         this.cancelLoadingProp();
         this.addPropByThumb(this._actionPropThumb);
      }
      
      private function addPropByThumb(param1:PropThumb) : void
      {
         var _loc2_:Prop = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:ByteArray = null;
         if(param1.holdable == true)
         {
            this._processingProp = true;
            if(this._captureTarget is ICharacter && ICharacter(this._captureTarget).ver >= 2)
            {
               if(param1.handStyle != "")
               {
                  this._processingProp = true;
                  this._charCCManager = ICharacter(this._captureTarget).CCM;
                  this._charCCManager.addEventListener(ByteLoaderEvent.LOAD_BYTES_COMPLETE,this.onLoadThumbForCcComplete);
                  this._charCCManager.loadPropThumbAsStyle(param1.defaultState == null || param1.defaultState.imageData == null?param1.imageData:param1.defaultState.imageData,param1.handStyle);
               }
            }
            else
            {
               _loc2_ = new Prop();
               _loc2_.init(param1,null);
               if(param1.states.length > 0)
               {
                  _loc2_.state = param1.defaultState;
               }
               _loc3_ = UtilPlain.getInstance(this._captureTarget as DisplayObjectContainer,UtilPlain.THE_CHAR);
               if(_loc3_)
               {
                  _loc4_ = UtilPlain.getProp(_loc3_);
                  if(_loc4_)
                  {
                     _loc5_ = param1.imageData as ByteArray;
                     if(_loc5_)
                     {
                        this._processingProp = true;
                        this._propLoader = new Loader();
                        this._propLoader.contentLoaderInfo.addEventListener(Event.INIT,this.onPropImageReady);
                        this._propLoader.loadBytes(_loc5_);
                        _loc4_.addChild(this._propLoader);
                     }
                  }
               }
            }
         }
      }
      
      protected function onPropImageReady(param1:Event) : void
      {
         this.cancelProcessingProp();
         this._propReady = true;
         this.captureBitmapData();
      }
      
      protected function onLoadThumbForCcComplete(param1:ByteLoaderEvent) : void
      {
         var event:ByteLoaderEvent = param1;
         this.cancelProcessingProp();
         try
         {
            ICharacter(this._captureTarget).addLibrary(AnimeConstants.CLASS_GOPROP,"","");
            ICharacter(this._captureTarget).reloadSkin();
         }
         catch(e:Error)
         {
         }
         this._propReady = true;
         this.captureBitmapData();
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
         var _loc2_:Number = NaN;
         var _loc3_:Matrix = null;
         var _loc4_:BitmapData = null;
         var _loc1_:Rectangle = this._captureTarget.getBounds(this._captureTarget);
         if(_loc1_.width > 0 && _loc1_.width < 1000 && _loc1_.height > 0 && _loc1_.height < 1000)
         {
            _loc2_ = Math.min(THUMB_WIDTH / _loc1_.width,THUMB_HEIGHT / _loc1_.height,1);
            _loc3_ = new Matrix();
            _loc3_.translate(-_loc1_.x,-_loc1_.y);
            _loc3_.scale(_loc2_,_loc2_);
            _loc4_ = new BitmapData(_loc1_.width * _loc2_,_loc1_.height * _loc2_,true,0);
            _loc4_.draw(this._captureTarget,_loc3_);
            ImageDataManager.instance.setCharacterActionData(this._model.charThumb.themeId,this._model.charThumbId,this._model.actionId,_loc4_);
            if(this._ccToken)
            {
               this._ccToken.state = CCActionThumbToken.TOKEN_FINISHED;
               CCThumbManager.instance.releaseToken(this._ccToken);
               this._ccToken = null;
            }
            this._captureTarget = null;
            this.imageContainer.source = _loc4_;
            this.displayImage();
         }
      }
      
      protected function removeImage() : void
      {
         this._imageUpdated = false;
         this._propReady = false;
         this.imageContainer.source = null;
         if(this._loader)
         {
            this._loader.unload();
            this._loader = null;
         }
         if(this._ccToken)
         {
            CCThumbManager.instance.cancelRequest(this._ccToken);
            this._ccToken = null;
         }
         if(this._propLoader)
         {
            this._propLoader.unload();
            this._propLoader = null;
         }
         this._charCCManager = null;
      }
      
      private function _ActionThumbSparkImage_Fade1_i() : Fade
      {
         var _loc1_:Fade = new Fade();
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.duration = 500;
         this.fadeIn = _loc1_;
         BindingManager.executeBindings(this,"fadeIn",this.fadeIn);
         return _loc1_;
      }
      
      private function _ActionThumbSparkImage_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
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
      
      private function _ActionThumbSparkImage_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",0);
         _loc1_.id = "_ActionThumbSparkImage_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ActionThumbSparkImage_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_ActionThumbSparkImage_BusyIndicator1",this._ActionThumbSparkImage_BusyIndicator1);
         return _loc1_;
      }
      
      private function _ActionThumbSparkImage_bindingsSetup() : Array
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
