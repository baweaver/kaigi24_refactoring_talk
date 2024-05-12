Prism.parse("[1,2,3].map { |v| v * 2 }").value

# @ ProgramNode (location: (1,0)-(1,25))
# ├── locals: []
# └── statements:
#     @ StatementsNode (location: (1,0)-(1,25))
#     └── body: (length: 1)
#         └── @ CallNode (location: (1,0)-(1,25))
#             ├── flags: ∅
#             ├── receiver:
#             │   @ ArrayNode (location: (1,0)-(1,7))
#             │   ├── flags: ∅
#             │   ├── elements: (length: 3)
#             │   │   ├── @ IntegerNode (location: (1,1)-(1,2))
#             │   │   │   └── flags: decimal
#             │   │   ├── @ IntegerNode (location: (1,3)-(1,4))
#             │   │   │   └── flags: decimal
#             │   │   └── @ IntegerNode (location: (1,5)-(1,6))
#             │   │       └── flags: decimal
#             │   ├── opening_loc: (1,0)-(1,1) = "["
#             │   └── closing_loc: (1,6)-(1,7) = "]"
#             ├── call_operator_loc: (1,7)-(1,8) = "."
#             ├── name: :map
#             ├── message_loc: (1,8)-(1,11) = "map"
#             ├── opening_loc: ∅
#             ├── arguments: ∅
#             ├── closing_loc: ∅
#             └── block:
#                 @ BlockNode (location: (1,12)-(1,25))
#                 ├── locals: [:v]
#                 ├── locals_body_index: 1
#                 ├── parameters:
#                 │   @ BlockParametersNode (location: (1,14)-(1,17))
#                 │   ├── parameters:
#                 │   │   @ ParametersNode (location: (1,15)-(1,16))
#                 │   │   ├── requireds: (length: 1)
#                 │   │   │   └── @ RequiredParameterNode (location: (1,15)-(1,16))
#                 │   │   │       └── name: :v
#                 │   │   ├── optionals: (length: 0)
#                 │   │   ├── rest: ∅
#                 │   │   ├── posts: (length: 0)
#                 │   │   ├── keywords: (length: 0)
#                 │   │   ├── keyword_rest: ∅
#                 │   │   └── block: ∅
#                 │   ├── locals: (length: 0)
#                 │   ├── opening_loc: (1,14)-(1,15) = "|"
#                 │   └── closing_loc: (1,16)-(1,17) = "|"
#                 ├── body:
#                 │   @ StatementsNode (location: (1,18)-(1,23))
#                 │   └── body: (length: 1)
#                 │       └── @ CallNode (location: (1,18)-(1,23))
#                 │           ├── flags: ∅
#                 │           ├── receiver:
#                 │           │   @ LocalVariableReadNode (location: (1,18)-(1,19))
#                 │           │   ├── name: :v
#                 │           │   └── depth: 0
#                 │           ├── call_operator_loc: ∅
#                 │           ├── name: :*
#                 │           ├── message_loc: (1,20)-(1,21) = "*"
#                 │           ├── opening_loc: ∅
#                 │           ├── arguments:
#                 │           │   @ ArgumentsNode (location: (1,22)-(1,23))
#                 │           │   ├── flags: ∅
#                 │           │   └── arguments: (length: 1)
#                 │           │       └── @ IntegerNode (location: (1,22)-(1,23))
#                 │           │           └── flags: decimal
#                 │           ├── closing_loc: ∅
#                 │           └── block: ∅
#                 ├── opening_loc: (1,12)-(1,13) = "{"
#                 └── closing_loc: (1,24)-(1,25) = "}"
