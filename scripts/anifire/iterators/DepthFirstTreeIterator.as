package anifire.iterators
{
   import anifire.interfaces.IIterator;
   
   public class DepthFirstTreeIterator implements IIterator
   {
       
      
      private var _current:TreeNode;
      
      private var _tree:TreeNode;
      
      public function DepthFirstTreeIterator(param1:TreeNode)
      {
         super();
         this._tree = param1;
      }
      
      public function get hasNext() : Boolean
      {
         var _loc1_:TreeNode = null;
         if(this._current == null)
         {
            return this._tree != null;
         }
         if(this._current.firstChild)
         {
            return true;
         }
         if(this._current.nextSlibling)
         {
            return true;
         }
         _loc1_ = this._current;
         while(true)
         {
            _loc1_ = _loc1_.parent;
            if(_loc1_ == null)
            {
               break;
            }
            if(_loc1_.nextSlibling != null)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get next() : Object
      {
         if(this._current == null)
         {
            this._current = this._tree;
         }
         else if(this._current.firstChild)
         {
            this._current = this._current.firstChild;
         }
         else if(this._current.nextSlibling)
         {
            this._current = this._current.nextSlibling;
         }
         else
         {
            while(true)
            {
               this._current = this._current.parent;
               if(this._current == null)
               {
                  break;
               }
               if(this._current.nextSlibling != null)
               {
                  this._current = this._current.nextSlibling;
               }
               else
               {
                  continue;
               }
            }
            return null;
         }
         return this._current;
      }
      
      public function reset() : void
      {
         this._current = null;
      }
   }
}
