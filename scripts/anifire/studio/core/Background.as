package anifire.studio.core
{
   import anifire.color.SelectedColor;
   import anifire.constant.AnimeConstants;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.interfaces.IFlippable;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.managers.ColorManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.UtilHashSelectedColor;
   import anifire.util.UtilXmlInfo;
   
   public class Background extends Asset implements IMovable, IColorable, IFlippable
   {
      
      public static var XML_NODE_NAME:String = "bg";
       
      
      private var _isFlipped:Boolean = false;
      
      private var _fromTray:Boolean = false;
      
      protected var _baseVisible:Boolean = true;
      
      protected var _isComposite:Boolean = false;
      
      public function Background(param1:String = "")
      {
         super();
         if(param1 == "")
         {
            param1 = "BG" + this.assetCount;
         }
         this.id = param1;
      }
      
      public function get isComposite() : Boolean
      {
         return this._isComposite;
      }
      
      public function set isComposite(param1:Boolean) : void
      {
         this._isComposite = param1;
      }
      
      public function get baseVisible() : Boolean
      {
         return this._baseVisible;
      }
      
      public function set baseVisible(param1:Boolean) : void
      {
         if(param1 != this._baseVisible)
         {
            this._baseVisible = param1;
            dispatchEvent(new AssetEvent(AssetEvent.BASE_VISIBILITY_CHANGE,this));
         }
      }
      
      function set fromTray(param1:Boolean) : void
      {
         this._fromTray = param1;
      }
      
      function get fromTray() : Boolean
      {
         return this._fromTray;
      }
      
      override public function toString() : String
      {
         return this.thumb.theme.id + "." + this.thumb.id;
      }
      
      override public function convertToXml() : XML
      {
         var childXml:XML = null;
         var i:int = 0;
         var xml:XML = <bg/>;
         try
         {
            xml.@id = this.id;
            xml.@index = 0;
            if(!this._baseVisible)
            {
               xml.@hidden = "Y";
            }
            if(this._isFlipped)
            {
               xml.@xscale = "-1";
            }
            xml.file = this.thumb.theme.id + "." + this.thumb.id;
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
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize bg: " + this.id);
         }
         return xml;
      }
      
      override public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function backgroundThumb_loadImageDataCompleteHandler(param1:CoreEvent) : void
      {
         this.imageData = _thumb.imageData;
      }
      
      public function deSerialize(param1:XML, param2:AnimeScene, param3:Boolean = true) : void
      {
         var _loc8_:XML = null;
         var _loc9_:int = 0;
         var _loc10_:SelectedColor = null;
         var _loc4_:String = UtilXmlInfo.getZipFileNameOfBg(param1.file);
         var _loc5_:String = UtilXmlInfo.getThemeIdFromFileName(_loc4_);
         if(!Console.getConsole().validateThemeStarterAssetId(_loc5_))
         {
            return;
         }
         var _loc6_:String = UtilXmlInfo.getThumbIdFromFileName(_loc4_);
         var _loc7_:BackgroundThumb = ThemeManager.instance.getBackgroundById(_loc5_,_loc6_);
         if(_loc7_)
         {
            _thumb = _loc7_;
            if(param3)
            {
               if(!_loc7_.imageData)
               {
                  _loc7_.loadImageData();
                  _loc7_.addEventListener(CoreEvent.LOAD_THUMB_COMPLETE,this.backgroundThumb_loadImageDataCompleteHandler);
               }
               else
               {
                  this.imageData = _thumb.imageData;
               }
            }
            this.isLoadded = true;
            this.x = AnimeConstants.SCREEN_X;
            this.y = AnimeConstants.SCREEN_Y;
            this.width = AnimeConstants.SCREEN_WIDTH;
            this.height = AnimeConstants.SCREEN_HEIGHT;
            this.scene = param2;
            if(param1.hasOwnProperty("@xscale") && String(param1.@xscale) == "-1")
            {
               this._isFlipped = true;
               this.x = AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH;
            }
            this._baseVisible = param1.@hidden != "Y";
            if(param1.dcsn.length() > 0)
            {
               this.defaultColorSetId = String(param1.dcsn);
               this.defaultColorSet = Thumb(this.thumb).getColorSetById(this.defaultColorSetId);
            }
            customColor = new UtilHashSelectedColor();
            _loc9_ = 0;
            while(_loc9_ < param1.child("color").length())
            {
               _loc8_ = param1.child("color")[_loc9_];
               _loc10_ = new SelectedColor(_loc8_.@r,_loc8_.attribute("oc").length() == 0?uint(uint.MAX_VALUE):uint(_loc8_.@oc),uint(_loc8_));
               this.addCustomColor(_loc8_.@r,_loc10_);
               _loc9_++;
            }
            updateColor();
         }
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var _loc3_:Background = new Background();
         _loc3_.x = this.x;
         _loc3_.y = this.y;
         _loc3_.id = this.id;
         _loc3_.scene = this.scene;
         _loc3_.thumb = this.thumb;
         _loc3_.customColor = this.customColor.clone();
         _loc3_.baseVisible = this._baseVisible;
         if(this.isFlipped)
         {
            _loc3_.flipIt();
         }
         return _loc3_;
      }
      
      override protected function loadAssetImage() : void
      {
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_ASSET_COMPLETE,this));
      }
      
      public function flipIt() : void
      {
         this._isFlipped = !this._isFlipped;
         this.x = !!this._isFlipped?Number(AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_WIDTH):Number(AnimeConstants.SCREEN_X);
         this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_HFLIPPED,this));
      }
      
      public function get isFlipped() : Boolean
      {
         return this._isFlipped;
      }
      
      override public function indent(param1:Number, param2:Number) : void
      {
      }
      
      public function swapWithThumb(param1:BackgroundThumb) : void
      {
         var _loc2_:* = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         if(param1)
         {
            this.thumb = param1;
            if(this.thumb.defaultColor)
            {
               for(_loc2_ in this.thumb.defaultColor)
               {
                  _loc3_ = this.thumb.defaultColor[_loc2_];
                  _loc4_ = ColorManager.instance.getColorByKey(_loc2_);
                  if(_loc4_)
                  {
                     _loc3_ = _loc4_;
                  }
                  customColor.push(_loc2_,new SelectedColor(_loc2_,uint.MAX_VALUE,_loc3_));
               }
            }
            if(this.thumb.imageData)
            {
               this.imageData = this.thumb.imageData;
               this.baseVisible = true;
            }
            else
            {
               this.baseVisible = false;
            }
         }
         else
         {
            this.baseVisible = false;
         }
         dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE,this));
      }
   }
}
