package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.event.CoreEvent;
   
   public class VideoPropThumb extends PropThumb
   {
       
      
      private var _videoHeight:Number;
      
      private var _videoWidth:Number;
      
      public function VideoPropThumb()
      {
         super();
         this.initValues();
      }
      
      public static function renameExtensionToPNG(param1:String) : String
      {
         return param1.substring(0,param1.length - 4).concat(".png");
      }
      
      public function get videoHeight() : Number
      {
         return this._videoHeight;
      }
      
      public function get videoWidth() : Number
      {
         return this._videoWidth;
      }
      
      public function set videoHeight(param1:Number) : void
      {
         this._videoHeight = param1;
      }
      
      public function set videoWidth(param1:Number) : void
      {
         this._videoWidth = param1;
      }
      
      protected function initValues() : void
      {
         subType = AnimeConstants.ASSET_TYPE_PROP_VIDEO;
         placeable = true;
         holdable = false;
         headable = false;
         facing = AnimeConstants.FACING_LEFT;
      }
      
      override public function deSerialize(param1:XML, param2:Theme) : void
      {
         super.deSerialize(param1,param2);
         this.setFileName(renameExtensionToPNG(this.getFileName()));
         _videoThumbnailUrl = param1.@thumbnail_url;
         this.videoWidth = Number(param1.@width);
         this.videoHeight = Number(param1.@height);
      }
      
      public function deserializeJson(param1:Object) : void
      {
         id = param1["file"];
         encAssetId = param1["enc_asset_id"];
         name = param1["title"];
         tags = param1["tags"];
         this.videoWidth = param1["width"];
         this.videoHeight = param1["height"];
         setFileName(renameExtensionToPNG(param1["file"]));
      }
      
      public function serializeForPreviewPlayer() : XML
      {
         var _loc1_:XML = <prop/>;
         _loc1_.@id = id;
         _loc1_.@name = name;
         _loc1_.@width = this.videoWidth;
         _loc1_.@height = this.videoHeight;
         _loc1_.@subtype = "video";
         return _loc1_;
      }
      
      override public function set imageData(param1:Object) : void
      {
         super.imageData = param1;
         if(param1)
         {
            dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
         }
      }
   }
}
