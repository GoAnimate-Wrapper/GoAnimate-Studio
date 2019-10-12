package anifire.studio.commands
{
   import anifire.studio.core.EffectAsset;
   
   public class ChangeEffectAssetTimingCommand extends AssetCommand
   {
       
      
      private var _oldSpanWholeScene:Boolean;
      
      private var _oldStartFrame:int;
      
      private var _oldDuration:int;
      
      private var _newSpanWholeScene:Boolean;
      
      private var _newStartFrame:int;
      
      private var _newDuration:int;
      
      public function ChangeEffectAssetTimingCommand(param1:EffectAsset, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ChangeEffectAssetTimingCommand";
         this._oldSpanWholeScene = param1.spanWholeScene;
         this._oldStartFrame = param1.startFrame;
         this._oldDuration = param1.duration;
      }
      
      public function executeNow(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1 == this._oldSpanWholeScene && param2 == this._oldStartFrame && param3 == this._oldDuration)
         {
            return;
         }
         super.execute();
         this._newSpanWholeScene = param1;
         this._newStartFrame = param2;
         this._newDuration = param3;
         var _loc4_:EffectAsset = this.asset as EffectAsset;
         if(_loc4_)
         {
            _loc4_.startFrame = param2;
            _loc4_.duration = param3;
            _loc4_.spanWholeScene = param1;
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:EffectAsset = this.asset as EffectAsset;
         if(_loc1_)
         {
            _loc1_.startFrame = this._oldStartFrame;
            _loc1_.duration = this._oldDuration;
            _loc1_.spanWholeScene = this._oldSpanWholeScene;
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:EffectAsset = this.asset as EffectAsset;
         if(_loc1_)
         {
            _loc1_.startFrame = this._newStartFrame;
            _loc1_.duration = this._newDuration;
            _loc1_.spanWholeScene = this._newSpanWholeScene;
         }
         super.redo();
      }
   }
}
