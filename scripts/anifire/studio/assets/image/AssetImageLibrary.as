package anifire.studio.assets.image
{
   import anifire.studio.assets.image.library.IReusableObject;
   import anifire.studio.assets.image.library.ReusableObjectLibrary;
   import anifire.studio.core.Action;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.Character;
   import anifire.studio.core.Prop;
   
   public class AssetImageLibrary implements IAssetImageProvider
   {
       
      
      private var _factory:AssetImageFactory;
      
      private var _library:ReusableObjectLibrary;
      
      private var _enabled:Boolean;
      
      public function AssetImageLibrary()
      {
         this._factory = new AssetImageFactory();
         this._library = new ReusableObjectLibrary();
         super();
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
         }
      }
      
      public function getImage(param1:Asset) : AssetImageBase
      {
         return this.borrowImage(param1);
      }
      
      private function borrowImage(param1:Asset) : AssetImageBase
      {
         var _loc2_:String = null;
         var _loc3_:AssetImageBase = null;
         if(!this._enabled)
         {
            return this._factory.getImage(param1);
         }
         if(param1 is Prop)
         {
            _loc2_ = "prop" + (param1 as Prop).fileId;
         }
         else if(param1 is Background)
         {
            _loc2_ = "bg" + (param1.thumb as BackgroundThumb).aid;
         }
         else if(param1 is Character)
         {
            _loc2_ = "character" + ((param1 as Character).action as Action).getKey();
         }
         if(_loc2_)
         {
            _loc3_ = this._library.borrowObject(_loc2_) as AssetImageBase;
            if(!_loc3_)
            {
               _loc3_ = this._factory.getImage(param1);
               if(this._library.addObject(_loc3_ as IReusableObject,_loc2_))
               {
                  _loc3_ = this._library.borrowObject(_loc2_) as AssetImageBase;
               }
            }
            return _loc3_;
         }
         return this._factory.getImage(param1);
      }
      
      public function returnAllImages() : void
      {
         if(this._enabled)
         {
            this._library.returnAllObjects();
         }
      }
      
      public function destroyAllImages() : void
      {
         if(this._enabled)
         {
            this._library.destroy();
            this._library = new ReusableObjectLibrary();
         }
      }
   }
}
