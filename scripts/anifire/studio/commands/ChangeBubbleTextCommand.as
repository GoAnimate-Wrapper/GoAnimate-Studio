package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.interfaces.IMotion;
   
   public class ChangeBubbleTextCommand extends AssetCommand
   {
       
      
      private var _newText:String;
      
      private var _oldText:String;
      
      private var _switchFontCommand:ChangeBubbleFontCommand;
      
      private var _shadowCommand:ChangeBubbleTextCommand;
      
      public function ChangeBubbleTextCommand(param1:Asset, param2:String, param3:String, param4:Boolean = true)
      {
         super(param1,param4);
         _type = "ChangeBubbleTextCommand";
         this._newText = param2;
         this._switchFontCommand = new ChangeBubbleFontCommand(param1,param3,true,false);
         if(param1 is IMotion && (param1 as IMotion).shadow is Asset)
         {
            this._shadowCommand = new ChangeBubbleTextCommand((param1 as IMotion).shadow as Asset,param2,param3,true);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         this._oldText = _loc1_.text;
         if(this._newText != this._oldText)
         {
            super.execute();
            _loc1_.text = this._newText;
            _loc1_.bubble.backupText = this._newText;
            if(this._switchFontCommand)
            {
               this._switchFontCommand.execute();
            }
            if(this._shadowCommand)
            {
               this._shadowCommand.execute();
            }
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         if(this._shadowCommand)
         {
            this._shadowCommand.undo();
         }
         if(this._switchFontCommand)
         {
            this._switchFontCommand.undo();
         }
         _loc1_.text = this._oldText;
         _loc1_.bubble.backupText = this._oldText;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.text = this._newText;
         _loc1_.bubble.backupText = this._newText;
         if(this._switchFontCommand)
         {
            this._switchFontCommand.redo();
         }
         if(this._shadowCommand)
         {
            this._shadowCommand.redo();
         }
         super.redo();
      }
   }
}
