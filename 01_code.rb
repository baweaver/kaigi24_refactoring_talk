module Enumerable
  def tally_by(&block)
    map(&block).tally
  end
end

[1, 2, 3].tally_by(&:even?)
# => {false=>2, true=>1}

s(:begin,
  s(:module, s(:const, nil, :Enumerable),
    s(:def, :tally_by,
      s(:args, s(:blockarg, :block)),
      s(:send, s(:send, nil, :map,
        s(:block_pass, s(:lvar, :block))), :tally))),
  s(:send,
    s(:array, s(:int, 1), s(:int, 2), s(:int, 3)), :tally_by,
    s(:block_pass, s(:sym, :even?))))
