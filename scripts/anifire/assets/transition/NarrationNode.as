package anifire.assets.transition
{
   import anifire.interfaces.ITiming;
   import anifire.iterators.TreeNode;
   
   public class NarrationNode extends TreeNode implements ITiming
   {
       
      
      private var _duration:int = 0;
      
      private var _delay:int = 0;
      
      public function NarrationNode()
      {
         super();
      }
      
      public function init(param1:int, param2:int) : void
      {
         this._delay = param1;
         this._duration = param2;
      }
      
      public function get duration() : int
      {
         if(this.parent)
         {
            return this._duration;
         }
         return 0;
      }
      
      public function get startFrame() : int
      {
         if(this.parent is ITiming)
         {
            return ITiming(this.parent).startFrame + ITiming(this.parent).duration + this._delay;
         }
         return 1;
      }
      
      public function get endFrame() : int
      {
         return this.startFrame + this.duration - 1;
      }
   }
}
