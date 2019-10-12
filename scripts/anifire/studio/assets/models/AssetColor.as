package anifire.studio.assets.models
{
   import anifire.color.SelectedColor;
   import anifire.constant.CcLibConstant;
   import anifire.util.UtilHashSelectedColor;
   
   public class AssetColor
   {
       
      
      private var _customColor:UtilHashSelectedColor;
      
      private var _defaultColorSet:UtilHashSelectedColor;
      
      private var _defaultColorSetId:String = "";
      
      public function AssetColor()
      {
         super();
         this._customColor = new UtilHashSelectedColor();
         this._defaultColorSet = new UtilHashSelectedColor();
      }
      
      public static function removeCCUsedColor(param1:Array) : Array
      {
         var _loc2_:Array = null;
         _loc2_ = param1.filter(isNotInsideCC);
         return _loc2_;
      }
      
      private static function isNotInsideCC(param1:Object, param2:int, param3:Array) : Boolean
      {
         if(CcLibConstant.ALL_COLOR_CODE_USED.indexOf(param1 as String) > -1)
         {
            return false;
         }
         return true;
      }
      
      public function set defaultColorSetId(param1:String) : void
      {
         this._defaultColorSetId = param1;
      }
      
      public function get defaultColorSetId() : String
      {
         return this._defaultColorSetId;
      }
      
      public function set defaultColorSet(param1:UtilHashSelectedColor) : void
      {
         this._defaultColorSet = param1;
      }
      
      public function get defaultColorSet() : UtilHashSelectedColor
      {
         return this._defaultColorSet;
      }
      
      public function addCustomColor(param1:String, param2:SelectedColor) : void
      {
         this._customColor.push(param1,param2);
      }
      
      public function set customColor(param1:UtilHashSelectedColor) : void
      {
         this._customColor = param1;
      }
      
      public function get customColor() : UtilHashSelectedColor
      {
         return this._customColor;
      }
      
      public function restoreColor() : void
      {
         if(this.defaultColorSet && this.defaultColorSet.length > 0)
         {
            this.customColor = this.defaultColorSet.clone();
         }
         else
         {
            this.customColor.removeAll();
         }
      }
   }
}
