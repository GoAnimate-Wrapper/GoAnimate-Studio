package com.jumpeye.flashEff2.symbol.unpack
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.flashEff2.utils.distort.JDistortImage;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class FESUnpack extends IFlashEffSymbol
   {
       
      
      private var container:MovieClip;
      
      private var _preset:Number = 1;
      
      private var myBitmapData1:BitmapData;
      
      private var _stepsNumber:Number = 4;
      
      private var myBitmap1:Bitmap;
      
      private var maskMc:MovieClip;
      
      private var transitionType:String;
      
      private var owner:Object;
      
      private var myBitmapData:BitmapData;
      
      private var orgStepsNumber:Number = 4;
      
      private var _smooth:Boolean = true;
      
      private var mcMaskat:Sprite;
      
      private var _focalLength:Number = 100;
      
      private var myBitmap:Bitmap;
      
      private var maskk:MovieClip;
      
      public function FESUnpack(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         if(owner is Object)
         {
            clearProperties(owner);
         }
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.3;
         _easeType = "easeInOut";
         _tweenType = "Strong";
      }
      
      public function parcurge() : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:BitmapData = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Point = null;
         var _loc9_:* = undefined;
         owner.tweenDuration = _tweenDuration / owner.objectsArray.length;
         var _loc1_:Object = {};
         if(owner.level < owner.objectsArray.length)
         {
            for(_loc2_ in owner.objectsArray[owner.level])
            {
               _loc3_ = owner.objectsArray[owner.level][_loc2_];
               _loc4_ = _loc3_.height;
               _loc5_ = _loc3_.width;
               _loc6_ = new BitmapData(_loc5_,_loc4_,true,13434828);
               owner.myBitmapDataTexture = _loc6_;
               _loc7_ = new Rectangle(_loc3_.xtexture,_loc3_.ytexture,_loc5_,_loc4_);
               _loc8_ = new Point(0,0);
               _loc6_.copyPixels(_loc3_.myBitmapData || myBitmapData,_loc7_,_loc8_);
               owner.container["mc_" + owner.level + "_" + _loc2_] = new MovieClip();
               _loc9_ = owner.container["mc_" + owner.level + "_" + _loc2_];
               owner.container.addChild(_loc9_);
               _loc9_.myBitmapData = _loc3_.myBitmapData90;
               _loc9_.texture = _loc6_;
               if(_loc3_.invertTextureHorizontal == true)
               {
                  _loc9_.invertTextureHorizontal = true;
                  invertTexture(_loc9_.texture,-1,1,1,0);
               }
               if(_loc3_.invertTextureVertical == true)
               {
                  _loc9_.invertTextureVertical = true;
                  invertTexture(_loc9_.texture,1,-1,0,1);
               }
               _loc9_.invertTextureHorizontal90 = _loc3_.invertTextureHorizontal90;
               _loc9_.invertTextureVertical90 = _loc3_.invertTextureVertical90;
               _loc9_.changeTexture = _loc3_.changeTexture;
               _loc9_.xtexture90 = _loc3_.xtexture90;
               _loc9_.ytexture90 = _loc3_.ytexture90;
               _loc9_.x = _loc3_.x;
               _loc9_.y = _loc3_.y;
               _loc9_.invertTexture90 = _loc3_.invertTexture90;
               _loc9_.ii = _loc3_.ii;
               _loc9_.matrixtx = _loc3_.matrixtx;
               _loc9_.matrixty = _loc3_.matrixty;
               _loc9_.matrixtxShow = _loc3_.matrixtxShow;
               _loc9_.matrixtyShow = _loc3_.matrixtyShow;
               _loc9_.w = _loc5_;
               _loc9_.h = _loc4_;
               maskMc.maskk.x = _loc3_.maskx;
               maskMc.maskk.y = _loc3_.masky;
               maskMc.maskk.width = _loc3_.maskw;
               maskMc.maskk.height = _loc3_.maskh;
               mcMaskat.mask = maskMc;
               _loc9_.tweenDistance = _loc3_.tweenDistance;
               _loc9_.tweenFirstDistortionX = _loc3_.tweenFirstDistortionX;
               _loc9_.tweenFirstDistortionY = _loc3_.tweenFirstDistortionY;
               _loc9_.i = _loc3_.i;
               this[_loc3_.packType](_loc9_);
            }
         }
         else
         {
            if(mcMaskat != null && mcMaskat.parent != null)
            {
               this.component.targetOwner.removeChild(mcMaskat);
               mcMaskat.mask = null;
            }
            if(transitionType == "show")
            {
               this.target.visible = true;
            }
            else
            {
               this.target.visible = false;
            }
            clearProperties(owner);
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set stepsNumber(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         else if(param1 > 50)
         {
            param1 = 50;
         }
         this._stepsNumber = param1;
         this.orgStepsNumber = param1;
      }
      
      public function get focalLength() : Number
      {
         return this._focalLength;
      }
      
      public function get smooth() : Boolean
      {
         return this._smooth;
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      override public function hide() : void
      {
         this.target.visible = false;
         startTransition("hide");
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      private function packXH(param1:MovieClip) : *
      {
         param1.y = param1.y + param1.texture.height;
         param1.x = param1.x + param1.texture.width / 2;
         var _loc2_:* = param1.texture.width;
         var _loc3_:* = param1.texture.height;
         owner.FlipPack2 = new JFEFlipUnpack(_focalLength,_loc3_);
         param1.pointArray = [[-_loc2_ / 2,-_loc3_],[_loc2_ / 2,-_loc3_],[_loc2_ / 2,0],[-_loc2_ / 2,0]];
         param1.distortObject = new JDistortImage(param1,param1.texture,3,3);
         param1.distortObject.smooth = this._smooth;
         owner.FlipPack2.firstDistortion(param1,param1.tweenFirstDistortionX,param1.tweenFirstDistortionY);
         owner.FlipPack2.flipEffect(owner,-1 * param1.tweenDistance,param1,"Vertical");
      }
      
      public function changeTexture(param1:MovieClip) : *
      {
         var _loc2_:* = new BitmapData(param1.texture.width,param1.texture.height,true,16764108);
         owner.bmpp = _loc2_;
         _loc2_.copyPixels(param1.myBitmapData || myBitmapData,new Rectangle(param1.xtexture90,param1.ytexture90,param1.texture.width,param1.texture.height),new Point(0,0));
         if(param1.invertTexture90 == true)
         {
            if(param1.invertTextureHorizontal90 == true)
            {
               invertTexture(_loc2_,-1,1,1,0);
            }
            if(param1.invertTextureVertical90 == true)
            {
               invertTexture(_loc2_,1,-1,0,1);
            }
         }
         param1.distortObject.texture = _loc2_;
         param1.texture = _loc2_;
      }
      
      public function get stepsNumber() : Number
      {
         return this._stepsNumber;
      }
      
      public function set focalLength(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._focalLength = param1;
      }
      
      protected function startTransition(param1:String) : void
      {
         var x:Number = NaN;
         var y:Number = NaN;
         var w:Number = NaN;
         var h:Number = NaN;
         var object1:Object = null;
         var xinit:* = undefined;
         var yinit:* = undefined;
         var packArray:* = undefined;
         var packArrayShow:* = undefined;
         var packInvert:* = undefined;
         var packInvert_mcMaskat:* = undefined;
         var packInvert_mcMaskatShow:* = undefined;
         var packXY:* = undefined;
         var flipNr:Number = NaN;
         var mcWHArray:* = undefined;
         var objWHArray:* = undefined;
         var maskXY:* = undefined;
         var maskXYArray:* = undefined;
         var objXYTexture:* = undefined;
         var test:Number = NaN;
         var ii:* = undefined;
         var packTypeArray:Array = null;
         var parcurgeArray:Array = null;
         var packRandom:* = undefined;
         var packRandomType:* = undefined;
         var putItBack:* = undefined;
         var wLinesNumber:Number = NaN;
         var hLinesNumber:Number = NaN;
         var wLine:Number = NaN;
         var hLine:Number = NaN;
         var xtexture:Number = NaN;
         var ytexture:Number = NaN;
         var xX:Number = NaN;
         var yX:Number = NaN;
         var xXH:Number = NaN;
         var yXH:Number = NaN;
         var xY:Number = NaN;
         var yY:Number = NaN;
         var xYW:Number = NaN;
         var yYW:Number = NaN;
         var maskX:Number = NaN;
         var maskY:Number = NaN;
         var object2:Object = null;
         var i:* = undefined;
         var obj:* = undefined;
         var lineSizeW:* = undefined;
         var myBitmapx:BitmapData = null;
         var matrixX:* = undefined;
         var myBitmapxh:BitmapData = null;
         var matrixXH:* = undefined;
         var myBitmapy:BitmapData = null;
         var matrixY:* = undefined;
         var myBitmapyw:BitmapData = null;
         var matrixYW:* = undefined;
         var tempObj:Object = null;
         var matrix:* = undefined;
         var myBitmapDataTexture:BitmapData = null;
         var doiLaPuterea_i:Number = NaN;
         var transitionT:String = param1;
         myBitmap = new Bitmap(myBitmapData);
         myBitmap1 = new Bitmap(myBitmapData1);
         owner = new Object();
         mcMaskat = new Sprite();
         maskMc = new MovieClip();
         container = new MovieClip();
         maskk = new MovieClip();
         _stepsNumber = orgStepsNumber;
         x = 0;
         y = 0;
         owner = this.component.targetOwner;
         owner.easeFunc = this.easeFunc;
         owner.tweenDuration = this.tweenDuration;
         owner.level = 0;
         transitionType = transitionT;
         var boundsObj:Rectangle = this.target.getBounds(this.target);
         if(this.component.target is TextField)
         {
         }
         owner.boundsObj = boundsObj;
         owner.objectsArray = [];
         owner.mcMaskat = mcMaskat;
         owner.container = container;
         owner.container.x = owner.boundsObj.x * target.scaleX;
         owner.container.y = owner.boundsObj.y * target.scaleY;
         if(this.component.target is TextField)
         {
            owner.container.x = owner.container.x + 2;
            owner.container.y = owner.container.y + 2;
         }
         maskMc.maskk = maskk;
         with(maskMc.maskk.graphics)
         {
            
            beginFill(0,1);
            moveTo(0,0);
            lineTo(100,0);
            lineTo(100,100);
            lineTo(100,100);
            lineTo(0,100);
            endFill();
         }
         maskMc.x = owner.boundsObj.x * target.scaleX;
         maskMc.y = owner.boundsObj.y * target.scaleY;
         maskMc.visible = false;
         owner.myBitmapData = myBitmapData;
         owner.myBitmapData1 = myBitmapData1;
         owner.container.scaleX = target.scaleX;
         owner.container.scaleY = target.scaleY;
         myBitmapData = new BitmapData(Math.ceil(owner.boundsObj.width),Math.ceil(owner.boundsObj.height),true,0);
         myBitmapData1 = new BitmapData(Math.ceil(owner.boundsObj.width),Math.ceil(owner.boundsObj.height),true,0);
         var matrixy:* = new Matrix();
         matrixy.translate(-owner.boundsObj.x,-owner.boundsObj.y);
         myBitmapData.draw(target,matrixy);
         myBitmapData1.draw(target,matrixy);
         myBitmap = new Bitmap(myBitmapData);
         myBitmap1 = new Bitmap(myBitmapData1);
         myBitmap.smoothing = this._smooth;
         myBitmap1.smoothing = this._smooth;
         mcMaskat.x = owner.boundsObj.x * target.scaleX;
         mcMaskat.y = owner.boundsObj.y * target.scaleY;
         mcMaskat.scaleX = target.scaleX;
         mcMaskat.scaleY = target.scaleY;
         maskMc.scaleX = target.scaleX;
         maskMc.scaleY = target.scaleY;
         maskMc.addChild(maskMc.maskk);
         this.component.targetOwner.addChild(mcMaskat);
         this.component.targetOwner.addChild(owner.container);
         this.component.targetOwner.addChild(maskMc);
         owner.endSquareGeneral = function(param1:MovieClip):*
         {
            param1.texture.dispose();
            param1.distortObject.texture.dispose();
            owner.container.removeChild(param1);
         };
         owner.endSquareTranistion = owner.endSquareGeneral;
         owner.parcurge = parcurge;
         owner.changeTexture = changeTexture;
         switch(Number(this.preset))
         {
            default:
               mcMaskat.addChild(myBitmap1);
               owner.objectsArray = [];
               w = myBitmapData.width;
               h = myBitmapData.height;
               object1 = {};
               if(transitionType == "hide")
               {
                  mcMaskat.visible = false;
                  object1.width = w / 2;
                  object1.height = h;
                  object1.x = x;
                  object1.y = y;
                  object1.xtexture = 0;
                  object1.ytexture = 0;
                  object1.packType = "packY";
                  object1.invertTextureHorizontal = false;
                  object2 = {};
                  object2.width = Math.ceil(w / 2);
                  object2.height = h;
                  object2.x = x + Math.ceil(w / 2);
                  object2.y = y;
                  object2.xtexture = Math.ceil(w / 2);
                  object2.ytexture = 0;
                  object2.packType = "packYW";
                  object2.invertTextureHorizontal = false;
                  object1.maskw = w;
                  object1.maskh = h;
                  object1.maskx = x;
                  object1.masky = y;
                  object2.maskw = w;
                  object2.maskh = h;
                  object2.maskx = x;
                  object2.masky = y;
                  object1.tweenDistance = 0.5;
                  object2.tweenDistance = 0.5;
                  object1.tweenFirstDistortionX = 0;
                  object1.tweenFirstDistortionY = 0;
                  object2.tweenFirstDistortionX = 0;
                  object2.tweenFirstDistortionY = 0;
                  owner.objectsArray = [[object1,object2]];
                  parcurge();
               }
               if(transitionType == "show")
               {
                  object1 = {};
                  object1.width = Math.ceil(w / 2);
                  object1.height = h;
                  object1.x = x - Math.ceil(w / 2);
                  object1.y = y;
                  object1.xtexture = 0;
                  object1.ytexture = 0;
                  object1.invertTextureHorizontal = true;
                  object1.packType = "packYW";
                  object2 = {};
                  object2.width = Math.ceil(w / 2);
                  object2.height = h;
                  object2.x = x + w;
                  object2.y = y;
                  object2.xtexture = Math.ceil(w / 2);
                  object2.ytexture = 0;
                  object2.invertTextureHorizontal = true;
                  object2.packType = "packY";
                  object1.maskw = 0;
                  object1.maskh = 0;
                  object1.maskx = x;
                  object1.masky = y;
                  object2.maskw = 0;
                  object2.maskh = 0;
                  object2.maskx = x;
                  object2.masky = y;
                  object1.tweenFirstDistortionX = 0;
                  object1.tweenFirstDistortionY = Math.PI / 2;
                  object2.tweenFirstDistortionX = 0;
                  object2.tweenFirstDistortionY = -Math.PI / 2;
                  object1.tweenDistance = 0.5;
                  object2.tweenDistance = 0.5;
                  owner.objectsArray = [[object1,object2]];
                  parcurge();
               }
               break;
            case 2:
               mcMaskat.addChild(myBitmap1);
               owner.objectsArray = [];
               w = myBitmapData.width;
               h = myBitmapData.height;
               if(transitionType == "hide")
               {
                  mcMaskat.visible = false;
                  object1 = {};
                  object1.width = w;
                  object1.height = Math.ceil(h / 2);
                  object1.x = x;
                  object1.y = y;
                  object1.xtexture = 0;
                  object1.ytexture = 0;
                  object1.packType = "packX";
                  object1.invertTextureVertical = false;
                  object2 = {};
                  object2.width = w;
                  object2.height = Math.ceil(h / 2);
                  object2.x = x;
                  object2.y = y + Math.ceil(h / 2);
                  object2.xtexture = 0;
                  object2.ytexture = Math.ceil(h / 2);
                  object2.packType = "packXH";
                  object2.invertTextureHorizontal = false;
                  object1.maskw = w;
                  object1.maskh = h;
                  object1.maskx = x;
                  object1.masky = y;
                  object2.maskw = w;
                  object2.maskh = h;
                  object2.maskx = x;
                  object2.masky = y;
                  object1.tweenFirstDistortionX = 0;
                  object1.tweenFirstDistortionY = 0;
                  object2.tweenFirstDistortionX = 0;
                  object2.tweenFirstDistortionY = 0;
                  object1.tweenDistance = 0.5;
                  object2.tweenDistance = 0.5;
                  owner.objectsArray = [[object1,object2]];
                  parcurge();
               }
               if(transitionType == "show")
               {
                  object1 = {};
                  object1.width = w;
                  object1.height = Math.ceil(h / 2);
                  object1.x = x;
                  object1.y = y - Math.ceil(h / 2);
                  object1.xtexture = 0;
                  object1.ytexture = 0;
                  object1.invertTextureVertical = true;
                  object1.packType = "packXH";
                  object2 = {};
                  object2.width = w;
                  object2.height = Math.ceil(h / 2);
                  object2.x = x;
                  object2.y = y + h;
                  object2.xtexture = 0;
                  object2.ytexture = Math.ceil(h / 2);
                  object2.invertTextureVertical = true;
                  object2.packType = "packX";
                  object1.maskw = 0;
                  object1.maskh = 0;
                  object1.maskx = x;
                  object1.masky = y;
                  object2.maskw = 0;
                  object2.maskh = 0;
                  object2.maskx = x;
                  object2.masky = y;
                  object1.tweenFirstDistortionX = -Math.PI / 2;
                  object1.tweenFirstDistortionY = 0;
                  object2.tweenFirstDistortionX = Math.PI / 2;
                  object2.tweenFirstDistortionY = 0;
                  object1.tweenDistance = 0.5;
                  object2.tweenDistance = 0.5;
                  owner.objectsArray = [[object1,object2]];
                  parcurge();
               }
               break;
            case 3:
               mcMaskat.addChild(myBitmap1);
               w = myBitmapData.width;
               h = myBitmapData.height;
               owner.objectsArray = [];
               if(transitionType == "show")
               {
                  i = 0;
                  while(i < _stepsNumber)
                  {
                     obj = {};
                     lineSizeW = w / _stepsNumber;
                     obj.width = lineSizeW;
                     obj.height = h;
                     obj.x = x + lineSizeW * i - lineSizeW;
                     obj.y = y;
                     obj.xtexture = lineSizeW * i;
                     obj.ytexture = 0;
                     obj.invertTexture = true;
                     obj.invertTextureHorizontal = true;
                     obj.packType = "packYW";
                     obj.invertTexture90 = false;
                     obj.invertTextureHorizontal90 = false;
                     obj.changeTexture = true;
                     obj.xtexture90 = lineSizeW * (i + 1);
                     obj.ytexture90 = 0;
                     obj.maskw = lineSizeW * i;
                     obj.maskh = h;
                     obj.maskx = 0;
                     obj.masky = 0;
                     obj.tweenFirstDistortionX = 0;
                     obj.tweenFirstDistortionY = 0;
                     obj.tweenDistance = 1;
                     if(i == 0)
                     {
                        obj.xtexture = lineSizeW * _stepsNumber;
                     }
                     if(i == _stepsNumber - 1)
                     {
                        obj.invertTexture90 = true;
                        obj.invertTextureHorizontal90 = true;
                        obj.xtexture90 = lineSizeW * i;
                        obj.xtexture = lineSizeW * i;
                     }
                     owner.objectsArray[i] = [obj];
                     i++;
                  }
                  parcurge();
               }
               if(transitionType == "hide")
               {
                  i = 0;
                  while(i < _stepsNumber)
                  {
                     obj = {};
                     lineSizeW = Math.ceil(w / _stepsNumber);
                     obj.width = lineSizeW;
                     obj.height = h;
                     obj.x = x + lineSizeW * i;
                     obj.y = y;
                     obj.xtexture = lineSizeW * (i - 1);
                     obj.ytexture = 0;
                     obj.invertTexture = true;
                     obj.invertTextureHorizontal = true;
                     obj.packType = "packYW";
                     obj.invertTexture90 = false;
                     obj.changeTexture = true;
                     obj.xtexture90 = lineSizeW * i;
                     obj.ytexture90 = 0;
                     obj.maskw = (_stepsNumber - i - 1) * lineSizeW;
                     obj.maskh = h;
                     obj.maskx = lineSizeW * (i + 1);
                     obj.masky = y;
                     if(i == 1)
                     {
                        obj.changeTexture = true;
                        obj.invertTextureHorizontal = true;
                        obj.xtexture90 = lineSizeW * 1;
                     }
                     if(i == 0)
                     {
                        obj.invertTextureHorizontal = false;
                        obj.xtexture = lineSizeW * i;
                        obj.changeTexture = false;
                     }
                     obj.tweenFirstDistortionX = 0;
                     obj.tweenFirstDistortionY = 0;
                     obj.tweenDistance = 1;
                     owner.objectsArray[i] = [obj];
                     i++;
                  }
                  owner.objectsArray[i - 1][0].tweenDistance = 0.5;
                  owner.objectsArray[i - 1][0].changeTexture = false;
                  parcurge();
               }
               break;
            case 4:
               mcMaskat.addChild(myBitmap1);
               w = myBitmapData.width;
               h = myBitmapData.height;
               owner.objectsArray = [];
               if(transitionType == "show")
               {
                  i = _stepsNumber - 1;
                  while(i >= 0)
                  {
                     obj = {};
                     lineSizeW = w / _stepsNumber;
                     obj.width = lineSizeW;
                     obj.height = h;
                     obj.x = x + lineSizeW * i + lineSizeW;
                     obj.y = y;
                     obj.xtexture = lineSizeW * i;
                     obj.ytexture = 0;
                     obj.invertTexture = true;
                     obj.invertTextureHorizontal = true;
                     obj.packType = "packY";
                     obj.invertTexture90 = false;
                     obj.invertTextureHorizontal90 = false;
                     obj.changeTexture = true;
                     obj.xtexture90 = lineSizeW * (i - 1);
                     obj.ytexture90 = 0;
                     obj.maskw = w;
                     obj.maskh = h;
                     obj.maskx = x + lineSizeW * (i + 1);
                     obj.masky = y;
                     obj.tweenFirstDistortionX = 0;
                     obj.tweenFirstDistortionY = 0;
                     obj.tweenDistance = 1;
                     if(i == _stepsNumber - 1)
                     {
                        obj.xtexture = 100000;
                     }
                     if(i == 0)
                     {
                        obj.invertTexture90 = true;
                        obj.invertTextureHorizontal90 = true;
                        obj.xtexture90 = lineSizeW * i;
                        obj.xtexture = lineSizeW * i;
                     }
                     owner.objectsArray[_stepsNumber - i - 1] = [obj];
                     i--;
                  }
                  parcurge();
               }
               if(transitionType == "hide")
               {
                  i = _stepsNumber - 1;
                  while(i >= 0)
                  {
                     obj = {};
                     lineSizeW = w / _stepsNumber;
                     obj.width = lineSizeW;
                     obj.height = h;
                     obj.x = x + lineSizeW * i;
                     obj.y = y;
                     obj.xtexture = lineSizeW * (i + 1);
                     obj.ytexture = 0;
                     obj.invertTexture = true;
                     obj.invertTextureHorizontal = true;
                     obj.packType = "packY";
                     obj.invertTexture90 = false;
                     obj.changeTexture = true;
                     obj.xtexture90 = lineSizeW * i;
                     obj.ytexture90 = 0;
                     obj.maskw = w;
                     obj.maskh = h;
                     obj.maskx = x - lineSizeW * (_stepsNumber - i);
                     obj.masky = y;
                     if(i == _stepsNumber - 1)
                     {
                        obj.invertTextureHorizontal = false;
                        obj.xtexture = lineSizeW * i;
                        obj.changeTexture = false;
                     }
                     obj.tweenFirstDistortionX = 0;
                     obj.tweenFirstDistortionY = 0;
                     obj.tweenDistance = 1;
                     owner.objectsArray[_stepsNumber - i - 1] = [obj];
                     i--;
                  }
                  owner.objectsArray[_stepsNumber - 1][0].tweenDistance = 0.5;
                  owner.objectsArray[_stepsNumber - 1][0].changeTexture = false;
                  parcurge();
               }
               break;
            case 5:
               mcMaskat.addChild(myBitmap1);
               w = myBitmapData.width;
               h = myBitmapData.height;
               owner.objectsArray = [];
               if(transitionType == "show")
               {
                  i = 0;
                  while(i < _stepsNumber)
                  {
                     obj = {};
                     lineSizeW = h / _stepsNumber;
                     obj.width = w;
                     obj.x = x;
                     obj.y = lineSizeW * i - lineSizeW;
                     obj.xtexture = 0;
                     obj.ytexture = lineSizeW * i;
                     obj.invertTexture = true;
                     obj.invertTextureVertical = true;
                     obj.packType = "packXH";
                     obj.invertTexture90 = false;
                     obj.invertTextureVertical90 = true;
                     obj.changeTexture = true;
                     obj.xtexture90 = 0;
                     obj.ytexture90 = lineSizeW * (i + 1);
                     obj.maskw = w;
                     obj.maskh = lineSizeW * i;
                     obj.maskx = x;
                     obj.masky = y;
                     obj.tweenFirstDistortionX = 0;
                     obj.tweenFirstDistortionY = 0;
                     obj.tweenDistance = 1;
                     if(i == 0)
                     {
                        obj.ytexture = lineSizeW * (i - 1);
                     }
                     if(i == _stepsNumber - 1)
                     {
                        obj.invertTexture90 = true;
                        obj.invertTextureVertical90 = true;
                        obj.ytexture90 = lineSizeW * i;
                        obj.ytexture = lineSizeW * i;
                     }
                     obj.height = lineSizeW;
                     owner.objectsArray[i] = [obj];
                     i++;
                  }
                  parcurge();
               }
               if(transitionType == "hide")
               {
                  i = 0;
                  while(i < _stepsNumber)
                  {
                     obj = {};
                     lineSizeW = Math.ceil(h / _stepsNumber);
                     obj.width = w;
                     obj.height = lineSizeW;
                     obj.x = x;
                     obj.y = y + lineSizeW * i;
                     obj.xtexture = 0;
                     obj.ytexture = lineSizeW * (i - 1);
                     obj.invertTextureVertical = true;
                     obj.packType = "packXH";
                     obj.invertTexture90 = false;
                     obj.changeTexture = true;
                     obj.xtexture90 = 0;
                     obj.ytexture90 = lineSizeW * i;
                     obj.maskw = w;
                     obj.maskh = (_stepsNumber - i - 1) * lineSizeW;
                     obj.maskx = x;
                     obj.masky = y + lineSizeW * (i + 1);
                     if(i == 1)
                     {
                        obj.changeTexture = true;
                        obj.invertTextureVertical = true;
                        obj.ytexture90 = lineSizeW * i;
                     }
                     if(i == 0)
                     {
                        obj.invertTextureVertical = false;
                        obj.ytexture = lineSizeW * i;
                        obj.changeTexture = false;
                     }
                     obj.tweenFirstDistortionX = 0;
                     obj.tweenFirstDistortionY = 0;
                     obj.tweenDistance = 1;
                     owner.objectsArray[i] = [obj];
                     i++;
                  }
                  owner.objectsArray[_stepsNumber - 1][0].tweenDistance = 0.5;
                  owner.objectsArray[_stepsNumber - 1][0].changeTexture = false;
                  parcurge();
               }
               break;
            case 6:
               mcMaskat.addChild(myBitmap1);
               w = myBitmapData.width;
               h = myBitmapData.height;
               owner.objectsArray = [];
               obj = {};
               if(transitionType == "show")
               {
                  i = _stepsNumber - 1;
                  while(i >= 0)
                  {
                     obj = {};
                     lineSizeW = h / _stepsNumber;
                     obj.width = w;
                     obj.height = lineSizeW;
                     obj.x = x;
                     obj.y = y + lineSizeW * (i + 1);
                     obj.xtexture = 0;
                     obj.ytexture = lineSizeW * i;
                     obj.invertTexture = true;
                     obj.invertTextureVertical = true;
                     obj.packType = "packX";
                     obj.invertTexture90 = false;
                     obj.invertTextureVertical90 = false;
                     obj.changeTexture = true;
                     obj.xtexture90 = 0;
                     obj.ytexture90 = lineSizeW * (i - 1);
                     obj.maskw = w;
                     obj.maskh = h;
                     obj.maskx = x;
                     obj.masky = y + lineSizeW * (i + 1);
                     obj.tweenFirstDistortionX = 0;
                     obj.tweenFirstDistortionY = 0;
                     obj.tweenDistance = 1;
                     if(i == _stepsNumber - 1)
                     {
                        obj.ytexture = lineSizeW * (i - 7);
                     }
                     if(i == 0)
                     {
                        obj.invertTexture90 = true;
                        obj.invertTextureVertical90 = true;
                        obj.ytexture90 = lineSizeW * i;
                        obj.ytexture = lineSizeW * i;
                     }
                     owner.objectsArray[_stepsNumber - i - 1] = [obj];
                     i--;
                  }
                  parcurge();
               }
               if(transitionType == "hide")
               {
                  _stepsNumber = _stepsNumber;
                  i = _stepsNumber - 1;
                  while(i >= 0)
                  {
                     obj = {};
                     lineSizeW = h / _stepsNumber;
                     obj.width = w;
                     obj.height = lineSizeW;
                     obj.x = x;
                     obj.y = y + lineSizeW * i;
                     obj.xtexture = 0;
                     obj.ytexture = lineSizeW * (i + 1);
                     obj.invertTextureVertical = true;
                     obj.packType = "packX";
                     obj.invertTexture90 = false;
                     obj.changeTexture = true;
                     obj.xtexture90 = 0;
                     obj.ytexture90 = lineSizeW * i;
                     obj.maskw = w;
                     obj.maskh = h;
                     obj.maskx = x;
                     obj.masky = y - lineSizeW * (_stepsNumber - i);
                     if(i == _stepsNumber - 1)
                     {
                        obj.invertTextureVertical = false;
                        obj.ytexture = lineSizeW * i;
                        obj.changeTexture = false;
                     }
                     obj.tweenFirstDistortionX = 0;
                     obj.tweenFirstDistortionY = 0;
                     obj.tweenDistance = 1;
                     owner.objectsArray[_stepsNumber - i - 1] = [obj];
                     i--;
                  }
                  owner.objectsArray[_stepsNumber - 1][0].tweenDistance = 0.5;
                  owner.objectsArray[_stepsNumber - 1][0].changeTexture = false;
                  parcurge();
               }
               break;
            case 7:
               mcMaskat.addChild(myBitmap1);
               w = myBitmapData.width;
               h = myBitmapData.height;
               xinit = 0;
               yinit = 0;
               packArray = ["packY","packX","packYW","packXH"];
               packArrayShow = ["packYW","packXH","packY","packX"];
               packInvert = [[false,false],[true,false],[true,true],[false,true]];
               packInvert_mcMaskat = [[true,false],[false,true],[true,false],[false,true]];
               packInvert_mcMaskatShow = [[false,true],[false,false],[true,false],[true,true]];
               packXY = [[x + w / 2,y],[x,y + h / 2],[x,y],[x + w / 4,y]];
               flipNr = 0;
               mcWHArray = [w,h];
               objWHArray = [w,h];
               maskXY = [[x,y],[x,y],[x + objWHArray[0] / 4,y],[x + objWHArray[0] / 4,y + objWHArray[1] / 4]];
               maskXYArray = [[x,y],[x,y],[x,y],[x,y]];
               objXYTexture = [0,0];
               owner.objectsArray = [];
               test = 0;
               ii = 0;
               i = 0;
               while(i < _stepsNumber)
               {
                  if(ii == 4)
                  {
                     ii = 0;
                     x = x + mcWHArray[0] / 4;
                     y = y + mcWHArray[1] / 4;
                     mcWHArray = [mcWHArray[0] / 4,mcWHArray[1] / 4];
                     packXY = [[x + mcWHArray[0] / 2,y],[x,y + mcWHArray[1] / 2],[x,y],[x + mcWHArray[0] / 4,y]];
                     maskXY = [[x,y],[x,y],[x + objWHArray[0] / 4,y],[x + objWHArray[0] / 4,y + objWHArray[1] / 4]];
                  }
                  obj = {};
                  if(test == 0)
                  {
                     obj.matrixtxShow = objXYTexture[0];
                     obj.matrixtyShow = objXYTexture[1] - objWHArray[1];
                     test = 1;
                     objWHArray[0] = objWHArray[0] / 2;
                     objXYTexture[0] = objXYTexture[0] + objWHArray[0];
                     obj.maskh = objWHArray[1];
                     obj.maskw = objWHArray[0];
                     obj.maskx = maskXY[ii][0];
                     obj.masky = maskXY[ii][1];
                  }
                  else
                  {
                     obj.matrixtxShow = objXYTexture[0] - objWHArray[0];
                     obj.matrixtyShow = objXYTexture[1];
                     test = 0;
                     objWHArray[1] = objWHArray[1] / 2;
                     objXYTexture[1] = objXYTexture[1] + objWHArray[1];
                     obj.maskh = objWHArray[1];
                     obj.maskw = objWHArray[0];
                     obj.maskx = maskXY[ii][0];
                     obj.masky = maskXY[ii][1];
                  }
                  obj.matrixtx = maskXY[ii][0] - xinit;
                  obj.matrixty = maskXY[ii][1] - yinit;
                  obj.width = objWHArray[0];
                  obj.height = objWHArray[1];
                  obj.x = packXY[ii][0];
                  obj.y = packXY[ii][1];
                  obj.xtexture = objXYTexture[0];
                  obj.ytexture = objXYTexture[1];
                  obj.invertTextureHorizontal = packInvert[ii][0];
                  obj.invertTextureVertical = packInvert[ii][1];
                  obj.packType = packArray[ii];
                  obj.ii = ii;
                  obj.tweenFirstDistortionX = 0;
                  obj.tweenFirstDistortionY = 0;
                  obj.tweenDistance = 1;
                  owner.objectsArray[i] = [obj];
                  ii++;
                  i++;
               }
               if(transitionType == "hide")
               {
                  owner.objectsArray[i - 1][0].tweenDistance = 0.5;
                  owner.objectsArray[i - 1][0].width = owner.objectsArray[i - 2][0].width;
                  owner.objectsArray[i - 1][0].height = owner.objectsArray[i - 2][0].height;
                  if(owner.objectsArray[i - 1][0].packType == "packX")
                  {
                     owner.objectsArray[i - 1][0].y = owner.objectsArray[i - 1][0].y - owner.objectsArray[i - 1][0].height / 2;
                  }
                  if(owner.objectsArray[i - 1][0].packType == "packY")
                  {
                     owner.objectsArray[i - 1][0].x = owner.objectsArray[i - 1][0].x - Math.ceil(owner.objectsArray[i - 1][0].width / 2);
                  }
                  owner.objectsArray[i - 1][0].matrixtx = owner.objectsArray[i - 2][0].matrixtx;
                  owner.objectsArray[i - 1][0].matrixty = owner.objectsArray[i - 2][0].matrixty;
                  owner.objectsArray[i - 1][0].xtexture = owner.objectsArray[i - 2][0].xtexture;
                  owner.objectsArray[i - 1][0].ytexture = owner.objectsArray[i - 2][0].ytexture;
                  owner.objectsArray[i - 1][0].maskw = 0;
                  owner.objectsArray[i - 1][0].maskh = 0;
                  if(i == 1)
                  {
                     owner.objectsArray[i - 1][0].width = w;
                     owner.objectsArray[i - 1][0].height = h;
                     owner.gain = owner.gain + 150;
                  }
                  owner.endSquareTranistion = function(param1:MovieClip):*
                  {
                     if(packInvert_mcMaskat[param1.ii][0] == true)
                     {
                        invertTexture(param1.texture,-1,1,1,0);
                     }
                     if(packInvert_mcMaskat[param1.ii][1] == true)
                     {
                        invertTexture(param1.texture,1,-1,0,1);
                     }
                     var _loc2_:* = new Matrix();
                     _loc2_.tx = param1.matrixtx;
                     _loc2_.ty = param1.matrixty;
                     myBitmapData1.draw(param1.texture,_loc2_);
                     owner.endSquareGeneral(param1);
                  };
                  parcurge();
               }
               if(transitionType == "show")
               {
                  if(_stepsNumber != 1)
                  {
                     owner.objectsArray[i - 1][0].tweenDistance = 0.5;
                     owner.objectsArray[i - 1][0].width = owner.objectsArray[i - 2][0].width;
                     owner.objectsArray[i - 1][0].height = owner.objectsArray[i - 2][0].height;
                     owner.objectsArray[i - 1][0].y = owner.objectsArray[i - 2][0].matrixty + yinit;
                     owner.objectsArray[i - 1][0].xtexture = owner.objectsArray[i - 2][0].xtexture;
                     owner.objectsArray[i - 1][0].ytexture = owner.objectsArray[i - 2][0].ytexture;
                     owner.objectsArray[i - 1][0].maskw = 0;
                     owner.objectsArray[i - 1][0].maskh = 0;
                  }
                  else
                  {
                     owner.objectsArray[i - 1][0].tweenDistance = 0.5;
                     owner.objectsArray[i - 1][0].width = w;
                     owner.objectsArray[i - 1][0].height = h;
                     owner.objectsArray[i - 1][0].xtexture = 0;
                     owner.objectsArray[i - 1][0].ytexture = 0;
                     owner.objectsArray[i - 1][0].maskw = 0;
                     owner.objectsArray[i - 1][0].maskh = 0;
                  }
                  switch(obj.packType)
                  {
                     case "packX":
                        owner.objectsArray[i - 1][0].tweenFirstDistortionX = -Math.PI / 2;
                        myBitmapx = new BitmapData(myBitmapData.width - obj.matrixtxShow / 2,myBitmapData.height - obj.matrixtyShow,true,16567500);
                        owner.myBitmapx = myBitmapx;
                        myBitmapx.copyPixels(myBitmapData,new Rectangle(obj.matrixtxShow + obj.width,obj.matrixtyShow,myBitmapData.width - obj.matrixtxShow,myBitmapData.height - obj.matrixtyShow),new Point(0,0));
                        invertTexture(myBitmapx,-1,1,1,0);
                        matrixX = new Matrix();
                        matrixX.tx = obj.matrixtx;
                        matrixX.ty = obj.matrixty;
                        myBitmapData1.draw(myBitmapx,matrixX);
                        break;
                     case "packXH":
                        owner.objectsArray[i - 1][0].matrixty = owner.objectsArray[i - 1][0].matrixty + owner.objectsArray[i - 1][0].height / 2;
                        owner.objectsArray[i - 1][0].tweenFirstDistortionX = Math.PI / 2;
                        myBitmapxh = new BitmapData((myBitmapData.width - obj.matrixtxShow) / 2,myBitmapData.height - obj.matrixtyShow,true,16567500);
                        myBitmapxh.copyPixels(myBitmapData,new Rectangle(obj.matrixtxShow + obj.width,obj.matrixtyShow,myBitmapData.width - obj.matrixtxShow,myBitmapData.height - obj.matrixtyShow),new Point(0,0));
                        owner.myBitmapxh = myBitmapxh;
                        invertTexture(myBitmapxh,1,-1,0,1);
                        matrixXH = new Matrix();
                        matrixXH.tx = obj.matrixtx;
                        matrixXH.ty = obj.matrixty - (myBitmapData.height - obj.matrixtyShow) / 2;
                        myBitmapData1.draw(myBitmapxh,matrixXH);
                        break;
                     case "packY":
                        owner.objectsArray[i - 1][0].x = owner.objectsArray[i - 1][0].x - owner.objectsArray[i - 1][0].width / 2;
                        owner.objectsArray[i - 1][0].tweenFirstDistortionY = Math.PI / 2;
                        myBitmapy = new BitmapData(myBitmapData.width - obj.matrixtxShow,(myBitmapData.height - obj.matrixtyShow) / 2,true,16567500);
                        owner.myBitmapy = myBitmapy;
                        myBitmapy.copyPixels(myBitmapData,new Rectangle(obj.matrixtxShow,obj.matrixtyShow + obj.height,myBitmapData.width - obj.matrixtxShow,myBitmapData.height - obj.matrixtyShow),new Point(0,0));
                        matrixY = new Matrix();
                        matrixY.tx = obj.matrixtx;
                        matrixY.ty = obj.matrixty;
                        myBitmapData1.draw(myBitmapy,matrixY);
                        break;
                     case "packYW":
                        owner.objectsArray[i - 1][0].matrixtx = owner.objectsArray[i - 1][0].matrixtx + owner.objectsArray[i - 1][0].width / 2;
                        owner.objectsArray[i - 1][0].tweenFirstDistortionY = -Math.PI / 2;
                        myBitmapyw = new BitmapData(myBitmapData.width - obj.matrixtxShow,(myBitmapData.height - obj.matrixtyShow) / 2,true,16567500);
                        owner.myBitmapyw = myBitmapyw;
                        myBitmapyw.copyPixels(myBitmapData,new Rectangle(obj.matrixtxShow,obj.matrixtyShow + obj.height,myBitmapData.width - obj.matrixtxShow,myBitmapData.height - obj.matrixtyShow),new Point(0,0));
                        invertTexture(myBitmapyw,1,-1,0,1);
                        invertTexture(myBitmapyw,-1,1,1,0);
                        matrixYW = new Matrix();
                        matrixYW.tx = obj.matrixtx - (myBitmapData.width - obj.matrixtxShow);
                        matrixYW.ty = obj.matrixty;
                        myBitmapData1.draw(myBitmapyw,matrixYW);
                  }
                  i = 0;
                  while(i < _stepsNumber)
                  {
                     tempObj = owner.objectsArray[i][0];
                     switch(tempObj.packType)
                     {
                        case "packX":
                           tempObj.packType = "packXH";
                           tempObj.y = tempObj.y - tempObj.height;
                           tempObj.invertTextureVertical = true;
                           break;
                        case "packXH":
                           tempObj.packType = "packX";
                           tempObj.y = tempObj.y + tempObj.height;
                           tempObj.invertTextureVertical = false;
                           tempObj.matrixty = tempObj.matrixty - tempObj.height;
                           tempObj.matrixtx = tempObj.matrixtx - tempObj.width;
                           break;
                        case "packY":
                           tempObj.packType = "packYW";
                           tempObj.x = tempObj.x - tempObj.width;
                           tempObj.invertTextureHorizontal = true;
                           tempObj.matrixty = tempObj.matrixty - tempObj.height;
                           break;
                        case "packYW":
                           tempObj.packType = "packY";
                           tempObj.x = tempObj.x + tempObj.width;
                           tempObj.invertTextureHorizontal = false;
                           tempObj.matrixtx = tempObj.matrixtx - tempObj.width;
                     }
                     owner.objectsArray[i] = [tempObj];
                     ii++;
                     i++;
                  }
                  _stepsNumber--;
                  owner.objectsArray.reverse();
                  owner.endSquareTranistion = function(param1:MovieClip):*
                  {
                     ii = param1.ii;
                     var _loc2_:Number = Math.pow(2,i + 1);
                     var _loc3_:Number = Math.pow(2,_stepsNumber / 2 - 1);
                     var _loc4_:* = w / _loc3_;
                     var _loc5_:* = h / _loc3_;
                     var _loc6_:BitmapData = new BitmapData(myBitmapData.width - param1.matrixtxShow,myBitmapData.height - param1.matrixtyShow,true,16567500);
                     owner.myBitmapp = _loc6_;
                     _loc6_.copyPixels(myBitmapData,new Rectangle(param1.matrixtxShow,param1.matrixtyShow,myBitmapData.width - param1.matrixtxShow,myBitmapData.height - param1.matrixtyShow),new Point(0,0));
                     if(packInvert_mcMaskatShow[ii][0] == true)
                     {
                        invertTexture(_loc6_,-1,1,1,0);
                     }
                     if(packInvert_mcMaskatShow[ii][1] == true)
                     {
                        invertTexture(_loc6_,1,-1,0,1);
                     }
                     var _loc7_:* = new Matrix();
                     _loc7_.tx = param1.matrixtx;
                     _loc7_.ty = param1.matrixty;
                     if(_stepsNumber)
                     {
                        myBitmapData1.draw(_loc6_,_loc7_);
                     }
                     _stepsNumber--;
                     owner.endSquareGeneral(param1);
                  };
                  parcurge();
               }
               break;
            case 8:
               mcMaskat.addChild(myBitmap);
               w = myBitmapData.width;
               h = myBitmapData.height;
               packTypeArray = ["packX","packXH","packY","packYW"];
               parcurgeArray = [];
               packRandom = int(Math.random() * 4);
               packRandomType = packTypeArray[packRandom];
               packTypeArray.splice(packRandom,1);
               putItBack = packRandomType;
               mcMaskat.addChild(myBitmap1);
               i = 0;
               while(i < _stepsNumber)
               {
                  packRandom = int(Math.random() * 3);
                  packRandomType = packTypeArray[packRandom];
                  packTypeArray.splice(packRandom,1,putItBack);
                  parcurgeArray[i] = packRandomType;
                  putItBack = packRandomType;
                  i++;
               }
               wLinesNumber = 0;
               hLinesNumber = 0;
               i = 0;
               while(i < _stepsNumber)
               {
                  if(parcurgeArray[i] == "packY" || parcurgeArray[i] == "packYW")
                  {
                     wLinesNumber++;
                  }
                  else
                  {
                     hLinesNumber++;
                  }
                  i++;
               }
               wLine = w / (wLinesNumber + 1);
               hLine = h / (hLinesNumber + 1);
               xtexture = 0;
               ytexture = 0;
               xX = 0;
               yX = hLine * hLinesNumber;
               xXH = 0;
               yXH = 0;
               xY = wLine * wLinesNumber;
               yY = 0;
               xYW = 0;
               yYW = 0;
               maskX = 0;
               maskY = 0;
               i = 0;
               while(i < _stepsNumber)
               {
                  obj = {};
                  obj.i = i;
                  obj.myBitmapData = myBitmapData1;
                  obj.tweenFirstDistortionX = 0;
                  obj.tweenFirstDistortionY = 0;
                  obj.tweenDistance = 1;
                  switch(parcurgeArray[i])
                  {
                     case "packXH":
                        obj.ii = 1;
                        obj.width = w;
                        obj.height = hLine;
                        obj.xtexture = xXH;
                        obj.ytexture = yXH;
                        obj.xtexture90 = xXH;
                        obj.ytexture90 = yXH;
                        h = h - hLine;
                        obj.x = xXH;
                        obj.y = yXH;
                        yXH = yXH + hLine;
                        yY = yY + hLine;
                        yYW = yYW + hLine;
                        obj.packType = "packXH";
                        obj.maskw = w;
                        obj.maskh = h;
                        maskY = maskY + hLine;
                        obj.maskx = maskX;
                        obj.masky = maskY;
                        obj.matrixtx = xXH;
                        obj.matrixty = yXH;
                        obj.changeTexture = true;
                        owner.objectsArray[i] = [obj];
                        break;
                     case "packX":
                        obj.ii = 1;
                        obj.width = w;
                        obj.height = hLine;
                        obj.xtexture = xX;
                        obj.ytexture = yX;
                        h = h - hLine;
                        obj.x = xX;
                        obj.y = yX;
                        obj.xtexture90 = xX;
                        obj.ytexture90 = yX;
                        yX = yX - hLine;
                        obj.packType = "packX";
                        obj.maskw = w;
                        obj.maskh = h;
                        obj.maskx = maskX;
                        obj.masky = maskY;
                        obj.matrixtx = xX;
                        obj.matrixty = yX;
                        obj.changeTexture = true;
                        owner.objectsArray[i] = [obj];
                        break;
                     case "packY":
                        obj.ii = 0;
                        obj.width = wLine;
                        obj.height = h;
                        obj.xtexture = xY;
                        obj.ytexture = yY;
                        obj.xtexture90 = xY;
                        obj.ytexture90 = yY;
                        w = w - wLine;
                        obj.x = xY;
                        obj.y = yY;
                        xY = xY - wLine;
                        obj.packType = "packY";
                        obj.maskw = w;
                        obj.maskh = h;
                        obj.maskx = maskX;
                        obj.masky = maskY;
                        obj.matrixtx = xY;
                        obj.matrixty = yY;
                        obj.i = i;
                        obj.changeTexture = true;
                        owner.objectsArray[i] = [obj];
                        break;
                     case "packYW":
                        obj.ii = 0;
                        obj.width = wLine;
                        obj.height = h;
                        obj.xtexture = xYW;
                        obj.ytexture = yYW;
                        obj.xtexture90 = xYW;
                        obj.ytexture90 = yYW;
                        w = w - wLine;
                        obj.x = xYW;
                        obj.y = yYW;
                        xYW = xYW + wLine;
                        xX = xX + wLine;
                        xXH = xXH + wLine;
                        obj.packType = "packYW";
                        obj.maskw = w;
                        obj.maskh = h;
                        maskX = maskX + wLine;
                        obj.maskx = maskX;
                        obj.masky = maskY;
                        obj.matrixtx = xYW;
                        obj.matrixty = yYW;
                        obj.changeTexture = true;
                        owner.objectsArray[i] = [obj];
                  }
                  i++;
               }
               owner.objectsArray[i - 1][0].tweenDistance = 0.5;
               owner.objectsArray[i - 1][0].changeTexture = false;
               owner.objectsArray[i - 1][0].maskw = 0;
               owner.objectsArray[i - 1][0].maskh = 0;
               if(_stepsNumber != 1)
               {
                  owner.objectsArray[i - 1][0].width = owner.objectsArray[i - 2][0].maskw;
                  owner.objectsArray[i - 1][0].height = owner.objectsArray[i - 2][0].maskh;
                  owner.objectsArray[i - 1][0].x = owner.objectsArray[i - 2][0].maskx;
                  owner.objectsArray[i - 1][0].y = owner.objectsArray[i - 2][0].masky;
                  owner.objectsArray[i - 1][0].xtexture = owner.objectsArray[i - 2][0].maskx;
                  owner.objectsArray[i - 1][0].ytexture = owner.objectsArray[i - 2][0].masky;
               }
               else
               {
                  owner.objectsArray[i - 1][0].width = myBitmapData.width;
                  owner.objectsArray[i - 1][0].height = myBitmapData.height;
                  owner.objectsArray[i - 1][0].x = 0;
                  owner.objectsArray[i - 1][0].y = 0;
                  owner.objectsArray[i - 1][0].xtexture = 0;
                  owner.objectsArray[i - 1][0].ytexture = 0;
               }
               if(transitionType == "hide")
               {
                  owner.endSquareTranistion = function(param1:MovieClip):*
                  {
                     if(param1.ii == 0)
                     {
                        invertTexture(param1.texture,-1,1,1,0);
                     }
                     else
                     {
                        invertTexture(param1.texture,1,-1,0,1);
                     }
                     var _loc2_:* = new Matrix();
                     _loc2_.tx = param1.matrixtx;
                     _loc2_.ty = param1.matrixty;
                     myBitmapData1.draw(param1.texture,_loc2_);
                     owner.endSquareGeneral(param1);
                  };
                  parcurge();
               }
               if(transitionType == "show")
               {
                  switch(owner.objectsArray[i - 1][0].packType)
                  {
                     case "packX":
                        owner.objectsArray[i - 1][0].tweenFirstDistortionX = -Math.PI / 2;
                        break;
                     case "packXH":
                        owner.objectsArray[i - 1][0].tweenFirstDistortionX = Math.PI / 2;
                        break;
                     case "packY":
                        owner.objectsArray[i - 1][0].tweenFirstDistortionY = Math.PI / 2;
                        break;
                     case "packYW":
                        owner.objectsArray[i - 1][0].tweenFirstDistortionY = -Math.PI / 2;
                  }
                  ii = 0;
                  while(ii < _stepsNumber - 1)
                  {
                     obj = owner.objectsArray[ii][0];
                     obj.myBitmapData = myBitmapData;
                     obj.myBitmapData90 = myBitmapData1;
                     matrix = new Matrix();
                     matrix.tx = obj.matrixtx;
                     matrix.ty = obj.matrixty;
                     myBitmapDataTexture = new BitmapData(obj.width,obj.height,true,16711714);
                     owner.myBitmapDataTexture = myBitmapDataTexture;
                     myBitmapDataTexture.copyPixels(myBitmapData,new Rectangle(obj.xtexture,obj.ytexture,obj.width,obj.height),new Point(0,0));
                     if(obj.ii == 0)
                     {
                        obj.invertTexture90 = true;
                        obj.invertTextureHorizontal90 = true;
                        invertTexture(myBitmapDataTexture,-1,1,1,0);
                     }
                     else
                     {
                        obj.invertTexture90 = true;
                        obj.invertTextureVertical90 = true;
                        invertTexture(myBitmapDataTexture,1,-1,0,1);
                     }
                     myBitmapData1.draw(myBitmapDataTexture,matrix);
                     ii++;
                  }
                  obj = owner.objectsArray[_stepsNumber - 1][0];
                  obj.invertTexture90 = true;
                  if(obj.ii == 0)
                  {
                     obj.invertTextureHorizontal90 = true;
                  }
                  else
                  {
                     obj.invertTextureVertical90 = true;
                  }
                  obj.myBitmapData90 = myBitmapData1;
                  obj.myBitmapData = myBitmapData1;
                  i = 0;
                  while(i < _stepsNumber)
                  {
                     obj.invertTextureHorizontal90;
                     doiLaPuterea_i = Math.pow(2,i + 1);
                     tempObj = owner.objectsArray[i][0];
                     switch(tempObj.packType)
                     {
                        case "packX":
                           tempObj.packType = "packXH";
                           tempObj.y = tempObj.y - tempObj.height;
                           tempObj.invertTextureVertical = true;
                           break;
                        case "packXH":
                           tempObj.packType = "packX";
                           tempObj.y = tempObj.y + tempObj.height;
                           tempObj.invertTextureVertical = true;
                           break;
                        case "packY":
                           tempObj.packType = "packYW";
                           tempObj.x = tempObj.x - tempObj.width;
                           tempObj.invertTextureHorizontal = true;
                           break;
                        case "packYW":
                           tempObj.packType = "packY";
                           tempObj.x = tempObj.x + tempObj.width;
                           tempObj.invertTextureHorizontal = true;
                     }
                     owner.objectsArray[i] = [tempObj];
                     i++;
                  }
                  owner.endSquareTranistion = function(param1:MovieClip):*
                  {
                     var _loc3_:* = undefined;
                     var _loc4_:BitmapData = null;
                     myBitmapData1.draw(myBitmapData);
                     var _loc2_:* = _stepsNumber - 1;
                     while(_loc2_ > _stepsNumber - param1.i)
                     {
                        obj = owner.objectsArray[_loc2_][0];
                        obj.myBitmapData = myBitmapData;
                        obj.myBitmapData90 = myBitmapData1;
                        _loc3_ = new Matrix();
                        _loc3_.tx = obj.matrixtx;
                        _loc3_.ty = obj.matrixty;
                        _loc4_ = new BitmapData(obj.width,obj.height,true,13434828);
                        owner.myBitmapDataTexture = _loc4_;
                        _loc4_.copyPixels(myBitmapData,new Rectangle(obj.xtexture,obj.ytexture,obj.width,obj.height),new Point(0,0));
                        if(obj.ii == 0)
                        {
                           obj.invertTexture90 = true;
                           obj.invertTextureHorizontal90 = true;
                           invertTexture(_loc4_,-1,1,1,0);
                        }
                        else
                        {
                           obj.invertTexture90 = true;
                           obj.invertTextureVertical90 = true;
                           invertTexture(_loc4_,1,-1,0,1);
                        }
                        myBitmapData1.draw(_loc4_,_loc3_);
                        _loc2_--;
                     }
                     owner.endSquareGeneral(param1);
                  };
                  owner.objectsArray.reverse();
                  parcurge();
               }
         }
      }
      
      public function set smooth(param1:Boolean) : void
      {
         this._smooth = param1;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      public function clearProperties(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(param1.level is Number)
         {
            _loc2_ = 0;
            while(_loc2_ <= param1.level)
            {
               if(param1.objectsArray[_loc2_] is Object)
               {
                  for(_loc3_ in param1.objectsArray[_loc2_])
                  {
                     if(param1.container is MovieClip)
                     {
                        this.component.targetOwner.removeChild(param1.container);
                        if(param1.container["mc_" + _loc2_ + "_" + _loc3_] is MovieClip)
                        {
                           if(param1.container["mc_" + _loc2_ + "_" + _loc3_].texture is BitmapData)
                           {
                              param1.container["mc_" + _loc2_ + "_" + _loc3_].texture.dispose();
                              param1.container["mc_" + _loc2_ + "_" + _loc3_].texture = null;
                           }
                           param1.container["mc_" + _loc2_ + "_" + _loc3_];
                        }
                        param1.container = null;
                     }
                  }
                  param1.objectsArray[_loc2_] = null;
               }
               _loc2_++;
            }
         }
         if(myBitmap != null)
         {
            if(myBitmap.parent != null)
            {
               mcMaskat.removeChild(myBitmap);
            }
            myBitmap.bitmapData.dispose();
            myBitmapData = null;
            myBitmap = null;
         }
         if(myBitmap1 != null)
         {
            if(myBitmap1.parent != null)
            {
               mcMaskat.removeChild(myBitmap1);
            }
            myBitmap1.bitmapData.dispose();
            myBitmapData1 = null;
            myBitmap1 = null;
         }
         if(maskMc is MovieClip && maskMc.parent != null)
         {
            this.component.targetOwner.removeChild(maskMc);
            maskMc = null;
         }
         if(mcMaskat != null && mcMaskat.parent != null)
         {
            this.component.targetOwner.removeChild(mcMaskat);
            mcMaskat.mask = null;
         }
         if(container is MovieClip)
         {
            container = null;
         }
         if(maskk is MovieClip)
         {
            maskk = null;
         }
         if(param1.FlipPack1 is Object)
         {
            if(param1.FlipPack1.tweenObject is Object)
            {
               TweenLite.killTweensOf(param1.FlipPack1.tweenObject,false);
            }
         }
         if(param1.FlipPack2 is Object)
         {
            if(param1.FlipPack2.tweenObject is Object)
            {
               TweenLite.killTweensOf(param1.FlipPack2.tweenObject,false);
            }
         }
         if(param1.FlipPack3 is Object)
         {
            if(param1.FlipPack3.tweenObject is Object)
            {
               TweenLite.killTweensOf(param1.FlipPack3.tweenObject,false);
            }
         }
         if(param1.FlipPack4 is Object)
         {
            if(param1.FlipPack4.tweenObject is Object)
            {
               TweenLite.killTweensOf(param1.FlipPack4.tweenObject,false);
            }
         }
         if(param1.myBitmapDataTexture is BitmapData)
         {
            param1.myBitmapDataTexture.dispose();
            param1.myBitmapDataTexture = null;
         }
         if(param1.bmpp is BitmapData)
         {
            param1.bmpp.dispose();
            param1.bmpp = null;
         }
         if(param1.myBitmapx is BitmapData)
         {
            param1.myBitmapx.dispose();
            param1.myBitmapx = null;
         }
         if(param1.myBitmapxh is BitmapData)
         {
            param1.myBitmapxh.dispose();
            param1.myBitmapxh = null;
         }
         if(param1.myBitmapy is BitmapData)
         {
            param1.myBitmapy.dispose();
            param1.myBitmapy = null;
         }
         if(param1.myBitmapyw is BitmapData)
         {
            param1.myBitmapyw.dispose();
            param1.myBitmapyw = null;
         }
         if(param1.myBitmapp is BitmapData)
         {
            param1.myBitmapp.dispose();
            param1.myBitmapp = null;
         }
         if(param1.mcMaskat is Sprite)
         {
            param1.mcMaskat = null;
         }
         if(param1 is Object)
         {
            param1 = null;
         }
      }
      
      public function invertTexture(param1:BitmapData, param2:Number, param3:Number, param4:Number, param5:Number) : *
      {
         var _loc6_:BitmapData = new BitmapData(param1.width,param1.height,true,16777215);
         _loc6_.draw(param1);
         var _loc7_:Rectangle = new Rectangle(0,0,param1.width,param1.height);
         param1.fillRect(_loc7_,65280);
         var _loc8_:Matrix = new Matrix();
         _loc8_.scale(param2,param3);
         _loc8_.tx = param4 * param1.width;
         _loc8_.ty = param5 * param1.height;
         param1.draw(_loc6_,_loc8_);
         _loc6_.dispose();
      }
      
      private function packY(param1:MovieClip) : *
      {
         param1.y = param1.y + param1.texture.height / 2;
         var _loc2_:* = param1.texture.width;
         var _loc3_:* = param1.texture.height;
         param1.pointArray = [[0,-_loc3_ / 2],[_loc2_,-_loc3_ / 2],[_loc2_,_loc3_ / 2],[0,_loc3_ / 2]];
         owner.FlipPack3 = new JFEFlipUnpack(_focalLength,_loc2_);
         param1.distortObject = new JDistortImage(param1,param1.texture,3,3);
         param1.distortObject.smooth = this._smooth;
         owner.FlipPack3.firstDistortion(param1,param1.tweenFirstDistortionX,param1.tweenFirstDistortionY);
         owner.FlipPack3.flipEffect(owner,-1 * param1.tweenDistance,param1,"Horizontal");
      }
      
      private function packX(param1:MovieClip) : *
      {
         param1.x = param1.x + param1.texture.width / 2;
         var _loc2_:Number = param1.texture.width;
         var _loc3_:Number = param1.texture.height;
         param1.pointArray = [[-_loc2_ / 2,0],[_loc2_ / 2,0],[_loc2_ / 2,_loc3_],[-_loc2_ / 2,_loc3_]];
         owner.FlipPack1 = new JFEFlipUnpack(_focalLength,_loc3_);
         param1.distortObject = new JDistortImage(param1,param1.texture,3,3);
         param1.distortObject.smooth = this._smooth;
         owner.FlipPack1.firstDistortion(param1,param1.tweenFirstDistortionX,param1.tweenFirstDistortionY);
         owner.FlipPack1.flipEffect(owner,1 * param1.tweenDistance,param1,"Vertical");
      }
      
      private function packYW(param1:MovieClip) : *
      {
         param1.y = param1.y + param1.texture.height / 2;
         var _loc2_:* = param1.texture.width;
         var _loc3_:* = param1.texture.height;
         param1.pointArray = [[-_loc2_,-_loc3_ / 2],[0,-_loc3_ / 2],[0,_loc3_ / 2],[-_loc2_,_loc3_ / 2]];
         owner.FlipPack4 = new JFEFlipUnpack(_focalLength,_loc2_);
         param1.distortObject = new JDistortImage(param1,param1.texture,3,3);
         param1.distortObject.smooth = this._smooth;
         param1.x = param1.x + param1.width;
         owner.FlipPack4.firstDistortion(param1,param1.tweenFirstDistortionX,param1.tweenFirstDistortionY);
         owner.FlipPack4.flipEffect(owner,1 * param1.tweenDistance,param1,"Horizontal");
      }
      
      override public function show() : void
      {
         this.target.visible = false;
         startTransition("show");
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
   }
}
