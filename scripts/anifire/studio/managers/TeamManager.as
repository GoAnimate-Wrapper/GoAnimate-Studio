package anifire.studio.managers
{
   import anifire.studio.models.AssetSharingCollection;
   import anifire.studio.models.TeamMemberModel;
   
   public class TeamManager
   {
      
      private static var __instance:TeamManager;
       
      
      private var _members:Array;
      
      private var _memberLookup:Object;
      
      public function TeamManager()
      {
         super();
         this._members = [];
         this._memberLookup = {};
      }
      
      public static function get instance() : TeamManager
      {
         if(!__instance)
         {
            __instance = new TeamManager();
         }
         return __instance;
      }
      
      public function get members() : Array
      {
         return this._members;
      }
      
      public function set members(param1:Array) : void
      {
         this._members = param1;
      }
      
      public function addTeamMemberModel(param1:TeamMemberModel) : void
      {
         if(!param1)
         {
            return;
         }
         if(!this._memberLookup[param1.userId])
         {
            this._members.push(param1);
            this._memberLookup[param1.userId] = param1;
         }
      }
      
      public function addMemebers(param1:Array) : void
      {
         var _loc3_:TeamMemberModel = null;
         var _loc5_:Object = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = param1[_loc4_];
            if(_loc5_)
            {
               _loc3_ = this.createTeamMemberModel(_loc5_);
               this.addTeamMemberModel(_loc3_);
            }
            _loc4_++;
         }
      }
      
      public function createTeamMemberModel(param1:Object) : TeamMemberModel
      {
         var _loc2_:TeamMemberModel = null;
         if(param1)
         {
            _loc2_ = new TeamMemberModel();
            _loc2_.userId = param1[TeamMemberModel.RESULT_USER_ID];
            _loc2_.label = param1[TeamMemberModel.RESULT_NAME];
            _loc2_.isAdmin = param1[TeamMemberModel.RESULT_IS_ADMIN];
            _loc2_.isMe = param1[TeamMemberModel.RESULT_IS_ME];
         }
         return _loc2_;
      }
      
      public function createAssetSharingCollection() : AssetSharingCollection
      {
         var _loc4_:TeamMemberModel = null;
         var _loc1_:AssetSharingCollection = new AssetSharingCollection();
         _loc1_.createDefaultItems();
         var _loc2_:int = this.members.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.members[_loc3_] as TeamMemberModel;
            if(!_loc4_.isMe)
            {
               _loc1_.addMember(_loc4_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
   }
}
