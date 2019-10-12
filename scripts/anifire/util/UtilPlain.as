package anifire.util
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class UtilPlain
   {
      
      public static const THE_CHAR:String = "theChar";
      
      public static const THE_CHAR_FLIP:String = "theCharFlip";
      
      public static const THE_COLOR:String = "theColor";
      
      public static const COLORABLE_PREFIX:String = "Color";
      
      public static const THE_PROP:String = AnimeConstants.MOVIECLIP_THE_PROP;
      
      public static const THE_HEAD:String = AnimeConstants.MOVIECLIP_THE_HEAD;
      
      public static const THE_WEAR:String = AnimeConstants.MOVIECLIP_THE_WEAR;
      
      public static const THE_TAIL:String = AnimeConstants.MOVIECLIP_THE_TAIL;
      
      public static const THE_MOUTH:String = AnimeConstants.MOVIECLIP_THE_MOUTH;
      
      public static const PROPERTY_SCALEX:String = "scalex";
      
      public static const PROPERTY_SCALEY:String = "scaley";
      
      private static const SPEECH_MOUTH:String = "speechMouth";
       
      
      public function UtilPlain()
      {
         super();
      }
      
      public static function get PARTS_NOT_CONTROL_BY_PLAYER() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(SPEECH_MOUTH);
         return _loc1_;
      }
      
      public static function playFamily(param1:DisplayObject) : void
      {
         var iObj:DisplayObject = param1;
         var treatment:Function = function(param1:DisplayObject):void
         {
            var _loc2_:MovieClip = null;
            if(param1 is MovieClip)
            {
               _loc2_ = MovieClip(param1);
               _loc2_.play();
            }
         };
         UtilPlain.transverseFamily(iObj,treatment,PARTS_NOT_CONTROL_BY_PLAYER);
      }
      
      public static function stopFamily(param1:DisplayObject) : void
      {
         var iObj:DisplayObject = param1;
         var treatment:Function = function(param1:DisplayObject):void
         {
            var _loc2_:MovieClip = null;
            if(param1 is MovieClip)
            {
               _loc2_ = MovieClip(param1);
               _loc2_.stop();
            }
         };
         UtilPlain.transverseFamily(iObj,treatment);
      }
      
      public static function advanceFamilyToNextFrame(param1:DisplayObject) : Boolean
      {
         var result:Boolean = false;
         var iObj:DisplayObject = param1;
         var treatment:Function = function(param1:DisplayObject):void
         {
            var _loc2_:MovieClip = null;
            if(param1 is MovieClip)
            {
               _loc2_ = MovieClip(param1);
               _loc2_.nextFrame();
               if(_loc2_.name == THE_CHAR)
               {
                  if(_loc2_.currentFrame < _loc2_.totalFrames)
                  {
                     result = true;
                  }
               }
            }
         };
         UtilPlain.transverseFamily(iObj,treatment);
         return result;
      }
      
      public static function traceDisplayList(param1:DisplayObjectContainer, param2:String = "") : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc4_);
            if(_loc3_ != null)
            {
            }
            if(param1.getChildAt(_loc4_) is DisplayObjectContainer)
            {
               traceDisplayList(DisplayObjectContainer(_loc3_),param2 + "    ");
            }
            _loc4_++;
         }
      }
      
      public static function removeAllSon(param1:DisplayObjectContainer) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = param1.numChildren;
         var _loc4_:int = _loc2_ - 1;
         while(_loc4_ >= 0)
         {
            _loc3_ = param1.getChildAt(_loc4_);
            param1.removeChildAt(_loc4_);
            _loc3_ = null;
            _loc4_--;
         }
      }
      
      public static function getCharacter(param1:DisplayObjectContainer) : MovieClip
      {
         return getInstance(param1,THE_CHAR) as MovieClip;
      }
      
      public static function getCharacterFlip(param1:DisplayObjectContainer) : MovieClip
      {
         return getInstance(param1,THE_CHAR_FLIP) as MovieClip;
      }
      
      public static function getAllShaderObj(param1:DisplayObject) : Array
      {
         var objArray:Array = null;
         var theObj:DisplayObject = param1;
         objArray = new Array();
         var treatment:Function = function(param1:DisplayObject):void
         {
            if(param1 != null)
            {
               if(DisplayObject(param1).name == "shaderObj")
               {
                  objArray.push(param1);
               }
            }
         };
         UtilPlain.transverseFamily(theObj,treatment);
         return objArray;
      }
      
      public static function getLoaderItem(param1:DisplayObject) : Array
      {
         var objArray:Array = null;
         var theObj:DisplayObject = param1;
         objArray = new Array();
         var treatment:Function = function(param1:DisplayObject):void
         {
            if(param1 != null)
            {
               if(param1 is Loader)
               {
                  objArray.push(param1);
               }
            }
         };
         UtilPlain.transverseFamily(theObj,treatment);
         return objArray;
      }
      
      public static function getLoaderItemExcludeTheHeadTheHand(param1:DisplayObject) : Array
      {
         var objArray:Array = null;
         var theObj:DisplayObject = param1;
         objArray = new Array();
         var treatment:Function = function(param1:DisplayObject):void
         {
            if(param1 != null)
            {
               if(param1 is Loader)
               {
                  objArray.push(param1);
               }
            }
         };
         UtilPlain.transverseFamily(theObj,treatment,[UtilPlain.THE_HEAD,UtilPlain.THE_PROP]);
         return objArray;
      }
      
      public static function getColorItem(param1:DisplayObject, param2:String = "") : Array
      {
         var objArray:Array = null;
         var theObj:DisplayObject = param1;
         var spec:String = param2;
         objArray = new Array();
         var treatment:Function = function(param1:DisplayObject):void
         {
            var _loc2_:String = null;
            if(param1 != null)
            {
               _loc2_ = getColorItemName(DisplayObject(param1).name);
               if(_loc2_ != "" && (spec == "" || spec != "" && _loc2_ == spec))
               {
                  objArray.push(param1);
               }
            }
         };
         UtilPlain.transverseFamily(theObj,treatment);
         return objArray;
      }
      
      public static function getColorItemName(param1:String) : String
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc2_:String = "";
         if(param1.indexOf(THE_COLOR) == 0)
         {
            _loc3_ = param1.split("_");
            if(_loc3_.length > 1)
            {
               _loc2_ = _loc3_[1];
            }
         }
         else if(param1.indexOf(COLORABLE_PREFIX) == 0)
         {
            _loc4_ = param1.substring(COLORABLE_PREFIX.length);
            _loc2_ = _loc4_;
         }
         return _loc2_;
      }
      
      public static function extractCharFlip(param1:Loader) : DisplayObject
      {
         var charFlip:Class = null;
         var swfLoader:Loader = param1;
         try
         {
            charFlip = swfLoader.content.loaderInfo.applicationDomain.getDefinition(THE_CHAR_FLIP) as Class;
         }
         catch(e:Error)
         {
            return null;
         }
         var char:DisplayObject = new charFlip();
         char.name = THE_CHAR_FLIP;
         return char;
      }
      
      public static function extractEffectThumbnail(param1:Loader) : DisplayObject
      {
         var thumbnailClass:Class = null;
         var effectSwfLoader:Loader = param1;
         try
         {
            thumbnailClass = effectSwfLoader.content.loaderInfo.applicationDomain.getDefinition("EFFECT_THUMBNAIL") as Class;
         }
         catch(e:Error)
         {
            return null;
         }
         var thumbnail:DisplayObject = new thumbnailClass();
         return thumbnail;
      }
      
      public static function extractSymbolFromLoader(param1:Loader, param2:String) : DisplayObject
      {
         var symbolClass:Class = null;
         var loader:Loader = param1;
         var symbolName:String = param2;
         try
         {
            symbolClass = loader.content.loaderInfo.applicationDomain.getDefinition(symbolName) as Class;
         }
         catch(e:Error)
         {
            return null;
         }
         var obj:DisplayObject = new symbolClass();
         return obj;
      }
      
      public static function getMultipleInstance(param1:DisplayObject, param2:*) : Array
      {
         var _loc3_:Array = new Array();
         getMultipleInstanceRecursive(param1,param2,_loc3_);
         return _loc3_;
      }
      
      private static function getMultipleInstanceRecursive(param1:DisplayObject, param2:*, param3:Array) : void
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:int = 0;
         if(param1.name.match(param2) != null)
         {
            param3.push(param1);
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc4_ = param1 as DisplayObjectContainer;
            _loc6_ = 0;
            while(_loc6_ < _loc4_.numChildren)
            {
               _loc5_ = _loc4_.getChildAt(_loc6_);
               if(_loc5_)
               {
                  getMultipleInstanceRecursive(_loc5_,param2,param3);
               }
               _loc6_++;
            }
         }
      }
      
      public static function centerAlignObj(param1:DisplayObject, param2:Rectangle, param3:Boolean) : void
      {
         var _loc4_:Rectangle = param1.getRect(param1);
         var _loc5_:Number = 1;
         if(param3)
         {
            if(param2.width / param2.height > _loc4_.width / _loc4_.height)
            {
               _loc5_ = param2.height / _loc4_.height;
            }
            else
            {
               _loc5_ = param2.width / _loc4_.width;
            }
            param1.scaleX = param1.scaleX * _loc5_;
            param1.scaleY = param1.scaleY * _loc5_;
         }
         var _loc6_:Point = new Point();
         _loc6_.x = (_loc4_.left + _loc4_.right) / 2 * _loc5_;
         _loc6_.y = (_loc4_.top + _loc4_.bottom) / 2 * _loc5_;
         var _loc7_:Point = new Point();
         _loc7_.x = (param2.left + param2.right) / 2;
         _loc7_.y = (param2.top + param2.bottom) / 2;
         var _loc8_:Point = _loc7_.subtract(_loc6_);
         param1.x = param1.x + _loc8_.x;
         param1.y = param1.y + _loc8_.y;
      }
      
      public static function getInstance(param1:DisplayObjectContainer, param2:String) : DisplayObjectContainer
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(param1.name == param2)
         {
            return param1;
         }
         _loc5_ = 0;
         while(_loc5_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc5_) is DisplayObjectContainer)
            {
               _loc4_ = DisplayObjectContainer(param1.getChildAt(_loc5_));
               _loc3_ = UtilPlain.getInstance(_loc4_,param2);
               if(_loc3_ != null)
               {
                  return _loc3_;
               }
            }
            _loc5_++;
         }
         return null;
      }
      
      public static function getMouth(param1:DisplayObjectContainer) : DisplayObjectContainer
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(param1.name == UtilPlain.THE_MOUTH && param1.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_MOUTH) != null)
         {
            return param1;
         }
         _loc4_ = 0;
         while(_loc4_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc4_) is DisplayObjectContainer)
            {
               _loc3_ = DisplayObjectContainer(param1.getChildAt(_loc4_));
               _loc2_ = UtilPlain.getMouth(_loc3_);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function getHead(param1:DisplayObjectContainer) : DisplayObjectContainer
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(param1.name == UtilPlain.THE_HEAD && param1.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_HEAD) != null)
         {
            return param1;
         }
         _loc4_ = 0;
         while(_loc4_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc4_) is DisplayObjectContainer)
            {
               _loc3_ = DisplayObjectContainer(param1.getChildAt(_loc4_));
               _loc2_ = UtilPlain.getHead(_loc3_);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function getTail(param1:DisplayObjectContainer) : DisplayObjectContainer
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(param1.name == UtilPlain.THE_TAIL && param1.getChildByName(AnimeConstants.MOVIECLIP_DEFAULT_TAIL) != null)
         {
            return param1;
         }
         _loc4_ = 0;
         while(_loc4_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc4_) is DisplayObjectContainer)
            {
               _loc3_ = DisplayObjectContainer(param1.getChildAt(_loc4_));
               _loc2_ = UtilPlain.getTail(_loc3_);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function getProp(param1:DisplayObjectContainer) : DisplayObjectContainer
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         if(param1.name == UtilPlain.THE_PROP)
         {
            return param1;
         }
         _loc4_ = 0;
         while(_loc4_ < param1.numChildren)
         {
            if(param1.getChildAt(_loc4_) is DisplayObjectContainer)
            {
               _loc3_ = DisplayObjectContainer(param1.getChildAt(_loc4_));
               _loc2_ = UtilPlain.getProp(_loc3_);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function flipObj(param1:DisplayObject, param2:Boolean = false, param3:Boolean = false) : Number
      {
         if(param2)
         {
            param1.scaleX = Math.abs(param1.scaleX);
         }
         else if(param3)
         {
            param1.scaleX = -1 * Math.abs(param1.scaleX);
         }
         else
         {
            param1.scaleX = param1.scaleX * -1;
         }
         var _loc4_:DisplayObject = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         if(_loc6_ != null)
         {
            _loc4_ = UtilPlain.getInstance(_loc6_,THE_CHAR);
            _loc5_ = UtilPlain.getInstance(_loc6_,THE_CHAR_FLIP);
         }
         if(_loc5_ != null)
         {
            if(_loc6_.scaleX < 0)
            {
               _loc4_.visible = false;
               _loc5_.visible = true;
            }
            else
            {
               _loc4_.visible = true;
               _loc5_.visible = false;
            }
         }
         return param1.scaleX;
      }
      
      public static function isObjectFlipped(param1:DisplayObjectContainer) : Boolean
      {
         if(param1.scaleX >= 0)
         {
            return false;
         }
         return true;
      }
      
      public static function transverseFamily(param1:DisplayObject, param2:Function, param3:Array = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc6_:DisplayObjectContainer = null;
         param2(param1);
         if(param1 is DisplayObjectContainer)
         {
            _loc6_ = DisplayObjectContainer(param1);
            _loc4_ = 0;
            while(_loc4_ < _loc6_.numChildren)
            {
               _loc5_ = _loc6_.getChildAt(_loc4_);
               if(!(param3 && _loc5_ && param3.indexOf(_loc5_.name) > -1))
               {
                  UtilPlain.transverseFamily(_loc5_,param2,param3);
               }
               _loc4_++;
            }
         }
      }
      
      private static function transverseFamilyWithCheck(param1:DisplayObject, param2:Function) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:EventListenerWithData = null;
         param2(param1);
         if(param1 is DisplayObjectContainer)
         {
            _loc3_ = param1 as DisplayObjectContainer;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               _loc5_ = new Object();
               _loc5_["rootNode"] = param1;
               _loc5_["treatment"] = param2;
               _loc5_["targetIndex"] = _loc4_;
               _loc5_["targetParent"] = param1;
               _loc6_ = new EventListenerWithData(null,_loc5_);
               UtilPlain.transverseFamilyListener(_loc6_);
               _loc4_++;
            }
         }
      }
      
      private static function transverseFamilyListener(param1:EventListenerWithData) : void
      {
         var data:Object = null;
         var agent:EventListenerWithData = null;
         var container:DisplayObjectContainer = null;
         var i:int = 0;
         var listenerObj:EventListenerWithData = param1;
         var rootNode:DisplayObjectContainer = listenerObj.data["rootNode"] as DisplayObjectContainer;
         var treatment:Function = listenerObj.data["treatment"];
         var targetIndex:int = listenerObj.data["targetIndex"];
         var targetParent:DisplayObjectContainer = listenerObj.data["targetParent"] as DisplayObjectContainer;
         var targetNode:DisplayObject = null;
         try
         {
            targetNode = targetParent.getChildAt(targetIndex);
         }
         catch(e:Error)
         {
            return;
         }
         targetParent.removeEventListener(Event.ADDED,listenerObj.listener);
         if(targetNode != null)
         {
            treatment(targetNode);
            if(targetNode is DisplayObjectContainer)
            {
               container = targetNode as DisplayObjectContainer;
               i = 0;
               while(i < container.numChildren)
               {
                  data = new Object();
                  data["rootNode"] = rootNode;
                  data["treatment"] = treatment;
                  data["targetIndex"] = i;
                  data["targetParent"] = container;
                  agent = new EventListenerWithData(UtilPlain.transverseFamilyListener,data);
                  transverseFamilyListener(agent);
                  i++;
               }
            }
         }
         else
         {
            data = new Object();
            data["rootNode"] = rootNode;
            data["treatment"] = treatment;
            data["targetIndex"] = targetIndex;
            data["targetParent"] = targetParent;
            agent = new EventListenerWithData(UtilPlain.transverseFamilyListener,data);
            targetParent.addEventListener(Event.ADDED,agent.listener);
         }
      }
      
      private static function isWholeFamilyReady(param1:DisplayObject) : Boolean
      {
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return false;
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc2_ = param1 as DisplayObjectContainer;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.numChildren)
            {
               if(!UtilPlain.isWholeFamilyReady(_loc2_.getChildAt(_loc3_)))
               {
                  return false;
               }
               _loc3_++;
            }
         }
         return true;
      }
      
      public static function gotoAndStopFamilyAt1(param1:DisplayObject) : void
      {
         var iObj:DisplayObject = param1;
         var treatment:Function = function(param1:DisplayObject):void
         {
            var _loc2_:MovieClip = null;
            if(param1 is MovieClip)
            {
               _loc2_ = param1 as MovieClip;
               _loc2_.gotoAndStop(1);
            }
         };
         UtilPlain.transverseFamilyWithCheck(iObj,treatment);
      }
      
      public static function nextFrameAtFamily(param1:DisplayObject) : void
      {
         var iObj:DisplayObject = param1;
         var treatment:Function = function(param1:DisplayObject):void
         {
            var _loc2_:MovieClip = null;
            if(param1 is MovieClip)
            {
               _loc2_ = param1 as MovieClip;
               if(_loc2_.currentFrame >= _loc2_.totalFrames)
               {
                  _loc2_.gotoAndStop(1);
               }
               else
               {
                  _loc2_.nextFrame();
               }
            }
         };
         UtilPlain.transverseFamilyWithCheck(iObj,treatment);
      }
      
      public static function switchParent(param1:DisplayObjectContainer, param2:DisplayObjectContainer) : void
      {
         var _loc3_:int = param2.numChildren;
         var _loc4_:int = param1.numChildren - 1;
         while(_loc4_ >= 0)
         {
            param2.addChildAt(param1.getChildAt(_loc4_),_loc3_);
            _loc4_--;
         }
      }
      
      public static function isTimeRangesOverlap(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         if(param1 >= param3 && param1 <= param4)
         {
            return true;
         }
         if(param2 >= param3 && param2 <= param4)
         {
            return true;
         }
         if(param3 >= param1 && param3 <= param2)
         {
            return true;
         }
         if(param4 >= param1 && param4 <= param2)
         {
            return true;
         }
         return false;
      }
      
      public static function getRelativeProperty(param1:DisplayObject, param2:DisplayObjectContainer, param3:String) : Number
      {
         if(param1 == null)
         {
            throw new Error("The target Obj is null.");
         }
         if(param2 == null)
         {
            throw new Error("The reference container is null.");
         }
         var _loc4_:DisplayObject = param1;
         var _loc5_:Number = 1;
         while(true)
         {
            switch(param3)
            {
               case PROPERTY_SCALEX:
                  _loc5_ = _loc5_ * _loc4_.scaleX;
                  break;
               case PROPERTY_SCALEY:
                  _loc5_ = _loc5_ * _loc4_.scaleY;
            }
            _loc4_ = _loc4_.parent;
            if(_loc4_ == null)
            {
               break;
            }
            if(!(_loc4_ != param2 && _loc4_ != param1.stage))
            {
               if(param1.stage != param2 && _loc4_ == param1.stage)
               {
                  throw new Error("referenceContainer does not contain targetObj");
               }
               return _loc5_;
            }
         }
         throw new Error("Reference Container is not found during reverse-parent finding");
      }
      
      public static function get_isMoviePublished_by_flashVar(param1:String, param2:String) : Boolean
      {
         if(param1 != null && param1 == "0")
         {
            return false;
         }
         if(param1 != null && param1 == "1")
         {
            return true;
         }
         if(param1 == null && param2 == null)
         {
            return true;
         }
         return false;
      }
      
      public static function get_isMoviePrivateShare_by_flashVar(param1:String) : Boolean
      {
         if(param1 != null && param1 == "1")
         {
            return true;
         }
         return false;
      }
      
      public static function randomizeArray(param1:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc2_:int = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = Math.floor(Math.random() * _loc2_);
            _loc3_ = param1[_loc5_];
            param1[_loc5_] = param1[_loc4_];
            param1[_loc4_] = _loc3_;
            _loc5_++;
         }
      }
      
      public static function randomNumberRange(param1:Number, param2:Number) : Number
      {
         param2++;
         return Math.floor(param1 + Math.random() * (param2 - param1));
      }
      
      public static function rasterizeImage(param1:Boolean, param2:DisplayObjectContainer, param3:Rectangle) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Shape = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:BitmapData = null;
         var _loc4_:String = "rasterized_img";
         if(param1)
         {
            _loc8_ = new BitmapData(param3.width,param3.height);
            _loc8_.draw(param2,null,null,null,param3,false);
            _loc6_ = new Shape();
            _loc6_.graphics.beginBitmapFill(_loc8_);
            _loc6_.graphics.drawRect(param3.left,param3.top,param3.width,param3.height);
            _loc6_.graphics.endFill();
            _loc6_.name = _loc4_;
            _loc5_ = 0;
            while(_loc5_ < param2.numChildren)
            {
               _loc7_ = param2.getChildAt(_loc5_);
               if(_loc7_ != null)
               {
                  _loc7_.visible = false;
               }
               _loc5_++;
            }
            param2.addChild(_loc6_);
         }
         else
         {
            _loc6_ = param2.getChildByName(_loc4_) as Shape;
            if(_loc6_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < param2.numChildren)
               {
                  _loc7_ = param2.getChildAt(_loc5_);
                  if(_loc7_ != null)
                  {
                     _loc7_.visible = true;
                  }
                  _loc5_++;
               }
               param2.removeChild(_loc6_);
            }
         }
      }
      
      public static function convertZipAsImagedataObject(param1:ZipFile) : Object
      {
         var _loc2_:UtilHashArray = null;
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:ZipEntry = null;
         var _loc6_:ByteArray = null;
         var _loc7_:UtilCrypto = null;
         var _loc8_:String = null;
         _loc2_ = new UtilHashArray();
         _loc3_ = new Object();
         _loc4_ = 0;
         while(_loc4_ < param1.size)
         {
            _loc5_ = param1.entries[_loc4_];
            if(_loc5_.name == "desc.xml")
            {
               _loc3_["xml"] = new XML(param1.getInput(_loc5_).toString());
            }
            else if(_loc5_.name.substr(_loc5_.name.length - 3,3).toLowerCase() == "swf")
            {
               _loc8_ = _loc5_.name.split(".")[1];
               _loc6_ = param1.getInput(_loc5_);
               if(CcLibConstant.ALL_LIBRARY_TYPES.indexOf(_loc8_) == -1)
               {
                  _loc7_ = new UtilCrypto();
                  _loc7_.decrypt(_loc6_);
               }
               _loc2_.push(_loc5_.name,_loc6_);
            }
            _loc4_++;
         }
         _loc3_["imageData"] = _loc2_;
         return _loc3_;
      }
   }
}

import flash.events.Event;

class EventListenerWithData
{
    
   
   public var data:Object;
   
   public var event:Event;
   
   private var callBack:Function;
   
   function EventListenerWithData(param1:Function, param2:Object = null)
   {
      super();
      this.callBack = param1;
      this.data = param2;
   }
   
   public function listener(param1:Event) : void
   {
      this.event = param1;
      this.callBack(this);
   }
}
