package anifire.geom
{
   import flash.geom.Rectangle;
   
   public class AlignmentEdge
   {
       
      
      private var _value:Number;
      
      private var _rect:Rectangle;
      
      private var _id:String;
      
      public function AlignmentEdge(param1:Number, param2:Rectangle, param3:String)
      {
         super();
         this._value = param1;
         this._rect = param2;
         this._id = param3;
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      public function get rect() : Rectangle
      {
         return this._rect;
      }
      
      public function get id() : String
      {
         return this._id;
      }
   }
}
