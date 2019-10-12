package anifire.studio.core
{
   import anifire.studio.assets.models.AssetTransition;
   
   public class CopiedAssets
   {
       
      
      private var _copiedAssets:Vector.<Asset>;
      
      private var _copiedAssetTransitions:Vector.<AssetTransition>;
      
      public function CopiedAssets()
      {
         this._copiedAssets = new Vector.<Asset>();
         this._copiedAssetTransitions = new Vector.<AssetTransition>();
         super();
      }
      
      public function reset() : void
      {
         this._copiedAssets.length = 0;
         this._copiedAssetTransitions.length = 0;
      }
      
      public function get length() : uint
      {
         return this._copiedAssets.length;
      }
      
      public function addAsset(param1:Asset) : void
      {
         if(param1)
         {
            this._copiedAssets.push(param1);
         }
      }
      
      public function addAssetTransition(param1:AssetTransition) : void
      {
         if(param1)
         {
            this._copiedAssetTransitions.push(param1);
         }
      }
      
      public function get assets() : Vector.<Asset>
      {
         return this._copiedAssets;
      }
      
      public function get assetTransitions() : Vector.<AssetTransition>
      {
         return this._copiedAssetTransitions;
      }
   }
}
