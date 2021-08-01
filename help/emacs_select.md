# emacs_select plugin

The emacs_select plugin adds emacs-like selection to micro. A function is provided to start selecting as the user moves the cursor around with the usual navigation keyboard shorcuts. This removes the need for special shortcuts to move the cursor with selection.

## Configuration

Bind the `lua:emacs_select.emacsSelect` command to a key binding.

For example, in `bindings.json`: `"CtrlSpace": "lua:emacs_select.emacsSelect"`

From the command interface: `> bind CtrlSpace "lua:emacs_select.emacsSelect"`

## Usage

The `emacsSelect` function toggles emacs select mode. When active, use normal cursor navigation shortucts to move the cursor and the selection end point. Cutting or copying the selection ends emacs select mode. 
