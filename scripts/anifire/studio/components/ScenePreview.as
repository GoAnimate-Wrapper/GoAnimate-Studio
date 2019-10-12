package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.LicenseConstants;
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.iterators.ArrayIterator;
   import anifire.studio.assets.image.EffectAssetImage;
   import anifire.studio.assets.views.AssetViewFactory;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.core.EffectThumb;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.events.SceneViewEvent;
   import anifire.studio.interfaces.IAssetView;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IVisualElement;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   
   use namespace mx_internal;
   
   public class ScenePreview extends AbstractSceneView implements ICollection, IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _2041073964cameraLayer:Group;
      
      private var _1643150912effectLayer:Group;
      
      private var _269120744mainLayer:Group;
      
      private var _3619493view:SceneView;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _assetViewFactory:AssetViewFactory;
      
      private var _isLoadingAssets:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ScenePreview()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._assetViewFactory = new AssetViewFactory();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ScenePreview_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ScenePreviewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ScenePreview[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ScenePreview_Group1_i()];
         this.addEventListener("creationComplete",this.___ScenePreview_AbstractSceneView1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ScenePreview._watcherSetupUtil = param1;
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
      
      override public function set sceneModel(param1:AnimeScene) : void
      {
         super.sceneModel = param1;
         this.view.sceneModel = param1;
         if(param1)
         {
            param1.addEventListener(SceneEvent.ASSET_ORDER_CHANGE,this.onAssetOrderChange);
         }
      }
      
      private function onCreationComplete() : void
      {
         this.cameraLayer.addEventListener(AssetViewEvent.VIEW_CHANGE,this.onCameraChange);
      }
      
      private function onCameraChange(param1:Event) : void
      {
         param1.stopImmediatePropagation();
         if(this._isLoadingAssets)
         {
            return;
         }
         this.dispatchEvent(new SceneViewEvent(SceneViewEvent.VIEW_CHANGE,true));
      }
      
      override protected function addEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(SceneEvent.ASSET_ADDED,this.onAssetAdded);
            param1.addEventListener(SceneEvent.ASSET_REMOVED,this.onAssetRemoved);
         }
      }
      
      override protected function removeEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(SceneEvent.ASSET_ADDED,this.onAssetAdded);
            param1.removeEventListener(SceneEvent.ASSET_REMOVED,this.onAssetRemoved);
         }
      }
      
      override protected function unloadAllAssets() : void
      {
         var _loc1_:IAssetView = null;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         super.unloadAllAssets();
         this._isLoadingAssets = false;
         _loc3_ = this.effectLayer.numElements;
         _loc2_ = _loc3_ - 1;
         while(_loc2_ >= 0)
         {
            _loc1_ = IAssetView(this.effectLayer.getElementAt(_loc2_));
            _loc1_.destroy("unloaded from ScenePreview");
            _loc2_--;
         }
         this.effectLayer.removeAllElements();
         _loc3_ = this.cameraLayer.numElements;
         _loc2_ = _loc3_ - 1;
         while(_loc2_ >= 0)
         {
            _loc1_ = IAssetView(this.cameraLayer.getElementAt(_loc2_));
            _loc1_.destroy("unloaded from ScenePreview");
            _loc2_--;
         }
         this.cameraLayer.removeAllElements();
      }
      
      override protected function loadAllAssets() : void
      {
         var _loc1_:IIterator = null;
         var _loc2_:Asset = null;
         super.loadAllAssets();
         if(!this._isLoadingAssets && this.sceneModel)
         {
            this._isLoadingAssets = true;
            _loc1_ = this.sceneModel.iterator("effect");
            while(_loc1_.hasNext)
            {
               _loc2_ = _loc1_.next as Asset;
               this.addAsset(_loc2_);
            }
            this._isLoadingAssets = false;
         }
      }
      
      private function onAssetAdded(param1:SceneEvent) : void
      {
         if(param1 && param1.asset)
         {
            this.addAsset(param1.asset);
         }
      }
      
      private function onAssetOrderChange(param1:SceneEvent) : void
      {
         var _loc2_:Asset = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:IAssetView = null;
         var _loc6_:int = 0;
         if(param1 && param1.asset)
         {
            _loc2_ = param1.asset;
            if(_loc2_ is EffectAsset)
            {
               _loc3_ = sceneModel.getAssetOrdering(_loc2_);
               _loc6_ = this.effectLayer.numElements;
               _loc4_ = 0;
               while(_loc4_ < _loc6_)
               {
                  _loc5_ = IAssetView(this.effectLayer.getElementAt(_loc4_));
                  if(_loc5_.asset == _loc2_)
                  {
                     this.effectLayer.setElementIndex(_loc5_ as IVisualElement,_loc3_);
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      private function addAsset(param1:Asset, param2:int = -1) : void
      {
         var _loc3_:IAssetView = null;
         if(param1 is EffectAsset)
         {
            _loc3_ = this._assetViewFactory.createAssetView(param1);
            if(_loc3_)
            {
               if(EffectAsset(param1).getExactType() == EffectThumb.TYPE_ZOOM)
               {
                  this.cameraLayer.addElement(_loc3_ as IVisualElement);
                  if(_loc3_ is UIComponent)
                  {
                     UIComponent(_loc3_).buttonMode = true;
                  }
                  if(!ProgramEffectAsset(param1).shadow && this.isZoomMaximized(param1 as EffectAsset))
                  {
                     this.hideCameraLayerByOpacity();
                  }
                  else
                  {
                     this.showCameraLayerByOpacity();
                  }
               }
               else if(param2 == -1)
               {
                  this.effectLayer.addElement(_loc3_ as IVisualElement);
               }
               else
               {
                  this.effectLayer.addElementAt(_loc3_ as IVisualElement,param2);
               }
               _loc3_.loadImage();
               if(_loc3_.assetImage is EffectAssetImage)
               {
                  EffectAssetImage(_loc3_.assetImage).showEffect(this.mainLayer);
               }
            }
         }
      }
      
      private function isZoomMaximized(param1:EffectAsset) : Boolean
      {
         return param1.width == LicenseConstants.getStageRect().width && param1.height == LicenseConstants.getStageRect().height;
      }
      
      public function hideCameraLayerByOpacity() : void
      {
         this.cameraLayer.alpha = 0;
         this.cameraLayer.mouseEnabled = this.cameraLayer.mouseChildren = false;
      }
      
      public function showCameraLayerByOpacity() : void
      {
         this.cameraLayer.alpha = 1;
         this.cameraLayer.mouseEnabled = this.cameraLayer.mouseChildren = true;
      }
      
      private function onAssetRemoved(param1:SceneEvent) : void
      {
         if(param1 && param1.asset)
         {
            this.removeAsset(param1.asset);
         }
      }
      
      private function removeAsset(param1:Asset) : void
      {
         var _loc2_:IAssetView = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1 is EffectAsset)
         {
            _loc4_ = this.effectLayer.numElements;
            _loc3_ = _loc4_ - 1;
            while(_loc3_ >= 0)
            {
               _loc2_ = IAssetView(this.effectLayer.getElementAt(_loc3_));
               if(_loc2_.asset == param1)
               {
                  _loc2_.destroy("asset removed from ScenePreview");
                  this.effectLayer.removeElementAt(_loc3_);
               }
               _loc3_--;
            }
            _loc4_ = this.cameraLayer.numElements;
            _loc3_ = _loc4_ - 1;
            while(_loc3_ >= 0)
            {
               _loc2_ = IAssetView(this.cameraLayer.getElementAt(_loc3_));
               if(_loc2_.asset == param1)
               {
                  _loc2_.destroy("asset removed from ScenePreview");
                  this.cameraLayer.removeElementAt(_loc3_);
                  this.dispatchEvent(new SceneViewEvent(SceneViewEvent.VIEW_CHANGE,true));
               }
               _loc3_--;
            }
         }
      }
      
      public function pause() : void
      {
         var _loc1_:IAssetView = null;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         this.view.pause();
         _loc3_ = this.effectLayer.numElements;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = IAssetView(this.effectLayer.getElementAt(_loc2_));
            _loc1_.pause();
            _loc2_++;
         }
         _loc3_ = this.cameraLayer.numElements;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = IAssetView(this.cameraLayer.getElementAt(_loc2_));
            _loc1_.pause();
            _loc2_++;
         }
      }
      
      public function resume() : void
      {
         var _loc1_:IAssetView = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.view.resume();
         _loc3_ = this.effectLayer.numElements;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = IAssetView(this.effectLayer.getElementAt(_loc2_));
            _loc1_.resume();
            _loc2_++;
         }
         _loc3_ = this.cameraLayer.numElements;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = IAssetView(this.cameraLayer.getElementAt(_loc2_));
            _loc1_.resume();
            _loc2_++;
         }
      }
      
      public function hideAllEffect() : void
      {
         this.cameraLayer.visible = this.effectLayer.visible = false;
      }
      
      public function showAllEffect() : void
      {
         this.cameraLayer.visible = this.effectLayer.visible = true;
      }
      
      public function hideEffect(param1:Asset) : void
      {
         var _loc2_:IAssetView = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc4_ = this.effectLayer.numElements;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = IAssetView(this.effectLayer.getElementAt(_loc3_));
            if(_loc2_.asset == param1)
            {
               DisplayObject(_loc2_).visible = false;
               return;
            }
            _loc3_++;
         }
         _loc4_ = this.cameraLayer.numElements;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = IAssetView(this.cameraLayer.getElementAt(_loc3_));
            if(_loc2_.asset == param1)
            {
               DisplayObject(_loc2_).visible = false;
               return;
            }
            _loc3_++;
         }
      }
      
      public function showEffect(param1:Asset) : void
      {
         var _loc2_:IAssetView = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         _loc4_ = this.effectLayer.numElements;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = IAssetView(this.effectLayer.getElementAt(_loc3_));
            if(_loc2_.asset == param1)
            {
               DisplayObject(_loc2_).visible = true;
               if(_loc2_.assetImage is EffectAssetImage)
               {
                  EffectAssetImage(_loc2_.assetImage).showEffect(this.mainLayer);
               }
               return;
            }
            _loc3_++;
         }
         _loc4_ = this.cameraLayer.numElements;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = IAssetView(this.cameraLayer.getElementAt(_loc3_));
            if(_loc2_.asset == param1)
            {
               DisplayObject(_loc2_).visible = true;
               return;
            }
            _loc3_++;
         }
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:IIterator = this.view.iterator(param1);
         while(_loc3_.hasNext)
         {
            _loc2_.push(_loc3_.next);
         }
         if(param1 != "asset")
         {
            _loc4_ = this.effectLayer.numElements;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc2_.push(this.effectLayer.getElementAt(_loc5_));
               _loc5_++;
            }
         }
         _loc4_ = this.cameraLayer.numElements;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_.push(this.cameraLayer.getElementAt(_loc5_));
            _loc5_++;
         }
         return new ArrayIterator(_loc2_);
      }
      
      public function getCameraView() : IAssetView
      {
         if(this.cameraLayer.numElements > 0)
         {
            return this.cameraLayer.getElementAt(0) as IAssetView;
         }
         return null;
      }
      
      public function getSceneView() : SceneView
      {
         return this.view;
      }
      
      public function set scaleFactor(param1:Number) : void
      {
         if(this.view)
         {
            this.view.scaleFactor = param1;
         }
      }
      
      private function _ScenePreview_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ScenePreview_SceneView1_i(),this._ScenePreview_Group2_i(),this._ScenePreview_Group3_i()];
         _loc1_.id = "mainLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainLayer = _loc1_;
         BindingManager.executeBindings(this,"mainLayer",this.mainLayer);
         return _loc1_;
      }
      
      private function _ScenePreview_SceneView1_i() : SceneView
      {
         var _loc1_:SceneView = new SceneView();
         _loc1_.id = "view";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.view = _loc1_;
         BindingManager.executeBindings(this,"view",this.view);
         return _loc1_;
      }
      
      private function _ScenePreview_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "effectLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectLayer = _loc1_;
         BindingManager.executeBindings(this,"effectLayer",this.effectLayer);
         return _loc1_;
      }
      
      private function _ScenePreview_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "cameraLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cameraLayer = _loc1_;
         BindingManager.executeBindings(this,"cameraLayer",this.cameraLayer);
         return _loc1_;
      }
      
      public function ___ScenePreview_AbstractSceneView1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      private function _ScenePreview_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_WIDTH;
         },null,"this.width");
         result[1] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_HEIGHT;
         },null,"this.height");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get cameraLayer() : Group
      {
         return this._2041073964cameraLayer;
      }
      
      public function set cameraLayer(param1:Group) : void
      {
         var _loc2_:Object = this._2041073964cameraLayer;
         if(_loc2_ !== param1)
         {
            this._2041073964cameraLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cameraLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get effectLayer() : Group
      {
         return this._1643150912effectLayer;
      }
      
      public function set effectLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1643150912effectLayer;
         if(_loc2_ !== param1)
         {
            this._1643150912effectLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainLayer() : Group
      {
         return this._269120744mainLayer;
      }
      
      public function set mainLayer(param1:Group) : void
      {
         var _loc2_:Object = this._269120744mainLayer;
         if(_loc2_ !== param1)
         {
            this._269120744mainLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get view() : SceneView
      {
         return this._3619493view;
      }
      
      public function set view(param1:SceneView) : void
      {
         var _loc2_:Object = this._3619493view;
         if(_loc2_ !== param1)
         {
            this._3619493view = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"view",_loc2_,param1));
            }
         }
      }
   }
}
