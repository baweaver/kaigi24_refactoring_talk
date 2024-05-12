Ripper.sexp "[1,2,3].map { |v| v * 2 }"

# AST
[:program,
 [[:method_add_block,
   [:call,
    [:array,
     [[:@int, "1", [1, 1]], [:@int, "2", [1, 3]], [:@int, "3", [1, 5]]]],
    [:@period, ".", [1, 7]],
    [:@ident, "map", [1, 8]]],
   [:brace_block,
    [:block_var,
     [:params, [[:@ident, "v", [1, 15]]], nil, nil, nil, nil, nil, nil],
     false],
    [[:binary,
      [:var_ref, [:@ident, "v", [1, 18]]],
      :*,
      [:@int, "2", [1, 22]]]]]]]]
