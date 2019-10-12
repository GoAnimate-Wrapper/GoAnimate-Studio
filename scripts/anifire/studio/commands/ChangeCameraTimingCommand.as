package anifire.studio.commands
{
   import anifire.studio.core.EffectAsset;
   
   public class ChangeCameraTimingCommand extends AssetCommand
   {
       
      
      private var _oldSpanWholeScene:Boolean;
      
      private var _oldStartFrame:int;
      
      private var _oldStartDuration:int;
      
      private var _newSpanWholeScene:Boolean;
      
      private var _newStartFrame:int;
      
      private var _newStartDuration:int;
      
      public function ChangeCameraTimingCommand(param1:EffectAsset, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ChangeCameraTimingCommand";
         this._oldSpanWholeScene = param1.spanWholeScene;
         this._oldStartFrame = param1.startFrame;
         this._oldStartDuration = param1.startDuration;
      }
      
      public function executeNow(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1 == this._oldSpanWholeScene && param2 == this._oldStartFrame && param3 == this._oldStartDuration)
         {
            return;
         }
         super.execute();
         this._newSpanWholeScene = param1;
         this._newStartFrame = param2;
         this._newStartDuration = param3;
         var _loc4_:EffectAsset = this.asset as EffectAsset;
         if(_loc4_)
         {
            _loc4_.startFrame = param2;
            _loc4_.startDuration = param3;
            _loc4_.spanWholeScene = param1;
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:EffectAsset = this.asset as EffectAsset;
         if(_loc1_)
         {
            _loc1_.startFrame = this._oldStartFrame;
            _loc1_.startDuration = this._oldStartDuration;
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
            _loc1_.startDuration = this._newStartDuration;
            _loc1_.spanWholeScene = this._newSpanWholeScene;
         }
         super.redo();
      }
   }
}
