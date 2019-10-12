package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetAutoGridCommand extends ChangeWidgetCommand
   {
       
      
      private var _oldRows:int;
      
      private var _oldColumns:int;
      
      public function ChangeWidgetAutoGridCommand(param1:Widget, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ChangeWidgetAutoGridCommand";
         this._oldRows = param1.gridRows;
         this._oldColumns = param1.gridColumns;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:Widget = asset as Widget;
         _loc1_.setAutoGrid();
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = asset as Widget;
         _loc1_.setManualGrid(this._oldRows,this._oldColumns);
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         _loc1_.setAutoGrid();
         super.redo();
      }
   }
}
