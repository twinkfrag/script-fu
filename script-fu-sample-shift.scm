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
					(offset '(20 20))
					(size '(1280 720))
					(image (car (gimp-image-new (car size) (cadr size) RGB))) ;; image���쐬
					(layer-back (car (gimp-layer-new image (car size) (cadr size) RGB-IMAGE "�w�i" 0 NORMAL-MODE))) ;; �w�i���C���[���쐬
					(layer-img (car (gimp-file-load-layer RUN-NONINTERACTIVE image load-file))) ;; �w�i���C���[���쐬
					(disp (car (gimp-display-new image)))
				)
				(gimp-image-insert-layer image layer-back 0 0) ;; ���C���[��image�Ɋ֘A�Â�
				(gimp-image-insert-layer image layer-img 0 0)
				(gimp-layer-set-offsets layer-img (car offset) (cadr offset)) ;; ���C���[��(20 20)�Ɉړ�
				(set! layer-img (car (gimp-image-merge-visible-layers image EXPAND-AS-NECESSARY))) ;; png�ۑ��̂��߃��C���[������
				(gimp-file-save RUN-NONINTERACTIVE image layer-img save-file load-file) ;; �ۑ�
				(gimp-display-delete disp) ;; ����
			)
		) 
		filename
		)
	)
	(gimp-displays-flush)
)
