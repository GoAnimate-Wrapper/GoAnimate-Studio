package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class RemoveWidgetRangeCommand extends ChangeWidgetCommand
   {
       
      
      private var _removedRangeData:Vector.<String>;
      
      private var _index:int;
      
      public function RemoveWidgetRangeCommand(param1:Widget, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         this._index = param2;
         _type = "RemoveWidgetRangeCommand";
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_ && this._index >= 0 && this._index < _loc1_.dataRangesLength)
         {
            super.execute();
            this._removedRangeData = _loc1_.removeRangeAt(this._index);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.addRangeAt(this._index,this._removedRangeData);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.removeRangeAt(this._index);
         }
         super.redo();
      }
   }
}
