package anifire.studio.commands
{
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.interfaces.IAssetView;
   
   public class ChangeBubbleGroupCommand extends CollectiveCommand
   {
       
      
      public function ChangeBubbleGroupCommand(param1:AssetViewCollection, param2:Boolean = true)
      {
         var _loc3_:IAssetView = null;
         var _loc4_:IIterator = null;
         super(param2);
         _type = "ChangeBubbleGroupCommand";
         if(param1)
         {
            _loc4_ = param1.iterator();
            while(_loc4_.hasNext)
            {
               _loc3_ = IAssetView(_loc4_.next);
               this.addCommand(new ChangeBubbleCommand(_loc3_.asset,false));
            }
         }
      }
   }
}
