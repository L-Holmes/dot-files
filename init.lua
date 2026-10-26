
-- STANDARD SETTINGS --
-- Disable default line numbers
-- vim.wo.number = true
-- vim.wo.relativenumber = true
-- ignore upper case when searching:
vim.opt.ignorecase = true
--ignore upper case unless searching with uppercase:
vim.opt.smartcase = true
-- num. spaces for a tab:
vim.opt.tabstop = 4
vim.o.tabstop = 4
vim.opt.shiftwidth = 4
-- whether neovim should transform tab character to space
vim.opt.expandtab = true
-- No line wrap
vim.o.wrap = false
-- Enable 24-bit RGB colors
vim.o.termguicolors = true          
-- Make set wrap respect indent level
vim.opt.breakindent = true
-- go anywhere
vim.o.virtualedit = "all"
-- Enable auto-indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
-- For programming languages, use cindent for better C-style indentation
vim.opt.cindent = true
-- default to light background
vim.o.background=light

-- ????
vim.wo.signcolumn = 'yes'
vim.o.completeopt = 'menuone,noselect'
 
-- Make all [search] commands have /g at the end, by default
vim.api.nvim_set_option('gdefault', true)
 
-- Make :Recent show recent files
vim.opt.cmdheight = 2 --this is required to prevent the need to 'press enter' for the below command
vim.cmd("command! Recent :new +setl\\ buftype=nofile | 0put =v:oldfiles |  nnoremap <buffer> l :e <C-r>=getline('.')<CR><CR> | 1 | wincmd p | w | q")
 
--> yank/paste to clipboard
-- vim.cmd('set clipboard=unnamed')
vim.opt.clipboard = "unnamedplus"

-- REMAPS --
 
-- ===========================================================================================
-- consistency (act on entire line by default!) --
 
-- aims:
--> Minimal key presses, ideally on easy to press keys (speed)
--> Minimal things to need to remember
--> Consistency (e.g. with capitalising, prepending commands with a certain letter, etc).
--> Not mentally taxing (e.g. scrolling makes things much easier when trying to read through things...)
 
 
-- don't overcomplicate:
              -- because i could just keep extending and complicating... like adding collapsing functions etc.. etc.. ai etc. etc.
    -- i just want something minimal...
    -- complicated things like that should really come under 'pipe the current file into a util, which then spits back the line number, and go to that line number'
-- so:
              -- replacing across a project should be done externally
              -- replacing in a project should be done externally (possibly through pipe though)
 
-- what should a suckless text editor allow for?
--> changing parts of a file
--> whilst getting context from other areas around that part of the file
--> and allowing for that context to quickly change (i.e. you scroll up slightly and quickly able to see other part of ...)
--> should work faster than less + sub.
              --> so what can a text editor allow for that less + sed can't?
                             --> think less, code better
                             --> quick actions, related to current context (e.g. change the line above; or the character to the right)
                             --> visual feedback in the editor about what you are acting on
 
-- General guideance:
--> by default, operations act on an entire line
 
-- laws:
--> The regular keys are made up of the primary keys, and the selects
              -- Primary =
                             -- copy.
                             -- paste. Either paste nothing (deleting), paste something (pasting), or paste new (inserting)
                             -- go to
                             -- save / quit
                             -- scroll
 
-- best solution:
              -- for selecting, i like the concept of doing all, then toggle at the end if the thing selected was incorrect.
              --> however, this does present difficulties when thinking about complex multi-line texts that could have an infinite number of combinations...
              --> e.g. if you have just 100s of lines of 'the' and you want to make the one right in the middle, 5 lines down, 3 words to the right 'hi'...
                             --> you couldn't do this with the find and select.
                             --> you could do this with the row and column numbers, but then that will intruduce a delay, and will be very difficult to even see for the user. Couldn't add grid lines as they'd make it unreadable. They need to be able to look at it and know exactly how to get there.
                             --> ultimately, I think the user would have to determine what to do based on context... The perfect thing to do is based off of what you are doing...
 
------------------------------------------------------------------------------------------------
 
--> leader
vim.g.mapleader = " "
 
-- Saving / exiting
vim.api.nvim_set_keymap('n', '<leader>l', ':wa<CR>', {noremap = true}) --
-- vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>Oil<CR>', {noremap = true})  --
vim.keymap.set("n", "<leader>w", "<CMD>update | Oil<CR>", { desc = "Save file and open Oil" })
 
-- undo
vim.api.nvim_set_keymap('n', '<leader>r', "u", { noremap = true, silent = true }) --
 
