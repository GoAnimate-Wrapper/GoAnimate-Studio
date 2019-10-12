package anifire.studio.models
{
   import anifire.studio.events.ProductCollectionEvent;
   import anifire.util.UtilString;
   import mx.collections.ArrayCollection;
   import mx.core.IFactory;
   import mx.events.PropertyChangeEvent;
   import spark.collections.Sort;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class ProductCollection extends ArrayCollection
   {
       
      
      private var _575508747_thumbCategory:ThumbCategory;
      
      private var _426048681categoryName:String;
      
      private var _1109722326layout:LayoutBase;
      
      private var _133586166itemRenderer:IFactory;
      
      public var listSkinClass:Class;
      
      private var _738113884iconName:String = "";
      
      private var _858518010emptyMessage:String;
      
      private var _111972348valid:Boolean = true;
      
      public var productFilter:Function;
      
      public var isLazyLoad:Boolean;
      
      public var sortOrder:int;
      
      protected var _label:String;
      
      protected var _productSort:Sort;
      
      protected var _placeHolderCount:int;
      
      private var _1097452790locked:Boolean;
      
      private var _isSeparator:Boolean;
      
      public function ProductCollection(param1:String, param2:Array = null)
      {
         super(param2);
         this.categoryName = param1;
         this.label = UtilString.firstLetterToUpperCase(param1);
      }
      
      public function get thumbCategory() : ThumbCategory
      {
         return this._thumbCategory;
      }
      
      public function set thumbCategory(param1:ThumbCategory) : void
      {
         if(param1 != this._thumbCategory)
         {
            this._thumbCategory = param1;
         }
      }
      
      public function get properProductCount() : int
      {
         return !!this.isProperCollection?int(length):0;
      }
      
      public function addProductIfAppropriate(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         if(this.productFilter != null && param1 && this.productFilter(param1))
         {
            this.addProduct(param1,param2);
            return true;
         }
         return false;
      }
      
      public function addProduct(param1:ThumbModel, param2:Boolean = true) : void
      {
         var _loc3_:int = !!param2?int(length):int(this._placeHolderCount);
         addItemAt(param1,_loc3_);
         if(param1.thumb && !param1.thumb.categoryName)
         {
            param1.thumb.categoryName = this.categoryName;
         }
      }
      
      public function removeProductById(param1:String) : Boolean
      {
         var _loc3_:ThumbModel = null;
         var _loc2_:int = 0;
         while(_loc2_ < length)
         {
            _loc3_ = getItemAt(_loc2_) as ThumbModel;
            if(_loc3_.id == param1)
            {
               removeItemAt(_loc2_);
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get isProperCollection() : Boolean
      {
         return true;
      }
      
      public function get isMeta() : Boolean
      {
         return false;
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         if(this.thumbCategory)
         {
            return this.thumbCategory.displayName;
         }
         return this._label;
      }
      
      private function set _102727412label(param1:String) : void
      {
         if(this._label != param1)
         {
            this._label = param1;
         }
      }
      
      public function sortProducts() : void
      {
         this.sort = this._productSort;
         refresh();
      }
      
      public function get isSeparator() : Boolean
      {
         return this._isSeparator;
      }
      
      public function set isSeparator(param1:Boolean) : void
      {
         if(this._isSeparator != param1)
         {
            this._isSeparator = param1;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get isFavorited() : Boolean
      {
         if(this.thumbCategory)
         {
            return this.thumbCategory.isFavorited;
         }
         return false;
      }
      
      private function set _606819266isFavorited(param1:Boolean) : void
      {
         if(this.thumbCategory)
         {
            this.thumbCategory.setFavorite(param1);
         }
         dispatchEvent(new ProductCollectionEvent(!!param1?ProductCollectionEvent.FAVORITED_CATEGORY_ADD:ProductCollectionEvent.FAVORITED_CATEGORY_REMOVE));
      }
      
      [Bindable(event="propertyChange")]
      public function get isFeatured() : Boolean
      {
         if(this.thumbCategory)
         {
            return this.thumbCategory.isFeatured;
         }
         return false;
      }
      
      private function set _1083929736isFeatured(param1:Boolean) : void
      {
         if(this.thumbCategory)
         {
            this.thumbCategory.setFeatured(param1);
         }
         dispatchEvent(new ProductCollectionEvent(!!param1?ProductCollectionEvent.FEATURED_CATEGORY_ADD:ProductCollectionEvent.FEATURED_CATEGORY_REMOVE));
      }
      
      public function get description() : String
      {
         if(this.thumbCategory)
         {
            return this.thumbCategory.description;
         }
         return null;
      }
      
      public function get iconUrl() : String
      {
         if(this.thumbCategory)
         {
            return this.thumbCategory.iconUrl;
         }
         return null;
      }
      
      [Bindable(event="propertyChange")]
      private function get _thumbCategory() : ThumbCategory
      {
         return this._575508747_thumbCategory;
      }
      
      private function set _thumbCategory(param1:ThumbCategory) : void
      {
         var _loc2_:Object = this._575508747_thumbCategory;
         if(_loc2_ !== param1)
         {
            this._575508747_thumbCategory = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_thumbCategory",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get categoryName() : String
      {
         return this._426048681categoryName;
      }
      
      public function set categoryName(param1:String) : void
      {
         var _loc2_:Object = this._426048681categoryName;
         if(_loc2_ !== param1)
         {
            this._426048681categoryName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"categoryName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get layout() : LayoutBase
      {
         return this._1109722326layout;
      }
      
      public function set layout(param1:LayoutBase) : void
      {
         var _loc2_:Object = this._1109722326layout;
         if(_loc2_ !== param1)
         {
            this._1109722326layout = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layout",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemRenderer() : IFactory
      {
         return this._133586166itemRenderer;
      }
      
      public function set itemRenderer(param1:IFactory) : void
      {
         var _loc2_:Object = this._133586166itemRenderer;
         if(_loc2_ !== param1)
         {
            this._133586166itemRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemRenderer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconName() : String
      {
         return this._738113884iconName;
      }
      
      public function set iconName(param1:String) : void
      {
         var _loc2_:Object = this._738113884iconName;
         if(_loc2_ !== param1)
         {
            this._738113884iconName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get emptyMessage() : String
      {
         return this._858518010emptyMessage;
      }
      
      public function set emptyMessage(param1:String) : void
      {
         var _loc2_:Object = this._858518010emptyMessage;
         if(_loc2_ !== param1)
         {
            this._858518010emptyMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"emptyMessage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get valid() : Boolean
      {
         return this._111972348valid;
      }
      
      public function set valid(param1:Boolean) : void
      {
         var _loc2_:Object = this._111972348valid;
         if(_loc2_ !== param1)
         {
            this._111972348valid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"valid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get locked() : Boolean
      {
         return this._1097452790locked;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var _loc2_:Object = this._1097452790locked;
         if(_loc2_ !== param1)
         {
            this._1097452790locked = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"locked",_loc2_,param1));
            }
         }
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this.label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
      
      public function set isFavorited(param1:Boolean) : void
      {
         var _loc2_:Object = this.isFavorited;
         if(_loc2_ !== param1)
         {
            this._606819266isFavorited = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isFavorited",_loc2_,param1));
            }
         }
      }
      
      public function set isFeatured(param1:Boolean) : void
      {
         var _loc2_:Object = this.isFeatured;
         if(_loc2_ !== param1)
         {
            this._1083929736isFeatured = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isFeatured",_loc2_,param1));
            }
         }
      }
   }
}
