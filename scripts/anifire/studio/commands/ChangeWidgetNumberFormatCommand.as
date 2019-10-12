package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetNumberFormatCommand extends ChangeWidgetCommand
   {
       
      
      private var _newFormat:int;
      
      private var _oldFormat:int;
      
      public function ChangeWidgetNumberFormatCommand(param1:Widget, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetNumberFormatCommand";
         this._newFormat = param2;
         this._oldFormat = param1.numberFormatType;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._oldFormat != this._newFormat)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.numberFormatType = this._newFormat;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.numberFormatType = this._oldFormat;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.numberFormatType = this._newFormat;
         }
         super.redo();
      }
   }
}
