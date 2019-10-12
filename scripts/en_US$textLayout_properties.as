package
{
   import mx.resources.ResourceBundle;
   
   public class en_US$textLayout_properties extends ResourceBundle
   {
       
      
      public function en_US$textLayout_properties()
      {
         super("en_US","textLayout");
      }
      
      override protected function getContent() : Object
      {
         var _loc1_:Object = {
            "badRemoveChild":"Child to remove not found",
            "badReplaceChildrenIndex":"Out of range index to FlowGroupElement.replaceChildren",
            "missingTextFlow":"No TextFlow to parse",
            "unexpectedNamespace":"Unexpected namespace {0}",
            "badMXMLChildrenArgument":"Bad element of type {0} passed to mxmlChildren",
            "invalidReplaceTextPositions":"Invalid positions passed to SpanElement.replaceText",
            "invalidSplitAtPosition":"Invalid parameter to splitAtPosition",
            "badSurrogatePairCopy":"Copying only half of a surrogate pair in SpanElement.shallowCopy",
            "invalidChildType":"NewElement not of a type that this can be parent of",
            "unknownAttribute":"Attribute {0} not permitted in element {1}",
            "invalidSurrogatePairSplit":"Invalid splitting of a surrogate pair",
            "expectedExactlyOneTextLayoutFormat":"Expected one and only one TextLayoutFormat in {0}\t",
            "invalidFlowElementConstruct":"Attempted construct of invalid FlowElement subclass",
            "malformedTag":"Malformed tag {0}",
            "missingStringResource":"No string for resource {0}",
            "invalidSplitAtIndex":"Invalid parameter to splitAtIndex",
            "illegalOperation":"Illegal attempt to execute {0} operation",
            "malformedMarkup":"Malformed markup {0}",
            "unexpectedXMLElementInSpan":"Unexpected element {0} within a span",
            "badPropertyValue":"Property {0} value {1} is out of range",
            "badShallowCopyRange":"Bad range in shallowCopy",
            "unknownElement":"Unknown element {0}"
         };
         return _loc1_;
      }
   }
}
