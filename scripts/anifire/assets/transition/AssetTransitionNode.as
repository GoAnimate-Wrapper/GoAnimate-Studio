package anifire.assets.transition
{
   import anifire.interfaces.ITiming;
   import anifire.iterators.TreeNode;
   
   public class AssetTransitionNode extends TreeNode implements ITiming
   {
       
      
      private var _assetId:String;
      
      private var _duration:int = 0;
      
      private var _delay:int = 0;
      
      private var _type:String;
      
      public function AssetTransitionNode()
      {
         super();
      }
      
      public static function getTreeFromXml(param1:XML, param2:NarrationNode = null) : TreeNode
      {
         var _loc7_:AssetTransitionNode = null;
         var _loc8_:XML = null;
         var _loc3_:AssetTransitionNode = new AssetTransitionNode();
         var _loc4_:TreeNode = _loc3_;
         var _loc5_:TreeNode = _loc3_;
         var _loc6_:TreeNode = _loc3_;
         var _loc9_:int = -1;
         if(param1.hasOwnProperty(AssetTransitionConstants.TAG_NAME_TRANSITION))
         {
            for each(_loc8_ in param1.child(AssetTransitionConstants.TAG_NAME_TRANSITION))
            {
               if(!_loc8_.hasOwnProperty("@section"))
               {
                  _loc7_ = new AssetTransitionNode();
                  _loc7_.init(_loc8_);
                  switch(int(_loc8_.@timing))
                  {
                     case AssetTransitionConstants.TIMING_WITH_PREVIOUS:
                        if(_loc4_.parent)
                        {
                           _loc4_ = _loc4_.parent;
                        }
                        break;
                     case AssetTransitionConstants.TIMING_ON_START:
                        _loc4_ = _loc6_;
                        break;
                     case AssetTransitionConstants.TIMING_AFTER_NARRATION:
                        _loc4_ = !!param2?param2:_loc3_;
                        if(param2 && !param2.parent)
                        {
                           _loc3_.addNode(param2);
                        }
                  }
                  _loc4_.addNode(_loc7_);
                  _loc4_ = _loc7_;
               }
            }
            _loc4_ = _loc6_ = _loc5_;
            for each(_loc8_ in param1.child(AssetTransitionConstants.TAG_NAME_TRANSITION))
            {
               if(_loc8_.hasOwnProperty("@section") && _loc8_.@section == AssetTransitionConstants.TIMING_BEFORE_NARRATION)
               {
                  _loc7_ = new AssetTransitionNode();
                  _loc7_.init(_loc8_);
                  switch(int(_loc8_.@timing))
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
                  if(_loc5_ is ITiming && _loc4_ is ITiming && ITiming(_loc4_).endFrame > ITiming(_loc5_).endFrame)
                  {
                     _loc5_ = _loc7_;
                  }
               }
            }
            _loc4_ = _loc6_ = _loc5_;
            for each(_loc8_ in param1.child(AssetTransitionConstants.TAG_NAME_TRANSITION))
            {
               if(_loc8_.hasOwnProperty("@section") && _loc8_.@section == AssetTransitionConstants.TIMING_WITH_NARRATION)
               {
                  _loc7_ = new AssetTransitionNode();
                  _loc7_.init(_loc8_);
                  switch(int(_loc8_.@timing))
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
                  if(_loc5_ is ITiming && _loc4_ is ITiming && ITiming(_loc4_).endFrame > ITiming(_loc5_).endFrame)
                  {
                     _loc5_ = _loc7_;
                  }
               }
            }
            if(param2 && !param2.parent)
            {
               _loc6_.addNode(param2);
               if(_loc5_ is ITiming && param2.endFrame > ITiming(_loc5_).endFrame)
               {
                  _loc5_ = param2;
               }
            }
            _loc4_ = _loc6_ = _loc5_;
            for each(_loc8_ in param1.child(AssetTransitionConstants.TAG_NAME_TRANSITION))
            {
               if(_loc8_.hasOwnProperty("@section") && _loc8_.@section == AssetTransitionConstants.TIMING_AFTER_NARRATION)
               {
                  _loc7_ = new AssetTransitionNode();
                  _loc7_.init(_loc8_);
                  switch(int(_loc8_.@timing))
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
                  if(_loc5_ is ITiming && _loc4_ is ITiming && ITiming(_loc4_).endFrame > ITiming(_loc5_).endFrame)
                  {
                     _loc5_ = _loc7_;
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function init(param1:XML) : void
      {
         this.data = param1;
         this._assetId = String(param1.@target);
         this._duration = int(this.xml.@duration);
         this._delay = int(this.xml.@delay);
         this._type = String(this.xml.@type);
      }
      
      public function get xml() : XML
      {
         return this.data as XML;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get assetId() : String
      {
         return this._assetId;
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
