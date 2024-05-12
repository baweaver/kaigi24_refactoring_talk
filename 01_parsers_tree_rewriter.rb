require 'parser/current'

class RemoveDo < Parser::TreeRewriter
  def on_while(node)
    # Check if the statement starts with "do"
    remove(node.location.begin) if node.location.begin.is?('do')
  end
end

code = "while true do puts 'hello' end"
ast = Parser::CurrentRuby.parse(code)
buffer = Parser::Source::Buffer.new('(example)', source: code)
# 
# Rewrite the AST, returns a String with the new form.
puts RemoveDo.new.rewrite(buffer, ast)
# => while true puts 'hello' end
