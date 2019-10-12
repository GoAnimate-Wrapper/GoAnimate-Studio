package anifire.cc.view
{
   import anifire.cc.interfaces.ICcComponent;
   import anifire.interfaces.ISpeak;
   import flash.events.Event;
   
   public class CcMouthComponent extends CcComponent implements ISpeak
   {
       
      
      private var _lipSync:Boolean = false;
      
      private var _lipSyncMouth:CcLipSyncMouth;
      
      private var _talkMouth:CcTalkMouth;
      
      public function CcMouthComponent()
      {
         super();
      }
      
      override public function loadComponent() : void
      {
         this._lipSyncMouth = new CcLipSyncMouth();
         this._lipSyncMouth.visible = false;
         this._lipSyncMouth.init(this.model);
         this._lipSyncMouth.addEventListener(Event.COMPLETE,this.onLipSyncMouthLoaded);
         this._lipSyncMouth.loadComponent();
         addChild(this._lipSyncMouth);
         this._talkMouth = new CcTalkMouth();
         this._talkMouth.visible = false;
         this._talkMouth.init(this.model);
         this._talkMouth.loadComponent();
         addChild(this._talkMouth);
      }
      
      private function hideAllMouths() : void
      {
         if(this._lipSyncMouth)
         {
            this._lipSyncMouth.visible = false;
         }
         if(this._talkMouth)
         {
            this._talkMouth.visible = false;
         }
         if(loader)
         {
            loader.visible = false;
         }
      }
      
      public function set useTalkMouth(param1:Boolean) : void
      {
         if(this._lipSyncMouth && this._talkMouth)
         {
            this.hideAllMouths();
            this._talkMouth.visible = param1;
            loader.visible = !param1;
         }
      }
      
      private function onLipSyncMouthLoaded(param1:Event) : void
      {
         this.lipSync = this._lipSync;
         super.loadComponent();
      }
      
      private function set lipSync(param1:Boolean) : void
      {
         if(this._lipSync != param1)
         {
            this._lipSync = param1;
            if(this._lipSyncMouth == null)
            {
               this._lipSyncMouth = new CcLipSyncMouth();
               this._lipSyncMouth.init(this.model);
               this._lipSyncMouth.loadComponent();
               addChild(this._lipSyncMouth);
            }
            this.hideAllMouths();
            this._lipSyncMouth.visible = param1;
            loader.visible = !param1;
         }
      }
      
      override public function reset(param1:ICcComponent) : void
      {
         super.reset(param1);
         if(this._lipSyncMouth)
         {
            this._lipSyncMouth.reset(param1);
         }
         if(this._talkMouth)
         {
            this._talkMouth.reset(param1);
         }
         this.lipSync = false;
      }
      
      public function speak(param1:Number) : void
      {
         this.lipSync = param1 != -1;
         if(this._lipSync && this._lipSyncMouth)
         {
            this._lipSyncMouth.speak(param1);
         }
      }
   }
}
