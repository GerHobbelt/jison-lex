
/* 
 * description: Grammar showing the `%include` feature in both lexer and parser.
 * The grammar itself is a copy of the precedence grammar which shows precedence operators 
 * and semantic actions. 
 */



// This chunk will be injected before everything else that's generated by JISON:
%code required      %include with-includes.prelude.top.js

// ... and this chunk will land before the parser and parser tables...
%code init      %include with-includes.prelude.init.js



%options ranges


DIGITS          [0-9]
ALPHA           [a-zA-Z]|{DIGITS}
SPACE           " "
WHITESPACE      \s


%include with-includes.prelude1.js

%%

{WHITESPACE}+   {/* skip whitespace */}
[{DIGITS}]+     /* leading comment */  
                %include "with-includes.returnNAT.js"  // demonstrate the ACTION block include and the ability to comment on it right here.
[{DIGITS}{ALPHA}]+     
                %{ console.log("buggerit millenium hands and shrimp!"); %}

"+"             {return '+';}
"-"             {return '-';}
"*"             {return '*';}
<<EOF>>         {return 'EOF';}

%%

%include with-includes.prelude2.js


%include with-includes.main.js   // demonstrate the trailing code block include and the ability to comment on it right here.
