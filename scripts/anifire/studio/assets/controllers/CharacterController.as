package anifire.studio.assets.controllers
{
   import anifire.studio.core.Asset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   import anifire.util.UtilMath;
   import flash.events.IEventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class CharacterController extends AbstractAssetController implements IResizable, IMovable, IRotatable
   {
       
      
      public function CharacterController(param1:IAssetView, param2:IEventDispatcher = null)
      {
         super(param1,param2);
         this.addAssetEventListeners(asset);
      }
      
      override public function set view(param1:IAssetView) : void
      {
         this.removeAssetEventListeners(asset);
         super.view = param1;
         if(this.referenceX == -1 || this.referenceY == -1)
         {
            this.setReferencePoint(this.x,this.y);
         }
         this.addAssetEventListeners(asset);
         param1.addEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onViewImageChanged);
      }
      
      private function onViewImageChanged(param1:AssetViewEvent) : void
      {
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this.asset as Asset));
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED,this.asset as Asset));
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetEvent);
            param1.addEventListener(AssetEvent.ASSET_ROTATED,this.onAssetEvent);
            param1.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetEvent);
            param1.addEventListener(AssetEvent.REFERENCE_POINT_CHANGED,this.onAssetEvent);
         }
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetEvent);
            param1.removeEventListener(AssetEvent.ASSET_ROTATED,this.onAssetEvent);
            param1.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetEvent);
            param1.removeEventListener(AssetEvent.REFERENCE_POINT_CHANGED,this.onAssetEvent);
         }
      }
      
      private function onAssetEvent(param1:AssetEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      public function get minWidth() : Number
      {
         return 3;
      }
      
      public function get minHeight() : Number
      {
         return 3;
      }
      
      public function get maxWidth() : Number
      {
         return 999999;
      }
      
      public function get maxHeight() : Number
      {
         return 999999;
      }
      
      public function get width() : Number
      {
         if(asset is IScalable)
         {
            return IScalable(asset).scaleX * this.rect.width;
         }
         return this.rect.width;
      }
      
      public function set width(param1:Number) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Rectangle = null;
         if(param1 != this.width)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
            _loc2_ = new Point(this.x,this.y);
            _loc3_ = new Point(this.referenceX,this.referenceY);
            _loc4_ = this.rect;
            if(_loc4_ && _loc4_.width > 0)
            {
               if(asset is IScalable)
               {
                  if(this.width > 0 && this.height > 0)
                  {
                     if(this.rotation != 0)
                     {
                        _loc2_ = UtilMath.rotatePoint(_loc2_,-this.rotation,_loc3_);
                     }
                     _loc2_ = UtilMath.scalePoint(_loc2_,param1 / this.width,1,_loc3_);
                     if(this.rotation != 0)
                     {
                        _loc2_ = UtilMath.rotatePoint(_loc2_,this.rotation,_loc3_);
                     }
                  }
                  IScalable(asset).scaleX = param1 / _loc4_.width;
                  this.move(_loc2_.x,_loc2_.y);
               }
            }
         }
      }
      
      public function get height() : Number
      {
         if(asset is IScalable)
         {
            return IScalable(asset).scaleY * this.rect.height;
         }
         return this.rect.height;
      }
      
      public function set height(param1:Number) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Rectangle = null;
         if(param1 != this.height)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minHeight,this.maxHeight);
            _loc2_ = new Point(this.x,this.y);
            _loc3_ = new Point(this.referenceX,this.referenceY);
            _loc4_ = this.rect;
            if(_loc4_ && _loc4_.height > 0)
            {
               if(asset is IScalable)
               {
                  if(this.width > 0 && this.height > 0)
                  {
                     if(this.rotation != 0)
                     {
                        _loc2_ = UtilMath.rotatePoint(_loc2_,-this.rotation,_loc3_);
                     }
                     _loc2_ = UtilMath.scalePoint(_loc2_,1,param1 / this.height,_loc3_);
                     if(this.rotation != 0)
                     {
                        _loc2_ = UtilMath.rotatePoint(_loc2_,this.rotation,_loc3_);
                     }
                  }
                  IScalable(asset).scaleY = param1 / _loc4_.height;
                  this.move(_loc2_.x,_loc2_.y);
               }
            }
         }
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Rectangle = null;
         if(param1 != this.width || param2 != this.height)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
            param2 = UtilMath.boundaryCheck(param2,this.minHeight,this.maxHeight);
            _loc4_ = new Point(this.x,this.y);
            _loc5_ = new Point(this.referenceX,this.referenceY);
            _loc6_ = this.rect;
            if(_loc6_ && _loc6_.width > 0 && _loc6_.height > 0)
            {
               if(asset is IScalable)
               {
                  if(this.width > 0 && this.height > 0)
                  {
                     if(this.rotation != 0)
                     {
                        _loc4_ = UtilMath.rotatePoint(_loc4_,-this.rotation,_loc5_);
                     }
                     _loc4_ = UtilMath.scalePoint(_loc4_,param1 / this.width,param2 / this.height,_loc5_);
                     if(this.rotation != 0)
                     {
                        _loc4_ = UtilMath.rotatePoint(_loc4_,this.rotation,_loc5_);
                     }
                  }
                  IScalable(asset).scaleX = param1 / _loc6_.width;
                  IScalable(asset).scaleY = param2 / _loc6_.height;
                  this.move(_loc4_.x,_loc4_.y);
               }
            }
         }
      }
      
      public function get rect() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         if(this.view && this.view.assetImage)
         {
            _loc1_ = this.view.assetImage.getBounds(this.view.assetImage);
         }
         return _loc1_;
      }
      
      public function get x() : Number
      {
         var _loc1_:Point = this.mat.transformPoint(UtilMath.getCenter(this.rect));
         return _loc1_.x;
      }
      
      public function get y() : Number
      {
         var _loc1_:Point = this.mat.transformPoint(UtilMath.getCenter(this.rect));
         return _loc1_.y;
      }
      
      public function set x(param1:Number) : void
      {
         if(param1 != this.x)
         {
            if(asset is IMovable)
            {
               IMovable(asset).x = IMovable(asset).x + (param1 - this.x);
            }
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(param1 != this.y)
         {
            if(asset is IMovable)
            {
               IMovable(asset).y = IMovable(asset).y + (param1 - this.y);
            }
         }
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = this.x;
         var _loc4_:Number = this.y;
         if(param1 != _loc3_ || param2 != _loc4_)
         {
            if(asset is IMovable)
            {
               IMovable(asset).move(IMovable(asset).x + param1 - _loc3_,IMovable(asset).y + param2 - _loc4_);
            }
         }
      }
      
      private function get mat() : Matrix
      {
         var _loc1_:Matrix = new Matrix();
         if(asset is IFlippable && IFlippable(asset).isFlipped)
         {
            _loc1_.scale(-1,1);
         }
         if(asset is IScalable)
         {
            _loc1_.scale(IScalable(asset).scaleX,IScalable(asset).scaleY);
         }
         if(asset is IRotatable)
         {
            _loc1_.rotate(IRotatable(asset).rotation * Math.PI / 180);
         }
         if(asset is IMovable)
         {
            _loc1_.translate(IMovable(asset).x,IMovable(asset).y);
         }
         return _loc1_;
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         if(this.view)
         {
            this.view.removeEventListener(AssetViewEvent.VIEW_IMAGE_CHANGE,this.onViewImageChanged);
         }
         this.removeAssetEventListeners(asset);
         super.destroy(param1);
      }
      
      public function get isRotatable() : Boolean
      {
         if(asset is IRotatable)
         {
            return IRotatable(asset).isRotatable;
         }
         return true;
      }
      
      public function get rotation() : Number
      {
         if(asset is IRotatable)
         {
            return IRotatable(asset).rotation;
         }
         return 0;
      }
      
      public function set rotation(param1:Number) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         if(param1 != this.rotation)
         {
            if(asset is IRotatable)
            {
               _loc2_ = new Point(this.x,this.y);
               _loc3_ = new Point(this.referenceX,this.referenceY);
               _loc2_ = UtilMath.rotatePoint(_loc2_,param1 - this.rotation,_loc3_);
               IRotatable(asset).rotation = param1;
               this.move(_loc2_.x,_loc2_.y);
            }
         }
      }
   }
}
