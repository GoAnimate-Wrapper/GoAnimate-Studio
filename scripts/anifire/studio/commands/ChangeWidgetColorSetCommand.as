package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetColorSetCommand extends ChangeWidgetCommand
   {
       
      
      private var _newColorSet:Array;
      
      private var _oldColorSet:Array;
      
      public function ChangeWidgetColorSetCommand(param1:Widget, param2:Array, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeWidgetColorSetCommand";
         this._newColorSet = param2;
         this._oldColorSet = param1.styleModel.colorSet.concat();
      }
      
      public function set newColorSet(param1:Array) : void
      {
         this._newColorSet = param1;
      }
      
      override public function execute() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            super.execute();
            _loc1_.colorSet = this._newColorSet;
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.colorSet = this._oldColorSet;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Widget = this.asset as Widget;
         if(_loc1_)
         {
            _loc1_.colorSet = this._newColorSet;
         }
         super.redo();
      }
   }
}
