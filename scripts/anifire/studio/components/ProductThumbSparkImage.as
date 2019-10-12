package anifire.studio.components
{
   import anifire.util.UtilCommonLoader;
   import anifire.util.UtilPlain;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
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
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.core.SpriteVisualElement;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class ProductThumbSparkImage extends ThumbImageBase implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ProductThumbSparkImage_BusyIndicator1:BusyIndicator;
      
      private var _1006495386imageContainer:SpriteVisualElement;
      
      private var _275021552maskRect:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _imageUpdated:Boolean = false;
      
      protected var _loader:Loader;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ProductThumbSparkImage()
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
         bindings = this._ProductThumbSparkImage_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ProductThumbSparkImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProductThumbSparkImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._ProductThumbSparkImage_SpriteVisualElement1_i(),this._ProductThumbSparkImage_Rect1_i()];
         this.currentState = "normal";
         var _ProductThumbSparkImage_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ProductThumbSparkImage_BusyIndicator1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductThumbSparkImage_BusyIndicator1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["maskRect"]
            })]
         }),new State({
            "name":"processing",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_ProductThumbSparkImage_BusyIndicator1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["maskRect"]
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
         ProductThumbSparkImage._watcherSetupUtil = param1;
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
      
      override protected function loadProductImage() : void
      {
         if(_product.imageData)
         {
            onLoadingComplete();
         }
         else
         {
            super.loadProductImage();
         }
      }
      
      override protected function cancelProcessing() : void
      {
         if(_processing)
         {
            this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onImageLoaderInit);
            _processing = false;
         }
      }
      
      override protected function processProductImage() : void
      {
         var _loc1_:ByteArray = null;
         if(_product.imageData is ByteArray)
         {
            _loc1_ = _product.imageData as ByteArray;
            if(_loc1_)
            {
               _processing = true;
               this._loader = new Loader();
               this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onImageLoaderInit);
               this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadBytesError);
               this._loader.loadBytes(_loc1_,UtilCommonLoader.externalLoaderContext);
            }
            else
            {
               currentState = "normal";
            }
         }
      }
      
      private function onLoadBytesError(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadBytesError);
      }
      
      protected function onImageLoaderInit(param1:Event = null) : void
      {
         this.cancelProcessing();
         var _loc2_:Bitmap = this._loader.content as Bitmap;
         if(_loc2_)
         {
            _loc2_.smoothing = true;
         }
         UtilPlain.stopFamily(this._loader.content);
         updateThumbColor(this._loader.content);
         this.imageContainer.addChild(this._loader);
         invalidateDisplayList();
         displayImage();
      }
      
      protected function updateImage() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Rectangle = null;
         if(!this._imageUpdated && this._loader && this._loader.content)
         {
            this._imageUpdated = true;
            _loc1_ = getLayoutBoundsWidth();
            _loc2_ = getLayoutBoundsHeight();
            _loc3_ = contentWidth / this._loader.content.width;
            _loc4_ = contentHeight / this._loader.content.height;
            _loc5_ = Math.min(_loc3_,_loc4_,1);
            this._loader.content.scaleX = _loc5_;
            this._loader.content.scaleY = _loc5_;
            _loc6_ = this._loader.getBounds(this._loader);
            this._loader.x = -_loc6_.x + (contentWidth - _loc6_.width) * 0.5;
            this._loader.y = -_loc6_.y + (contentHeight - _loc6_.height) * 0.5;
         }
      }
      
      override protected function removeImage() : void
      {
         this._imageUpdated = false;
         UtilPlain.removeAllSon(this.imageContainer);
         if(this._loader)
         {
            this._loader.unload();
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.updateImage();
      }
      
      private function _ProductThumbSparkImage_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
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
      
      private function _ProductThumbSparkImage_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.alwaysCreateDisplayObject = true;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._ProductThumbSparkImage_SolidColor1_c();
         _loc1_.initialized(this,"maskRect");
         this.maskRect = _loc1_;
         BindingManager.executeBindings(this,"maskRect",this.maskRect);
         return _loc1_;
      }
      
      private function _ProductThumbSparkImage_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.1;
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _ProductThumbSparkImage_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",0);
         _loc1_.id = "_ProductThumbSparkImage_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ProductThumbSparkImage_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_ProductThumbSparkImage_BusyIndicator1",this._ProductThumbSparkImage_BusyIndicator1);
         return _loc1_;
      }
      
      private function _ProductThumbSparkImage_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():DisplayObject
         {
            return maskRect.displayObject;
         },null,"imageContainer.mask");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageContainer() : SpriteVisualElement
      {
         return this._1006495386imageContainer;
      }
      
      public function set imageContainer(param1:SpriteVisualElement) : void
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
      
      [Bindable(event="propertyChange")]
      public function get maskRect() : Rect
      {
         return this._275021552maskRect;
      }
      
      public function set maskRect(param1:Rect) : void
      {
         var _loc2_:Object = this._275021552maskRect;
         if(_loc2_ !== param1)
         {
            this._275021552maskRect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskRect",_loc2_,param1));
            }
         }
      }
   }
}
