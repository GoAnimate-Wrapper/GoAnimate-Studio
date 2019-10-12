package anifire.studio.assets.controllers
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.assets.transition.NarrationNode;
   import anifire.interfaces.IIterator;
   import anifire.iterators.TreeNode;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.assets.models.AssetTransitionCollection;
   import anifire.studio.assets.models.AssetTransitionTreeNode;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.util.UtilMath;
   
   public class AssetTransitionHelper
   {
       
      
      public function AssetTransitionHelper()
      {
         super();
      }
      
      public static function getTransitions(param1:String, param2:AssetTransitionCollection) : Array
      {
         var _loc4_:IIterator = null;
         var _loc5_:AssetTransition = null;
         var _loc3_:Array = new Array();
         if(param2)
         {
            _loc4_ = param2.iterator();
            while(_loc4_.hasNext)
            {
               _loc5_ = _loc4_.next as AssetTransition;
               if(_loc5_ && _loc5_.assetId == param1)
               {
                  _loc3_.push(_loc5_);
               }
            }
         }
         return _loc3_;
      }
      
      public static function getTransition(param1:String, param2:AssetTransitionCollection) : AssetTransition
      {
         var _loc3_:IIterator = null;
         var _loc4_:AssetTransition = null;
         if(param2)
         {
            _loc3_ = param2.iterator();
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AssetTransition;
               if(_loc4_ && _loc4_.id == param1)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public static function isAlreadyOut(param1:String, param2:AssetTransitionCollection) : Boolean
      {
         var _loc3_:Array = AssetTransitionHelper.getTransitions(param1,param2);
         if(_loc3_.length > 0)
         {
            return AssetTransition(_loc3_[_loc3_.length - 1]).direction == AssetTransitionConstants.DIRECTION_OUT;
         }
         return false;
      }
      
      public static function getTotalFrameOfTransitionBeforeNarration(param1:AssetTransitionCollection) : int
      {
         var _loc3_:TreeNode = null;
         var _loc5_:AssetTransitionTreeNode = null;
         var _loc2_:uint = 0;
         _loc3_ = AssetTransitionTreeNode.getTreeFromTransitionCollection(param1);
         var _loc4_:IIterator = _loc3_.iterator();
         while(_loc4_.hasNext)
         {
            _loc5_ = _loc4_.next as AssetTransitionTreeNode;
            if(_loc5_ && _loc5_.transition && _loc5_.transition.section == AssetTransitionConstants.TIMING_BEFORE_NARRATION)
            {
               _loc2_ = Math.max(_loc2_,_loc5_.endFrame);
            }
         }
         return _loc2_;
      }
      
      public static function totalFramesByAssetTransition(param1:AnimeScene) : int
      {
         var _loc6_:AssetTransitionTreeNode = null;
         var _loc8_:int = 0;
         var _loc9_:NarrationNode = null;
         var _loc2_:uint = 0;
         var _loc3_:AnimeSound = param1.speech;
         if(_loc3_ && _loc3_.soundThumb)
         {
            _loc8_ = _loc3_.defaultTotalFrame;
            _loc9_ = new NarrationNode();
            _loc9_.init(0,_loc8_);
         }
         var _loc4_:TreeNode = AssetTransitionTreeNode.getTreeFromTransitionCollection(param1.assetTransitions,_loc9_);
         var _loc5_:IIterator = _loc4_.iterator();
         var _loc7_:uint = 0;
         while(_loc5_.hasNext)
         {
            _loc6_ = _loc5_.next as AssetTransitionTreeNode;
            if(_loc6_ && !(_loc6_ is NarrationNode))
            {
               _loc7_ = _loc6_.endFrame;
               if(_loc6_.transition && _loc6_.transition.direction == AssetTransitionConstants.DIRECTION_IN)
               {
                  _loc7_ = _loc7_ + 60;
               }
               _loc2_ = Math.max(_loc2_,_loc7_);
            }
         }
         return _loc2_;
      }
      
      public static function checkAssetTransitionConflict(param1:AnimeScene) : void
      {
         var _loc5_:AssetTransitionTreeNode = null;
         var _loc6_:AssetTransition = null;
         var _loc8_:AssetTransitionTreeNode = null;
         var _loc9_:AssetTransition = null;
         var _loc10_:int = 0;
         var _loc11_:NarrationNode = null;
         var _loc2_:AnimeSound = Console.getConsole().speechManager.getSpeech(param1);
         if(_loc2_)
         {
            _loc10_ = Console.getConsole().speechManager.getSpeechTotalFrame(param1);
            _loc11_ = new NarrationNode();
            _loc11_.init(0,_loc10_);
         }
         var _loc3_:TreeNode = AssetTransitionTreeNode.getTreeFromTransitionCollection(param1.assetTransitions,_loc11_);
         var _loc4_:IIterator = _loc3_.iterator();
         var _loc7_:IIterator = _loc3_.iterator();
         while(_loc4_.hasNext)
         {
            _loc5_ = _loc4_.next as AssetTransitionTreeNode;
            if(_loc5_)
            {
               _loc6_ = _loc5_.data as AssetTransition;
               if(_loc6_)
               {
                  _loc6_.conflict = false;
                  _loc6_.conflictWithOtherHandDrawn = false;
                  _loc7_.reset();
                  while(_loc7_.hasNext)
                  {
                     _loc8_ = _loc7_.next as AssetTransitionTreeNode;
                     if(_loc8_)
                     {
                        _loc9_ = _loc8_.data as AssetTransition;
                        if(_loc9_ && _loc9_ != _loc6_ && _loc6_.assetId == _loc9_.assetId)
                        {
                           if(UtilMath.checkOverlap(_loc5_.startFrame,_loc5_.startFrame + _loc5_.duration - 1,_loc8_.startFrame,_loc8_.startFrame + _loc8_.duration - 1))
                           {
                              _loc6_.conflict = true;
                              break;
                           }
                           if(_loc6_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
                           {
                              if(_loc9_.direction == AssetTransitionConstants.DIRECTION_IN && _loc5_.startFrame < _loc8_.startFrame)
                              {
                                 _loc6_.conflict = true;
                              }
                              else
                              {
                                 if(_loc9_.direction == AssetTransitionConstants.DIRECTION_OUT && _loc5_.startFrame < _loc8_.startFrame)
                                 {
                                    break;
                                 }
                                 if(_loc9_.direction == AssetTransitionConstants.DIRECTION_OUT && _loc5_.startFrame > _loc8_.startFrame)
                                 {
                                    _loc6_.conflict = true;
                                 }
                                 else if(_loc9_.direction == AssetTransitionConstants.DIRECTION_IN && _loc5_.startFrame > _loc8_.startFrame)
                                 {
                                    _loc6_.conflict = false;
                                 }
                              }
                           }
                        }
                        if(_loc9_ && _loc9_ != _loc6_ && _loc6_.type == AssetTransitionConstants.TYPE_HAND_DRAWN && _loc9_.type == AssetTransitionConstants.TYPE_HAND_DRAWN)
                        {
                           if(UtilMath.checkOverlap(_loc5_.startFrame,_loc5_.startFrame + _loc5_.duration - 1,_loc8_.startFrame,_loc8_.startFrame + _loc8_.duration - 1))
                           {
                              _loc6_.conflictWithOtherHandDrawn = true;
                              break;
                           }
                        }
                     }
                  }
                  continue;
               }
               continue;
            }
         }
      }
      
      public static function checkConflictWithFontFamily(param1:String, param2:AssetTransition) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Boolean = false;
         var _loc5_:uint = 0;
         if(param2)
         {
            if(param1 == "Arial")
            {
               _loc3_ = AssetTransitionConstants.textTypes;
               while(_loc5_ < _loc3_.length)
               {
                  if(_loc3_[_loc5_].id == param2.type)
                  {
                     _loc4_ = true;
                     break;
                  }
                  _loc5_++;
               }
               param2.conflictWithFontFamily = _loc4_;
            }
            else
            {
               param2.conflictWithFontFamily = false;
            }
         }
      }
      
      public static function validateTransitions(param1:AssetTransitionCollection, param2:AnimeScene) : void
      {
         var _loc3_:IIterator = null;
         var _loc4_:Array = null;
         var _loc5_:AssetTransition = null;
         if(param1 && param2)
         {
            _loc3_ = param1.iterator();
            if(_loc3_)
            {
               _loc4_ = new Array();
               while(_loc3_.hasNext)
               {
                  _loc5_ = _loc3_.next as AssetTransition;
                  if(_loc5_)
                  {
                     if(param2.getAssetById(_loc5_.assetId) == null)
                     {
                        _loc4_.push(_loc5_);
                     }
                  }
               }
               for each(_loc5_ in _loc4_)
               {
                  param1.removeTransition(_loc5_);
               }
            }
         }
      }
   }
}
