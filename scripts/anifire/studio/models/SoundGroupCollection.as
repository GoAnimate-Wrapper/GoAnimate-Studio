package anifire.studio.models
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import flash.events.Event;
   
   public class SoundGroupCollection extends ProductGroupCollection
   {
      
      public static const CATEGORY_NAME_MUSIC:String = "Music";
      
      public static const CATEGORY_NAME_SOUND_EFFECTS:String = "Sound Effects";
       
      
      public var searchResult:SearchSoundCollection;
      
      protected var musicSounds:SoundCollection;
      
      protected var effectSounds:SoundCollection;
      
      public function SoundGroupCollection(param1:Array = null)
      {
         super(param1);
         this.searchResult = new SearchSoundCollection("Search Results");
         this.musicSounds = new SoundCollection(CATEGORY_NAME_MUSIC);
         this.effectSounds = new SoundCollection(CATEGORY_NAME_SOUND_EFFECTS);
         addCollection(this.searchResult);
         addCollection(this.musicSounds);
         addCollection(this.effectSounds);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc3_:SoundThumb = param1.thumb as SoundThumb;
         switch(_loc3_.subType)
         {
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC:
               this.musicSounds.addProduct(param1);
               break;
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:
               this.effectSounds.addProduct(param1);
               break;
            default:
               return false;
         }
         this.searchResult.addProduct(param1);
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
         addCollection(this.musicSounds);
         addCollection(this.effectSounds);
         var _loc1_:ProductGroupCollectionEvent = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH);
         dispatchEvent(_loc1_);
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
   }
}
