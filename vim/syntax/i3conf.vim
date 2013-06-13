" Vim syntax file
" Language: i3 configuration file
" References: i3 window manager
"                   http://i3wm.org
" Last Change:  15 September 2012
" Filenames:    ~/.i3/config
" Maintainar:   Ilya Strukov <iley@iley.ru>
" Version:      0.1
" Summary:      Syntax Highlight i3 window manager configuration files
" Description:  Syntax Highlight i3 window manager configuration files

syn keyword i3Todo ATTN ATTENTION FIXME NB TODO contained 
syn keyword i3Command 1pixel assign auto bar bind bindcode bindsym cols default default_orientation exec exec_always fake-outputs fake_outputs floating_maximum_size floating_minimum_size floating_modifier focus_follows_mouse font for_window force-xinerama force_focus_wrapping force_xinerama horizontal ignore ipc-socket ipc_socket leave_fullscreen mode new_float new_window none normal output popup_during_fullscreen restart_state rows set stack-limit stacked stacking tabbed terminal vertical workspace workspace_auto_back_and_forth workspace_bar workspace_layout
syn keyword i3Modifier Mod1 Mod2 Mod3 Mod4 Mod5 Mode_switch control ctrl shift 
syn keyword i3Property class instance window_role id con_id con_mark title urgent 

syn match i3Comment "#.*" contains=i3Todo
syn match i3Variable "$\w\+" 

syn region i3String start='"' end='"'

let b:current_syntax = "i3conf"

hi def link i3Command Statement
hi def link i3Modifier Type
hi def link i3Property Function
hi def link i3Variable Identifier
hi def link i3Comment Comment
hi def link i3String String
hi def link i3Todo Todo
