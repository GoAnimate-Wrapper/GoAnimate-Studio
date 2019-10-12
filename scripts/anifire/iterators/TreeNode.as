package anifire.iterators
{
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   
   public class TreeNode implements ICollection
   {
       
      
      private var _children:Array;
      
      private var _parent:TreeNode;
      
      private var _data:Object;
      
      public function TreeNode()
      {
         this._children = new Array();
         super();
      }
      
      public function addNode(param1:TreeNode) : Boolean
      {
         if(param1)
         {
            param1.parent = this;
            this._children.push(param1);
            return true;
         }
         return false;
      }
      
      public function get root() : TreeNode
      {
         var _loc1_:TreeNode = this;
         while(_loc1_.parent)
         {
            _loc1_ = _loc1_.parent;
         }
         return _loc1_;
      }
      
      public function get nextSlibling() : TreeNode
      {
         var _loc1_:Number = NaN;
         if(this._parent)
         {
            _loc1_ = this._parent.children.indexOf(this);
            _loc1_++;
            if(_loc1_ < this._parent.children.length)
            {
               return this._parent.children[_loc1_];
            }
         }
         return null;
      }
      
      public function get firstChild() : TreeNode
      {
         if(this._children.length > 0)
         {
            return this._children[0];
         }
         return null;
      }
      
      public function get children() : Array
      {
         return this._children;
      }
      
      public function get parent() : TreeNode
      {
         return this._parent;
      }
      
      public function set parent(param1:TreeNode) : void
      {
         this._parent = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         return new DepthFirstTreeIterator(this);
      }
   }
}
