(define
	(script-fu-sample-shift)
		(let*
		(
			(filename '(
				"F:\\Owner\\Dropbox\\[archive]\\cocoro\\GRAPHIC\\move\\KanColle-131231-21152344.png"
				"F:\\Owner\\Dropbox\\[archive]\\cocoro\\GRAPHIC\\move\\KanColle-140101-07224489.png"
			))
		)
		(map (lambda(load-file) 
			(let*
				(
					(save-file (string-append load-file "-move.png"))
					(off-x 20)
					(off-y 20)
					(size-x 1280)
					(size-y 720)
					(image (car (gimp-image-new size-x size-y RGB)))
					(layer-back (car (gimp-layer-new image size-x size-y RGB-IMAGE "îwåi" 0 NORMAL-MODE)))
					(layer-img (car (gimp-file-load-layer RUN-NONINTERACTIVE image load-file)))
					(disp (car (gimp-display-new image)))
				)
				(gimp-image-insert-layer image layer-back 0 0)
				(gimp-image-insert-layer image layer-img 0 0)
				(gimp-layer-set-offsets layer-img off-x off-y)
				(set! layer-img (car (gimp-image-merge-visible-layers image EXPAND-AS-NECESSARY)))
				(gimp-file-save RUN-NONINTERACTIVE image layer-img save-file load-file)
				(gimp-display-delete disp)
			)
		) 
		filename
		)
	)
	(gimp-displays-flush)
)
