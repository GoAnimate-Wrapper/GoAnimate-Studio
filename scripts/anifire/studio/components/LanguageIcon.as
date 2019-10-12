package anifire.studio.components
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class LanguageIcon extends Group
   {
      
      private static const flag_ca:Class = LanguageIcon_flag_ca;
      
      private static const flag_CA:Class = LanguageIcon_flag_CA;
      
      private static const flag_da:Class = LanguageIcon_flag_da;
      
      private static const flag_de:Class = LanguageIcon_flag_de;
      
      private static const flag_el:Class = LanguageIcon_flag_el;
      
      private static const flag_GR:Class = LanguageIcon_flag_GR;
      
      private static const flag_en:Class = LanguageIcon_flag_en;
      
      private static const flag_eo:Class = LanguageIcon_flag_eo;
      
      private static const flag_es:Class = LanguageIcon_flag_es;
      
      private static const flag_fi:Class = LanguageIcon_flag_fi;
      
      private static const flag_fr:Class = LanguageIcon_flag_fr;
      
      private static const flag_gl:Class = LanguageIcon_flag_gl;
      
      private static const flag_it:Class = LanguageIcon_flag_it;
      
      private static const flag_ja:Class = LanguageIcon_flag_ja;
      
      private static const flag_ko:Class = LanguageIcon_flag_ko;
      
      private static const flag_nl:Class = LanguageIcon_flag_nl;
      
      private static const flag_no:Class = LanguageIcon_flag_no;
      
      private static const flag_pl:Class = LanguageIcon_flag_pl;
      
      private static const flag_pt:Class = LanguageIcon_flag_pt;
      
      private static const flag_ro:Class = LanguageIcon_flag_ro;
      
      private static const flag_ru:Class = LanguageIcon_flag_ru;
      
      private static const flag_sv:Class = LanguageIcon_flag_sv;
      
      private static const flag_tr:Class = LanguageIcon_flag_tr;
      
      private static const flag_zh:Class = LanguageIcon_flag_zh;
      
      private static const flag_DE:Class = LanguageIcon_flag_DE;
      
      private static const flag_AU:Class = LanguageIcon_flag_AU;
      
      private static const flag_GB:Class = LanguageIcon_flag_GB;
      
      private static const flag_IN:Class = LanguageIcon_flag_IN;
      
      private static const flag_US:Class = LanguageIcon_flag_US;
      
      private static const flag_AR:Class = LanguageIcon_flag_AR;
      
      private static const flag_CL:Class = LanguageIcon_flag_CL;
      
      private static const flag_ES:Class = LanguageIcon_flag_ES;
      
      private static const flag_MX:Class = LanguageIcon_flag_MX;
      
      private static const flag_FR:Class = LanguageIcon_flag_FR;
      
      private static const flag_BR:Class = LanguageIcon_flag_BR;
      
      private static const flag_PT:Class = LanguageIcon_flag_PT;
      
      private static const flag_ar:Class = LanguageIcon_flag_ar;
      
      private static const flag_BE:Class = LanguageIcon_flag_BE;
      
      private static const flag_cs:Class = LanguageIcon_flag_cs;
      
      private static const flag_hu:Class = LanguageIcon_flag_hu;
      
      private static const flag_id:Class = LanguageIcon_flag_id;
      
      private static const flag_IE:Class = LanguageIcon_flag_IE;
      
      private static const flag_is:Class = LanguageIcon_flag_is;
      
      private static const flag_th:Class = LanguageIcon_flag_th;
      
      private static const flag_ZA:Class = LanguageIcon_flag_ZA;
      
      private static const flag_cy:Class = LanguageIcon_flag_cy;
      
      private static var icons:Object = {
         "flag_ca":flag_ca,
         "flag_CA":flag_CA,
         "flag_da":flag_da,
         "flag_DK":flag_da,
         "flag_de":flag_de,
         "flag_el":flag_el,
         "flag_GR":flag_GR,
         "flag_en":flag_en,
         "flag_eo":flag_eo,
         "flag_es":flag_es,
         "flag_fi":flag_fi,
         "flag_FI":flag_fi,
         "flag_fr":flag_fr,
         "flag_gl":flag_gl,
         "flag_it":flag_it,
         "flag_IT":flag_it,
         "flag_ja":flag_ja,
         "flag_JP":flag_ja,
         "flag_ko":flag_ko,
         "flag_KR":flag_ko,
         "flag_nl":flag_nl,
         "flag_NL":flag_nl,
         "flag_no":flag_no,
         "flag_pl":flag_pl,
         "flag_PL":flag_pl,
         "flag_pt":flag_pt,
         "flag_ro":flag_ro,
         "flag_RO":flag_ro,
         "flag_ru":flag_ru,
         "flag_RU":flag_ru,
         "flag_sv":flag_sv,
         "flag_SE":flag_sv,
         "flag_tr":flag_tr,
         "flag_TR":flag_tr,
         "flag_zh":flag_zh,
         "flag_CN":flag_zh,
         "flag_DE":flag_DE,
         "flag_AU":flag_AU,
         "flag_GB":flag_GB,
         "flag_IN":flag_IN,
         "flag_hi":flag_IN,
         "flag_US":flag_US,
         "flag_AR":flag_AR,
         "flag_CL":flag_CL,
         "flag_ES":flag_ES,
         "flag_MX":flag_MX,
         "flag_FR":flag_FR,
         "flag_BR":flag_BR,
         "flag_PT":flag_PT,
         "flag_ar":flag_ar,
         "flag_SA":flag_ar,
         "flag_BE":flag_BE,
         "flag_cs":flag_cs,
         "flag_CZ":flag_cs,
         "flag_hu":flag_hu,
         "flag_HU":flag_hu,
         "flag_id":flag_id,
         "flag_ID":flag_id,
         "flag_IE":flag_IE,
         "flag_is":flag_is,
         "flag_IS":flag_is,
         "flag_th":flag_th,
         "flag_TH":flag_th,
         "flag_ZA":flag_ZA,
         "flag_cy":flag_cy
      };
       
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _iconName:String;
      
      public function LanguageIcon()
      {
         super();
         mx_internal::_document = this;
         this.height = 18;
         this.mxmlContent = [this._LanguageIcon_BitmapImage1_i()];
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
      
      protected function updateIconById(param1:String) : void
      {
         var _loc2_:Class = icons["flag_" + param1];
         this.iconDisplay.source = _loc2_;
      }
      
      public function get iconName() : String
      {
         return this._iconName;
      }
      
      public function set iconName(param1:String) : void
      {
         if(this._iconName != param1)
         {
            this._iconName = param1;
            this.updateIconById(this._iconName);
         }
      }
      
      private function _LanguageIcon_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
   }
}
