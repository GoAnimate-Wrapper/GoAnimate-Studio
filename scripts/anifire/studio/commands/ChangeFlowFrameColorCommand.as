package anifire.studio.commands
{
   import anifire.studio.core.FlowFrame;
   
   public class ChangeFlowFrameColorCommand extends AssetCommand
   {
       
      
      private var _oldColor:uint;
      
      private var _newColor:uint;
      
      public function ChangeFlowFrameColorCommand(param1:FlowFrame, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ChangeFlowFrameColorCommand";
         this._oldColor = param1.color;
      }
      
      public function executeNow(param1:uint) : void
      {
         this._newColor = param1;
         this.execute();
      }
      
      override public function execute() : void
      {
         if(this._newColor == this._oldColor)
         {
            return;
         }
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.color = this._newColor;
         super.execute();
      }
      
      override public function undo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.color = this._oldColor;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.color = this._newColor;
         super.redo();
      }
   }
}
