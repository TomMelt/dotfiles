syntax match mdbComment /#.*$/

syn keyword mdbKeywords command execute plot interact quit select shell broadcast
syn match   mdbNumber    "\<[0-9-]\+\>"
syn match   mdbCharacter "[\?\!]"
hi def link mdbComment Comment
hi def link mdbKeywords Statement
hi def link mdbNumber Number
hi def link mdbCharacter Statement
