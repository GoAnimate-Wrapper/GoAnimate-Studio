package anifire.studio.assets.controllers
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.LicenseConstants;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.util.UtilMath;
   import flash.events.IEventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class CameraController extends AbstractAssetController implements IResizable, IMovable
   {
       
      
      private var screen_height:Number;
      
      private var screen_y:Number;
      
      public function CameraController(param1:IAssetView, param2:IEventDispatcher = null)
      {
         super(param1,param2);
         this.screen_height = AnimeConstants.SCREEN_HEIGHT;
         this.screen_y = AnimeConstants.SCREEN_Y;
         if(LicenseConstants.isWideScreen())
         {
            this.screen_height = AnimeConstants.WIDE_SCREEN_HEIGHT;
            this.screen_y = AnimeConstants.WIDE_SCREEN_Y;
         }
      }
      
      public function isCameraShadow() : Boolean
      {
         if(this.asset is ProgramEffectAsset && ProgramEffectAsset(this.asset).isShadow)
         {
            return true;
         }
         return false;
      }
      
      public function getAssetGuideStyle() : int
      {
         return ProgramEffectAsset(this.asset).guide_style;
      }
      
      override public function set view(param1:IAssetView) : void
      {
         this.removeAssetEventListeners(asset);
         super.view = param1;
         this.addAssetEventListeners(asset);
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetEvent);
            param1.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetEvent);
            param1.addEventListener(AssetEvent.CAMERA_GUIDE_CHANGED,this.onAssetEvent);
         }
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetEvent);
            param1.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetEvent);
            param1.removeEventListener(AssetEvent.CAMERA_GUIDE_CHANGED,this.onAssetEvent);
         }
      }
      
      private function onAssetEvent(param1:AssetEvent) : void
      {
         this.dispatchEvent(param1);
         if(param1.type == AssetEvent.ASSET_RESIZED)
         {
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
      }
      
      public function get minWidth() : Number
      {
         return 32;
      }
      
      public function get minHeight() : Number
      {
         return 20;
      }
      
      public function get maxWidth() : Number
      {
         return AnimeConstants.SCREEN_WIDTH;
      }
      
      public function get maxHeight() : Number
      {
         return this.screen_height;
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
         if(asset is IResizable)
         {
            return IResizable(asset).width;
         }
         return 0;
      }
      
      public function set width(param1:Number) : void
      {
         var _loc2_:Point = null;
         if(param1 != this.width)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
            if(asset is IResizable)
            {
               _loc2_ = new Point(this.x,this.y);
               IResizable(asset).width = param1;
               IResizable(asset).height = this.screen_height * param1 / AnimeConstants.SCREEN_WIDTH;
               this.move(_loc2_.x,_loc2_.y);
               this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
            }
         }
      }
      
      public function get height() : Number
      {
         if(asset is IResizable)
         {
            return IResizable(asset).height;
         }
         return 0;
      }
      
      public function set height(param1:Number) : void
      {
         var _loc2_:Point = null;
         if(param1 != this.height)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minHeight,this.maxHeight);
            if(asset is IResizable)
            {
               _loc2_ = new Point(this.x,this.y);
               IResizable(asset).height = param1;
               IResizable(asset).width = AnimeConstants.SCREEN_WIDTH * param1 / this.screen_height;
               this.move(_loc2_.x,_loc2_.y);
               this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
            }
         }
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         var _loc4_:Point = null;
         if(param1 != this.width || param2 != this.height)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
            param2 = UtilMath.boundaryCheck(param2,this.minHeight,this.maxHeight);
            if(asset is IResizable)
            {
               _loc4_ = new Point(this.x,this.y);
               IResizable(asset).height = param2;
               IResizable(asset).width = AnimeConstants.SCREEN_WIDTH * param2 / this.screen_height;
               this.move(_loc4_.x,_loc4_.y);
               this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
            }
         }
      }
      
      public function get x() : Number
      {
         var _loc1_:Point = new Point();
         if(asset is IResizable)
         {
            _loc1_ = new Point(IResizable(asset).width / 2,IResizable(asset).height / 2);
         }
         var _loc2_:Matrix = this.mat;
         _loc1_ = _loc2_.transformPoint(_loc1_);
         return _loc1_.x;
      }
      
      public function get y() : Number
      {
         var _loc1_:Point = new Point();
         if(asset is IResizable)
         {
            _loc1_ = new Point(IResizable(asset).width / 2,IResizable(asset).height / 2);
         }
         var _loc2_:Matrix = this.mat;
         _loc1_ = _loc2_.transformPoint(_loc1_);
         return _loc1_.y;
      }
      
      public function set x(param1:Number) : void
      {
         param1 = UtilMath.boundaryCheck(param1,AnimeConstants.SCREEN_X + this.width / 2,AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH - this.width / 2);
         if(asset is IMovable)
         {
            IMovable(asset).x = IMovable(asset).x + (param1 - this.x);
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
      }
      
      public function set y(param1:Number) : void
      {
         var _loc2_:Number = this.width / LicenseConstants.getScreenRatio();
         param1 = UtilMath.boundaryCheck(param1,this.screen_y + _loc2_ / 2,this.screen_y + this.screen_height - _loc2_ / 2);
         if(asset is IMovable)
         {
            IMovable(asset).y = IMovable(asset).y + (param1 - this.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         var _loc4_:Point = null;
         param1 = UtilMath.boundaryCheck(param1,AnimeConstants.SCREEN_X + this.width / 2,AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH - this.width / 2);
         var _loc3_:Number = this.width / LicenseConstants.getScreenRatio();
         param2 = UtilMath.boundaryCheck(param2,this.screen_y + _loc3_ / 2,this.screen_y + this.screen_height - _loc3_ / 2);
         if(asset is IMovable)
         {
            _loc4_ = new Point(param1 - this.x,param2 - this.y);
            IMovable(asset).move(IMovable(asset).x + _loc4_.x,IMovable(asset).y + _loc4_.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
      }
      
      private function get mat() : Matrix
      {
         var _loc1_:Matrix = new Matrix();
         if(asset is IMovable)
         {
            _loc1_.translate(IMovable(asset).x,IMovable(asset).y);
         }
         return _loc1_;
      }
   }
}
