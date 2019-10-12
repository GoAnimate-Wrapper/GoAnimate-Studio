package anifire.studio.assets.image
{
   import anifire.studio.core.Asset;
   import anifire.util.UtilPlain;
   import flash.display.BlendMode;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import spark.core.SpriteVisualElement;
   
   public class AssetImageBase extends SpriteVisualElement
   {
       
      
      protected var _asset:Asset;
      
      protected var _origin:Point;
      
      protected var _rect:Rectangle;
      
      public function AssetImageBase()
      {
         this._origin = new Point(100,0);
         this._rect = new Rectangle();
         super();
         blendMode = BlendMode.LAYER;
      }
      
      public function destroy(param1:String = "rip") : void
      {
      }
      
      protected function dispatchImageReady() : void
      {
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function goToAndPause(param1:Number) : void
      {
         this.pause();
      }
      
      public function pause() : void
      {
         UtilPlain.gotoAndStopFamilyAt1(this);
      }
      
      public function resume() : void
      {
         UtilPlain.playFamily(this);
      }
      
      public function get asset() : Asset
      {
         return null;
      }
      
      public function set asset(param1:Asset) : void
      {
         this._asset = param1;
      }
      
      public function get rect() : Rectangle
      {
         return this._rect;
      }
      
      public function get thumbnailRect() : Rectangle
      {
         return this._rect;
      }
   }
}
