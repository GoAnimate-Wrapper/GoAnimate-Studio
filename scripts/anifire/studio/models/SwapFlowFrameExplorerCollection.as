package anifire.studio.models
{
   import anifire.studio.events.ProductGroupCollectionEvent;
   import flash.events.Event;
   import mx.events.PropertyChangeEvent;
   
   public class SwapFlowFrameExplorerCollection extends ProductGroupCollection
   {
       
      
      public var searchResult:SearchPropCollection;
      
      private var _28399476flowFrames:PropCollection;
      
      public function SwapFlowFrameExplorerCollection(param1:Array = null)
      {
         super(param1);
         this.searchResult = new SearchPropCollection("Search Results");
         this.flowFrames = new PropCollection("Image Frames");
         this.flowFrames.sortOrder = -1;
         this.flowFrames.productFilter = this.flowFrames.isFlowFrame;
         addCollection(this.searchResult);
         addCollection(this.flowFrames);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         if(productKeys[param1.id])
         {
            return false;
         }
         this.flowFrames.addProduct(param1);
         this.searchResult.addProduct(param1);
         registerProduct(param1);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      override public function removeAllProducts() : void
      {
         super.removeAllProducts();
         this.searchResult.reset();
         var _loc1_:ProductGroupCollectionEvent = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH);
         dispatchEvent(_loc1_);
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
      
      [Bindable(event="propertyChange")]
      public function get flowFrames() : PropCollection
      {
         return this._28399476flowFrames;
      }
      
      public function set flowFrames(param1:PropCollection) : void
      {
         var _loc2_:Object = this._28399476flowFrames;
         if(_loc2_ !== param1)
         {
            this._28399476flowFrames = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"flowFrames",_loc2_,param1));
            }
         }
      }
   }
}
