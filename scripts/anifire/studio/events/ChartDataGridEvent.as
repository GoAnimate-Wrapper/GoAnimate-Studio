package anifire.studio.events
{
   import flash.events.Event;
   
   public class ChartDataGridEvent extends Event
   {
      
      public static const ADD_COLUMN_CLICK:String = "addColumnClick";
      
      public static const ADD_ROW_CLICK:String = "addRowClick";
      
      public static const DELETE_BUTTON_CLICK:String = "deleteButtonClick";
      
      public static const COLUMN_HEADER_EDITOR_SESSION_SAVE:String = "columnHeaderEditorSessionSave";
      
      public static const ROW_HEADER_EDITOR_SESSION_SAVE:String = "rowHeaderEditorSessionSave";
      
      public static const ROW_HEADER_COLOR_CHANGE:String = "rowHeaderColorChange";
      
      public static const ROW_HEADER_COLOR_PREVIEW:String = "rowHeaderColorPreview";
      
      public static const COLUMN_HEADER_COLOR_CHANGE:String = "columnHeaderColorChange";
      
      public static const COLUMN_HEADER_COLOR_PREVIEW:String = "columnHeaderColorPreview";
      
      public static const COLUMN_SELECTION_CHANGE:String = "columnSelectionChange";
      
      public static const ROW_SELECTION_CHANGE:String = "rowSelectionChange";
      
      public static const SWAP_AXIS_BUTTON_CLICK:String = "swapAxisButtonClick";
      
      public static const ROW_ORDER_CHANGE:String = "rowOrderChange";
      
      public static const COLUMN_ORDER_CHANGE:String = "columnOrderChange";
       
      
      public var rowIndex:int = -1;
      
      public var columnIndex:int = -1;
      
      public var newRowIndex:int = -1;
      
      public var newColumnIndex:int = -1;
      
      public var text:String;
      
      public var color:uint;
      
      public function ChartDataGridEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