-- kj to esc
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'KJ', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('x', 'fj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('x', 'FJ', '<Esc>', { noremap = true })


-- == FULL KEYMAP ==
-- Generic Leader keys:   [ ' ', 'a', 'o', 'r' ]
-- Copy keys:             [ {'c', 'q'} ]
-- Paste keys:            [ {'p', 'b'}, {'e','u'}, {'n','m'} ]
-- selection keys:        [ 'w', 'v', '\'', '"', 'x' ]
-- mark & move keys:      [ 'f', 't', '/' ]
-- general movement keys: [ 'h', 'j', 'k', 'l' ]
-- Special movement keys: [ 's', 'd' ]
-- Go to keys:            [ 'g' ]
-- potential keys:        [ 'i', 'y' ';', '\', ',']  
 
-- === Copy / Pasting General rules ===
-- single letter = acts on the whole line
-- single uppercase letter = act on the current char
-- 'o'-letter = acts on a single char to the left/RIGHT of the cursor "one ..." i.e.
-- alt-letter = acts from the left of the cursor to the start of the line / FROM THE RIGHT OF THE CURSOR TO THE END OF THE LINE
-- <leader>-letter = acts on the line below / ACTS ON THE LINE ABOVE
 
-- == REGULAR KEYS ==                                        == LEADER KEYS MAP ==
-- a = leader                                               |
-- b = "baste"...                                           | "baste"... create new line above | paste over that
-- c =                                                      |
-- d = !!!!!!!!!!                                           |
-- e = "empty"...                                           | "empty"... create new line below | paste nothing over that
-- f = Move foreward to letter ...                          |
-- g = Go to...                                             |
-- h = Move left                                            |
-- i = "iank"...                                            |
-- j = Scroll down                                          | scroll down
-- k = Scroll up                                            | scroll up
-- l = Move right                                           |
-- m = "mew"...                                             | "mew"... create new line above | paste new text over that
-- n = "new"...                                             | "new"... create new line below | paste new text over that
-- o = "one"... leader                                      |
-- p = "paste"...                                           | "paste"... select current line | paste over top
-- q =                                                      |
-- r = "right"... leader                                    | "revert"... undo
-- s = !!!!!!!!!!!!                                         | save
-- t =  Move foreward until letter ...                      |
-- u = "umpty"...                                           | "umpty"... create new line above | paste nothing over that
-- v = Select last selected area                            |
-- w = Select word                                          | "we done here"... exit
-- x = Select special ...                                   |
-- y = "yank"...                                            |
-- z =                                                      |
-- ; = !!!!!!!!!!                                           |

-- === SELECTING OBJECTS ===
vim.api.nvim_set_keymap('n', 'a', 'v`a', {noremap = true, silent = true, nowait = true})    -- select from the mark to the current point | copy

-- selecting [things other than the current char / line]
vim.api.nvim_set_keymap('n', 'w', 'viw', {noremap = true, silent = true})    -- select word
vim.api.nvim_set_keymap('n', 'v', '`[v`]', {noremap = true, silent = true})     -- select previously selected thing  TODO make it work for the last pasted thing as well???
vim.api.nvim_set_keymap('n', 'O', 'vip', {noremap = true, silent = true})    -- select paragraph
 
-- selecting in-between
vim.api.nvim_set_keymap('n', '\'', 'vi\'', {noremap = true, silent = true})  -- select speach marks contents
vim.api.nvim_set_keymap('n', '"', 'vi"', {noremap = true, silent = true})    -- select speach marks contents
vim.api.nvim_set_keymap('n', '{', 'vi{', {noremap = true, silent = true})    -- select brackets contents
vim.api.nvim_set_keymap('n', '(', 'vi(', {noremap = true, silent = true})    -- select brackets contents

-- === NORMAL MODE ===
 
-- copying  (iank and yank)
vim.api.nvim_set_keymap('n', 'i', '^y$', {noremap = true, silent = true, nowait = true})     -- select current line | copy
vim.api.nvim_set_keymap('n', 'y', 'yl', {noremap = true, silent = true, nowait = true})      -- select current char | copy
vim.api.nvim_set_keymap('n', 'oi', 'yl', {noremap = true, silent = true, nowait = true})     -- select current char | copy
vim.api.nvim_set_keymap('n', 'ri', 'y$', {noremap = true, silent = true, nowait = true})     -- select from current char to end of line | copy
vim.api.nvim_set_keymap('n', 'ry', 'y^', {noremap = true, silent = true, nowait = true})     -- select from current char to start of line | copy
 
-- pasting  (paste and baste?)
vim.api.nvim_set_keymap('n', 'p', '"_ddO<Esc>p==', {noremap = true, silent = true, nowait = true})     -- select current line | paste over top
vim.api.nvim_set_keymap('n', 'b', 'vp==', {noremap = true, silent = true, nowait = true})                -- select current char | paste over top
vim.api.nvim_set_keymap('n', 'op', 'a <Esc>vp==', {noremap = true, silent = true, nowait = true})        -- create new char to right of current char | paste over that
vim.api.nvim_set_keymap('n', 'ob', 'i <Esc>vp==', {noremap = true, silent = true, nowait = true})        -- create new char to left of current char | paste over that
vim.api.nvim_set_keymap('n', 'rp', 'p', {noremap = true, silent = true, nowait = true})              -- select from current char to end of line | paste over that
vim.api.nvim_set_keymap('n', 'rb', 'hp', {noremap = true, silent = true, nowait = true})              -- select from current char to start of line | paste over that
vim.api.nvim_set_keymap('n', '<leader>p', 'o<Esc>p==', {noremap = true, silent = true, nowait = true}) -- create new line below | paste over that
vim.api.nvim_set_keymap('n', '<leader>b', 'O<Esc>p==', {noremap = true, silent = true, nowait = true}) -- create new line above | paste over that
 
-- pasting empty (deleting)  (empty and umpty?)
vim.api.nvim_set_keymap('n', 'e', '^d$"_dd', {noremap = true, silent = true, nowait = true})           -- select current line | paste nothing over top (delete the line)
vim.api.nvim_set_keymap('n', 'u', 'a <Esc>', {noremap = true, silent = true, nowait = true})                -- select current char | paste nothing over top (delete the char)
vim.api.nvim_set_keymap('n', 'oe', 'dl', {noremap = true, silent = true, nowait = true})          -- create new char to right of current char | paste nothing over that
vim.api.nvim_set_keymap('n', 'ou', 'i <Esc>', {noremap = true, silent = true, nowait = true})          -- create new char to left of current char | paste nothing over that
vim.api.nvim_set_keymap('n', 're', 'D', {noremap = true, silent = true, nowait = true})                -- select from current char to end of line | paste nothing over that (delete)
vim.api.nvim_set_keymap('n', 'ru', 'd^', {noremap = true, silent = true, nowait = true})               -- select from current char to start of line | paste nothing over that (delete)
vim.api.nvim_set_keymap('n', '<leader>e', 'o<Esc>', {noremap = true, silent = true, nowait = true})    -- create new line below | paste nothing over that
vim.api.nvim_set_keymap('n', '<leader>u', 'O<Esc>', {noremap = true, silent = true, nowait = true})    -- create new line above | paste nothing over that
 
-- pasting new text (inserting)  (new and mew)
vim.api.nvim_set_keymap('n', 'n', 'cc', {noremap = true, silent = true, nowait = true})                -- select current line | paste new text over top
vim.api.nvim_set_keymap('n', 'm', 'r', {noremap = true, silent = true, nowait = true})                 -- select current char | paste new text over (replace char)
vim.api.nvim_set_keymap('n', 'on', 'a', {noremap = true, silent = true, nowait = true})                -- create new char to right of current char | paste new text over that
vim.api.nvim_set_keymap('n', 'om', 'i', {noremap = true, silent = true, nowait = true})                -- create new char to left of current char | paste new text over that
vim.api.nvim_set_keymap('n', 'rn', 'Da', {noremap = true, silent = true, nowait = true})               -- select from current char to end of line | paste new text over that
vim.api.nvim_set_keymap('n', 'rm', 'd^i', {noremap = true, silent = true, nowait = true})              -- select from current char to start of line | paste new text over that
vim.api.nvim_set_keymap('n', '<leader>n', 'o<Esc>i', {noremap = true, silent = true, nowait = true})   -- create new line below | paste new text over that
vim.api.nvim_set_keymap('n', '<leader>m', 'O<Esc>i', {noremap = true, silent = true, nowait = true})   -- create new line above | paste new text over that
vim.api.nvim_set_keymap('n', 'oN', 'A', {noremap = true, silent = true, nowait = true})                -- create new char at very right of sentence| paste new text over that
vim.api.nvim_set_keymap('n', 'oM', 'I', {noremap = true, silent = true, nowait = true})                -- create new char at very left of the sentence | paste new text over that
 
vim.api.nvim_set_keymap('n', 't', 'mat', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'T', 'maT', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '/', 'ma/', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '?', 'ma?', {noremap = true, silent = true})
 
-- 'go' commands
vim.api.nvim_set_keymap('n', 'gk', 'maH', {noremap = true, silent = true}) -- Go top of visible screen
vim.api.nvim_set_keymap('n', 'gj', 'maL', {noremap = true, silent = true}) -- Go bottom of visible screen
vim.api.nvim_set_keymap('n', 'ge', 'maG', {noremap = true, silent = true}) -- Go to end of file
vim.api.nvim_set_keymap('n', 'gl', 'ma$', {noremap = true, silent = true}) -- Go to right end of line
vim.api.nvim_set_keymap('n', 'gh', 'ma^', {noremap = true, silent = true}) -- Go to left end of line
vim.api.nvim_set_keymap('n', 'g0', 'ma0', {noremap = true, silent = true}) -- Go to left end of line
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true}) -- Go to definition
vim.api.nvim_set_keymap('n', 'g\'', '\'', {noremap = true}) -- go to mark
vim.api.nvim_set_keymap('n', 'gp', '<C-o>', {noremap = true}) -- Go to previous position

