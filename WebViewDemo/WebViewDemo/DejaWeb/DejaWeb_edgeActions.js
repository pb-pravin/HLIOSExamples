/***********************
* Adobe Edge Animate Composition Actions
*
* Edit this file with caution, being careful to preserve 
* function signatures and comments starting with 'Edge' to maintain the 
* ability to interact with these actions from within Adobe Edge Animate
*
***********************/
(function($, Edge, compId){
var Composition = Edge.Composition, Symbol = Edge.Symbol; // aliases for commonly used Edge classes

   //Edge symbol: 'stage'
   (function(symbolName) {
      
      
      Symbol.bindElementAction(compId, symbolName, "${_machine_next}", "click", function(sym, e) {
         // insert code for mouse click here
         sym.play();

      });
      //Edge binding end

      

      Symbol.bindElementAction(compId, symbolName, "${_Stage}", "click", function(sym, e) {
         sym.play();
         

      });
      //Edge binding end

      

      Symbol.bindElementAction(compId, symbolName, "${_Button_Creat}", "click", function(sym, e) {
         // insert code for mouse click here
         // Navigate to a new URL in the current window
         // (replace "_self" with appropriate target attribute for a new window)
         window.open("http://create", "_self");

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_Text}", "click", function(sym, e) {
         // Navigate to a new URL in the current window
         // (replace "_self" with appropriate target attribute for a new window)
         window.open("http://skip", "_self");

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_background}", "click", function(sym, e) {
         // insert code for mouse click here
         e.stopPropagation();
         e.preventDefault();
         return false();	

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_logo_800}", "click", function(sym, e) {
         // insert code for mouse click here
         e.stopPropagation();
         e.preventDefault();
         return false();	
         

      });
      //Edge binding end

      Symbol.bindElementAction(compId, symbolName, "${_Text3}", "click", function(sym, e) {
         // insert code for mouse click here
         e.stopPropagation();
         e.preventDefault();
         return false();	
         

      });
      //Edge binding end

   })("stage");
   //Edge symbol end:'stage'

   //=========================================================
   
   //Edge symbol: 'Down-level'
   (function(symbolName) {   
   
   })("Down-level");
   //Edge symbol end:'Down-level'

   //=========================================================
   
   //Edge symbol: 'Preloader'
   (function(symbolName) {   
   
   })("Preloader");
   //Edge symbol end:'Preloader'

})(jQuery, AdobeEdge, "EDGE-19885604");