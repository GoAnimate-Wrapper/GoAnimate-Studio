package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.interfaces.IMotion;
   
   public class ChangeBubbleFontCommand extends AssetCommand
   {
       
      
      private var _newFontName:String;
      
      private var _oldFontName:String;
      
      private var _newTextEmbed:Boolean;
      
      private var _oldTextEmbed:Boolean;
      
      private var _shadowCommand:ChangeBubbleFontCommand;
      
      public function ChangeBubbleFontCommand(param1:Asset, param2:String, param3:Boolean, param4:Boolean = true)
      {
         super(param1,param4);
         _type = "ChangeBubbleFontCommand";
         this._newFontName = param2;
         this._newTextEmbed = param3;
         if(param1 is IMotion && (param1 as IMotion).shadow is Asset)
         {
            this._shadowCommand = new ChangeBubbleFontCommand((param1 as IMotion).shadow as Asset,param2,param3,false);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         this._oldFontName = _loc1_.textFont;
         this._oldTextEmbed = _loc1_.textEmbed;
         if(this._newFontName != this._oldFontName)
         {
            super.execute();
            _loc1_.textFont = this._newFontName;
            _loc1_.textEmbed = this._newTextEmbed;
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
         _loc1_.textFont = this._oldFontName;
         _loc1_.textEmbed = this._oldTextEmbed;
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:BubbleAsset = this.asset as BubbleAsset;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.textFont = this._newFontName;
         _loc1_.textEmbed = this._newTextEmbed;
         if(this._shadowCommand)
         {
            this._shadowCommand.redo();
         }
         super.redo();
      }
   }
}
