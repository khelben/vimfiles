echom 'Autoloading ....'

" Trailing whitespaces
function! cvp#ruby#TrimWhiteSpace()
  echom 'Saving......'
  %s/\s*$//
  ''
endfunction
