syntax match mdbComment /#.*$/

syn keyword mdbKeywords command execute info interact quit select shell status update_winsize
syn match   mdbNumber    "\<[0-9-]\+\>"
syn match   mdbCharacter "[\?\!]"
hi def link mdbComment Comment
hi def link mdbKeywords Statement
hi def link mdbNumber Number
hi def link mdbCharacter Statement
