package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   
   public class SendBackwardCommand extends AssetCommand
   {
       
      
      public function SendBackwardCommand(param1:Asset)
      {
         super(param1);
         _type = "SendBackwardCommand";
      }
      
      override public function execute() : void
      {
         if(this.scene)
         {
            if(this.scene.sendBackward(this.asset))
            {
               super.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         if(scene)
         {
            scene.bringForward(asset);
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(scene)
         {
            scene.sendBackward(asset);
         }
         super.redo();
      }
   }
}
