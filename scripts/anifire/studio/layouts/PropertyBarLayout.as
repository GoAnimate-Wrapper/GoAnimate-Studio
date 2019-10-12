package anifire.studio.layouts
{
   import mx.core.ILayoutElement;
   import spark.components.supportClasses.ButtonBarHorizontalLayout;
   import spark.components.supportClasses.GroupBase;
   
   public class PropertyBarLayout extends ButtonBarHorizontalLayout
   {
       
      
      public function PropertyBarLayout()
      {
         super();
      }
      
      override public function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc8_:ILayoutElement = null;
         var _loc13_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc3_:Number = this.gap;
         super.updateDisplayList(param1,param2);
         var _loc4_:GroupBase = target;
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:Number = 0;
         var _loc6_:int = _loc4_.numElements;
         var _loc7_:int = _loc6_;
         var _loc9_:int = 0;
         while(_loc9_ < _loc6_)
         {
            _loc8_ = _loc4_.getElementAt(_loc9_);
            if(!_loc8_ || !_loc8_.includeInLayout)
            {
               _loc7_--;
            }
            else
            {
               _loc5_ = _loc5_ + _loc8_.getPreferredBoundsWidth();
            }
            _loc9_++;
         }
         var _loc10_:Number = _loc7_ <= 2?Number(param1 * 0.4):Number(param1);
         if(_loc7_ == 0)
         {
            _loc4_.setContentSize(0,0);
            return;
         }
         _loc4_.setContentSize(param1,param2);
         if(param1 == 0)
         {
            _loc3_ = 0;
         }
         var _loc11_:Number = param1 - _loc5_ - _loc3_ * (_loc7_ - 1);
         var _loc12_:Number = param1 - _loc3_ * (_loc7_ - 1);
         var _loc14_:int = _loc7_;
         if(_loc11_ < 0)
         {
            _loc13_ = param1 / _loc7_;
            _loc9_ = 0;
            while(_loc9_ < _loc6_)
            {
               _loc8_ = _loc4_.getElementAt(_loc9_);
               if(!(!_loc8_ || !_loc8_.includeInLayout))
               {
                  _loc19_ = _loc8_.getPreferredBoundsWidth();
                  if(_loc19_ <= _loc13_)
                  {
                     _loc12_ = _loc12_ - _loc19_;
                     _loc14_--;
                  }
               }
               _loc9_++;
            }
            _loc12_ = Math.max(0,_loc12_);
         }
         var _loc15_:Number = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = 0;
         _loc9_ = 0;
         while(_loc9_ < _loc6_)
         {
            _loc8_ = _loc4_.getElementAt(_loc9_);
            if(!(!_loc8_ || !_loc8_.includeInLayout))
            {
               if(_loc11_ > 0)
               {
                  _loc16_ = _loc12_ * _loc8_.getPreferredBoundsWidth() / _loc5_;
               }
               else if(_loc11_ < 0)
               {
                  _loc16_ = _loc13_ < _loc8_.getPreferredBoundsWidth()?Number(_loc12_ / _loc14_):Number(NaN);
               }
               if(!isNaN(_loc16_))
               {
                  _loc17_ = Math.round(_loc16_ + _loc18_);
                  _loc18_ = _loc18_ + (_loc16_ - _loc17_);
               }
               _loc8_.setLayoutBoundsSize(Math.min(_loc17_,_loc10_),param2);
               _loc8_.setLayoutBoundsPosition(_loc15_,0);
               _loc15_ = _loc15_ + (_loc3_ + _loc8_.getLayoutBoundsWidth());
               _loc17_ = NaN;
            }
            _loc9_++;
         }
      }
   }
}
