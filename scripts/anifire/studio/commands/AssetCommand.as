package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IMotion;
   
   public class AssetCommand extends SceneCommand
   {
       
      
      protected var _assetId:String;
      
      protected var _isShadow:Boolean = false;
      
      public function AssetCommand(param1:Asset, param2:Boolean = true)
      {
         super(param2);
         _type = "AssetCommand";
         if(param1)
         {
            this._assetId = param1.id;
         }
         if(param1 is IMotion)
         {
            this._isShadow = (param1 as IMotion).isShadow;
         }
      }
      
      protected function get asset() : Asset
      {
         var _loc1_:Asset = null;
         if(this.scene)
         {
            _loc1_ = this.scene.getAssetById(this._assetId);
            if(this._isShadow && _loc1_ is IMotion)
            {
               _loc1_ = (_loc1_ as IMotion).shadow as Asset;
            }
            return _loc1_;
         }
         return null;
      }
   }
}
