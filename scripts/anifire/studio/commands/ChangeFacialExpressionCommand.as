package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.Character;
   
   public class ChangeFacialExpressionCommand extends AssetCommand
   {
       
      
      protected var _toFacialId:String;
      
      protected var _fromFacialId:String;
      
      public function ChangeFacialExpressionCommand(param1:Asset, param2:String)
      {
         super(param1,true);
         _type = "ChangeFacialExpressionCommand";
         this._toFacialId = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            this._fromFacialId = _loc1_.facialId;
            _loc1_.changeFacialById(this._toFacialId);
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            _loc1_.changeFacialById(this._fromFacialId);
            super.undo();
         }
      }
      
      override public function redo() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            _loc1_.changeFacialById(this._toFacialId);
            super.redo();
         }
      }
   }
}
