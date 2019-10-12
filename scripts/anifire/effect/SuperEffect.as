package anifire.effect
{
   import anifire.event.EffectEvt;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.utils.ByteArray;
   
   public class SuperEffect extends Sprite
   {
       
      
      private var TEXTFORMAT:TextFormat;
      
      private var _type:String = "";
      
      private var _id:String = "";
      
      private var _imageData:ByteArray;
      
      public function SuperEffect()
      {
         this.TEXTFORMAT = new TextFormat("Blambot Casual",20,0,false,false,false,"","",TextFieldAutoSize.CENTER,0,0,0,0);
         super();
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function showEffect(param1:DisplayObject) : void
      {
      }
      
      public function hideEffect(param1:DisplayObject) : void
      {
      }
      
      public function getFileName(param1:XML) : String
      {
         throw new Error("abstract method should not be call directly");
      }
      
      public function loadThumbnail(param1:ByteArray = null) : DisplayObject
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(this.returnLabel("Effect",200,200,false));
         _loc2_.addEventListener(Event.ENTER_FRAME,this.loadThumbnailComplete);
         return _loc2_;
      }
      
      private function loadThumbnailComplete(param1:Event) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         _loc2_.removeEventListener(Event.ENTER_FRAME,this.loadThumbnailComplete);
         var _loc3_:EffectEvt = new EffectEvt(EffectEvt.LOAD_EFFECT_THUMBNAIL_COMPLETE,this);
         _loc3_.thumbnail = _loc2_;
         this.dispatchEvent(_loc3_);
      }
      
      protected function returnLabel(param1:String, param2:Number, param3:Number, param4:Boolean) : TextField
      {
         var _loc5_:TextField = this.createTextField(0,0,param2,param3,param4,this.TEXTFORMAT);
         _loc5_.name = "label";
         _loc5_.type = TextFieldType.DYNAMIC;
         _loc5_.selectable = false;
         _loc5_.text = param1;
         _loc5_.autoSize = TextFieldAutoSize.CENTER;
         return _loc5_;
      }
      
      private function createTextField(param1:Number, param2:Number, param3:Number, param4:Number, param5:Boolean, param6:TextFormat) : TextField
      {
         var _loc7_:TextField = new TextField();
         _loc7_.x = param1;
         _loc7_.y = param2;
         _loc7_.background = false;
         _loc7_.border = false;
         _loc7_.multiline = true;
         _loc7_.wordWrap = true;
         _loc7_.embedFonts = param5;
         _loc7_.defaultTextFormat = param6;
         return _loc7_;
      }
      
      public function serialize() : XML
      {
         throw new Error("abstract method should not be call directly");
      }
      
      public function deSerialize(param1:XML) : void
      {
         throw new Error("abstract method should not be call directly");
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         throw new Error("abstract method should not be call directly");
      }
      
      public function getSize() : Rectangle
      {
         throw new Error("abstract method should not be call directly");
      }
      
      public function redraw() : void
      {
      }
      
      public function loadEffectImage(param1:ByteArray) : void
      {
         throw new Error("abstract method should not be call directly");
      }
   }
}