-- === VISUAL MODE ===

-- copying  (iank and yank)
vim.api.nvim_set_keymap('v', 'i', 'y', {noremap = true, silent = true, nowait = true})     -- select current line | copy
 
-- pasting  (paste and baste?)
vim.api.nvim_set_keymap('v', 'p', 'p', {noremap = true, silent = true, nowait = true})     -- select current line | paste over top
 
-- pasting empty (deleting)  (empty and umpty?)
vim.api.nvim_set_keymap('v', 'e', 'd', {noremap = true, silent = true, nowait = true})           -- select current line | paste nothing over top (delete the line)
 
-- pasting new text (inserting)  (new and mew)
vim.api.nvim_set_keymap('v', 'n', 'c', {noremap = true, silent = true, nowait = true})                -- select current line | paste new text over top
vim.api.nvim_set_keymap('v', 'm', 'r', {noremap = true, silent = true, nowait = true})                 -- select current char | paste new text over (replace char)
 
-- movement
vim.api.nvim_set_keymap('v', '<leader>s', 'f', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>S', 'F', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 't', 't', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'T', 'T', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '/', '/', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '?', '?', {noremap = true, silent = true})
 
-- 'go' commands
vim.api.nvim_set_keymap('v', 'gk', 'H', {noremap = true, silent = true}) -- Go top of visible screen
vim.api.nvim_set_keymap('v', 'gj', 'L', {noremap = true, silent = true}) -- Go bottom of visible screen
vim.api.nvim_set_keymap('v', 'ge', 'G', {noremap = true, silent = true}) -- Go to end of file
vim.api.nvim_set_keymap('v', 'gl', '$', {noremap = true, silent = true}) -- Go to right end of line
vim.api.nvim_set_keymap('v', 'gh', '^', {noremap = true, silent = true}) -- Go to left end of line
vim.api.nvim_set_keymap('v', 'g0', '0', {noremap = true, silent = true}) -- Go to left end of line
vim.api.nvim_set_keymap('v', 'g\'', '\'', {noremap = true}) -- go to mark
vim.api.nvim_set_keymap('v', 'gp', '<C-o>', {noremap = true}) -- Go to previous position

-- =====================
 
-- ======== FUNCTION SELECTION (xf) ========
vim.keymap.set('n', 'xf', function()
  local current_line = vim.fn.line('.')
  
  -- Search up for the first line with no indenting (or start of file)
  local start_line = 1
  for line_num = current_line, 1, -1 do
    local line_text = vim.fn.getline(line_num)
    -- Check if line has no indentation (no leading tabs or spaces) and is not empty
    if line_text:match('^[^%s\t]') then
      start_line = line_num
      break
    end
  end
  
  -- Search down for the first line after start_line with no indenting (or end of file)
  local end_line = vim.fn.line('$')
  for line_num = start_line + 1, vim.fn.line('$') do
    local line_text = vim.fn.getline(line_num)
    -- Check if line has no indentation (no leading tabs or spaces) and is not empty
    if line_text:match('^[^%s\t]') then
      end_line = line_num -- Select up to the line before this one
      break
    end
  end
  
  -- Select from start_line to end_line inclusive
  vim.fn.cursor(start_line, 1)
  vim.cmd('normal! V')
  vim.fn.cursor(end_line, 1)
end, { noremap = true, silent = true })



-- ======== CLASS SELECTION (xc) ========
-- TODO (2nd indented function)

-- ======== LOOP SELECTION (xl) ========
vim.keymap.set('n', 'xl', function()
  -- Find loop start
  vim.fn.search('^\\s*for \\|^\\s*while ', 'bcW')
  local loop_line = vim.fn.line('.')
  local loop_indent = vim.fn.indent(loop_line)
 
  -- Find loop end
  vim.fn.cursor(loop_line, 1)
  local last_body_line = loop_line
  while true do
    vim.fn.search('^\\s*\\S', 'W')
    local current_indent = vim.fn.indent(vim.fn.line('.'))
    if current_indent <= loop_indent and vim.fn.line('.') > loop_line then
      break
    end
    if not vim.fn.getline('.'):match('^%s*$') then
      last_body_line = vim.fn.line('.')
    end
  end
 
  -- Select loop
  vim.api.nvim_command('normal! ' .. loop_line .. 'GV' .. last_body_line .. 'G')
end, { noremap = true, silent = true })
 
-- ======== PARAMETER SELECTION (xp) ========
vim.keymap.set('n', 'xp', function()
  -- Find function definition
  vim.fn.search('^\\s*def \\w\\+(\\?', 'bcW')
  local line = vim.fn.getline('.')
 
  -- Find parentheses
  local param_start = line:find('%(')
  local param_end = line:find('%)')
 
  if param_start and param_end then
    -- Select parameters (single line)
    vim.fn.cursor(vim.fn.line('.'), param_start + 1)
    vim.cmd('normal! v'..(param_end - 1)..'|')
  elseif param_start then
    -- Handle multi-line parameters
    vim.fn.cursor(vim.fn.line('.'), param_start)
    vim.cmd('normal! va(')
  end
end, { noremap = true, silent = true })
 
-- ======== CONDITIONAL SELECTION (xi) ========
vim.keymap.set('n', 'xi', function()
  -- Find the start of the if block
  vim.fn.search('^\\s*if\\s', 'bcW')
  local start_line = vim.fn.line('.')
  local base_indent = vim.fn.indent(start_line)
 
  -- Create a pattern to match all conditional keywords
  local pattern = '^\\s*if\\s\\|^\\s*elif\\s\\|^\\s*else\\s*:'
 
  -- Find the end of the entire conditional chain
  vim.fn.cursor(start_line, 1)
  local end_line = start_line
 
  while true do
    -- Find next conditional line at same indent level
    local found_line = vim.fn.search(pattern, 'W')
    if found_line == 0 then break end  -- No more matches
   
    local current_indent = vim.fn.indent(vim.fn.line('.'))
    if current_indent < base_indent then break end  -- Outdented
   
    -- Update end position if at same indent level
    if current_indent == base_indent then
      end_line = vim.fn.line('.')
    end
  end
 
  -- Find the actual end of the last block
  vim.fn.cursor(end_line, 1)
  local last_indent = vim.fn.indent(end_line)
  while true do
    vim.fn.search('^\\s*\\S', 'W')  -- Next non-blank line
    local current_indent = vim.fn.indent(vim.fn.line('.'))
    if current_indent <= last_indent and vim.fn.line('.') > end_line then
      break
    end
    end_line = vim.fn.line('.')
  end
 
  -- Select from start to end
  vim.api.nvim_command('normal! '..start_line..'GV'..end_line..'G')
end, { noremap = true, silent = true })
 
vim.keymap.set('n', 'xI', function()
  -- Find conditional start (if/elif/else)
  vim.fn.search('^\\s*if \\|^\\s*elif \\|^\\s*else\\s*:', 'bcW')
  local cond_line = vim.fn.line('.')
  local cond_indent = vim.fn.indent(cond_line)
 
  -- Find conditional end
  vim.fn.cursor(cond_line, 1)
  local last_body_line = cond_line
  while true do
    vim.fn.search('^\\s*\\S', 'W')
    local current_indent = vim.fn.indent(vim.fn.line('.'))
    if current_indent <= cond_indent and vim.fn.line('.') > cond_line then
      break
    end
    if not vim.fn.getline('.'):match('^%s*$') then
      last_body_line = vim.fn.line('.')
    end
  end
 
  -- Select conditional block
  vim.api.nvim_command('normal! ' .. cond_line .. 'GV' .. last_body_line .. 'G')
end, { noremap = true, silent = true })
 
vim.api.nvim_set_keymap('x', 'p', "'pgvy'", { noremap = true, silent = true, expr = true }) -- Keep pasting the same thing in visual mode (without the replaced text overwriting the thing being pasted)
 
-- make j and k scroll
vim.keymap.set('n', 'j', function()
  if vim.v.count == 0 then
    return 'j<C-e>'
  else
    return 'j'
  end
end, {expr = true, noremap = true, silent = true})
vim.keymap.set('n', 'k', function()
  if vim.v.count == 0 then
    return 'k<C-y>'
  else
    return 'k'
  end
end, {expr = true, noremap = true, silent = true})
 
 
-- Centre when jumping to next match
vim.api.nvim_set_keymap('n', ';', 'nzz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ',', ';zz', {noremap = true, silent = true})
 
-- Stay at the start of the line when joining
vim.api.nvim_set_keymap('n', 'J', 'J0', {noremap = true, silent = true})
 
-- Map <leader>n/m to page forward / back since ctrl is awkward
 
-- Shift + Tab to perform an unindent in Insert mode
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true })
 
