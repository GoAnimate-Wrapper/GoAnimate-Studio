package anifire.studio.assets.controllers
{
   import anifire.studio.core.FlowFrame;
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
   
   public class FlowFrameController extends AbstractAssetController implements IResizable, IMovable, IRotatable
   {
      
      public static const MIN_WIDTH:Number = 3;
      
      public static const MIN_HEIGHT:Number = 3;
      
      public static const MAX_WIDTH:Number = 999999;
      
      public static const MAX_HEIGHT:Number = 999999;
       
      
      protected var _flowFrame:FlowFrame;
      
      public function FlowFrameController(param1:IAssetView, param2:IEventDispatcher = null)
      {
         super(param1,param2);
         this._flowFrame = asset as FlowFrame;
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
         return MIN_WIDTH;
      }
      
      public function get minFrameWidth() : Number
      {
         return Math.max(MIN_WIDTH,this._flowFrame.minWidth * this._flowFrame.scaleX);
      }
      
      public function get minHeight() : Number
      {
         return MIN_HEIGHT;
      }
      
      public function get minFrameHeight() : Number
      {
         return Math.max(MIN_HEIGHT,this._flowFrame.minHeight * this._flowFrame.scaleY);
      }
      
      public function get maxWidth() : Number
      {
         return MAX_WIDTH;
      }
      
      public function get maxHeight() : Number
      {
         return MAX_HEIGHT;
      }
      
      public function get rect() : Rectangle
      {
         return new Rectangle();
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
         var _loc4_:FlowFrame = null;
         if(param1 != this.width)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minFrameWidth,this.maxWidth);
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
            _loc4_ = asset as FlowFrame;
            if(_loc4_)
            {
               _loc4_.width = param1;
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
         var _loc4_:FlowFrame = null;
         if(param1 != this.height)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minFrameHeight,this.maxHeight);
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
            _loc4_ = asset as FlowFrame;
            if(_loc4_)
            {
               _loc4_.height = param1;
            }
            this.move(_loc2_.x,_loc2_.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
         }
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:FlowFrame = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         if(param1 != this.width || param2 != this.height)
         {
            _loc4_ = param3;
            if(_loc4_)
            {
               param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
               param2 = UtilMath.boundaryCheck(param2,this.minHeight,this.maxHeight);
            }
            else
            {
               param1 = UtilMath.boundaryCheck(param1,this.minFrameWidth,this.maxWidth);
               param2 = UtilMath.boundaryCheck(param2,this.minFrameHeight,this.maxHeight);
            }
            if(_loc4_)
            {
               _loc6_ = new Point(this.x,this.y);
               _loc7_ = new Point(this.referenceX,this.referenceY);
               if(this.width > 0 && this.height > 0)
               {
                  if(this.rotation != 0)
                  {
                     _loc6_ = UtilMath.rotatePoint(_loc6_,-this.rotation,_loc7_);
                  }
                  _loc6_ = UtilMath.scalePoint(_loc6_,param1 / this.width,param2 / this.height,_loc7_);
                  if(this.rotation != 0)
                  {
                     _loc6_ = UtilMath.rotatePoint(_loc6_,this.rotation,_loc7_);
                  }
               }
            }
            _loc5_ = asset as FlowFrame;
            if(_loc5_)
            {
               if(_loc5_.isShadow)
               {
                  _loc5_.scaleX = param1 / _loc5_.width;
                  _loc5_.scaleY = param2 / _loc5_.height;
               }
               else if(_loc4_)
               {
                  _loc8_ = Math.min(param1 / _loc5_.width,param2 / _loc5_.height);
                  _loc5_.scaleX = _loc8_;
                  _loc5_.scaleY = _loc8_;
               }
               else
               {
                  _loc5_.resize(param1 / _loc5_.scaleX,param2 / _loc5_.scaleY);
               }
            }
            if(_loc4_)
            {
               this.move(_loc6_.x,_loc6_.y);
            }
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
