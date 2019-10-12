package anifire.studio.components
{
   import flash.events.Event;
   import mx.events.EffectEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.List;
   import spark.components.Scroller;
   
   public class SoundVariationList extends List
   {
       
      
      protected var _1056137847_listExpand:Boolean;
      
      public function SoundVariationList()
      {
         super();
      }
      
      public function get listExpand() : Boolean
      {
         return this._listExpand;
      }
      
      public function set listExpand(param1:Boolean) : void
      {
         this._listExpand = param1;
      }
      
      public function openVariationList() : void
      {
         this._listExpand = true;
         invalidateSkinState();
      }
      
      public function closeVariationList() : void
      {
         this._listExpand = false;
         invalidateSkinState();
      }
      
      private function scroller_effectEndHandler(param1:Event) : void
      {
         if(!this._listExpand)
         {
            this.dispatchEvent(new EffectEvent(EffectEvent.EFFECT_END));
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         return !!this.listExpand?"normal":"closed";
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param1 == "scroller")
         {
            Scroller(param2).addEventListener(EffectEvent.EFFECT_END,this.scroller_effectEndHandler);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param1 == "scroller")
         {
            Scroller(param2).removeEventListener(EffectEvent.EFFECT_END,this.scroller_effectEndHandler);
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _listExpand() : Boolean
      {
         return this._1056137847_listExpand;
      }
      
      protected function set _listExpand(param1:Boolean) : void
      {
         var _loc2_:Object = this._1056137847_listExpand;
         if(_loc2_ !== param1)
         {
            this._1056137847_listExpand = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_listExpand",_loc2_,param1));
            }
         }
      }
   }
}
