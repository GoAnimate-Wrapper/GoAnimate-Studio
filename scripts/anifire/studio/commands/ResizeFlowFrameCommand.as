package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.FlowFrame;
   
   public class ResizeFlowFrameCommand extends AssetCommand
   {
       
      
      private var _oldWidth:Number;
      
      private var _oldHeight:Number;
      
      private var _oldInnerX:Number;
      
      private var _oldInnerY:Number;
      
      private var _oldInnerScaleX:Number;
      
      private var _oldInnerScaleY:Number;
      
      private var _oldInnerRotation:Number;
      
      private var _newWidth:Number;
      
      private var _newHeight:Number;
      
      private var _newInnerX:Number;
      
      private var _newInnerY:Number;
      
      private var _newInnerScaleX:Number;
      
      private var _newInnerScaleY:Number;
      
      private var _newInnerRotation:Number;
      
      public function ResizeFlowFrameCommand(param1:Asset, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ResizeFlowFrameCommand";
         var _loc3_:FlowFrame = param1 as FlowFrame;
         if(_loc3_)
         {
            this._oldWidth = _loc3_.width;
            this._oldHeight = _loc3_.height;
            this._oldInnerX = _loc3_.innerImageX;
            this._oldInnerY = _loc3_.innerImageY;
            this._oldInnerScaleX = _loc3_.innerImageScaleX;
            this._oldInnerScaleY = _loc3_.innerImageScaleY;
            this._oldInnerRotation = _loc3_.innerImageRotation;
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:FlowFrame = asset as FlowFrame;
         if(_loc1_)
         {
            this._newWidth = _loc1_.width;
            this._newHeight = _loc1_.height;
            this._newInnerX = _loc1_.innerImageX;
            this._newInnerY = _loc1_.innerImageY;
            this._newInnerScaleX = _loc1_.innerImageScaleX;
            this._newInnerScaleY = _loc1_.innerImageScaleY;
            this._newInnerRotation = _loc1_.innerImageRotation;
            _loc1_.resize(this._oldWidth,this._oldHeight);
            _loc1_.moveInnerImage(this._oldInnerX,this._oldInnerY);
            _loc1_.scaleInnerImage(this._oldInnerScaleX,this._oldInnerScaleY);
            _loc1_.innerImageRotation = this._oldInnerRotation;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:FlowFrame = asset as FlowFrame;
         if(_loc1_)
         {
            _loc1_.resize(this._newWidth,this._newHeight);
            _loc1_.moveInnerImage(this._newInnerX,this._newInnerY);
            _loc1_.scaleInnerImage(this._newInnerScaleX,this._newInnerScaleY);
            _loc1_.innerImageRotation = this._newInnerRotation;
         }
         super.redo();
      }
   }
}
