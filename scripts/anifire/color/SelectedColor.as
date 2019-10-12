package anifire.color
{
   public class SelectedColor
   {
       
      
      private var _areaName:String = "";
      
      private var _orgColor:uint;
      
      private var _dstColor:uint;
      
      public function SelectedColor(param1:String, param2:uint = 4.294967295E9, param3:uint = 4.294967295E9)
      {
         super();
         this._areaName = param1;
         this._orgColor = param2;
         this._dstColor = param3;
      }
      
      public function get areaName() : String
      {
         return this._areaName;
      }
      
      public function get orgColor() : uint
      {
         return this._orgColor;
      }
      
      public function get dstColor() : uint
      {
         return this._dstColor;
      }
   }
}
