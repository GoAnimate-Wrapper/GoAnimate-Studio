package anifire.studio.commands
{
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.util.UtilErrorLogger;
   
   public class SuperCommand implements ICommand
   {
       
      
      protected var _type:String = "SuperCommand";
      
      protected var _sceneId:String = null;
      
      private var _undoSceneXmlStr:String;
      
      private var _redoSceneXmlStr:String;
      
      public function SuperCommand(param1:String = "")
      {
         super();
         if(param1 == "")
         {
            param1 = Console.getConsole().currentSceneId;
         }
         this._sceneId = param1;
      }
      
      protected function set sceneId(param1:String) : void
      {
         this._sceneId = param1;
      }
      
      protected function get sceneId() : String
      {
         return this._sceneId;
      }
      
      public function undo() : void
      {
         this.superUndo();
      }
      
      public function redo() : void
      {
         this.superRedo();
      }
      
      protected function superUndo() : void
      {
         var scene:AnimeScene = null;
         try
         {
            scene = Console.getConsole().getScenebyId(this._sceneId);
            if(scene)
            {
               this._redoSceneXmlStr = scene.serialize(-1,false);
               if(this._undoSceneXmlStr)
               {
                  this.restoreSceneData(new XML(this._undoSceneXmlStr));
               }
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("SuperCommand:undo",e);
            return;
         }
      }
      
      protected function superRedo() : void
      {
         try
         {
            if(this._redoSceneXmlStr)
            {
               this.restoreSceneData(new XML(this._redoSceneXmlStr));
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("SuperCommand:redo",e);
            return;
         }
      }
      
      public function execute() : void
      {
         CommandStack.getInstance().putCommand(this);
      }
      
      public function set sceneUndoXML(param1:XML) : void
      {
         this._undoSceneXmlStr = param1.toXMLString();
      }
      
      protected function backupSceneData() : XML
      {
         var scene:AnimeScene = Console.getConsole().getScenebyId(this._sceneId);
         try
         {
            if(scene)
            {
               this._undoSceneXmlStr = scene.serialize(-1,false);
               return new XML(this._undoSceneXmlStr);
            }
         }
         catch(e:Error)
         {
            _undoSceneXmlStr = null;
            UtilErrorLogger.getInstance().appendCustomError("SuperCommand:backupSceneData",e);
            return new XML();
         }
         return null;
      }
      
      protected function restoreSceneData(param1:XML) : void
      {
         var _loc2_:AnimeScene = Console.getConsole().getScenebyId(this._sceneId);
         if(_loc2_)
         {
            _loc2_.deSerialize(param1,true,true,false);
            _loc2_.refreshEffectTray();
            if(Console.getConsole().currentSceneId != this.sceneId)
            {
               Console.getConsole().setCurrentSceneById(this.sceneId);
            }
         }
      }
      
      public function toString() : String
      {
         return this._type;
      }
   }
}
