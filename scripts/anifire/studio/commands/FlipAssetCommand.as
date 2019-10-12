package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IFlippable;
   
   public class FlipAssetCommand extends AssetCommand
   {
       
      
      public function FlipAssetCommand(param1:Asset)
      {
         super(param1);
         _type = "FlipAssetCommand";
      }
      
      override public function execute() : void
      {
         if(asset is IFlippable)
         {
            IFlippable(asset).flipIt();
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         if(asset is IFlippable)
         {
            IFlippable(asset).flipIt();
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         if(asset is IFlippable)
         {
            IFlippable(asset).flipIt();
         }
         super.redo();
      }
   }
}
