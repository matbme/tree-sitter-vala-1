; highlights.scm

; highlight constants
(
  (member_access_expression (identifier) @constant)
  (#match? @constant "^[A-Z][A-Z_0-9]*$")
)

(
  (member_access_expression (member_access_expression) @include (identifier) @constant)
  (#match? @constant "^[A-Z][A-Z_0-9]*$")
)

(comment) @comment

(type (symbol (_)? @namespace (identifier) @type))

; highlight creation methods in object creation expressions
(
  (object_creation_expression (type (symbol (symbol (symbol)? @include (identifier) @type) (identifier) @constructor)))
  (#match? @constructor "^[a-z][a-z_0-9]*$")
)

(unqualified_type (symbol . (identifier) @type))
(unqualified_type (symbol (symbol) @namespace (identifier) @type))

(attribute) @attribute
(namespace_declaration (symbol) @namespace)
(method_declaration (symbol (symbol) @type (identifier) @function))
(method_declaration (symbol (identifier) @function))
(local_function_declaration (identifier) @function)
(destructor_declaration (identifier) @function)
(creation_method_declaration (symbol (symbol) @type (identifier) @constructor))
(creation_method_declaration (symbol (identifier) @constructor))
(constructor_declaration "construct" @keyword.function)
(enum_declaration (symbol) @type)
(enum_value (identifier) @constant)
(errordomain_declaration (symbol) @type)
(errorcode (identifier) @constant)
(constant_declaration (identifier) @constant)
(method_call_expression (member_access_expression (identifier) @function))
; highlight special methods
(
 (method_call_expression (member_access_expression (identifier) @function.builtin))
 (#match? @function.builtin "exit")
)
; highlight macros
(
 (method_call_expression (member_access_expression (identifier) @function.macro))
 (#match? @function.macro "^(assert|error|info|print|warning(_once)?)$")
)
(lambda_expression (identifier) @parameter)
(parameter (identifier) @parameter)
(property_declaration (symbol (identifier) @property))
(field_declaration (identifier) @field)
[
 (this_access)
 (base_access)
 (value_access)
] @variable.builtin
(boolean) @boolean
(character) @character
(escape_sequence) @character.special
(integer) @number
(null) @constant.builtin
(real) @float
(regex) @string.regex
(string) @string
(string_formatter) @string.special
(template_string) @string
(template_string_expression) @string.special
(verbatim_string) @string
[
 "var"
 "void"
] @type.builtin

(if_directive
  expression: (_) @preproc
) @keyword
(elif_directive
  expression: (_) @preproc
) @keyword
(else_directive) @keyword
(endif_directive) @keyword

[
 "abstract"
 "async"
 "break"
 "case"
 "catch"
 "class"
 "construct"
 "continue"
 "default"
 "delegate"
 "enum"
 "errordomain"
 "finally"
 "get"
 "inline"
 "interface"
 "namespace"
 "new"
 "out"
 "override"
 "partial"
 "ref"
 "set"
 "signal"
 "struct"
 "switch"
 "throw"
 "throws"
 "try"
 "virtual"
 "with"
] @keyword

[
 "const"
 "dynamic"
 "owned"
 "weak"
 "unowned"
] @type.qualifier

[
 "else"
 "if"
] @conditional

[
 "extern"
 "internal"
 "private"
 "protected"
 "public"
 "static"
] @storageclass

[
 "and"
 "as"
 "delete"
 "in"
 "is"
 "lock"
 "not"
 "or"
 "sizeof"
 "typeof"
] @keyword.operator

"using" @include
(using_directive (symbol) @namespace)

(symbol "global::" @namespace)

(array_creation_expression "new" @keyword.operator)
(object_creation_expression "new" @keyword.operator)
(argument "out" @keyword.operator)
(argument "ref" @keyword.operator)

[
  "continue"
  "do"
  "for"
  "foreach"
  "while"
] @repeat

[
  "catch"
  "finally"
  "throw"
  "throws"
  "try"
] @exception

[
  "return"
  "yield"
] @keyword.return

[
 "="
 "=="
 "+"
 "+="
 "-"
 "-="
 "++"
 "--"
 "|"
 "|="
 "&"
 "&="
 "^"
 "^="
 "/"
 "/="
 "*"
 "*="
 "%"
 "%="
 "<<"
 "<<="
 ">>"
 ">>="
 "."
 "?."
 "->"
 "!"
 "!="
 "~"
 "??"
 "?"
 ":"
 "<"
 "<="
 ">"
 ">="
 "||"
 "&&"
 "=>"
] @operator

[
 ","
 ";"
] @punctuation.delimiter

[
 "("
 ")"
 "{"
 "}"
 "["
 "]"
] @punctuation.bracket
