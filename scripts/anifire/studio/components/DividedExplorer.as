package anifire.studio.components
{
   import anifire.studio.events.ProductExplorerEvent;
   import anifire.studio.interfaces.IDivideExplorerProvider;
   import anifire.studio.models.ProductCollection;
   import anifire.studio.models.ThumbModel;
   import anifire.studio.skins.DividedExplorerSkin;
   import mx.core.IFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.List;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.events.IndexChangeEvent;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class DividedExplorer extends SkinnableComponent
   {
       
      
      [SkinPart(required="true")]
      public var primaryList:List;
      
      [SkinPart(required="true")]
      public var secondaryList:List;
      
      protected var _productProvider:IDivideExplorerProvider;
      
      protected var _productLayout:LayoutBase;
      
      protected var _productRenderer:IFactory;
      
      protected var _selectedCollection:ProductCollection;
      
      protected var lastSelectedCollection:ProductCollection;
      
      protected var _loading:Boolean = false;
      
      private var _1581674429allowSelection:Boolean;
      
      private var _874357292selectedProduct:ThumbModel;
      
      public function DividedExplorer()
      {
         super();
         setStyle("skinClass",DividedExplorerSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get loading() : Boolean
      {
         return this._loading;
      }
      
      private function set _336650556loading(param1:Boolean) : void
      {
         if(this._loading != param1)
         {
            this._loading = param1;
            invalidateSkinState();
         }
      }
      
      public function get productRenderer() : IFactory
      {
         return this._productRenderer;
      }
      
      public function set productRenderer(param1:IFactory) : void
      {
         if(this._productRenderer != param1)
         {
            this._productRenderer = param1;
            if(this.primaryList)
            {
               this.primaryList.itemRenderer = this._productRenderer;
            }
            if(this.secondaryList)
            {
               this.secondaryList.itemRenderer = this._productRenderer;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productProvider() : IDivideExplorerProvider
      {
         return this._productProvider;
      }
      
      private function set _840706048productProvider(param1:IDivideExplorerProvider) : void
      {
         if(this._productProvider != param1)
         {
            this._productProvider = param1;
            if(param1)
            {
               if(this.primaryList)
               {
                  this.primaryList.dataProvider = param1.primaryCollection;
               }
               if(this.secondaryList)
               {
                  this.secondaryList.dataProvider = param1.secondaryCollection;
               }
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get productLayout() : LayoutBase
      {
         return this._productLayout;
      }
      
      private function set _825623801productLayout(param1:LayoutBase) : void
      {
         if(this._productLayout != param1)
         {
            this._productLayout = param1;
            if(param1)
            {
               if(this.primaryList)
               {
                  this.primaryList.layout = this._productLayout;
               }
               if(this.secondaryList)
               {
                  this.secondaryList.layout = this._productLayout;
               }
            }
         }
      }
      
      protected function onProductSelected(param1:IndexChangeEvent) : void
      {
         var _loc2_:List = null;
         var _loc3_:ProductExplorerEvent = null;
         if(this.allowSelection)
         {
            _loc2_ = param1.currentTarget as List;
            this.selectedProduct = _loc2_.selectedItem as ThumbModel;
            _loc3_ = new ProductExplorerEvent(ProductExplorerEvent.PRODUCT_SELECTED);
            _loc3_.collection = _loc2_.dataProvider as ProductCollection;
            _loc3_.product = this.selectedProduct;
            _loc2_.selectedIndex = -1;
            dispatchEvent(_loc3_);
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.primaryList)
         {
            this.primaryList.addEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
            this.primaryList.itemRenderer = this.productRenderer;
            if(this._productLayout)
            {
               this.primaryList.layout = this._productLayout;
            }
            if(this._productProvider)
            {
               this.primaryList.dataProvider = this._productProvider.primaryCollection;
            }
         }
         else if(param2 == this.secondaryList)
         {
            this.secondaryList.addEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
            this.secondaryList.itemRenderer = this.productRenderer;
            if(this._productLayout)
            {
               this.secondaryList.layout = this._productLayout;
            }
            if(this._productProvider)
            {
               this.secondaryList.dataProvider = this._productProvider.secondaryCollection;
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.primaryList)
         {
            this.primaryList.removeEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
         }
         else if(param2 == this.secondaryList)
         {
            this.secondaryList.removeEventListener(IndexChangeEvent.CHANGE,this.onProductSelected);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectedProduct() : ThumbModel
      {
         return this._874357292selectedProduct;
      }
      
      public function set selectedProduct(param1:ThumbModel) : void
      {
         var _loc2_:Object = this._874357292selectedProduct;
         if(_loc2_ !== param1)
         {
            this._874357292selectedProduct = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectedProduct",_loc2_,param1));
            }
         }
      }
      
      public function set loading(param1:Boolean) : void
      {
         var _loc2_:Object = this.loading;
         if(_loc2_ !== param1)
         {
            this._336650556loading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
            }
         }
      }
      
      public function set productProvider(param1:IDivideExplorerProvider) : void
      {
         var _loc2_:Object = this.productProvider;
         if(_loc2_ !== param1)
         {
            this._840706048productProvider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productProvider",_loc2_,param1));
            }
         }
      }
      
      public function set productLayout(param1:LayoutBase) : void
      {
         var _loc2_:Object = this.productLayout;
         if(_loc2_ !== param1)
         {
            this._825623801productLayout = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"productLayout",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowSelection() : Boolean
      {
         return this._1581674429allowSelection;
      }
      
      public function set allowSelection(param1:Boolean) : void
      {
         var _loc2_:Object = this._1581674429allowSelection;
         if(_loc2_ !== param1)
         {
            this._1581674429allowSelection = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowSelection",_loc2_,param1));
            }
         }
      }
   }
}
