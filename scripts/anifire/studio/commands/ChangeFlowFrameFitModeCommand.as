package anifire.studio.commands
{
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.FlowFrameInnerImageGeometry;
   
   public class ChangeFlowFrameFitModeCommand extends AssetCommand
   {
       
      
      private var _oldFitMode:int;
      
      private var _oldWidth:Number;
      
      private var _oldHeight:Number;
      
      private var _oldGeometry:FlowFrameInnerImageGeometry;
      
      private var _newFitMode:int;
      
      public function ChangeFlowFrameFitModeCommand(param1:FlowFrame, param2:int, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeFlowFrameFitModeCommand";
         this._newFitMode = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         this._oldFitMode = _loc1_.fitMode;
         if(this._oldFitMode == this._newFitMode)
         {
            return;
         }
         this._oldWidth = _loc1_.width;
         this._oldHeight = _loc1_.height;
         this._oldGeometry = _loc1_.getInnerImageGeometry();
         _loc1_.fitMode = this._newFitMode;
         super.execute();
      }
      
      override public function undo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.fitMode = this._oldFitMode;
         _loc1_.resize(this._oldWidth,this._oldHeight);
         _loc1_.updateInnerImageGeometry(this._oldGeometry);
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.fitMode = this._newFitMode;
         super.redo();
      }
   }
}
