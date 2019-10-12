package anifire.studio.components
{
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.controllers.TextCollectionController;
   import anifire.studio.assets.image.AssetImageBase;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.core.Asset;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IAssetView;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class AssetThumbnail extends Group
   {
       
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _target:Object;
      
      private var _timer:Timer;
      
      private var _locked:Boolean = false;
      
      private var _imageUpdated:Boolean = false;
      
      private var _bitmapData:BitmapData;
      
      public function AssetThumbnail()
      {
         this._timer = new Timer(2500,1);
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._AssetThumbnail_BitmapImage1_i()];
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
      
      private function set bitmapData(param1:BitmapData) : void
      {
         if(this._bitmapData != param1)
         {
            this._bitmapData = param1;
            if(this.imageDisplay.bitmapData)
            {
               this.imageDisplay.bitmapData.dispose();
            }
            this.imageDisplay.source = this._bitmapData;
         }
      }
      
      public function set target(param1:Object) : void
      {
         if(param1 == this._target)
         {
            return;
         }
         if(this._target is IEventDispatcher)
         {
            this._target.removeEventListener(AssetViewEvent.VIEW_CHANGE,this.onViewChange);
         }
         this._target = param1;
         if(this._target)
         {
            if(this._target is IEventDispatcher)
            {
               this._target.addEventListener(AssetViewEvent.VIEW_CHANGE,this.onViewChange);
            }
            this.invalidateImage();
         }
      }
      
      protected function invalidateImage() : void
      {
         this._imageUpdated = false;
         invalidateDisplayList();
      }
      
      private function onViewChange(param1:AssetViewEvent) : void
      {
         if(!this._locked)
         {
            this._locked = true;
            this._timer.reset();
            this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
            this._timer.start();
            callLater(this.invalidateImage);
         }
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this._locked = false;
         callLater(this.invalidateImage);
      }
      
      protected function updateImage() : void
      {
         var _loc3_:BitmapData = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Matrix = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Asset = null;
         var _loc10_:AssetImageBase = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:TextCollectionController = null;
         var _loc14_:AssetViewCollection = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:IIterator = null;
         var _loc18_:IAssetView = null;
         var _loc19_:Asset = null;
         var _loc20_:DisplayObject = null;
         var _loc21_:Rectangle = null;
         var _loc1_:Number = getLayoutBoundsWidth();
         var _loc2_:Number = getLayoutBoundsHeight();
         if(_loc1_ > 0 && _loc2_ > 0)
         {
            _loc3_ = new BitmapData(_loc1_,_loc2_,true,14540253);
            _loc5_ = new Matrix();
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 1;
            if(this._target is IAssetView)
            {
               _loc9_ = IAssetView(this._target).asset;
               _loc10_ = IAssetView(this._target).assetImage;
               if(_loc10_)
               {
                  _loc4_ = _loc10_.thumbnailRect;
                  _loc8_ = Math.min(_loc1_ / _loc4_.width,_loc2_ / _loc4_.height);
                  _loc6_ = -_loc4_.x;
                  _loc7_ = -_loc4_.y;
                  _loc11_ = (_loc1_ - _loc4_.width * _loc8_) / 2;
                  _loc12_ = (_loc2_ - _loc4_.height * _loc8_) / 2;
                  _loc5_.translate(_loc6_,_loc7_);
                  _loc5_.scale(_loc8_,_loc8_);
                  _loc5_.translate(_loc11_,_loc12_);
                  _loc3_.draw(_loc10_,_loc5_);
               }
            }
            else if(this._target is TextCollectionController)
            {
               _loc13_ = this._target as TextCollectionController;
               _loc14_ = _loc13_.viewCollection;
               _loc4_ = _loc13_.rect;
               _loc8_ = Math.min(_loc1_ / _loc4_.width,_loc2_ / _loc4_.height);
               _loc15_ = (_loc1_ - _loc4_.width * _loc8_) * 0.5;
               _loc16_ = (_loc2_ - _loc4_.height * _loc8_) * 0.5;
               _loc17_ = _loc14_.iterator();
               while(_loc17_.hasNext)
               {
                  _loc18_ = IAssetView(_loc17_.next);
                  _loc19_ = _loc18_.asset as Asset;
                  if(_loc19_)
                  {
                     _loc20_ = _loc18_.assetImage;
                     if(_loc20_)
                     {
                        _loc21_ = new Rectangle(_loc19_.x,_loc19_.y,_loc19_.width,_loc19_.height);
                        _loc6_ = (_loc21_.x - _loc4_.x) * _loc8_ + _loc15_;
                        _loc7_ = (_loc21_.y - _loc4_.y) * _loc8_ + _loc16_;
                        _loc5_.identity();
                        _loc5_.scale(_loc8_,_loc8_);
                        _loc5_.translate(_loc6_,_loc7_);
                        _loc3_.draw(_loc20_,_loc5_);
                     }
                  }
               }
            }
            this.bitmapData = _loc3_;
            this._imageUpdated = true;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(!this._imageUpdated)
         {
            this.updateImage();
         }
      }
      
      private function _AssetThumbnail_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.scaleMode = "letterbox";
         _loc1_.smooth = true;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : BitmapImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
   }
}
