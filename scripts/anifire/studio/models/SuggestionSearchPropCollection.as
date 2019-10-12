package anifire.studio.models
{
   import anifire.constant.ThemeConstants;
   import anifire.studio.components.PropThumbRenderer;
   import anifire.studio.core.PropThumb;
   import mx.core.ClassFactory;
   import mx.utils.StringUtil;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.layouts.TileLayout;
   
   public class SuggestionSearchPropCollection extends SearchCollection
   {
       
      
      private var _sortByThemeOrder:Vector.<String>;
      
      public function SuggestionSearchPropCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         var _loc3_:TileLayout = new TileLayout();
         _loc3_.useVirtualLayout = true;
         _loc3_.horizontalGap = 2;
         _loc3_.verticalGap = 5;
         _loc3_.paddingRight = 3;
         _loc3_.columnAlign = "justifyUsingGap";
         _loc3_.orientation = "rows";
         layout = _loc3_;
         itemRenderer = new ClassFactory(PropThumbRenderer);
         this._sortByThemeOrder = new <String>[ThemeConstants.BUSINESS_THEME_ID,ThemeConstants.WHITEBOARD_THEME_ID,ThemeConstants.INFOGRAPHICS_THEME_ID,ThemeConstants.COMMON_CRAFT_THEME_ID];
         _productSort = new Sort();
         _productSort.fields = [new SortField("order",false,true),new SortField("name")];
      }
      
      override public function reset() : void
      {
         super.reset();
         filterFunction = this.hideAllFilter;
         refresh();
      }
      
      override protected function completeSearch() : void
      {
         label = StringUtil.substitute("{0} ({1})",this.categoryName,this.length);
         valid = true;
      }
      
      override public function addProductIfAppropriate(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         if(productFilter != null && param1 && productFilter(param1))
         {
            param1.order = this.getSortOrder(param1);
            addProduct(param1,param2);
            return true;
         }
         return false;
      }
      
      private function getSortOrder(param1:ThumbModel) : Number
      {
         if(param1 && param1.thumb && this._sortByThemeOrder)
         {
            return this._sortByThemeOrder.indexOf(param1.thumb.themeId);
         }
         return -1;
      }
      
      override public function get isProperCollection() : Boolean
      {
         return true;
      }
      
      protected function hideAllFilter(param1:Object) : Boolean
      {
         return false;
      }
      
      public function isProp(param1:ThumbModel) : Boolean
      {
         if(param1)
         {
            return param1.thumb is PropThumb;
         }
         return false;
      }
   }
}
