;;; cb-vars.el --- Variables required across packages.  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Chris Barrett

;; Author: Chris Barrett <chris.d.barrett@me.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(defvar cb-vars-prompt-modes
  '(comint-mode
    inf-ruby-mode
    inferior-python-mode
    ielm-mode
    erc-mode
    term-mode
    utop-mode
    slime-repl-mode
    inferior-scheme-mode
    inferior-haskell-mode
    sclang-post-buffer-mode))

(defvar cb-vars-lisp-modes
  '(cider-repl-mode
    clojure-mode
    clojurescript-mode
    common-lisp-mode
    emacs-lisp-mode
    geiser-repl-mode
    inferior-emacs-lisp-mode
    inferior-lisp-mode
    inferior-scheme-mode
    lisp-mode
    repl-mode
    scheme-mode
    slime-mode
    slime-repl-mode
    extempore-mode
    inferior-extempore-mode))

(defconst cb-vars-ignored-extensions
  '(".elc"
    ".pyc"
    ".v.d"
    ".vo"
    ".glob"))

(defconst cb-vars-ignored-files-regexps
  '("\\.elc\\'"
    "\\`Icon[[:cntrl:]]"
    "\\.pyc\\'"
    "\\.vo\\'"
    "/TAGS\\'"
    "\\.gz\\'"
    "/flycheck_"
    "\\.glob\\'"
    "\\.v\\.d\\'"
    "\\.DS_Store"
    "\\.swp"
    "#$"
    "^/?sudo"
    "\\.bbdb"
    "\\.newsrc"
    "/gnus\\'"
    "/gnus.eld\\'"
    "\\.ido\\.last"
    "\\.org-clock-save\\.el\\'"

    ;; Elm
    ".*/elm-stuff/.*"
    "\\.elmi\\'"
    "\\.elmo\\'"))

(defconst cb-vars-ignored-dirs
  '(".idea"
    "dist"
    "target"
    "obj"
    "build"
    "log"
    "logs"
    "tmp"
    "temp"

    ".cache"
    ".g8"
    "var/folders"
    "Mail"

    ;; VC
    ".git"
    ".hg"
    ".fslckout"
    ".bzr"
    "_darcs"
    ".tox"
    ".svn"

    ;; Emacs
    ".cask"
    "elpa"
    "snippets"
    ".emacs.d/url"
    "Emacs.app"

    ;; Haskell
    ".cabal-sandbox"
    ".stack-work"

    ;; Scala
    "project/target"
    "project/project"
    ".ensime_cache"

    ;; Elm
    ".*/elm-stuff"))

(provide 'cb-vars)

;;; cb-vars.el ends here
