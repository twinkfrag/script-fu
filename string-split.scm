(define
	(string-split string splitter)
	(let loop
		(
			(ls (string->list string))
			(is-splitting #t)
			(ret-ls '())
		)
		(if (null? ls)
			(map (lambda(x) (list->string (reverse x))) (reverse ret-ls)) ; last return
			(let
				(
					(c (car ls))
				)
				(loop
					(cdr ls)
					(char=? c splitter)
					(if is-splitting 
						(cons (list c) ret-ls)
						(cons (cons c (car ret-ls)) (cdr ret-ls))
					)
				)
			)
		)
	)
)
