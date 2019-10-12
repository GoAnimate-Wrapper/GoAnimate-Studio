package anifire.component
{
   import anifire.constant.AnimeConstants;
   import anifire.event.VideoNetStreamEvent;
   import flash.display.Sprite;
   import flash.events.AsyncErrorEvent;
   import flash.events.NetStatusEvent;
   import flash.media.Video;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   import flash.utils.setTimeout;
   
   public class VideoPlayback extends Sprite
   {
       
      
      private var nc:NetConnection;
      
      private var ns:NetStream;
      
      private var vid:Video;
      
      public function VideoPlayback()
      {
         super();
         this.nc = new NetConnection();
         this.nc.connect(null);
         this.nc.addEventListener(NetStatusEvent.NET_STATUS,this.showStatus);
         this.ns = new NetStream(this.nc);
         this.ns.addEventListener(NetStatusEvent.NET_STATUS,this.showStatus);
         this.vid = new Video();
      }
      
      private function showStatus(param1:NetStatusEvent) : void
      {
      }
      
      private function correctVideoScaling(param1:VideoNetStreamEvent) : void
      {
         var _loc2_:Number = param1.playhead;
         this.removeEventListener(VideoNetStreamEvent.VIDEO_START_TO_PLAY,this.correctVideoScaling);
         this.vid.width = this.vid.videoWidth;
         this.vid.height = this.vid.videoHeight;
         this.vid.x = -1 * this.vid.width / 2;
         this.vid.y = -1 * this.vid.height / 2;
         this.vid.visible = true;
         this.pause();
         this.seekAndPlay(_loc2_);
      }
      
      private function doDetectWhenVideoStartPlay(param1:Number) : void
      {
         var _loc2_:VideoNetStreamEvent = null;
         if(this.vid.videoHeight > 0 || this.vid.videoWidth > 0)
         {
            _loc2_ = new VideoNetStreamEvent(VideoNetStreamEvent.VIDEO_START_TO_PLAY,this);
            _loc2_.playhead = param1;
            this.dispatchEvent(_loc2_);
         }
         else
         {
            setTimeout(this.doDetectWhenVideoStartPlay,AnimeConstants.FRAME_PER_SEC,param1);
         }
      }
      
      private function asyncErrorHandler(param1:AsyncErrorEvent) : void
      {
      }
      
      public function seekAndPlay(param1:Number) : void
      {
         this.ns.seek(param1);
         this.play();
      }
      
      public function play() : void
      {
         this.ns.resume();
      }
      
      public function pause() : void
      {
         this.ns.pause();
      }
      
      public function reset() : void
      {
      }
   }
}
