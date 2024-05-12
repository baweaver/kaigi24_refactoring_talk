require_relative '02_tools'

longhand_block = ast_from "[1, 2, 3].select { |v| v.even? }"
result = longhand_block in [:block, [:send, [:array,
  [:int, 1], [:int, 2], [:int, 3]], :select],
  [[:arg, :v]],
  [:send, [:lvar, :v], :even?]]
p result
# => true

longhand_block = ast_from "[1, 2, 3].select { |v| v.even? }"
result = longhand_block in [:block, receiver,
  [[:arg, :v]],
  [:send, [:lvar, :v], :even?]]
p result
# => true

p receiver
# => s(:send, s(:array, s(:int, 1), s(:int, 2), s(:int, 3)), :select)
p receiver.source
# => "[1, 2, 3].select"

longhand_block = ast_from "[1, 2, 3].select { |v| v.even? }"
result = longhand_block in [:block, receiver,
  [[:arg, arg_name]],
  [:send, [:lvar, ^arg_name], :even?]]
p result
# => true

p [receiver.source, arg_name]
# => ["[1, 2, 3].select", :v]

longhand_block = ast_from "[1, 2, 3].select { |v| v.even? }"
result = longhand_block in [:block, receiver,
  [[:arg, arg_name]],
  [:send, [:lvar, ^arg_name], called_method]]
p result
# => true

p [receiver.source, arg_name, called_method]
# => ["[1, 2, 3].select", :v, :even?]

def shorthandable?(ast)
  ast in [:block, receiver,
    [[:arg, arg_name]],
    [:send, [:lvar, ^arg_name], called_method]]
end

p shorthandable?(ast_from("[].select { |v| v.even? }"))
# => true
p shorthandable?(ast_from("[].reject { |x| x.odd? }"))
# => true
p shorthandable?(ast_from("[].map { |y| y + 1 }"))
# => false
p shorthandable?(ast_from("{}.select { |x, y| y.odd? }"))
# => false

require 'refactor'

class ShorthandRewrite < Refactor::Rule
  def on_block(node)
    return unless node in [:block, receiver,
      [[:arg, arg_name]],
      [:send, [:lvar, ^arg_name], method_name]]

    replace(node, "#{receiver.source}(&:#{method_name})")
  end
end

p ShorthandRewrite.process("[1, 2].select { |v| v.even? }")
# => "[1, 2].select(&:even?)"
