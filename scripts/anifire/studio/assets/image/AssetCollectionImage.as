package anifire.studio.assets.image
{
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.controllers.AssetCollectionController;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   
   public class AssetCollectionImage extends UIComponent
   {
       
      
      public function AssetCollectionImage()
      {
         super();
      }
      
      public function set collection(param1:AssetViewCollection) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:AssetCollectionController = null;
         var _loc4_:BitmapData = null;
         var _loc5_:Matrix = null;
         var _loc6_:IIterator = null;
         var _loc7_:IAssetView = null;
         var _loc8_:Asset = null;
         var _loc9_:Bitmap = null;
         if(param1)
         {
            _loc3_ = new AssetCollectionController(param1);
            _loc4_ = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
            _loc5_ = new Matrix();
            _loc5_.scale(1,1);
            _loc6_ = param1.iterator();
            while(_loc6_.hasNext)
            {
               _loc7_ = _loc6_.next as IAssetView;
               if(_loc7_)
               {
                  _loc8_ = _loc7_.asset;
                  _loc5_ = new Matrix();
                  if(_loc8_ is IMovable)
                  {
                     _loc5_.translate(-_loc3_.x + _loc3_.width / 2,-_loc3_.y + _loc3_.height / 2);
                  }
                  if(_loc7_ is IBitmapDrawable)
                  {
                     _loc4_.draw(_loc7_ as IBitmapDrawable,_loc5_);
                  }
               }
            }
            _loc9_ = new Bitmap(_loc4_,"auto",true);
            this.addChild(_loc9_);
         }
      }
   }
}
