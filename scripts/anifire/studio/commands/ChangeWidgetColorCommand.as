package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetColorCommand extends ChangeWidgetCommand
   {
       
      
      private var _oldColor:uint;
      
      private var _newColor:uint;
      
      public function ChangeWidgetColorCommand(param1:Widget, param2:uint, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetColorCommand";
         this._newColor = param2;
         this._oldColor = param1.styleModel.color;
      }
      
      public function set newColor(param1:uint) : void
      {
         this._newColor = param1;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            super.execute();
            _loc1_.changeWidgetColor(this._newColor);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.changeWidgetColor(this._oldColor);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.changeWidgetColor(this._newColor);
         }
         super.redo();
      }
   }
}
