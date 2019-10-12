package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.geom.AlignmentEdge;
   import anifire.geom.AlignmentTool;
   import anifire.util.UtilMath;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.Label;
   import spark.core.SpriteVisualElement;
   
   public class SceneAlignGuide extends Group
   {
       
      
      private var _1262384555gridLayer:SpriteVisualElement;
      
      private var _1055665116textLayer:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _alignTool:AlignmentTool;
      
      public function SceneAlignGuide()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._SceneAlignGuide_SpriteVisualElement1_i(),this._SceneAlignGuide_Group2_i()];
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function redrawAlignGuide(param1:AlignmentTool, param2:Array, param3:Rectangle) : void
      {
         var _loc4_:Rectangle = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:AlignmentEdge = null;
         var _loc8_:AlignmentEdge = null;
         var _loc9_:Point = null;
         this._alignTool = param1;
         this.gridLayer.graphics.clear();
         this.gridLayer.graphics.lineStyle(param1.scaleFactor,5405190,0.5,true);
         _loc7_ = param1.edgeWithSameVerticalEdge;
         if(_loc7_)
         {
            _loc5_ = new Point(param1.snappedPosition.x,param3.top);
            _loc6_ = new Point(param1.snappedPosition.x,param3.bottom);
            _loc4_ = _loc7_.rect;
            _loc5_.y = Math.min(_loc5_.y,_loc4_.top);
            _loc6_.y = Math.max(_loc6_.y,_loc4_.bottom);
            if(_loc7_.id == "camera" || _loc7_.id == "ruleOfThirds")
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,3698594,0.5,true);
            }
            else if(_loc7_.id == "oldPosition")
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,11184810,0.5,true);
            }
            else
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,5405190,0.5,true);
            }
            this.gridLayer.graphics.moveTo(AnimeConstants.STAGE_PADDING + _loc5_.x,AnimeConstants.STAGE_PADDING + _loc5_.y);
            this.gridLayer.graphics.lineTo(AnimeConstants.STAGE_PADDING + _loc6_.x,AnimeConstants.STAGE_PADDING + _loc6_.y);
         }
         _loc8_ = param1.edgeWithSameHorizontalEdge;
         if(_loc8_)
         {
            _loc5_ = new Point(param3.left,param1.snappedPosition.y);
            _loc6_ = new Point(param3.right,param1.snappedPosition.y);
            _loc4_ = _loc8_.rect;
            _loc5_.x = Math.min(_loc5_.x,_loc4_.left);
            _loc6_.x = Math.max(_loc6_.x,_loc4_.right);
            if(_loc8_.id == "camera" || _loc8_.id == "ruleOfThirds")
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,3698594,0.5,true);
            }
            else if(_loc8_.id == "oldPosition")
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,11184810,0.5,true);
            }
            else
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,5405190,0.5,true);
            }
            this.gridLayer.graphics.moveTo(AnimeConstants.STAGE_PADDING + _loc5_.x,AnimeConstants.STAGE_PADDING + _loc5_.y);
            this.gridLayer.graphics.lineTo(AnimeConstants.STAGE_PADDING + _loc6_.x,AnimeConstants.STAGE_PADDING + _loc6_.y);
         }
         if(_loc7_ && _loc7_.id == "ruleOfThirds")
         {
            if(_loc7_.rect.width >= 80 * param1.scaleFactor)
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,3698594,0.5,true);
               this.drawRuleOfThirds(_loc7_.rect);
            }
         }
         else if(_loc8_ && _loc8_.id == "ruleOfThirds")
         {
            if(_loc8_.rect.width >= 80 * param1.scaleFactor)
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,3698594,0.5,true);
               this.drawRuleOfThirds(_loc8_.rect);
            }
         }
         if(_loc7_ && _loc7_.id == "camera")
         {
            if(_loc7_.rect.width >= 80 * param1.scaleFactor)
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,3698594,0.5,true);
               _loc9_ = UtilMath.getCenter(_loc7_.rect);
               this.drawCross(_loc9_.x,_loc9_.y);
            }
         }
         else if(_loc8_ && _loc8_.id == "camera")
         {
            if(_loc8_.rect.width >= 80 * param1.scaleFactor)
            {
               this.gridLayer.graphics.lineStyle(param1.scaleFactor,3698594,0.5,true);
               _loc9_ = UtilMath.getCenter(_loc8_.rect);
               this.drawCross(_loc9_.x,_loc9_.y);
            }
         }
         if(_loc7_ && _loc7_.id == "oldPosition")
         {
            this.gridLayer.graphics.lineStyle(param1.scaleFactor,11184810,0.5,true);
            _loc9_ = UtilMath.getCenter(_loc7_.rect);
            this.drawCross(_loc9_.x,_loc9_.y);
         }
         else if(_loc8_ && _loc8_.id == "oldPosition")
         {
            this.gridLayer.graphics.lineStyle(param1.scaleFactor,11184810,0.5,true);
            _loc9_ = UtilMath.getCenter(_loc8_.rect);
            this.drawCross(_loc9_.x,_loc9_.y);
         }
      }
      
      private function drawRuleOfThirds(param1:Rectangle) : void
      {
         this.drawCross(param1.x + param1.width / 3,param1.y + param1.height / 3);
         this.drawCross(param1.x + param1.width / 3,param1.y + 2 * param1.height / 3);
         this.drawCross(param1.x + 2 * param1.width / 3,param1.y + param1.height / 3);
         this.drawCross(param1.x + 2 * param1.width / 3,param1.y + 2 * param1.height / 3);
      }
      
      private function drawCross(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = 15 * this._alignTool.scaleFactor;
         this.gridLayer.graphics.moveTo(AnimeConstants.STAGE_PADDING + param1,AnimeConstants.STAGE_PADDING + param2 - _loc3_);
         this.gridLayer.graphics.lineTo(AnimeConstants.STAGE_PADDING + param1,AnimeConstants.STAGE_PADDING + param2 + _loc3_);
         this.gridLayer.graphics.moveTo(AnimeConstants.STAGE_PADDING + param1 - _loc3_,AnimeConstants.STAGE_PADDING + param2);
         this.gridLayer.graphics.lineTo(AnimeConstants.STAGE_PADDING + param1 + _loc3_,AnimeConstants.STAGE_PADDING + param2);
      }
      
      public function redrawSpacingGuide(param1:AlignmentTool) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Rectangle = null;
         var _loc4_:uint = 0;
         this.textLayer.removeAllElements();
         this.gridLayer.graphics.lineStyle(param1.scaleFactor,5405190,0.5,true);
         if(param1.rectsWithEqualHorizontalSpacing.length > 1)
         {
            _loc4_ = 1;
            while(_loc4_ < param1.rectsWithEqualHorizontalSpacing.length)
            {
               _loc2_ = param1.rectsWithEqualHorizontalSpacing[_loc4_ - 1] as Rectangle;
               _loc3_ = param1.rectsWithEqualHorizontalSpacing[_loc4_] as Rectangle;
               this.drawHorizontalSpacingMarking(_loc2_,_loc3_);
               _loc4_++;
            }
         }
         if(param1.rectsWithEqualVerticalSpacing.length > 1)
         {
            _loc4_ = 1;
            while(_loc4_ < param1.rectsWithEqualVerticalSpacing.length)
            {
               _loc2_ = param1.rectsWithEqualVerticalSpacing[_loc4_ - 1] as Rectangle;
               _loc3_ = param1.rectsWithEqualVerticalSpacing[_loc4_] as Rectangle;
               this.drawVerticalSpacingMarking(_loc2_,_loc3_);
               _loc4_++;
            }
         }
      }
      
      private function drawHorizontalSpacingMarking(param1:Rectangle, param2:Rectangle) : void
      {
         var _loc3_:Number = Math.max(param1.top,param2.top);
         var _loc4_:Number = Math.min(param1.bottom,param2.bottom);
         var _loc5_:Number = Math.min(_loc3_,_loc4_) + Math.abs(_loc3_ - _loc4_) / 2;
         var _loc6_:Number = Math.min(param1.right,param2.right);
         var _loc7_:Number = Math.max(param1.left,param2.left);
         this.drawHorizontalArrow(AnimeConstants.STAGE_PADDING + _loc6_,AnimeConstants.STAGE_PADDING + _loc5_,AnimeConstants.STAGE_PADDING + _loc7_,AnimeConstants.STAGE_PADDING + _loc5_);
      }
      
      private function drawVerticalSpacingMarking(param1:Rectangle, param2:Rectangle) : void
      {
         var _loc3_:Number = Math.min(param1.right,param2.right);
         var _loc4_:Number = Math.max(param1.left,param2.left);
         var _loc5_:Number = Math.min(_loc3_,_loc4_) + Math.abs(_loc3_ - _loc4_) / 2;
         var _loc6_:Number = Math.min(param1.bottom,param2.bottom);
         var _loc7_:Number = Math.max(param1.top,param2.top);
         this.drawVerticalArrow(AnimeConstants.STAGE_PADDING + _loc5_,AnimeConstants.STAGE_PADDING + _loc6_,AnimeConstants.STAGE_PADDING + _loc5_,AnimeConstants.STAGE_PADDING + _loc7_);
      }
      
      private function drawHorizontalArrow(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = 5 * this._alignTool.scaleFactor;
         if(param3 - param1 < _loc5_ * 2)
         {
            this.gridLayer.graphics.moveTo(param1,param2 - _loc5_ * 2);
            this.gridLayer.graphics.lineTo(param1,param2 + _loc5_ * 2);
            this.gridLayer.graphics.moveTo(param1 - _loc5_,param2 - _loc5_ / 2);
            this.gridLayer.graphics.lineTo(param1,param2);
            this.gridLayer.graphics.lineTo(param1 - _loc5_,param2 + _loc5_ / 2);
            this.gridLayer.graphics.moveTo(param3,param4 - _loc5_ * 2);
            this.gridLayer.graphics.lineTo(param3,param4 + _loc5_ * 2);
            this.gridLayer.graphics.moveTo(param3 + _loc5_,param4 - _loc5_ / 2);
            this.gridLayer.graphics.lineTo(param3,param4);
            this.gridLayer.graphics.lineTo(param3 + _loc5_,param4 + _loc5_ / 2);
            return;
         }
         this.gridLayer.graphics.moveTo(param1,param2 - _loc5_ * 2);
         this.gridLayer.graphics.lineTo(param1,param2 + _loc5_ * 2);
         this.gridLayer.graphics.moveTo(param1 + _loc5_,param2 - _loc5_ / 2);
         this.gridLayer.graphics.lineTo(param1,param2);
         this.gridLayer.graphics.lineTo(param1 + _loc5_,param2 + _loc5_ / 2);
         this.gridLayer.graphics.moveTo(param1,param2);
         this.gridLayer.graphics.lineTo(param3,param4);
         this.gridLayer.graphics.moveTo(param3,param4 - _loc5_ * 2);
         this.gridLayer.graphics.lineTo(param3,param4 + _loc5_ * 2);
         this.gridLayer.graphics.moveTo(param3 - _loc5_,param4 - _loc5_ / 2);
         this.gridLayer.graphics.lineTo(param3,param4);
         this.gridLayer.graphics.lineTo(param3 - _loc5_,param4 + _loc5_ / 2);
         var _loc6_:Group = new Group();
         _loc6_.width = param3 - param1;
         _loc6_.x = param1;
         _loc6_.y = param2 - 15;
         this.textLayer.addElement(_loc6_);
         var _loc7_:Label = new Label();
         _loc7_.text = String(int(param3 - param1));
         _loc7_.horizontalCenter = 0;
         _loc7_.alpha = 0.5;
         _loc7_.setStyle("fontSize","12");
         _loc7_.setStyle("color","0x527a06");
         _loc7_.setStyle("paddingTop","2");
         _loc6_.addElement(_loc7_);
      }
      
      private function drawVerticalArrow(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = 6 * this._alignTool.scaleFactor;
         if(param4 - param2 < _loc5_ * 2)
         {
            this.gridLayer.graphics.moveTo(param1 - _loc5_ * 2,param2);
            this.gridLayer.graphics.lineTo(param1 + _loc5_ * 2,param2);
            this.gridLayer.graphics.moveTo(param1 - _loc5_ / 2,param2 - _loc5_);
            this.gridLayer.graphics.lineTo(param1,param2);
            this.gridLayer.graphics.lineTo(param1 + _loc5_ / 2,param2 - _loc5_);
            this.gridLayer.graphics.moveTo(param3 - _loc5_ * 2,param4);
            this.gridLayer.graphics.lineTo(param3 + _loc5_ * 2,param4);
            this.gridLayer.graphics.moveTo(param3 - _loc5_ / 2,param4 + _loc5_);
            this.gridLayer.graphics.lineTo(param3,param4);
            this.gridLayer.graphics.lineTo(param3 + _loc5_ / 2,param4 + _loc5_);
            return;
         }
         this.gridLayer.graphics.moveTo(param1 - _loc5_ * 2,param2);
         this.gridLayer.graphics.lineTo(param1 + _loc5_ * 2,param2);
         this.gridLayer.graphics.moveTo(param1 - _loc5_ / 2,param2 + _loc5_);
         this.gridLayer.graphics.lineTo(param1,param2);
         this.gridLayer.graphics.lineTo(param1 + _loc5_ / 2,param2 + _loc5_);
         this.gridLayer.graphics.moveTo(param1,param2);
         this.gridLayer.graphics.lineTo(param3,param4);
         this.gridLayer.graphics.moveTo(param3 - _loc5_ * 2,param4);
         this.gridLayer.graphics.lineTo(param3 + _loc5_ * 2,param4);
         this.gridLayer.graphics.moveTo(param3 - _loc5_ / 2,param4 - _loc5_);
         this.gridLayer.graphics.lineTo(param3,param4);
         this.gridLayer.graphics.lineTo(param3 + _loc5_ / 2,param4 - _loc5_);
         var _loc6_:Group = new Group();
         _loc6_.y = param2;
         _loc6_.height = param4 - param2;
         _loc6_.x = param1 + 3;
         this.textLayer.addElement(_loc6_);
         var _loc7_:Label = new Label();
         _loc7_.text = String(int(param4 - param2));
         _loc7_.verticalCenter = 0;
         _loc7_.alpha = 0.5;
         _loc7_.setStyle("fontSize","12");
         _loc7_.setStyle("color","0x527a06");
         _loc7_.setStyle("paddingTop","2");
         _loc6_.addElement(_loc7_);
      }
      
      private function _SceneAlignGuide_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"gridLayer");
         this.gridLayer = _loc1_;
         BindingManager.executeBindings(this,"gridLayer",this.gridLayer);
         return _loc1_;
      }
      
      private function _SceneAlignGuide_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "textLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textLayer = _loc1_;
         BindingManager.executeBindings(this,"textLayer",this.textLayer);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get gridLayer() : SpriteVisualElement
      {
         return this._1262384555gridLayer;
      }
      
      public function set gridLayer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1262384555gridLayer;
         if(_loc2_ !== param1)
         {
            this._1262384555gridLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gridLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textLayer() : Group
      {
         return this._1055665116textLayer;
      }
      
      public function set textLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1055665116textLayer;
         if(_loc2_ !== param1)
         {
            this._1055665116textLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textLayer",_loc2_,param1));
            }
         }
      }
   }
}
