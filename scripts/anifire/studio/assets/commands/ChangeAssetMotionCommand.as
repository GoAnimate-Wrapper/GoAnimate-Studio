package anifire.studio.assets.commands
{
   import anifire.studio.commands.AssetCommand;
   import anifire.studio.core.Asset;
   import anifire.studio.core.MotionData;
   import anifire.studio.interfaces.IMotion;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   
   public class ChangeAssetMotionCommand extends AssetCommand
   {
       
      
      private var _newMotion:MotionData;
      
      private var _oldMotion:MotionData;
      
      private var _oldShadow:Object;
      
      private var _endScaleRatio:Number = 1;
      
      public function ChangeAssetMotionCommand(param1:Asset, param2:MotionData, param3:Boolean = true, param4:Number = 1)
      {
         super(param1,param3);
         _type = "ChangeAssetMotionCommand";
         this._newMotion = param2;
         this._endScaleRatio = param4;
      }
      
      private function get motionAsset() : IMotion
      {
         return this.asset as IMotion;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this.motionAsset)
         {
            if(this.motionAsset.motionData)
            {
               this._oldMotion = this.motionAsset.motionData.clone();
               this._oldShadow = this.motionAsset.shadow;
            }
            this.motionAsset.motionData = this._newMotion;
            if(this.motionAsset.shadow is IScalable)
            {
               (this.motionAsset.shadow as IScalable).scaleX = (this.motionAsset.shadow as IScalable).scaleX * this._endScaleRatio;
               (this.motionAsset.shadow as IScalable).scaleY = (this.motionAsset.shadow as IScalable).scaleY * this._endScaleRatio;
            }
         }
      }
      
      override public function undo() : void
      {
         if(this.motionAsset)
         {
            this.motionAsset.motionData = this._oldMotion;
            if(this._oldShadow)
            {
               if(this.motionAsset.shadow is IScalable && this._oldShadow is IScalable)
               {
                  (this.motionAsset.shadow as IScalable).scaleX = (this._oldShadow as IScalable).scaleX;
                  (this.motionAsset.shadow as IScalable).scaleY = (this._oldShadow as IScalable).scaleY;
               }
               if(this.motionAsset.shadow is IResizable && this._oldShadow is IResizable)
               {
                  (this.motionAsset.shadow as IResizable).resize((this._oldShadow as IResizable).width,(this._oldShadow as IResizable).height);
               }
               if(this.motionAsset.shadow is IRotatable && this._oldShadow is IRotatable)
               {
                  (this.motionAsset.shadow as IRotatable).rotation = (this._oldShadow as IRotatable).rotation;
               }
               if(this.motionAsset.shadow is IMovable && this._oldShadow is IMovable)
               {
                  (this.motionAsset.shadow as IMovable).move((this._oldShadow as IMovable).x,(this._oldShadow as IMovable).y);
               }
            }
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(this.motionAsset)
         {
            this.motionAsset.motionData = this._newMotion;
         }
         super.redo();
      }
   }
}
