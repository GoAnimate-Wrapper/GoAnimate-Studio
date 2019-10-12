package anifire.studio.commands
{
   import anifire.constant.LicenseConstants;
   import anifire.effect.ZoomEffect;
   import anifire.studio.core.Asset;
   import anifire.studio.core.ProgramEffectAsset;
   
   public class RemoveCameraCommand extends AssetCommand
   {
       
      
      private var _slideCommand:SlideAssetCommand;
      
      private var _resizeCameraCompositionCommand:ResizeCameraCompositionCommand;
      
      public function RemoveCameraCommand(param1:Asset, param2:Boolean = true)
      {
         super(param1,param2);
         var _loc3_:ProgramEffectAsset = this.asset as ProgramEffectAsset;
         if(_loc3_)
         {
            if(_loc3_.isSliding)
            {
               this._slideCommand = new SlideAssetCommand(param1,false,false);
            }
            this._resizeCameraCompositionCommand = new ResizeCameraCompositionCommand(param1,LicenseConstants.getStageRect(),false);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:ProgramEffectAsset = this.asset as ProgramEffectAsset;
         if(!_loc1_)
         {
            return;
         }
         super.execute();
         if(this._slideCommand)
         {
            this._slideCommand.execute();
            ZoomEffect(_loc1_.effect).isPan = false;
         }
         if(this._resizeCameraCompositionCommand)
         {
            this._resizeCameraCompositionCommand.execute();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:ProgramEffectAsset = this.asset as ProgramEffectAsset;
         if(!_loc1_)
         {
            return;
         }
         if(this._resizeCameraCompositionCommand)
         {
            this._resizeCameraCompositionCommand.undo();
         }
         if(this._slideCommand)
         {
            this._slideCommand.undo();
            ZoomEffect(_loc1_.effect).isPan = true;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:ProgramEffectAsset = this.asset as ProgramEffectAsset;
         if(!_loc1_)
         {
            return;
         }
         if(this._slideCommand)
         {
            this._slideCommand.redo();
            ZoomEffect(_loc1_.effect).isPan = false;
         }
         if(this._resizeCameraCompositionCommand)
         {
            this._resizeCameraCompositionCommand.redo();
         }
         super.redo();
      }
   }
}
