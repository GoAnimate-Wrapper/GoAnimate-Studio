package anifire.studio.components
{
   import anifire.component.ProcessRegulator;
   import anifire.constant.AnimeConstants;
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.iterators.ArrayIterator;
   import anifire.studio.assets.image.AssetImageLibrary;
   import anifire.studio.assets.image.PropAssetImage;
   import anifire.studio.assets.views.AssetViewFactory;
   import anifire.studio.assets.views.FlowFrameEditor;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.Prop;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.events.SceneViewEvent;
   import anifire.studio.interfaces.IAssetView;
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
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SceneView extends AbstractSceneView implements ICollection, IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _2111656001assetLayer:Group;
      
      private var _204859874bgColor:SolidColor;
      
      private var _196953076bgLayer:Group;
      
      private var _269120744mainLayer:Group;
      
      private var _1914646001sceneBg:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _assetViewFactory:AssetViewFactory;
      
      private var _isLoadingAssets:Boolean;
      
      private var _regulator:ProcessRegulator;
      
      private var _lastAssetView:IAssetView;
      
      private var _library:AssetImageLibrary;
      
      private var _scaleFactor:Number = 1;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneView()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._assetViewFactory = new AssetViewFactory();
         this._regulator = new ProcessRegulator();
         this._library = new AssetImageLibrary();
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneView_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneView[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SceneView_Group1_i()];
         this.addEventListener("creationComplete",this.___SceneView_AbstractSceneView1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneView._watcherSetupUtil = param1;
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
      
      public function get library() : AssetImageLibrary
      {
         return this._library;
      }
      
      public function get mySceneBg() : Group
      {
         return this.sceneBg;
      }
      
      private function onCreationComplete() : void
      {
         this.mainLayer.addEventListener(AssetViewEvent.VIEW_CHANGE,this.onAssetViewChange);
      }
      
      public function get lastAssetView() : IAssetView
      {
         return this._lastAssetView;
      }
      
      private function onAssetViewChange(param1:AssetViewEvent) : void
      {
         param1.stopImmediatePropagation();
         if(this._isLoadingAssets)
         {
            return;
         }
         callLater(this.dispatchViewChange);
      }
      
      private function dispatchViewChange() : void
      {
         this.dispatchEvent(new SceneViewEvent(SceneViewEvent.VIEW_CHANGE,true));
      }
      
      override protected function addEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(SceneEvent.BASE_COLOR_CHANGE,this.onBaseColorChange);
            param1.addEventListener(SceneEvent.ASSET_ADDED,this.onAssetAdded);
            param1.addEventListener(SceneEvent.ASSET_REMOVED,this.onAssetRemoved);
            param1.addEventListener(SceneEvent.ASSET_ORDER_CHANGE,this.onAssetOrderChange);
         }
      }
      
      override protected function removeEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(SceneEvent.BASE_COLOR_CHANGE,this.onBaseColorChange);
            param1.removeEventListener(SceneEvent.ASSET_ADDED,this.onAssetAdded);
            param1.removeEventListener(SceneEvent.ASSET_REMOVED,this.onAssetRemoved);
            param1.removeEventListener(SceneEvent.ASSET_ORDER_CHANGE,this.onAssetOrderChange);
         }
      }
      
      override protected function unloadAllAssets() : void
      {
         var _loc1_:IAssetView = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.unloadAllAssets();
         this._isLoadingAssets = false;
         this._regulator.removeEventListener(Event.COMPLETE,this.onLoadAllAssetsComplete);
         _loc3_ = this.bgLayer.numElements;
         _loc2_ = _loc3_ - 1;
         while(_loc2_ >= 0)
         {
            _loc1_ = IAssetView(this.bgLayer.getElementAt(_loc2_));
            _loc1_.destroy("unloaded from SceneView");
            _loc2_--;
         }
         this.bgLayer.removeAllElements();
         _loc3_ = this.assetLayer.numElements;
         _loc2_ = _loc3_ - 1;
         while(_loc2_ >= 0)
         {
            _loc1_ = IAssetView(this.assetLayer.getElementAt(_loc2_));
            _loc1_.destroy("unloaded from SceneView");
            _loc2_--;
         }
         this.assetLayer.removeAllElements();
         Console.getConsole().mainStage.thumbnailRenderer.library.returnAllImages();
      }
      
      override protected function loadAllAssets() : void
      {
         var _loc1_:IAssetView = null;
         var _loc2_:IIterator = null;
         var _loc3_:Asset = null;
         var _loc4_:IIterator = null;
         var _loc5_:uint = 0;
         super.loadAllAssets();
         if(!this._isLoadingAssets && this.sceneModel)
         {
            this.sceneModel.updateAllCharacterDemoMouth();
            this._isLoadingAssets = true;
            this.visible = false;
            this._regulator.reset();
            this._regulator.addEventListener(Event.COMPLETE,this.onLoadAllAssetsComplete);
            _loc2_ = this.sceneModel.iterator("bg");
            while(_loc2_.hasNext)
            {
               _loc3_ = _loc2_.next as Asset;
               _loc1_ = this.addAsset(_loc3_);
               this._regulator.addProcess(_loc1_,AssetViewEvent.VIEW_LOAD_COMPLETE);
            }
            this.changeBaseColor(this.sceneModel.baseColor,false);
            _loc2_ = this.sceneModel.iterator("asset");
            _loc4_ = this.sceneModel.iterator("asset");
            _loc5_ = 0;
            while(_loc2_.hasNext)
            {
               _loc3_ = _loc2_.next as Asset;
               while(_loc4_.hasNext)
               {
                  _loc3_ = _loc4_.next as Asset;
                  if(_loc5_ == this.sceneModel.getAssetOrdering(_loc3_))
                  {
                     _loc1_ = this.addAsset(_loc3_);
                     this._regulator.addProcess(_loc1_,AssetViewEvent.VIEW_LOAD_COMPLETE);
                     break;
                  }
               }
               _loc4_.reset();
               _loc5_++;
            }
            this._regulator.startProcess();
         }
      }
      
      private function onLoadAllAssetsComplete(param1:Event) : void
      {
         callLater(this.dispatchViewLoadComplete);
      }
      
      private function dispatchViewLoadComplete() : void
      {
         this._isLoadingAssets = false;
         this.visible = true;
         this.dispatchEvent(new SceneViewEvent(SceneViewEvent.VIEW_LOAD_COMPLETE,true));
      }
      
      private function onAssetAdded(param1:SceneEvent) : void
      {
         var _loc2_:IAssetView = null;
         if(param1 && param1.asset)
         {
            _loc2_ = this.addAsset(param1.asset);
            if(_loc2_)
            {
               _loc2_.addEventListener(AssetViewEvent.VIEW_LOAD_COMPLETE,this.onAssetViewLoadComplete);
               _loc2_.loadImage();
            }
         }
      }
      
      private function onAssetViewLoadComplete(param1:AssetViewEvent) : void
      {
         var _loc3_:PropAssetImage = null;
         IEventDispatcher(param1.currentTarget).removeEventListener(param1.type,this.onAssetViewLoadComplete);
         this._lastAssetView = param1.currentTarget as IAssetView;
         var _loc2_:Prop = this._lastAssetView.asset as Prop;
         if(_loc2_ && _loc2_.fromTray)
         {
            _loc3_ = this._lastAssetView.assetImage as PropAssetImage;
            if(_loc3_)
            {
               _loc2_.fitToStage(_loc3_.originalWidth,_loc3_.originalHeight);
            }
         }
         this.dispatchEvent(new SceneViewEvent(SceneViewEvent.ASSET_VIEW_ADDED,true));
      }
      
      private function addAsset(param1:Asset) : IAssetView
      {
         var _loc2_:IAssetView = null;
         var _loc3_:FlowFrameEditor = null;
         var _loc4_:int = 0;
         if(param1 is Background || param1 is Prop || param1 is Character || param1 is BubbleAsset)
         {
            _loc2_ = this._assetViewFactory.createAssetView(param1,this._library);
            _loc3_ = _loc2_ as FlowFrameEditor;
            if(_loc3_)
            {
               _loc3_.drawingScale = this._scaleFactor;
            }
            if(_loc2_)
            {
               if(param1 is Background)
               {
                  this.bgLayer.removeAllElements();
                  this.bgLayer.addElement(_loc2_ as IVisualElement);
               }
               else
               {
                  _loc4_ = this.assetLayer.numElements;
                  if(this.sceneModel)
                  {
                     _loc4_ = this.sceneModel.getAssetOrdering(param1);
                  }
                  if(_loc4_ >= 0 && _loc4_ <= this.assetLayer.numElements)
                  {
                     this.assetLayer.addElementAt(_loc2_ as IVisualElement,_loc4_);
                  }
                  if(_loc2_ is UIComponent)
                  {
                     UIComponent(_loc2_).buttonMode = true;
                  }
               }
               return _loc2_;
            }
         }
         return null;
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
         if(param1 is Background || param1 is Prop || param1 is Character || param1 is BubbleAsset)
         {
            if(param1 is Background)
            {
               _loc4_ = this.bgLayer.numElements;
               _loc3_ = _loc4_ - 1;
               while(_loc3_ >= 0)
               {
                  _loc2_ = IAssetView(this.bgLayer.getElementAt(_loc3_));
                  if(_loc2_.asset == param1)
                  {
                     _loc2_.destroy("asset removed from SceneView");
                     this.bgLayer.removeElementAt(_loc3_);
                  }
                  _loc3_--;
               }
            }
            else
            {
               _loc4_ = this.assetLayer.numElements;
               _loc3_ = _loc4_ - 1;
               while(_loc3_ >= 0)
               {
                  _loc2_ = IAssetView(this.assetLayer.getElementAt(_loc3_));
                  if(_loc2_.asset == param1)
                  {
                     _loc2_.destroy("asset removed from SceneView");
                     this.assetLayer.removeElementAt(_loc3_);
                  }
                  _loc3_--;
               }
            }
            callLater(this.dispatchViewChange);
         }
      }
      
      private function reorderAsset(param1:Asset) : void
      {
         var _loc2_:int = 0;
         var _loc3_:IAssetView = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         if(param1 is Prop || param1 is Character || param1 is BubbleAsset)
         {
            if(this.sceneModel)
            {
               _loc2_ = this.sceneModel.getAssetOrdering(param1);
               if(_loc2_ >= 0 && _loc2_ <= this.assetLayer.numElements)
               {
                  _loc5_ = this.assetLayer.numElements;
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_)
                  {
                     _loc3_ = IAssetView(this.assetLayer.getElementAt(_loc4_));
                     if(_loc3_.asset == param1)
                     {
                        this.assetLayer.addElementAt(_loc3_ as IVisualElement,_loc2_);
                     }
                     _loc4_++;
                  }
                  callLater(this.dispatchViewChange);
               }
            }
         }
      }
      
      private function onAssetOrderChange(param1:SceneEvent) : void
      {
         if(param1 && param1.asset)
         {
            this.reorderAsset(param1.asset);
         }
      }
      
      public function pause() : void
      {
         var _loc1_:IAssetView = null;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         _loc3_ = this.bgLayer.numElements;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = IAssetView(this.bgLayer.getElementAt(_loc2_));
            _loc1_.pause();
            _loc2_++;
         }
         _loc3_ = this.assetLayer.numElements;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = IAssetView(this.assetLayer.getElementAt(_loc2_));
            _loc1_.pause();
            _loc2_++;
         }
      }
      
      public function resume() : void
      {
         var _loc1_:IAssetView = null;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         _loc3_ = this.bgLayer.numElements;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = IAssetView(this.bgLayer.getElementAt(_loc2_));
            _loc1_.resume();
            _loc2_++;
         }
         _loc3_ = this.assetLayer.numElements;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = IAssetView(this.assetLayer.getElementAt(_loc2_));
            _loc1_.resume();
            _loc2_++;
         }
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         var _loc2_:Array = new Array();
         if(param1 != "asset")
         {
            _loc4_ = this.bgLayer.numElements;
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc2_.push(this.bgLayer.getElementAt(_loc3_));
               _loc3_++;
            }
         }
         _loc4_ = this.assetLayer.numElements;
         _loc3_ = 0;
         while(_loc3_ < this.assetLayer.numElements)
         {
            _loc2_.push(this.assetLayer.getElementAt(_loc3_));
            _loc3_++;
         }
         return new ArrayIterator(_loc2_);
      }
      
      public function refreshSceneBg(param1:String) : void
      {
         this.sceneBg.y = param1 == AnimeConstants.SCREEN_MODE_WIDE?Number(AnimeConstants.WIDE_SCREEN_Y):Number(AnimeConstants.SCREEN_Y);
         this.sceneBg.height = param1 == AnimeConstants.SCREEN_MODE_WIDE?Number(AnimeConstants.WIDE_SCREEN_HEIGHT):Number(AnimeConstants.SCREEN_HEIGHT);
      }
      
      public function getBackgroundAssetView() : IAssetView
      {
         return this.bgLayer.numElements > 0?this.bgLayer.getElementAt(0) as IAssetView:null;
      }
      
      private function changeBaseColor(param1:int, param2:Boolean = true) : void
      {
         this.bgColor.color = param1;
         if(param2)
         {
            callLater(this.dispatchViewChange);
         }
      }
      
      private function onBaseColorChange(param1:SceneEvent) : void
      {
         this.changeBaseColor(_sceneModel.baseColor);
      }
      
      public function set scaleFactor(param1:Number) : void
      {
         var _loc2_:FlowFrameEditor = null;
         if(this._scaleFactor == param1 || param1 <= 0)
         {
            return;
         }
         this._scaleFactor = param1;
         var _loc3_:int = this.assetLayer.numElements;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.assetLayer.getElementAt(_loc4_) as FlowFrameEditor;
            if(_loc2_)
            {
               _loc2_.drawingScale = param1;
            }
            _loc4_++;
         }
      }
      
      private function _SceneView_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SceneView_Group2_i(),this._SceneView_Group3_i(),this._SceneView_Group4_i()];
         _loc1_.id = "mainLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainLayer = _loc1_;
         BindingManager.executeBindings(this,"mainLayer",this.mainLayer);
         return _loc1_;
      }
      
      private function _SceneView_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.name = "sceneBg";
         _loc1_.mxmlContent = [this._SceneView_Rect1_c()];
         _loc1_.id = "sceneBg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sceneBg = _loc1_;
         BindingManager.executeBindings(this,"sceneBg",this.sceneBg);
         return _loc1_;
      }
      
      private function _SceneView_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._SceneView_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneView_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgColor = _loc1_;
         BindingManager.executeBindings(this,"bgColor",this.bgColor);
         return _loc1_;
      }
      
      private function _SceneView_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "bgLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bgLayer = _loc1_;
         BindingManager.executeBindings(this,"bgLayer",this.bgLayer);
         return _loc1_;
      }
      
      private function _SceneView_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "assetLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.assetLayer = _loc1_;
         BindingManager.executeBindings(this,"assetLayer",this.assetLayer);
         return _loc1_;
      }
      
      public function ___SceneView_AbstractSceneView1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      private function _SceneView_bindingsSetup() : Array
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
         result[2] = new Binding(this,function():Number
         {
            return AnimeConstants.SCREEN_X;
         },null,"sceneBg.x");
         result[3] = new Binding(this,function():Number
         {
            return AnimeConstants.SCREEN_Y;
         },null,"sceneBg.y");
         result[4] = new Binding(this,function():Number
         {
            return AnimeConstants.SCREEN_WIDTH;
         },null,"sceneBg.width");
         result[5] = new Binding(this,function():Number
         {
            return AnimeConstants.SCREEN_HEIGHT;
         },null,"sceneBg.height");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get assetLayer() : Group
      {
         return this._2111656001assetLayer;
      }
      
      public function set assetLayer(param1:Group) : void
      {
         var _loc2_:Object = this._2111656001assetLayer;
         if(_loc2_ !== param1)
         {
            this._2111656001assetLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgColor() : SolidColor
      {
         return this._204859874bgColor;
      }
      
      public function set bgColor(param1:SolidColor) : void
      {
         var _loc2_:Object = this._204859874bgColor;
         if(_loc2_ !== param1)
         {
            this._204859874bgColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgLayer() : Group
      {
         return this._196953076bgLayer;
      }
      
      public function set bgLayer(param1:Group) : void
      {
         var _loc2_:Object = this._196953076bgLayer;
         if(_loc2_ !== param1)
         {
            this._196953076bgLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgLayer",_loc2_,param1));
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
      public function get sceneBg() : Group
      {
         return this._1914646001sceneBg;
      }
      
      public function set sceneBg(param1:Group) : void
      {
         var _loc2_:Object = this._1914646001sceneBg;
         if(_loc2_ !== param1)
         {
            this._1914646001sceneBg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sceneBg",_loc2_,param1));
            }
         }
      }
   }
}
