package anifire.studio.assets.views
{
   import anifire.interfaces.IIterator;
   import anifire.iterators.ArrayIterator;
   import anifire.studio.assets.image.AssetImageBase;
   import anifire.studio.core.Asset;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.Thumb;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IAssetCollection;
   import anifire.studio.interfaces.IAssetView;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import mx.core.DragSource;
   import mx.core.UIComponent;
   import mx.events.DragEvent;
   import mx.managers.DragManager;
   
   public class AssetEditor extends UIComponent implements IAssetView, IAssetCollection
   {
      
      protected static var _highlightFilter:GlowFilter = new GlowFilter(16742400,1,6,6,5);
       
      
      protected var _highlight:Boolean;
      
      protected var _assetView:AssetView;
      
      private var _shouldAcceptDragDrop:Boolean;
      
      public function AssetEditor(param1:AssetView)
      {
         super();
         this._assetView = param1;
         addChild(this._assetView);
         this.init();
      }
      
      protected function init() : void
      {
         if(!(this._assetView is BubbleAssetView))
         {
            mouseChildren = false;
         }
         this._assetView.addEventListener(MouseEvent.MOUSE_DOWN,this.onAssetViewMouseDown);
         addEventListener(MouseEvent.ROLL_OVER,this.rollOverHandler);
         addEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         addEventListener(DragEvent.DRAG_ENTER,this.dragEnterHandler);
         addEventListener(DragEvent.DRAG_DROP,this.dragDropHandler);
         addEventListener(DragEvent.DRAG_EXIT,this.dragExitHandler);
      }
      
      public function get highlight() : Boolean
      {
         return this._highlight;
      }
      
      public function set highlight(param1:Boolean) : void
      {
         if(this._highlight != param1)
         {
            this._highlight = param1;
            this.updateFilters();
         }
      }
      
      protected function updateFilters() : void
      {
         var _loc1_:Array = [];
         if(this._highlight)
         {
            _loc1_.push(_highlightFilter);
         }
         filters = _loc1_;
      }
      
      protected function onAssetViewMouseDown(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         dispatchEvent(param1);
      }
      
      override public function getBounds(param1:DisplayObject) : Rectangle
      {
         var _loc2_:ProgramEffectAsset = this.asset as ProgramEffectAsset;
         if(_loc2_ && _loc2_.isCamera)
         {
            return new Rectangle(_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
         }
         return super.getBounds(param1);
      }
      
      public function addAsset(param1:IAssetCollection) : Boolean
      {
         return false;
      }
      
      public function removeAsset(param1:IAssetCollection) : Boolean
      {
         return false;
      }
      
      public function clearCollection() : void
      {
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         return new ArrayIterator([this]);
      }
      
      public function startProcess(param1:Boolean = false, param2:Number = 0) : void
      {
         this.loadImage();
      }
      
      public function loadImage() : void
      {
         if(this._assetView)
         {
            this._assetView.loadImage();
         }
      }
      
      public function get asset() : Asset
      {
         return !!this._assetView?this._assetView.asset:null;
      }
      
      public function get assetImage() : AssetImageBase
      {
         return !!this._assetView?this._assetView.assetImage:null;
      }
      
      public function destroy(param1:String = "rip") : void
      {
         removeEventListener(MouseEvent.ROLL_OVER,this.rollOverHandler);
         removeEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         removeEventListener(DragEvent.DRAG_ENTER,this.dragEnterHandler);
         removeEventListener(DragEvent.DRAG_DROP,this.dragDropHandler);
         removeEventListener(DragEvent.DRAG_EXIT,this.dragExitHandler);
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         }
         if(this._assetView)
         {
            this._assetView.removeEventListener(MouseEvent.MOUSE_DOWN,this.onAssetViewMouseDown);
         }
         if(this._assetView)
         {
            this._assetView.removeEventListener(AssetViewEvent.VIEW_CHANGE,this.onAssetViewChange);
            this._assetView.destroy();
            if(contains(this._assetView))
            {
               removeChild(this._assetView);
            }
            this._assetView = null;
         }
      }
      
      protected function onAssetViewChange(param1:AssetViewEvent) : void
      {
      }
      
      public function goToAndPause(param1:Number) : void
      {
         this.pause();
      }
      
      public function pause() : void
      {
         if(this._assetView)
         {
            this._assetView.pause();
         }
      }
      
      public function resume() : void
      {
         if(this._assetView)
         {
            this._assetView.resume();
         }
      }
      
      protected function rollOverHandler(param1:MouseEvent) : void
      {
         var _loc3_:PropThumb = null;
         var _loc4_:CharThumb = null;
         this._shouldAcceptDragDrop = false;
         if(param1.buttonDown == false)
         {
            this.highlight = true;
         }
         var _loc2_:Character = this.asset as Character;
         if(_loc2_)
         {
            if(Console.getConsole().currDragObject is Prop)
            {
               _loc3_ = Prop(Console.getConsole().currDragObject).thumb as PropThumb;
               _loc4_ = _loc2_.thumb as CharThumb;
               if(_loc3_ && _loc4_)
               {
                  this._shouldAcceptDragDrop = _loc4_.checkPropAttachmentSupport(_loc3_);
                  this.highlight = this._shouldAcceptDragDrop;
               }
            }
         }
      }
      
      protected function rollOutHandler(param1:MouseEvent) : void
      {
         if(param1.buttonDown == false)
         {
            this.highlight = false;
         }
         if(this.asset is Character && Console.getConsole().currDragObject is Prop)
         {
            this.highlight = false;
         }
         this._shouldAcceptDragDrop = false;
      }
      
      protected function mouseUpHandler(param1:MouseEvent) : void
      {
         if(this._shouldAcceptDragDrop && this.asset is Character)
         {
            this._shouldAcceptDragDrop = false;
            Character(this.asset).doMouseUp(param1);
         }
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc3_:PropThumb = null;
         this.highlight = false;
         var _loc2_:Prop = this.asset as Prop;
         if(_loc2_)
         {
            _loc3_ = _loc2_.thumb as PropThumb;
            if(_loc3_)
            {
               if(_loc3_.holdable || _loc3_.wearable)
               {
                  mouseEnabled = false;
                  Console.getConsole().currDragObject = _loc2_;
                  stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
               }
            }
         }
      }
      
      protected function onStageMouseUp(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         mouseEnabled = true;
         Console.getConsole().currDragObject = null;
      }
      
      protected function dragEnterHandler(param1:DragEvent) : void
      {
         var _loc3_:Thumb = null;
         var _loc4_:Boolean = false;
         var _loc5_:Character = null;
         var _loc6_:PropThumb = null;
         var _loc7_:CharThumb = null;
         var _loc2_:DragSource = param1.dragSource;
         if(_loc2_ && _loc2_.hasFormat(Thumb.DRAG_DATA_FORMAT))
         {
            _loc3_ = _loc2_.dataForFormat(Thumb.DRAG_DATA_FORMAT) as Thumb;
            _loc5_ = this.asset as Character;
            if(_loc5_ && !_loc5_.isMotionShadow())
            {
               _loc6_ = _loc3_ as PropThumb;
               _loc7_ = _loc5_.thumb as CharThumb;
               if(_loc6_ && _loc7_)
               {
                  _loc4_ = _loc7_.checkPropAttachmentSupport(_loc6_);
               }
            }
            if(_loc4_)
            {
               DragManager.acceptDragDrop(this);
               DragManager.showFeedback(DragManager.LINK);
               this.highlight = true;
            }
         }
      }
      
      protected function dragDropHandler(param1:DragEvent) : void
      {
         var _loc3_:Thumb = null;
         var _loc2_:DragSource = param1.dragSource;
         if(_loc2_ && _loc2_.hasFormat(Thumb.DRAG_DATA_FORMAT))
         {
            _loc3_ = _loc2_.dataForFormat(Thumb.DRAG_DATA_FORMAT) as Thumb;
            if(this.asset is Character)
            {
               this.highlight = false;
               if(_loc3_ is PropThumb)
               {
                  Character(this.asset).addPropOnDragDrop(param1);
               }
            }
         }
      }
      
      protected function dragExitHandler(param1:DragEvent) : void
      {
         this.highlight = false;
      }
   }
}
