package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class AddWidgetRangeCommand extends ChangeWidgetCommand
   {
       
      
      private var _newData:String;
      
      private var _newRangeData:Vector.<String>;
      
      public function AddWidgetRangeCommand(param1:Widget, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "AddWidgetRangeCommand";
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            super.execute();
            _loc1_.addRange();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            this._newRangeData = _loc1_.removeRangeAt(_loc1_.dataRanges.length - 1);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.addRangeAt(_loc1_.dataRangesLength,this._newRangeData);
         }
         super.redo();
      }
   }
}
