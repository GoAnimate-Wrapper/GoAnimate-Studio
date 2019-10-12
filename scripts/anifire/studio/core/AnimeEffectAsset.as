package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.errors.SerializeError;
   import anifire.util.Util;
   import anifire.util.UtilErrorLogger;
   
   public class AnimeEffectAsset extends EffectAsset
   {
       
      
      public function AnimeEffectAsset(param1:String = null)
      {
         super(param1);
      }
      
      override public function get x() : Number
      {
         return AnimeConstants.SCREEN_X;
      }
      
      override public function get y() : Number
      {
         return AnimeConstants.SCREEN_Y;
      }
      
      override public function convertToXml() : XML
      {
         var index:uint = 0;
         var xml:XML = new XML("<" + XML_NODE_NAME + "/>");
         try
         {
            index = this.scene.getOverallOrdering(this);
            xml.@id = id;
            xml.@index = index;
            xml.appendChild(this.effect.serialize());
            xml.x = Util.roundNum(this.x);
            xml.y = Util.roundNum(this.y);
            xml.xscale = 1;
            xml.yscale = 1;
            if(!this.spanWholeScene)
            {
               if(this.startFrame <= this.scene.totalFrames && this.endFrame <= this.scene.totalFrames)
               {
                  xml.st = this.startFrame;
                  xml.et = this.endFrame;
               }
            }
            xml.file = this.thumb.theme.id + "." + this.effect.id;
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize anime effect: " + this.id);
            UtilErrorLogger.getInstance().appendCustomError("AnimeEffectAsset:convert",e);
         }
         return xml;
      }
      
      override public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
      {
         var effectAsset:AnimeEffectAsset = null;
         var addSceneFlag:Boolean = param1;
         var targetScene:AnimeScene = param2;
         try
         {
            effectAsset = new AnimeEffectAsset();
            effectAsset.id = this.id;
            effectAsset.x = this.x;
            effectAsset.y = this.y;
            effectAsset.startFrame = this.startFrame;
            effectAsset.endFrame = this.endFrame;
            if(effectAsset._myEffectXML == null)
            {
               effectAsset._myEffectXML = this.effect.serialize();
            }
            effectAsset._myEffectXML.@w = this.effect.width;
            effectAsset._myEffectXML.@h = this.effect.height;
            effectAsset.scene = this.scene;
            effectAsset.thumb = this.thumb;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("AnimeEffectAsset:clone",e);
         }
         return effectAsset;
      }
   }
}
