# Nvim config.

TODO: preserve default shortcuts, only add new ones when adding new functionality.
TODO: Generate all this similar to the bash `doc_bash`.

## General info.

* Run `:Update` to update everything.
* File tree shows everything by default, telescope ingores git-ignored files.

## Keymaps.

### Common. TODO: separate visual and others from common.

Mode|Key|Action
---|---|---
Normal, Visual|`5dd`|Repeat following command N (5) times.
Normal|`.`|Repeat input on selected line.
Normal, Visual|`<Leader>.`|Repeat command on selected line(s).
Normal|`zz`|Save all files.
Normal|`ZZ`, `<Space>z`|Save all and quit.
Normal|`ZQ`|Quit without saving.
Normal|`v`, `<Space>v`|Visual selection (cursor).
Normal|`V`|Visual selection (lines).
Normal|`<C-v>`|Visual selection (block).
Normal|`gh`|Go to the start of the line.
Normal|`gl`|Go to the end of the line.
Normal|`gj`|Go to the end of the file.
Normal|`gk`|Go to the top of the file.
Normal|`u`|Undo action.
Normal|`U`|Redo action (*remaps*: undo whole line), (*default*: `<C-r>`).
Visual|`u`|Convert selection to lowercase.
Visual|`U`|Convert selection to uppercase.
Visual|`~`|Toggle case.
Normal, Visual|`;`|Enter command mode (*default*: `:`).
Normal|`<Space>0`|Open shortcuts help.

### Align.

Mode|Key|Action
---|---|---
Visual|`<Space>A`|Align selection from the right.
Visual|`<Space>a`|Align selection from the left.

### Autocomplete.

Mode|Key|Action
---|---|---
Input|`<C-Space>`|Autocomplete.
Normal|`<C-Space>`|LSP autocomplete.

### Comments.

Mode|Key|Action
---|---|---
Normal, Visual|`<Space>/`|Toggle selected line(s) comment.

### File tree.

Mode|Key|Action
---|---|---
Normal|`<Space>1`|Toggle file tree.
Normal|`<Tab>`|Toggle directory or open file for preview.
Normal|`a`|Create file/directory.
Normal|`x`|Cut file/directory.
Normal|`p`|Paste file/directory.
Normal|`f`|Filter.
Normal|`F`|Reset filter.
Normal|`d`|Delete file/directory.
Normal|`r`|Rename file.
Normal|`R`|Refresh.
Normal|`s`|Open in system app.
Normal|`S`|Search.
Normal|`I`|Toggle gitignore filter.
Normal|`y`|Copy name.
Normal|`Y`|Copy relative path.

### Fold.

Mode|Key|Action
---|---|---
Normal|`<Space>o`|Toggle fold.
Normal|`<Space>O`|Fold everything.

### Git.

Mode|Key|Action
---|---|---
Normal|`<Space>g`|Toggle git inspection mode.

### Macros.

Mode|Key|Action
---|---|---
Visual|`mwx`|Unwrap selection (select the stuff inside wraps).
Visual|`mw"`|Wrap selection in ".
Visual|`mw3"`|Wrap selection in 3x ".
Visual|`mw'`|Wrap selection in '.
Visual|`mw(`|Wrap selection in ().
Visual|`mw{`|Wrap selection in {}.
Visual|`mw[`|Wrap selection in [].
Visual|`` mw` ``|Wrap selection in \`.
Visual|`` mw3` ``|Wrap selection in 3x \`.
Visual|`mw*`|Wrap selection in *.
Visual|`mw2*`|Wrap selection in 2x *.
Visual|`mw3*`|Wrap selection in 3x *.
Visual|`mw `|Wrap selection in spaces.
Normal, Visual|`mmx`|Markdown: set - [ ] as completed.
Normal, Visual|`mm `|Markdown: set - [x] as not completed.
Normal|`mmp`|Markdown: insert paragrapg (2x non-breakable spaces).
Visual|`mmb`|Markdown: make selection bold.
Visual|`mmi`|Markdown: make selection italic.
Visual|`mms`|Markdown: make selection strikethrough.
Visual|`mmr`|Markdown: make selection a reference.
Visual|`mmc`|Markdown: make selection a code block.
Normal|`mi`|Copy and increment selected line.
Normal|`ma`|Select all.

### Navigation.

Mode|Key|Action
---|---|---
Normal|`<Space>w`|Switch to the split above.
Normal|`<Space>a`|Switch to the split left.
Normal|`<Space>s`|Switch to the split below.
Normal|`<Space>d`|Switch to the split right.
Normal|`<Space>q`|Swtich to the buffer left.
Normal|`<Space>e`|Swtich to the buffer right.
Normal|`<Space>Q`|Move the buffer left.
Normal|`<Space>E`|Move the buffer right.
Normal|`<Space>x`|Close the buffer.
Normal|`<Space>X`|Close all invisible buffers.
Normal|`<Space>m`|Move split.
Normal|`<Space>\|`|Split vertically.
Normal|`<Space>-`|Split horizontally.
Normal|`<Space>c`|Close split.
Input|`<C-h>`|Move left.
Input|`<C-l>`|Move right.
Input|`<C-j>`|Move down.
Input|`<C-k>`|Move up.

### Telescope.

Mode|Key|Action
---|---|---
Normal|`<Space>ff`|Find files.
Normal|`<Space>fg`|Find grep (find text within files).
Normal|`<Space>fb`|Find buffer.
Normal|`<Space>fh`|Find help.
Normal|`<Space>ft`|Find treesitter (vars, functions etc).
Normal|`<Space>fa`|Find all (default treesitter window).

### Terminal.

Mode|Key|Action
---|---|---
Normal|`<Space>4`|Open terminal.
Terminal|`<Esc>`|Detach from terminal.

### To-do.

Write `TODO:` or `NOTE:` to make it searchable.

Mode|Key|Action
---|---|---
Normal|`<Space>3`|Open to-do list.

### Trouble.

Mode|Key|Action
---|---|---
Normal|`<Space>2`|Open LSP trouble list.

### Which key.

Mode|Key|Action
---|---|---
Normal|`<Space>0`|Show context hotkey help.

### Window management.

Mode|Key|Action
---|---|---
Normal|`-`|Decrease split size vertically.
Normal|`_`|Increase split size vertically.
Normal|`\`|Decrease split size horizontally.
Normal|`\|`|Increase split size horizontally.
Normal|`<Space>=`|Equalize split sizes.
