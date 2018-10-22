" IDE

"" Omnicompletion
set omnifunc=syntaxcomplete#Complete

"" Split management
set splitright                                                  "Split to the right
set splitbelow                                                  "Split bellow

"" Moving around tabs
nnoremap tn  :tabnew<CR>
nnoremap tc  :tabclose<CR>

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>

"" Buffers
nnoremap <C-b>h :bfirst<CR>
nnoremap <C-b>k :bprevious<CR>
nnoremap <C-b>j :bnext<CR>
nnoremap <C-b>l :blast<CR>
nmap # :b#<CR>
""" remap <C-b> motion
nnoremap <C-b><C-b> <C-b>

"" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

"" NERDTree
autocmd vimenter * NERDTree                               "Open NERDTree on vim start
map <leader>n :NERDTreeToggle<CR>

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let NERDTreeWinPos='right'                                "NERDTree window to the right
let NERDTreeAutoDeleteBuffer=1                            "Delete old buffer when renaming or moving a file

"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" Bclose
noremap <leader>q :Bclose<CR>
noremap <leader>q! :Bclose!<CR>

"" {
inoremap {<space> {}<Left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {{ {
inoremap {} {}

"" (
inoremap (<space> ()<Left>
inoremap (<CR> (<CR>)<ESC>O
inoremap (( (
inoremap () ()

"" [
inoremap [<space> []<Left>
inoremap [<CR> [<CR>]<ESC>O<tab>
inoremap [[ [
inoremap [] []

"" more for twig
inoremap {{<space> {{  }}<left><left><left>
inoremap {%<space> {%  %}<left><left><left>
inoremap {#<space> {#  #}<left><left><left>

" PHP

"" CTags
noremap <F3> :! exctags -R --fields=+aimS --languages=php --exclude="cache" .<CR>

" Twig

"" syntax highlight for html.twig
autocmd BufNewFile,BufRead  *.html.twig setlocal syntax=htmljinja
"" syntax highlight for xml.twig
autocmd BufNewFile,BufRead  *.xml.twig setlocal syntax=htmljinja
"" syntax highlight for js.twig
autocmd BufNewFile,BufRead  *.js.twig setlocal syntax=javascript
"" syntax highlight for css.twig
autocmd BufNewFile,BufRead  *.css.twig setlocal syntax=css

" rst
autocmd BufNewFile,BufRead *.rst setlocal textwidth=80  colorcolumn=80  spell spelllang=en

" md
autocmd BufNewFile,BufRead *.md setlocal textwidth=80  colorcolumn=80  spell spelllang=en
