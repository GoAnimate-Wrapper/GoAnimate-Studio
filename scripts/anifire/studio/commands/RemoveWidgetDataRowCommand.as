package anifire.studio.commands
{
   import anifire.models.widget.WidgetPartModel;
   import anifire.studio.core.Widget;
   import anifire.studio.core.WidgetThumb;
   
   public class RemoveWidgetDataRowCommand extends ChangeWidgetCommand
   {
       
      
      private var _index:int;
      
      private var _model:WidgetPartModel;
      
      public function RemoveWidgetDataRowCommand(param1:Widget, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "RemoveWidgetDataRowCommand";
         this._index = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_ && _loc1_.dataRowsLength > WidgetThumb.MIN_DATA_ROWS)
         {
            super.execute();
            this._model = _loc1_.removeDataRowAt(this._index);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.addDataRowAt(this._model,this._index);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.removeDataRowAt(this._index);
         }
         super.redo();
      }
   }
}
