package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.models.AssetSelection;
   import anifire.studio.commands.CollectiveCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.Asset;
   
   public class AddAssetCollectionTransitionCommand extends CollectiveCommand
   {
       
      
      public function AddAssetCollectionTransitionCommand(param1:AssetSelection, param2:uint)
      {
         var _loc3_:IIterator = null;
         var _loc4_:ICommand = null;
         var _loc5_:Asset = null;
         var _loc6_:Array = null;
         var _loc7_:uint = 0;
         super();
         _type = "AddAssetCollectionTransitionCommand";
         if(param1)
         {
            _loc3_ = param1.iterator();
            _loc6_ = new Array();
            if(_loc3_)
            {
               while(_loc3_.hasNext)
               {
                  _loc5_ = _loc3_.next as Asset;
                  if(_loc5_)
                  {
                     _loc6_.push(_loc5_);
                  }
               }
            }
            _loc6_.sort(this.scene.compareAssetOrdering);
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               _loc5_ = _loc6_[_loc7_] as Asset;
               if(_loc5_)
               {
                  _loc4_ = new OverwriteAssetTransitionCommand(_loc5_,param2,_loc7_ == 0?uint(AssetTransitionConstants.TIMING_AFTER_PREVIOUS):uint(AssetTransitionConstants.TIMING_WITH_PREVIOUS),false);
                  this.addCommand(_loc4_);
               }
               _loc7_++;
            }
         }
      }
   }
}
