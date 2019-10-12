package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.FlowFrame;
   
   public class TransformFlowFrameImageCommand extends AssetCommand
   {
      
      private static const POSITION_THRESHOLD:Number = 0.01;
      
      private static const SCALE_THRESHOLD:Number = 0.0001;
      
      private static const ROTATION_THRESHOLD:Number = 0.0001;
       
      
      private var _oldX:Number;
      
      private var _oldY:Number;
      
      private var _oldScaleX:Number;
      
      private var _oldScaleY:Number;
      
      private var _oldRotation:Number;
      
      private var _newX:Number;
      
      private var _newY:Number;
      
      private var _newScaleX:Number;
      
      private var _newScaleY:Number;
      
      private var _newRotation:Number;
      
      public function TransformFlowFrameImageCommand(param1:Asset, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Boolean = true)
      {
         super(param1,param7);
         _type = "TransformFlowFrameImageCommand";
         this._newX = param2;
         this._newY = param3;
         this._newScaleX = param4;
         this._newScaleY = param5;
         this._newRotation = param6;
      }
      
      override public function execute() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         this._oldX = _loc1_.innerImageX;
         this._oldY = _loc1_.innerImageY;
         this._oldScaleX = _loc1_.innerImageScaleX;
         this._oldScaleY = _loc1_.innerImageScaleY;
         this._oldRotation = _loc1_.innerImageRotation;
         if(Math.abs(this._oldX - this._newX) < POSITION_THRESHOLD && Math.abs(this._oldY - this._newY) < POSITION_THRESHOLD && Math.abs(this._oldScaleX - this._newScaleX) < SCALE_THRESHOLD && Math.abs(this._oldScaleY - this._newScaleY) < SCALE_THRESHOLD && Math.abs(this._oldRotation - this._newRotation) < ROTATION_THRESHOLD)
         {
            return;
         }
         _loc1_.moveInnerImage(this._newX,this._newY);
         _loc1_.scaleInnerImage(this._newScaleX,this._newScaleY);
         _loc1_.innerImageRotation = this._newRotation;
         super.execute();
      }
      
      override public function undo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.moveInnerImage(this._oldX,this._oldY);
         _loc1_.scaleInnerImage(this._oldScaleX,this._oldScaleY);
         _loc1_.innerImageRotation = this._oldRotation;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.moveInnerImage(this._newX,this._newY);
         _loc1_.scaleInnerImage(this._newScaleX,this._newScaleY);
         _loc1_.innerImageRotation = this._newRotation;
         super.redo();
      }
   }
}
