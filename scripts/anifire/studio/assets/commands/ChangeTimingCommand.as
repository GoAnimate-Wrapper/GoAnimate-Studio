package anifire.studio.assets.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.ICommand;
   
   public class ChangeTimingCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _oldTiming:uint;
      
      private var _newTiming:uint;
      
      private var _command:ICommand;
      
      public function ChangeTimingCommand(param1:AssetTransition, param2:uint, param3:Boolean = true)
      {
         super(param1,param3);
         this._newTiming = param2;
         this._oldTiming = param1.timing;
         if(this._newTiming == AssetTransitionConstants.TIMING_WHOLE_SCENE)
         {
            if(param1.section != AssetTransitionConstants.TIMING_WHOLE_SCENE)
            {
               this._command = new ChangeSectionCommand(param1,AssetTransitionConstants.TIMING_WHOLE_SCENE,false);
               this._newTiming = this._oldTiming;
            }
         }
         else if(this.transition.section == AssetTransitionConstants.TIMING_WHOLE_SCENE)
         {
            this._command = new ChangeSectionCommand(param1,AssetTransitionConstants.TIMING_WITH_NARRATION,false);
         }
         _type = "ChangeTimingCommand";
      }
      
      override public function execute() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:AssetTransition = this.transition;
         if(_loc2_ && this._newTiming != this._oldTiming)
         {
            _loc2_.timing = this._newTiming;
            _loc1_ = true;
         }
         if(this._command)
         {
            this._command.execute();
            _loc1_ = true;
         }
         if(_loc1_)
         {
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:AssetTransition = this.transition;
         if(_loc1_)
         {
            _loc1_.timing = this._oldTiming;
         }
         if(this._command)
         {
            this._command.undo();
         }
         selectTargetScene();
      }
      
      override public function redo() : void
      {
         var _loc1_:AssetTransition = this.transition;
         if(_loc1_ && this._newTiming != this._oldTiming)
         {
            _loc1_.timing = this._newTiming;
         }
         if(this._command)
         {
            this._command.redo();
         }
         selectTargetScene();
      }
   }
}
