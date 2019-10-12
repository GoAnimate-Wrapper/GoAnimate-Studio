package anifire.studio.assets.models
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.AssetTransitionNode;
   import anifire.assets.transition.NarrationNode;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.ITiming;
   import anifire.iterators.TreeNode;
   
   public class AssetTransitionTreeNode extends TreeNode implements ITiming
   {
       
      
      public function AssetTransitionTreeNode(param1:AssetTransition = null)
      {
         super();
         this.data = param1;
      }
      
      public static function getTreeFromTransitionCollection(param1:AssetTransitionCollection, param2:NarrationNode = null) : TreeNode
      {
         var _loc7_:AssetTransitionTreeNode = null;
         var _loc8_:AssetTransition = null;
         var _loc9_:IIterator = null;
         var _loc3_:AssetTransitionNode = new AssetTransitionNode();
         var _loc4_:TreeNode = _loc3_;
         var _loc5_:TreeNode = _loc3_;
         var _loc6_:TreeNode = _loc3_;
         if(param1)
         {
            _loc9_ = param1.iterator();
            while(_loc9_.hasNext)
            {
               _loc8_ = _loc9_.next as AssetTransition;
               if(_loc8_ && _loc8_.section == AssetTransitionConstants.TIMING_BEFORE_NARRATION)
               {
                  _loc7_ = new AssetTransitionTreeNode(_loc8_);
                  switch(_loc8_.timing)
                  {
                     case AssetTransitionConstants.TIMING_WITH_PREVIOUS:
                        if(_loc4_.parent && _loc4_ != _loc6_)
                        {
                           _loc4_ = _loc4_.parent;
                        }
                        break;
                     case AssetTransitionConstants.TIMING_ON_START:
                        _loc4_ = _loc6_;
                  }
                  _loc4_.addNode(_loc7_);
                  _loc4_ = _loc7_;
                  if(_loc5_ is ITiming && _loc7_.endFrame > ITiming(_loc5_).endFrame)
                  {
                     _loc5_ = _loc7_;
                  }
               }
            }
            _loc4_ = _loc6_ = _loc5_;
            _loc9_.reset();
            while(_loc9_.hasNext)
            {
               _loc8_ = _loc9_.next as AssetTransition;
               if(_loc8_ && _loc8_.section == AssetTransitionConstants.TIMING_WITH_NARRATION)
               {
                  _loc7_ = new AssetTransitionTreeNode(_loc8_);
                  switch(_loc8_.timing)
                  {
                     case AssetTransitionConstants.TIMING_WITH_PREVIOUS:
                        if(_loc4_.parent && _loc4_ != _loc6_)
                        {
                           _loc4_ = _loc4_.parent;
                        }
                        break;
                     case AssetTransitionConstants.TIMING_ON_START:
                        _loc4_ = _loc6_;
                  }
                  _loc4_.addNode(_loc7_);
                  _loc4_ = _loc7_;
                  if(_loc5_ is ITiming && _loc7_.endFrame > ITiming(_loc5_).endFrame)
                  {
                     _loc5_ = _loc7_;
                  }
               }
            }
            if(param2)
            {
               _loc6_.addNode(param2);
               if(_loc5_ is ITiming && param2.endFrame > ITiming(_loc5_).endFrame)
               {
                  _loc5_ = param2;
               }
            }
            _loc4_ = _loc6_ = _loc5_;
            _loc9_.reset();
            while(_loc9_.hasNext)
            {
               _loc8_ = _loc9_.next as AssetTransition;
               if(_loc8_ && _loc8_.section == AssetTransitionConstants.TIMING_AFTER_NARRATION)
               {
                  _loc7_ = new AssetTransitionTreeNode(_loc8_);
                  switch(_loc8_.timing)
                  {
                     case AssetTransitionConstants.TIMING_WITH_PREVIOUS:
                        if(_loc4_.parent && _loc4_ != _loc6_)
                        {
                           _loc4_ = _loc4_.parent;
                        }
                        break;
                     case AssetTransitionConstants.TIMING_ON_START:
                        _loc4_ = _loc6_;
                  }
                  _loc4_.addNode(_loc7_);
                  _loc4_ = _loc7_;
                  if(_loc5_ is ITiming && _loc7_.endFrame > ITiming(_loc5_).endFrame)
                  {
                     _loc5_ = _loc7_;
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function get transition() : AssetTransition
      {
         return this.data as AssetTransition;
      }
      
      public function get assetId() : String
      {
         return this.transition.assetId;
      }
      
      public function get duration() : int
      {
         if(this.parent)
         {
            return this.transition.duration;
         }
         return 0;
      }
      
      public function get startFrame() : int
      {
         if(this.parent is ITiming)
         {
            return ITiming(this.parent).startFrame + ITiming(this.parent).duration + this.transition.delay;
         }
         return 1;
      }
      
      public function get endFrame() : int
      {
         return this.startFrame + this.duration - 1;
      }
   }
}
