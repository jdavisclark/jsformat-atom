# config schema
module.exports =
  format_on_save:
    type: 'boolean'
    default: true
  indent_with_tabs:
    type: 'boolean'
    default: false
  max_preserve_newlines:
    type: 'integer'
    default: 4
  preserve_newlines:
    type: 'boolean'
    default: true
  space_in_paren:
    type: 'boolean'
    default: false
  jslint_happy:
    type: 'boolean'
    default: false
  brace_style:
    type: 'string'
    default: 'collapse'
    enum: ['collapse', 'expand', 'end-expand']
  keep_array_indentation:
    type: 'boolean'
    default: false
  keep_function_indentation:
    type: 'boolean'
    default: false
  space_before_conditional:
    type: 'boolean'
    default: true
  eval_code:
    type: 'boolean'
    default: false
  unescape_strings:
    type: 'boolean'
    default: false
  break_chained_methods:
    type: 'boolean'
    default: false
  e4x:
    type: 'boolean'
    default: false
