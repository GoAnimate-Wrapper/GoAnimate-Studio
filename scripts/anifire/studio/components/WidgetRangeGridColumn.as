package anifire.studio.components
{
   import mx.core.ClassFactory;
   import spark.components.gridClasses.GridColumn;
   
   public class WidgetRangeGridColumn extends GridColumn
   {
      
      private static const MIN_WIDTH:Number = 50;
       
      
      private var _color:uint;
      
      private var _colorPickerVisible:Boolean;
      
      public function WidgetRangeGridColumn(param1:String = null)
      {
         super(param1);
         this.headerRenderer = new ClassFactory(WidgetGridHeaderRenderer);
         this.itemRenderer = new ClassFactory(WidgetGridValueRenderer);
         this.itemEditor = new ClassFactory(WidgetGridValueEditor);
         this.labelFunction = this.columnLabelFunction;
         this.minWidth = MIN_WIDTH;
      }
      
      private function columnLabelFunction(param1:Object, param2:GridColumn) : String
      {
         var _loc3_:Vector.<Number> = null;
         var _loc4_:int = 0;
         if(param1 is WidgetDataGridItem && WidgetDataGridItem(param1).values)
         {
            _loc3_ = WidgetDataGridItem(param1).values;
            _loc4_ = param2.columnIndex - 1;
            if(_loc4_ >= 0 && _loc4_ < _loc3_.length)
            {
               return String(_loc3_[_loc4_]);
            }
         }
         return null;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         if(param1 != this._color)
         {
            this._color = param1;
         }
      }
      
      public function get colorPickerVisible() : Boolean
      {
         return this._colorPickerVisible;
      }
      
      public function set colorPickerVisible(param1:Boolean) : void
      {
         if(this._colorPickerVisible != param1)
         {
            this._colorPickerVisible = param1;
         }
      }
   }
}
