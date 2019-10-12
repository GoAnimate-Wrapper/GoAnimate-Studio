package anifire.studio.managers
{
   import anifire.constant.ThemeConstants;
   import anifire.studio.core.Theme;
   import anifire.studio.core.Thumb;
   import anifire.util.UtilText;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.utils.StringUtil;
   
   public class ProductManager extends EventDispatcher
   {
      
      public static const PRODUCT_TYPE_PROP:String = "prop";
      
      public static const PRODUCT_TYPE_BG:String = "bg";
      
      private static var _instance:ProductManager;
       
      
      private var _searchKeyword:String;
      
      private var _isShowFavOnly:Boolean = false;
      
      public function ProductManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function get instance() : ProductManager
      {
         if(_instance == null)
         {
            _instance = new ProductManager();
         }
         return _instance;
      }
      
      public function get isShowFavOnly() : Boolean
      {
         return this._isShowFavOnly;
      }
      
      public function set isShowFavOnly(param1:Boolean) : void
      {
         this._isShowFavOnly = param1;
      }
      
      private function filterProduct(param1:Object) : Boolean
      {
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc2_:Thumb = param1 as Thumb;
         var _loc3_:RegExp = new RegExp(this._searchKeyword,"i");
         var _loc4_:Array = _loc2_.sysTags;
         var _loc5_:String = "";
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            _loc7_ = _loc4_[_loc6_];
            if(_loc7_)
            {
               _loc8_ = _loc7_.indexOf("cat:");
               if(_loc8_ != -1)
               {
                  _loc7_ = _loc7_.substr(_loc8_ + 1);
               }
               _loc5_ = _loc5_ + (_loc7_ + " ");
            }
            _loc6_++;
         }
         return _loc2_.enable && UtilText.search(this._searchKeyword,_loc5_);
      }
      
      public function searchProduct(param1:String, param2:String = null, param3:String = null) : ArrayCollection
      {
         var _loc4_:ArrayCollection = new ArrayCollection();
         if(param1 == null)
         {
            return _loc4_;
         }
         param1 = StringUtil.trim(param1);
         if(param1 == "")
         {
            return _loc4_;
         }
         this._searchKeyword = param1;
         _loc4_ = this.getProduct(param2,param3);
         _loc4_.filterFunction = this.filterProduct;
         _loc4_.refresh();
         return _loc4_;
      }
      
      public function getProduct(param1:String = null, param2:String = null) : ArrayCollection
      {
         var _loc4_:Theme = null;
         var _loc6_:Vector.<Theme> = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:Array = [];
         var _loc5_:ThemeManager = ThemeManager.instance;
         if(param2)
         {
            _loc4_ = _loc5_.getTheme(param2);
            if(_loc4_)
            {
               _loc3_ = _loc3_.concat(_loc4_.getProducts(param1));
            }
            if(param2 == ThemeConstants.LIL_PEEPZ_THEME_ID)
            {
               _loc4_ = _loc5_.getTheme(ThemeConstants.COMMON_THEME_ID);
               if(_loc4_)
               {
                  _loc3_ = _loc3_.concat(_loc4_.getProducts(param1));
               }
            }
         }
         else
         {
            _loc6_ = _loc5_.themes;
            _loc7_ = _loc6_.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc4_ = _loc6_[_loc8_];
               if(_loc4_ != _loc5_.commonTheme)
               {
                  _loc3_ = _loc3_.concat(_loc4_.getProducts(param1));
               }
               _loc8_++;
            }
            _loc4_ = _loc5_.commonTheme;
            if(_loc4_)
            {
               _loc3_ = _loc3_.concat(_loc4_.getProducts(param1));
            }
         }
         return new ArrayCollection(_loc3_);
      }
   }
}
