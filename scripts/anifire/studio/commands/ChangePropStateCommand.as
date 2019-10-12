package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.Character;
   import anifire.studio.core.Prop;
   import anifire.studio.core.State;
   
   public class ChangePropStateCommand extends AssetCommand
   {
       
      
      protected var _fromState:State;
      
      protected var _toState:State;
      
      protected var _charId:String;
      
      public function ChangePropStateCommand(param1:Asset, param2:State)
      {
         super(param1,true);
         _type = "ChangePropStateCommand";
         this._toState = param2;
         var _loc3_:Prop = param1 as Prop;
         if(_loc3_.char)
         {
            this._charId = _loc3_.char.id;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:Prop = this.getProp();
         if(_loc1_)
         {
            this._fromState = _loc1_.state;
            _loc1_.changeState(this._toState);
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Prop = this.getProp();
         _loc1_.changeState(this._fromState);
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Prop = this.getProp();
         _loc1_.changeState(this._toState);
         super.redo();
      }
      
      protected function getProp() : Prop
      {
         var _loc1_:Prop = null;
         var _loc2_:Character = null;
         if(this._charId)
         {
            _loc2_ = scene.getAssetById(this._charId) as Character;
            if(_loc2_.prop && _loc2_.prop.id == _assetId)
            {
               _loc1_ = _loc2_.prop;
            }
            else if(_loc2_.head && _loc2_.head.id == _assetId)
            {
               _loc1_ = _loc2_.head;
            }
         }
         else
         {
            _loc1_ = asset as Prop;
         }
         return _loc1_;
      }
   }
}
