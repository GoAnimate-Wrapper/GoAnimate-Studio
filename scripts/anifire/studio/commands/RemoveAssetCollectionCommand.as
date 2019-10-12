package anifire.studio.commands
{
   import anifire.interfaces.IIterator;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.ProgramEffectAsset;
   
   public class RemoveAssetCollectionCommand extends CollectiveCommand
   {
       
      
      public function RemoveAssetCollectionCommand(param1:IIterator, param2:Boolean = true)
      {
         var _loc3_:Asset = null;
         super(param2);
         _type = "RemoveAssetCollectionCommand";
         if(param1)
         {
            while(param1.hasNext)
            {
               _loc3_ = param1.next as Asset;
               if(_loc3_ is Background)
               {
                  this.addCommand(new RemoveBackgroundCommand(_loc3_ as Background,false));
               }
               else if(!(_loc3_ is ProgramEffectAsset && (_loc3_ as ProgramEffectAsset).isCamera))
               {
                  if(_loc3_)
                  {
                     this.addCommand(new RemoveAssetCommand(_loc3_,false));
                  }
               }
            }
         }
      }
      
      override public function execute() : void
      {
         disableSoundOverlapCheck();
         super.execute();
         enableSoundOverlapCheck();
      }
      
      override public function undo() : void
      {
         disableSoundOverlapCheck();
         super.undo();
         enableSoundOverlapCheck();
      }
      
      override public function redo() : void
      {
         this.scene.selection.clearCollection();
         super.redo();
      }
   }
}
