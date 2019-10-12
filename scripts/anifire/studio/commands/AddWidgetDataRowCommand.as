package anifire.studio.commands
{
   import anifire.models.widget.WidgetPartModel;
   import anifire.studio.core.Widget;
   
   public class AddWidgetDataRowCommand extends ChangeWidgetCommand
   {
       
      
      private var _model:WidgetPartModel;
      
      public function AddWidgetDataRowCommand(param1:Widget, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "AddWidgetDataRowCommand";
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            super.execute();
            this._model = _loc1_.addDataRow(Math.round(Math.random() * 100));
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.removeDataRowAt(_loc1_.dataRowsLength - 1);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.addDataRowAt(this._model,_loc1_.dataRowsLength);
         }
         super.redo();
      }
   }
}
