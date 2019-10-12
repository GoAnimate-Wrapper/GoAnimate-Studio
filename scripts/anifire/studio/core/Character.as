package anifire.studio.core
{
   import anifire.color.SelectedColor;
   import anifire.component.ActionSequence;
   import anifire.component.CustomCharacterMaker;
   import anifire.constant.AnimeConstants;
   import anifire.constant.RaceConstants;
   import anifire.core.AssetLinkage;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.event.ExtraDataEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.interfaces.IBehavior;
   import anifire.interfaces.ISequentialAction;
   import anifire.managers.CCBodyManager;
   import anifire.managers.CCThemeManager;
   import anifire.studio.assets.controllers.AssetTransitionHelper;
   import anifire.studio.assets.models.AssetColor;
   import anifire.studio.assets.models.AssetRotation;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.commands.AddPropCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.RemovePropCommand;
   import anifire.studio.components.ConfirmPopUp;
   import anifire.studio.core.sound.ProgressiveSound;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.CharacterAssetEvent;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IEye;
   import anifire.studio.interfaces.IFacial;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IHoldable;
   import anifire.studio.interfaces.IMotion;
   import anifire.studio.interfaces.IMouth;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   import anifire.studio.interfaces.ISlidable;
   import anifire.studio.interfaces.IWearable;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.Util;
   import anifire.util.UtilArray;
   import anifire.util.UtilDict;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilXmlInfo;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import mx.events.DragEvent;
   import spark.events.PopUpEvent;
   
   public class Character extends Asset implements ISlidable, IRotatable, IMovable, IScalable, IFlippable, IColorable, IFacial, IHoldable, IWearable, IEye, IMotion, IMouth, ISequentialAction
   {
      
      public static const XML_NODE_NAME:String = "char";
      
      public static const AUTO_FACIAL_EXPRESSION:String = "auto";
      
      public static const KEY_SCALE_X:String = "scaleX";
      
      public static const KEY_SCALE_Y:String = "scaleY";
      
      public static const KEY_ROTATION:String = "rotation";
      
      public static const KEY_END_SCALE_X:String = "endScaleX";
      
      public static const KEY_END_SCALE_Y:String = "endScaleY";
      
      public static const KEY_MOTION_DATA:String = "motion";
      
      public static const KEY_FACING:String = "face";
      
      public static const KEY_HEAD:String = "head";
      
      public static const KEY_PLACEHOLDER:String = "placeholder";
       
      
      private var _fromTray:Boolean = false;
      
      private var _byMovement:Boolean = false;
      
      private var _byMenu:Boolean = false;
      
      private var _facing:String = "left";
      
      private var _motionDirection:String = "";
      
      private var _actionId:String;
      
      private var _action:IBehavior;
      
      private var _motionId:String;
      
      private var _motion:Motion;
      
      private var _facial:Facial;
      
      private var _motionShadow:Character;
      
      private var _shadowParent:Character = null;
      
      private var _prop:Prop;
      
      private var _head:Prop;
      
      private var _wear:Prop;
      
      private var _lookAtCamera:Boolean = false;
      
      private var _lookAtCameraSupported:Boolean = false;
      
      private var _demoSpeech:Boolean = false;
      
      private var _isBlink:Boolean = false;
      
      private var _loadCount:Number = 0;
      
      private var _loadTotal:Number = 0;
      
      private var _speechVoice:String;
      
      private var _speakingVolume:Number = 1;
      
      private var _actionSeq:ActionSequence;
      
      private var _motionData:MotionData;
      
      private var _rotation:AssetRotation;
      
      private var _imageLocalCenter:Point;
      
      private var _isShadow:Boolean = false;
      
      protected var _swapTarget:CharThumb;
      
      protected var _actionIdToSwap:String;
      
      protected var _facialIdToSwap:String;
      
      public function Character(param1:String = "")
      {
         this._rotation = new AssetRotation();
         super();
         if(param1 == "")
         {
            param1 = "AVATOR" + this.assetCount;
         }
         this.id = param1;
      }
      
      public static function getActionFileNameFromXML(param1:XML) : String
      {
         var _loc2_:String = UtilXmlInfo.getZipFileNameOfBehaviour(param1.action,true);
         var _loc3_:RegExp = /zip/gi;
         _loc2_.replace(_loc3_,"xml");
         return _loc2_;
      }
      
      public function get actionSequence() : ActionSequence
      {
         return this._actionSeq;
      }
      
      public function set actionSequence(param1:ActionSequence) : void
      {
         this._actionSeq = param1;
      }
      
      public function get speakingVolume() : Number
      {
         return this._speakingVolume;
      }
      
      public function set speakingVolume(param1:Number) : void
      {
         this._speakingVolume = param1;
      }
      
      public function get lookAtCamera() : Boolean
      {
         if(this.head)
         {
            return this.head.lookAtCamera;
         }
         return this._lookAtCamera;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         if(this.head)
         {
            this.head.lookAtCamera = param1;
         }
         if(this._lookAtCamera != param1)
         {
            this._lookAtCamera = param1;
            dispatchEvent(new ExtraDataEvent(CustomCharacterMaker.LOOK_AT_CAMERA_CHANGED,this,this._lookAtCamera));
            dispatchEvent(new AssetEvent(AssetEvent.EYE_CHANGE,this));
         }
      }
      
      public function set demoSpeech(param1:Boolean) : void
      {
         if(this.head)
         {
            this.head.demoSpeech = param1;
         }
         if(this._demoSpeech != param1)
         {
            this._demoSpeech = param1;
            this.dispatchEvent(new AssetEvent(CharacterAssetEvent.MOUTH_CHANGE,this));
         }
      }
      
      public function get demoSpeech() : Boolean
      {
         return this._demoSpeech;
      }
      
      public function get shadowParent() : Character
      {
         return this._shadowParent;
      }
      
      public function get motionShadow() : Character
      {
         return this._motionShadow;
      }
      
      public function get shadow() : Object
      {
         return this._motionShadow;
      }
      
      public function set motionShadow(param1:Character) : void
      {
         if(this._motionShadow)
         {
            this._motionShadow.removeEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
         }
         this._motionShadow = param1;
         if(this._motionShadow)
         {
            this._motionShadow.addEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
            this._motionShadow._shadowParent = this;
         }
      }
      
      public function set facing(param1:String) : void
      {
         var facing:String = param1;
         var doFlip:Boolean = false;
         var newface:Number = 0;
         if(facing != this.facing && (this.facing == AnimeConstants.FACING_LEFT || this.facing == AnimeConstants.FACING_RIGHT))
         {
            try
            {
               if(newface < 0)
               {
                  this._facing = this.defaultFacing == AnimeConstants.FACING_LEFT?AnimeConstants.FACING_RIGHT:AnimeConstants.FACING_LEFT;
               }
               else
               {
                  this._facing = this.defaultFacing;
               }
            }
            catch(e:Error)
            {
            }
         }
         if(newface == 0)
         {
            this._facing = facing;
         }
         if(doFlip)
         {
            this.exchangeProp();
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_HFLIPPED,this));
      }
      
      public function set motionDirection(param1:String) : void
      {
         this._motionDirection = param1;
      }
      
      public function get motionDirection() : String
      {
         return this._motionDirection;
      }
      
      public function get facing() : String
      {
         return this._facing;
      }
      
      public function get isFlipped() : Boolean
      {
         return this._facing != AnimeConstants.FACING_LEFT;
      }
      
      private function get defaultFacing() : String
      {
         return CharThumb(this.thumb).facing;
      }
      
      public function set actionId(param1:String) : void
      {
         this._actionId = param1;
      }
      
      public function get actionId() : String
      {
         return this._actionId;
      }
      
      public function removeAction() : void
      {
         this._action = null;
      }
      
      override public function set action(param1:IBehavior) : void
      {
         this._imageLocalCenter = null;
         this.addTalkHeadForSpeech();
         this._action = Action(param1);
         this.actionId = Action(param1).id;
         this.imageData = Action(param1).imageData;
      }
      
      public function get action() : IBehavior
      {
         return this._action;
      }
      
      public function get motionId() : String
      {
         return this._motionId;
      }
      
      public function set motionId(param1:String) : void
      {
         this._motionId = param1;
      }
      
      public function set motion(param1:Motion) : void
      {
         this._motion = param1;
         if(this._motion == null)
         {
            this.motionId = "";
         }
         else
         {
            this.motionId = this._motion.id;
         }
      }
      
      public function get motion() : Motion
      {
         return this._motion;
      }
      
      public function addProp(param1:Prop) : void
      {
      }
      
      public function get prop() : Prop
      {
         return this._prop;
      }
      
      public function set prop(param1:Prop) : void
      {
         this._prop = param1;
      }
      
      public function get head() : Prop
      {
         return this._head;
      }
      
      public function set head(param1:Prop) : void
      {
         this._head = param1;
      }
      
      public function get wear() : Prop
      {
         return this._wear;
      }
      
      public function set wear(param1:Prop) : void
      {
         this._wear = param1;
      }
      
      function set fromTray(param1:Boolean) : void
      {
         this._fromTray = param1;
      }
      
      function get fromTray() : Boolean
      {
         return this._fromTray;
      }
      
      public function get isBlink() : Boolean
      {
         return this._isBlink;
      }
      
      public function set isBlink(param1:Boolean) : void
      {
         this._isBlink = param1;
      }
      
      public function set speechVoice(param1:String) : void
      {
         this._speechVoice = param1;
      }
      
      public function get speechVoice() : String
      {
         return this._speechVoice;
      }
      
      public function getDataAndKey() : UtilHashArray
      {
         var _loc5_:UtilHashArray = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc1_:UtilHashArray = new UtilHashArray();
         var _loc2_:String = this.thumb.id;
         var _loc3_:String = this.thumb.theme.id + ".char." + _loc2_ + "." + this.action.id;
         _loc1_.push(_loc3_,this.action.imageData,true);
         var _loc4_:int = 0;
         while(_loc4_ < CharThumb(this.thumb).getLibraryNum())
         {
            _loc7_ = CharThumb(this.thumb).getLibraryIdByIndex(_loc4_);
            _loc1_.push(_loc7_,CharThumb(this.thumb).getLibraryById(_loc7_));
            _loc4_++;
         }
         if(this.prop != null)
         {
            if((this.prop.thumb as PropThumb).getStateNum() == 0)
            {
               _loc2_ = this.prop.thumb.id;
               _loc1_.push(this.prop.thumb.theme.id + ".prop." + _loc2_,this.prop.thumb.imageData,true);
            }
            else
            {
               _loc5_ = this.prop.getDataAndKey();
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  _loc1_.push(_loc5_.getKey(_loc6_),_loc5_.getValueByIndex(_loc6_),true);
                  _loc6_++;
               }
            }
         }
         if(this.head != null)
         {
            if((this.head.thumb as PropThumb).getStateNum() == 0)
            {
               _loc2_ = this.head.thumb.id;
               _loc1_.push(this.head.thumb.theme.id + ".prop." + _loc2_,this.head.thumb.imageData,true);
            }
            else
            {
               _loc5_ = this.head.getDataAndKey();
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  _loc1_.push(_loc5_.getKey(_loc6_),_loc5_.getValueByIndex(_loc6_),true);
                  _loc6_++;
               }
            }
         }
         if(this.wear != null)
         {
            if((this.wear.thumb as PropThumb).getStateNum() == 0)
            {
               _loc2_ = this.wear.thumb.id;
               _loc1_.push(this.wear.thumb.theme.id + ".prop." + _loc2_,this.wear.thumb.imageData,true);
            }
            else
            {
               _loc5_ = this.wear.getDataAndKey();
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  _loc1_.push(_loc5_.getKey(_loc6_),_loc5_.getValueByIndex(_loc6_),true);
                  _loc6_++;
               }
            }
            _loc1_.push(this.wear.thumb.theme.id + ".prop." + this.wear.thumb.id,this.wear.thumb.imageData,true);
         }
         return _loc1_;
      }
      
      public function loadActionAndMotion(param1:CoreEvent) : void
      {
         this.motion = (this.thumb as CharThumb).defaultMotion;
         if(this._fromTray)
         {
            this.action = CharThumb(this.thumb).defaultAction;
         }
         else
         {
            this.action = CharThumb(this.thumb).getActionById(this.actionId);
         }
      }
      
      private function getMotionFacing() : int
      {
         var _loc1_:String = this.getFacingDirection();
         var _loc2_:int = _loc1_ == this.defaultFacing?1:-1;
         if(this.motionDirection == AnimeConstants.MOTION_FORWARD)
         {
            return _loc2_;
         }
         return _loc2_ * -1;
      }
      
      private function setMotionFacing(param1:int) : void
      {
         var _loc2_:String = this.facing;
         var _loc3_:int = _loc2_ == this.defaultFacing?1:-1;
         if(_loc3_ != param1)
         {
            this.motionDirection = AnimeConstants.MOTION_BACKWARD;
         }
         else
         {
            this.motionDirection = AnimeConstants.MOTION_FORWARD;
         }
      }
      
      override public function convertToXml() : XML
      {
         var xml:XML = null;
         var childXml:XML = null;
         var motionFacing:int = 0;
         var index:uint = 0;
         var i:int = 0;
         xml = <char/>;
         try
         {
            motionFacing = this.getMotionFacing();
            index = this.scene.getOverallOrdering(this);
            xml.@id = this.id;
            xml.@index = String(index);
            xml.@raceCode = thumb.raceCode;
            if(this.lookAtCamera)
            {
               xml.@faceCamera = "true";
            }
            xml.action = Action(this.action).getKey();
            xml.action.@face = this.serializeMotion("facing",this.motionShadow);
            xml.action.@motionface = motionFacing;
            if(this.actionSequence)
            {
               xml.action.@seq = this.actionSequence.toString();
            }
            if(this.mThumbId)
            {
               xml.mThumb.@id = this.mThumbId;
            }
            if(this.prop)
            {
               childXml = this.prop.convertToXml();
               xml.appendChild(childXml);
            }
            if(this.head)
            {
               childXml = this.head.convertToXml();
               xml.appendChild(childXml);
            }
            if(this.wear)
            {
               childXml = this.wear.convertToXml();
               xml.appendChild(childXml);
            }
            xml.x = this.serializeMotion("x",this.motionShadow);
            xml.y = this.serializeMotion("y",this.motionShadow);
            xml.xscale = this.serializeMotion("xscale",this.motionShadow);
            xml.yscale = this.serializeMotion("yscale",this.motionShadow);
            xml.rotation = this.serializeMotion("rotation",this.motionShadow);
            if(defaultColorSetId != "")
            {
               xml.dcsn = defaultColorSetId;
            }
            if(customColor.length > 0)
            {
               i = 0;
               while(i < customColor.length)
               {
                  childXml = <color>{(customColor.getValueByIndex(i) as SelectedColor).dstColor}</color>;
                  childXml.@r = customColor.getKey(i);
                  if((customColor.getValueByIndex(i) as SelectedColor).orgColor != uint.MAX_VALUE)
                  {
                     childXml.@oc = "0x" + (customColor.getValueByIndex(i) as SelectedColor).orgColor.toString(16);
                  }
                  xml.appendChild(childXml);
                  i++;
               }
            }
            if(this._motionData)
            {
               childXml = this._motionData.convertToXml();
               xml.appendChild(childXml);
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize char, broken char xml: " + xml.toXMLString());
         }
         return xml;
      }
      
      override public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function serializeMotion(param1:String, param2:Character) : Array
      {
         var tempArray:Array = null;
         var i:int = 0;
         var path:Vector.<Point> = null;
         var property:String = param1;
         var shadow:Character = param2;
         try
         {
            tempArray = new Array();
            switch(property)
            {
               case "x":
                  tempArray.push(Util.roundNum(this.x));
                  break;
               case "y":
                  tempArray.push(Util.roundNum(this.y));
                  break;
               case "xscale":
                  tempArray.push(Util.roundNum(this.scaleX));
                  break;
               case "yscale":
                  tempArray.push(Util.roundNum(this.scaleY));
                  break;
               case "facing":
                  tempArray.push(this.facing == this.defaultFacing?1:-1);
                  break;
               case "rotation":
                  tempArray.push(Util.roundNum(this.rotation));
            }
            if(this._motionData && this._motionData.path && this._motionData.path.length > 2)
            {
               i = 0;
               path = this._motionData.path;
               switch(property)
               {
                  case "x":
                     i = 1;
                     while(i < path.length - 1)
                     {
                        tempArray.push(Util.roundNum(Point(path[i]).x));
                        i++;
                     }
                     break;
                  case "y":
                     i = 1;
                     while(i < path.length - 1)
                     {
                        tempArray.push(Util.roundNum(Point(path[i]).y));
                        i++;
                     }
               }
            }
            if(shadow != null)
            {
               switch(property)
               {
                  case "x":
                     tempArray.push(Util.roundNum(shadow.x));
                     break;
                  case "y":
                     tempArray.push(Util.roundNum(shadow.y));
                     break;
                  case "xscale":
                     tempArray.push(Util.roundNum(shadow.scaleX));
                     break;
                  case "yscale":
                     tempArray.push(Util.roundNum(shadow.scaleY));
                     break;
                  case "facing":
                     tempArray.push(this.motionShadow.facing == this.defaultFacing?1:-1);
                     break;
                  case "rotation":
                     tempArray.push(Util.roundNum(shadow.rotation));
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize character motion " + this.id,tempArray.toString(),e);
         }
         return tempArray;
      }
      
      public function getActionDefaultTotalFrame() : int
      {
         var _loc1_:CharThumb = null;
         if(this.action != null)
         {
            _loc1_ = this.thumb as CharThumb;
            if(_loc1_ != null && _loc1_.defaultAction != null && this.action.id == _loc1_.defaultAction.id)
            {
               return UtilUnitConvert.pixelToFrame(AnimeConstants.SCENE_LENGTH_DEFAULT);
            }
            return Action(this.action).totalFrame;
         }
         return 1;
      }
      
      private function getMotionConstants(param1:String, param2:String, param3:int) : String
      {
         if(param1 == param2)
         {
            if(param3 == 1)
            {
               return AnimeConstants.MOTION_FORWARD;
            }
            return AnimeConstants.MOTION_BACKWARD;
         }
         if(param3 == -1)
         {
            return AnimeConstants.MOTION_FORWARD;
         }
         return AnimeConstants.MOTION_BACKWARD;
      }
      
      public function deSerialize(param1:XML, param2:AnimeScene, param3:Boolean = true) : void
      {
         var _loc10_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:String = null;
         var _loc20_:AnimeSound = null;
         var _loc21_:XML = null;
         var _loc22_:int = 0;
         var _loc23_:String = null;
         var _loc24_:SelectedColor = null;
         var _loc25_:XML = null;
         var _loc26_:Prop = null;
         var _loc27_:XML = null;
         var _loc28_:XML = null;
         var _loc4_:String = getActionFileNameFromXML(param1);
         var _loc5_:String = UtilXmlInfo.getThumbIdFromFileName(_loc4_);
         var _loc6_:String = UtilXmlInfo.getCharIdFromFileName(_loc4_);
         var _loc7_:String = UtilXmlInfo.getThemeIdFromFileName(_loc4_);
         var _loc8_:Theme = _loc7_ == "ugc"?ThemeManager.instance.ccTheme:ThemeManager.instance.getTheme(_loc7_);
         var _loc9_:CharThumb = _loc8_.getCharThumbById(_loc6_);
         if(_loc9_)
         {
            this.scene = param2;
            this.thumb = _loc9_;
            this.actionId = _loc5_;
            if(param1.hasOwnProperty("x"))
            {
               _loc13_ = String(param1.x).split(",");
            }
            if(param1.hasOwnProperty("y"))
            {
               _loc14_ = String(param1.y).split(",");
            }
            if(param1.hasOwnProperty("xscale"))
            {
               _loc15_ = String(param1.xscale).split(",");
            }
            if(param1.hasOwnProperty("yscale"))
            {
               _loc16_ = String(param1.yscale).split(",");
            }
            if(param1.hasOwnProperty("rotation"))
            {
               _loc17_ = String(param1.rotation).split(",");
            }
            _loc18_ = String(param1.action.@face).split(",");
            this.lookAtCamera = String(param1.@faceCamera) == "true";
            _loc19_ = Console.getConsole().linkageController.getSpeechSoundIdByScene(this.scene);
            _loc20_ = Console.getConsole().speechManager.getValueByKey(_loc19_);
            if(_loc20_ is ProgressiveSound)
            {
               _loc23_ = Console.getConsole().linkageController.getTargetIdOfSpeech(_loc19_);
               this.demoSpeech = AssetLinkage.getCharIdFromLinkage(_loc23_) == this.id?true:false;
            }
            this.setReferencePoint(_loc13_[0],_loc14_[0]);
            this.move(_loc13_[0],_loc14_[0]);
            this.scaleX = _loc15_[0];
            this.scaleY = _loc16_[0];
            this.rotation = _loc17_[0];
            this.facing = this.getFacingConstants(_loc9_.facing,_loc18_[0]);
            if(param3)
            {
               this.action = _loc9_.getActionById(_loc5_);
            }
            else
            {
               this._action = _loc9_.getActionById(_loc5_);
            }
            if(param1.mThumb)
            {
               this.mThumbId = param1.mThumb.@id;
            }
            if(param1.action.hasOwnProperty("@seq"))
            {
               this.actionSequence = new ActionSequence();
               this.actionSequence.init(String(param1.action.@seq).split(","));
            }
            if(param1.dcsn.length() > 0 && !this.thumb.isCC)
            {
               this.defaultColorSetId = String(param1.dcsn);
               this.defaultColorSet = Thumb(this.thumb).getColorSetById(this.defaultColorSetId);
            }
            customColor = new UtilHashSelectedColor();
            _loc22_ = 0;
            while(_loc22_ < param1.child("color").length())
            {
               _loc21_ = param1.child("color")[_loc22_];
               _loc24_ = new SelectedColor(_loc21_.@r,_loc21_.attribute("oc").length() == 0?uint(uint.MAX_VALUE):uint(_loc21_.@oc),uint(_loc21_));
               this.addCustomColor(_loc21_.@r,_loc24_);
               _loc22_++;
            }
            if(this.action != null && this.action.imageData != null)
            {
               this.isLoadded = true;
               _loc10_ = 0;
               while(_loc10_ < param1.prop.length())
               {
                  _loc25_ = param1.prop[_loc10_];
                  _loc26_ = new Prop();
                  _loc26_.deSerialize(_loc25_,this);
                  this.addPropDataAndClip(_loc26_);
                  _loc10_++;
               }
            }
            if(_loc13_ && _loc13_.length > 1)
            {
               this.deserializeMotion(param1,_loc13_,_loc14_,_loc17_,_loc15_,_loc16_,_loc18_);
               this.setMotionFacing(param1.action.@motionface);
            }
         }
         _loc10_ = 0;
         while(_loc10_ < param1.prop.length())
         {
            _loc25_ = param1.prop[_loc10_];
            _loc26_ = new Prop();
            _loc26_.deSerialize(_loc25_,this);
            this.addPropDataAndClip(_loc26_);
            _loc10_++;
         }
         var _loc11_:int = 0;
         while(_loc11_ < param1.head.length())
         {
            _loc27_ = param1.head[_loc11_];
            _loc26_ = new Prop();
            _loc26_.lookAtCamera = this.lookAtCamera;
            _loc26_.demoSpeech = this.demoSpeech;
            _loc26_.deSerialize(_loc27_,this);
            this.addHeadDataAndClip(_loc26_);
            _loc11_++;
         }
         var _loc12_:int = 0;
         while(_loc12_ < param1.wear.length())
         {
            _loc28_ = param1.wear[_loc12_];
            _loc26_ = new Prop();
            _loc26_.deSerialize(_loc28_,this);
            this.addWearDataAndClip(_loc26_);
            _loc12_++;
         }
      }
      
      private function deserializeMotion(param1:XML, param2:Array, param3:Array, param4:Array, param5:Array, param6:Array, param7:Array) : void
      {
         var _loc8_:MotionData = null;
         var _loc9_:Vector.<Point> = null;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         if(param2.length > 1 && param2.length == param3.length)
         {
            _loc8_ = new MotionData();
            _loc9_ = new Vector.<Point>();
            _loc10_ = 0;
            while(_loc10_ < param2.length)
            {
               _loc9_.push(new Point(param2[_loc10_],param3[_loc10_]));
               _loc10_++;
            }
            _loc8_.path = _loc9_;
            _loc8_.startRotation = this.rotation;
            if(param1.hasOwnProperty(MotionData.XML_TAG_NAME))
            {
               _loc8_.convertFromXml(param1.child(MotionData.XML_TAG_NAME)[0]);
            }
            else
            {
               _loc8_.version = "1";
            }
            _loc11_ = this.facing;
            _loc8_.assetFace = param7[0];
            this.motionData = _loc8_;
            if(this._motionShadow)
            {
               this._motionShadow.setReferencePoint(param2[param2.length - 1],param3[param3.length - 1]);
               this._motionShadow.move(param2[param2.length - 1],param3[param3.length - 1]);
               if(param4 && param4.length > 1)
               {
                  this._motionShadow.rotation = param4[param4.length - 1];
               }
               if(param7 && param7.length > 1)
               {
                  this._motionShadow.facing = this.getFacingConstants(CharThumb(this.thumb).facing,param7[param7.length - 1]);
               }
               if(param5 && param5.length > 1)
               {
                  this._motionShadow.scaleX = param5[param5.length - 1];
                  this._motionShadow.scaleY = param6[param6.length - 1];
               }
            }
            this.facing = _loc11_;
         }
      }
      
      public function deserializeHeadFromStarter(param1:XML) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param1)
         {
            _loc2_ = UtilXmlInfo.getZipFileNameOfProp(param1.child("file")[0].toString());
            _loc3_ = UtilXmlInfo.getThumbIdFromFileName(_loc2_);
            _loc4_ = _loc2_.split(".").length == 4?_loc3_:UtilXmlInfo.getCharIdFromFileName(_loc2_);
            if(_loc3_.indexOf(".head.") != -1)
            {
               _loc4_ = UtilXmlInfo.getFacialThumbIdFromFileName(_loc3_);
               _loc3_ = UtilXmlInfo.getFacialIdFromFileName(_loc3_);
            }
            this.changeFacialById(_loc3_);
         }
      }
      
      private function getFacingConstants(param1:String, param2:int) : String
      {
         if(param1 == AnimeConstants.FACING_LEFT)
         {
            return param2 == 1?AnimeConstants.FACING_LEFT:AnimeConstants.FACING_RIGHT;
         }
         return param2 == 1?AnimeConstants.FACING_RIGHT:AnimeConstants.FACING_LEFT;
      }
      
      public function applyThumbFromThemeStarter(param1:CharThumb) : void
      {
         if(param1.isFromThemeStarter)
         {
            this.thumb = param1;
         }
      }
      
      override public function set thumb(param1:Thumb) : void
      {
         var _loc2_:CharThumb = param1 as CharThumb;
         super.thumb = _loc2_;
         if(this._fromTray)
         {
            if(CCThemeManager.instance.getThemeModel(_loc2_.ccThemeId).completed && !CCBodyManager.instance.getBodyModel(_loc2_.id).completed)
            {
               CCBodyManager.instance.getBodyModel(_loc2_.id).addEventListener(Event.COMPLETE,this.onLoadCCBodyFinish);
               CCBodyManager.instance.getBodyModel(_loc2_.id).load();
            }
            else
            {
               this.initDefaultAction();
            }
         }
         else
         {
            this.action = _loc2_.getActionByIdWithDefault(this.actionId);
            this.motion = _loc2_.getMotionByIdWithDefault(this.motionId);
         }
      }
      
      private function onLoadCCBodyFinish(param1:Event = null) : void
      {
         this.initDefaultAction();
      }
      
      private function initDefaultAction() : void
      {
         var _loc1_:CharThumb = this.thumb as CharThumb;
         this.action = _loc1_.defaultAction as Action;
         this.motion = _loc1_.defaultMotion;
         if(this.action is ISequentialAction)
         {
            this.actionSequence = ISequentialAction(this.action).actionSequence.clone();
            this.actionSequence.randomize();
         }
         else
         {
            this.actionSequence = null;
         }
      }
      
      public function get lookAtCameraSupported() : Boolean
      {
         if(this.head)
         {
            return this.head.lookAtCameraSupported;
         }
         return this._lookAtCameraSupported;
      }
      
      private function isCharacterThumbsReady() : Boolean
      {
         var _loc1_:CharThumb = this.thumb as CharThumb;
         if(!_loc1_.isThumbReady(this.actionId))
         {
            return false;
         }
         return true;
      }
      
      public function doMouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      function onMouseUp(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:State = null;
         var _loc4_:int = 0;
         var _loc5_:UtilHashSelectedColor = null;
         var _loc6_:ICommand = null;
         if(Console.getConsole().currDragObject is Prop)
         {
            _loc2_ = Console.getConsole().currDragObject.thumb;
            if(!((_loc2_ as PropThumb).headable && this.thumb.isCC))
            {
               if(_loc2_ is PropThumb && ((_loc2_ as PropThumb).holdable || (_loc2_ as PropThumb).headable || (_loc2_ as PropThumb).wearable))
               {
                  if(!this.isMotionShadow())
                  {
                     _loc6_ = new AddPropCommand();
                     _loc6_.execute();
                  }
                  if((_loc2_ as PropThumb).getStateNum() > 0)
                  {
                     _loc3_ = Prop(Console.getConsole().currDragObject).state;
                  }
                  _loc5_ = Prop(Console.getConsole().currDragObject).customColor;
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_.length)
                  {
                     addCustomColor(_loc5_.getKey(_loc4_),_loc5_.getValueByIndex(_loc4_));
                     _loc4_++;
                  }
                  this.autoStateModify(_loc2_ as PropThumb,_loc3_);
                  Console.getConsole().currDragObject.deleteAsset();
                  Console.getConsole().currDragObject = null;
                  this.scene.selectedAsset = null;
               }
            }
         }
      }
      
      public function updateFacing(param1:Character = null) : void
      {
         if(this._motionShadow != null || this.isMotionShadow())
         {
            if(this.getFacingDirection(param1) == AnimeConstants.FACING_LEFT)
            {
               this.facing = AnimeConstants.FACING_LEFT;
            }
            else if(this.getFacingDirection(param1) == AnimeConstants.FACING_RIGHT)
            {
               this.facing = AnimeConstants.FACING_RIGHT;
            }
            if(this._motionShadow)
            {
               this._motionShadow.updateFacing(this);
            }
         }
      }
      
      private function getFacingDirection(param1:Character = null) : String
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc2_:Number = this.x;
         if(this.motionShadow != null)
         {
            _loc3_ = this.motionShadow.x;
            if(this._motionData && this._motionData.path.length > 1)
            {
               _loc3_ = Point(this._motionData.path[1]).x;
            }
            if(this.motionDirection == AnimeConstants.MOTION_FORWARD)
            {
               if(_loc2_ < _loc3_)
               {
                  return AnimeConstants.FACING_RIGHT;
               }
               if(_loc2_ > _loc3_)
               {
                  return AnimeConstants.FACING_LEFT;
               }
               return AnimeConstants.FACING_UNKNOW;
            }
            if(_loc3_ < _loc2_)
            {
               return AnimeConstants.FACING_RIGHT;
            }
            if(_loc3_ > _loc2_)
            {
               return AnimeConstants.FACING_LEFT;
            }
            return AnimeConstants.FACING_UNKNOW;
         }
         if(this.isMotionShadow() && param1 != null)
         {
            _loc4_ = param1.x;
            if(param1.motionData && param1.motionData.path.length > 1)
            {
               _loc4_ = Point(param1.motionData.path[param1.motionData.path.length - 2]).x;
            }
            if(param1.motionDirection == AnimeConstants.MOTION_FORWARD)
            {
               return _loc2_ < _loc4_?AnimeConstants.FACING_LEFT:AnimeConstants.FACING_RIGHT;
            }
            return _loc4_ < _loc2_?AnimeConstants.FACING_LEFT:AnimeConstants.FACING_RIGHT;
         }
         return AnimeConstants.FACING_UNKNOW;
      }
      
      public function addPropOnDragDrop(param1:DragEvent) : void
      {
         this.doDragDrop(param1);
      }
      
      function doDragDrop(param1:DragEvent) : void
      {
         var _loc4_:ICommand = null;
         var _loc2_:Object = param1.dragSource.dataForFormat("thumb");
         var _loc3_:String = "";
         if(param1.dragSource.hasFormat("colorSetId"))
         {
            _loc3_ = String(param1.dragSource.dataForFormat("colorSetId"));
         }
         if(PropThumb(_loc2_).id.split(".")[0] == this.thumb.id)
         {
            this.removeHead();
            if(this._motionShadow != null)
            {
               this._motionShadow.removeHead();
            }
         }
         else if(!((_loc2_ as PropThumb).headable && this.thumb.isCC))
         {
            if(!this.isMotionShadow())
            {
               _loc4_ = new AddPropCommand();
               _loc4_.execute();
            }
            this.autoStateModify(_loc2_ as PropThumb,null,_loc3_);
         }
      }
      
      private function prepareAddPropAgain(param1:LoadMgrEvent) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Array = _loc2_.getExtraData() as Array;
         var _loc4_:Loader = _loc3_[0] as Loader;
         var _loc5_:PropThumb = _loc3_[1] as PropThumb;
         var _loc6_:State = _loc3_[2] as State;
         var _loc7_:String = _loc3_[3] as String;
         this.prepareAddProp(_loc5_,_loc6_,_loc7_);
      }
      
      private function prepareAddProp(param1:PropThumb, param2:State = null, param3:String = "") : void
      {
         var _loc4_:Array = null;
         var _loc5_:UtilLoadMgr = new UtilLoadMgr();
         _loc4_ = new Array();
         _loc4_.push(null);
         _loc4_.push(param1);
         _loc4_.push(param2);
         _loc4_.push(param3);
         _loc5_.setExtraData(_loc4_);
         if(param1.states.length == 0)
         {
            if((param1 as PropThumb).isThumbReady())
            {
               this.doCheckBeforeAddProp(param1,null,param3);
            }
            else
            {
               _loc5_.addEventDispatcher(param1,CoreEvent.LOAD_THUMB_COMPLETE);
               _loc5_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.prepareAddPropAgain);
               _loc5_.commit();
               param1.loadImageData();
            }
         }
         else
         {
            if(param2 == null)
            {
               param2 = (param1 as PropThumb).defaultState;
            }
            if((param1 as PropThumb).isStateReady(param2))
            {
               this.doCheckBeforeAddProp(param1,param2,param3);
            }
            else
            {
               _loc5_.addEventDispatcher(param1,CoreEvent.LOAD_STATE_COMPLETE);
               _loc5_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.prepareAddPropAgain);
               _loc5_.commit();
               param1.loadState(param2);
            }
         }
      }
      
      private function getAutoState(param1:Thumb, param2:Thumb, param3:String) : State
      {
         var _loc4_:State = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         if(UtilArray.hasMatchingElement((param1 as PropThumb).sysTags,(param2 as PropThumb).sysTags))
         {
            _loc5_ = 0;
            while(_loc5_ < (param2 as PropThumb).states.length)
            {
               _loc6_ = UtilXmlInfo.getSuffixFromStateIdByThumbId(param2.id,State((param2 as PropThumb).states[_loc5_]).id);
               if(_loc6_ == param3)
               {
                  _loc4_ = State((param2 as PropThumb).states[_loc5_]);
                  break;
               }
               _loc5_++;
            }
         }
         return _loc4_;
      }
      
      private function autoStateModify(param1:PropThumb, param2:State = null, param3:String = "") : void
      {
         var _loc6_:State = null;
         var _loc7_:String = null;
         var _loc4_:PropThumb = param1;
         var _loc5_:State = param2;
         if(this.prop != null && (this.prop.thumb as PropThumb).states.length > 0 && (param1 as PropThumb).states.length > 0)
         {
            _loc7_ = UtilXmlInfo.getSuffixFromStateIdByThumbId(this.prop.thumb.id,this.prop.state.id);
            if(this.prop.state != null && this.prop.state.id != "")
            {
               _loc6_ = this.getAutoState(Thumb(this.prop.thumb),param1,_loc7_);
            }
         }
         this.prepareAddProp(_loc4_,!!_loc6_?_loc6_:_loc5_,param3);
      }
      
      private function exchangeProp() : void
      {
      }
      
      private function doCheckBeforeAddProp(param1:Object, param2:State = null, param3:String = "") : void
      {
         var _loc7_:AnimeScene = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Character = null;
         var _loc11_:Object = null;
         var _loc12_:ConfirmPopUp = null;
         var _loc4_:Vector.<Character> = new Vector.<Character>();
         var _loc5_:int = Console.getConsole().scenes.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = Console.getConsole().getScene(_loc6_);
            _loc8_ = _loc7_.characters.length;
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc10_ = Character(_loc7_.characters.getValueByIndex(_loc9_));
               if(_loc10_.thumb.id == this.thumb.id)
               {
                  if(_loc10_.customColor.isIdentical(this.customColor))
                  {
                     _loc4_.push(_loc10_);
                  }
               }
               _loc9_++;
            }
            _loc6_++;
         }
         if(_loc4_.length > 1)
         {
            _loc11_ = {};
            _loc11_["charList"] = _loc4_;
            _loc11_["thumb"] = param1;
            _loc11_["state"] = param2;
            _loc11_["colorSetId"] = param3;
            _loc12_ = new ConfirmPopUp();
            _loc12_.message = UtilDict.toDisplay("go","goalert_foundsamechar");
            _loc12_.confirmText = UtilDict.toDisplay("go","goalert_addtoall");
            _loc12_.cancelText = UtilDict.toDisplay("go","goalert_thisoneonly");
            _loc12_.showCloseButton = false;
            _loc12_.data = _loc11_;
            _loc12_.addEventListener(PopUpEvent.CLOSE,this.onAddPropPopUpClose);
            _loc12_.open(getSceneEditor(),true);
         }
         else
         {
            this.addPropByThumb(param1,param2,param3);
         }
      }
      
      private function onAddPropPopUpClose(param1:PopUpEvent) : void
      {
         var _loc6_:Vector.<Character> = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Object = param1.data;
         var _loc3_:Object = _loc2_["thumb"];
         var _loc4_:State = _loc2_["state"];
         var _loc5_:String = _loc2_["colorSetId"];
         if(param1.commit)
         {
            _loc6_ = _loc2_["charList"];
            _loc7_ = _loc6_.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc6_[_loc8_].addPropByThumb(_loc3_,_loc4_,_loc5_);
               _loc8_++;
            }
         }
         else
         {
            this.addPropByThumb(_loc3_,_loc4_,_loc5_);
         }
      }
      
      public function updatePropState(param1:Thumb, param2:State) : void
      {
         this.addPropByThumb(param1,param2,"");
      }
      
      private function addPropByThumb(param1:Object, param2:State, param3:String = "") : void
      {
         var _loc5_:int = 0;
         var _loc6_:UtilHashSelectedColor = null;
         var _loc7_:PropThumb = null;
         if(this._motionShadow != null)
         {
            this._motionShadow.addPropByThumb(param1,param2,param3);
         }
         var _loc4_:Prop = new Prop();
         if(param1 is PropThumb)
         {
            _loc7_ = param1 as PropThumb;
            if(_loc7_.holdable == true)
            {
               _loc4_.init(_loc7_,this);
               if(param2 != null)
               {
                  _loc4_.state = param2;
               }
               else if(_loc7_.states.length > 0)
               {
                  _loc4_.state = _loc7_.defaultState;
               }
               if(param3 != "")
               {
                  _loc4_.defaultColorSetId = param3;
                  _loc4_.defaultColorSet = _loc7_.getColorSetById(param3);
                  _loc6_ = _loc4_.defaultColorSet;
                  _loc5_ = 0;
                  while(_loc5_ < _loc6_.length)
                  {
                     addCustomColor(_loc6_.getKey(_loc5_),_loc6_.getValueByIndex(_loc5_));
                     _loc5_++;
                  }
               }
               this.addPropDataAndClip(_loc4_);
               this.dispatchEvent(new CharacterAssetEvent(CharacterAssetEvent.HANDHELD_CHANGE,this));
            }
            else if(_loc7_.headable == true)
            {
               _loc4_ = new Prop();
               _loc4_.init(_loc7_,this);
               _loc4_.lookAtCamera = this.lookAtCamera;
               _loc4_.demoSpeech = this.demoSpeech;
               if(param2 != null)
               {
                  _loc4_.state = param2;
               }
               else if(_loc7_.states.length > 0)
               {
                  _loc4_.state = _loc7_.defaultState;
               }
               if(param3 != "")
               {
                  _loc4_.defaultColorSetId = param3;
                  _loc4_.defaultColorSet = _loc7_.getColorSetById(param3);
                  _loc6_ = _loc4_.defaultColorSet;
                  _loc5_ = 0;
                  while(_loc5_ < _loc6_.length)
                  {
                     addCustomColor(_loc6_.getKey(_loc5_),_loc6_.getValueByIndex(_loc5_));
                     _loc5_++;
                  }
               }
               this.addHeadDataAndClip(_loc4_);
               this.dispatchEvent(new CharacterAssetEvent(CharacterAssetEvent.FACIAL_CHANGE,this));
            }
            else if(_loc7_.wearable == true)
            {
               _loc4_ = new Prop();
               _loc4_.init(_loc7_,this);
               if(param2 != null)
               {
                  _loc4_.state = param2;
               }
               else if(_loc7_.states.length > 0)
               {
                  _loc4_.state = _loc7_.defaultState;
               }
               if(param3 != "")
               {
                  _loc4_.defaultColorSetId = param3;
                  _loc4_.defaultColorSet = _loc7_.getColorSetById(param3);
                  _loc6_ = _loc4_.defaultColorSet;
                  _loc5_ = 0;
                  while(_loc5_ < _loc6_.length)
                  {
                     addCustomColor(_loc6_.getKey(_loc5_),_loc6_.getValueByIndex(_loc5_));
                     _loc5_++;
                  }
               }
               this.addWearDataAndClip(_loc4_);
               this.dispatchEvent(new CharacterAssetEvent(CharacterAssetEvent.WEAR_CHANGE,this));
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.ACTION_CHANGE));
         }
      }
      
      function addHeadDataAndClip(param1:Prop) : void
      {
         if(this.head != null)
         {
            this.removeHead();
         }
         this.head = param1;
      }
      
      function addWearDataAndClip(param1:Prop) : void
      {
         if(this.wear != null)
         {
            this.removeWear();
         }
         this.wear = param1;
      }
      
      function addPropDataAndClip(param1:Prop) : void
      {
         if(this.prop != null)
         {
            this.removeProp();
         }
         this.prop = param1;
      }
      
      private function removeHead() : void
      {
         if(this.head == null)
         {
            return;
         }
         this.head = null;
         this.dispatchEvent(new CharacterAssetEvent(CharacterAssetEvent.FACIAL_CHANGE,this));
      }
      
      private function removeWear() : void
      {
         if(this.wear == null)
         {
            return;
         }
         this.wear = null;
      }
      
      public function removeProp() : void
      {
         if(this.prop == null)
         {
            return;
         }
         this.prop = null;
      }
      
      override public function cloneNext() : Asset
      {
         var _loc1_:Character = this.clone() as Character;
         if(this._motionShadow)
         {
            _loc1_.scaleX = this._motionShadow.scaleX;
            _loc1_.scaleY = this._motionShadow.scaleY;
            _loc1_.rotation = this._motionShadow.rotation;
            _loc1_.move(this._motionShadow.x,this._motionShadow.y);
            _loc1_.setReferencePoint(this._motionShadow.referenceX,this._motionShadow.referenceY);
            _loc1_.facing = this._motionShadow.facing;
            _loc1_.removeSlideMotion();
         }
         var _loc2_:Action = this.action as Action;
         if(_loc2_.isMotion)
         {
            _loc1_.setAction(!!_loc2_.nextActionId?_loc2_.nextActionId:_loc2_.defaultActionId,true);
         }
         if(this.scene.isCharacterTalkingWithLinkage(_loc1_))
         {
            _loc1_.restoreActionFromTalk();
         }
         _loc1_.updateColor();
         return _loc1_;
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc4_:Prop = null;
         var _loc3_:Character = new Character();
         _loc3_.id = this.id;
         _loc3_.scene = !!param2?param2:this.scene;
         _loc3_.thumb = this.thumb;
         _loc3_.customColor = this.customColor.clone();
         _loc3_.defaultColorSet = this.defaultColorSet.clone();
         _loc3_.move(this.x,this.y);
         _loc3_.width = this.width;
         _loc3_.height = this.height;
         _loc3_.facing = this.facing;
         _loc3_.scaleX = this.scaleX;
         _loc3_.scaleY = this.scaleY;
         _loc3_.rotation = this.rotation;
         _loc3_.actionId = this.actionId;
         _loc3_.action = this.action;
         _loc3_.motion = this.motion;
         _loc3_.lookAtCamera = this.lookAtCamera;
         if(this._imageLocalCenter)
         {
            _loc3_.imageLocalCenter = this._imageLocalCenter.clone();
         }
         _loc3_.setReferencePoint(this.referenceX,this.referenceY);
         if(this.actionSequence)
         {
            _loc3_.actionSequence = this.actionSequence.clone();
         }
         if(this.prop != null)
         {
            _loc4_ = new Prop();
            _loc4_.init(PropThumb(this.prop.thumb),_loc3_);
            _loc4_.state = this.prop.state;
            _loc3_.addPropDataAndClip(_loc4_);
         }
         else
         {
            _loc3_.prop = null;
         }
         _loc3_._loadCount = 0;
         if(this.head != null)
         {
            _loc4_ = new Prop();
            _loc4_.init(PropThumb(this.head.thumb),_loc3_);
            _loc4_.state = this.head.state;
            _loc3_._loadTotal++;
            _loc3_.addHeadDataAndClip(_loc4_);
            _loc4_.lookAtCamera = this.lookAtCamera;
         }
         else
         {
            _loc3_.head = null;
         }
         if(this.wear != null)
         {
            _loc4_ = new Prop();
            _loc4_.init(PropThumb(this.wear.thumb),_loc3_);
            _loc4_.state = this.wear.state;
            _loc3_._loadTotal++;
            _loc3_.addWearDataAndClip(_loc4_);
         }
         else
         {
            _loc3_.wear = null;
         }
         _loc3_.speechVoice = this.speechVoice;
         if(this._motionData)
         {
            _loc3_.motionData = this._motionData.clone();
         }
         if(this._motionShadow)
         {
            _loc3_.motionShadow = this._motionShadow.clone() as Character;
         }
         return _loc3_;
      }
      
      override public function unloadAssetImage(param1:Boolean) : void
      {
         super.unloadAssetImage(param1);
         if(this.prop)
         {
            this.prop.unloadAssetImage(param1);
         }
         if(this.head)
         {
            this.head.unloadAssetImage(param1);
         }
         if(this.wear)
         {
            this.wear.unloadAssetImage(param1);
         }
      }
      
      override protected function loadAssetImage() : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:PropThumb = null;
         var _loc9_:State = null;
         var _loc10_:UtilLoadMgr = null;
         var _loc11_:Array = null;
         var _loc12_:* = false;
         var _loc13_:PropThumb = null;
         var _loc14_:Theme = null;
         var _loc15_:XML = null;
         var _loc16_:XML = null;
         var _loc17_:String = null;
         var _loc18_:State = null;
         var _loc19_:String = null;
         var _loc20_:CharThumb = null;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         if(Action(this.action).propXML.length > 0)
         {
            _loc2_ = true;
            _loc3_ = Action(this.action).propXML[0];
         }
         else if(CharThumb(this.thumb).propXML.length > 0)
         {
            _loc2_ = true;
            _loc3_ = CharThumb(this.thumb).propXML[0];
         }
         if(_loc2_ && (this._byMenu || this._fromTray || this._byMovement || this._swapTarget))
         {
            _loc4_ = _loc3_.@theme.length() > 0?_loc3_.@theme:this.thumb.theme.id;
            _loc5_ = _loc4_ + "." + _loc3_.@id;
            _loc6_ = UtilXmlInfo.getThumbIdFromFileName(_loc5_);
            _loc7_ = _loc5_.split(".").length != 4?_loc6_:UtilXmlInfo.getCharIdFromFileName(_loc5_);
            _loc8_ = Theme(ThemeManager.instance.getTheme(_loc4_)).getPropThumbById(_loc7_) as PropThumb;
            if(!_loc8_)
            {
               _loc13_ = new PropThumb();
               _loc14_ = ThemeManager.instance.getTheme(_loc4_);
               _loc15_ = _loc14_.getThemeXML();
               for each(_loc16_ in _loc15_.child(PropThumb.XML_NODE_NAME))
               {
                  if(_loc16_.@aid == _loc3_.@aid)
                  {
                     _loc13_.deSerialize(_loc16_,_loc14_);
                     _loc13_.xml = _loc16_;
                  }
               }
               if(_loc6_ != _loc7_)
               {
                  _loc13_.thumbId = _loc6_;
               }
               Theme(this.thumb.theme).addThumb(_loc13_);
               _loc8_ = Theme(Thumb(this.thumb).theme).getPropThumbById(_loc7_) as PropThumb;
            }
            _loc12_ = this.prop != null;
            if(_loc8_)
            {
               if(_loc6_ != _loc7_)
               {
                  _loc9_ = _loc8_.getStateById(_loc6_);
               }
               if(_loc9_ != null)
               {
                  if(_loc12_)
                  {
                     _loc17_ = UtilXmlInfo.getSuffixFromStateIdByThumbId(_loc8_.id,_loc9_.id);
                     _loc18_ = this.getAutoState(_loc8_,this.prop.thumb as Thumb,_loc17_);
                     if(_loc18_)
                     {
                        this.doAddPropByState(null,PropThumb(this.prop.thumb),_loc18_);
                        _loc1_ = true;
                     }
                  }
                  else
                  {
                     this.doAddPropByState(null,_loc8_,_loc9_);
                     _loc1_ = true;
                  }
               }
               else if(!_loc12_)
               {
                  if(_loc8_.isThumbReady())
                  {
                     this.addPropByThumb(_loc8_,_loc9_);
                  }
                  else
                  {
                     _loc10_ = new UtilLoadMgr();
                     _loc11_ = new Array();
                     _loc11_.push(null);
                     _loc11_.push(_loc8_);
                     _loc10_.setExtraData(_loc11_);
                     _loc10_.addEventDispatcher(_loc8_,CoreEvent.LOAD_THUMB_COMPLETE);
                     _loc10_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.feedActionPropAgain);
                     _loc10_.commit();
                     _loc8_.loadImageData();
                  }
                  _loc1_ = true;
               }
            }
         }
         this._byMovement = false;
         this._byMenu = false;
         if(this.prop != null && !_loc1_)
         {
            this.addPropByThumb(this.prop.thumb,this.prop.state);
         }
         if(CharThumb(this.thumb).mThumbId)
         {
            _loc19_ = CharThumb(this.thumb).mThumbId;
            _loc20_ = Theme(CharThumb(this.thumb).theme).getCharThumbById(_loc19_);
            if(_loc20_ && _loc20_.path)
            {
               CharThumb(this.thumb).propXML = new Vector.<XML>();
            }
         }
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,this));
      }
      
      private function doAddPropByState(param1:Loader, param2:PropThumb, param3:State) : void
      {
         var _loc4_:Array = null;
         var _loc5_:UtilLoadMgr = null;
         if(param2.isStateReady(param3))
         {
            this.addPropByThumb(param2,param3);
         }
         else
         {
            _loc5_ = new UtilLoadMgr();
            _loc4_ = new Array();
            _loc4_.push(param1);
            _loc4_.push(param2);
            _loc4_.push(param3);
            _loc5_.setExtraData(_loc4_);
            _loc5_.addEventDispatcher(param2,CoreEvent.LOAD_STATE_COMPLETE);
            _loc5_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.feedActionPropAgain);
            _loc5_.commit();
            param2.loadState(param3);
         }
      }
      
      private function feedActionPropAgain(param1:LoadMgrEvent) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Array = _loc2_.getExtraData() as Array;
         var _loc4_:Loader = _loc3_[0] as Loader;
         var _loc5_:PropThumb = _loc3_[1] as PropThumb;
         var _loc6_:State = _loc3_[2] as State;
         this.addPropByThumb(_loc5_,_loc6_);
      }
      
      public function dropDefaultActionProp() : void
      {
         var _loc1_:XML = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:PropThumb = null;
         if(this.action != null)
         {
            if(Action(this.action).propXML.length > 0)
            {
               _loc1_ = Action(this.action).propXML[0];
               _loc2_ = _loc1_.@theme.length() > 0?_loc1_.@theme:this.thumb.theme.id;
               _loc3_ = _loc2_ + "." + Action(this.action).propXML[0].@id;
               _loc4_ = UtilXmlInfo.getThumbIdFromFileName(_loc3_);
               _loc5_ = _loc3_.split(".").length != 4?_loc4_:UtilXmlInfo.getCharIdFromFileName(_loc3_);
               _loc6_ = ThemeManager.instance.getTheme(_loc2_).getPropThumbById(_loc5_) as PropThumb;
               if(this.prop != null && _loc6_ == this.prop.thumb)
               {
                  if(this.prop.stateId == null || _loc4_ == this.prop.stateId)
                  {
                     this.removeProp();
                  }
               }
               else if(this.head != null && _loc6_ == this.head.thumb)
               {
                  if(this.head.stateId == null || _loc4_ == this.head.stateId)
                  {
                     this.removeHead();
                  }
               }
               else if(this.wear != null && _loc6_ == this.wear.thumb)
               {
                  if(this.wear.stateId == null || _loc4_ == this.wear.stateId)
                  {
                     this.removeWear();
                  }
               }
            }
         }
      }
      
      public function isMotionShadow() : Boolean
      {
         return this._isShadow;
      }
      
      public function get isShadow() : Boolean
      {
         return this._isShadow;
      }
      
      public function set isShadow(param1:Boolean) : void
      {
         this._isShadow = param1;
      }
      
      override public function doChangeColor(param1:String, param2:uint = 4.294967295E9) : Number
      {
         var _loc3_:Number = super.doChangeColor(param1,param2);
         if(this.motionShadow)
         {
            this.motionShadow.doChangeColor(param1,param2);
         }
         return _loc3_;
      }
      
      public function flipIt() : void
      {
         this.facing = this.facing == AnimeConstants.FACING_LEFT?AnimeConstants.FACING_RIGHT:AnimeConstants.FACING_LEFT;
         if(this._motionShadow)
         {
            this._motionShadow.facing = this._motionShadow.facing == AnimeConstants.FACING_LEFT?AnimeConstants.FACING_RIGHT:AnimeConstants.FACING_LEFT;
            this.motionDirection = this.motionDirection == AnimeConstants.MOTION_BACKWARD?AnimeConstants.MOTION_FORWARD:AnimeConstants.MOTION_BACKWARD;
         }
      }
      
      public function onPropChange() : void
      {
         this.dispatchEvent(new CharacterAssetEvent(CharacterAssetEvent.FACIAL_CHANGE,this));
         this.dispatchEvent(new CharacterAssetEvent(CharacterAssetEvent.HANDHELD_CHANGE,this));
      }
      
      public function get facialId() : String
      {
         if(this.head)
         {
            return this.head.stateId;
         }
         return AUTO_FACIAL_EXPRESSION;
      }
      
      public function changeFacialById(param1:String) : void
      {
         if(param1 == AUTO_FACIAL_EXPRESSION)
         {
            this.removeHead();
         }
         else
         {
            this.changeHeadByStateId(param1);
         }
         dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE));
      }
      
      private function addTalkHeadForSpeech() : void
      {
         var _loc1_:PropThumb = null;
         if(this.head == null && this.thumb.raceCode == RaceConstants.STATIC_SWF)
         {
            if(Console.getConsole().linkageController.getSpeechIdOfAsset(this) != "")
            {
               if(this.action != null && Action(this.action).isTalkRelated())
               {
                  _loc1_ = this.getHeadPropThumb();
                  if(_loc1_ != null && _loc1_.defaultTalkState != null)
                  {
                     this.doAddPropByState(null,_loc1_,_loc1_.defaultTalkState);
                  }
               }
            }
         }
      }
      
      public function getHeadPropThumb() : PropThumb
      {
         return CharThumb(this.thumb).getHeadPropThumb();
      }
      
      private function changeHeadByStateId(param1:String) : void
      {
         var _loc3_:State = null;
         var _loc2_:PropThumb = this.getHeadPropThumb();
         if(_loc2_)
         {
            if(_loc2_.getStateNum() > 0)
            {
               _loc3_ = _loc2_.getStateById(param1);
            }
            if(_loc3_)
            {
               this.changeHeadByState(_loc3_);
            }
         }
      }
      
      private function changeHeadByState(param1:State) : void
      {
         var doAddFacialAgain:Function = null;
         var extraData:Object = null;
         var loadMgr:UtilLoadMgr = null;
         var state:State = param1;
         var propThumb:PropThumb = this.getHeadPropThumb();
         if(state.imageData != null)
         {
            this.addPropByThumb(propThumb,state);
         }
         else
         {
            doAddFacialAgain = function(param1:LoadMgrEvent):void
            {
               var _loc3_:Thumb = null;
               var _loc4_:State = null;
               var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
               var _loc5_:Object = _loc2_.getExtraData();
               _loc3_ = _loc5_["thumb"];
               _loc4_ = _loc5_["state"];
               addPropByThumb(_loc3_,_loc4_);
            };
            extraData = new Object();
            extraData["thumb"] = propThumb;
            extraData["state"] = state;
            loadMgr = new UtilLoadMgr();
            loadMgr.setExtraData(extraData);
            loadMgr.addEventListener(LoadMgrEvent.ALL_COMPLETE,doAddFacialAgain);
            loadMgr.addEventDispatcher(propThumb,CoreEvent.LOAD_STATE_COMPLETE);
            propThumb.loadState(state);
            loadMgr.commit();
         }
      }
      
      public function removeHandHeld() : void
      {
         var _loc1_:ICommand = null;
         if(this.prop)
         {
            _loc1_ = new RemovePropCommand();
            _loc1_.execute();
            this.removeProp();
            if(this._motionShadow != null)
            {
               this._motionShadow.removeProp();
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE));
            this.dispatchEvent(new CharacterAssetEvent(CharacterAssetEvent.HANDHELD_CHANGE,this));
         }
      }
      
      public function removeHeadGear() : void
      {
         var _loc1_:ICommand = new RemovePropCommand();
         _loc1_.execute();
         this.removeWear();
         if(this._motionShadow != null)
         {
            this._motionShadow.removeWear();
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE));
         this.dispatchEvent(new CharacterAssetEvent(CharacterAssetEvent.WEAR_CHANGE,this));
      }
      
      public function restoreHead() : void
      {
         var _loc1_:ICommand = new RemovePropCommand();
         _loc1_.execute();
         this.removeHead();
         if(this._motionShadow != null)
         {
            this._motionShadow.removeHead();
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE));
      }
      
      public function removeSlideMotion() : void
      {
         this.motionData = null;
      }
      
      public function setAction(param1:String, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:CharThumb = CharThumb(this.thumb);
         var _loc5_:Action = _loc4_.getActionById(param1);
         if(_loc5_ && this.imageData != null && this.imageData != _loc5_.imageData)
         {
            this._byMovement = param2;
            this._byMenu = param3;
            this.changeAction(_loc5_);
         }
      }
      
      private function changeAction(param1:Action) : void
      {
         var _loc3_:UtilLoadMgr = null;
         var _loc4_:Array = null;
         if(param1 is ISequentialAction)
         {
            this.actionSequence = ISequentialAction(param1).actionSequence.clone();
            this.actionSequence.randomize();
         }
         else
         {
            this.actionSequence = null;
         }
         this.dropDefaultActionProp();
         if(this._motionShadow)
         {
            this._motionShadow.dropDefaultActionProp();
         }
         var _loc2_:CharThumb = CharThumb(this.thumb);
         if(param1.imageData != null)
         {
            this.updateAction(param1);
         }
         else
         {
            _loc3_ = new UtilLoadMgr();
            _loc4_ = new Array();
            _loc4_.push(param1);
            _loc3_.setExtraData(_loc4_);
            _loc3_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.updateActionAgain);
            if(_loc2_.theme.id == "ugc" && _loc2_.isSWFCharacter())
            {
               _loc3_.addEventDispatcher(_loc2_,CoreEvent.LOAD_THUMB_COMPLETE);
               _loc2_.loadActionsAndMotions();
            }
            else
            {
               _loc3_.addEventDispatcher(_loc2_,CoreEvent.LOAD_STATE_COMPLETE);
               _loc2_.loadAction(param1);
            }
            _loc3_.commit();
         }
      }
      
      public function changeActionAsTalk() : Boolean
      {
         var _loc2_:PropThumb = null;
         var _loc1_:Boolean = false;
         if(this.action == CharThumb(this.thumb).defaultAction && this.hasTalkAction())
         {
            this.changeAction(CharThumb(this.thumb).defaultTalkAction);
            _loc1_ = true;
         }
         else if(this.head == null && this.hasTalkFacial())
         {
            _loc2_ = Theme(Thumb(this.thumb).theme).getPropThumbById(this.thumb.id + ".head") as PropThumb;
            this.changeHeadByState(_loc2_.defaultTalkState);
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function reloadAssetImage() : void
      {
         this.loadAssetImage();
         if(this.head)
         {
            this.head.reloadAssetImage();
         }
      }
      
      public function restoreActionFromTalk() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.action == CharThumb(this.thumb).defaultTalkAction)
         {
            this.changeAction(Action(CharThumb(this.thumb).defaultAction));
            _loc1_ = true;
         }
         if(this.head != null && this.head.state.isTalkRelated())
         {
            this.removeHead();
            _loc1_ = true;
         }
         if(!_loc1_)
         {
            if(this.demoSpeech)
            {
               this.demoSpeech = false;
               _loc1_ = true;
               this.loadAssetImage();
               if(this.head)
               {
                  this.head.reloadAssetImage();
               }
            }
         }
         return _loc1_;
      }
      
      public function hasTalkAction() : Boolean
      {
         return CharThumb(this.thumb).defaultTalkAction != null;
      }
      
      public function hasTalkFacial() : Boolean
      {
         var _loc1_:PropThumb = Theme(Thumb(this.thumb).theme).getPropThumbById(this.thumb.id + ".head") as PropThumb;
         if(_loc1_ != null)
         {
            return _loc1_.defaultTalkState != null;
         }
         return false;
      }
      
      public function isInDefaultTalkAction() : Boolean
      {
         return this.action == CharThumb(this.thumb).defaultTalkAction;
      }
      
      public function isInDefaultTalkFacial() : Boolean
      {
         var _loc1_:PropThumb = null;
         if(this.head != null)
         {
            _loc1_ = Theme(Thumb(this.thumb).theme).getPropThumbById(this.thumb.id + ".head") as PropThumb;
            if(_loc1_)
            {
               return this.head.state == _loc1_.defaultTalkState;
            }
         }
         return false;
      }
      
      private function updateActionAgain(param1:LoadMgrEvent) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Array = _loc2_.getExtraData() as Array;
         var _loc4_:Action = _loc3_[0] as Action;
         this.updateAction(CharThumb(this.thumb).getActionById(_loc4_.id));
      }
      
      public function updateAction(param1:Action) : void
      {
         this.action = param1;
         if(this._motionShadow)
         {
            this._motionShadow.updateAction(param1);
         }
         if(!this.isShadow)
         {
            this.updateTimelineMotion();
         }
         this.dispatchEvent(new AssetEvent(AssetEvent.ACTION_CHANGE,this));
         this.updateTransitionsCharacterActionName();
      }
      
      public function updateTransitionsCharacterActionName() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:AssetTransition = null;
         var _loc4_:int = 0;
         if(this.scene && this.scene.assetTransitions)
         {
            _loc1_ = AssetTransitionHelper.getTransitions(this.id,this.scene.assetTransitions);
            if(_loc1_)
            {
               _loc2_ = _loc1_.length;
               while(_loc4_ < _loc2_)
               {
                  _loc3_ = _loc1_[_loc4_] as AssetTransition;
                  if(_loc3_)
                  {
                     _loc3_.characterActionName = !!this.action?this.action.name:null;
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      public function startSlideMotion() : void
      {
         var _loc1_:MotionData = null;
         var _loc2_:int = 0;
         if(!this._motionData)
         {
            if(this.motionDirection == "")
            {
               this.motionDirection = AnimeConstants.MOTION_FORWARD;
            }
            _loc1_ = new MotionData();
            _loc1_.moveStartPoint(this.x,this.y);
            _loc1_.moveEndPoint(this.x,this.y);
            _loc1_.startRotation = this.rotation;
            _loc2_ = this.facing == AnimeConstants.FACING_LEFT?-100:100;
            _loc1_.endX = _loc1_.endX + _loc2_;
            this.motionData = _loc1_;
            this.updateFacing();
         }
      }
      
      private function onMotionChange(param1:Event) : void
      {
         if(this._motionData && this._motionShadow)
         {
            if(this._motionData.pathOriented)
            {
               this._motionShadow.isRotatable = false;
               this._motionShadow.rotation = this._motionData.endRotation;
               this._motionShadow.facing = this.facing;
            }
            else
            {
               this.updateFacing();
               this._motionShadow.isRotatable = true;
            }
         }
      }
      
      public function set motionData(param1:MotionData) : void
      {
         if(param1 != this._motionData)
         {
            this.motionShadow = null;
            if(this._motionData)
            {
               this._motionData.removeEventListener(Event.CHANGE,this.onMotionChange);
               this._motionData = null;
            }
            if(param1)
            {
               this.motionDirection = !param1.assetFace || param1.motionFace == param1.assetFace?AnimeConstants.MOTION_FORWARD:AnimeConstants.MOTION_BACKWARD;
               this.addMotionShadow();
               this._motionData = param1.clone();
               this._motionData.addEventListener(Event.CHANGE,this.onMotionChange);
               if(this._motionShadow)
               {
                  this._motionShadow.move(this._motionData.endX,this._motionData.endY);
                  this._motionShadow.setReferencePoint(this._motionData.endX,this._motionData.endY);
                  if(this._motionData.pathOriented)
                  {
                     this._motionShadow.isRotatable = false;
                     this._motionShadow.rotation = this._motionData.endRotation;
                     this._motionShadow.facing = this.facing;
                  }
                  else
                  {
                     this._motionShadow.isRotatable = true;
                  }
               }
               this.updateFacing();
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get motionData() : MotionData
      {
         return this._motionData;
      }
      
      override public function set x(param1:Number) : void
      {
         if(param1 != this.x)
         {
            super.x = param1;
            if(this._motionData)
            {
               this._motionData.startX = this.x;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function set y(param1:Number) : void
      {
         if(param1 != this.y)
         {
            super.y = param1;
            if(this._motionData)
            {
               this._motionData.startY = this.y;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         if(param1 != this.x || param2 != this.y)
         {
            super.move(param1,param2);
            if(this._motionData)
            {
               this._motionData.moveStartPoint(this.x,this.y);
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get isSliding() : Boolean
      {
         return this._motionData != null;
      }
      
      public function get slideEnabled() : Boolean
      {
         return true;
      }
      
      private function addMotionShadow() : void
      {
         var _loc1_:Character = null;
         if(!this.isMotionShadow())
         {
            if(this._motionShadow == null)
            {
               _loc1_ = this.clone() as Character;
               _loc1_.fromTray = false;
               _loc1_.isShadow = true;
               _loc1_.removeSlideMotion();
               this.motionShadow = _loc1_;
            }
            this.updateFacing();
         }
      }
      
      private function onShadowMoved(param1:Event) : void
      {
         if(this._motionShadow && this._motionData)
         {
            this._motionData.moveEndPoint(this._motionShadow.x,this._motionShadow.y);
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      private function updateTimelineMotion() : void
      {
         scene.doUpdateTimelineLength(-1,true);
      }
      
      override public function isColorable() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:Array = new Array();
         if(this.thumb.raceCode > 0)
         {
            _loc2_ = AssetColor.removeCCUsedColor(_loc2_);
         }
         else if(this.thumb.colorParts.length > 0)
         {
            _loc1_ = true;
         }
         if(_loc2_.length > 0)
         {
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      override public function restoreColor() : void
      {
         super.restoreColor();
         if(this._motionShadow)
         {
            this._motionShadow.restoreColor();
         }
         if(this.prop)
         {
            this.prop.restoreColor();
         }
         if(this.wear)
         {
            this.wear.restoreColor();
         }
         if(this.head)
         {
            this.head.restoreColor();
         }
      }
      
      public function set isRotatable(param1:Boolean) : void
      {
         if(this._rotation.enabled != param1)
         {
            this._rotation.enabled = param1;
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
         }
      }
      
      public function get isRotatable() : Boolean
      {
         return this._rotation.enabled;
      }
      
      public function get rotation() : Number
      {
         return this._rotation.rotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         if(param1 != this.rotation)
         {
            this._rotation.rotation = param1;
            if(this._motionData)
            {
               this._motionData.startRotation = this.rotation;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_ROTATED,this));
         }
      }
      
      public function set imageLocalCenter(param1:Point) : void
      {
         var _loc2_:Matrix = null;
         var _loc3_:Point = null;
         if(!this._imageLocalCenter && param1)
         {
            _loc2_ = new Matrix();
            _loc2_.scale(this.scaleX,this.scaleY);
            if(this.isFlipped)
            {
               _loc2_.scale(-1,1);
            }
            _loc2_.rotate(this.rotation * Math.PI / 180);
            _loc2_.translate(this.x,this.y);
            _loc3_ = _loc2_.transformPoint(param1);
            this.setReferencePoint(_loc3_.x,_loc3_.y);
         }
         this._imageLocalCenter = param1;
      }
      
      public function swapWithThumb(param1:CharThumb, param2:String = null, param3:String = null) : void
      {
         var _loc4_:Vector.<XML> = null;
         if(param1)
         {
            dispatchEvent(new AssetEvent(AssetEvent.CHARACTER_SWAP_START,this));
            if(param2)
            {
               this._actionIdToSwap = param2;
            }
            else
            {
               this._actionIdToSwap = this._actionId;
            }
            if(param3)
            {
               this._facialIdToSwap = param3;
            }
            else
            {
               this._facialIdToSwap = this.facialId;
            }
            if(param1.path)
            {
               this._swapTarget = param1.theme.getCharThumbById(param1.path);
               this._swapTarget.mThumbId = param1.id;
               _loc4_ = new Vector.<XML>();
               if(param1.propXML.length > 0)
               {
                  _loc4_ = param1.propXML.concat();
               }
               this._swapTarget.propXML = _loc4_;
            }
            else
            {
               this._swapTarget = param1;
            }
            if(this._swapTarget.isThumbReady(this._actionIdToSwap))
            {
               this.swapWithThumbImpl();
            }
            else
            {
               this._swapTarget.addEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onSwapThumbReady);
               this._swapTarget.loadActionById(this._actionIdToSwap);
            }
         }
      }
      
      private function onSwapThumbReady(param1:Event) : void
      {
         this._swapTarget.removeEventListener(CoreEvent.LOAD_STATE_COMPLETE,this.onSwapThumbReady);
         this.swapWithThumbImpl();
      }
      
      private function swapWithThumbImpl() : void
      {
         this._imageLocalCenter = null;
         _thumb = this._swapTarget;
         this.head = null;
         if(this._motionShadow)
         {
            this._motionShadow._thumb = this._swapTarget;
         }
         this.mThumbId = this._swapTarget.mThumbId;
         this.changeAction(this._swapTarget.getActionByIdWithDefault(this._actionIdToSwap));
         this.changeFacialById(this._facialIdToSwap);
         this._swapTarget = null;
         this._actionIdToSwap = null;
         dispatchEvent(new AssetEvent(AssetEvent.ACTION_CHANGE,this));
         dispatchEvent(new AssetEvent(AssetEvent.CHARACTER_SWAP_COMPLETE,this));
      }
   }
}
