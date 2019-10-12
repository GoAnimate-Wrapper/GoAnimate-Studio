package
{
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.system.Capabilities;
   import mx.accessibility.AlertAccImpl;
   import mx.accessibility.ButtonAccImpl;
   import mx.accessibility.PanelAccImpl;
   import mx.accessibility.UIComponentAccProps;
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.managers.systemClasses.ChildManager;
   import mx.styles.IStyleManager2;
   import mx.styles.StyleManagerImpl;
   import mx.utils.ObjectProxy;
   import spark.accessibility.ButtonBarBaseAccImpl;
   import spark.accessibility.ButtonBaseAccImpl;
   import spark.accessibility.CheckBoxAccImpl;
   import spark.accessibility.ComboBoxAccImpl;
   import spark.accessibility.DataGridAccImpl;
   import spark.accessibility.DropDownListBaseAccImpl;
   import spark.accessibility.ListAccImpl;
   import spark.accessibility.ListBaseAccImpl;
   import spark.accessibility.NumericStepperAccImpl;
   import spark.accessibility.RadioButtonAccImpl;
   import spark.accessibility.RichEditableTextAccImpl;
   import spark.accessibility.SliderBaseAccImpl;
   import spark.accessibility.SpinnerAccImpl;
   import spark.accessibility.TabBarAccImpl;
   import spark.accessibility.TextBaseAccImpl;
   import spark.accessibility.ToggleButtonAccImpl;
   
   public class _studio_FlexInit
   {
       
      
      public function _studio_FlexInit()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var styleManager:IStyleManager2 = null;
         var fbs:IFlexModuleFactory = param1;
         new ChildManager(fbs);
         styleManager = new StyleManagerImpl(fbs);
         EffectManager.mx_internal::registerEffectTrigger("addedEffect","added");
         EffectManager.mx_internal::registerEffectTrigger("completeEffect","complete");
         EffectManager.mx_internal::registerEffectTrigger("creationCompleteEffect","creationComplete");
         EffectManager.mx_internal::registerEffectTrigger("focusInEffect","focusIn");
         EffectManager.mx_internal::registerEffectTrigger("focusOutEffect","focusOut");
         EffectManager.mx_internal::registerEffectTrigger("hideEffect","hide");
         EffectManager.mx_internal::registerEffectTrigger("mouseDownEffect","mouseDown");
         EffectManager.mx_internal::registerEffectTrigger("mouseUpEffect","mouseUp");
         EffectManager.mx_internal::registerEffectTrigger("moveEffect","move");
         EffectManager.mx_internal::registerEffectTrigger("removedEffect","removed");
         EffectManager.mx_internal::registerEffectTrigger("resizeEffect","resize");
         EffectManager.mx_internal::registerEffectTrigger("resizeEndEffect","resizeEnd");
         EffectManager.mx_internal::registerEffectTrigger("resizeStartEffect","resizeStart");
         EffectManager.mx_internal::registerEffectTrigger("rollOutEffect","rollOut");
         EffectManager.mx_internal::registerEffectTrigger("rollOverEffect","rollOver");
         EffectManager.mx_internal::registerEffectTrigger("showEffect","show");
         if(Capabilities.hasAccessibility)
         {
            ButtonBarBaseAccImpl.enableAccessibility();
            mx.accessibility.PanelAccImpl.enableAccessibility();
            SliderBaseAccImpl.enableAccessibility();
            SpinnerAccImpl.enableAccessibility();
            NumericStepperAccImpl.enableAccessibility();
            DataGridAccImpl.enableAccessibility();
            ButtonBaseAccImpl.enableAccessibility();
            RadioButtonAccImpl.enableAccessibility();
            ToggleButtonAccImpl.enableAccessibility();
            ListBaseAccImpl.enableAccessibility();
            ComboBoxAccImpl.enableAccessibility();
            AlertAccImpl.enableAccessibility();
            TabBarAccImpl.enableAccessibility();
            RichEditableTextAccImpl.enableAccessibility();
            TextBaseAccImpl.enableAccessibility();
            spark.accessibility.PanelAccImpl.enableAccessibility();
            CheckBoxAccImpl.enableAccessibility();
            ListAccImpl.enableAccessibility();
            ButtonAccImpl.enableAccessibility();
            DropDownListBaseAccImpl.enableAccessibility();
            UIComponentAccProps.enableAccessibility();
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayCollection") != ArrayCollection)
            {
               registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayList") != ArrayList)
            {
               registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ObjectProxy") != ObjectProxy)
            {
               registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
         }
         var styleNames:Array = ["lineHeight","unfocusedTextSelectionColor","kerning","caretColor","textRollOverColor","showErrorSkin","digitCase","inactiveTextSelectionColor","listAutoPadding","showErrorTip","justificationRule","textDecoration","dominantBaseline","fontThickness","textShadowColor","trackingRight","blockProgression","leadingModel","listStylePosition","textAlignLast","textShadowAlpha","textAlpha","letterSpacing","chromeColor","rollOverColor","fontSize","baselineShift","focusedTextSelectionColor","paragraphEndIndent","fontWeight","breakOpportunity","leading","symbolColor","renderingMode","barColor","fontSharpness","modalTransparencyDuration","paragraphStartIndent","layoutDirection","justificationStyle","footerColors","wordSpacing","listStyleType","contentBackgroundColor","paragraphSpaceAfter","contentBackgroundAlpha","fontAntiAliasType","textRotation","errorColor","cffHinting","direction","locale","backgroundDisabledColor","digitWidth","modalTransparencyColor","showPromptWhenFocused","touchDelay","ligatureLevel","textIndent","firstBaselineOffset","themeColor","clearFloats","modalTransparency","fontLookup","tabStops","paragraphSpaceBefore","headerColors","textAlign","fontFamily","textSelectedColor","interactionMode","lineThrough","whiteSpaceCollapse","fontGridFitType","alignmentBaseline","trackingLeft","fontStyle","dropShadowColor","accentColor","selectionColor","disabledColor","modalTransparencyBlur","focusColor","downColor","textJustify","color","alternatingItemColors","typographicCase"];
         var i:int = 0;
         while(i < styleNames.length)
         {
            styleManager.registerInheritingStyle(styleNames[i]);
            i++;
         }
      }
   }
}
