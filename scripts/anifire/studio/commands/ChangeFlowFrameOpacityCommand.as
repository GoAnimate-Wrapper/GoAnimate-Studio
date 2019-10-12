package anifire.studio.commands
{
   import anifire.studio.core.FlowFrame;
   
   public class ChangeFlowFrameOpacityCommand extends AssetCommand
   {
       
      
      private var _oldOpacity:int;
      
      private var _newOpacity:int;
      
      public function ChangeFlowFrameOpacityCommand(param1:FlowFrame, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ChangeFlowFrameOpacityCommand";
         this._oldOpacity = param1.opacity;
      }
      
      public function executeNow(param1:int) : void
      {
         this._newOpacity = param1;
         this.execute();
      }
      
      override public function execute() : void
      {
         if(this._newOpacity == this._oldOpacity)
         {
            return;
         }
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.opacity = this._newOpacity;
         super.execute();
      }
      
      override public function undo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.opacity = this._oldOpacity;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.opacity = this._newOpacity;
         super.redo();
      }
   }
}
