package anifire.studio.models
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import flash.events.Event;
   
   public class VoiceTabSoundGroupCollection extends ProductGroupCollection
   {
      
      private static const RECENT_SOUND_ITEMS:int = 50;
       
      
      public var searchResult:SearchSoundCollection;
      
      protected var recentSounds:SoundCollection;
      
      public function VoiceTabSoundGroupCollection(param1:Array = null)
      {
         super(param1);
         this.searchResult = new SearchSoundCollection("Search Results");
         this.recentSounds = new SoundCollection("Recent",false);
         addCollection(this.searchResult);
         addCollection(this.recentSounds);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         if(!param1 || productKeys[param1.id])
         {
            return false;
         }
         if(param1.thumb is SoundThumb)
         {
            if(SoundThumb(param1.thumb).subType != AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER)
            {
               return false;
            }
         }
         if(this.recentSounds.length >= RECENT_SOUND_ITEMS)
         {
            if(!param2)
            {
               this.recentSounds.removeItemAt(this.recentSounds.length - 1);
               this.recentSounds.addProduct(param1,param2);
            }
         }
         else
         {
            this.recentSounds.addProduct(param1,param2);
         }
         this.searchResult.addProduct(param1,param2);
         registerProduct(param1);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      override public function removeAllProducts() : void
      {
         filterFunction = null;
         refresh();
         super.removeAllProducts();
         source = [];
         collections = new Vector.<ProductCollection>();
         this.searchResult.reset();
         addCollection(this.searchResult);
         addCollection(this.recentSounds);
         var _loc1_:ProductGroupCollectionEvent = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH);
         dispatchEvent(_loc1_);
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
   }
}
