package anifire.studio.models
{
   import flash.events.Event;
   import mx.events.PropertyChangeEvent;
   
   public class WidgetExplorerCollection extends ProductGroupCollection
   {
      
      public static var categoryPattern:RegExp = /^cat:(.+)$/;
       
      
      private var _1340337839widgets:PropCollection;
      
      protected var categoryList:Object;
      
      protected var productCategoryLookup:Object;
      
      public function WidgetExplorerCollection(param1:Array = null)
      {
         super(param1);
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.widgets = new PropCollection("Vidgets");
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         if(productKeys[param1.id])
         {
            return false;
         }
         this.widgets.addProduct(param1,param2);
         registerProduct(param1);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      [Bindable(event="propertyChange")]
      public function get widgets() : PropCollection
      {
         return this._1340337839widgets;
      }
      
      public function set widgets(param1:PropCollection) : void
      {
         var _loc2_:Object = this._1340337839widgets;
         if(_loc2_ !== param1)
         {
            this._1340337839widgets = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widgets",_loc2_,param1));
            }
         }
      }
   }
}
