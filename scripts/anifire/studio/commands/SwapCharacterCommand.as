package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   
   public class SwapCharacterCommand extends AssetCommand
   {
       
      
      protected var _oldThumb:CharThumb;
      
      protected var _newThumb:CharThumb;
      
      protected var _oldActionId:String;
      
      protected var _newActionId:String;
      
      protected var _oldFacialId:String;
      
      public function SwapCharacterCommand(param1:Asset, param2:CharThumb, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "SwapCharacterCommand";
         this._newThumb = param2;
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            this._oldActionId = _loc1_.actionId;
            this._oldThumb = CharThumb(_loc1_.thumb);
            this._oldFacialId = _loc1_.facialId;
            _loc1_.swapWithThumb(this._newThumb);
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            this._newActionId = _loc1_.actionId;
            _loc1_.swapWithThumb(this._oldThumb,this._oldActionId,this._oldFacialId);
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            _loc1_.swapWithThumb(this._newThumb,this._newActionId);
         }
      }
   }
}
