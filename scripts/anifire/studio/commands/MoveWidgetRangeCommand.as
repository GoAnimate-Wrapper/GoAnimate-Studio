package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class MoveWidgetRangeCommand extends ChangeWidgetCommand
   {
       
      
      private var _sourceIndex:int;
      
      private var _destIndex:int;
      
      public function MoveWidgetRangeCommand(param1:Widget, param2:int, param3:int, param4:Boolean = true)
      {
         super(param1,param4);
         _type = "MoveWidgetRangeCommand";
         this._sourceIndex = param2;
         this._destIndex = param3;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = null;
         if(this._sourceIndex != this._destIndex)
         {
            _loc1_ = this.asset as Widget;
            if(_loc1_)
            {
               super.execute();
               _loc1_.moveRange(this._sourceIndex,this._destIndex);
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.moveRange(this._destIndex,this._sourceIndex);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.moveRange(this._sourceIndex,this._destIndex);
         }
         super.redo();
      }
   }
}
