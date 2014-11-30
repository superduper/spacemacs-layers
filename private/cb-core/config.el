(require 'f)
(require 'dash)
(require 'dash-functional)
(require 'noflet)

;; Menu-bar looks acceptable in OS X. Otherwise it adds clutter.
(when (fboundp 'menu-bar-mode)
  (unless (and (eq system-type 'darwin)
               (not noninteractive))
    (menu-bar-mode -1)))


;;; Use larger font
(spacemacs/set-font "SourceCodePro" 12)

(defvar spacemacs-private-directory (concat user-emacs-directory "private/"))
(defvar spacemacs-autosaves-directory (concat user-emacs-directory "autosaves/")) 

;;; Compatibility

(defalias 'make-local-hook 'ignore)


;;; Convenience aliases

(defalias 'bb   'bury-buffer)
(defalias 'dbf  'delete-file-and-buffer)
(defalias 'dfb  'delete-file-and-buffer)
(defalias 'hex  'hexl-mode)
(defalias 'hff  'hexl-find-file)
(defalias 'kb   'kill-buffer)
(defalias 'plp  'package-list-packages)
(defalias 'qr   'query-replace)
(defalias 'qrr  'query-replace-regexp)
(defalias 'rbf  'rename-file-and-buffer)
(defalias 'rfb  'rename-file-and-buffer)
(defalias 'cal 'calendar)

;;; Set variables

(custom-set-variables
 `(abbrev-file-name (f-join spacemacs-cache-directory "abbrev_defs"))
 `(backup-directory-alist '((".*" . ,(f-join spacemacs-autosaves-directory))))
 `(bookmark-default-file (f-join spacemacs-cache-directory "bookmarks"))
 `(comint-prompt-read-only t)
 `(confirm-nonexistent-file-or-buffer  nil)
 `(default-input-method "TeX")
 `(delete-by-moving-to-trash nil)
 `(delete-old-versions t)
 `(fill-column 80)
 `(initial-major-mode 'org-mode)
 `(kept-new-versions 6)
 `(require-final-newline t)
 `(sentence-end-double-space nil)
 `(tab-width 4)
 `(x-select-enable-clipboard t)
 )

;;; Colours

(defvar solarized-hl-yellow    "#b58900")
(defvar solarized-hl-orange    "#cb4b16")
(defvar solarized-hl-red       "#dc322f")
(defvar solarized-hl-magenta   "#d33682")
(defvar solarized-hl-violet    "#6c71c4")
(defvar solarized-hl-blue      "#268bd2")
(defvar solarized-hl-cyan      "#2aa198")
(defvar solarized-hl-green     "#859900")


;;; Custom faces

(defface core/bg-flash
  '((((class color) (background light))
     :background "darkseagreen2")
    (((class color) (background dark))
     :background "royalblue4"))
  "Face for flashing with a green background."
  :group 'cb-faces)

(defface core/bg-flash-red
  '((t (:background "rosybrown1")))
  "Face for flashing with a red background."
  :group 'cb-faces)

;;; Saving behaviour

(add-hook 'after-save-hook   'executable-make-buffer-file-executable-if-script-p)
(add-hook 'before-save-hook  'whitespace-cleanup)
(add-hook 'before-save-hook  'delete-trailing-whitespace)

;;; Editing advice

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Do not prompt for confirmation for active processes."
  (noflet ((process-list () nil))
    ad-do-it))

(defadvice whitespace-cleanup (around whitespace-cleanup-indent-tab activate)
  "Use the current buffer's tab settings when cleaning whitespace."
  (let ((whitespace-indent-tabs-mode indent-tabs-mode)
        (whitespace-tab-width tab-width))
    ad-do-it))

(defadvice comment-indent-new-line (after add-space activate)
  "Insert a leading space after comment start for new comment lines."
  (when (and comment-start
             (thing-at-point-looking-at (regexp-quote comment-start)))
    (unless (or (thing-at-point-looking-at (rx (+ space))))
      (just-one-space))))

(defadvice insert-for-yank (after clean-whitespace)
  "Clean up whitespace when inserting yanked text."
  (whitespace-cleanup)
  (delete-trailing-whitespace))

(defadvice display-message-or-buffer (before ansi-color activate)
  "Process ANSI color codes in shell output."
  (let ((buf (ad-get-arg 0)))
    (and (bufferp buf)
         (string= (buffer-name buf) "*Shell Command Output*")
         (with-current-buffer buf
           (ansi-color-apply-on-region (point-min) (point-max))))))