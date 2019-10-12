package anifire.studio.assets.commands
{
   import anifire.studio.assets.models.AssetTransition;
   
   public class ChangeSectionCommand extends ChangeAssetTransitionCommand
   {
       
      
      private var _oldSection:uint;
      
      private var _newSection:uint;
      
      private var _oldIndex:int;
      
      public function ChangeSectionCommand(param1:AssetTransition, param2:uint, param3:Boolean = true)
      {
         super(param1,param3);
         this._newSection = param2;
         _type = "ChangeSectionCommand";
      }
      
      override public function execute() : void
      {
         var _loc1_:AssetTransition = this.transition;
         if(_loc1_)
         {
            this._oldSection = _loc1_.section;
            if(this._newSection != this._oldSection)
            {
               this._oldIndex = this.scene.assetTransitions.getTransitionIndex(_loc1_);
               _loc1_.section = this._newSection;
               super.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:AssetTransition = this.transition;
         if(_loc1_ && this._oldSection != _loc1_.section)
         {
            this.scene.assetTransitions.removeTransition(_loc1_);
            _loc1_.section = this._oldSection;
            this.scene.assetTransitions.addTransitionAt(_loc1_,this._oldIndex);
            this.selectTargetScene();
         }
      }
      
      override public function redo() : void
      {
         var _loc1_:AssetTransition = this.transition;
         if(_loc1_ && this._newSection != _loc1_.section)
         {
            this._oldIndex = this.scene.assetTransitions.getTransitionIndex(_loc1_);
            this._oldSection = _loc1_.section;
            _loc1_.section = this._newSection;
            this.selectTargetScene();
         }
      }
   }
}
