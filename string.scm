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
(define 
	(load-string-from-file input)
	(with-input-from-file input ;スコープ内でデフォルトポートの変更
		(lambda ()
			(let loop
				(
					(ls '())
					(c (read-char))
				)
				(if (eof-object? c)
					(list->string (reverse ls)) ; output
					(loop 
						(cons c ls) 
						(read-char)
					)
				)
			)
		)
	)
)
(define
	(string-list->string string-list)
	(let loop
		(
			(str (car string-list))
			(in (cdr string-list))
		)
		(if (null? in)
			str
			(loop
				(string-append str (car in))
				(cdr in)
			))))
