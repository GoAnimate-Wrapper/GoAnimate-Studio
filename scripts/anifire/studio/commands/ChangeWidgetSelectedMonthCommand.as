package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetSelectedMonthCommand extends ChangeWidgetCommand
   {
       
      
      private var _newMonth:int;
      
      private var _oldMonth:int;
      
      public function ChangeWidgetSelectedMonthCommand(param1:Widget, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetSelectedMonthCommand";
         this._newMonth = param2;
         this._oldMonth = param1.selectedMonth;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._newMonth != this._oldMonth)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.selectedMonth = this._newMonth;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.selectedMonth = this._oldMonth;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.selectedMonth = this._newMonth;
         }
         super.redo();
      }
   }
}
