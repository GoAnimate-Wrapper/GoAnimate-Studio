package anifire.studio.models
{
   import anifire.util.UtilDict;
   import mx.events.PropertyChangeEvent;
   import mx.utils.StringUtil;
   
   public class CommunitySearchGroupCollection extends ProductGroupCollection
   {
       
      
      protected var _1468257167_props:PropCollection;
      
      protected var _1029615430_backgrounds:BackgroundCollection;
      
      public function CommunitySearchGroupCollection(param1:Array = null)
      {
         super(param1);
         this._props = new PropCollection("Props");
         this._props.productFilter = this._props.isProp;
         this._backgrounds = new BackgroundCollection("Backgrounds");
         this._backgrounds.productFilter = this._backgrounds.isBackground;
         addCollection(this._props);
         addCollection(this._backgrounds);
      }
      
      public function set keyword(param1:String) : void
      {
         var _loc2_:String = StringUtil.substitute(UtilDict.toDisplay("go","No result for \'{0}\'"),param1);
         this._props.emptyMessage = _loc2_;
         this._backgrounds.emptyMessage = _loc2_;
      }
      
      public function showIndex(param1:int) : void
      {
         this._props.valid = param1 == 0;
         this._backgrounds.valid = param1 == 1;
      }
      
      [Bindable(event="propertyChange")]
      protected function get _props() : PropCollection
      {
         return this._1468257167_props;
      }
      
      protected function set _props(param1:PropCollection) : void
      {
         var _loc2_:Object = this._1468257167_props;
         if(_loc2_ !== param1)
         {
            this._1468257167_props = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_props",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _backgrounds() : BackgroundCollection
      {
         return this._1029615430_backgrounds;
      }
      
      protected function set _backgrounds(param1:BackgroundCollection) : void
      {
         var _loc2_:Object = this._1029615430_backgrounds;
         if(_loc2_ !== param1)
         {
            this._1029615430_backgrounds = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_backgrounds",_loc2_,param1));
            }
         }
      }
   }
}
