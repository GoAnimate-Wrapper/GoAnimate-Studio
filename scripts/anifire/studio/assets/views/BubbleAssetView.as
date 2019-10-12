package anifire.studio.assets.views
{
   import anifire.studio.assets.image.IAssetImageProvider;
   import anifire.studio.core.Asset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.events.BubbleAssetEvent;
   import anifire.studio.interfaces.IBubble;
   import anifire.studio.interfaces.IBubbleTail;
   import anifire.studio.interfaces.IBubbleText;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.interfaces.IRotatable;
   import anifire.studio.interfaces.IScalable;
   import anifire.studio.managers.TutorialManager;
   
   public class BubbleAssetView extends AssetView
   {
       
      
      public function BubbleAssetView(param1:Asset, param2:IAssetImageProvider = null)
      {
         super(param1,param2);
      }
      
      override protected function init(param1:Asset) : void
      {
         super.init(param1);
         moveImage(this.asset as IMovable);
         rotateImage(this.asset as IRotatable);
         scaleImage(this.asset as IScalable);
      }
      
      override protected function handleImageReady() : void
      {
         if(_asset is IBubble)
         {
            this.changeBgColor(_asset as IBubble);
         }
         if(_asset is IBubbleTail)
         {
            this.moveTail(_asset as IBubbleTail);
         }
         if(_asset is IBubble)
         {
            this.resizeBubble(_asset as IBubble);
         }
         if(_asset is IBubbleText)
         {
            this.changeText(_asset as IBubbleText);
         }
         if(_asset is IBubbleText)
         {
            this.changeTextColor(_asset as IBubbleText);
         }
         if(_asset is IBubbleText)
         {
            this.changeTextFont(_asset as IBubbleText);
         }
         if(_asset is IBubbleText)
         {
            this.changeTextAlign(_asset as IBubbleText);
         }
         if(_asset is IBubbleText)
         {
            this.changeTextBold(_asset as IBubbleText);
         }
         if(_asset is IBubbleText)
         {
            this.changeTextEmbed(_asset as IBubbleText);
         }
         super.handleImageReady();
      }
      
      private function updateDecorated() : void
      {
      }
      
      override protected function addAssetEventListeners() : void
      {
         super.addAssetEventListeners();
         if(_asset)
         {
            _asset.addEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
            _asset.addEventListener(AssetEvent.ASSET_ROTATED,this.onAssetRotated);
            _asset.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResized);
            _asset.addEventListener(BubbleAssetEvent.BG_COLOR_CHANGE,this.onBgColorChange);
            _asset.addEventListener(BubbleAssetEvent.TAIL_MOVED,this.onTailMoved);
            _asset.addEventListener(BubbleAssetEvent.BUBBLE_RESIZED,this.onResized);
            _asset.addEventListener(BubbleAssetEvent.TEXT_CHANGE,this.onTextChange);
            _asset.addEventListener(BubbleAssetEvent.TEXT_COLOR_CHANGE,this.onTextColorChange);
            _asset.addEventListener(BubbleAssetEvent.TEXT_FONT_CHANGE,this.onTextFontChange);
            _asset.addEventListener(BubbleAssetEvent.TEXT_ALIGN_CHANGE,this.onTextAlignChange);
            _asset.addEventListener(BubbleAssetEvent.TEXT_BOLD_CHANGE,this.onTextBoldChange);
            _asset.addEventListener(BubbleAssetEvent.TEXT_EMBED_CHANGE,this.onTextEmbedChange);
            _asset.addEventListener(BubbleAssetEvent.TEXT_STYLE_CHANGE,this.onTextStyleChange);
            _asset.addEventListener(BubbleAssetEvent.TEXT_SIZE_CHANGE,this.onTextSizeChange);
            _asset.addEventListener(BubbleAssetEvent.AUTO_TEXT_RESIZE_CHANGE,this.onAutoTextResizeChange);
            _asset.addEventListener(BubbleAssetEvent.TEXT_TYPING,this.onTextTyping);
         }
      }
      
      override protected function removeAssetEventListeners() : void
      {
         super.removeAssetEventListeners();
         if(_asset)
         {
            _asset.removeEventListener(AssetEvent.ASSET_MOVED,this.onAssetMoved);
            _asset.removeEventListener(AssetEvent.ASSET_ROTATED,this.onAssetRotated);
            _asset.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResized);
            _asset.removeEventListener(BubbleAssetEvent.BG_COLOR_CHANGE,this.onBgColorChange);
            _asset.removeEventListener(BubbleAssetEvent.TAIL_MOVED,this.onTailMoved);
            _asset.removeEventListener(BubbleAssetEvent.BUBBLE_RESIZED,this.onResized);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_CHANGE,this.onTextChange);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_COLOR_CHANGE,this.onTextColorChange);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_FONT_CHANGE,this.onTextFontChange);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_ALIGN_CHANGE,this.onTextAlignChange);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_BOLD_CHANGE,this.onTextBoldChange);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_EMBED_CHANGE,this.onTextEmbedChange);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_STYLE_CHANGE,this.onTextStyleChange);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_SIZE_CHANGE,this.onTextSizeChange);
            _asset.removeEventListener(BubbleAssetEvent.AUTO_TEXT_RESIZE_CHANGE,this.onAutoTextResizeChange);
            _asset.removeEventListener(BubbleAssetEvent.TEXT_TYPING,this.onTextTyping);
         }
      }
      
      private function changeBgColor(param1:IBubble) : void
      {
         if(_assetImage is IBubble)
         {
            IBubble(_assetImage).bgColor = param1.bgColor;
            this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      private function moveTail(param1:IBubbleTail) : void
      {
         if(_assetImage is IBubbleTail)
         {
            IBubbleTail(_assetImage).moveTail(param1.tailX,param1.tailY);
            this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      private function resizeBubble(param1:IBubble) : void
      {
         if(_assetImage is IBubble)
         {
            IBubble(_assetImage).resizeBubble(param1.bubbleSize);
            this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      private function onAssetMoved(param1:AssetEvent) : void
      {
         if(param1.asset is IMovable)
         {
            moveImage(param1.asset as IMovable);
         }
      }
      
      private function onAssetRotated(param1:AssetEvent) : void
      {
         if(param1.asset is IRotatable)
         {
            rotateImage(param1.asset as IRotatable);
         }
      }
      
      private function onAssetResized(param1:AssetEvent) : void
      {
         if(param1.asset is IScalable)
         {
            scaleImage(param1.asset as IScalable);
         }
      }
      
      private function onBgColorChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubble)
         {
            this.changeBgColor(param1.asset as IBubble);
         }
      }
      
      private function onTailMoved(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleTail)
         {
            this.moveTail(param1.asset as IBubbleTail);
         }
      }
      
      private function onResized(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubble)
         {
            this.resizeBubble(param1.asset as IBubble);
         }
      }
      
      private function onTextColorChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.changeTextColor(param1.asset as IBubbleText);
         }
      }
      
      private function onTextFontChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.changeTextFont(param1.asset as IBubbleText);
         }
      }
      
      private function onTextAlignChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.changeTextAlign(param1.asset as IBubbleText);
         }
      }
      
      private function onTextBoldChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.changeTextBold(param1.asset as IBubbleText);
         }
      }
      
      private function onTextStyleChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.updateTextStyle(param1.asset as IBubbleText);
         }
      }
      
      private function onTextSizeChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.updateTextSize(param1.asset as IBubbleText);
         }
      }
      
      private function onAutoTextResizeChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.updateAutoTextResize(param1.asset as IBubbleText);
         }
      }
      
      private function onTextEmbedChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.changeTextEmbed(param1.asset as IBubbleText);
         }
      }
      
      private function onTextTyping(param1:BubbleAssetEvent) : void
      {
         var _loc2_:TutorialManager = null;
         if(param1.asset is IBubbleText)
         {
            _loc2_ = TutorialManager.instance;
            if(_loc2_.currentTutorial)
            {
               if(param1.asset.text)
               {
                  _loc2_.notifyTutorialAction("tutorial_bubble_updated");
               }
               else
               {
                  _loc2_.forbidTutorialAction("tutorial_bubble_updated");
               }
            }
         }
      }
      
      private function onTextChange(param1:BubbleAssetEvent) : void
      {
         if(param1.asset is IBubbleText)
         {
            this.changeText(param1.asset as IBubbleText);
         }
      }
      
      private function changeText(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).text = param1.text;
            this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      private function changeTextColor(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).textColor = param1.textColor;
            this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      private function changeTextFont(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).textFont = param1.textFont;
            this.dispatchEvent(new AssetViewEvent(AssetViewEvent.VIEW_CHANGE,true));
         }
      }
      
      private function changeTextAlign(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).textAlign = param1.textAlign;
         }
      }
      
      private function changeTextBold(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).textBold = param1.textBold;
         }
      }
      
      private function updateTextStyle(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).textItalic = param1.textItalic;
         }
      }
      
      private function updateTextSize(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).textSize = param1.textSize;
         }
      }
      
      private function updateAutoTextResize(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).autoTextResize = param1.autoTextResize;
         }
      }
      
      private function changeTextEmbed(param1:IBubbleText) : void
      {
         if(_assetImage is IBubbleText)
         {
            IBubbleText(_assetImage).textEmbed = param1.textEmbed;
         }
      }
   }
}
