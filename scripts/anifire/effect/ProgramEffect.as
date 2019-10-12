package anifire.effect
{
   import anifire.event.AddedToStage;
   import anifire.event.CoreEvent;
   import anifire.event.EffectEvt;
   import anifire.event.LoadMgrEvent;
   import anifire.util.UtilLoadMgr;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class ProgramEffect extends SuperEffect
   {
       
      
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _width:Number = 200;
      
      private var _height:Number = 100;
      
      private var _rotation:Number = 0;
      
      private var _text:String = "";
      
      protected var boundHeight:Number = 100;
      
      protected var boundWidth:Number = 100;
      
      protected var content:Sprite = null;
      
      protected var body:Sprite = null;
      
      protected var thumbnailSymbol:Class;
      
      private var addedToStage:AddedToStage;
      
      public function ProgramEffect()
      {
         super();
         this.content = new Sprite();
         this.content.name = "content";
         addChild(this.content);
         try
         {
            addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
            return;
         }
         catch(e:Error)
         {
            addedToStage = new AddedToStage(this);
            addedToStage.addEventListener(CoreEvent.ADDED_TO_STAGE_BY_TIMER,addedToStageHandler);
            return;
         }
      }
      
      override public function showEffect(param1:DisplayObject) : void
      {
      }
      
      override public function hideEffect(param1:DisplayObject) : void
      {
      }
      
      override public function get x() : Number
      {
         return this._x;
      }
      
      override public function get y() : Number
      {
         return this._y;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      override public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      override public function set y(param1:Number) : void
      {
         this._y = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         redraw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         redraw();
      }
      
      public function set text(param1:String) : void
      {
         this._text = param1;
      }
      
      override public function getSize() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         _loc1_.x = this._x;
         _loc1_.y = this._y;
         _loc1_.width = this._width;
         _loc1_.height = this._height;
         return _loc1_;
      }
      
      override public function loadEffectImage(param1:ByteArray) : void
      {
         var _loc2_:EffectEvt = new EffectEvt(EffectEvt.LOAD_EFFECT_COMPLETE,this);
         this.dispatchEvent(_loc2_);
      }
      
      override public function setSize(param1:Number, param2:Number) : void
      {
         this._width = param1;
         this._height = param2;
         redraw();
      }
      
      override public function serialize() : XML
      {
         return null;
      }
      
      override public function deSerialize(param1:XML) : void
      {
         this._x = 0;
         this._y = 0;
         this._width = param1.@w;
         this._height = param1.@h;
         this._rotation = param1.@rotate;
         type = param1.@type;
         id = param1.@id;
         redraw();
      }
      
      override public function loadThumbnail(param1:ByteArray = null) : DisplayObject
      {
         var _loc2_:DisplayObject = new this.thumbnailSymbol() as DisplayObject;
         var _loc3_:Timer = new Timer(100,1);
         var _loc4_:UtilLoadMgr = new UtilLoadMgr();
         _loc4_.addEventDispatcher(_loc3_,TimerEvent.TIMER_COMPLETE);
         _loc4_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.loadThumbnailComplete);
         _loc4_.setExtraData(_loc2_);
         _loc4_.commit();
         _loc3_.start();
         return _loc2_;
      }
      
      private function loadThumbnailComplete(param1:LoadMgrEvent) : void
      {
         var _loc2_:DisplayObject = (param1.target as UtilLoadMgr).getExtraData() as DisplayObject;
         _loc2_.removeEventListener(Event.ENTER_FRAME,this.loadThumbnailComplete);
         var _loc3_:EffectEvt = new EffectEvt(EffectEvt.LOAD_EFFECT_THUMBNAIL_COMPLETE,this);
         _loc3_.thumbnail = _loc2_;
         this.dispatchEvent(_loc3_);
      }
      
      override public function getFileName(param1:XML) : String
      {
         return null;
      }
      
      protected function updateVerticalAlign() : void
      {
      }
      
      protected function drawBody() : void
      {
      }
      
      protected function drawLabel() : void
      {
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         var _loc2_:AddedToStage = null;
         if(param1.target is AddedToStage)
         {
            _loc2_ = param1.target as AddedToStage;
            if(_loc2_ && _loc2_.hasEventListener(CoreEvent.ADDED_TO_STAGE_BY_TIMER))
            {
               _loc2_.removeEventListener(CoreEvent.ADDED_TO_STAGE_BY_TIMER,this.addedToStageHandler);
            }
         }
         redraw();
      }
   }
}
