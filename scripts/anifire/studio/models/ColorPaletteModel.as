package anifire.studio.models
{
   import anifire.models.widget.WidgetStyleModel;
   
   public class ColorPaletteModel
   {
      
      public static const NO_COLOR:uint = uint.MAX_VALUE;
       
      
      protected var _colors:Vector.<uint>;
      
      protected var _displayedColors:Vector.<uint>;
      
      protected var _id:String;
      
      public var colorSchemeName:String;
      
      public var isSingle:Boolean;
      
      public var lineColor:uint;
      
      public var textColor:uint;
      
      public var titleColor:uint;
      
      public function ColorPaletteModel(param1:String = "", param2:Array = null, param3:uint = 4.294967295E9, param4:uint = 4.294967295E9, param5:uint = 4.294967295E9)
      {
         super();
         this._id = param1;
         this.colorSchemeName = param1;
         this.init();
         this.lineColor = param3;
         this.textColor = param4;
         this.titleColor = param5;
         this.initByArray(param2);
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function initDisplayColors(param1:Array) : void
      {
         var _loc2_:uint = 0;
         this._displayedColors = new Vector.<uint>();
         if(param1)
         {
            for each(_loc2_ in param1)
            {
               this._displayedColors.push(_loc2_);
            }
         }
      }
      
      protected function init() : void
      {
         this._colors = new Vector.<uint>();
      }
      
      public function initByArray(param1:Array) : void
      {
         var _loc2_:uint = 0;
         if(param1)
         {
            this._colors.length = 0;
            for each(_loc2_ in param1)
            {
               this._colors.push(_loc2_);
            }
         }
      }
      
      public function initByStyleModel(param1:WidgetStyleModel) : void
      {
         this.initByArray(param1.colorSet);
         this.lineColor = param1.lineColor;
         this.textColor = param1.color;
         this.titleColor = param1.titleColor;
      }
      
      public function initByVector(param1:Vector.<uint>) : void
      {
         if(param1)
         {
            this._colors = param1.concat();
         }
      }
      
      public function addColor(param1:uint) : void
      {
         this._colors.push(param1);
      }
      
      public function get length() : uint
      {
         return this._colors.length;
      }
      
      public function getColorAt(param1:int) : uint
      {
         return this._colors[param1 % this._colors.length];
      }
      
      public function getDisplayedColorAt(param1:int) : uint
      {
         if(!this._displayedColors)
         {
            return this.getColorAt(param1);
         }
         return this._displayedColors[param1 % this._displayedColors.length];
      }
   }
}
