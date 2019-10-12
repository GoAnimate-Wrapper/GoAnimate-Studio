package anifire.studio.models
{
   import anifire.studio.core.FolderThumb;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.Thumb;
   import flash.events.EventDispatcher;
   
   public class ThumbModel extends EventDispatcher
   {
      
      public static const PLACE_HOLDER_ADD_INNER_IMAGE:int = 100;
      
      public static const PLACE_HOLDER_REMOVE_INNER_IMAGE:int = 99;
       
      
      protected var _id:String;
      
      protected var _thumb:Thumb;
      
      public var colorSetId:String;
      
      public var isStoreCharacter:Boolean;
      
      public var isTemplateCharacter:Boolean;
      
      public var isPlaceHolder:Boolean;
      
      public var placeHolderValue:int;
      
      public var locked:Boolean;
      
      public var copyable:Boolean;
      
      public var selected:Boolean;
      
      private var _order:Number = -1;
      
      private var _editable:Boolean = true;
      
      public function ThumbModel(param1:Thumb, param2:String = "", param3:Boolean = true)
      {
         super();
         this.thumb = param1;
         this.colorSetId = param2;
         this.editable = param3;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
      
      public function set order(param1:Number) : void
      {
         this._order = param1;
      }
      
      public function set thumb(param1:Thumb) : void
      {
         this._thumb = param1;
         if(this._thumb)
         {
            this._id = this._thumb.id;
         }
      }
      
      public function get thumb() : Thumb
      {
         return this._thumb;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return !!this._thumb?this._thumb.name:"";
      }
      
      public function get duration() : Number
      {
         if(this._thumb is SoundThumb)
         {
            return SoundThumb(this._thumb).duration;
         }
         return -1;
      }
      
      public function get isFolder() : Boolean
      {
         return this._thumb is FolderThumb;
      }
      
      public function get editable() : Boolean
      {
         return this._editable && this._thumb && this._thumb.editable && !this.isPlaceHolder;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(this._editable != param1)
         {
            this._editable = param1;
         }
      }
   }
}
