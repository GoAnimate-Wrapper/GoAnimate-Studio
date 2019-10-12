package anifire.studio.components
{
   import anifire.studio.models.ProductCollection;
   import anifire.studio.skins.UserBackgroundExplorerSkin;
   
   public class UserBackgroundExplorer extends ProductExplorer
   {
       
      
      public function UserBackgroundExplorer()
      {
         super();
         setStyle("skinClass",UserBackgroundExplorerSkin);
      }
      
      override protected function validCategoryFilter(param1:Object) : Boolean
      {
         var _loc2_:ProductCollection = param1 as ProductCollection;
         return _loc2_ && _loc2_ != searchCollection && _loc2_.valid;
      }
   }
}