-- Stay in indent mode
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true })
 
-- User <leader>r to replace the word underneath the cursor (need to use /c manually for confirmation ;
-- for confirm options: q = skip to next file ; a = replace all in current file,q ; l = y, q; <scrolling options> )
-- vim.api.nvim_set_keymap('n', '<leader>r', [[:%s/<C-r><C-w>/]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>R', [[:wa | execute 'grep' '<C-r><C-w>' | cfdo %s/<C-r><C-w>/]], { noremap = true, silent = true })
 
-- ===========================================================================================
 
-- UNIMPAIRED REMAPS --
 
-- Toggle spell checking
vim.api.nvim_set_keymap('n', '[s', ':setlocal spell!<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']s', ':setlocal spell!<CR>', {noremap = true})
 
-- Toggle quickfix window
vim.api.nvim_set_keymap('n', '[q', ':cprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']q', ':cnext<CR>', {noremap = true})
 
---------------------------------------------------
 
-- SET UP GLOBAL RIPGREP SEARCH --
vim.cmd([[set grepprg=rg\ --vimgrep\ --smart-case]])
vim.cmd([[set grepformat=%f:%l:%c:%m]])
 
-- Create a custom grep command that works around the Windows temporary file issue
vim.api.nvim_create_user_command(
  'Grep',
  function(opts)
    local args = opts.args
    local search_term = args
    local file_pattern = ""
   
    -- Check if we have file pattern specified with -e
    if args:find("-e") then
      search_term, file_pattern = args:match("(.*)%s+-e%s+(.*)")
    end
   
    -- Use lua to execute the command directly and capture output
    local command = 'rg --vimgrep --smart-case --no-heading '
   
    -- Apply file type filters if specified
    if file_pattern ~= "" then
      for ext in file_pattern:gmatch("[^,]+") do
        command = command .. ' --glob="*.' .. ext .. '" '
      end
    end
   
    command = command .. vim.fn.shellescape(search_term)
   
    -- Execute command and capture output directly
    local output = vim.fn.system(command)
   
    -- Clear and set quickfix list manually
    vim.fn.setqflist({}, 'r')
   
    for line in output:gmatch("[^\r\n]+") do
      local file, lnum, col, text = line:match("([^:]+):(%d+):(%d+):(.*)")
      if file and lnum and col and text then
        vim.fn.setqflist({{
          filename = file,
          lnum = tonumber(lnum),
          col = tonumber(col),
          text = text
        }}, 'a')
      end
    end
   
    vim.cmd('copen')
  end,
  { nargs = '+' }
)
 
-- Enhanced search and replace with file type filtering
vim.api.nvim_create_user_command(
  'Replace',
  function(opts)
    local args = opts.args
    local search_term, replace_term = args:match("^([^/]+)/([^/]*)$")
   
    if not search_term then
      print("Usage: Replace search_term/replace_term [-e file_extensions]")
      return
    end
   
    -- Check for file extensions
    local file_extensions = ""
    if args:find("-e%s+") then
      file_extensions = args:match("-e%s+([%w,%.]+)")
    end
   
    -- Build the grep command
    local grep_cmd = 'Grep "' .. search_term .. '"'
    if file_extensions ~= "" then
      grep_cmd = grep_cmd .. ' --type ' .. file_extensions
    end
   
    -- Save all buffers first
    vim.cmd('wa')
   
    -- Execute the grep command to populate the quickfix list
    vim.cmd(grep_cmd)
   
    -- Execute the replacement on each file in the quickfix list
    vim.cmd('cfdo %s/' .. search_term .. '/' .. (replace_term or "") .. '/gc | update')
  end,
  { nargs = 1 }
)
 
-- XXXXXXX --
 
-- set back to the underscore cursor when leaving vim
vim.cmd([[
  augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd vimLeave * set guicursor=a:hor20
  augroup END
]])
 
-- Define the custom command to replace selected text with clipboard contents
vim.cmd([[
command! -range -nargs=0 ReplaceSelectedText :<line1>,<line2>s/\%V\(\%V.*\%V\)/\=@*
]])
 
-- prevent nvim from auto-commenting lines
vim.cmd[[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]]

-- PLUGINS--
--> Bootstrap / setup if needed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
 
-- Install plugins
require("lazy").setup({
    --- THEMES ---
    --- GENERAL THINGS NVIM SHOULD HAVE BY DEFAULT ---
    -- Add change 'sorrounding' brackets
    'tpope/vim-surround',
    -- Text alignment
    -- e.g. 'gl <ip> <=>' to align the <inner paragraph> on <=
    -- 'tommcdo/vim-lion',
    -- Making global marks be unique to project + other related improvements
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- CLOSING BUFFERS --
    {
        "chrisgrieser/nvim-early-retirement",
        config = true,
        event = "VeryLazy",
    },

    -- THINGS THAT MAKE NVIM BETTER FOR MY USE CASE --
    -- Smooth scrolling animation
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({})
        end
    },

    -- Making 'go to definition' work
    {
        'neovim/nvim-lspconfig'
    },
    -- Centre text in middle of screen
    {
        "shortcuts/no-neck-pain.nvim", version = "*"
    },
    -- THINGS THAT I WOULD USE AN EXTERNAL CLI FOR, BUT NOTHING COMPARES TO THIS --
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }
 
})
 
