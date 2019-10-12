package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.CollectiveCommand;
   import anifire.studio.commands.ICommand;
   
   public class AlterCharacterTransitionsCommand extends CollectiveCommand
   {
       
      
      public function AlterCharacterTransitionsCommand(param1:String, param2:Boolean = true)
      {
         var _loc4_:ICommand = null;
         var _loc5_:AssetTransition = null;
         super(param2);
         _type = "AlterCharacterTransitionsCommand";
         var _loc3_:Array = AssetTransitionHelper.getTransitions(param1,scene.assetTransitions);
         if(_loc3_ && _loc3_.length > 0)
         {
            for each(_loc5_ in _loc3_)
            {
               _loc4_ = null;
               if(_loc5_.direction == AssetTransitionConstants.DIRECTION_IN)
               {
                  _loc4_ = new ChangeSectionCommand(_loc5_,AssetTransitionConstants.TIMING_BEFORE_NARRATION,false);
               }
               else if(_loc5_.direction == AssetTransitionConstants.DIRECTION_OUT)
               {
                  _loc4_ = new ChangeSectionCommand(_loc5_,AssetTransitionConstants.TIMING_AFTER_NARRATION,false);
               }
               if(_loc4_)
               {
                  this.addCommand(_loc4_);
               }
            }
         }
      }
   }
}
