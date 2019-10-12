package anifire.studio.assets.models
{
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.util.UtilMath;
   import flash.events.EventDispatcher;
   import flash.geom.Rectangle;
   
   public class AssetCollectionShadow extends EventDispatcher implements IMovable, IResizable
   {
       
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      public function AssetCollectionShadow()
      {
         super();
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set x(param1:Number) : void
      {
         if(param1 != this.x)
         {
            this._x = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(param1 != this.y)
         {
            this._y = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         if(param1 != this.x || param2 != this.y)
         {
            this._x = param1;
            this._y = param2;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_MOVED));
         }
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         if(param1 != this.width)
         {
            this._width = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
         }
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set height(param1:Number) : void
      {
         if(param1 != this.height)
         {
            this._height = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
         }
      }
      
      public function get minWidth() : Number
      {
         return 20;
      }
      
      public function get minHeight() : Number
      {
         return 20;
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
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param1 != this.width || param2 != this.height)
         {
            param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
            param2 = UtilMath.boundaryCheck(param2,this.minHeight,this.maxHeight);
            this._width = param1;
            this._height = param2;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED));
         }
      }
   }
}
