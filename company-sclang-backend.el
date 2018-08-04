(require 'company)
(require 'sclang)

(defun company-sclang-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (case command
    (interactive (company-begin-backend 'company-sclang-backend))
    (prefix (and (eq major-mode 'sclang-mode)
                (company-grab-symbol)))
    (candidates
    (remove-if-not
      (lambda (c) (string-prefix-p arg c))
      sclang-symbol-table))))

(add-to-list 'company-backends 'company-sclang-backend)
