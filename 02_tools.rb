require 'rubocop'

def ast_from(string)
  RuboCop::ProcessedSource.new(string, RUBY_VERSION.to_f).ast
end

def deep_deconstruct(node)
  return node unless node.respond_to?(:deconstruct)
  node.deconstruct.map { deep_deconstruct(_1) }
end

ast = ast_from "1 + 2"
# => s(:send, s(:int, 1), :+, s(:int, 2))

deep_deconstruct(ast)
# => [:send, [:int, 1], :+, [:int, 2]]

ast_2 = ast_from "[1, 2, 3].select { |v| v.even? }"
# s(:block,
#   s(:send,
#     s(:array,
#       s(:int, 1), s(:int, 2), s(:int, 3)), :select),
#   s(:args, s(:arg, :v)),
#   s(:send, s(:lvar, :v), :even?))

deep_deconstruct(ast_2)
# [:block,
#  [:send, [:array, [:int, 1], [:int, 2], [:int, 3]], :select],
#  [[:arg, :v]],
#  [:send, [:lvar, :v], :even?]]
