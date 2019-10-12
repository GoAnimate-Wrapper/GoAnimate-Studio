package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetSelectedDayCommand extends ChangeWidgetCommand
   {
       
      
      private var _newDay:int;
      
      private var _oldDay:int;
      
      private var _newDayEnd:int;
      
      private var _oldDayEnd:int;
      
      public function ChangeWidgetSelectedDayCommand(param1:Widget, param2:int, param3:int, param4:Boolean = true)
      {
         super(param1,param4);
         _type = "ChangeWidgetSelectedDayCommand";
         this._newDay = param2;
         this._oldDay = param1.selectedDate;
         this._newDayEnd = param3;
         this._oldDayEnd = param1.selectedDateEnd;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._newDay != this._oldDay || this._newDayEnd != this._oldDayEnd)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.selectedDate = this._newDay;
               _loc1_.selectedDateEnd = this._newDayEnd;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.selectedDate = this._oldDay;
            _loc1_.selectedDateEnd = this._oldDayEnd;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.selectedDate = this._newDay;
            _loc1_.selectedDateEnd = this._newDayEnd;
         }
         super.redo();
      }
   }
}
