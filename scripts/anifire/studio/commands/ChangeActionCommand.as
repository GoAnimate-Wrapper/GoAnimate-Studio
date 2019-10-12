package anifire.studio.commands
{
   import anifire.studio.core.Character;
   
   public class ChangeActionCommand extends AssetCommand
   {
       
      
      protected var _toActionId:String;
      
      protected var _fromActionId:String;
      
      public function ChangeActionCommand(param1:Character, param2:String, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "ChangeActionCommand";
         this._toActionId = param2;
      }
      
      override public function execute() : void
      {
         var _loc1_:Character = asset as Character;
         if(_loc1_)
         {
            this._fromActionId = _loc1_.actionId;
            this.changeActionImpl(_loc1_,this._toActionId);
            super.execute();
         }
      }
      
      override public function undo() : void
      {
         this.changeActionImpl(asset as Character,this._fromActionId);
         super.undo();
      }
      
      override public function redo() : void
      {
         this.changeActionImpl(asset as Character,this._toActionId);
         super.redo();
      }
      
      protected function changeActionImpl(param1:Character, param2:String) : void
      {
         if(param1 && param2)
         {
            param1.setAction(param2,false,true);
         }
      }
   }
}
