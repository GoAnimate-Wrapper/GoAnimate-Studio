package cmodule.oggvorbisencoder
{
   import avm2.intrinsics.memory.lf32;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.sf32;
   import avm2.intrinsics.memory.si32;
   
   public final class FSM_dradf4 extends Machine
   {
       
      
      public function FSM_dradf4()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = 0;
         var _loc14_:* = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc50_:Number = NaN;
         FSM_dradf4.esp = FSM_dradf4.esp - 4;
         si32(FSM_dradf4.ebp,FSM_dradf4.esp);
         FSM_dradf4.ebp = FSM_dradf4.esp;
         FSM_dradf4.esp = FSM_dradf4.esp - 27;
         _loc1_ = 0;
         _loc2_ = li32(FSM_dradf4.ebp + 8);
         _loc3_ = li32(FSM_dradf4.ebp + 12);
         _loc4_ = int(_loc2_ * _loc3_);
         _loc5_ = _loc3_ * _loc2_;
         si32(_loc5_,FSM_dradf4.ebp + -27);
         _loc5_ = li32(FSM_dradf4.ebp + 16);
         _loc6_ = int(li32(FSM_dradf4.ebp + 20));
         si32(_loc6_,FSM_dradf4.ebp + -18);
         _loc6_ = int(li32(FSM_dradf4.ebp + 24));
         _loc7_ = li32(FSM_dradf4.ebp + 28);
         _loc8_ = int(li32(FSM_dradf4.ebp + 32));
         _loc9_ = _loc2_ << 2;
         _loc10_ = _loc4_ << 3;
         _loc4_ = _loc4_ << 2;
         _loc11_ = _loc2_ << 4;
         _loc12_ = _loc2_ << 3;
         _loc13_ = _loc2_ << 1;
         _loc13_ = int(li32(FSM_dradf4.ebp + -27));
         _loc13_ = _loc13_ << 1;
         si32(_loc13_,FSM_dradf4.ebp + -9);
         _loc13_ = int(_loc5_);
         _loc14_ = int(li32(FSM_dradf4.ebp + -18));
         _loc15_ = _loc13_;
         _loc16_ = li32(FSM_dradf4.ebp + -9);
         _loc17_ = li32(FSM_dradf4.ebp + -27);
         while(true)
         {
            _loc18_ = _loc16_ + _loc17_;
            _loc17_ = _loc15_;
            _loc16_ = _loc14_;
            if(_loc1_ >= _loc3_)
            {
               break;
            }
            _loc19_ = _loc18_ << 2;
            _loc20_ = int(_loc10_ + _loc15_);
            _loc19_ = int(_loc5_ + _loc19_);
            _loc21_ = _loc4_ + _loc15_;
            _loc33_ = lf32(_loc21_);
            _loc34_ = lf32(_loc19_);
            _loc35_ = lf32(_loc17_);
            _loc36_ = lf32(_loc20_);
            _loc33_ = _loc33_ + _loc34_;
            _loc34_ = _loc35_ + _loc36_;
            _loc33_ = _loc33_;
            _loc34_ = _loc34_;
            _loc33_ = _loc33_;
            _loc34_ = _loc34_;
            _loc35_ = _loc33_ + _loc34_;
            _loc33_ = _loc34_ - _loc33_;
            _loc34_ = _loc35_;
            sf32(_loc34_,_loc16_);
            _loc33_ = _loc33_;
            _loc16_ = _loc11_ + _loc14_;
            sf32(_loc33_,_loc16_ + -4);
            _loc33_ = lf32(_loc17_);
            _loc34_ = lf32(_loc20_);
            _loc33_ = _loc33_ - _loc34_;
            _loc33_ = _loc33_;
            _loc14_ = int(_loc12_ + _loc14_);
            sf32(_loc33_,_loc14_ + -4);
            _loc33_ = lf32(_loc19_);
            _loc34_ = lf32(_loc21_);
            _loc33_ = _loc33_ - _loc34_;
            _loc33_ = _loc33_;
            sf32(_loc33_,_loc14_);
            _loc15_ = _loc9_ + _loc15_;
            _loc1_ = int(_loc1_ + 1);
            _loc14_ = int(_loc16_);
            _loc16_ = _loc18_;
            _loc17_ = _loc2_;
         }
         if(_loc2_ >= 2)
         {
            if(_loc2_ != 2)
            {
               _loc1_ = 0;
               _loc4_ = int(_loc3_ * _loc2_);
               _loc9_ = _loc2_ << 4;
               _loc10_ = _loc2_ << 3;
               _loc11_ = _loc2_ << 2;
               _loc12_ = _loc4_ << 2;
               _loc14_ = _loc4_ << 3;
               _loc4_ = int(_loc4_ * 12);
               _loc15_ = _loc13_;
               _loc16_ = li32(FSM_dradf4.ebp + -18);
               _loc17_ = _loc1_;
               while(_loc17_ < _loc3_)
               {
                  _loc18_ = 0;
                  _loc19_ = _loc2_ << 4;
                  _loc20_ = _loc2_ << 3;
                  _loc21_ = _loc4_ + _loc15_;
                  _loc22_ = _loc14_ + _loc15_;
                  _loc23_ = _loc12_ + _loc15_;
                  _loc24_ = _loc10_ + _loc16_;
                  _loc25_ = 2;
                  _loc26_ = _loc16_;
                  while(_loc25_ < _loc2_)
                  {
                     _loc27_ = _loc21_ + _loc18_;
                     _loc28_ = _loc8_ + _loc18_;
                     _loc29_ = _loc22_ + _loc18_;
                     _loc30_ = _loc7_ + _loc18_;
                     _loc31_ = _loc23_ + _loc18_;
                     _loc32_ = _loc6_ + _loc18_;
                     _loc33_ = lf32(_loc32_);
                     _loc34_ = lf32(_loc31_ + 4);
                     _loc35_ = lf32(_loc32_ + 4);
                     _loc36_ = lf32(_loc31_ + 8);
                     _loc37_ = lf32(_loc30_);
                     _loc38_ = lf32(_loc29_ + 4);
                     _loc39_ = lf32(_loc30_ + 4);
                     _loc40_ = lf32(_loc29_ + 8);
                     _loc41_ = lf32(_loc28_);
                     _loc42_ = lf32(_loc27_ + 4);
                     _loc43_ = lf32(_loc28_ + 4);
                     _loc44_ = lf32(_loc27_ + 8);
                     _loc45_ = _loc33_ * _loc34_;
                     _loc46_ = _loc35_ * _loc36_;
                     _loc47_ = _loc37_ * _loc38_;
                     _loc48_ = _loc39_ * _loc40_;
                     _loc49_ = _loc41_ * _loc42_;
                     _loc50_ = _loc43_ * _loc44_;
                     _loc45_ = _loc45_;
                     _loc33_ = _loc33_ * _loc36_;
                     _loc36_ = _loc46_;
                     _loc34_ = _loc35_ * _loc34_;
                     _loc35_ = _loc47_;
                     _loc37_ = _loc37_ * _loc40_;
                     _loc40_ = _loc48_;
                     _loc38_ = _loc39_ * _loc38_;
                     _loc39_ = _loc49_;
                     _loc41_ = _loc41_ * _loc44_;
                     _loc44_ = _loc50_;
                     _loc42_ = _loc43_ * _loc42_;
                     _loc33_ = _loc33_;
                     _loc34_ = _loc34_;
                     _loc37_ = _loc37_;
                     _loc38_ = _loc38_;
                     _loc41_ = _loc41_;
                     _loc42_ = _loc42_;
                     _loc36_ = _loc36_;
                     _loc43_ = _loc45_;
                     _loc40_ = _loc40_;
                     _loc35_ = _loc35_;
                     _loc44_ = _loc44_;
                     _loc39_ = _loc39_;
                     _loc36_ = _loc43_ + _loc36_;
                     _loc35_ = _loc35_ + _loc40_;
                     _loc39_ = _loc39_ + _loc44_;
                     _loc34_ = _loc34_;
                     _loc33_ = _loc33_;
                     _loc38_ = _loc38_;
                     _loc37_ = _loc37_;
                     _loc40_ = _loc42_;
                     _loc41_ = _loc41_;
                     _loc36_ = _loc36_;
                     _loc33_ = _loc33_ - _loc34_;
                     _loc34_ = _loc35_;
                     _loc35_ = _loc37_ - _loc38_;
                     _loc37_ = _loc39_;
                     _loc38_ = _loc41_ - _loc40_;
                     _loc27_ = _loc15_ + _loc18_;
                     _loc33_ = _loc33_;
                     _loc35_ = _loc35_;
                     _loc38_ = _loc38_;
                     _loc39_ = lf32(_loc27_ + 4);
                     _loc34_ = _loc34_;
                     _loc36_ = _loc36_;
                     _loc37_ = _loc37_;
                     _loc40_ = lf32(_loc27_ + 8);
                     _loc35_ = _loc35_;
                     _loc41_ = _loc36_ + _loc37_;
                     _loc42_ = _loc39_ + _loc34_;
                     _loc38_ = _loc38_;
                     _loc33_ = _loc33_;
                     _loc41_ = _loc41_;
                     _loc43_ = _loc33_ + _loc38_;
                     _loc42_ = _loc42_;
                     _loc44_ = _loc40_ + _loc35_;
                     _loc43_ = _loc43_;
                     _loc33_ = _loc33_ - _loc38_;
                     _loc34_ = _loc39_ - _loc34_;
                     _loc38_ = _loc44_;
                     _loc39_ = _loc41_;
                     _loc41_ = _loc42_;
                     _loc42_ = _loc39_ + _loc41_;
                     _loc36_ = _loc37_ - _loc36_;
                     _loc33_ = _loc33_;
                     _loc34_ = _loc34_;
                     _loc35_ = _loc40_ - _loc35_;
                     _loc37_ = _loc38_;
                     _loc38_ = _loc43_;
                     _loc36_ = _loc36_;
                     _loc40_ = _loc38_ + _loc37_;
                     _loc35_ = _loc35_;
                     _loc42_ = _loc42_;
                     _loc34_ = _loc34_;
                     _loc33_ = _loc33_;
                     _loc27_ = _loc16_ + _loc18_;
                     _loc43_ = _loc34_ - _loc33_;
                     sf32(_loc42_,_loc27_ + 4);
                     _loc40_ = _loc40_;
                     _loc35_ = _loc35_;
                     _loc36_ = _loc36_;
                     _loc42_ = _loc36_ - _loc35_;
                     sf32(_loc40_,_loc27_ + 8);
                     _loc40_ = _loc43_;
                     _loc27_ = _loc20_ + _loc26_;
                     _loc33_ = _loc33_ + _loc34_;
                     sf32(_loc40_,_loc27_ + -12);
                     _loc34_ = _loc42_;
                     _loc35_ = _loc36_ + _loc35_;
                     sf32(_loc34_,_loc27_ + -8);
                     _loc33_ = _loc33_;
                     _loc27_ = _loc24_ + _loc18_;
                     _loc34_ = _loc41_ - _loc39_;
                     sf32(_loc33_,_loc27_ + 4);
                     _loc33_ = _loc35_;
                     _loc35_ = _loc38_ - _loc37_;
                     sf32(_loc33_,_loc27_ + 8);
                     _loc33_ = _loc34_;
                     _loc27_ = _loc19_ + _loc26_;
                     sf32(_loc33_,_loc27_ + -12);
                     _loc33_ = _loc35_;
                     sf32(_loc33_,_loc27_ + -8);
                     _loc26_ = _loc26_ + -8;
                     _loc18_ = _loc18_ + 8;
                     _loc25_ = _loc25_ + 2;
                  }
                  _loc15_ = _loc11_ + _loc15_;
                  _loc16_ = _loc9_ + _loc16_;
                  _loc17_ = _loc17_ + 1;
                  _loc1_ = int(_loc1_ + _loc2_);
               }
               _loc1_ = _loc2_ & 1;
               if(_loc1_ == 0)
               {
               }
            }
            _loc1_ = 0;
            _loc4_ = _loc3_ << 1;
            _loc4_ = _loc4_ | 1;
            _loc6_ = int(_loc3_ + 1);
            _loc6_ = int(_loc2_ * _loc6_);
            _loc4_ = int(_loc2_ * _loc4_);
            _loc7_ = li32(FSM_dradf4.ebp + -27);
            _loc7_ = _loc7_ + _loc2_;
            _loc8_ = _loc2_ << 2;
            _loc4_ = _loc4_ << 2;
            _loc6_ = _loc6_ << 2;
            _loc9_ = _loc2_ << 4;
            _loc10_ = int(_loc2_ * 12);
            _loc11_ = int(_loc13_ + -4);
            _loc7_ = _loc7_ + -1;
            _loc12_ = int(_loc8_);
            _loc13_ = int(li32(FSM_dradf4.ebp + -18));
            _loc14_ = int(li32(FSM_dradf4.ebp + -9));
            while(true)
            {
               _loc7_ = _loc7_ + _loc14_;
               if(_loc1_ >= _loc3_)
               {
                  break;
               }
               _loc33_ = 0.707107;
               _loc14_ = _loc7_ << 2;
               _loc14_ = int(_loc5_ + _loc14_);
               _loc15_ = _loc6_ + _loc11_;
               _loc34_ = lf32(_loc15_);
               _loc35_ = lf32(_loc14_);
               _loc36_ = _loc34_ - _loc35_;
               _loc36_ = _loc36_;
               _loc33_ = _loc33_;
               _loc33_ = _loc33_;
               _loc36_ = _loc36_;
               _loc33_ = _loc36_ * _loc33_;
               _loc33_ = _loc33_;
               _loc14_ = int(_loc8_ + _loc11_);
               _loc36_ = lf32(_loc14_);
               _loc33_ = _loc33_;
               _loc36_ = _loc36_ + _loc33_;
               _loc36_ = _loc36_;
               _loc15_ = _loc12_ + _loc13_;
               sf32(_loc36_,_loc15_ + -4);
               _loc34_ = _loc34_ + _loc35_;
               _loc35_ = -0.707107;
               _loc36_ = lf32(_loc14_);
               _loc34_ = _loc34_;
               _loc35_ = _loc35_;
               _loc33_ = _loc36_ - _loc33_;
               _loc35_ = _loc35_;
               _loc34_ = _loc34_;
               _loc34_ = _loc34_ * _loc35_;
               _loc33_ = _loc33_;
               _loc16_ = _loc10_ + _loc13_;
               _loc34_ = _loc34_;
               sf32(_loc33_,_loc16_ + -4);
               _loc11_ = int(_loc4_ + _loc11_);
               _loc33_ = lf32(_loc11_);
               _loc34_ = _loc34_;
               _loc33_ = _loc34_ - _loc33_;
               _loc33_ = _loc33_;
               sf32(_loc33_,_loc15_);
               _loc33_ = lf32(_loc11_);
               _loc33_ = _loc33_ + _loc34_;
               _loc33_ = _loc33_;
               sf32(_loc33_,_loc16_);
               _loc11_ = int(_loc9_ + _loc13_);
               _loc1_ = int(_loc1_ + 1);
               _loc13_ = int(_loc11_);
               _loc11_ = int(_loc14_);
               _loc14_ = int(_loc2_);
            }
         }
         FSM_dradf4.esp = FSM_dradf4.ebp;
         FSM_dradf4.ebp = li32(FSM_dradf4.esp);
         FSM_dradf4.esp = FSM_dradf4.esp + 4;
         FSM_dradf4.esp = FSM_dradf4.esp + 4;
      }
   }
}
