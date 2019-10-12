package anifire.studio.components
{
   import anifire.effect.SuperEffect;
   import anifire.event.EffectEvt;
   import anifire.studio.core.EffectThumb;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
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
   
   public class EffectThumbSparkImage extends ThumbImageBase implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _EffectThumbSparkImage_BusyIndicator1:BusyIndicator;
      
      private var _1006495386imageContainer:SpriteVisualElement;
      
      private var _275021552maskRect:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _effect:SuperEffect;
      
      protected var _effectThumbnail:DisplayObject;
      
      protected var _imageUpdated:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function EffectThumbSparkImage()
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
         bindings = this._EffectThumbSparkImage_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_EffectThumbSparkImageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return EffectThumbSparkImage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._EffectThumbSparkImage_SpriteVisualElement1_i(),this._EffectThumbSparkImage_Rect1_i()];
         this.currentState = "normal";
         var _EffectThumbSparkImage_BusyIndicator1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._EffectThumbSparkImage_BusyIndicator1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"loading",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_EffectThumbSparkImage_BusyIndicator1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["maskRect"]
            })]
         }),new State({
            "name":"processing",
            "stateGroups":["busyStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_EffectThumbSparkImage_BusyIndicator1_factory,
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
         EffectThumbSparkImage._watcherSetupUtil = param1;
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
            this._effect.removeEventListener(EffectEvt.LOAD_EFFECT_THUMBNAIL_COMPLETE,this.onEffectThumbnailComplete);
            _processing = false;
         }
      }
      
      override protected function processProductImage() : void
      {
         _processing = true;
         this._effect = (_product as EffectThumb).getNewEffect();
         this._effect.addEventListener(EffectEvt.LOAD_EFFECT_THUMBNAIL_COMPLETE,this.onEffectThumbnailComplete);
         this._effectThumbnail = this._effect.loadThumbnail(_product.imageData as ByteArray);
      }
      
      private function onEffectThumbnailComplete(param1:EffectEvt) : void
      {
         this.cancelProcessing();
         this._effectThumbnail = param1.thumbnail;
         this._effectThumbnail.visible = true;
         this.imageContainer.addChild(this._effectThumbnail);
         this._imageUpdated = false;
         invalidateDisplayList();
         displayImage();
      }
      
      protected function updateImage() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Rectangle = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(!this._imageUpdated && this._effectThumbnail)
         {
            _loc1_ = getLayoutBoundsWidth();
            _loc2_ = getLayoutBoundsHeight();
            _loc3_ = this._effectThumbnail.getBounds(this._effectThumbnail);
            _loc4_ = 1;
            if(_loc3_.width > 0 && _loc3_.height > 0)
            {
               _loc5_ = contentWidth / _loc3_.width;
               _loc6_ = contentHeight / _loc3_.height;
               _loc4_ = Math.min(_loc5_,_loc6_);
            }
            this._effectThumbnail.scaleX = _loc4_;
            this._effectThumbnail.scaleY = _loc4_;
            this._effectThumbnail.x = -_loc3_.x * _loc4_ + (contentWidth - _loc3_.width * _loc4_) * 0.5;
            this._effectThumbnail.y = -_loc3_.y * _loc4_ + (contentHeight - _loc3_.height * _loc4_) * 0.5;
         }
      }
      
      override protected function removeImage() : void
      {
         this._imageUpdated = false;
         UtilPlain.removeAllSon(this.imageContainer);
         if(this._effectThumbnail)
         {
            this._effectThumbnail.visible = false;
         }
         this._effect = null;
         this._effectThumbnail = null;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.updateImage();
      }
      
      private function _EffectThumbSparkImage_SpriteVisualElement1_i() : SpriteVisualElement
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
      
      private function _EffectThumbSparkImage_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.alwaysCreateDisplayObject = true;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._EffectThumbSparkImage_SolidColor1_c();
         _loc1_.initialized(this,"maskRect");
         this.maskRect = _loc1_;
         BindingManager.executeBindings(this,"maskRect",this.maskRect);
         return _loc1_;
      }
      
      private function _EffectThumbSparkImage_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0.1;
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _EffectThumbSparkImage_BusyIndicator1_i() : BusyIndicator
      {
         var _loc1_:BusyIndicator = new BusyIndicator();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("symbolColor",0);
         _loc1_.id = "_EffectThumbSparkImage_BusyIndicator1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._EffectThumbSparkImage_BusyIndicator1 = _loc1_;
         BindingManager.executeBindings(this,"_EffectThumbSparkImage_BusyIndicator1",this._EffectThumbSparkImage_BusyIndicator1);
         return _loc1_;
      }
      
      private function _EffectThumbSparkImage_bindingsSetup() : Array
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
