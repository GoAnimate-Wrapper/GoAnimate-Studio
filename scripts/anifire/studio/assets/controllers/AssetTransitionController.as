package anifire.studio.assets.controllers
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.assets.models.AssetTransitionCollection;
   import anifire.studio.assets.models.DestinationTransitionSetting;
   import anifire.studio.components.AlertPopUp;
   import anifire.studio.components.ComplexityPopUp;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.Prop;
   import anifire.studio.core.Widget;
   import anifire.studio.events.AssetTransitionEvent;
   import anifire.util.UtilDict;
   import flash.display.DisplayObjectContainer;
   import flash.utils.getQualifiedClassName;
   import mx.core.FlexGlobals;
   
   public class AssetTransitionController
   {
      
      private static const DEFAULT_INFOGRAPHIC_ASSET_DURATION:int = 12;
       
      
      private var _collection:AssetTransitionCollection;
      
      public function AssetTransitionController()
      {
         super();
      }
      
      public function get collection() : AssetTransitionCollection
      {
         return this._collection;
      }
      
      public function set collection(param1:AssetTransitionCollection) : void
      {
         if(this._collection)
         {
            this._collection.removeEventListener(AssetTransitionEvent.TYPE_CHANGE,this.collectionUpdate_eventHandler);
         }
         this._collection = param1;
         if(this._collection)
         {
            this._collection.addEventListener(AssetTransitionEvent.TYPE_CHANGE,this.collectionUpdate_eventHandler);
         }
      }
      
      private function collectionUpdate_eventHandler(param1:AssetTransitionEvent) : void
      {
         this.checkComplexity();
      }
      
      private function checkComplexity() : void
      {
         if(this.collection.numOfComplexEffect == AssetTransitionFactory.SUGGESTED_TRANSITIONS_PER_SCENE)
         {
            this.displayComplexityAlert("Adding too many enter and exit transitions in one scene may adversely affect your video playback performance. It may also affect exporting your video. We recommend using fewer than 10 in each scene. If your video does not play smoothly, check how many enter and exits transitions you have on each scene.");
         }
      }
      
      private function displayAlert(param1:String) : void
      {
         AlertPopUp.openDefaultPopUpWithLocale(param1,"Error");
      }
      
      private function displayComplexityAlert(param1:String) : void
      {
         var _loc2_:ComplexityPopUp = new ComplexityPopUp();
         _loc2_.createDefaultPopUp();
         _loc2_.message = UtilDict.translate(param1);
         _loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      public function createTransition(param1:Asset) : AssetTransition
      {
         var _loc2_:String = null;
         var _loc5_:AssetTransition = null;
         var _loc6_:uint = 0;
         var _loc7_:IIterator = null;
         var _loc8_:AssetTransition = null;
         var _loc9_:int = 0;
         var _loc10_:DestinationTransitionSetting = null;
         var _loc11_:Widget = null;
         var _loc12_:Character = null;
         var _loc13_:Array = null;
         if(!this.collection || !param1)
         {
            return null;
         }
         if(this.collection.length >= AssetTransitionFactory.maxTransitionsPerScene)
         {
            this.displayAlert("Please upgrade to GoPlus to add more Enter/Exit effects to this scene");
            return null;
         }
         this.checkComplexity();
         var _loc3_:Array = getQualifiedClassName(param1).split("::");
         if(_loc3_)
         {
            _loc2_ = _loc3_[1];
         }
         var _loc4_:AssetTransition = AssetTransitionFactory.create(param1.id,AssetTransitionConstants.TYPE_SLIDE,_loc2_);
         if(_loc4_)
         {
            _loc5_ = this.collection.lastAddedTransition;
            if(_loc5_)
            {
               if(_loc4_.atype == _loc5_.atype)
               {
                  _loc4_.type = _loc5_.type;
                  _loc4_.duration = _loc5_.duration;
                  _loc4_.timing = _loc5_.timing;
                  _loc4_.section = _loc5_.section;
                  _loc4_.delay = _loc5_.delay;
                  _loc4_.direction = _loc5_.direction;
                  _loc4_.soundMode = _loc5_.soundMode;
                  _loc4_.setting = _loc5_.setting.clone();
               }
            }
            if(param1 is Asset && (param1 as Asset).isWhiteboardAsset)
            {
               if(param1 is FlowFrame)
               {
                  _loc4_.defaultType = AssetTransitionConstants.TYPE_HANDSLIDE;
                  _loc4_.type = AssetTransitionConstants.TYPE_HANDSLIDE;
                  _loc10_ = _loc4_.setting as DestinationTransitionSetting;
                  if(_loc10_)
                  {
                     _loc10_.destination = AssetTransitionConstants.DEST_BOTTOM;
                  }
               }
               else
               {
                  _loc4_.defaultType = AssetTransitionConstants.TYPE_HAND_DRAWN;
                  _loc4_.type = AssetTransitionConstants.TYPE_HAND_DRAWN;
               }
               _loc4_.timing = AssetTransitionConstants.TIMING_AFTER_PREVIOUS;
            }
            if(param1 is Widget)
            {
               _loc4_.defaultType = AssetTransitionConstants.TYPE_WIDGET_ANIMATION;
               _loc4_.type = AssetTransitionConstants.TYPE_WIDGET_ANIMATION;
               _loc4_.timing = AssetTransitionConstants.TIMING_AFTER_PREVIOUS;
               _loc11_ = param1 as Widget;
               if(_loc11_.isCinematicType)
               {
                  _loc4_.duration = _loc11_.getDefaultCinematicFrameDuration();
               }
               else
               {
                  _loc4_.duration = Widget.DEFAULT_FRAME_DURATION;
               }
            }
            else if((param1 as Asset).isInfographicAsset)
            {
               if(param1 is Prop || param1 is Character)
               {
                  _loc4_.defaultType = AssetTransitionConstants.TYPE_SPRITE_SCALE;
                  _loc4_.type = AssetTransitionConstants.TYPE_SPRITE_SCALE;
                  _loc4_.timing = AssetTransitionConstants.TIMING_AFTER_PREVIOUS;
                  _loc4_.duration = DEFAULT_INFOGRAPHIC_ASSET_DURATION;
               }
            }
            if(param1 is Character)
            {
               _loc12_ = param1 as Character;
               _loc4_.characterActionName = !!_loc12_.action?_loc12_.action.name:null;
            }
            _loc6_ = 0;
            _loc7_ = this.collection.iterator();
            while(_loc7_.hasNext)
            {
               _loc8_ = _loc7_.next as AssetTransition;
               if(_loc8_ && _loc8_.assetId == param1.id)
               {
                  _loc4_.timing = AssetTransitionConstants.TIMING_AFTER_PREVIOUS;
                  break;
               }
            }
            _loc9_ = this.getDefaultDirection(_loc4_);
            if(_loc9_ == AssetTransitionConstants.DIRECTION_UNDEFINED)
            {
               this.displayAlert(UtilDict.translate("A specific asset can only have up to 3 motions (one per type of motion) in a single scene"));
               return null;
            }
            _loc4_.direction = _loc9_;
            if(param1 is Asset && (param1 as Asset).scene)
            {
               _loc13_ = Console.getConsole().linkageController.getSoundIdByAssetId((param1 as Asset).scene.id,param1.id);
               if(_loc13_ && _loc13_.length > 0)
               {
                  if(_loc4_.direction == AssetTransitionConstants.DIRECTION_IN)
                  {
                     _loc4_.section = AssetTransitionConstants.TIMING_BEFORE_NARRATION;
                  }
                  else if(_loc4_.direction == AssetTransitionConstants.DIRECTION_OUT)
                  {
                     _loc4_.section = AssetTransitionConstants.TIMING_AFTER_NARRATION;
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function removeByAssetId(param1:String) : Array
      {
         var _loc3_:uint = 0;
         if(!this.collection)
         {
            return null;
         }
         var _loc2_:Array = AssetTransitionHelper.getTransitions(param1,this.collection);
         if(_loc2_ && _loc2_.length > 0)
         {
            while(_loc3_ < _loc2_.length)
            {
               this.collection.removeTransition(_loc2_[_loc3_] as AssetTransition);
               _loc3_++;
            }
            return _loc2_;
         }
         return null;
      }
      
      public function getAvailableDirections(param1:AssetTransition) : Array
      {
         var _loc7_:AssetTransition = null;
         if(!this.collection || !param1)
         {
            return null;
         }
         var _loc2_:Array = new Array();
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:IIterator = this.collection.iterator();
         while(_loc6_.hasNext)
         {
            _loc7_ = _loc6_.next as AssetTransition;
            if(_loc7_ && _loc7_.assetId == param1.assetId && _loc7_ != param1)
            {
               if(_loc7_.direction == AssetTransitionConstants.DIRECTION_IN)
               {
                  _loc3_++;
               }
               else if(_loc7_.direction == AssetTransitionConstants.DIRECTION_OUT)
               {
                  _loc4_++;
               }
               else if(_loc7_.direction == AssetTransitionConstants.DIRECTION_MOVEMENT)
               {
                  _loc5_++;
               }
            }
         }
         if(_loc3_ == 0)
         {
            _loc2_.push({
               "id":AssetTransitionConstants.DIRECTION_IN,
               "label":AssetTransitionConstants.getDirectionLabel(AssetTransitionConstants.DIRECTION_IN)
            });
         }
         if(_loc4_ == 0)
         {
            _loc2_.push({
               "id":AssetTransitionConstants.DIRECTION_OUT,
               "label":AssetTransitionConstants.getDirectionLabel(AssetTransitionConstants.DIRECTION_OUT)
            });
         }
         if(_loc5_ == 0)
         {
            _loc2_.push({
               "id":AssetTransitionConstants.DIRECTION_MOVEMENT,
               "label":AssetTransitionConstants.getDirectionLabel(AssetTransitionConstants.DIRECTION_MOVEMENT)
            });
         }
         return _loc2_;
      }
      
      public function getDefaultDirection(param1:AssetTransition) : int
      {
         if(!this.collection || !param1)
         {
            return AssetTransitionConstants.DIRECTION_UNDEFINED;
         }
         var _loc2_:Array = this.getAvailableDirections(param1);
         if(_loc2_.length == 2 && _loc2_[0].id == AssetTransitionConstants.DIRECTION_IN && _loc2_[1].id == AssetTransitionConstants.DIRECTION_OUT)
         {
            return AssetTransitionConstants.DIRECTION_OUT;
         }
         if(_loc2_ && _loc2_.length > 0)
         {
            return _loc2_[0].id;
         }
         return AssetTransitionConstants.DIRECTION_UNDEFINED;
      }
   }
}
