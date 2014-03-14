(define
	(string-split string splitter)
	(let loop
		(
			(ls (string->list string))
			(ret-ls '(()))
		)
		(if (null? ls)
			(map (lambda(x) (list->string (reverse x))) (reverse ret-ls)) ; last return
			(let
				(
					(c (car ls))
				)
				(loop
					(cdr ls)
					(if (char=? c splitter)
						(cons '() ret-ls)
						(cons (cons c (car ret-ls)) (cdr ret-ls))
					)
				)
			)
		)
	)
)
(define
	(string-split-lossless string splitter)
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
(define
	(remove-space string)
	(let loop2
		(
			(ls '())
			(in (string->list string))
		)
		(if (null? in)
			(list->string (reverse ls))
			(loop2
				(if (or (char=? (car in) #\space) (char=? (car in) #\Tab) (char=? (car in) #\newline) (char=? (car in) #\return))
					ls
					(cons (car in) ls)
				)
				(cdr in)
			)))
)
(define
	(dir-format string)
	(if (char=? #\\ (car (reverse (string->list string))))
		string
		(string-append string "\\")))
