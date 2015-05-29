# config schema
module.exports =
  format_on_save:
    description: 'JSFormat will format the file before it is saved'
    type: 'boolean'
    default: true
  indent_with_tabs:
    type: 'boolean'
    default: false
  end_with_newline:
    type: 'boolean'
    default: true
  max_preserve_newlines:
    type: 'integer'
    default: 4
  preserve_newlines:
    type: 'boolean'
    default: true
  space_in_paren:
    title: 'Space in parentheses'
    type: 'boolean'
    default: false
  jslint_happy:
    title: 'JSLint happy'
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
  space_after_anon_function:
    title: 'Space after anonymous functions'
    type: 'boolean'
    default: false
  space_before_conditional:
    type: 'boolean'
    default: true
  eval_code:
    title: 'Evaluate code'
    type: 'boolean'
    default: false
  unescape_strings:
    type: 'boolean'
    default: false
  break_chained_methods:
    type: 'boolean'
    default: false
  e4x:
    title: 'e4x style'
    type: 'boolean'
    default: false
  comma_first:
    title: 'comma first'
    type: 'boolean'
    default: false
  ignore_files:
    type: 'array'
    default: ['.jshintrc']
    items:
      type: 'string'
