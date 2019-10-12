package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetIconDirectionCommand extends ChangeWidgetCommand
   {
       
      
      private var _newDirection:String;
      
      private var _oldDirection:String;
      
      public function ChangeWidgetIconDirectionCommand(param1:Widget, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetIconDirectionCommand";
         this._newDirection = param2;
         this._oldDirection = param1.iconDirection;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._newDirection != this._oldDirection)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.iconDirection = this._newDirection;
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.iconDirection = this._oldDirection;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.iconDirection = this._newDirection;
         }
         super.redo();
      }
   }
}