-- OTHER --
 
require("early-retirement").setup({
              retirementAgeMins = 10,
              ignoredFiletypes = {},
              ignoreFilenamePattern = "",
              ignoreAltFile = true,
              minimumBufferNum = 1,
              ignoreUnsavedChangesBufs = true,
              ignoreSpecialBuftypes = true,
              ignoreVisibleBufs = true,
              ignoreUnloadedBufs = false,
              notificationOnAutoClose = false,
              deleteBufferWhenFileDeleted = false,
})
 
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                   Harpoon
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- List of files to jump between, local to a given project
local harpoon = require("harpoon")
harpoon:setup()
 
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                   Scrolling
------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
neoscroll = require('neoscroll')
local keymap = {
              ["<leader>j"] = function() neoscroll.ctrl_f({ duration = 120 }) end;
              ["<leader>k"] = function() neoscroll.ctrl_b({ duration = 120 }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end


------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                   File navigation
------------------------------------------------------------------------------------------------------------------------------------------------------------------

require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
  default_file_explorer = true,
  -- Id is automatically added at the beginning, and name at the end
  -- See :help oil-columns
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  -- Buffer-local options to use for oil buffers
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window-local options to use for oil buffers
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
  delete_to_trash = false,
  -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
  skip_confirm_for_simple_edits = false,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  -- (:help prompt_save_on_select_new_entry)
  prompt_save_on_select_new_entry = true,
  -- Oil will automatically delete hidden buffers after this delay
  -- You can set the delay to false to disable cleanup entirely
  -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    -- Enable or disable LSP file operations
    enabled = true,
    -- Time to wait for LSP file operations to complete before skipping
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },
  -- Constrain the cursor to the editable parts of the oil buffer
  -- Set to `false` to disable, or "name" to keep it on the file names
  constrain_cursor = "editable",
  -- Set to true to watch the filesystem for changes and reload oil
  watch_for_changes = false,
  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions
  keymaps = {
    -- Default keymaps are listed here, you can add or change them
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["="] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",

    -- Add your custom remappings here
    ['l'] = 'actions.select', -- Go into folder / open file
    ['h'] = 'actions.parent',   -- Go back up a level
    ["_"] = {
        callback = function()
            local dir = require("oil").get_current_dir()

            -- This is the correct command to change the GLOBAL working directory.
            vim.cmd.cd(dir)

            -- The notification confirms the command ran successfully.
            vim.notify("Global CWD set to: " .. dir, vim.log.levels.INFO, { title = "Oil" })
        end,
        desc = "Change Global CWD to the current oil directory",
        mode = "n",
    },

    ["q"] = {
    callback = function()
      -- 1. Get the directory you are currently viewing in oil.
      local dir = require("oil").get_current_dir()
      
      if dir and dir ~= "" then
        -- 2. Define the path for our temporary file.
        local temp_file = os.getenv("HOME") .. "/.cache/nvim/last_dir"
        
        -- 3. Ensure the .cache/nvim directory exists.
        vim.fn.mkdir(os.getenv("HOME") .. "/.cache/nvim", "p")
        
        -- 4. Write the directory path to the file immediately.
        local f = io.open(temp_file, "w")
        if f then
          f:write(dir .. "\n")
          f:close()
          
          -- 5. Quit Neovim completely.
          vim.cmd("qall")
        else
          -- Provide an error message if the file can't be written.
          vim.notify("Error: Could not write to " .. temp_file, vim.log.levels.ERROR)
        end
      end
    end,
    desc = "Save current directory and Quit Nvim",
    mode = "n",
  },
},
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = false,
    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name, bufnr)
      local m = name:match("^%.")
      return m ~= nil
    end,
    -- This function defines what will never be shown, even when `show_hidden` is set
    is_always_hidden = function(name, bufnr)
      return false
    end,
    -- Sort file names with numbers in a more intuitive order for humans.
    -- Can be "fast", true, or false. "fast" will turn it off for large directories.
    natural_order = "fast",
    -- Sort file and directory names case insensitive
    case_insensitive = false,
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { "type", "asc" },
      { "name", "asc" },
    },
    -- Customize the highlight group for the file name
    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
      return nil
    end,
  },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
  -- EXPERIMENTAL support for performing file operations with git
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 2,
    -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
    get_win_title = nil,
    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
    preview_split = "auto",
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
  -- Configuration for the file preview window
  preview_win = {
    -- Whether the preview window is automatically updated when the cursor is moved
    update_on_cursor_moved = true,
    -- How to open the preview window "load"|"scratch"|"fast_scratch"
    preview_method = "fast_scratch",
    -- A function that returns true to disable preview on a file e.g. to avoid lag
    disable_preview = function(filename)
      return false
    end,
    -- Window-local options to use for preview window buffers
    win_options = {},
  },
  -- Configuration for the floating action confirmation window
  confirmation = {
    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a single value or a list of mixed integer/float types.
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
    max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
    min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
    width = nil,
    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a single value or a list of mixed integer/float types.
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
    max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
    min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
    height = nil,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating progress window
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    minimized_border = "none",
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating SSH window
  ssh = {
    border = "rounded",
  },
  -- Configuration for the floating keymaps help window
  keymaps_help = {
    border = "rounded",
  },
})
 
