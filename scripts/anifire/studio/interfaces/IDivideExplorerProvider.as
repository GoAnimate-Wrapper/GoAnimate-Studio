package anifire.studio.interfaces
{
   import anifire.studio.models.ProductCollection;
   
   public interface IDivideExplorerProvider
   {
       
      
      function get primaryCollection() : ProductCollection;
      
      function get secondaryCollection() : ProductCollection;
   }
}
