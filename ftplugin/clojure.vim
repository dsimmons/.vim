" Turn on Rainbow Parentheses (+ {}, []) for Clojure code.
"
" NOTE: Although this is potentially wasteful, as it's going to blow away and
" re-create the `augroup` any time we're dealing with a Clojure buffer, the
" overhead is minimal and, in terms of tradeoffs, I'd much prefer to keep
" something so Clojure/Lisp/sexp-specific contained in one place (here) where
" it feels more logical.
"
" For what it's worth, I tried first getting it to work *without*
" autocommands, but I think it gets clobbered by normal syntax highlighting
" (almost certainly an order-of-execution thing) and it was becoming more
" trouble than it was worth.
augroup rainbowify
  " Clear existing augroup (allow for being reloaded without causing issues).
  autocmd!

  autocmd syntax clojure RainbowParenthesesLoadRound
  autocmd syntax clojure RainbowParenthesesLoadSquare
  autocmd syntax clojure RainbowParenthesesLoadBraces
  autocmd syntax clojure RainbowParenthesesActivate
augroup END
