package anifire.studio.assets.image
{
   import anifire.constant.AnimeConstants;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Prop;
   import anifire.studio.core.Thumb;
   import anifire.studio.core.VideoPropThumb;
   import anifire.util.UtilCommonLoader;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import mx.containers.Canvas;
   
   public class VideoAssetImage extends AssetImageBase
   {
       
      
      private var _prop:Prop;
      
      private var _imageObject:DisplayObject;
      
      private var _product:VideoPropThumb;
      
      public function VideoAssetImage()
      {
         super();
      }
      
      override public function set asset(param1:Asset) : void
      {
         var _loc2_:Thumb = null;
         var _loc3_:VideoPropThumb = null;
         var _loc4_:Object = null;
         var _loc5_:Loader = null;
         super.asset = param1;
         if(param1 is Prop)
         {
            this._prop = param1 as Prop;
            _loc2_ = param1.thumb;
            if(_loc2_ is VideoPropThumb)
            {
               _loc3_ = _loc2_ as VideoPropThumb;
               this._product = _loc3_;
               _loc4_ = _loc2_.imageData;
               if(_loc4_)
               {
                  _loc5_ = new Loader();
                  this._imageObject = _loc5_;
                  _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onImageReady);
                  if(_loc4_ is ByteArray)
                  {
                     _loc5_.loadBytes(ByteArray(_loc4_),UtilCommonLoader.externalLoaderContext);
                  }
                  else
                  {
                     _loc5_.loadBytes(ByteArray(_loc4_["figure"]));
                  }
                  _loc5_.name = AnimeConstants.IMAGE_OBJECT_NAME;
                  this.addChild(_loc5_);
               }
               else
               {
                  this.loadDefaultImage();
               }
            }
         }
      }
      
      private function onImageReady(param1:Event) : void
      {
         var _loc2_:Loader = null;
         var _loc3_:Rectangle = null;
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onImageReady);
         if(!(param1 is LoadEmbedMovieEvent))
         {
            _loc2_ = param1.target.loader;
         }
         if(_loc2_)
         {
            _loc2_.content.width = this._product.videoWidth;
            _loc2_.content.height = this._product.videoHeight;
            _loc3_ = _loc2_.getBounds(_loc2_);
            _loc2_.content.x = -(_loc3_.x + _loc3_.width / 2);
            _loc2_.content.y = -(_loc3_.y + _loc3_.height / 2);
         }
         if(this._imageObject)
         {
            _loc3_ = this._imageObject.getBounds(this);
            super.rect.x = _loc3_.x;
            super.rect.y = _loc3_.y;
            super.rect.width = _loc3_.width;
            super.rect.height = _loc3_.height;
         }
         this.visible = true;
         dispatchImageReady();
      }
      
      private function loadDefaultImage() : void
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.width = this._product.videoWidth;
         _loc1_.height = this._product.videoHeight;
         _loc1_.graphics.clear();
         _loc1_.graphics.beginFill(15658734,1);
         _loc1_.graphics.drawRect(-_loc1_.width / 2,-_loc1_.height / 2,_loc1_.width,_loc1_.height);
         _loc1_.graphics.endFill();
         _loc1_.clipContent = false;
         _loc1_.name = AnimeConstants.IMAGE_OBJECT_NAME;
         var _loc2_:Canvas = new Canvas();
         _loc2_.x = -_loc1_.width / 2;
         _loc2_.y = -_loc1_.height / 2;
         _loc2_.styleName = "iconVideo";
         _loc2_.width = 48;
         _loc2_.height = 40;
         _loc2_.graphics.beginFill(16711680,0);
         _loc2_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc2_.graphics.endFill();
         _loc1_.addChild(_loc2_);
         this.addChild(_loc1_);
         this.visible = true;
         dispatchImageReady();
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         super.destroy(param1);
         this._prop = null;
         this._product = null;
         this._imageObject = null;
      }
   }
}
