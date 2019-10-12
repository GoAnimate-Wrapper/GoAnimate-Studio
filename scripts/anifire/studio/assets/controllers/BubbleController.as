package anifire.studio.assets.controllers
{
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.BubbleAssetEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IBubble;
   import anifire.studio.interfaces.IBubbleTail;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   import anifire.util.UtilMath;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BubbleController extends AbstractAssetController implements IResizable, IMovable, IBubbleTail, IRotatable
   {
       
      
      public function BubbleController(param1:IAssetView, param2:IEventDispatcher = null)
      {
         super(param1,param2);
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
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetEvent);
            param1.addEventListener(AssetEvent.ASSET_ROTATED,this.onAssetEvent);
            param1.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetEvent);
            param1.addEventListener(BubbleAssetEvent.TAIL_MOVED,this.onAssetEvent);
            param1.addEventListener(BubbleAssetEvent.TEXT_EMBED_CHANGE,this.onAssetEvent);
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
            param1.removeEventListener(BubbleAssetEvent.TAIL_MOVED,this.onAssetEvent);
            param1.removeEventListener(BubbleAssetEvent.TEXT_EMBED_CHANGE,this.onAssetEvent);
            param1.removeEventListener(AssetEvent.REFERENCE_POINT_CHANGED,this.onAssetEvent);
         }
      }
      
      private function onAssetEvent(param1:Event) : void
      {
         this.dispatchEvent(param1);
         if(param1.type == AssetEvent.ASSET_ROTATED)
         {
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
         else if(param1.type == BubbleAssetEvent.TEXT_EMBED_CHANGE)
         {
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
         }
      }
      
      public function get hasTail() : Boolean
      {
         if(asset is IBubbleTail)
         {
            return IBubbleTail(asset).hasTail;
         }
         return true;
      }
      
      public function get minWidth() : Number
      {
         return asset is BubbleAsset?Number(asset.minWidth):Number(20);
      }
      
      public function get minHeight() : Number
      {
         return asset is BubbleAsset?Number(asset.minHeight):Number(20);
      }
      
      public function get maxWidth() : Number
      {
         return 999999;
      }
      
      public function get maxHeight() : Number
      {
         return 999999;
      }
      
      public function get rect() : Rectangle
      {
         return new Rectangle();
      }
      
      public function get tailX() : Number
      {
         var _loc1_:Rectangle = null;
         if(asset is IBubbleTail)
         {
            _loc1_ = view.assetImage.rect;
            return IBubbleTail(asset).tailX - _loc1_.x - _loc1_.width / 2;
         }
         return 0;
      }
      
      public function get tailY() : Number
      {
         var _loc1_:Rectangle = null;
         if(asset is IBubbleTail)
         {
            _loc1_ = view.assetImage.rect;
            return IBubbleTail(asset).tailY - _loc1_.y - _loc1_.height / 2;
         }
         return 0;
      }
      
      public function set tailX(param1:Number) : void
      {
         var _loc2_:Rectangle = view.assetImage.rect;
         if(_loc2_)
         {
            param1 = param1 + (_loc2_.x + _loc2_.width / 2);
         }
         if(asset is IBubbleTail)
         {
            IBubbleTail(asset).tailX = param1;
         }
         this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TAIL_MOVED,null));
      }
      
      public function set tailY(param1:Number) : void
      {
         var _loc2_:Rectangle = view.assetImage.rect;
         if(_loc2_)
         {
            param1 = param1 + (_loc2_.y + _loc2_.height / 2);
         }
         if(asset is IBubbleTail)
         {
            IBubbleTail(asset).tailY = param1;
         }
         dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TAIL_MOVED,null));
      }
      
      public function moveTail(param1:Number, param2:Number) : void
      {
         var _loc3_:Rectangle = null;
         if(param1 != this.tailX || param2 != this.tailY)
         {
            _loc3_ = view.assetImage.rect;
            if(_loc3_)
            {
               param1 = param1 + (_loc3_.x + _loc3_.width / 2);
               param2 = param2 + (_loc3_.y + _loc3_.height / 2);
            }
            if(asset is IBubbleTail)
            {
               IBubbleTail(asset).moveTail(param1,param2);
            }
            this.dispatchEvent(new BubbleAssetEvent(BubbleAssetEvent.TAIL_MOVED,null));
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         super.destroy(param1);
      }
      
      public function get width() : Number
      {
         var _loc1_:Number = 0;
         if(asset is IResizable)
         {
            _loc1_ = IResizable(asset).width;
         }
         if(asset is IScalable)
         {
            _loc1_ = _loc1_ * IScalable(asset).scaleX;
         }
         return _loc1_;
      }
      
      public function set width(param1:Number) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Rectangle = null;
         var _loc5_:BubbleAsset = null;
         if(param1 != this.width)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
            _loc2_ = new Point(this.x,this.y);
            _loc3_ = new Point(this.referenceX,this.referenceY);
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
            _loc4_ = view.assetImage.rect.clone();
            if(asset is BubbleAsset)
            {
               _loc5_ = asset as BubbleAsset;
               if(_loc5_.isShadow)
               {
                  _loc5_.scaleX = this.width / _loc5_.width;
               }
               else
               {
                  _loc5_.scaleX = 1;
                  _loc5_.scaleY = 1;
                  if(_loc4_)
                  {
                     _loc4_.x = _loc4_.x + (_loc4_.width - param1) / 2;
                     _loc4_.y = _loc4_.y + (_loc4_.height - this.height) / 2;
                     _loc4_.width = param1;
                     _loc4_.height = this.height;
                     if(asset is IBubble)
                     {
                        IBubble(asset).resizeBubble(_loc4_);
                     }
                  }
               }
               this.move(_loc2_.x,_loc2_.y);
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
         }
      }
      
      public function get height() : Number
      {
         var _loc1_:Number = 0;
         if(asset is IResizable)
         {
            _loc1_ = IResizable(asset).height;
         }
         if(asset is IScalable)
         {
            _loc1_ = _loc1_ * IScalable(asset).scaleY;
         }
         return _loc1_;
      }
      
      public function set height(param1:Number) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Rectangle = null;
         var _loc5_:BubbleAsset = null;
         if(param1 != this.height)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minHeight,this.maxHeight);
            _loc2_ = new Point(this.x,this.y);
            _loc3_ = new Point(this.referenceX,this.referenceY);
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
            _loc4_ = view.assetImage.rect.clone();
            if(asset is BubbleAsset)
            {
               _loc5_ = asset as BubbleAsset;
               if(_loc5_.isShadow)
               {
                  _loc5_.scaleY = this.height / _loc5_.height;
               }
               else
               {
                  _loc5_.scaleX = 1;
                  _loc5_.scaleY = 1;
                  if(_loc4_)
                  {
                     _loc4_.x = _loc4_.x + (_loc4_.width - this.width) / 2;
                     _loc4_.y = _loc4_.y + (_loc4_.height - param1) / 2;
                     _loc4_.width = this.width;
                     _loc4_.height = param1;
                     if(asset is IBubble)
                     {
                        IBubble(asset).resizeBubble(_loc4_);
                     }
                  }
               }
            }
            this.move(_loc2_.x,_loc2_.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
         }
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Rectangle = null;
         var _loc7_:BubbleAsset = null;
         if(param1 != this.width || param2 != this.height)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
            param2 = UtilMath.boundaryCheck(param2,this.minHeight,this.maxHeight);
            _loc4_ = new Point(this.x,this.y);
            _loc5_ = new Point(this.referenceX,this.referenceY);
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
            _loc6_ = view.assetImage.rect.clone();
            if(asset is BubbleAsset)
            {
               _loc7_ = asset as BubbleAsset;
               if(_loc7_.isShadow)
               {
                  _loc7_.scaleX = param1 / _loc7_.width;
                  _loc7_.scaleY = param2 / _loc7_.height;
               }
               else
               {
                  _loc7_.scaleX = 1;
                  _loc7_.scaleY = 1;
                  if(_loc6_)
                  {
                     _loc6_.x = _loc6_.x + (_loc6_.width - param1) / 2;
                     _loc6_.y = _loc6_.y + (_loc6_.height - param2) / 2;
                     _loc6_.width = param1;
                     _loc6_.height = param2;
                     _loc7_.resizeBubble(_loc6_);
                  }
               }
            }
            this.move(_loc4_.x,_loc4_.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
         }
      }
      
      public function get x() : Number
      {
         var _loc1_:Point = new Point(this.centerX,this.centerY);
         var _loc2_:Matrix = this.mat;
         _loc1_ = _loc2_.transformPoint(_loc1_);
         return _loc1_.x;
      }
      
      public function get y() : Number
      {
         var _loc1_:Point = new Point(this.centerX,this.centerY);
         var _loc2_:Matrix = this.mat;
         _loc1_ = _loc2_.transformPoint(_loc1_);
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
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
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
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         if(param1 != this.x || param2 != this.y)
         {
            if(asset is IMovable)
            {
               IMovable(asset).move(IMovable(asset).x + param1 - this.x,IMovable(asset).y + param2 - this.y);
               this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
            }
         }
      }
      
      private function get mat() : Matrix
      {
         var _loc1_:Matrix = new Matrix();
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
      
      public function get isRotatable() : Boolean
      {
         if(asset is IRotatable)
         {
            return IRotatable(asset).isRotatable;
         }
         return false;
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
               this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_ROTATED));
            }
         }
      }
   }
}
