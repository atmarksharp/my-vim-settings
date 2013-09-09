" .vim/ftplugin/php/flyquickfixmake.vim"
compiler php
autocmd BufWritePost * silent make %
