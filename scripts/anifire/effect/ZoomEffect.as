package anifire.effect
{
   import anifire.constant.LicenseConstants;
   import anifire.util.Util;
   import anifire.util.UtilDraw;
   import anifire.util.UtilPlain;
   import flash.display.Sprite;
   
   public class ZoomEffect extends ProgramEffect
   {
      
      private static var iconBlue:Class = ZoomEffect_iconBlue;
      
      private static var iconPurple:Class = ZoomEffect_iconPurple;
       
      
      private const RGB:Number = 13421772;
      
      private const ALPHA:Number = 0.6;
      
      private const LINESIZE:Number = 5;
      
      private const BODY:String = "body";
      
      private var _isCut:Boolean;
      
      private var _isPan:Boolean;
      
      private var _mver:Number = 0;
      
      private var _isShadow:Boolean;
      
      private var _icon:Sprite;
      
      private var _myThumbnailSymbol:Class;
      
      private var _myThumbnailSymbol_cut:Class;
      
      private var _myThumbnailSymbol_pan:Class;
      
      public function ZoomEffect(param1:String = "", param2:Number = 0)
      {
         var _loc3_:Sprite = null;
         this._icon = new Sprite();
         this._myThumbnailSymbol = ZoomEffect__myThumbnailSymbol;
         this._myThumbnailSymbol_cut = ZoomEffect__myThumbnailSymbol_cut;
         this._myThumbnailSymbol_pan = ZoomEffect__myThumbnailSymbol_pan;
         super();
         type = EffectMgr.TYPE_ZOOM;
         this._mver = param2;
         if(param1 == EffectMgr.TYPE_CUT)
         {
            this._isCut = true;
         }
         else if(param1 == EffectMgr.TYPE_PAN)
         {
            this._isPan = true;
         }
         if(this._isCut)
         {
            thumbnailSymbol = this._myThumbnailSymbol_cut;
         }
         else if(this._isPan)
         {
            thumbnailSymbol = this._myThumbnailSymbol_pan;
         }
         else
         {
            thumbnailSymbol = this._myThumbnailSymbol;
         }
         if(this._mver > 3)
         {
            _loc3_ = new iconBlue() as Sprite;
            this._icon.addChild(_loc3_);
         }
         this.redraw();
      }
      
      public function get isShadow() : Boolean
      {
         return this._isShadow;
      }
      
      public function set isShadow(param1:Boolean) : void
      {
         var _loc2_:Sprite = null;
         this._isShadow = param1;
         if(this._mver > 3)
         {
            UtilPlain.removeAllSon(this._icon);
            _loc2_ = new iconPurple() as Sprite;
            this._icon.addChild(_loc2_);
         }
      }
      
      public function get isCut() : Boolean
      {
         return this._isCut;
      }
      
      public function get isPan() : Boolean
      {
         return this._isPan;
      }
      
      public function set isPan(param1:Boolean) : void
      {
         this._isPan = param1;
         this._isCut = !param1;
      }
      
      override public function serialize() : XML
      {
         var _loc1_:XML = <effect x="{x}" y="{y}" w="{Util.roundNum(width)}" h="{Util.roundNum(height)}" rotate='0' id="{id}" type="{type}" isCut="{this._isCut.toString()}" isPan="{this._isPan.toString()}">
                             </effect>;
         return _loc1_;
      }
      
      protected function drawIcon() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this._mver > 3 && this.width > 80)
         {
            this._icon.buttonMode = true;
            this._icon.mouseChildren = false;
            this._icon.visible = true;
            _loc1_ = width / LicenseConstants.getScreenRatio();
            _loc2_ = (height - _loc1_) / 2;
            this._icon.y = y + _loc2_ + 4;
            this._icon.x = 4;
            if(!content.contains(this._icon))
            {
               content.addChild(this._icon);
            }
         }
         else
         {
            this._icon.visible = false;
         }
      }
      
      override protected function drawBody() : void
      {
         if(super.body != null)
         {
            content.removeChild(super.body);
         }
         var _loc1_:Sprite = new Sprite();
         _loc1_.name = this.BODY;
         if(this._mver <= 3)
         {
            _loc1_.graphics.lineStyle(this.LINESIZE,this.ALPHA);
         }
         else if(this.isShadow)
         {
            _loc1_.graphics.lineStyle(1,6110118);
         }
         else
         {
            _loc1_.graphics.lineStyle(1,932450);
         }
         var _loc2_:Number = width / LicenseConstants.getScreenRatio();
         var _loc3_:Number = (height - _loc2_) / 2;
         if(this._mver <= 3)
         {
            UtilDraw.drawDashRect(_loc1_,x,y + _loc3_,width,_loc2_,6,8);
         }
         else
         {
            _loc1_.graphics.drawRect(x,y + _loc3_,width,_loc2_);
            if(this.isShadow)
            {
               _loc1_.graphics.lineStyle(1,10190045);
            }
            else
            {
               _loc1_.graphics.lineStyle(1,6464994);
            }
            _loc1_.graphics.drawRect(x + 1,y + _loc3_ + 1,width - 2,_loc2_ - 2);
         }
         _loc1_.graphics.lineStyle(20,16777215,0);
         _loc1_.graphics.drawRect(x,y,width,height);
         super.body = content.addChild(_loc1_) as Sprite;
      }
      
      override public function redraw() : void
      {
         this.drawBody();
         drawLabel();
         this.drawIcon();
      }
   }
}
