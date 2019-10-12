package anifire.studio.models
{
   import anifire.studio.utils.WhiteboardHandIcons;
   import mx.collections.ArrayCollection;
   
   public class WhiteboardHandModel
   {
      
      private static const MODEL_ORDER_ARRAY:Array = [1,2,3,4,6,7,8,9,10,5,0];
       
      
      private var _id:int;
      
      private var _image:Class;
      
      public function WhiteboardHandModel(param1:int)
      {
         super();
         this._id = param1;
         this._image = WhiteboardHandIcons.getIcon(param1);
      }
      
      public static function createHandModels() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         var _loc2_:int = 0;
         while(_loc2_ < MODEL_ORDER_ARRAY.length)
         {
            _loc1_.addItem(new WhiteboardHandModel(MODEL_ORDER_ARRAY[_loc2_]));
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get image() : Class
      {
         return this._image;
      }
      
      public function set image(param1:Class) : void
      {
         this._image = param1;
      }
   }
}
