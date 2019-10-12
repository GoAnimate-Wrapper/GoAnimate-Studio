package anifire.cc.view
{
   import anifire.cc.model.CcMouthModel;
   import anifire.component.CcComponentLoader;
   import anifire.event.SpeechPitchEvent;
   import flash.display.MovieClip;
   
   public class CcLipSyncMouth extends CcComponent
   {
       
      
      private var _pitchEvent:SpeechPitchEvent;
      
      public function CcLipSyncMouth()
      {
         this._pitchEvent = new SpeechPitchEvent(SpeechPitchEvent.PITCH);
         super();
      }
      
      override protected function getComponentLoader() : CcComponentLoader
      {
         var _loc1_:CcComponentLoader = null;
         var _loc2_:String = null;
         if(this.model)
         {
            _loc2_ = this.model.url;
            if(this.model is CcMouthModel)
            {
               _loc2_ = CcMouthModel(this.model).lipsyncMouthUrl;
            }
            _loc1_ = CcComponentLoader.getComponentLoader(_loc2_,_loc2_);
         }
         return _loc1_;
      }
      
      public function speak(param1:Number) : void
      {
         if(loader && MovieClip(loader.content))
         {
            this._pitchEvent = new SpeechPitchEvent(SpeechPitchEvent.PITCH);
            this._pitchEvent.value = param1;
            MovieClip(loader.content).dispatchEvent(this._pitchEvent);
         }
      }
   }
}
