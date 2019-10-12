package anifire.studio.models
{
   import anifire.studio.core.WidgetThumb;
   import anifire.studio.events.ProductGroupCollectionEvent;
   import anifire.studio.interfaces.IDivideExplorerProvider;
   import flash.events.Event;
   
   public class SwapWidgetExplorerCollection extends ProductGroupCollection implements IDivideExplorerProvider
   {
      
      public static const COMPATIBLE_CATEGORY_TEXT:String = "Compatible Vidgets";
      
      public static const INCOMPATIBLE_CATEGORY_TEXT:String = "Other Vidgets";
       
      
      public var compatibleWidgets:WidgetCollection;
      
      public var otherWidgets:WidgetCollection;
      
      protected var _targetCategory:String;
      
      public function SwapWidgetExplorerCollection(param1:Array = null)
      {
         super(param1);
         this.compatibleWidgets = new WidgetCollection(COMPATIBLE_CATEGORY_TEXT);
         this.otherWidgets = new WidgetCollection(INCOMPATIBLE_CATEGORY_TEXT);
         this.otherWidgets.sortOrder = -1;
         addCollection(this.compatibleWidgets);
         addCollection(this.otherWidgets);
      }
      
      public function get targetCategory() : String
      {
         return this._targetCategory;
      }
      
      public function set targetCategory(param1:String) : void
      {
         if(this._targetCategory != param1)
         {
            this._targetCategory = param1;
            this.compatibleWidgets.includeCategory(this._targetCategory);
            this.otherWidgets.excludeCategory(this._targetCategory);
         }
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc3_:WidgetThumb = param1.thumb as WidgetThumb;
         if(!_loc3_ || productKeys[_loc3_.chartType])
         {
            return false;
         }
         this.compatibleWidgets.addProduct(param1);
         this.otherWidgets.addProduct(param1);
         this.registerProduct(param1);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      override public function removeAllProducts() : void
      {
         super.removeAllProducts();
         source = [];
         collections = new Vector.<ProductCollection>();
         addCollection(this.compatibleWidgets);
         addCollection(this.otherWidgets);
         var _loc1_:ProductGroupCollectionEvent = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH);
         dispatchEvent(_loc1_);
      }
      
      public function get primaryCollection() : ProductCollection
      {
         return this.compatibleWidgets;
      }
      
      public function get secondaryCollection() : ProductCollection
      {
         return this.otherWidgets;
      }
      
      override protected function registerProduct(param1:ThumbModel) : void
      {
         var _loc2_:WidgetThumb = param1.thumb as WidgetThumb;
         if(_loc2_)
         {
            productKeys[_loc2_.chartType] = param1;
         }
      }
   }
}
