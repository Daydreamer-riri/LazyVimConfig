local i = require("neogen.types.template").item

return {
  { nil, "/** @type $1 */", { no_results = true, type = { "type" } } },

  { nil, "/**", { no_results = true, type = { "file" } } },
  { nil, " * @module $1", { no_results = true, type = { "file" } } },
  { nil, " */", { no_results = true, type = { "file" } } },

  { nil, "/**", { type = { "class", "func" } } },
  { i.ClassName, " * $1", { type = { "class" } } },
  { i.Type, " * @template %s - $1", { type = { "func" } } },
  { i.Parameter, " * @param %s - $1", { type = { "func" } } },
  {
    { i.Parameter },
    " * @param %s - $1",
    { required = i.Tparam, type = { "func" } },
  },
  { i.Return, " * @returns $1", { type = { "func" } } },
  { nil, " */", { type = { "class", "func" } } },

  { nil, "/**", { no_results = true, type = { "property", "declaration", "func", "class" } } },
  { nil, " * $1", { no_results = true, type = { "property", "declaration", "func", "class" } } },
  { nil, " */", { no_results = true, type = { "property", "declaration", "func", "class" } } },
}
