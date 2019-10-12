package anifire.studio.core
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   
   public class GroupController
   {
      
      public static const ROLE_TEACHER:String = "teacher";
      
      public static const ROLE_STUDENT:String = "student";
       
      
      private var _groups:Array;
      
      private var _currentGroup:PublishGroup;
      
      private var _tempCurrentGroup:PublishGroup;
      
      private var _schoolId:String = "-1";
      
      private var _role:String;
      
      public function GroupController()
      {
         super();
         this._groups = new Array();
      }
      
      public function get currentGroup() : PublishGroup
      {
         return this._currentGroup;
      }
      
      public function set currentGroup(param1:PublishGroup) : void
      {
         this._currentGroup = param1;
      }
      
      public function get tempCurrentGroup() : PublishGroup
      {
         return this._tempCurrentGroup;
      }
      
      public function set tempCurrentGroup(param1:PublishGroup) : void
      {
         this._tempCurrentGroup = param1;
      }
      
      private function get groups() : Array
      {
         return this._groups;
      }
      
      public function set schoolId(param1:String) : void
      {
         this._schoolId = param1;
      }
      
      public function get schoolId() : String
      {
         return this._schoolId;
      }
      
      public function get role() : String
      {
         return this._role;
      }
      
      public function init() : void
      {
         var _loc1_:AppConfigManager = AppConfigManager.instance;
         var _loc2_:String = _loc1_.getValue(ServerConstants.PARAM_GROUP_ID);
         if(_loc2_)
         {
            this.currentGroup = new PublishGroup(_loc2_,_loc1_.getValue(ServerConstants.PARAM_GROUP_NAME));
         }
         else
         {
            this.currentGroup = new PublishGroup();
         }
         this._role = _loc1_.getValue(ServerConstants.PARAM_ROLE);
      }
      
      public function getGroups() : Array
      {
         return this.groups.concat();
      }
      
      public function addGroup(param1:PublishGroup) : void
      {
         this.groups.push(param1);
      }
      
      public function removeGroup(param1:PublishGroup) : void
      {
      }
      
      public function get isSchoolProject() : Boolean
      {
         if(this.schoolId != "-1")
         {
            return true;
         }
         return false;
      }
      
      public function get isTeacher() : Boolean
      {
         return this._role == ROLE_TEACHER;
      }
      
      public function get isStudent() : Boolean
      {
         return this._role == ROLE_STUDENT;
      }
   }
}
