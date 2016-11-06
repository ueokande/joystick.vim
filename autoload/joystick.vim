let s:nmap = {}
let s:smap = {}
let s:xmap = {}
let s:omap = {}
let s:imap = {}
let s:lmap = {}
let s:cmap = {}

function! joystick#map(lhs, rhs) abort
  let s:nmap[a:lhs] = a:rhs
  let s:xmap[a:lhs] = a:rhs
  let s:smap[a:lhs] = a:rhs
  let s:omap[a:lhs] = a:rhs
endfunction

function! joystick#nmap(lhs, rhs) abort  
  let s:nmap[a:lhs] = a:rhs
endfunction

function! joystick#vmap(lhs, rhs) abort  
  let s:xmap[a:lhs] = a:rhs
  let s:smap[a:lhs] = a:rhs
endfunction

function! joystick#smap(lhs, rhs) abort  
  let s:smap[a:lhs] = a:rhs
endfunction

function! joystick#xmap(lhs, rhs) abort  
  let s:xmap[a:lhs] = a:rhs
endfunction

function! joystick#omap(lhs, rhs) abort  
  let s:omap = [a:lhs] = a:rhs 
endfunction

function! joystick#imap(lhs, rhs) abort  
  let s:imap = [a:lhs] = a:rhs 
endfunction

function! joystick#lmap(lhs, rhs) abort  
  let s:imap = [a:lhs] = a:rhs 
  let s:cmap = [a:lhs] = a:rhs 
  let s:lmap = [a:lhs] = a:rhs 
endfunction

function! joystick#cmap(lhs, rhs) abort  
  let s:cmap = [a:lhs] = a:rhs 
endfunction

function! joystick#button(number) abort
  echo 'Button ' . a:number
endfunction

function! joystick#axis(number, value) abort
  echo 'Axis' . a:number . ' -> ' . a:value
endfunction

command! -nargs=+ JoystickMap call joystick#map(<f-args>)

" test
JoystickMap <C-U> dgg

py3file <sfile>:h:h/python/joystick.py
