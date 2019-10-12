package anifire.studio.models
{
   import anifire.studio.components.FolderThumbRenderer;
   import anifire.studio.skins.FolderProductListSkin;
   import mx.core.ClassFactory;
   
   public class FolderCollection extends ProductCollection
   {
       
      
      public function FolderCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         itemRenderer = new ClassFactory(FolderThumbRenderer);
         listSkinClass = FolderProductListSkin;
      }
      
      public function isFolder(param1:ThumbModel) : Boolean
      {
         return param1.isFolder;
      }
   }
}
