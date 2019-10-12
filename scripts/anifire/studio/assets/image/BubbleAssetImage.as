package anifire.studio.assets.image
{
   import anifire.bubble.Bubble;
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.interfaces.IBubble;
   import anifire.studio.interfaces.IBubbleTail;
   import anifire.studio.interfaces.IBubbleText;
   import anifire.studio.interfaces.IResizable;
   import anifire.util.FontManager;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class BubbleAssetImage extends AssetImageBase implements IBubble, IBubbleText, IResizable, IBubbleTail
   {
       
      
      private var _bubble:Bubble;
      
      public function BubbleAssetImage()
      {
         super();
      }
      
      override public function set asset(param1:Asset) : void
      {
         var _loc2_:FontManager = null;
         super.asset = param1;
         if(param1 is BubbleAsset)
         {
            this._bubble = BubbleAsset(param1).bubble;
            if(!this._bubble)
            {
               return;
            }
            _loc2_ = FontManager.getFontManager();
            if(this._bubble.textEmbed && !_loc2_.isFontLoaded(this._bubble.textFont))
            {
               _loc2_.loadFont(this._bubble.textFont,this.loadFont_completeHandler);
            }
            else
            {
               this.addBubble();
            }
         }
      }
      
      private function loadFont_completeHandler(param1:Event, param2:String) : void
      {
         this.addBubble();
      }
      
      protected function addBubble() : void
      {
         _rect.x = this._bubble.x;
         _rect.y = this._bubble.y;
         _rect.width = this._bubble.width;
         _rect.height = this._bubble.height;
         this.addChild(this._bubble);
         dispatchImageReady();
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         super.destroy(param1);
         this._bubble = null;
      }
      
      public function set bgColor(param1:uint) : void
      {
         if(this._bubble)
         {
            this._bubble.fillRgb = param1;
         }
      }
      
      public function get bgColor() : uint
      {
         if(this._bubble)
         {
            return this._bubble.fillRgb;
         }
         return 0;
      }
      
      public function get hasTail() : Boolean
      {
         if(this._bubble)
         {
            return this._bubble.isTailEnable();
         }
         return true;
      }
      
      public function get tailX() : Number
      {
         if(this._bubble)
         {
            return this._bubble.tailx;
         }
         return 0;
      }
      
      public function get tailY() : Number
      {
         if(this._bubble)
         {
            return this._bubble.taily;
         }
         return 0;
      }
      
      public function set tailX(param1:Number) : void
      {
         if(this._bubble)
         {
            this._bubble.setTail(param1,this._bubble.taily);
         }
      }
      
      public function set tailY(param1:Number) : void
      {
         if(this._bubble)
         {
            this._bubble.setTail(this._bubble.tailx,param1);
         }
      }
      
      public function moveTail(param1:Number, param2:Number) : void
      {
         if(param1 != this.tailX || param2 != this.tailY)
         {
            if(this._bubble)
            {
               this._bubble.setTail(param1,param2);
            }
         }
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         if(this._bubble)
         {
            this._bubble.x = super.rect.x + super.rect.width / 2 - param1 / 2;
            this._bubble.setSize(param1,this._bubble.height);
         }
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         if(this._bubble)
         {
            this._bubble.y = super.rect.y + super.rect.height / 2 - param1 / 2;
            this._bubble.setSize(this._bubble.width,param1);
         }
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param1 != this.width || param2 != this.height)
         {
            this.width = param1;
            this.height = param2;
         }
      }
      
      public function resizeBubble(param1:Rectangle) : void
      {
         if(param1 && this._bubble)
         {
            this._bubble.x = param1.x;
            this._bubble.y = param1.y;
            this._bubble.setSize(param1.width,param1.height);
         }
      }
      
      public function get bubbleSize() : Rectangle
      {
         var _loc1_:Rectangle = null;
         if(this._bubble)
         {
            _loc1_ = new Rectangle(this._bubble.x,this._bubble.y,this._bubble.width,this._bubble.height);
         }
         return _loc1_;
      }
      
      public function get text() : String
      {
         if(this._bubble)
         {
            return this._bubble.text;
         }
         return "";
      }
      
      public function get textColor() : uint
      {
         if(this._bubble)
         {
            return this._bubble.textRgb;
         }
         return 0;
      }
      
      public function get textAlpha() : uint
      {
         if(this._bubble)
         {
            return this._bubble.textAlpha;
         }
         return 0;
      }
      
      public function set textAlpha(param1:uint) : void
      {
         if(this._bubble)
         {
            this._bubble.textAlpha = param1;
         }
      }
      
      public function set text(param1:String) : void
      {
         if(this._bubble)
         {
            this._bubble.text = param1;
            this.checkFontSupport();
         }
      }
      
      public function set textColor(param1:uint) : void
      {
         if(this._bubble)
         {
            this._bubble.textRgb = param1;
         }
      }
      
      public function get textFont() : String
      {
         if(this._bubble)
         {
            return this._bubble.textFont;
         }
         return "";
      }
      
      public function set textFont(param1:String) : void
      {
         if(this._bubble)
         {
            this._bubble.textFont = param1;
            this.checkFontSupport();
         }
      }
      
      public function set textSize(param1:Number) : void
      {
         if(this._bubble)
         {
            this._bubble.textSize = param1;
         }
      }
      
      public function get textSize() : Number
      {
         if(this._bubble)
         {
            return this._bubble.textSize;
         }
         return 12;
      }
      
      public function set autoTextResize(param1:Boolean) : void
      {
         if(this._bubble)
         {
            this._bubble.autoTextResize = param1;
         }
      }
      
      public function get autoTextResize() : Boolean
      {
         if(this._bubble)
         {
            return this._bubble.autoTextResize;
         }
         return true;
      }
      
      private function checkFontSupport() : void
      {
      }
      
      public function get textAlign() : String
      {
         if(this._bubble)
         {
            return this._bubble.textAlign;
         }
         return "";
      }
      
      public function set textAlign(param1:String) : void
      {
         if(this._bubble)
         {
            this._bubble.textAlign = param1;
         }
      }
      
      public function get textEmbed() : Boolean
      {
         if(this._bubble)
         {
            return this._bubble.textEmbed;
         }
         return true;
      }
      
      public function set textEmbed(param1:Boolean) : void
      {
         if(this._bubble)
         {
            this._bubble.textEmbed = param1;
         }
      }
      
      public function get textBold() : Boolean
      {
         if(this._bubble)
         {
            return this._bubble.textBold;
         }
         return false;
      }
      
      public function set textBold(param1:Boolean) : void
      {
         if(this._bubble)
         {
            this._bubble.textBold = param1;
         }
      }
      
      public function get textItalic() : Boolean
      {
         if(this._bubble)
         {
            return this._bubble.textItalic;
         }
         return false;
      }
      
      public function set textItalic(param1:Boolean) : void
      {
         if(this._bubble)
         {
            this._bubble.textItalic = param1;
         }
      }
      
      public function get bgAlpha() : Number
      {
         if(this._bubble)
         {
            return this._bubble.alpha;
         }
         return 0;
      }
      
      public function set bgAlpha(param1:Number) : void
      {
         if(this._bubble)
         {
            this._bubble.alpha = param1;
         }
      }
      
      public function get horizontalPadding() : int
      {
         if(this._bubble)
         {
            return this._bubble.horizontalPadding;
         }
         return 0;
      }
      
      public function set horizontalPadding(param1:int) : void
      {
         if(this._bubble)
         {
            this._bubble.horizontalPadding = param1;
         }
      }
      
      public function get verticalPadding() : int
      {
         if(this._bubble)
         {
            return this._bubble.verticalPadding;
         }
         return 0;
      }
      
      public function set verticalPadding(param1:int) : void
      {
         if(this._bubble)
         {
            this._bubble.verticalPadding = param1;
         }
      }
   }
}
