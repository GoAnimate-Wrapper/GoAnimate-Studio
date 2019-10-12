package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetGridCommand extends ChangeWidgetCommand
   {
       
      
      private var _oldRows:int;
      
      private var _oldColumns:int;
      
      private var _oldAuto:Boolean;
      
      private var _newRows:int;
      
      private var _newColumns:int;
      
      public function ChangeWidgetGridCommand(param1:Widget, param2:int, param3:int, param4:Boolean = true)
      {
         super(param1,param4);
         _type = "ChangeWidgetGridCommand";
         this._oldAuto = param1.autoGrid;
         this._oldRows = param1.gridRows;
         this._oldColumns = param1.gridColumns;
         this._newRows = param2;
         this._newColumns = param3;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:Widget = asset as Widget;
         _loc1_.setManualGrid(this._newRows,this._newColumns);
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = asset as Widget;
         if(this._oldAuto)
         {
            _loc1_.setAutoGrid();
         }
         else
         {
            _loc1_.setManualGrid(this._oldRows,this._oldColumns);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         _loc1_.setManualGrid(this._newRows,this._newColumns);
         super.redo();
      }
   }
}
