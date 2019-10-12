package anifire.studio.events
{
   import anifire.studio.models.ProductCollection;
   import flash.events.Event;
   
   public class ProductGroupCollectionEvent extends Event
   {
      
      public static const PRODUCT_GROUP_ADDED:String = "productGroupAdded";
      
      public static const PRODUCT_GROUP_REMOVED:String = "productGroupRemoved";
      
      public static const PRODUCT_GROUP_REFRESH:String = "productGroupRefresh";
      
      public static const FAVORITED_COLLECTION_REFRESH:String = "favoritedCollectionRefresh";
      
      public static const THEME_CHAR_COMPLETE:String = "themeCharComplete";
      
      public static const THEME_CHAR_ERROR:String = "themeCharError";
      
      public static const PRODUCT_SEARCHED:String = "productSearched";
       
      
      public var collection:ProductCollection;
      
      public function ProductGroupCollectionEvent(param1:String, param2:ProductCollection = null)
      {
         super(param1);
         this.collection = param2;
      }
   }
}
