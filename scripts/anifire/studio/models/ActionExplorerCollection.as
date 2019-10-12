package anifire.studio.models
{
   import anifire.managers.CCBodyManager;
   import anifire.managers.CCThemeManager;
   import anifire.models.creator.CCBodyModel;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.models.creator.CCThemeModel;
   import anifire.studio.core.CharThumb;
   import flash.events.Event;
   
   public class ActionExplorerCollection extends ProductGroupCollection
   {
       
      
      public var searchResult:SearchActionCollection;
      
      public var basicActions:ProductCollection;
      
      public var autoGrouping:Boolean = true;
      
      protected var categoryList:Object;
      
      protected var charThumb:CharThumb;
      
      protected var ccThemeModel:CCThemeModel;
      
      protected var ccBodyModel:CCBodyModel;
      
      protected var productCategoryLookup:Object;
      
      public function ActionExplorerCollection()
      {
         super();
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.searchResult = new SearchActionCollection("Search Result");
         this.basicActions = new ActionCollection("Basic");
         addCollection(this.searchResult);
         addCollection(this.basicActions);
      }
      
      public function createFromCharacterThumb(param1:CharThumb) : void
      {
         if(!param1)
         {
            return;
         }
         this.charThumb = param1;
         if(this.charThumb.ccThemeId)
         {
            this.createFromCompositeModel();
         }
         else
         {
            this.createFromXML();
         }
         if(this.searchResult)
         {
            this.searchResult.characterThemeId = this.charThumb.themeOrCCThemeId;
         }
      }
      
      public function get motionOnly() : Boolean
      {
         return this.searchResult.motionOnly;
      }
      
      public function set motionOnly(param1:Boolean) : void
      {
         this.searchResult.motionOnly = param1;
      }
      
      protected function createFromXML() : void
      {
         var _loc1_:XMLList = this.charThumb.xml.children();
         var _loc2_:int = _loc1_.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.processNode(_loc1_[_loc3_]);
            _loc3_++;
         }
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      protected function processNode(param1:XML, param2:String = null) : void
      {
         var _loc3_:String = param1.localName() as String;
         switch(_loc3_)
         {
            case "category":
               this.processCategoryNode(param1);
               break;
            case "action":
            case "motion":
               this.processActionNode(param1,param2);
         }
      }
      
      protected function processCategoryNode(param1:XML) : void
      {
         if(param1.@enable == "N")
         {
            return;
         }
         var _loc2_:String = param1.@name;
         var _loc3_:XMLList = param1.children();
         var _loc4_:int = _loc3_.length();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            this.processNode(_loc3_[_loc5_],_loc2_);
            _loc5_++;
         }
      }
      
      protected function processActionNode(param1:XML, param2:String = null) : void
      {
         if(param1.@enable == "N")
         {
            return;
         }
         var _loc3_:ActionThumbModel = new ActionThumbModel(this.charThumb,param1.@id);
         if(param1.localName() == "motion")
         {
            _loc3_.isMotion = true;
         }
         _loc3_.categoryName = param2;
         this.addProduct(_loc3_);
      }
      
      protected function createFromCompositeModel() : void
      {
         this.ccThemeModel = CCThemeManager.instance.getThemeModel(this.charThumb.ccThemeId);
         this.ccBodyModel = CCBodyManager.instance.getBodyModel(this.charThumb.id);
         if(this.ccBodyModel.completed)
         {
            this.createActionModels();
         }
         else
         {
            this.ccBodyModel.addEventListener(Event.COMPLETE,this.onBodyModelComplete);
            this.ccBodyModel.load();
         }
      }
      
      protected function onBodyModelComplete(param1:Event) : void
      {
         this.ccBodyModel.removeEventListener(Event.COMPLETE,this.onBodyModelComplete);
         this.createActionModels();
      }
      
      protected function createActionModels() : void
      {
         var _loc1_:* = null;
         var _loc2_:CCCharacterActionModel = null;
         var _loc3_:ActionThumbModel = null;
         for(_loc1_ in this.ccThemeModel.getActions(this.ccBodyModel.bodyShapeId))
         {
            _loc2_ = this.ccThemeModel.getCharacterActionModel(this.ccBodyModel,_loc1_);
            if(_loc2_.enabled)
            {
               _loc3_ = new ActionThumbModel(this.charThumb,_loc1_);
               _loc3_.characterAction = _loc2_;
               this.addProduct(_loc3_);
            }
         }
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      override public function addProduct(param1:ThumbModel, param2:Boolean = true) : Boolean
      {
         var _loc3_:ActionThumbModel = param1 as ActionThumbModel;
         this.searchResult.addProduct(_loc3_);
         var _loc4_:ProductCollection = !!_loc3_.categoryName?this.getCategoryCollection(_loc3_.categoryName):this.basicActions;
         this.registerProductCollection(_loc3_,_loc4_);
         _loc4_.addProduct(_loc3_);
         registerProduct(_loc3_);
         dispatchEvent(new Event(Event.CHANGE));
         return true;
      }
      
      protected function getCategoryCollection(param1:String) : ProductCollection
      {
         var _loc2_:ProductCollection = this.categoryList[param1];
         if(!_loc2_)
         {
            _loc2_ = new ActionCollection(param1);
            _loc2_.sortOrder = 1;
            this.categoryList[param1] = _loc2_;
            addCollection(_loc2_);
         }
         return _loc2_;
      }
      
      override public function getCategoryByProductId(param1:String) : ProductCollection
      {
         return this.productCategoryLookup[param1];
      }
      
      override protected function registerProductCollection(param1:ThumbModel, param2:ProductCollection) : void
      {
         this.productCategoryLookup[param1.id] = param2;
      }
      
      override public function removeAllProducts() : void
      {
         filterFunction = null;
         refresh();
         super.removeAllProducts();
         source = [];
         collections = new Vector.<ProductCollection>();
         this.categoryList = {};
         this.productCategoryLookup = {};
         this.searchResult.reset();
         addCollection(this.searchResult);
         addCollection(this.basicActions);
      }
      
      override public function getSearchCollection() : SearchCollection
      {
         return this.searchResult;
      }
      
      protected function shouldLoadTheme(param1:String) : Boolean
      {
         switch(param1)
         {
            case "ninjaanime":
            case "spacecitizen":
            case "anime":
               return true;
            default:
               return false;
         }
      }
   }
}
