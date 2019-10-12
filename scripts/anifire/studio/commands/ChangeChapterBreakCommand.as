package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   
   public class ChangeChapterBreakCommand extends SceneCommand
   {
       
      
      private var _oldValue:Boolean;
      
      private var _newValue:Boolean;
      
      public function ChangeChapterBreakCommand(param1:AnimeScene, param2:Boolean, param3:Boolean = true)
      {
         super(param3,param1);
         this._newValue = param2;
         _type = "ChangeChapterBreakCommand";
      }
      
      override public function execute() : void
      {
         var _loc1_:AnimeScene = this.scene;
         this._oldValue = _loc1_.chapterBreak;
         _loc1_.chapterBreak = this._newValue;
         super.execute();
      }
      
      override public function undo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         _loc1_.chapterBreak = this._oldValue;
      }
      
      override public function redo() : void
      {
         var _loc1_:AnimeScene = this.scene;
         _loc1_.chapterBreak = this._newValue;
      }
   }
}