-------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                   Other
------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
-- ======================================
-- PLUGIN REMAPS --
-- ======================================
 
-- HARPOON --
-- Add to list
vim.keymap.set("n", "<leader>h<Space>", function() harpoon:list():add() end)
-- Show navigation menu
vim.keymap.set("n", "<leader>hw", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Selecting the items
vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>he", function() harpoon:list():next() end)
vim.keymap.set("n", "<leader>hr", function() harpoon:list():prev() end)
 
------------------------
 
-- random fixes
vim.keymap.del('n', 'ds')
vim.keymap.del('x', 'a%')


---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
 
-- Letter-based line numbering for Neovim
-- Extended sequence: j,k,l,;,i,o,u,p,',h,m,',',.,/,n,v,r,a
-- Then underscore-prefixed: _j,_k,_l,_;,_i,_o,_u,_p,_',_h,_m,_,,_.,_/,_n,_v,_r,_a
-- Then number-prefixed: 1j,1k,1l... 2j,2k,2l... etc.

-- Base character sequence (removed q as well)
local base_chars = {'j','k','l',';','i','o','u','p',"'",'h','m',',','.','/',
                   'n','v','r','a'}
local base_count = #base_chars -- This is 18

-- Generate extended letter sequence
local function get_letter_label(n)
    if n <= base_count then
        -- Block 1: j,k,l,;,i,o,u,p,',h,m,',',.,/,n,v,r,a (positions 1-18)
        return base_chars[n]
    elseif n <= base_count * 2 then
        -- Block 2: _j,_k,_l,_;,_i,_o,_u,_p,_',_h,_m,_,,_.,_/,_n,_v,_r,_a (positions 19-36)
        local idx = ((n - 1) % base_count) + 1
        return '_' .. base_chars[idx]
    elseif n <= base_count * 3 then
        -- Block 3: fj,fk,fl,f;,fi,fo,fu,fp,f',fh,fm,f,,f.,f/,fn,fv,fr,fa (positions 37-54)
        local idx = ((n - 1) % base_count) + 1
        return 'f' .. base_chars[idx]
    else
        -- Block 4+: 1j,1k,1l... 2j,2k,2l... etc. (positions 55+)
        local block_num = math.floor((n - base_count * 3 - 1) / base_count) + 1
        local idx = ((n - 1) % base_count) + 1
        return tostring(block_num) .. base_chars[idx]
    end
end

-- Convert letter back to distance (inverse of get_letter_label)
local function letter_to_distance(letter)
    -- Helper to find character index in base_chars
    local function find_char_index(char)
        for i, c in ipairs(base_chars) do
            if c == char then
                return i
            end
        end
        return nil
    end
    
    if #letter == 1 then
        -- Single character from base sequence (block 1: positions 1-18)
        local idx = find_char_index(letter)
        if idx then
            return idx
        end
    elseif #letter == 2 and letter:sub(1, 1) == '_' then
        -- Underscore-prefixed sequence (block 2: positions 19-36)
        local char = letter:sub(2, 2)
        local idx = find_char_index(char)
        if idx then
            return base_count + idx
        end
    elseif #letter == 2 and letter:sub(1, 1) == 'f' then
        -- f-prefixed sequence (block 3: positions 37-54)
        local char = letter:sub(2, 2)
        local idx = find_char_index(char)
        if idx then
            return base_count * 2 + idx
        end
    else
        -- Numbered sequence (block 4+: positions 55+)
        local num_str, char = letter:match('^(%d+)(.+)$')
        if num_str and char then
            local num = tonumber(num_str)
            local idx = find_char_index(char)
            if num and idx then
                return base_count * 3 + (num - 1) * base_count + idx
            end
        end
    end
    return 0 -- Unknown letter, stay on same line
end

-- Get multi-character input for complex sequences
local function get_char_input()
    local first_char = vim.fn.nr2char(vim.fn.getchar())
   
    -- Handle space (displays as _ in statuscolumn)
    if first_char == ' ' then
        local second_char = vim.fn.nr2char(vim.fn.getchar())
        return '_' .. second_char
    -- Handle f prefix
    elseif first_char == 'f' then
        local second_char = vim.fn.nr2char(vim.fn.getchar())
        return 'f' .. second_char
    -- Handle numbered sequences
    elseif first_char >= '0' and first_char <= '9' then
        local input = first_char
        -- Keep reading digits
        while true do
            local next_char = vim.fn.nr2char(vim.fn.getchar())
            if next_char >= '0' and next_char <= '9' then
                input = input .. next_char
            else
                -- Last character should be from base_chars
                input = input .. next_char
                break
            end
        end
        return input
    end
   
    return first_char
end

-- Search up function
local function searchUp()
    local input = get_char_input()
    local distance = letter_to_distance(input)
   
    if distance > 0 then
        local current_line = vim.fn.line('.')
        local target_line = current_line - distance
        if target_line >= 1 then
            vim.fn.cursor(target_line, 0)
        end
    end
end

-- Search down function
local function searchDown()
    local input = get_char_input()
    local distance = letter_to_distance(input)
   
    if distance > 0 then
        local current_line = vim.fn.line('.')
        local target_line = current_line + distance
        local last_line = vim.fn.line('$')
        if target_line <= last_line then
            vim.fn.cursor(target_line, 0)
        end
    end
end

-- Visual mode functions
local function visualSearchUp()
    local input = get_char_input()
    local distance = letter_to_distance(input)
   
    if distance > 0 then
        local current_line = vim.fn.line('.')
        local target_line = current_line - distance
        if target_line >= 1 then
            -- In visual mode, we want to extend the selection
            vim.cmd('normal! ' .. target_line .. 'G')
        end
    end
end

local function visualSearchDown()
    local input = get_char_input()
    local distance = letter_to_distance(input)
   
    if distance > 0 then
        local current_line = vim.fn.line('.')
        local target_line = current_line + distance
        local last_line = vim.fn.line('$')
        if target_line <= last_line then
            -- In visual mode, we want to extend the selection
            vim.cmd('normal! ' .. target_line .. 'G')
        end
    end
    end

-- Custom statuscolumn function
local function custom_statuscolumn()
    local line_num = vim.v.lnum
    local current_line = vim.fn.line('.')
    local distance = math.abs(line_num - current_line)

    if distance == 0 then
        -- Current line shows actual line number
        return tostring(line_num)
    else
        local letter = get_letter_label(distance)
        return letter .. ' '
    end
end

-- Global function for statuscolumn callback
_G.letter_statuscolumn = custom_statuscolumn

-- Setup letter line numbering
-- Disable regular line numbers
vim.opt.number = false
vim.opt.relativenumber = false

-- Enable statuscolumn (requires Neovim 0.9+)
if vim.fn.has('nvim-0.9') == 1 then
    vim.opt.statuscolumn = '%{v:lua.letter_statuscolumn()}'
    vim.opt.numberwidth = 6  -- Accommodate longer labels like "_'" or "99a"
   
    -- Create autocommand group
    local group = vim.api.nvim_create_augroup('LetterLineNumbers', { clear = true })
   
    -- Update on window scroll/resize events and cursor movement
    vim.api.nvim_create_autocmd({
        'WinScrolled',
        'BufWinEnter',
        'WinResized',
        'VimResized',
        'CursorMoved',
        'CursorMovedI'
    }, {
        group = group,
        callback = function()
            -- Force redraw of statuscolumn
            vim.cmd('redraw!')
        end
    })
   
    -- Initial redraw
    vim.schedule(function()
        vim.cmd('redraw!')
    end)
   
    -- Set up keymaps for normal mode
    vim.keymap.set('n', 'd', searchUp, { desc = 'Search up by letter' })
    vim.keymap.set('n', 'f', searchDown, { desc = 'Search down by letter' })
    
    -- Set up keymaps for visual mode
    vim.keymap.set('v', 'd', visualSearchUp, { desc = 'Visual search up by letter' })
    vim.keymap.set('v', 'f', visualSearchDown, { desc = 'Visual search down by letter' })
else
    print("Letter line numbering requires Neovim 0.9 or higher")
end

 
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

local function custom_f(direction)
    vim.cmd("normal! ma")         -- set mark 'a' at the current cursor position
    -- Get one character
    vim.api.nvim_echo({{"Sneak: ", "Question"}}, false, {})
    local char1 = vim.fn.getchar()
    if char1 == 27 then return end
    char1 = vim.fn.nr2char(char1)
   
    -- Set the search register and direction properly
    if direction == 'forward' then
        vim.fn.setreg('/', char1)
        vim.fn.histadd('search', char1)
        vim.cmd('normal! f' .. char1)
    else
        -- For backward search, we need to simulate a ? search
        vim.fn.setreg('/', char1)
        vim.fn.histadd('search', char1)
        -- Set the search direction flag for backward
        vim.v.searchforward = 0
        vim.cmd('normal! F' .. char1)
    end
end

vim.keymap.set('n', 's', function() custom_f('forward') end, { desc = 'Custom sneak forward' })
vim.keymap.set('n', 'S', function() custom_f('backward') end, { desc = 'Custom sneak backward' })

local function custom_sneak(direction)
    -- Get two characters
    vim.api.nvim_echo({{"Sneak: ", "Question"}}, false, {})
    local char1 = vim.fn.getchar()
    if char1 == 27 then return end
    char1 = vim.fn.nr2char(char1)
    
    local char2 = vim.fn.getchar()
    if char2 == 27 then return end
    char2 = vim.fn.nr2char(char2)
    
    vim.api.nvim_echo({{"", "Normal"}}, false, {})
    
    local pattern = char1 .. char2
    
    -- Set the search register so 'n' and 'N' (your ',') will work
    vim.fn.setreg('/', pattern)
    
    -- Update search history 
    vim.fn.histadd('search', pattern)
    
    -- Perform the search
    local flags = direction == 'forward' and 'W' or 'bW'
    local result = vim.fn.search(pattern, flags)
    
    if result == 0 then
        vim.api.nvim_echo({{"Pattern not found: " .. pattern, "ErrorMsg"}}, false, {})
    end
end

-- Main mappings
vim.keymap.set('n', '<leader>s', function()
    vim.cmd("normal! ma")         -- set mark 'a' at the current cursor position
    custom_sneak('forward')
end, { desc = 'Custom sneak forward' })

vim.keymap.set('n', '<leader>S', function()
    vim.cmd("normal! ma")         -- set mark 'a' at the current cursor position
    custom_sneak('backward')
end, { desc = 'Custom sneak backward' })

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


-- === CUSTOM MOVEMENTS!!!!!! ===
vim.keymap.set('n', '<leader>f', function()
    vim.cmd("normal! ma")         -- set mark 'a' at the current cursor position
    searchDown()
    custom_sneak('forward')
end, { desc = 'Search down by letter then sneak forward' })


vim.keymap.set('n', '<leader>d', function()
    vim.cmd("normal! ma")         -- set mark 'a' at the current cursor position
    searchUp()
    custom_sneak('forward')
end, { desc = 'Search up by letter then sneak forward' })

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
 
-- Restore cursor position (based on Neovim wiki)
vim.api.nvim_create_augroup("RestoreCursor", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", {
  group = "RestoreCursor",
  pattern = "*",
  callback = function()
    vim.api.nvim_create_autocmd("FileType", {
      buffer = 0,
      once = true,
      callback = function()
        local line = vim.fn.line("'\"")
        if line >= 1 and line <= vim.fn.line("$")
          and vim.bo.filetype ~= "commit"
          and vim.fn.index({"xxd", "gitrebase"}, vim.bo.filetype) == -1
          and not vim.o.diff
        then
          vim.cmd('normal! g`"')
        end
      end,
    })
  end,
})
 
 
vim.api.nvim_set_keymap('n', '%', 'ggVG', {noremap = true, silent = true})   -- select entire file

-- Force bright white highlight for the letter lines
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#FFFFFF', ctermfg = 15, bold = true })

-- ====================================================================

-- Ensure the directory for our temp file exists
vim.fn.mkdir(os.getenv("HOME") .. "/.cache/nvim", "p")

-- Create an autocommand that runs just before Neovim exits
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    -- Get the current working directory as known by Neovim
    local cwd = vim.fn.getcwd()
    if cwd and cwd ~= "" then
      -- Define a temporary file path
      local temp_file = os.getenv("HOME") .. "/.cache/nvim/last_dir"
      -- Open the file in write mode
      local f = io.open(temp_file, "w")
      if f then
        -- Write the directory path to the file and close it
        f:write(cwd)
        f:close()
      end
    end
  end,
  desc = "Write the last CWD to a temp file on exit"
})
