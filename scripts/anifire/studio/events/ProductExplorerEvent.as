package anifire.studio.events
{
   import anifire.studio.models.ProductCollection;
   import anifire.studio.models.ThumbModel;
   import flash.events.Event;
   
   public class ProductExplorerEvent extends Event
   {
      
      public static const PRODUCT_SELECTED:String = "productSelected";
      
      public static const CATEGORY_CHANGED:String = "productCategoryChanged";
      
      public static const SEARCHED:String = "productSearched";
      
      public static const PRODUCT_SEARCH_START:String = "productSearchStart";
      
      public static const SUBMITTED:String = "productSearchSubmitted";
       
      
      public var product:ThumbModel;
      
      public var collection:ProductCollection;
      
      public function ProductExplorerEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
