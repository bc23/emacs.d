(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'django-html-mode)
(require 'django-mode)
(yas/load-directory "~/.emacs.d/vendor/django-mode/snippets")

(defun walkah/python-mode-init ()
  (set-variable 'py-smart-indentation t)
  (set-variable 'indent-tabs-mode nil)
  )

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
'flymake-create-temp-inplace))
(local-file (file-relative-name
temp-file
(file-name-directory buffer-file-name))))
      (list "pychecker.sh" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
'("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-hook 'python-mode-hook 'walkah/python-mode-init)
