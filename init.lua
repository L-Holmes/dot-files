
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
-- Each selects the pair you're in (or on); if you're not in one, it jumps to the next one (on any later line).
-- "Inside" skips empty pairs like () - there'd be nothing to select. If there's no pair, you stay where you are.

-- Brackets: around = including the brackets
local function select_brackets(open, close, around)
  local o, c = '\\V' .. open, '\\V' .. close
  return function()
    local view = vim.fn.winsaveview()
    local function usable() -- cursor is on an open bracket: does it have a (non-empty, for inside) partner?
      local here = vim.fn.getpos('.')
      local partner = vim.fn.searchpairpos(o, '', c, 'nW')
      if partner[1] == 0 then return false end
      return around or not (partner[1] == here[2] and partner[2] == here[3] + 1)
    end
    -- the pair we're in: its open bracket is under / before the cursor
    local char = vim.fn.matchstr(vim.fn.getline('.'), '\\%' .. vim.fn.col('.') .. 'c.')
    local found = vim.fn.searchpairpos(o, '', c, char == close and 'bW' or 'bcW')[1] > 0 and usable()
    if not found then -- otherwise the next one
      vim.fn.winrestview(view)
      while vim.fn.search(o, 'W') > 0 do
        if usable() then found = true break end
      end
    end
    if not found then
      vim.fn.winrestview(view)
      vim.api.nvim_echo({ { 'No ' .. (around and '' or 'non-empty ') .. open .. close .. ' found', 'WarningMsg' } }, false, {})
      return
    end
    vim.cmd.normal({ 'v' .. (around and 'a' or 'i') .. open, bang = true })
  end
end

