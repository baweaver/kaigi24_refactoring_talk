require 'parser/current'

Parser::CurrentRuby.parse "[1,2,3].map { |v| v * 2 }"

# AST
s(:block,
  s(:send,
    s(:array, s(:int, 1), s(:int, 2), s(:int, 3)), :map),
  s(:args, s(:arg, :v)),
  s(:send, s(:lvar, :v), :*, s(:int, 2)))
