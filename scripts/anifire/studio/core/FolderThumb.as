package anifire.studio.core
{
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.event.ServerRequestEvent;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.models.ProductCollection;
   import anifire.studio.models.PropCollection;
   import anifire.studio.models.ThumbModel;
   import anifire.util.ApiRequest;
   
   public class FolderThumb extends Thumb
   {
      
      public static const XML_NODE_NAME:String = "folder";
      
      private static const API_PARAM_TYPE:String = "type";
      
      private static const API_PARAM_PAGE:String = "page";
      
      private static const API_PARAM_COUNT:String = "count";
      
      private static const API_PARAM_FOLDER:String = "folder";
      
      private static const API_PARAM_FOLDER_ID:String = "id";
      
      private static const API_PARAM_FOLDER_NAME:String = "name";
      
      private static const ASSET_TYPE_PROP:String = "prop";
      
      private static const DEFAULT_COUNT_PER_PAGE:int = 1000;
      
      private static const CATEGORY_NAME_PPT:String = "PPT_import";
       
      
      public var createdDate:String;
      
      private var _productCollection:ProductCollection;
      
      public function FolderThumb()
      {
         super();
      }
      
      override public function deSerialize(param1:XML, param2:Theme) : void
      {
         this.id = param1.@id;
         this.name = param1.@name;
         this.createdDate = param1.@createdDate;
         this.theme = param2;
      }
      
      override public function loadImageData() : void
      {
      }
      
      public function get productCollection() : ProductCollection
      {
         return this._productCollection;
      }
      
      public function loadAssets() : void
      {
         var _loc1_:Object = {};
         _loc1_[API_PARAM_TYPE] = ASSET_TYPE_PROP;
         _loc1_[API_PARAM_FOLDER] = this.id;
         _loc1_[API_PARAM_PAGE] = 0;
         _loc1_[API_PARAM_COUNT] = DEFAULT_COUNT_PER_PAGE;
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadAssets_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.loadAssets_failHandler);
         _loc2_.post(ServerConstants.ACTION_GET_USER_ASSETS_V2,_loc1_);
      }
      
      private function loadAssets_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc6_:PropThumb = null;
         var _loc7_:XML = null;
         var _loc2_:ApiRequest = param1.target as ApiRequest;
         _loc2_.removeEventListener(ServerRequestEvent.COMPLETE,this.loadAssets_completeHandler);
         _loc2_.removeEventListener(ServerRequestEvent.FAIL,this.loadAssets_failHandler);
         var _loc3_:XML = new XML(param1.data.xml);
         var _loc4_:XMLList = _loc3_.children();
         var _loc5_:int = _loc4_.length();
         this._productCollection = new PropCollection(CATEGORY_NAME_PPT);
         var _loc8_:int = 0;
         while(_loc8_ < _loc5_)
         {
            _loc7_ = _loc4_[_loc8_];
            _loc6_ = new PropThumb();
            _loc6_.deSerialize(_loc7_,theme);
            _loc6_.xml = _loc7_;
            _loc6_.editable = true;
            _loc6_.folder = this;
            theme.addThumb(_loc6_);
            this._productCollection.addProduct(new ThumbModel(_loc6_));
            _loc8_++;
         }
         dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_COMPLETE,this));
      }
      
      private function loadAssets_failHandler(param1:ServerRequestEvent) : void
      {
         var _loc2_:ApiRequest = param1.target as ApiRequest;
         _loc2_.removeEventListener(ServerRequestEvent.COMPLETE,this.loadAssets_completeHandler);
         _loc2_.removeEventListener(ServerRequestEvent.FAIL,this.loadAssets_failHandler);
         dispatchEvent(new CoreEvent(CoreEvent.USER_PROP_COMPLETE,this));
      }
      
      public function removeThumb(param1:Thumb) : Boolean
      {
         if(this._productCollection && param1)
         {
            return this._productCollection.removeProductById(param1.id);
         }
         return false;
      }
      
      public function deleteRemote() : void
      {
         if(!this.id)
         {
            return;
         }
         UserAssetManager.instance.removePropByAssetId(this.id);
         var _loc1_:Object = {};
         _loc1_[API_PARAM_FOLDER_ID] = this.id;
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.post(ServerConstants.ACTION_DELETE_FOLDER_V2,_loc1_);
      }
      
      public function updateRemote(param1:String) : void
      {
         if(!this.id || !param1 || this.name == param1)
         {
            return;
         }
         this.name = param1;
         var _loc2_:Object = {};
         _loc2_[API_PARAM_FOLDER_ID] = this.id;
         _loc2_[API_PARAM_FOLDER_NAME] = param1;
         var _loc3_:ApiRequest = new ApiRequest();
         _loc3_.post(ServerConstants.ACTION_UPDATE_FOLDER_V2,_loc2_);
      }
   }
}
