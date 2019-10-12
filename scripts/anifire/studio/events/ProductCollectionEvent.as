package anifire.studio.events
{
   import flash.events.Event;
   
   public class ProductCollectionEvent extends Event
   {
      
      public static const FAVORITED_CATEGORY_ADD:String = "favoritedCategoryAdd";
      
      public static const FAVORITED_CATEGORY_REMOVE:String = "favoritedCategoryRemove";
      
      public static const FEATURED_CATEGORY_ADD:String = "featuredStatusAdd";
      
      public static const FEATURED_CATEGORY_REMOVE:String = "featuredStatusRemove";
       
      
      public function ProductCollectionEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
