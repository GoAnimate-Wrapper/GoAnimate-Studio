package anifire.studio.models
{
   import anifire.studio.events.ProductGroupCollectionEvent;
   import flash.events.Event;
   import mx.events.PropertyChangeEvent;
   
   public class PropExplorerCollection extends ProductGroupCollection
   {
      
      public static const CATEGORY_NAME_FLOW_FRAME:String = "Screens & frames";
      
      public static const CATEGORY_NAME_PROPS:String = "Props";
      
      public static const CATEGORY_NAME_HANDHELD:String = "Handheld";
      
      public static const CATEGORY_NAME_HEAD:String = "Head";
      
      public static const CATEGORY_NAME_HEAD_GEAR:String = "Head Gear";
      
      public static const CATEGORY_NAME_VIDGETS:String = "Vidgets";
      
      public static const CATEGORY_NAME_PPT:String = "PPT Imports";
      
      public static var categoryPattern:RegExp = /^cat:(.+)$/;
       
      
      public var searchResult:SearchPropCollection;
      
      private var _38667841handProps:PropCollection;
      
      private var _232671376headProps:PropCollection;
      
      private var _1294201055headGearProps:PropCollection;
      
      private var _196131776otherProps:PropCollection;
      
      private var _28399476flowFrames:PropCollection;
      
      private var _1340337839widgets:PropCollection;
      
      private var _683249211folders:FolderCollection;
      
      public var autoGrouping:Boolean = true;
      
      protected var categoryList:Object;
      
      protected var productCategoryLookup:Object;
      
      public function PropExplorerCollection(param1:Array = null)
      {
         super(param1);
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.searchResult = new SearchPropCollection("Search Results");
         this.flowFrames = new PropCollection(CATEGORY_NAME_FLOW_FRAME);
         this.flowFrames.productFilter = this.flowFrames.isFlowFrame;
         this.otherProps = new PropCollection(CATEGORY_NAME_PROPS);
         this.otherProps.sortOrder = -1;
         this.otherProps.productFilter = this.otherProps.isNonSpecialProp;
         this.handProps = new PropCollection(CATEGORY_NAME_HANDHELD);
         this.handProps.iconName = "handprop";
         this.handProps.productFilter = this.handProps.isHandProp;
         this.headProps = new PropCollection(CATEGORY_NAME_HEAD);
         this.headProps.productFilter = this.headProps.isHeadProp;
         this.headGearProps = new PropCollection(CATEGORY_NAME_HEAD_GEAR);
         this.headGearProps.iconName = "headgearprop";
         this.headGearProps.productFilter = this.headGearProps.isHeadGearProp;
         this.widgets = new PropCollection(CATEGORY_NAME_VIDGETS);
         this.widgets.productFilter = this.otherProps.isWidget;
         this.widgets.valid = false;
         this.folders = new FolderCollection(CATEGORY_NAME_PPT);
         this.folders.productFilter = this.folders.isFolder;
         addCollection(this.searchResult);
         addCollection(this.otherProps);
         addCollection(this.flowFrames);
         addCollection(this.widgets);
         addCollection(this.handProps);
         addCollection(this.headProps);
         addCollection(this.headGearProps);
         addCollection(this.folders);
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:PropCollection = null;
         var _loc8_:int = 0;
         if(productKeys[param1.id])
         {
            return false;
         }
         var _loc3_:int = 0;
         if(this.autoGrouping)
         {
            _loc5_ = param1.thumb.sysTags;
            _loc8_ = 0;
            while(_loc8_ < _loc5_.length)
            {
               _loc6_ = categoryPattern.exec(_loc5_[_loc8_]);
               if(_loc6_)
               {
                  _loc7_ = this.getPropCategoryCollection(_loc6_[1]);
                  _loc7_.addProduct(param1);
                  _loc3_++;
               }
               _loc8_++;
            }
         }
         if(_loc3_ == 0)
         {
            _loc4_ = super.addProduct(param1,param2);
         }
         else
         {
            _loc4_ = true;
         }
         if(_loc4_)
         {
            if(!param1.isFolder)
            {
               this.searchResult.addProduct(param1);
            }
            registerProduct(param1);
            dispatchEvent(new Event(Event.CHANGE));
         }
         return _loc4_;
      }
      
      protected function getPropCategoryCollection(param1:String) : PropCollection
      {
         var _loc3_:ProductGroupCollectionEvent = null;
         var _loc2_:PropCollection = this.categoryList[param1];
         if(!_loc2_)
         {
            _loc2_ = new PropCollection(param1);
            _loc2_.sortOrder = 1;
            this.categoryList[param1] = _loc2_;
            addCollection(_loc2_);
            _loc3_ = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_ADDED);
            _loc3_.collection = _loc2_;
            dispatchEvent(_loc3_);
         }
         return _loc2_;
      }
      
      override public function removeAllProducts() : void
      {
         super.removeAllProducts();
         source = [];
         collections = new Vector.<ProductCollection>();
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.searchResult.reset();
         addCollection(this.searchResult);
         addCollection(this.otherProps);
         addCollection(this.handProps);
         addCollection(this.headProps);
         addCollection(this.headGearProps);
         addCollection(this.folders);
         var _loc1_:ProductGroupCollectionEvent = new ProductGroupCollectionEvent(ProductGroupCollectionEvent.PRODUCT_GROUP_REFRESH);
         dispatchEvent(_loc1_);
      }
      
      public function filterPropCategory(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.handProps.valid = param1;
         this.headProps.valid = param3;
         this.headGearProps.valid = param2;
      }
      
      override protected function registerProductCollection(param1:ThumbModel, param2:ProductCollection) : void
      {
         this.productCategoryLookup[param1.id] = param2;
      }
      
      override public function getCategoryByProductId(param1:String) : ProductCollection
      {
         return this.productCategoryLookup[param1];
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
      
      public function getWidgetCollection() : PropCollection
      {
         return this.widgets;
      }
      
      [Bindable(event="propertyChange")]
      public function get handProps() : PropCollection
      {
         return this._38667841handProps;
      }
      
      public function set handProps(param1:PropCollection) : void
      {
         var _loc2_:Object = this._38667841handProps;
         if(_loc2_ !== param1)
         {
            this._38667841handProps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"handProps",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headProps() : PropCollection
      {
         return this._232671376headProps;
      }
      
      public function set headProps(param1:PropCollection) : void
      {
         var _loc2_:Object = this._232671376headProps;
         if(_loc2_ !== param1)
         {
            this._232671376headProps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headProps",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headGearProps() : PropCollection
      {
         return this._1294201055headGearProps;
      }
      
      public function set headGearProps(param1:PropCollection) : void
      {
         var _loc2_:Object = this._1294201055headGearProps;
         if(_loc2_ !== param1)
         {
            this._1294201055headGearProps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headGearProps",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get otherProps() : PropCollection
      {
         return this._196131776otherProps;
      }
      
      public function set otherProps(param1:PropCollection) : void
      {
         var _loc2_:Object = this._196131776otherProps;
         if(_loc2_ !== param1)
         {
            this._196131776otherProps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"otherProps",_loc2_,param1));
            }
         }
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
      
      [Bindable(event="propertyChange")]
      public function get folders() : FolderCollection
      {
         return this._683249211folders;
      }
      
      public function set folders(param1:FolderCollection) : void
      {
         var _loc2_:Object = this._683249211folders;
         if(_loc2_ !== param1)
         {
            this._683249211folders = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"folders",_loc2_,param1));
            }
         }
      }
   }
}
