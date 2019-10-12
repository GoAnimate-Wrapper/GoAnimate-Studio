package anifire.studio.core
{
   import anifire.component.ActionSequence;
   import anifire.interfaces.ISequentialAction;
   
   public class SequentialAction extends Action implements ISequentialAction
   {
       
      
      private var _actionSequence:ActionSequence;
      
      public function SequentialAction(param1:CharThumb, param2:String, param3:String, param4:int, param5:String, param6:String, param7:Vector.<XML> = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7);
         this._actionSequence = new ActionSequence();
      }
      
      public function get actionSequence() : ActionSequence
      {
         return this._actionSequence;
      }
   }
}
