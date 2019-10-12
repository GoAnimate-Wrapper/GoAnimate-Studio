package anifire.studio.core
{
   import anifire.core.AssetLinkage;
   import anifire.studio.core.sound.SoundEvent;
   import flash.events.EventDispatcher;
   
   public class LinkageController
   {
       
      
      private var _eventDispatcher:EventDispatcher;
      
      private var _linkages:Array;
      
      public function LinkageController()
      {
         this._eventDispatcher = new EventDispatcher();
         super();
         this._linkages = new Array();
      }
      
      public function get eventDispatcher() : EventDispatcher
      {
         return this._eventDispatcher;
      }
      
      public function set eventDispatcher(param1:EventDispatcher) : void
      {
         this._eventDispatcher = param1;
      }
      
      public function addLinkages(param1:Array) : void
      {
         var _loc2_:AssetLinkage = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = param1[_loc3_] as AssetLinkage;
            this.addLinkage(_loc2_);
            _loc3_++;
         }
      }
      
      public function addLinkage(param1:AssetLinkage) : void
      {
         var _loc3_:AssetLinkage = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:Array = null;
         var _loc2_:Boolean = false;
         var _loc6_:int = this._linkages.length;
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc3_ = this._linkages[_loc4_] as AssetLinkage;
            if(_loc3_.getSoundId() == param1.getSoundId())
            {
               _loc2_ = true;
               _loc8_ = param1.getSceneAndCharId();
               _loc5_ = 0;
               while(_loc5_ < _loc8_.length)
               {
                  _loc3_.addLinkage(_loc8_[_loc5_] as String);
                  _loc5_++;
               }
            }
            _loc4_++;
         }
         if(!_loc2_)
         {
            this._linkages.push(param1);
         }
         var _loc7_:SoundEvent = new SoundEvent(SoundEvent.UPDATED,this);
         this.eventDispatcher.dispatchEvent(_loc7_);
      }
      
      public function removeLinkage(param1:AssetLinkage) : void
      {
         var _loc2_:Number = this._linkages.indexOf(param1);
         this._linkages.splice(_loc2_,1);
         var _loc3_:SoundEvent = new SoundEvent(SoundEvent.UPDATED,this);
         this.eventDispatcher.dispatchEvent(_loc3_);
      }
      
      public function getLinkageByIndex(param1:int) : AssetLinkage
      {
         return this._linkages[param1];
      }
      
      public function getLinkageBySoundId(param1:String) : AssetLinkage
      {
         var _loc3_:AssetLinkage = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._linkages.length)
         {
            _loc3_ = this.getLinkageByIndex(_loc2_);
            if(_loc3_.getLinkage().indexOf(param1) > -1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function isLinkageExist(param1:String) : Array
      {
         var _loc3_:AssetLinkage = null;
         var _loc2_:int = 0;
         while(_loc2_ < this._linkages.length)
         {
            _loc3_ = this.getLinkageByIndex(_loc2_);
            if(_loc3_.getLinkage().indexOf(param1) > -1)
            {
               return _loc3_.getLinkage();
            }
            _loc2_++;
         }
         return null;
      }
      
      public function deleteLinkage(param1:Object) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Asset = null;
         var _loc5_:AnimeScene = null;
         if(param1 is Asset)
         {
            _loc4_ = param1 as Asset;
            _loc3_ = AssetLinkage.LINK + _loc4_.id;
         }
         else if(param1 is AnimeScene)
         {
            _loc5_ = param1 as AnimeScene;
            _loc3_ = _loc5_.id;
         }
         _loc2_ = this.deleteLinkageById(_loc3_);
         return _loc2_;
      }
      
      public function removeLinkageToAnyScene(param1:String) : void
      {
         var _loc3_:AssetLinkage = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._linkages.length)
         {
            _loc3_ = this.getLinkageByIndex(_loc2_);
            if(_loc3_.getLinkage().indexOf(param1) > -1)
            {
               _loc4_ = _loc3_.getSceneId();
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc3_.removeLinkage(_loc4_[_loc5_] + AssetLinkage.LINK);
                  _loc5_++;
               }
            }
            _loc2_++;
         }
      }
      
      public function deleteLinkageById(param1:String) : Array
      {
         var _loc4_:AssetLinkage = null;
         var _loc5_:String = null;
         var _loc6_:SoundEvent = null;
         var _loc7_:String = null;
         var _loc8_:AssetLinkage = null;
         var _loc2_:Array = new Array();
         var _loc3_:int = this._linkages.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this.getLinkageByIndex(_loc3_);
            if(_loc4_.getLinkage().indexOf(param1) > -1)
            {
               if(_loc4_.getLinkage().length <= 2)
               {
                  _loc2_.push(_loc4_);
                  this.removeLinkage(_loc4_);
               }
               else
               {
                  _loc5_ = _loc4_.getSoundId();
                  if(param1 != _loc5_)
                  {
                     _loc7_ = _loc4_.removeLinkage(param1);
                     _loc8_ = new AssetLinkage();
                     _loc8_.addLinkage(_loc5_);
                     _loc8_.addLinkage(_loc7_);
                     _loc2_.push(_loc8_);
                  }
                  else
                  {
                     _loc2_.push(_loc4_);
                     this.removeLinkage(_loc4_);
                  }
                  _loc6_ = new SoundEvent(SoundEvent.UPDATED,this);
                  this.eventDispatcher.dispatchEvent(_loc6_);
               }
            }
            _loc3_--;
         }
         return _loc2_;
      }
      
      public function deleteLinkageBySoundIdCharId(param1:String, param2:String) : Array
      {
         var _loc5_:AssetLinkage = null;
         var _loc6_:AssetLinkage = null;
         var _loc7_:SoundEvent = null;
         var _loc3_:Array = new Array();
         var _loc4_:int = this._linkages.length - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.getLinkageByIndex(_loc4_);
            if(_loc5_.getLinkage().indexOf(param1) > -1)
            {
               if(_loc5_.getLinkage().length <= 2)
               {
                  _loc3_.push(_loc5_);
                  this.removeLinkage(_loc5_);
               }
               else
               {
                  param1 = _loc5_.getSoundId();
                  param2 = _loc5_.removeLinkage(AssetLinkage.LINK + param2);
                  _loc6_ = new AssetLinkage();
                  _loc6_.addLinkage(param1);
                  _loc6_.addLinkage(param2);
                  _loc3_.push(_loc6_);
                  _loc7_ = new SoundEvent(SoundEvent.UPDATED,this);
                  this.eventDispatcher.dispatchEvent(_loc7_);
               }
            }
            _loc4_--;
         }
         return _loc3_;
      }
      
      public function getSpeechSoundIdByScene(param1:AnimeScene, param2:Boolean = false) : String
      {
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc7_:Boolean = false;
         var _loc8_:XML = null;
         var _loc9_:String = null;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:Character = null;
         var _loc13_:Array = null;
         var _loc3_:String = "";
         var _loc6_:XML = param1.sceneXML;
         if(_loc6_)
         {
            _loc7_ = false;
            _loc5_ = _loc6_.@id + AssetLinkage.LINK;
            _loc4_ = this.isLinkageExist(_loc5_);
            if(!param2 && _loc4_ != null)
            {
               _loc7_ = true;
            }
            else
            {
               _loc4_ = new Array();
               for each(_loc8_ in _loc6_.children())
               {
                  _loc9_ = _loc8_.name();
                  switch(_loc9_)
                  {
                     case Character.XML_NODE_NAME:
                        _loc5_ = AssetLinkage.LINK + _loc8_.@id;
                        _loc4_ = this.isLinkageExist(_loc5_);
                        if(_loc4_ != null)
                        {
                           _loc7_ = true;
                        }
                  }
                  if(_loc7_)
                  {
                     break;
                  }
               }
            }
         }
         else
         {
            _loc5_ = param1.id + AssetLinkage.LINK;
            _loc4_ = this.isLinkageExist(_loc5_);
            if(!(!param2 && _loc4_ != null))
            {
               _loc4_ = new Array();
               _loc10_ = param1.characters.length;
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  _loc12_ = param1.characters.getValueByIndex(_loc11_) as Character;
                  _loc5_ = AssetLinkage.LINK + _loc12_.id;
                  _loc4_ = this.isLinkageExist(_loc5_);
                  if(_loc4_ != null)
                  {
                     break;
                  }
                  _loc11_++;
               }
            }
         }
         if(_loc4_ != null)
         {
            _loc13_ = _loc4_.concat();
            _loc13_.splice(_loc13_.indexOf(_loc5_),1);
            _loc3_ = _loc13_.join("");
         }
         return _loc3_;
      }
      
      public function getSpeechIdOfAsset(param1:Asset = null) : String
      {
         var _loc3_:AnimeScene = null;
         var _loc2_:Asset = param1;
         if(_loc2_ && _loc2_.scene)
         {
            _loc3_ = _loc2_.scene;
         }
         else
         {
            _loc3_ = Console.getConsole().currentScene;
         }
         return this.getSpeechSoundIdByScene(_loc3_,true);
      }
      
      public function getTargetIdOfSpeech(param1:String) : String
      {
         var _loc4_:Array = null;
         var _loc2_:String = "";
         var _loc3_:Array = this.isLinkageExist(param1);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.concat();
            _loc4_.splice(_loc4_.indexOf(param1),1);
            _loc2_ = _loc4_.join("");
         }
         return _loc2_;
      }
      
      public function getSceneIdBySoundId(param1:String) : Array
      {
         var _loc2_:AssetLinkage = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._linkages.length)
         {
            _loc2_ = this.getLinkageByIndex(_loc3_);
            if(_loc2_ && _loc2_.getSoundId() == param1)
            {
               return _loc2_.getSceneId();
            }
            _loc3_++;
         }
         return new Array();
      }
      
      public function getOtherCharIdBySoundIdCharId(param1:String, param2:String) : Array
      {
         var _loc3_:AssetLinkage = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < this._linkages.length)
         {
            _loc3_ = this.getLinkageByIndex(_loc5_);
            if(_loc3_ && _loc3_.getSoundId() == param1)
            {
               _loc6_ = _loc3_.getSceneAndCharId();
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc8_ = _loc6_[_loc7_];
                  _loc9_ = AssetLinkage.getCharIdFromLinkage(_loc8_);
                  if(_loc9_ != param2)
                  {
                     _loc4_.push(_loc8_);
                  }
                  _loc7_++;
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getCharIdBySoundIdSceneId(param1:String, param2:String) : Array
      {
         var _loc3_:AssetLinkage = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < this._linkages.length)
         {
            _loc3_ = this.getLinkageByIndex(_loc5_);
            if(_loc3_ && _loc3_.getSoundId() == param1)
            {
               _loc6_ = _loc3_.getSceneAndCharId();
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc8_ = _loc6_[_loc7_];
                  _loc9_ = AssetLinkage.getCharIdFromLinkage(_loc8_);
                  if(Console.getConsole().getScenebyId(param2).getCharacterById(_loc9_))
                  {
                     _loc4_.push(_loc9_);
                  }
                  _loc7_++;
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getCharIdBySoundId(param1:String) : Array
      {
         var _loc2_:AssetLinkage = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._linkages.length)
         {
            _loc2_ = this.getLinkageByIndex(_loc3_);
            if(_loc2_ && _loc2_.getSoundId() == param1)
            {
               return _loc2_.getCharId();
            }
            _loc3_++;
         }
         return new Array();
      }
      
      public function getSoundIdBySceneId(param1:String) : Array
      {
         var _loc2_:AssetLinkage = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < this._linkages.length)
         {
            _loc2_ = this.getLinkageByIndex(_loc4_);
            if(_loc2_ && _loc2_.getSceneId())
            {
               _loc5_ = _loc2_.getSceneId();
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  if(_loc5_[_loc6_] == param1)
                  {
                     _loc3_.push(_loc2_.getSoundId());
                  }
                  _loc6_++;
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getSoundIdByAssetId(param1:String, param2:String) : Array
      {
         var _loc4_:AssetLinkage = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc3_:Array = Console.getConsole().getAllSoundOverlapWithScene(Console.getConsole().getScenebyId(param1));
         var _loc5_:Array = new Array();
         if(_loc3_)
         {
            _loc6_ = 0;
            while(_loc6_ < this._linkages.length)
            {
               _loc4_ = this.getLinkageByIndex(_loc6_);
               if(_loc4_)
               {
                  _loc7_ = _loc4_.getSoundId();
                  if(this.isSoundExistInArray(_loc7_,_loc3_))
                  {
                     _loc8_ = _loc4_.getSceneAndCharId();
                     _loc9_ = 0;
                     while(_loc9_ < _loc8_.length)
                     {
                        _loc10_ = _loc8_[_loc9_];
                        _loc11_ = AssetLinkage.getCharIdFromLinkage(_loc10_);
                        if(_loc11_ == param2)
                        {
                           _loc5_.push(_loc7_);
                        }
                        _loc9_++;
                     }
                  }
               }
               _loc6_++;
            }
         }
         return _loc5_;
      }
      
      public function getSoundIdByCharId(param1:String) : Array
      {
         var _loc2_:AssetLinkage = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < this._linkages.length)
         {
            _loc2_ = this.getLinkageByIndex(_loc4_);
            if(_loc2_ && _loc2_.getCharId())
            {
               _loc5_ = _loc2_.getCharId();
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  if(_loc5_[_loc6_] == param1)
                  {
                     _loc3_.push(_loc2_.getSoundId());
                  }
                  _loc6_++;
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      protected function isSoundExistInArray(param1:String, param2:Array) : Boolean
      {
         var _loc4_:AnimeSound = null;
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            _loc4_ = param2[_loc3_];
            if(_loc4_.id == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function serialize() : String
      {
         var _loc2_:int = 0;
         var _loc3_:AssetLinkage = null;
         var _loc1_:String = "";
         if(this._linkages)
         {
            _loc2_ = 0;
            while(_loc2_ < this._linkages.length)
            {
               _loc3_ = this.getLinkageByIndex(_loc2_);
               if(_loc3_)
               {
                  _loc1_ = _loc1_ + _loc3_.serialize();
               }
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function deserialize(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:AssetLinkage = null;
         _loc3_ = 0;
         while(_loc3_ < param1.child(AssetLinkage.XML_TAG).length())
         {
            _loc2_ = param1.child(AssetLinkage.XML_TAG)[_loc3_];
            _loc4_ = new AssetLinkage();
            _loc4_.deserialize(_loc2_);
            this.addLinkage(_loc4_);
            _loc3_++;
         }
      }
      
      public function isDemoSpeechNeeded(param1:Character) : Boolean
      {
         var _loc2_:String = this.getSpeechSoundIdByScene(param1.scene);
         var _loc3_:String = this.getTargetIdOfSpeech(_loc2_);
         var _loc4_:String = AssetLinkage.getCharIdFromLinkage(_loc3_);
         return _loc4_ == param1.id;
      }
   }
}
