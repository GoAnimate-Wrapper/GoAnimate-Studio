package anifire.studio.components
{
   import mx.events.PropertyChangeEvent;
   import spark.primitives.BitmapImage;
   
   public class SceneTransitionIcon extends BitmapImage
   {
      
      public static const imgNull:Class = SceneTransitionIcon_imgNull;
      
      public static const imgBlinds:Class = SceneTransitionIcon_imgBlinds;
      
      public static const imgFade:Class = SceneTransitionIcon_imgFade;
      
      public static const imgFadeDark:Class = SceneTransitionIcon_imgFadeDark;
      
      public static const imgFly:Class = SceneTransitionIcon_imgFly;
      
      public static const imgIris:Class = SceneTransitionIcon_imgIris;
      
      public static const imgPhoto:Class = SceneTransitionIcon_imgPhoto;
      
      public static const imgPixelDissolve:Class = SceneTransitionIcon_imgPixelDissolve;
      
      public static const imgRotate:Class = SceneTransitionIcon_imgRotate;
      
      public static const imgSqueeze:Class = SceneTransitionIcon_imgSqueeze;
      
      public static const imgWipe:Class = SceneTransitionIcon_imgWipe;
      
      public static const imgWipeHand:Class = SceneTransitionIcon_imgWipeHand;
      
      public static const imgZoom:Class = SceneTransitionIcon_imgZoom;
      
      public static const imgFESScale:Class = SceneTransitionIcon_imgFESScale;
      
      public static const imgCleanHand:Class = SceneTransitionIcon_imgCleanHand;
      
      public static const imgCleanBrush:Class = SceneTransitionIcon_imgCleanBrush;
      
      public static const imgPan:Class = SceneTransitionIcon_imgPan;
      
      public static const imgFESBadTransmission:Class = SceneTransitionIcon_imgFESBadTransmission;
      
      public static const imgFESZoomBlur:Class = SceneTransitionIcon_imgFESZoomBlur;
      
      public static const imgFESBrightSquares_11:Class = SceneTransitionIcon_imgFESBrightSquares_11;
      
      public static const imgFESBrightSquares_13:Class = SceneTransitionIcon_imgFESBrightSquares_13;
      
      public static const imgFESDesertIllusion:Class = SceneTransitionIcon_imgFESDesertIllusion;
      
      public static const imgFESSparkle_1:Class = SceneTransitionIcon_imgFESSparkle_1;
      
      public static const imgFESSparkle_4:Class = SceneTransitionIcon_imgFESSparkle_4;
      
      public static const imgFESUnpack_2:Class = SceneTransitionIcon_imgFESUnpack_2;
      
      public static const imgFESUnpack_1:Class = SceneTransitionIcon_imgFESUnpack_1;
      
      public static const imgFESLightStripes:Class = SceneTransitionIcon_imgFESLightStripes;
      
      public static const imgFESIntersectingStripes_4:Class = SceneTransitionIcon_imgFESIntersectingStripes_4;
      
      public static const imgFESIntersectingStripes_1:Class = SceneTransitionIcon_imgFESIntersectingStripes_1;
      
      public static const imgFESUnpack_8:Class = SceneTransitionIcon_imgFESUnpack_8;
      
      public static const imgFESDisc:Class = SceneTransitionIcon_imgFESDisc;
      
      public static const imgInfoBlinds:Class = SceneTransitionIcon_imgInfoBlinds;
      
      public static const imgInfoIris:Class = SceneTransitionIcon_imgInfoIris;
      
      public static const imgInfoSplit:Class = SceneTransitionIcon_imgInfoSplit;
       
      
      protected var _transitionType:String;
      
      public function SceneTransitionIcon()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionType() : String
      {
         return this._transitionType;
      }
      
      private function set _2003648977transitionType(param1:String) : void
      {
         this._transitionType = param1;
         this.updateIcon();
      }
      
      protected function updateIcon() : void
      {
         var _loc1_:Class = imgNull;
         switch(this._transitionType)
         {
            case "Blinds":
               _loc1_ = imgBlinds;
               break;
            case "CleanHand":
               _loc1_ = imgCleanHand;
               break;
            case "CleanBrush":
               _loc1_ = imgCleanBrush;
               break;
            case "Fade":
               _loc1_ = imgFade;
               break;
            case "FadeDark":
               _loc1_ = imgFadeDark;
               break;
            case "Fly":
               _loc1_ = imgFly;
               break;
            case "Iris":
               _loc1_ = imgIris;
               break;
            case "Pan":
               _loc1_ = imgPan;
               break;
            case "Photo":
               _loc1_ = imgPhoto;
               break;
            case "PixelDissolve":
               _loc1_ = imgPixelDissolve;
               break;
            case "Rotate":
               _loc1_ = imgRotate;
               break;
            case "Squeeze":
               _loc1_ = imgSqueeze;
               break;
            case "Wipe":
               _loc1_ = imgWipe;
               break;
            case "WipeHand":
               _loc1_ = imgWipeHand;
               break;
            case "Zoom":
               _loc1_ = imgZoom;
               break;
            case "FESBadTransmission":
               _loc1_ = imgFESBadTransmission;
               break;
            case "FESBrightSquares_11":
               _loc1_ = imgFESBrightSquares_11;
               break;
            case "FESBrightSquares_13":
               _loc1_ = imgFESBrightSquares_13;
               break;
            case "FESIntersectingStripes_1":
               _loc1_ = imgFESIntersectingStripes_1;
               break;
            case "FESIntersectingStripes_4":
               _loc1_ = imgFESIntersectingStripes_4;
               break;
            case "FESLightStripes":
               _loc1_ = imgFESLightStripes;
               break;
            case "FESScale":
               _loc1_ = imgFESScale;
               break;
            case "FESSparkle_1":
               _loc1_ = imgFESSparkle_1;
               break;
            case "FESSparkle_4":
               _loc1_ = imgFESSparkle_4;
               break;
            case "FESUnpack_2":
               _loc1_ = imgFESUnpack_2;
               break;
            case "FESUnpack_1":
               _loc1_ = imgFESUnpack_1;
               break;
            case "FESUnpack_8":
               _loc1_ = imgFESUnpack_8;
               break;
            case "FESZoomBlur":
               _loc1_ = imgFESZoomBlur;
               break;
            case "FESDisc":
               _loc1_ = imgFESDisc;
               break;
            case "InfoBlinds":
               _loc1_ = imgInfoBlinds;
               break;
            case "InfoIris":
               _loc1_ = imgInfoIris;
               break;
            case "InfoSplit":
               _loc1_ = imgInfoSplit;
         }
         source = _loc1_;
      }
      
      public function set transitionType(param1:String) : void
      {
         var _loc2_:Object = this.transitionType;
         if(_loc2_ !== param1)
         {
            this._2003648977transitionType = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionType",_loc2_,param1));
            }
         }
      }
   }
}
