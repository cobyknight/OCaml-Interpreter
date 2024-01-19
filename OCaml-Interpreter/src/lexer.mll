{
open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let int = '-'? digit+
let letter = ['a'-'z' 'A'-'Z']
let id = letter+

rule read = 
  parse
  | white { read lexbuf }
  | "true" { TRUE }
  | "false" { FALSE }
  | "<=" { LEQ }
  | ">=" { GEQ }
  | "*" { TIMES }
  | "/" { DIV }
  | "+" { PLUS }
  | "-" { MINUS }
  | "+." { FPLUS }
  | "-." { FMINUS }
  | "*." { FTIMES }
  | "/." { FDIV }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "let" { LET }
  | "=" { EQUALS }
  | "in" { IN }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | ":" {COLON}
  | "int" {INT_TYPE}
  | "bool" {BOOL_TYPE}
  | "float" {FLOAT_TYPE}
  | id { ID (Lexing.lexeme lexbuf) }
  | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | digit+ '.' digit+ as f { FLOAT (float_of_string f) }
  | eof { EOF }
  