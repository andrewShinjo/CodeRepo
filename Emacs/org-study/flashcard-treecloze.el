;;; flashcard-treecloze.el

(defconst TREECLOZE-DUE-PROPERTY-PREFIX "TREECLOZE_DUE_")
(defconst TREECLOZE-INTERVAL-PROPERTY-PREFIX "TREECLOZE_INTERVAL_")
(defconst TREECLOZE-EASE-FACTOR-PROPERTY-PREFIX "TREECLOZE_EASE_FACTOR_")
(defconst TREECLOZE-REPETITION-PROPERTY-PREFIX "TREECLOZE_REPETITION_")
(defconst TREECLOZE-TAG "treecloze")

(defun andy/org-study/flashcard-treecloze/save () nil)

(defun andy/org-study/flashcard-treecloze/parse () nil)

(defun andy/org-study/flashcard-treecloze/properties ()
  "Returns a list of TREECLOZE property names."
  (list TREECLOZE-DUE-PROPERTY-PREFIX
	TREECLOZE-INTERVAL-PROPERTY-PREFIX
	TREECLOZE-EASE-FACTOR-PROPERTY-PREFIX
	TREECLOZE-REPETITION-PROPERTY-PREFIX))

(provide 'flashcard-treecloze)
