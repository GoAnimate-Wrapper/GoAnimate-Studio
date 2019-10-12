package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.FlowFrameThumb;
   
   public class SwapFlowFrameCommand extends AssetCommand
   {
       
      
      protected var _oldThumb:FlowFrameThumb;
      
      protected var _newThumb:FlowFrameThumb;
      
      public function SwapFlowFrameCommand(param1:Asset, param2:FlowFrameThumb, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "SwapFlowFrameCommand";
         this._newThumb = param2;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:FlowFrame = asset as FlowFrame;
         if(_loc1_)
         {
            this._oldThumb = _loc1_.thumb as FlowFrameThumb;
            _loc1_.swapWithThumb(this._newThumb);
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         var _loc1_:FlowFrame = asset as FlowFrame;
         if(_loc1_)
         {
            _loc1_.swapWithThumb(this._oldThumb);
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         var _loc1_:FlowFrame = asset as FlowFrame;
         if(_loc1_)
         {
            _loc1_.swapWithThumb(this._newThumb);
         }
      }
   }
}
