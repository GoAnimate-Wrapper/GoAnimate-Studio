package anifire.studio.commands
{
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Console;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.IScalable;
   
   public class ResizeAssetCollectionCommand extends CollectiveCommand
   {
       
      
      public function ResizeAssetCollectionCommand(param1:AssetViewCollection, param2:Boolean = true)
      {
         var _loc3_:IAssetView = null;
         var _loc4_:Asset = null;
         var _loc5_:IIterator = null;
         super(param2);
         _type = "ResizeAssetCollectionCommand";
         if(param1)
         {
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc3_ = IAssetView(_loc5_.next);
               _loc4_ = _loc3_.asset;
               if(_loc4_ is IResizable)
               {
                  this.addCommand(new ResizeAssetCommand(_loc4_,false));
               }
               if(_loc4_ is IScalable)
               {
                  this.addCommand(new ScaleAssetCommand(_loc4_,false));
               }
               if(_loc4_ is IMovable)
               {
                  this.addCommand(new MoveAssetCommand(_loc4_,false));
               }
            }
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         this.updateConsole();
      }
      
      override public function redo() : void
      {
         super.redo();
         this.updateConsole();
      }
      
      protected function updateConsole() : void
      {
         var _loc1_:Console = Console.getConsole();
         _loc1_.sceneEditor.updateControl();
         _loc1_.sceneEditor.showControl();
         _loc1_.changed = true;
      }
   }
}
