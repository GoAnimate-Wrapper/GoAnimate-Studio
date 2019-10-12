package anifire.studio.assets.commands
{
   import anifire.studio.commands.ChangeActionCommand;
   import anifire.studio.core.Asset;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.core.MotionData;
   
   public class ChangeCharacterMovementCommand extends ChangeAssetMovementCommand
   {
       
      
      private var _changeActionCommand:ChangeActionCommand;
      
      public function ChangeCharacterMovementCommand(param1:Asset, param2:MotionData, param3:Boolean = true, param4:uint = 3, param5:Number = 1, param6:Boolean = false, param7:uint = 6)
      {
         var _loc8_:CharThumb = null;
         var _loc9_:String = null;
         super(param1,param2,param3,param4,param5,param7);
         _type = "ChangeCharacterMovementCommand";
         if(param6)
         {
            _loc8_ = param1.thumb as CharThumb;
            if(_loc8_)
            {
               if(param2)
               {
                  _loc9_ = _loc8_.defaultMotionId;
               }
               else
               {
                  _loc9_ = _loc8_.defaultStandActionId;
               }
               this._changeActionCommand = new ChangeActionCommand(asset as Character,_loc9_,false);
            }
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._changeActionCommand)
         {
            this._changeActionCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         if(this._changeActionCommand)
         {
            this._changeActionCommand.undo();
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         if(this._changeActionCommand)
         {
            this._changeActionCommand.redo();
         }
      }
   }
}
