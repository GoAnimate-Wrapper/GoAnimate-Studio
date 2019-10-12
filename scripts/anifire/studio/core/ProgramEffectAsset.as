package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.LicenseConstants;
   import anifire.effect.EffectMgr;
   import anifire.effect.ZoomEffect;
   import anifire.errors.SerializeError;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IMotion;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IResizable;
   import anifire.studio.interfaces.ISlidable;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.Util;
   import anifire.util.UtilMath;
   import flash.events.Event;
   
   public class ProgramEffectAsset extends EffectAsset implements IMovable, IResizable, ISlidable, IMotion
   {
       
      
      private var _needControl:Boolean = false;
      
      private var ubound_y:Number;
      
      private var lbound_y:Number;
      
      private var _guide_style:int = 0;
      
      private var _motionShadow:ProgramEffectAsset;
      
      private var _fromSpeech:Boolean = false;
      
      private var _motionData:MotionData;
      
      private var _isShadow:Boolean = false;
      
      public function ProgramEffectAsset(param1:String = "")
      {
         super(param1);
         this.ubound_y = AnimeConstants.SCREEN_Y;
         this.lbound_y = AnimeConstants.SCREEN_Y + AnimeConstants.SCREEN_HEIGHT;
         if(LicenseConstants.isWideScreen())
         {
            this.ubound_y = 35;
            this.lbound_y = 190 + 177;
         }
      }
      
      public function get guide_style() : int
      {
         return this._guide_style;
      }
      
      public function set guide_style(param1:int) : void
      {
         if(this._guide_style != param1)
         {
            this._guide_style = param1;
            if(this.motionShadow)
            {
               ProgramEffectAsset(this.motionShadow).guide_style = param1;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.CAMERA_GUIDE_CHANGED));
         }
      }
      
      public function get needControl() : Boolean
      {
         return this._needControl;
      }
      
      public function set needControl(param1:Boolean) : void
      {
         this._needControl = param1;
      }
      
      override public function get minWidth() : Number
      {
         return 32;
      }
      
      override public function get minHeight() : Number
      {
         return 20;
      }
      
      override public function get maxWidth() : Number
      {
         return AnimeConstants.SCREEN_WIDTH;
      }
      
      override public function get maxHeight() : Number
      {
         return AnimeConstants.SCREEN_HEIGHT;
      }
      
      override public function set x(param1:Number) : void
      {
         if(param1 != this.x)
         {
            param1 = UtilMath.boundaryCheck(param1,AnimeConstants.SCREEN_X,AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH - this.width);
            super.x = param1;
            if(this._motionData)
            {
               this._motionData.startX = this.x + this.width / 2;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function set y(param1:Number) : void
      {
         if(param1 != this.y)
         {
            if(LicenseConstants.isWideScreen())
            {
               param1 = UtilMath.boundaryCheck(param1,AnimeConstants.WIDE_SCREEN_Y,AnimeConstants.WIDE_SCREEN_Y + AnimeConstants.WIDE_SCREEN_HEIGHT - this.height);
            }
            else
            {
               param1 = UtilMath.boundaryCheck(param1,AnimeConstants.SCREEN_Y,AnimeConstants.SCREEN_Y + AnimeConstants.SCREEN_HEIGHT - this.height);
            }
            super.y = param1;
            if(this._motionData)
            {
               this._motionData.startY = this.y + this.height / 2;
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         if(param1 != this.x || param2 != this.y)
         {
            param1 = UtilMath.boundaryCheck(param1,AnimeConstants.SCREEN_X,AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH - this.width);
            if(LicenseConstants.isWideScreen())
            {
               param2 = UtilMath.boundaryCheck(param2,AnimeConstants.WIDE_SCREEN_Y,AnimeConstants.WIDE_SCREEN_Y + AnimeConstants.WIDE_SCREEN_HEIGHT - this.height);
            }
            else
            {
               param2 = UtilMath.boundaryCheck(param2,AnimeConstants.SCREEN_Y,AnimeConstants.SCREEN_Y + AnimeConstants.SCREEN_HEIGHT - this.height);
            }
            super.move(param1,param2);
            if(this._motionData)
            {
               this._motionData.moveStartPoint(this.x + this.width / 2,this.y + this.height / 2);
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function convertToXml() : XML
      {
         var index:uint = 0;
         var xml:XML = new XML("<" + XML_NODE_NAME + "/>");
         try
         {
            if(this.effect.type == EffectMgr.TYPE_ZOOM)
            {
               index = this.scene.getOverallOrderingLength() + 1;
            }
            else
            {
               index = this.scene.getOverallOrdering(this);
            }
            xml.@id = id;
            xml.@themecode = this.thumb.theme.id;
            xml.@index = index;
            xml.appendChild(this.effect.serialize());
            xml.x = this.serializeMotion("x",this.motionShadow);
            xml.y = this.serializeMotion("y",this.motionShadow);
            xml.width = this.serializeMotion("width",this.motionShadow);
            xml.height = this.serializeMotion("height",this.motionShadow);
            xml.speech = !!fromSpeech?"1":"0";
            if(!this.spanWholeScene)
            {
               if(this.startFrame <= this.scene.totalFrames && this.endFrame <= this.scene.totalFrames)
               {
                  if(this.isCamera)
                  {
                     if(this.motionShadow)
                     {
                        xml.st = this.startFrame;
                        xml.et = this.endFrame;
                        xml.st.@dur = this.startDuration;
                        xml.et.@dur = this.endDuration;
                     }
                  }
                  else
                  {
                     xml.st = this.startFrame;
                     xml.et = this.endFrame;
                  }
               }
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize program effect asset: " + this.id);
         }
         return xml;
      }
      
      override public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function serializeMotion(param1:String, param2:EffectAsset) : Array
      {
         var tempArray:Array = null;
         var oRatio:Number = NaN;
         var oheight:Number = NaN;
         var oy:Number = NaN;
         var soheight:Number = NaN;
         var soy:Number = NaN;
         var property:String = param1;
         var shadow:EffectAsset = param2;
         try
         {
            tempArray = new Array();
            oRatio = AnimeConstants.SCREEN_WIDTH / AnimeConstants.SCREEN_HEIGHT;
            oheight = this.width / oRatio;
            oy = this.y - (oheight - this.height) / 2;
            switch(property)
            {
               case "x":
                  tempArray.push(Util.roundNum(this.x));
                  break;
               case "y":
                  tempArray.push(Util.roundNum(oy));
                  break;
               case "width":
                  tempArray.push(Util.roundNum(this.width));
                  break;
               case "height":
                  tempArray.push(Util.roundNum(oheight));
            }
            if(shadow != null)
            {
               soheight = shadow.width / oRatio;
               soy = shadow.y - (soheight - shadow.height) / 2;
               switch(property)
               {
                  case "x":
                     tempArray.push(Util.roundNum(shadow.x));
                     break;
                  case "y":
                     tempArray.push(Util.roundNum(soy));
                     break;
                  case "width":
                     tempArray.push(Util.roundNum(shadow.width));
                     break;
                  case "height":
                     tempArray.push(Util.roundNum(soheight));
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize program effect motion " + this.id,tempArray.toString(),e);
         }
         return tempArray;
      }
      
      override public function deSerialize(param1:XML, param2:AnimeScene, param3:Boolean = true, param4:Boolean = true) : void
      {
         var _loc8_:Array = null;
         var _loc10_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         this._myEffectXML = param1.child(EffectMgr.XML_NODE_TAG)[0];
         var _loc5_:String = EffectAsset.getThemeIdFromAssetXml(param1);
         var _loc6_:EffectThumb = ThemeManager.instance.getTheme(_loc5_).getEffectThumbById(EffectMgr.getId(this._myEffectXML));
         this.scene = param2;
         if(param3)
         {
            this.id = param1.@id;
         }
         var _loc7_:Array = String(param1.x).split(",");
         var _loc9_:Array = String(param1.width).split(",");
         var _loc11_:Array = new Array();
         var _loc12_:Array = new Array();
         _loc11_ = String(param1.y).split(",");
         _loc12_ = String(param1.height).split(",");
         if(LicenseConstants.isWideScreen())
         {
            _loc8_ = new Array();
            _loc10_ = new Array();
            _loc13_ = 0;
            while(_loc13_ < _loc9_.length)
            {
               _loc10_[_loc13_] = Number(_loc9_[_loc13_]) / LicenseConstants.getScreenRatio();
               _loc14_ = Number(_loc12_[_loc13_]) - Number(_loc10_[_loc13_]);
               _loc8_[_loc13_] = Number(_loc11_[_loc13_]) + _loc14_ / 2;
               _loc13_++;
            }
         }
         else
         {
            _loc8_ = _loc11_.concat();
            _loc10_ = _loc12_.concat();
         }
         this.fromSpeech = String(param1.speech) == "1"?true:false;
         this.spanWholeScene = true;
         if(param1.child("st").length() > 0 && param1.child("st").length() > 0)
         {
            this.startFrame = int(param1.st);
            this.endFrame = int(param1.et);
            if(_loc6_.getExactType() == "zoom" && param1.st.@dur > -1 && param1.et.@dur > -1)
            {
               this.startDuration = int(param1.st.@dur);
               this.endDuration = int(param1.et.@dur);
            }
            this.spanWholeScene = false;
         }
         if(param4)
         {
            this.thumb = _loc6_;
         }
         else
         {
            super.thumb = _loc6_;
         }
         this.isLoadded = true;
         this.width = _loc9_[0];
         this.height = _loc10_[0];
         this.x = _loc7_[0];
         this.y = _loc8_[0];
         this.deserialMotion(_loc7_,_loc8_,_loc9_,_loc10_);
      }
      
      private function deserialMotion(param1:Array, param2:Array, param3:Array, param4:Array) : void
      {
         var _loc5_:MotionData = null;
         if(param1 && param1.length > 1)
         {
            _loc5_ = new MotionData();
            _loc5_.moveStartPoint(this.x + this.width / 2,this.y + this.height / 2);
            this.motionData = _loc5_;
            if(this._motionShadow)
            {
               if(param3 && param3.length > 1 && param4 && param4.length > 1)
               {
                  this._motionShadow.resize(param3[param3.length - 1],param4[param4.length - 1]);
               }
               this._motionShadow.move(param1[param1.length - 1],param2[param2.length - 1]);
            }
         }
      }
      
      override public function cloneNext() : Asset
      {
         var _loc1_:ProgramEffectAsset = this.clone() as ProgramEffectAsset;
         if(_loc1_.motionShadow)
         {
            _loc1_.width = _loc1_.motionShadow.width;
            _loc1_.height = _loc1_.motionShadow.height;
            _loc1_.x = _loc1_.motionShadow.x;
            _loc1_.y = _loc1_.motionShadow.y;
         }
         if(_loc1_.effect is ZoomEffect && Console.getConsole().metaData.mver > 3)
         {
            ZoomEffect(_loc1_.effect).isPan = false;
            _loc1_.startFrame = 1;
            _loc1_.startDuration = _loc1_.scene.totalFrames;
            _loc1_.endFrame = _loc1_.scene.totalFrames;
            _loc1_.endDuration = 0;
            _loc1_.spanWholeScene = true;
            _loc1_.removeSlideMotion();
         }
         return _loc1_;
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc3_:ProgramEffectAsset = new ProgramEffectAsset();
         _loc3_.id = this.id;
         _loc3_.effect = this.effect;
         _loc3_.width = this.width;
         _loc3_.height = this.height;
         _loc3_.x = this.x;
         _loc3_.y = this.y;
         _loc3_.startFrame = this.startFrame;
         _loc3_.endFrame = this.endFrame;
         _loc3_.startDuration = this.startDuration;
         _loc3_.endDuration = this.endDuration;
         _loc3_.spanWholeScene = this.spanWholeScene;
         _loc3_.guide_style = this.guide_style;
         if(_loc3_._myEffectXML == null)
         {
            _loc3_._myEffectXML = this.effect.serialize();
         }
         _loc3_._myEffectXML.@w = this.effect.width;
         _loc3_._myEffectXML.@h = this.effect.height;
         _loc3_.scene = this.scene;
         _loc3_.thumb = this.thumb;
         if(this._motionData)
         {
            _loc3_.motionData = this._motionData.clone();
         }
         if(this._motionShadow)
         {
            _loc3_.motionShadow = this._motionShadow.clone() as ProgramEffectAsset;
         }
         return _loc3_;
      }
      
      public function get motionData() : MotionData
      {
         return this._motionData;
      }
      
      private function onShadowMoved(param1:Event) : void
      {
         if(this._motionShadow && this._motionData)
         {
            this._motionData.moveEndPoint(this._motionShadow.x + this._motionShadow.width / 2,this._motionShadow.y + this._motionShadow.height / 2);
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get motionShadow() : ProgramEffectAsset
      {
         return this._motionShadow;
      }
      
      public function set motionShadow(param1:ProgramEffectAsset) : void
      {
         if(this._motionShadow)
         {
            this._motionShadow.removeEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
            this._motionShadow.removeEventListener(AssetEvent.ASSET_RESIZED,this.onShadowMoved);
         }
         this._motionShadow = param1;
         if(this._motionShadow)
         {
            this._motionShadow.addEventListener(AssetEvent.ASSET_MOVED,this.onShadowMoved);
            this._motionShadow.addEventListener(AssetEvent.ASSET_RESIZED,this.onShadowMoved);
         }
         if(this._motionShadow != null)
         {
         }
      }
      
      public function isMotionShadow() : Boolean
      {
         return this._isShadow;
      }
      
      public function set isShadow(param1:Boolean) : void
      {
         this._isShadow = param1;
         if(effect is ZoomEffect)
         {
            ZoomEffect(effect).isShadow = true;
         }
      }
      
      public function get isShadow() : Boolean
      {
         return this._isShadow;
      }
      
      public function get shadow() : Object
      {
         return this._motionShadow;
      }
      
      protected function addMotionShadow() : void
      {
         var _loc1_:ProgramEffectAsset = null;
         if(!this.isMotionShadow())
         {
            if(this.motionShadow == null)
            {
               _loc1_ = this.clone() as ProgramEffectAsset;
               _loc1_.removeSlideMotion();
               _loc1_.fromTray = false;
               _loc1_.isShadow = true;
               _loc1_.needControl = true;
               this.motionShadow = _loc1_;
            }
         }
      }
      
      public function set motionData(param1:MotionData) : void
      {
         if(param1 != this._motionData)
         {
            this.motionShadow = null;
            this._motionData = null;
            if(param1)
            {
               this.addMotionShadow();
               this._motionData = param1.clone();
               this._motionData.maxInterPointNum = 0;
               if(this._motionShadow)
               {
                  this._motionShadow.move(this._motionData.endX - this._motionShadow.width / 2,this._motionData.endY - this._motionShadow.height / 2);
               }
            }
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      public function get slideEnabled() : Boolean
      {
         if(this.effect is ZoomEffect && ZoomEffect(this.effect).isPan)
         {
            return true;
         }
         return false;
      }
      
      public function get isSliding() : Boolean
      {
         return this._motionShadow != null;
      }
      
      public function startSlideMotion() : void
      {
         var _loc1_:MotionData = null;
         if(!this._motionData)
         {
            _loc1_ = new MotionData();
            _loc1_.moveStartPoint(this.x + this.width / 2,this.y + this.height / 2);
            _loc1_.moveEndPoint(this.x + this.width / 2,this.y + this.height / 2);
            this.motionData = _loc1_;
            if(this._motionShadow)
            {
               this._motionShadow.width = this._motionShadow.width * 0.8;
               this._motionShadow.height = this._motionShadow.height * 0.8;
               this._motionShadow.x = this._motionShadow.x + 10;
               this._motionShadow.y = this._motionShadow.y + 10;
            }
         }
      }
      
      public function removeSlideMotion() : void
      {
         this.motionData = null;
      }
      
      public function get isCamera() : Boolean
      {
         if(this.effect is ZoomEffect)
         {
            return true;
         }
         return false;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         if(this._motionData)
         {
            this._motionData.moveStartPoint(this.x + this.width / 2,this.y + this.height / 2);
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         if(this._motionData)
         {
            this._motionData.moveStartPoint(this.x + this.width / 2,this.y + this.height / 2);
            this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
         }
      }
   }
}
