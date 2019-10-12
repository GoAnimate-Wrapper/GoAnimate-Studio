package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   
   public class PasteCameraCommand extends SceneCommand
   {
       
      
      private var _sourceCamera:Asset;
      
      private var _oldCamera:Asset;
      
      public function PasteCameraCommand(param1:Asset, param2:Boolean = true)
      {
         super(param2);
         this._sourceCamera = param1;
      }
      
      override public function execute() : void
      {
         super.execute();
         try
         {
            if(this._sourceCamera)
            {
               this._oldCamera = this.scene.camera;
               this.scene.deserializeAsset(this._sourceCamera.convertToXml(),true,false);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function undo() : void
      {
         try
         {
            if(this._oldCamera)
            {
               this.scene.deserializeAsset(this._oldCamera.convertToXml(),true,false);
            }
         }
         catch(e:Error)
         {
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         try
         {
            if(this._sourceCamera)
            {
               this._oldCamera = this.scene.camera;
               this.scene.deserializeAsset(this._sourceCamera.convertToXml(),true,false);
            }
         }
         catch(e:Error)
         {
         }
         super.redo();
      }
   }
}
