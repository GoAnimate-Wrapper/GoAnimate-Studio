package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetAxisSwapCommand extends ChangeWidgetCommand
   {
       
      
      private var _newValue:Boolean;
      
      private var _oldValue:Boolean;
      
      public function ChangeWidgetAxisSwapCommand(param1:Widget, param2:Boolean, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetAxisSwapCommand";
         this._newValue = param2;
         this._oldValue = param1.swapAxis;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._newValue != this._oldValue)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.swapAxis = this._newValue;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.swapAxis = this._oldValue;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.swapAxis = this._newValue;
         }
         super.redo();
      }
   }
}
