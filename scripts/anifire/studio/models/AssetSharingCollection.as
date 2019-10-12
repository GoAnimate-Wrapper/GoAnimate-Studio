package anifire.studio.models
{
   import anifire.constant.ResponseConstants;
   import anifire.util.UtilDict;
   import mx.collections.ArrayCollection;
   import mx.utils.StringUtil;
   
   public class AssetSharingCollection extends ArrayCollection
   {
      
      public static const OPTION_NOT_SHARING_TEXT:String = "No Sharing";
      
      public static const OPTION_ALL_MEMBERS_TEXT:String = "All members";
      
      public static const DEFAULT_ITEM_COUNT:int = 2;
       
      
      protected var _ownerItem:AssetSharingModel;
      
      protected var _teamItem:AssetSharingModel;
      
      protected var _memberLookup:Object;
      
      public function AssetSharingCollection()
      {
         super();
         this._memberLookup = {};
      }
      
      public function get teamItem() : AssetSharingModel
      {
         return this._teamItem;
      }
      
      public function createDefaultItems() : void
      {
         this._ownerItem = new AssetSharingModel();
         this._ownerItem.sharingNone = true;
         this._ownerItem.selected = true;
         this._ownerItem.label = UtilDict.translate(OPTION_NOT_SHARING_TEXT);
         addItem(this._ownerItem);
         this._teamItem = new AssetSharingModel();
         this._teamItem.sharingTeam = true;
         this._teamItem.label = UtilDict.translate(OPTION_ALL_MEMBERS_TEXT);
         addItem(this._teamItem);
      }
      
      public function selectOwnerItem() : void
      {
         var _loc2_:AssetSharingModel = null;
         this._ownerItem.selected = true;
         this._teamItem.selected = false;
         var _loc1_:int = DEFAULT_ITEM_COUNT;
         while(_loc1_ < length)
         {
            _loc2_ = getItemAt(_loc1_) as AssetSharingModel;
            _loc2_.selected = false;
            _loc1_++;
         }
      }
      
      public function selectTeamItem() : void
      {
         var _loc2_:AssetSharingModel = null;
         this._ownerItem.selected = false;
         this._teamItem.selected = true;
         var _loc1_:int = DEFAULT_ITEM_COUNT;
         while(_loc1_ < length)
         {
            _loc2_ = getItemAt(_loc1_) as AssetSharingModel;
            _loc2_.selected = true;
            _loc1_++;
         }
      }
      
      public function addMember(param1:TeamMemberModel) : void
      {
         var _loc2_:AssetSharingModel = new AssetSharingModel();
         _loc2_.userName = param1.label;
         _loc2_.teamAdmin = param1.isAdmin;
         _loc2_.userId = param1.userId;
         _loc2_.label = param1.label;
         this._memberLookup[_loc2_.userId] = _loc2_;
         addItem(_loc2_);
      }
      
      public function selectMemberItem(param1:String) : void
      {
         var _loc2_:AssetSharingModel = this._memberLookup[param1];
         if(_loc2_)
         {
            _loc2_.selected = true;
         }
      }
      
      public function get selectedProperItemCount() : int
      {
         var _loc3_:AssetSharingModel = null;
         var _loc1_:int = 0;
         var _loc2_:int = DEFAULT_ITEM_COUNT;
         while(_loc2_ < length)
         {
            _loc3_ = getItemAt(_loc2_) as AssetSharingModel;
            if(_loc3_.selected)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get properItemCount() : int
      {
         return length - DEFAULT_ITEM_COUNT;
      }
      
      public function updateDefaultItems() : void
      {
         var _loc1_:int = this.selectedProperItemCount;
         if(_loc1_ > 0)
         {
            this._ownerItem.selected = false;
         }
         else if(this.properItemCount > 0 || !this.teamItem.selected)
         {
            this._ownerItem.selected = true;
         }
      }
      
      public function get collectionLabel() : String
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         if(this._ownerItem.selected)
         {
            _loc1_ = this._ownerItem.label;
         }
         else if(this._teamItem.selected)
         {
            _loc1_ = this._teamItem.label;
         }
         else
         {
            _loc2_ = this.selectedProperItemCount;
            if(_loc2_ == 1)
            {
               _loc1_ = UtilDict.translate("1 member");
            }
            else
            {
               _loc1_ = StringUtil.substitute(UtilDict.translate("{0} members"),_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function createRequestData() : Object
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:AssetSharingModel = null;
         var _loc1_:Object = {};
         if(this._ownerItem.selected)
         {
            _loc1_[ResponseConstants.ASSET_SHARING_TYPE] = ResponseConstants.ASSET_SHARING_TYPE_NONE;
         }
         else if(this._teamItem.selected)
         {
            _loc1_[ResponseConstants.ASSET_SHARING_TYPE] = ResponseConstants.ASSET_SHARING_TYPE_TEAM;
         }
         else
         {
            _loc1_[ResponseConstants.ASSET_SHARING_TYPE] = ResponseConstants.ASSET_SHARING_TYPE_SHARED;
            _loc2_ = [];
            _loc3_ = 2;
            while(_loc3_ < length)
            {
               _loc4_ = getItemAt(_loc3_) as AssetSharingModel;
               if(_loc4_.selected)
               {
                  _loc2_.push(_loc4_.userId);
               }
               _loc3_++;
            }
            _loc1_[ResponseConstants.ASSET_SHARING_USER_IDS] = _loc2_;
         }
         return _loc1_;
      }
   }
}
