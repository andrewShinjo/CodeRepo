;;; flashcard-single.el

(defconst SINGLE-DELIMITER " :-> ")

(defconst SINGLE-DUE-PROPERTY "SINGLE_DUE")
(defconst SINGLE-INTERVAL-PROPERTY "SINGLE_INTERVAL")
(defconst SINGLE-EASE-FACTOR-PROPERTY "SINGLE_EASE_FACTOR")
(defconst SINGLE-REPETITION-PROPERTY "SINGLE_REPETITION")

(defun andy/org-study/flashcard-single/save (flashcard)
  (let ((due (plist-get flashcard :due))
	(repetition (plist-get flashcard :repetition))
	(ease-factor (plist-get flashcard :ease-factor))
	(interval (plist-get flashcard :interval)))
    (org-entry-put (point) SINGLE-DUE-PROPERTY due)
    (org-entry-put (point) SINGLE-REPETITION-PROPERTY (number-to-string repetition))
    (org-entry-put (point) SINGLE-EASE-FACTOR-PROPERTY (format "%.2f" ease-factor))
    (org-entry-put (point) SINGLE-INTERVAL-PROPERTY (number-to-string interval))))

(defun andy/org-study/flashcard-single/parse () nil)

(defun andy/org-study/flashcard-single/properties ()
  "Returns a list of SINGLE property names."
  (list SINGLE-DUE-PROPERTY
	SINGLE-INTERVAL-PROPERTY
	SINGLE-EASE-FACTOR-PROPERTY
	SINGLE-REPETITION-PROPERTY))

(provide 'flashcard-single)
