package anifire.studio.assets.controllers
{
   import anifire.studio.core.Widget;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.BubbleAssetEvent;
   import anifire.studio.interfaces.IAssetView;
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
   
   public class WidgetController extends AbstractAssetController implements IResizable, IMovable, IRotatable
   {
       
      
      protected var _widget:Widget;
      
      public function WidgetController(param1:IAssetView, param2:IEventDispatcher = null)
      {
         super(param1,param2);
         this._widget = asset as Widget;
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
      
      public function get minWidth() : Number
      {
         return this._widget.minWidth;
      }
      
      public function get minHeight() : Number
      {
         return this._widget.minHeight;
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
         var _loc4_:Widget = null;
         var _loc5_:Rectangle = null;
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
            if(asset is Widget)
            {
               _loc4_ = asset as Widget;
               _loc5_ = _loc4_.bounds;
               if(_loc4_.isShadow)
               {
                  _loc4_.scaleX = this.width / _loc4_.width;
               }
               else
               {
                  _loc4_.scaleX = 1;
                  _loc4_.scaleY = 1;
                  if(_loc5_)
                  {
                     _loc5_.x = _loc5_.x + (_loc5_.width - param1) / 2;
                     _loc5_.y = _loc5_.y + (_loc5_.height - this.height) / 2;
                     _loc5_.width = param1;
                     _loc5_.height = this.height;
                     _loc4_.bounds = _loc5_;
                  }
               }
            }
            this.move(_loc2_.x,_loc2_.y);
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
         var _loc4_:Widget = null;
         var _loc5_:Rectangle = null;
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
            if(asset is Widget)
            {
               _loc4_ = asset as Widget;
               _loc5_ = _loc4_.bounds;
               if(_loc4_.isShadow)
               {
                  _loc4_.scaleY = this.height / _loc4_.height;
               }
               else
               {
                  _loc4_.scaleX = 1;
                  _loc4_.scaleY = 1;
                  if(_loc5_)
                  {
                     _loc5_.x = _loc5_.x + (_loc5_.width - this.width) / 2;
                     _loc5_.y = _loc5_.y + (_loc5_.height - param1) / 2;
                     _loc5_.width = this.width;
                     _loc5_.height = param1;
                     _loc4_.bounds = _loc5_;
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
         var _loc6_:Widget = null;
         var _loc7_:Rectangle = null;
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
            if(asset is Widget)
            {
               _loc6_ = asset as Widget;
               _loc7_ = _loc6_.bounds;
               if(_loc6_.isShadow)
               {
                  _loc6_.scaleX = param1 / _loc6_.width;
                  _loc6_.scaleY = param2 / _loc6_.height;
               }
               else
               {
                  _loc6_.scaleX = 1;
                  _loc6_.scaleY = 1;
                  if(_loc7_)
                  {
                     _loc7_.x = _loc7_.x + (_loc7_.width - param1) / 2;
                     _loc7_.y = _loc7_.y + (_loc7_.height - param2) / 2;
                     _loc7_.width = param1;
                     _loc7_.height = param2;
                     _loc6_.bounds = _loc7_;
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
      
      override protected function get centerX() : Number
      {
         var _loc1_:Widget = null;
         if(asset is Widget)
         {
            _loc1_ = asset as Widget;
            return _loc1_.bounds.x + _loc1_.bounds.width / 2;
         }
         return 0;
      }
      
      override protected function get centerY() : Number
      {
         var _loc1_:Widget = null;
         if(asset is Widget)
         {
            _loc1_ = asset as Widget;
            return _loc1_.bounds.y + _loc1_.bounds.height / 2;
         }
         return 0;
      }
   }
}
