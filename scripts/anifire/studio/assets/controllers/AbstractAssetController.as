package anifire.studio.assets.controllers
{
   import anifire.studio.assets.image.AssetImageBase;
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AbstractAssetController extends EventDispatcher implements IAssetController
   {
       
      
      private var _view:IAssetView;
      
      private var _asset:Asset;
      
      private var _center:Point;
      
      public function AbstractAssetController(param1:IAssetView, param2:IEventDispatcher = null)
      {
         this._center = new Point(0,0);
         super(param2);
         this._view = param1;
         this._asset = param1.asset;
      }
      
      protected function get centerX() : Number
      {
         return this._center.x;
      }
      
      protected function get centerY() : Number
      {
         return this._center.y;
      }
      
      public function get view() : IAssetView
      {
         if(this._view == null)
         {
            throw new Error("This object has been destroyed, but this is still being refered and used somewhere else, find it out!!!");
         }
         return this._view;
      }
      
      public function get asset() : Asset
      {
         if(this._asset == null)
         {
            throw new Error("This object has been destroyed, but this is still being refered and used somewhere else, find it out!!!");
         }
         return this._asset;
      }
      
      public function destroy(param1:String = "rip") : void
      {
         this._view = null;
         this._asset = null;
      }
      
      public function set view(param1:IAssetView) : void
      {
         var _loc2_:Rectangle = null;
         this._view = param1;
         this._asset = param1.asset;
         if(param1 && param1.assetImage is AssetImageBase)
         {
            _loc2_ = AssetImageBase(this.view.assetImage).rect;
            if(_loc2_)
            {
               this._center.x = _loc2_.x + _loc2_.width / 2;
               this._center.y = _loc2_.y + _loc2_.height / 2;
            }
         }
      }
      
      public function get referenceX() : Number
      {
         if(this.asset is IReferencePoint)
         {
            return IReferencePoint(this.asset).referenceX;
         }
         return 0;
      }
      
      public function get referenceY() : Number
      {
         if(this.asset is IReferencePoint)
         {
            return IReferencePoint(this.asset).referenceY;
         }
         return 0;
      }
      
      public function set referenceX(param1:Number) : void
      {
         if(this.asset is IReferencePoint)
         {
            IReferencePoint(this.asset).referenceX = param1;
         }
      }
      
      public function set referenceY(param1:Number) : void
      {
         if(this.asset is IReferencePoint)
         {
            IReferencePoint(this.asset).referenceY = param1;
         }
      }
      
      public function setReferencePoint(param1:Number, param2:Number) : void
      {
         if(this.asset is IReferencePoint)
         {
            IReferencePoint(this.asset).setReferencePoint(param1,param2);
         }
      }
   }
}
