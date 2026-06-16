;;; flashcard.el

(require 'flashcard-bi)
(require 'flashcard-cloze)
(require 'flashcard-single)
(require 'flashcard-treecloze)

(defvar org-study--flashcard-handlers
  `(
    (SINGLE . ((:save . andy/org-study/flashcard-single/save)
	       (:parse . andy/org-study/flashcard-single/parse)
	       (:props . andy/org-study/flashcard-single/properties)))

    (BI . ((:save . andy/org-study/flashcard-bi/save)
	   (:parse . andy/org-study/flashcard-bi/parse)
	   (:props . andy/org-study/flashcard-bi/properties)))

    (CLOZE . ((:save . andy/org-study/flashcard-cloze/save)
	      (:parse . andy/org-study/flashcard-cloze/parse)
	      (:props . andy/org-study/flashcard-cloze/properties)))

    (TREECLOZE . ((:save . andy/org-study/flashcard-treecloze/save)
		  (:parse . andy/org-study/flashcard-treecloze/parse)
		  (:props . andy/org-study/flashcard-treecloze/properties)))))

(provide 'flashcard)
