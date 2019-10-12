package anifire.studio.assets.controllers
{
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.commands.ChangeBubbleGroupCommand;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IBubble;
   import anifire.studio.interfaces.IBubbleText;
   import anifire.util.FontManager;
   import flash.geom.Rectangle;
   import flash.text.Font;
   
   public class TextCollectionController extends AssetCollectionController implements IBubble, IBubbleText
   {
      
      public static const NEWLINE_PATTERN:RegExp = /\r|\n/gi;
      
      public static const ATTRIBUTE_NAME_TEXT_ALPHA:String = "textAlpha";
      
      public static const ATTRIBUTE_NAME_TEXT_COLOR:String = "textColor";
      
      public static const ATTRIBUTE_NAME_BG_ALPHA:String = "bgColor";
      
      public static const ATTRIBUTE_NAME_BG_COLOR:String = "bgAlpha";
       
      
      protected var _groupCommand:ChangeBubbleGroupCommand;
      
      protected var _changeAttributeName:String;
      
      public function TextCollectionController(param1:AssetViewCollection)
      {
         super(param1);
      }
      
      public function startChange(param1:String) : void
      {
         if(this._changeAttributeName != param1)
         {
            this.commitChange();
         }
         if(!this._groupCommand && _viewCollection)
         {
            this._changeAttributeName = param1;
            this._groupCommand = new ChangeBubbleGroupCommand(_viewCollection);
            this._groupCommand.execute();
         }
      }
      
      public function commitChange() : void
      {
         this._groupCommand = null;
      }
      
      public function get singleBubbleAsset() : BubbleAsset
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection && _viewCollection.length == 1)
         {
            _loc1_ = _viewCollection.iterator();
            _loc2_ = _loc1_.next as IAssetView;
            return _loc2_.asset as BubbleAsset;
         }
         return null;
      }
      
      public function get autoTextResize() : Boolean
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).autoTextResize;
               }
            }
         }
         return false;
      }
      
      public function set autoTextResize(param1:Boolean) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc5_ = BubbleAsset(_loc3_.asset);
                  _loc5_.autoTextResize = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get text() : String
      {
         return null;
      }
      
      public function set text(param1:String) : void
      {
      }
      
      public function get textAlign() : String
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textAlign;
               }
            }
         }
         return "left";
      }
      
      public function set textAlign(param1:String) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc5_ = BubbleAsset(_loc3_.asset);
                  _loc5_.textAlign = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textBold() : Boolean
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textBold;
               }
            }
         }
         return false;
      }
      
      public function set textBold(param1:Boolean) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc5_ = BubbleAsset(_loc3_.asset);
                  _loc5_.textBold = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textColor() : uint
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textColor;
               }
            }
         }
         return 0;
      }
      
      public function set textColor(param1:uint) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  _loc4_.textColor = param1;
               }
            }
         }
      }
      
      public function get textAlpha() : uint
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textAlpha;
               }
            }
         }
         return 0;
      }
      
      public function set textAlpha(param1:uint) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  _loc4_.textAlpha = param1;
               }
            }
         }
      }
      
      public function get textEmbed() : Boolean
      {
         var _loc1_:BubbleAsset = this.singleBubbleAsset;
         return _loc1_ && _loc1_.textEmbed;
      }
      
      public function set textEmbed(param1:Boolean) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  _loc4_.textEmbed = param1;
               }
            }
         }
      }
      
      public function get textFont() : String
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         var _loc1_:String = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  if(_loc1_ == null)
                  {
                     _loc1_ = _loc4_.textFont;
                  }
                  else if(_loc1_ != _loc4_.textFont)
                  {
                     return null;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function set textFont(param1:String) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc5_ = BubbleAsset(_loc3_.asset);
                  _loc5_.textFont = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textItalic() : Boolean
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).textItalic;
               }
            }
         }
         return false;
      }
      
      public function set textItalic(param1:Boolean) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc5_ = BubbleAsset(_loc3_.asset);
                  _loc5_.textItalic = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get textSize() : Number
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         var _loc1_:Number = 0;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  if(_loc1_ == 0)
                  {
                     _loc1_ = _loc4_.textSize;
                  }
                  else if(_loc1_ != _loc4_.textSize)
                  {
                     return 0;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function set textSize(param1:Number) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:ChangeBubbleGroupCommand = null;
         var _loc5_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            _loc4_ = new ChangeBubbleGroupCommand(_viewCollection);
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc5_ = BubbleAsset(_loc3_.asset);
                  _loc5_.textSize = param1;
               }
            }
            _loc4_.execute();
         }
      }
      
      public function get bgAlpha() : Number
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).bgAlpha;
               }
            }
         }
         return 1;
      }
      
      public function set bgAlpha(param1:Number) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  _loc4_.bgAlpha = param1;
               }
            }
         }
      }
      
      public function get bgColor() : uint
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).bgColor;
               }
            }
         }
         return 0;
      }
      
      public function set bgColor(param1:uint) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  _loc4_.bgColor = param1;
               }
            }
         }
      }
      
      public function get verticalPadding() : int
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).verticalPadding;
               }
            }
         }
         return 0;
      }
      
      public function set verticalPadding(param1:int) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  _loc4_.verticalPadding = param1;
               }
            }
         }
      }
      
      public function get horizontalPadding() : int
      {
         var _loc1_:IIterator = null;
         var _loc2_:IAssetView = null;
         if(_viewCollection)
         {
            _loc1_ = _viewCollection.iterator();
            while(_loc1_.hasNext)
            {
               _loc2_ = IAssetView(_loc1_.next);
               if(_loc2_.asset is BubbleAsset)
               {
                  return BubbleAsset(_loc2_.asset).horizontalPadding;
               }
            }
         }
         return 0;
      }
      
      public function set horizontalPadding(param1:int) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:IAssetView = null;
         var _loc4_:BubbleAsset = null;
         if(_viewCollection)
         {
            _loc2_ = _viewCollection.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = IAssetView(_loc2_.next);
               if(_loc3_.asset is BubbleAsset)
               {
                  _loc4_ = BubbleAsset(_loc3_.asset);
                  _loc4_.horizontalPadding = param1;
               }
            }
         }
      }
      
      public function get bubbleSize() : Rectangle
      {
         return null;
      }
      
      public function resizeBubble(param1:Rectangle) : void
      {
      }
      
      public function checkFontSupport(param1:String) : Boolean
      {
         var _loc3_:IIterator = null;
         var _loc4_:IAssetView = null;
         var _loc5_:BubbleAsset = null;
         var _loc6_:String = null;
         if(!param1)
         {
            return false;
         }
         var _loc2_:Font = FontManager.getFontManager().getFontByName(param1);
         if(_loc2_)
         {
            if(_viewCollection)
            {
               _loc3_ = _viewCollection.iterator();
               while(_loc3_.hasNext)
               {
                  _loc4_ = _loc3_.next as IAssetView;
                  if(_loc4_)
                  {
                     _loc5_ = _loc4_.asset as BubbleAsset;
                     if(_loc5_)
                     {
                        _loc6_ = _loc5_.text.replace(NEWLINE_PATTERN,"");
                        if(!_loc2_.hasGlyphs(_loc6_))
                        {
                           return false;
                        }
                     }
                  }
               }
               return true;
            }
         }
         return false;
      }
   }
}
