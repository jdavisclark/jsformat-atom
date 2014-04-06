# JsFormat

Javascript + json formatting/beautification for the Atom text editor.

#### Keybinding
`ctrl+alt+f`

#### Command Palette
`JsFormat: Format`

#### Warning
This project is insanely pre-alpha.

#### Settings
JsFormat uses whatever tab/indent settings are configured with the standard ```Tab Length``` Atom settings. The ```Preferred Line Length``` Atom setting is only respected when the ```Soft Wrap At Preferred Line Length``` Atom setting is enabled.

The following **JsBeautifier** settings are available through the JsFormat settings panel (defaults shown below). Check out the official [jsbeautifier documentation](https://github.com/einars/js-beautify#options) for more details on the options:

* `indent_with_tabs`: false,
* `max_preserve_newlines`: 4,
* `preserve_newlines`: true,
* `space_in_paren`: false,
* `jslint_happy`: false,
* `brace_style`: "collapse",
* `keep_array_indentation`: false,
* `keep_function_indentation`: false,
* `space_before_conditional`: true,
* `eval_code`: false,
* `unescape_strings`: false,
* `break_chained_methods`: false,
* `e4x`: false
