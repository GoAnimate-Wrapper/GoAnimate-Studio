package anifire.studio.models
{
   import anifire.constant.ThemeConstants;
   import anifire.studio.components.BackgroundThumbRenderer;
   import anifire.studio.core.BackgroundThumb;
   import mx.core.ClassFactory;
   import mx.utils.StringUtil;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.layouts.TileLayout;
   
   public class SuggestionSearchTemplateCollection extends SearchCollection
   {
       
      
      private var _sortByThemeOrder:Vector.<String>;
      
      public function SuggestionSearchTemplateCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
         var _loc3_:TileLayout = new TileLayout();
         _loc3_.useVirtualLayout = true;
         _loc3_.paddingTop = 4;
         _loc3_.paddingBottom = 4;
         _loc3_.paddingRight = 8;
         _loc3_.paddingLeft = 6;
         _loc3_.columnAlign = "justifyUsingGap";
         _loc3_.orientation = "rows";
         _loc3_.requestedColumnCount = 2;
         layout = _loc3_;
         itemRenderer = new ClassFactory(BackgroundThumbRenderer);
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
      
      public function isStarter(param1:ThumbModel) : Boolean
      {
         var _loc2_:BackgroundThumb = param1.thumb as BackgroundThumb;
         if(_loc2_)
         {
            return _loc2_.isStarter;
         }
         return false;
      }
   }
}