-- Quotes (' or ", whichever is nearest), skipping \-escaped ones and apostrophes like don't.
-- Returns { {start_col, end_col}, ... } for line, including quotes nested inside other quotes.
local function quote_pairs(line, from, to, found)
  found = found or {}
  local open_q, open_i, i = nil, nil, from or 1
  to = to or #line
  while i <= to do
    local ch = line:sub(i, i)
    if ch == '\\' then
      i = i + 1 -- skip the escaped character
    elseif open_q then
      if ch == open_q then
        table.insert(found, { open_i, i })
        quote_pairs(line, open_i + 1, i - 1, found) -- quotes inside these ones
        open_q = nil
      end
    elseif ch == '"' or (ch == "'" and not (line:sub(i - 1, i - 1):match('%w') and line:sub(i + 1, i + 1):match('%w'))) then
      open_q, open_i = ch, i
    end
    i = i + 1
  end
  return found
end

local function select_quotes(around)
  return function()
    local lnum, col = vim.fn.line('.'), vim.fn.col('.')
    local best, best_line
    local function ok(p) return around or p[2] > p[1] + 1 end -- inside skips empty quotes
    for _, p in ipairs(quote_pairs(vim.fn.getline(lnum))) do -- innermost quotes around the cursor
      if ok(p) and p[1] <= col and col <= p[2] and (not best or p[1] > best[1]) then best = p end
    end
    if not best then -- else the next quotes after the cursor, on this line or a later one
      for l = lnum, vim.fn.line('$') do
        for _, p in ipairs(quote_pairs(vim.fn.getline(l))) do
          if ok(p) and (l > lnum or p[1] > col) and (not best or p[1] < best[1]) then best = p end
        end
        if best then best_line = l break end
      end
    end
    if not best then
      vim.api.nvim_echo({ { 'No ' .. (around and '' or 'non-empty ') .. 'quotes found', 'WarningMsg' } }, false, {})
      return
    end
    best_line = best_line or lnum
    vim.fn.cursor(best_line, around and best[1] or best[1] + 1)
    vim.cmd('normal! v')
    vim.fn.cursor(best_line, around and best[2] or best[2] - 1)
  end
end

local sel = { silent = true, nowait = true }
vim.keymap.set('n', "'", select_quotes(false), sel)              -- inside quotes
vim.keymap.set('n', '"', select_quotes(true), sel)               -- around quotes (including them)
vim.keymap.set('n', '(', select_brackets('(', ')', false), sel)  -- inside ()
vim.keymap.set('n', ')', select_brackets('(', ')', true), sel)   -- around () (including the brackets)
vim.keymap.set('n', '[', select_brackets('[', ']', false), sel)  -- inside []
vim.keymap.set('n', ']', select_brackets('[', ']', true), sel)   -- around [] (including the brackets)
vim.keymap.set('n', '{', select_brackets('{', '}', false), sel)  -- inside {}
vim.keymap.set('n', '<', select_brackets('<', '>', false), sel)  -- inside <>

-- [ and ] act straight away, so remove every other mapping that starts with [ or ] - otherwise Vim waits
-- to see if you're typing one of those. That's Neovim's defaults ([b ]b buffers, [d ]d diagnostics,
-- [q ]q quickfix, [a [l [t [<Space> ...), matchit's [% ]%, and filetype ones like Python's [[ ]] [m ]m.
local function free_square_brackets(buf)
  local maps = buf and vim.api.nvim_buf_get_keymap(buf, 'n') or vim.api.nvim_get_keymap('n')
  for _, m in ipairs(maps) do
    local first = m.lhs:sub(1, 1)
    if (first == '[' or first == ']') and #m.lhs > 1 then
      pcall(vim.keymap.del, 'n', m.lhs, buf and { buffer = buf } or nil)
    end
  end
end
vim.api.nvim_create_autocmd('VimEnter', { once = true, callback = function() free_square_brackets() end }) -- after plugins load
vim.api.nvim_create_autocmd('FileType', { -- after filetype plugins add theirs
  callback = function(ev) vim.schedule(function() if vim.api.nvim_buf_is_valid(ev.buf) then free_square_brackets(ev.buf) end end) end,
})

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
 
-- === CHARACTER JUMPS (s / S / t / T, then ; for the next one) ===
-- The letter you jumped to is highlighted. The highlight stays while you press ; or , and clears on any other key.
local last_jump = nil -- last s/S/t/T: { cmd = 's'|'S'|'t'|'T', pattern = '\V<letter>', body = '<escaped letter>' }
local jumping = false -- true while a jump reads its letter, so that keypress doesn't clear the highlight

-- Read the letter for a jump (nil if cancelled with <Esc> / <C-c>)
local function read_jump_char()
  jumping = true
  local ok, char = pcall(vim.fn.getcharstr)
  jumping = false
  if not ok or char == '\27' then return nil end
  return char
end

-- Make `chars` the current search and highlight it. \V = match literally, so '.' only highlights dots.
-- ignore_case = true adds \c, so 'a' also matches 'A' (and vice versa); false adds \C (exact case).
local function set_search(chars, forward, ignore_case)
  local body = vim.fn.escape(chars, '\\')
  local case = ignore_case == true and '\\c' or ignore_case == false and '\\C' or ''
  local pattern = '\\V' .. case .. body
  vim.fn.setreg('/', pattern)
  vim.fn.histadd('search', pattern)
  vim.v.searchforward = forward and 1 or 0
  vim.v.hlsearch = 1
  return pattern, body
end

-- For s / t to a space when there's no space left on the line: go to the last character
-- (S / T backwards: the first character), as if the line ended / started with a space.
local function jump_to_line_edge(forward)
  local line = vim.fn.getline('.')
  if line == '' then return end
  local col = forward and (vim.fn.matchstrpos(line, '.$')[2] + 1) or 1
  vim.fn.cursor(vim.fn.line('.'), col)
end

-- t / T: like Vim's, except if the letter is right next to the cursor, skip on to the next one
-- (plain Vim just stays put). e.g. `te` on 'anot[h]er view' -> 'another v[i]ew'
local function till(cmd, set_mark)
  return function()
    local count = vim.v.count1
    local char = read_jump_char()
    if not char then return end
    local line, col = vim.fn.getline('.'), vim.fn.col('.')
    local neighbour = cmd == 't'
      and vim.fn.matchstr(line, '\\%>' .. col .. 'c.') -- char after the cursor
      or vim.fn.matchstr(line, '.\\%' .. col .. 'c')   -- char before the cursor
    if neighbour == char then count = count + 1 end
    local pattern, body = set_search(char, cmd == 't')
    last_jump = { cmd = cmd, pattern = pattern, body = body }
    local before = vim.fn.getpos('.')
    vim.cmd.normal({ (set_mark and 'ma' or '') .. count .. cmd .. char, bang = true })
    if char == ' ' and vim.deep_equal(vim.fn.getpos('.'), before) then jump_to_line_edge(cmd == 't') end
  end
end
vim.keymap.set('n', 't', till('t', true), { silent = true }) -- sets mark a too
vim.keymap.set('n', 'T', till('T', true), { silent = true })

-- ; = next: repeats the last s/S/t/T (carrying on to later lines), or goes to the next search match
local function next_jump()
  local j = last_jump
  if j and vim.fn.getreg('/') == j.pattern then -- (a newer / search replaces the jump)
    local pattern = ({
      s = j.pattern,
      S = j.pattern,
      t = '\\V\\.\\ze' .. j.body,     -- the char just before the letter
      T = '\\V' .. j.body .. '\\zs\\.', -- the char just after the letter
    })[j.cmd]
    local forward = j.cmd == 's' or j.cmd == 't'
    if vim.fn.search(pattern, forward and '' or 'b') == 0 then
      vim.api.nvim_echo({ { 'No more matches', 'WarningMsg' } }, false, {})
    end
  else
    local ok, err = pcall(vim.cmd, 'normal! n')
    if not ok then vim.api.nvim_echo({ { (err:gsub('^.-E', 'E')), 'ErrorMsg' } }, false, {}) end
  end
  vim.cmd('normal! zz')
  vim.v.hlsearch = 1
end

-- Clear the highlight as soon as you press anything other than ; or ,
vim.on_key(function(_, typed)
  if typed == '' or jumping or vim.v.hlsearch == 0 then return end
  if typed ~= ';' and typed ~= ',' then vim.v.hlsearch = 0 end
end, vim.api.nvim_create_namespace('clear_jump_highlight'))
-- / and ? search literally (\V), so '.' finds dots rather than everything. Delete the \V for a regex search.
vim.api.nvim_set_keymap('n', '/', 'ma/\\V', {noremap = true})
vim.api.nvim_set_keymap('n', '?', 'ma?\\V', {noremap = true})
 
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
vim.keymap.set('v', 't', till('t'), { silent = true })
vim.keymap.set('v', 'T', till('T'), { silent = true })
vim.api.nvim_set_keymap('v', '/', '/\\V', {noremap = true})
vim.api.nvim_set_keymap('v', '?', '?\\V', {noremap = true})
 
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
vim.keymap.set('n', ';', next_jump, { silent = true }) -- next match / repeat last s or t (see CHARACTER JUMPS)
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
 
-- (the old [s ]s spell toggle and [q ]q quickfix maps were removed so [ and ] select brackets instantly)

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
-- The sidebar labels each line by its distance from the cursor, using base_chars in order:
--   1-30:  j k l ; i o s a ' u m n , h y . p z f d q w e r c x v g t b
--   31-60: the same with a space in front (shown as _j, _k, _l ...)
--   61+:   the same with a number in front: 1j, 1k ... then 2j, 2k ... etc.
-- Type the label after d (up) or f (down) to jump to that line.

local base_chars = { 'j', 'k', 'l', ';', 'i', 'o', 's', 'a', "'", 'u', 'm', 'n', ',', 'h', 'y', '.', 'p', 'z',
                     'f', 'd', 'q', 'w', 'e', 'r', 'c', 'x', 'v', 'g', 't', 'b' }
local base_count = #base_chars -- 30

-- Distance -> label
local function get_letter_label(n)
    local block = math.floor((n - 1) / base_count) -- 0 = plain, 1 = space in front, 2+ = number in front
    local char = base_chars[((n - 1) % base_count) + 1]
    if block == 0 then
        return char
    elseif block == 1 then
        return '_' .. char
    else
        return tostring(block - 1) .. char
    end
end

-- Label -> distance (inverse of get_letter_label); 0 if it isn't a label
local function letter_to_distance(letter)
    local function find_char_index(char)
        for i, c in ipairs(base_chars) do
            if c == char then return i end
        end
    end

    local idx = find_char_index(letter)
    if idx then return idx end                                  -- j, k, l ...
    local char = letter:match('^_(.)$')
    idx = char and find_char_index(char)
    if idx then return base_count + idx end                     -- _j, _k ...
    local num, last = letter:match('^(%d+)(.)$')
    idx = last and find_char_index(last)
    if idx then return base_count * (tonumber(num) + 1) + idx end -- 1j, 1k ... 2j ...
    return 0 -- Unknown letter, stay on same line
end

-- Read a label: one key, or space + key, or digits + key
local function read_label_keys()
    local first_char = vim.fn.nr2char(vim.fn.getchar())
   
    -- Handle space (displays as _ in statuscolumn)
    if first_char == ' ' then
        local second_char = vim.fn.nr2char(vim.fn.getchar())
        return '_' .. second_char
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

-- (`jumping` marks these keys as a label, not commands - so they don't clear highlights or count in key stats)
local function get_char_input()
    jumping = true
    local ok, label = pcall(read_label_keys)
    jumping = false
    return ok and label or ''
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
        return get_letter_label(distance) -- (the gap after it is added in 'statuscolumn' below)
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
    -- The space goes outside %{...}: Neovim drops a leading ',' from the result if anything follows it
    vim.opt.statuscolumn = '%{v:lua.letter_statuscolumn()} '
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
    local char1 = read_jump_char()
    if not char1 then return end

    -- Highlight the letter (literally, any case) and remember the jump, so ; goes to the next one
    local forward = direction == 'forward'
    local pattern, body = set_search(char1, forward, true)
    last_jump = { cmd = forward and 's' or 'S', pattern = pattern, body = body }
    vim.fn.setcharsearch({ char = char1, forward = forward and 1 or 0, ['until'] = 0 }) -- so , still repeats it

    -- Jump to the next match (any case) on this line; s<space> with no space left goes to the line's end
    local found = vim.fn.search(pattern, forward and 'W' or 'bW', vim.fn.line('.'))
    if found == 0 and char1 == ' ' then jump_to_line_edge(forward) end
end

vim.keymap.set('n', 's', function() custom_f('forward') end, { desc = 'Custom sneak forward' })
vim.keymap.set('n', 'S', function() custom_f('backward') end, { desc = 'Custom sneak backward' })

local function custom_sneak(direction)
    -- Get two characters
    vim.api.nvim_echo({{"Sneak: ", "Question"}}, false, {})
    local char1 = read_jump_char()
    if not char1 then return end
    local char2 = read_jump_char()
    if not char2 then return end
    
    vim.api.nvim_echo({{"", "Normal"}}, false, {})
    
    -- Highlight the pair (literally) as the current search, so ; goes to the next one
    local pattern = set_search(char1 .. char2, direction == 'forward')
    last_jump = nil
    
    -- Perform the search
    local flags = direction == 'forward' and 'W' or 'bW'
    local result = vim.fn.search(pattern, flags)
    
    if result == 0 then
        vim.api.nvim_echo({{"Pattern not found: " .. char1 .. char2, "ErrorMsg"}}, false, {})
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
-- <leader>f / <leader>d: type the 2 sneak letters first. Every match on the lines below (f) or above (d)
-- then shows its line label just after it, over the next character(s) - e.g. 'ssssss' on line 1j shows
-- as 'ss1j1j'. Type the label to land on that line's first match (then ; for the next one).
local sneak_ns = vim.api.nvim_create_namespace('sneak_labels')

local function sneak_to_line(down)
    vim.cmd("normal! ma")         -- set mark 'a' at the current cursor position
    vim.api.nvim_echo({{"Sneak: ", "Question"}}, false, {})
    local char1 = read_jump_char()
    if not char1 then return end
    local char2 = read_jump_char()
    if not char2 then return end
    local chars = char1 .. char2

    -- Highlight the matches (smartcase: exact case only if you typed a capital) so ; finds the next one
    local pattern = set_search(chars, true, not chars:match('%u'))
    last_jump = nil

    -- Label every match on the visible lines below / above, never letting two labels overlap
    local cur = vim.fn.line('.')
    local first, last = cur + 1, vim.fn.line('w$')
    if not down then first, last = vim.fn.line('w0'), cur - 1 end
    local dw = vim.fn.strdisplaywidth
    local any = false
    local function put_label(lnum, col, label)
        vim.api.nvim_buf_set_extmark(0, sneak_ns, lnum - 1, col,
            { virt_text = { { label, 'SneakLabel' } }, virt_text_pos = 'overlay', priority = 1000 })
    end
    for lnum = first, last do
        local line = vim.fn.getline(lnum)
        local label = get_letter_label(math.abs(lnum - cur))
        local free_from, labelled, end_col, start = 0, false, nil, 0
        while true do
            local m = vim.fn.matchstrpos(line, pattern, start) -- { text, start byte, end byte }
            if m[2] < 0 then break end
            any = true
            local col = m[3] -- the character just after the two letters
            if col >= #line then
                end_col = col -- match at the very end of the line
            elseif dw(line:sub(1, col)) >= free_from then
                put_label(lnum, col, label)
                free_from = dw(line:sub(1, col)) + dw(label)
                labelled = true
            end
            start = m[3]
        end
        -- if the only match is at the end of the line, show its label just past the end
        if end_col and not labelled then put_label(lnum, end_col, label) end
    end
    if not any then
        vim.api.nvim_buf_clear_namespace(0, sneak_ns, 0, -1)
        vim.api.nvim_echo({{'No "' .. chars .. '" ' .. (down and 'below' or 'above'), "WarningMsg"}}, false, {})
        return
    end

    -- Read the line label, then go to the first match on that line
    vim.cmd('redraw')
    vim.api.nvim_echo({{"Line: ", "Question"}}, false, {})
    jumping = true -- (so typing the label doesn't clear the highlight)
    local ok, input = pcall(get_char_input)
    jumping = false
    vim.api.nvim_buf_clear_namespace(0, sneak_ns, 0, -1)
    vim.api.nvim_echo({{""}}, false, {})
    local distance = ok and letter_to_distance(input) or 0
    local target = down and cur + distance or cur - distance
    if distance == 0 or target < 1 or target > vim.fn.line('$') then -- <Esc> or not a label
        vim.v.hlsearch = 0
        return
    end
    local col = vim.fn.matchstrpos(vim.fn.getline(target), pattern)[2]
    if col < 0 then -- that line has no match: stay put
        vim.api.nvim_echo({{'No "' .. chars .. '" on that line', "WarningMsg"}}, false, {})
        return
    end
    vim.fn.cursor(target, col + 1)
end

vim.keymap.set('n', '<leader>f', function() sneak_to_line(true) end, { desc = 'Sneak 2 letters down, then line label' })
vim.keymap.set('n', '<leader>d', function() sneak_to_line(false) end, { desc = 'Sneak 2 letters up, then line label' })

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

-- The highlighted match under the cursor: soft white text on muted teal. Your terminal draws the cursor block in the
-- text colour, so it stays bright instead of turning black like it did on the default (black-on-yellow).
vim.api.nvim_set_hl(0, 'CurSearch', { fg = '#E0F2F1', bg = '#3B7F7A', bold = true, ctermfg = 15, ctermbg = 66 })

-- Line labels shown by <leader>f / <leader>d: dark text on soft mint, so they stand out from the code calmly
vim.api.nvim_set_hl(0, 'SneakLabel', { fg = '#0B2522', bg = '#8FD3C7', bold = true, ctermfg = 0, ctermbg = 115 })

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

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                   Quick guide (<leader>?)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Floating cheat-sheet of the mappings in this file. Press ? in it to see the keys you haven't mapped; <Esc> (or q) closes.
-- NOTE: this list is hand-written - update it when you change a mapping.
-- Each section is { title, entries }; an entry is { key, description }, or a plain string for a note.

local quick_guide = {
  { 'General', {
    { '<leader>?', 'toggle this guide' },
    { '<leader>l', 'save all files' },
    { '<leader>w', 'save file, open Oil' },
    { '<leader>r', 'undo' },
    { 'kj / KJ',   '(insert) back to normal' },
    { 'fj / FJ',   '(visual) back to normal' },
    { '<S-Tab>',   '(insert) unindent' },
    { 'J',         'join lines (stay at start)' },
  } },
  { 'Move', {
    'highlights clear on any key except ; and ,',
    { 'j / k',            'down / up (and scroll)' },
    { '<leader>j / k',    'page down / up' },
    { 'f{l} / d{l}',      'down / up to line label' },
    { 's{c} / S{c}',      'to char on line, any case *' },
    { 't{c} / T{c}',      'till char → / ← *' },
    { '<leader>s{cc}',    'sneak to 2 chars → *' },
    { '<leader>S{cc}',    'sneak to 2 chars ← *' },
    { '<leader>f{cc}{l}', 'sneak down: 2 chars, then line *' },
    { '<leader>d{cc}{l}', 'sneak up: 2 chars, then line *' },
    { '/ ?',              'literal search → / ← *' },
    { ';',                'next match / repeat last s or t' },
    { ',',                'repeat last s / t on the line' },
  } },
  { 'Go to (g)', {
    { 'gk / gj', 'top / bottom of screen *' },
    { 'gh / gl', 'start / end of line *' },
    { 'g0',      'column 0 *' },
    { 'ge',      'end of file *' },
    { "g'{m}",   'go to mark {m}' },
    { 'gp',      'back to previous position' },
    { 'gd',      'definition (LSP)' },
  } },
  { 'Select', {
    { 'a',       'from mark a to cursor' },
    { 'w',       'word' },
    { 'O',       'paragraph' },
    { 'v',       'last yanked / changed text' },
    { '( [ { <', 'inside brackets' },
    { ') ]',     'around () / [] (with brackets)' },
    { "'",       "inside quotes (' or \")" },
    { '"',       'around quotes (with quotes)' },
    'all of these jump to the next pair if not in one',
    { '%',       'whole file' },
    { 'xf',      'function (top-level block)' },
    { 'xp',      'function parameters' },
    { 'xl',      'loop' },
    { 'xi',      'whole if / elif / else' },
    { 'xI',      'current if / elif / else branch' },
  } },
  { 'Visual mode', {
    'g-keys, t / T, / ?, <leader>j / k also work',
    { 'i',            'copy' },
    { 'p',            'paste (keeps register)' },
    { 'e',            'delete' },
    { 'n',            'change' },
    { 'm{c}',         'replace every char with {c}' },
    { 'f{l} / d{l}',  'extend down / up to line' },
    { '<leader>s{c}', 'to char →' },
    { '<leader>S{c}', 'to char ←' },
    { '< / >',        'indent (keep selection)' },
  } },
  { 'Copy', {
    { 'i',      'line' },
    { 'y / oi', 'char' },
    { 'ri',     'cursor → end of line' },
    { 'ry',     'start of line → cursor' },
  } },
  { 'Paste', {
    { 'p',             'over line' },
    { 'b',             'over char' },
    { 'op / ob',       'right / left of char' },
    { 'rp / rb',       'after / before cursor' },
    { '<leader>p / b', 'on new line below / above' },
  } },
  { 'Delete (paste nothing)', {
    { 'e',             'line' },
    { 'oe',            'char' },
    { 're',            'cursor → end of line' },
    { 'ru',            'start of line → cursor' },
    { 'u / ou',        'insert space right / left' },
    { '<leader>e / u', 'blank line below / above' },
  } },
  { 'Insert (paste new)', {
    { 'n',             'over line' },
    { 'm{c}',          'replace char with {c}' },
    { 'on / om',       'after / before cursor' },
    { 'oN / oM',       'end / start of line' },
    { 'rn',            'over cursor → end of line' },
    { 'rm',            'over start of line → cursor' },
    { '<leader>n / m', 'on new line below / above' },
  } },
  { 'Harpoon', {
    { '<leader>h<Space>', 'add file' },
    { '<leader>hw',       'menu' },
    { '<leader>ha/s/d/f', 'go to file 1 / 2 / 3 / 4' },
    { '<leader>he / hr',  'next / previous file' },
  } },
  { 'Commands', {
    { ':Recent',              'recent files (l opens)' },
    { ':Grep {pat}',          'ripgrep → quickfix' },
    '  add -e py,lua to filter by extension',
    { ':Replace {a}/{b}',     'replace across project' },
    { ':ReplaceSelectedText', 'selection → clipboard text' },
  } },
  { 'Oil (file browser)', {
    { 'l / h', 'open / parent dir' },
    { '_',     'set cwd to this dir' },
    { 'q',     'quit nvim, remember dir' },
    { 'g?',    'all Oil keys' },
  } },
}

-- Groups shown in the "unmapped keys" view (press ? inside the guide): { title, mode, prefix }
-- This view is worked out live from the keymap, so unlike the list above it never goes stale.
local quick_guide_free_groups = {
  { '<leader> + key',         'n', '<leader>' },
  { 'Single keys',            'n', '' },
  { '<leader>h + key',        'n', '<leader>h' },
  { 'g + key',                'n', 'g' },
  { 'o + key',                'n', 'o' },
  { 'r + key',                'n', 'r' },
  { 'x + key',                'n', 'x' },
  { 'Visual: <leader> + key', 'x', '<leader>' },
  { 'Visual: single keys',    'x', '' },
}

-- QWERTY layout for that view: { indent, keys }; each key is shown as its normal + shifted character
local quick_guide_keyboard = {
  { 0, '`~ 1! 2@ 3# 4$ 5% 6^ 7& 8* 9( 0) -_ =+' },
  { 4, 'qQ wW eE rR tT yY uU iI oO pP [{ ]} \\|' },
  { 5, "aA sS dD fF gG hH jJ kK lL ;: '\"" },
  { 7, 'zZ xX cC vV bB nN mM ,< .> /?' },
}

-- Build the sections for the "unmapped keys" view: one keyboard per group, taken keys greyed out.
-- A key is taken if any mapping (yours or a plugin's) starts with it - e.g. `c` is taken by vim-surround's `cs`.
-- Neovim's own built-in default mappings (Y, &, gc, [d, ...) don't count: they're just Vim behaviour.
local function quick_guide_free_sections()
  local leader = vim.g.mapleader or '\\'
  local taken = {}
  for _, mode in ipairs({ 'n', 'x' }) do
    taken[mode] = {}
    for _, m in ipairs(vim.api.nvim_get_keymap(mode)) do
      if m.sid ~= -8 then -- -8 = defined by Neovim's own defaults
        table.insert(taken[mode], m.lhsraw or m.lhs)
      end
    end
  end
  local function is_taken(mode, seq)
    for _, lhs in ipairs(taken[mode]) do
      if vim.startswith(lhs, seq) or vim.startswith(seq, lhs) then return true end
    end
    return false
  end

  local sections = {}
  for _, g in ipairs(quick_guide_free_groups) do
    local title, mode, prefix = g[1], g[2], g[3]
    local raw_prefix = prefix:gsub('<leader>', function() return leader end)
    local rows = {}
    for _, row in ipairs(quick_guide_keyboard) do
      local text, hl = string.rep(' ', row[1]) .. row[2], {}
      for i = 1, #text do
        local c = text:sub(i, i)
        local is_count = prefix == '' and c:match('[1-9]') -- on their own, 1-9 are counts
        if c ~= ' ' and (is_count or is_taken(mode, raw_prefix .. c)) then
          table.insert(hl, { i - 1, i, 'QuickGuideTaken' })
        end
      end
      table.insert(rows, { text = text, hl = hl })
    end
    table.insert(sections, { title, rows })
  end
  return sections
end

-- Lay sections out in as many balanced columns as fit the screen.
-- Entries can be { key, description }, a ready-made line { text = ..., hl = { {start_byte, end_byte, group}, ... } },
-- or a plain string (shown as a note).
-- Returns the buffer lines and the highlights { row, start_byte, end_byte, group }.
local function render_quick_guide(sections, legend)
  local dw = vim.fn.strdisplaywidth
  local gap = 4

  -- Render each section into a block of lines: { text = ..., hl = { {start_byte, end_byte, group}, ... } }
  local blocks, colw = {}, 0
  for _, section in ipairs(sections) do
    local title, entries = section[1], section[2]
    local keyw = 0
    for _, e in ipairs(entries) do
      if type(e) == 'table' and e[1] then keyw = math.max(keyw, dw(e[1])) end
    end
    local block = { { text = title, hl = { { 0, #title, 'Title' } } } }
    colw = math.max(colw, dw(title))
    for _, e in ipairs(entries) do
      local line
      if type(e) == 'string' then
        line = { text = '  ' .. e, hl = { { 2, 2 + #e, 'Comment' } } }
      elseif e.text then
        line = { text = '  ' .. e.text, hl = {} }
        for _, h in ipairs(e.hl) do table.insert(line.hl, { h[1] + 2, h[2] + 2, h[3] }) end
      else
        local key, desc = e[1], e[2]
        line = {
          text = '  ' .. key .. string.rep(' ', keyw - dw(key) + 2) .. desc,
          hl = { { 2, 2 + #key, 'Special' } },
        }
      end
      colw = math.max(colw, dw(line.text))
      table.insert(block, line)
    end
    table.insert(blocks, block)
  end

  -- Use the smallest column height that still fits everything into the available columns
  local ncols = math.max(1, math.floor((vim.o.columns - 4 + gap) / (colw + gap)))
  local total = 0
  for _, b in ipairs(blocks) do total = total + #b + 1 end
  local function pack(height)
    local cols, col = {}, {}
    for _, b in ipairs(blocks) do
      if #col > 0 and #col + 1 + #b > height then
        table.insert(cols, col)
        col = {}
      end
      if #col > 0 then table.insert(col, { text = '', hl = {} }) end
      vim.list_extend(col, b)
    end
    table.insert(cols, col)
    return cols
  end
  local cols
  for height = math.ceil(total / ncols), total do
    cols = pack(height)
    if #cols <= ncols then break end
  end

  local lines, marks = {}, {}
  for _, l in ipairs(legend) do
    table.insert(marks, { #lines, 0, #l, 'Comment' })
    table.insert(lines, l)
  end
  table.insert(lines, '')
  local rows = 0
  for _, c in ipairs(cols) do rows = math.max(rows, #c) end
  for r = 1, rows do
    local text = ''
    for ci, c in ipairs(cols) do
      text = text .. string.rep(' ', (ci - 1) * (colw + gap) - dw(text))
      local cell = c[r]
      if cell then
        for _, h in ipairs(cell.hl) do
          table.insert(marks, { #lines, #text + h[1], #text + h[2], h[3] })
        end
        text = text .. cell.text
      end
    end
    table.insert(lines, (text:gsub('%s+$', '')))
  end
  return lines, marks
end

local quick_guide_win = nil

-- view = 'mapped' (the cheat-sheet) or 'unmapped' (free keys); replaces whichever is open
local function show_quick_guide(view)
  if quick_guide_win and vim.api.nvim_win_is_valid(quick_guide_win) then
    vim.api.nvim_win_close(quick_guide_win, true)
  end

  local lines, marks, title
  if view == 'unmapped' then
    title = ' Unmapped keys '
    vim.api.nvim_set_hl(0, 'QuickGuideTaken', { link = 'NonText', default = true }) -- greyed-out keys
    lines, marks = render_quick_guide(quick_guide_free_sections(), {
      'Greyed out = taken (by you or a plugin) · normal = free',
      '? back to mappings · <Esc> close',
    })
  else
    title = ' Quick guide '
    lines, marks = render_quick_guide(quick_guide, {
      '{c} char · {l} line label · * sets mark a · ? unmapped keys · <Esc> close',
    })
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  local ns = vim.api.nvim_create_namespace('quick_guide')
  for _, m in ipairs(marks) do
    vim.api.nvim_buf_set_extmark(buf, ns, m[1], m[2], { end_col = m[3], hl_group = m[4] })
  end
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = 'wipe'

  local width = 0
  for _, l in ipairs(lines) do width = math.max(width, vim.fn.strdisplaywidth(l)) end
  width = math.min(width, vim.o.columns - 4)
  local height = math.min(#lines, vim.o.lines - vim.o.cmdheight - 4)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    style = 'minimal',
    border = 'rounded',
    title = title,
    title_pos = 'center',
    width = width,
    height = height,
    row = math.max(0, math.floor((vim.o.lines - vim.o.cmdheight - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
  })
  quick_guide_win = win
  vim.wo[win].statuscolumn = '' -- no letter gutter in the guide
  vim.wo[win].wrap = false

  local function close()
    if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
  end
  for _, key in ipairs({ '<Esc>', 'q' }) do
    vim.keymap.set('n', key, close, { buffer = buf, nowait = true, silent = true })
  end
  vim.keymap.set('n', '?', function()
    show_quick_guide(view == 'unmapped' and 'mapped' or 'unmapped')
  end, { buffer = buf, nowait = true, silent = true })
  -- also close if you jump to another window
  vim.api.nvim_create_autocmd('WinLeave', { buffer = buf, once = true, callback = vim.schedule_wrap(close) })
end

vim.keymap.set('n', '<leader>?', function()
  if quick_guide_win and vim.api.nvim_win_is_valid(quick_guide_win) then
    vim.api.nvim_win_close(quick_guide_win, true)
  else
    show_quick_guide('mapped')
  end
end, { desc = 'Toggle mappings quick-guide' })

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                                                                   Key stats (~/.vimstats)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Counts how often you use each key combo outside insert mode - e.g. e, s, <leader>f, gg, ci( - and keeps
-- ~/.vimstats sorted, most used first. What you type *for* a command isn't counted as a combo of its own:
-- the letter after s / t, line labels, the char after m, counts like the 3 in 3j, and anything typed in
-- insert mode or on the : command line. Visual-mode combos are listed separately, e.g. "e (visual)".
-- The file is updated every 10 seconds and on exit; every open Neovim adds to the same file.
local stats_file = vim.fn.expand('~/.vimstats')
local stats_pending = {}     -- combo -> uses since the file was last written
local stats_cmd = nil        -- the combo being typed: { keys = 'g', visual = false, wants = 'more' | 'char' | nil }
local stats_counting = false -- in the middle of a count (the 3 in 3j)

local function stats_commit()
  local cmd = stats_cmd
  stats_cmd = nil
  if not cmd then return end
  local combo = cmd.keys .. (cmd.visual and ' (visual)' or '')
  stats_pending[combo] = (stats_pending[combo] or 0) + 1
end

vim.on_key(function(_, typed)
  if typed == '' or jumping then return end -- keys produced by mappings, or a jump's letter / label
  local key = vim.fn.keytrans(typed):gsub('<lt>', '<')
  if key:match('Mouse') or key:match('ScrollWheel') or key:match('^<Focus') or key:match('Paste') then return end
  local mode = vim.api.nvim_get_mode().mode
  if mode:match('^no') then -- an operator waiting for its motion (ci( , dw): same combo
    if stats_cmd then stats_cmd.keys = stats_cmd.keys .. key end
    return
  end
  if not (mode:match('^n') or mode:match('^[vV\22]')) then return end -- insert, replace, command line, prompts
  if stats_cmd and stats_cmd.wants == 'more' then -- 2nd key of a g / z / Z / <C-W> command (gg, za, <C-W>v)
    stats_cmd.keys, stats_cmd.wants = stats_cmd.keys .. key, nil
    return
  end
  if stats_cmd and stats_cmd.wants == 'char' then -- the mark / register after g' ` q @
    stats_cmd.wants = nil
    return
  end
  if key:match('^%d$') and (stats_counting or key ~= '0') then -- counts aren't combos (a lone 0 is)
    stats_counting = true
    return
  end
  stats_counting = false
  stats_commit() -- a new combo starts, so the previous one is complete

  local mapped = next(vim.fn.maparg(key, mode:match('^n') and 'n' or 'x', false, true)) ~= nil
  local wants = nil
  if key == "g'" then
    wants = 'char'
  elseif not mapped then
    if key == 'g' or key == 'z' or key == 'Z' or key == '<C-W>' then
      wants = 'more'
    elseif key == '`' or key == '@' or (key == 'q' and vim.fn.reg_recording() == '') then
      wants = 'char'
    end
  end
  if mapped and vim.g.mapleader == ' ' and key:match('^<Space>.') then key = '<leader>' .. key:sub(8) end
  stats_cmd = { keys = key, visual = not mode:match('^n'), wants = wants }
end, vim.api.nvim_create_namespace('key_stats'))

-- Add the new counts to the file (re-reading it first, so several Neovims don't overwrite each other)
local function stats_write()
  if next(stats_pending) == nil then return end
  local counts = {}
  local f = io.open(stats_file, 'r')
  if f then
    for line in f:lines() do
      local combo, n = line:match('^(.-),%s+(%d+)%s*$')
      if combo and combo ~= '' then counts[combo] = (counts[combo] or 0) + tonumber(n) end
    end
    f:close()
  end
  for combo, n in pairs(stats_pending) do counts[combo] = (counts[combo] or 0) + n end
  stats_pending = {}

  local list, width = {}, 0
  for combo, n in pairs(counts) do
    table.insert(list, { combo, n })
    width = math.max(width, vim.fn.strdisplaywidth(combo))
  end
  table.sort(list, function(a, b) return a[2] > b[2] or (a[2] == b[2] and a[1] < b[1]) end)
  local out = {}
  for _, e in ipairs(list) do -- "e,          204983": numbers lined up 2 spaces after the longest combo
    table.insert(out, e[1] .. ',' .. string.rep(' ', width - vim.fn.strdisplaywidth(e[1]) + 2) .. e[2])
  end
  local tmp = stats_file .. '.tmp' .. vim.fn.getpid() -- write then rename, so the file is never half-written
  local w = io.open(tmp, 'w')
  if not w then return end
  w:write(table.concat(out, '\n') .. '\n')
  w:close()
  os.rename(tmp, stats_file)
end

local stats_timer = vim.uv.new_timer()
stats_timer:start(10000, 10000, vim.schedule_wrap(stats_write))
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function() stats_commit(); stats_write() end,
  desc = 'Save key stats to ~/.vimstats',
})
