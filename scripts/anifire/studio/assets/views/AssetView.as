package anifire.studio.assets.views
{
   import anifire.studio.assets.image.AssetImageBase;
   import anifire.studio.assets.image.AssetImageFactory;
   import anifire.studio.assets.image.IAssetImageProvider;
   import anifire.studio.core.Asset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class AssetView extends Sprite implements IAssetView
   {
       
      
      protected var _assetScaleX:Number = 1;
      
      protected var _isFlipped:Boolean = false;
      
      protected var _asset:Asset;
      
      protected var _assetImage:AssetImageBase;
      
      protected var _newImage:AssetImageBase;
      
      protected var _imageProvider:IAssetImageProvider;
      
      public function AssetView(param1:Asset, param2:IAssetImageProvider = null)
      {
         super();
         if(param2)
         {
            this._imageProvider = param2;
         }
         else
         {
            this._imageProvider = AssetImageFactory.instance;
         }
         this.init(param1);
      }
      
      public function get asset() : Asset
      {
         return this._asset;
      }
      
      public function set asset(param1:Asset) : void
      {
         this._asset = param1;
      }
      
      public function get assetImage() : AssetImageBase
      {
         return this._assetImage;
      }
      
      protected function init(param1:Asset) : void
      {
         this.asset = param1;
         this.addAssetEventListeners();
      }
      
      public function startProcess(param1:Boolean = false, param2:Number = 0) : void
      {
         this.loadImage();
      }
      
      public function loadImage() : void
      {
         this.createImage(this.asset);
      }
      
      protected function createImage(param1:Asset) : void
      {
         if(this._newImage)
         {
            this._newImage.removeEventListener(Event.COMPLETE,this.onImageReady);
         }
         this._newImage = this._imageProvider.getImage(param1);
         if(this._newImage)
         {
            this._newImage.addEventListener(Event.COMPLETE,this.onImageReady);
            this._newImage.asset = param1;
         }
      }
      
      protected function onImageReady(param1:Event) : void
      {
         this._newImage.removeEventListener(Event.COMPLETE,this.onImageReady);
         if(this._assetImage)
         {
            if(contains(this._assetImage))
            {
               removeChild(this._assetImage);
            }
            this._assetImage.destroy();
         }
         this._assetImage = this._newImage;
         if(this._assetImage)
         {
            addChild(this._assetImage);
         }
         this.handleImageReady();
      }
      
      public function destroy(param1:String = "rip") : void
      {
         this.removeAssetEventListeners();
         if(this._assetImage)
         {
            if(contains(this._assetImage))
            {
               removeChild(this._assetImage);
            }
            this._assetImage.destroy();
            this._assetImage = null;
         }
         if(this._newImage)
         {
            this._newImage.removeEventListener(Event.COMPLETE,this.onImageReady);
            this._newImage.destroy();
            this._newImage = null;
         }
      }
      
      protected function addAssetEventListeners() : void
      {
         if(this._asset)
         {
            this.asset.addEventListener(AssetEvent.STATE_CHANGE,this.onAssetStateChange);
            this.asset.addEventListener(AssetEvent.ACTION_CHANGE,this.onAssetStateChange);
         }
      }
      
      protected function removeAssetEventListeners() : void
      {
         if(this._asset)
         {
            this.asset.removeEventListener(AssetEvent.STATE_CHANGE,this.onAssetStateChange);
            this.asset.removeEventListener(AssetEvent.ACTION_CHANGE,this.onAssetStateChange);
         }
      }
      
      protected function onAssetStateChange(param1:AssetEvent) : void
      {
         if(param1.asset)
         {
            this.createImage(param1.asset);
         }
      }
      
      protected function handleImageReady() : void
      {
         dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_LOAD_COMPLETE,true));
         dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_IMAGE_CHANGE,true));
      }
      
      public function goToAndPause(param1:Number) : void
      {
         this.pause();
      }
      
      public function pause() : void
      {
         if(this._assetImage)
         {
            this._assetImage.pause();
         }
      }
      
      public function resume() : void
      {
         if(this._assetImage)
         {
            this._assetImage.resume();
         }
      }
      
      protected function moveImage(param1:IMovable) : void
      {
         if(param1)
         {
            this.x = param1.x;
            this.y = param1.y;
            dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      protected function rotateImage(param1:IRotatable) : void
      {
         if(param1)
         {
            rotation = param1.rotation;
            dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      protected function scaleImage(param1:IScalable) : void
      {
         if(param1)
         {
            this._assetScaleX = param1.scaleX;
            this.scaleX = !!this._isFlipped?Number(-this._assetScaleX):Number(this._assetScaleX);
            this.scaleY = param1.scaleY;
            dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      protected function flipImage(param1:IFlippable) : void
      {
         if(param1 && this._isFlipped != param1.isFlipped)
         {
            if(this._assetImage)
            {
               this._isFlipped = param1.isFlipped;
               this.scaleX = !!this._isFlipped?Number(-this._assetScaleX):Number(this._assetScaleX);
               if(this._assetImage is IFlippable)
               {
                  IFlippable(this._assetImage).flipIt();
               }
               dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
            }
         }
      }
      
      protected function colorImage(param1:IColorable) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:uint = 0;
         if(param1 && this._assetImage is IColorable)
         {
            IColorable(this.assetImage).restoreColor();
            if(param1.customColor.length > 0)
            {
               _loc2_ = param1.customColor.length;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  _loc4_ = param1.customColor.getKey(_loc3_);
                  _loc5_ = param1.customColor.getValueByIndex(_loc3_)["dstColor"];
                  IColorable(this._assetImage).changeColor(_loc4_,_loc5_);
                  _loc3_++;
               }
            }
            dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
   }
}
