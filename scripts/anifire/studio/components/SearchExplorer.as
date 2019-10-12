package anifire.studio.components
{
   import anifire.studio.models.ProductCollection;
   import anifire.studio.skins.SearchExplorerSkin;
   
   public class SearchExplorer extends ProductExplorer
   {
       
      
      public function SearchExplorer()
      {
         super();
         setStyle("skinClass",SearchExplorerSkin);
      }
      
      override public function set selectedCollection(param1:ProductCollection) : void
      {
         super.selectedCollection = param1;
         if(param1)
         {
            if(param1.itemRenderer)
            {
               productRenderer = param1.itemRenderer;
            }
            if(param1.layout)
            {
               productLayout = param1.layout;
            }
         }
      }
      
      override public function hideInvalidCategories() : void
      {
      }
      
      public function clearAllBackgroundThumbState() : void
      {
         var _loc1_:int = 0;
         var _loc2_:BackgroundThumbRenderer = null;
         if(productList && productList.dataProvider)
         {
            _loc1_ = 0;
            while(_loc1_ < productList.dataProvider.length)
            {
               _loc2_ = productList.dataGroup.getElementAt(_loc1_) as BackgroundThumbRenderer;
               if(_loc2_)
               {
                  _loc2_.selected = false;
               }
               _loc1_++;
            }
         }
      }
   }
}
