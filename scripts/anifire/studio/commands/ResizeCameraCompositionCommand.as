package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.managers.SceneManager;
   import flash.geom.Rectangle;
   
   public class ResizeCameraCompositionCommand extends AssetCommand
   {
       
      
      private var _oldRect:Rectangle;
      
      private var _newRect:Rectangle;
      
      public function ResizeCameraCompositionCommand(param1:Asset, param2:Rectangle, param3:Boolean = true)
      {
         super(param1,param3);
         this._newRect = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:ProgramEffectAsset = this.asset as ProgramEffectAsset;
         if(!_loc1_)
         {
            return;
         }
         this._oldRect = new Rectangle(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
         if(!this._newRect || this._oldRect.equals(this._newRect))
         {
            return;
         }
         super.execute();
         _loc1_.width = this._newRect.width;
         _loc1_.height = this._newRect.height;
         _loc1_.move(this._newRect.x,this._newRect.y);
         SceneManager.checkCameraSize(_loc1_.height);
      }
      
      override public function undo() : void
      {
         if(!this._oldRect || !this._newRect || this._oldRect.equals(this._newRect))
         {
            return;
         }
         var _loc1_:ProgramEffectAsset = this.asset as ProgramEffectAsset;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.width = this._oldRect.width;
         _loc1_.height = this._oldRect.height;
         _loc1_.move(this._oldRect.x,this._oldRect.y);
         super.undo();
      }
      
      override public function redo() : void
      {
         if(!this._oldRect || !this._newRect || this._oldRect.equals(this._newRect))
         {
            return;
         }
         var _loc1_:ProgramEffectAsset = this.asset as ProgramEffectAsset;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.width = this._newRect.width;
         _loc1_.height = this._newRect.height;
         _loc1_.move(this._newRect.x,this._newRect.y);
         super.redo();
      }
   }
}
