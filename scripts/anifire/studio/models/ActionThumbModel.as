package anifire.studio.models
{
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.studio.core.Action;
   import anifire.studio.core.CharThumb;
   
   public class ActionThumbModel extends ThumbModel
   {
       
      
      public var actionId:String;
      
      public var charThumbId:String;
      
      public var action:Action;
      
      public var categoryName:String;
      
      public var isMotion:Boolean;
      
      public var loading:Boolean;
      
      protected var _characterAction:CCCharacterActionModel;
      
      protected var _name:String;
      
      protected var _searchKey:String;
      
      public function ActionThumbModel(param1:CharThumb, param2:String)
      {
         super(param1);
         this.charThumbId = param1.id;
         this.actionId = param2;
         if(!param1.isCC)
         {
            this.action = param1.getActionById(param2);
            this._name = this.action.name;
         }
         this._searchKey = param1.ccBodyModel.bodyShapeId + "/" + param2;
      }
      
      public function get charThumb() : CharThumb
      {
         return thumb as CharThumb;
      }
      
      override public function get id() : String
      {
         return this.actionId;
      }
      
      public function set characterAction(param1:CCCharacterActionModel) : void
      {
         if(this._characterAction != param1)
         {
            this._characterAction = param1;
            this._name = this._characterAction.actionModel.name;
            this.categoryName = this._characterAction.actionModel.category;
            this.isMotion = this._characterAction.actionModel.isMotion;
         }
      }
      
      public function get characterAction() : CCCharacterActionModel
      {
         return this._characterAction;
      }
      
      public function get defaultFacialId() : String
      {
         if(this._characterAction)
         {
            return this._characterAction.actionModel.defaultFacialId;
         }
         return null;
      }
      
      public function get cacheId() : String
      {
         return thumb.themeId + ":" + this.charThumbId + ":" + this.actionId;
      }
      
      override public function get name() : String
      {
         return this._name;
      }
      
      public function get searchKey() : String
      {
         return this._searchKey;
      }
   }
}
