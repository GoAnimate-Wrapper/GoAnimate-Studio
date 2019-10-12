package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.errors.SerializeError;
   import anifire.studio.managers.PaletteManager;
   import anifire.studio.utils.UtilStudioVersion;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilMovieInfoXMLLoader;
   import anifire.util.UtilXmlInfo;
   import flash.events.Event;
   import mx.utils.StringUtil;
   
   public class MetaData
   {
      
      public static const XML_NODE_NAME:String = "meta";
       
      
      private var _movieId:String = null;
      
      private var _title:String = "";
      
      private var _hidden_tags:Array;
      
      private var _ugc_ags:Array;
      
      private var _description:String = "";
      
      private var _originalId:String = "";
      
      private var _mver:Number;
      
      private var _isTagSet:Boolean = false;
      
      private var _selectedThumbnailIndex:int = 0;
      
      private var _isCopy:Boolean = false;
      
      public function MetaData()
      {
         this._hidden_tags = new Array();
         this._ugc_ags = new Array();
         this._mver = AnimeConstants.MOVIE_VERSION;
         super();
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
      }
      
      public function get movieId() : String
      {
         return this._movieId;
      }
      
      public function set movieId(param1:String) : void
      {
         if(this._movieId == null)
         {
            this._movieId = param1;
         }
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function set description(param1:String) : void
      {
         this._description = param1;
      }
      
      public function get originalId() : String
      {
         return this._originalId;
      }
      
      public function set originalId(param1:String) : void
      {
         this._originalId = param1;
      }
      
      public function set mver(param1:Number) : void
      {
         this._mver = param1;
      }
      
      public function get mver() : Number
      {
         return this._mver;
      }
      
      public function set isCopy(param1:Boolean) : void
      {
         this._isCopy = param1;
      }
      
      public function get isCopy() : Boolean
      {
         return this._isCopy;
      }
      
      public function genDefaultTags(param1:MovieData) : void
      {
         var _loc5_:AnimeScene = null;
         var _loc6_:Thumb = null;
         var _loc7_:Thumb = null;
         var _loc9_:int = 0;
         if(!param1)
         {
            return;
         }
         var _loc2_:UtilHashArray = new UtilHashArray();
         var _loc3_:UtilHashArray = new UtilHashArray();
         var _loc4_:UtilHashArray = new UtilHashArray();
         this.clearHiddenTags();
         var _loc8_:int = 0;
         while(_loc8_ < param1.scenes.length)
         {
            _loc5_ = param1.getSceneAt(_loc8_);
            if(_loc5_.characters.length > 0)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc5_.characters.length)
               {
                  _loc7_ = Character(_loc5_.characters.getValueByIndex(_loc9_)).thumb as Thumb;
                  if(_loc2_.getValueByKey(_loc7_.theme.id) == null)
                  {
                     _loc2_.push(_loc7_.theme.id,_loc7_.theme.id);
                     if(_loc7_.theme.id != "ugc")
                     {
                        this.addHiddenTag(_loc7_.theme.id);
                     }
                  }
                  if(_loc4_.getValueByKey(_loc7_.id) == null)
                  {
                     _loc4_.push(_loc7_.id,_loc7_.id);
                     if(!_loc7_.isCC && _loc7_.theme.id != "ugc")
                     {
                        this.addHiddenTag(_loc7_.id);
                     }
                  }
                  _loc9_++;
               }
            }
            _loc8_++;
         }
      }
      
      public function addHiddenTag(param1:String) : void
      {
         if(param1 != null && StringUtil.trim(param1).length > 0)
         {
            this._hidden_tags.push(param1);
         }
      }
      
      private function addUgcTag(param1:String) : void
      {
         if(param1 != null && StringUtil.trim(param1).length > 0)
         {
            this._ugc_ags.push(param1);
         }
      }
      
      public function clearHiddenTags() : void
      {
         this._hidden_tags.splice(0,this._hidden_tags.length);
      }
      
      private function clearUgcTags() : void
      {
         this._ugc_ags.splice(0,this._ugc_ags.length);
      }
      
      public function setUgcTagsByString(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         this.clearUgcTags();
         if(!(param1 == null || StringUtil.trim(param1).length == 0))
         {
            _loc2_ = param1.split(",");
            if(_loc2_ != null && _loc2_.length > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.addUgcTag(_loc2_[_loc3_]);
                  _loc3_++;
               }
            }
         }
      }
      
      public function setHiddenTagsByString(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         this.clearHiddenTags();
         if(!(param1 == null || StringUtil.trim(param1).length == 0))
         {
            _loc2_ = param1.split(",");
            if(_loc2_ != null && _loc2_.length > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  this.addHiddenTag(_loc2_[_loc3_]);
                  _loc3_++;
               }
            }
         }
      }
      
      public function getUgcTagString() : String
      {
         var _loc2_:int = 0;
         var _loc1_:* = "";
         if(this._ugc_ags.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this._ugc_ags.length)
            {
               if(_loc2_ > 0)
               {
                  _loc1_ = _loc1_ + ",";
               }
               _loc1_ = _loc1_ + this._ugc_ags[_loc2_];
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      private function getHiddenTagString() : String
      {
         var _loc2_:int = 0;
         var _loc1_:* = "";
         if(this._hidden_tags.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this._hidden_tags.length)
            {
               if(_loc2_ > 0)
               {
                  _loc1_ = _loc1_ + ",";
               }
               _loc1_ = _loc1_ + this._hidden_tags[_loc2_];
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function convertToXml() : XML
      {
         var child:XML = null;
         var xml:XML = new XML("<" + XML_NODE_NAME + "/>");
         try
         {
            xml.appendChild(new XML("<title>" + UtilXmlInfo.cdata(this.title) + "</title>"));
            xml.appendChild(new XML("<tag>" + UtilXmlInfo.cdata(this.getUgcTagString()) + "</tag>"));
            xml.appendChild(new XML("<hiddenTag>" + UtilXmlInfo.cdata(this.getHiddenTagString()) + "</hiddenTag>"));
            xml.appendChild(new XML("<desc>" + UtilXmlInfo.cdata(this.description) + "</desc>"));
            xml.appendChild(new XML("<mver>" + UtilXmlInfo.cdata(this.mver.toString()) + "</mver>"));
            xml.appendChild(<studio>{UtilStudioVersion.versionText}</studio>);
            child = <thumbnail index="{this.selectedThumbnailIndex}"/>;
            xml.appendChild(child);
            xml.appendChild(PaletteManager.instance.getPaletteXml());
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize meta");
         }
         return xml;
      }
      
      public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function deSerialize(param1:XML, param2:String, param3:String, param4:Boolean = false) : void
      {
         this.title = param1.child("title")[0].toString();
         this.setUgcTagsByString(param1.child("tag")[0].toString());
         if(param1.child("hiddenTag").length() > 0)
         {
            this.setHiddenTagsByString(param1.child("hiddenTag")[0].toString());
         }
         this.description = param1.child("desc")[0].toString();
         this.originalId = param3;
         this.movieId = param2;
         this.mver = Number(param1.child("mver")[0]) >= 0?Number(Number(param1.child("mver")[0])):Number(0);
         if(this.mver == 3)
         {
            this.mver = 4;
         }
         if(param1.hasOwnProperty("thumbnail"))
         {
            this.selectedThumbnailIndex = int(param1.thumbnail.@index);
         }
         if(!param4 && param1.hasOwnProperty(PaletteManager.PALETTE_XML_NODE_NAME))
         {
            PaletteManager.instance.deserializePaletteXml(param1.palette[0]);
         }
      }
      
      public function get selectedThumbnailIndex() : int
      {
         return this._selectedThumbnailIndex;
      }
      
      public function set selectedThumbnailIndex(param1:int) : void
      {
         this._selectedThumbnailIndex = param1;
      }
      
      public function validateThumbnailIndex(param1:int) : void
      {
         if(this.selectedThumbnailIndex < 0)
         {
            this.selectedThumbnailIndex = 0;
         }
         else if(this.selectedThumbnailIndex > param1 - 1)
         {
            this.selectedThumbnailIndex = param1 - 1;
         }
      }
      
      public function loadMovieInfo(param1:String) : void
      {
         var _loc2_:UtilMovieInfoXMLLoader = null;
         if(param1 && param1 != "")
         {
            _loc2_ = new UtilMovieInfoXMLLoader();
            _loc2_.addEventListener(UtilMovieInfoXMLLoader.LOAD_COMPLETE,this.onLoadInfoCompleted);
            _loc2_.loadMovieInfo(param1);
         }
      }
      
      private function onLoadInfoCompleted(param1:Event) : void
      {
         var _loc2_:UtilMovieInfoXMLLoader = param1.target as UtilMovieInfoXMLLoader;
         _loc2_.removeEventListener(UtilMovieInfoXMLLoader.LOAD_COMPLETE,this.onLoadInfoCompleted);
         var _loc3_:XML = _loc2_.xml;
         if(_loc3_)
         {
            if(!this.isCopy && _loc3_.hasOwnProperty("title"))
            {
               this.title = String(_loc3_.title);
            }
            if(_loc3_.hasOwnProperty("tag"))
            {
               this.setUgcTagsByString(String(_loc3_.tag));
            }
            if(_loc3_.hasOwnProperty("desc"))
            {
               this.description = String(_loc3_.desc);
            }
         }
      }
      
      public function hasTag(param1:String) : Boolean
      {
         return this._ugc_ags.indexOf(param1) >= 0;
      }
   }
}
