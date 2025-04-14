;;; spaceink-export.el --- Export Spaceink colors -*- lexical-binding: t -*-

;; Copyright (C) 2024 Bruno Cardoso

;; Author: Bruno Cardoso <cardoso.bc@gmail.com>
;; URL: https://github.com/bcardoso/spaceink-theme
;; Version: 0.1
;; Package-Requires: ((emacs "29.1"))
;; Keywords: faces, theme

;; This file is NOT part of GNU Emacs.

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

;; Export Spaceink colors.

;;; Code:

(require 'spaceink-theme)

(defvar spaceink-export-format-string "%s: %s\n")

(defun spaceink-export-format (color-name face &optional attr)
  "Return a string for COLOR-NAME and FACE.
Default FACE attribute ATTR is \":foreground\"."
  (format spaceink-export-format-string
          color-name
          (spaceink-theme-face-attr face (or attr :foreground))))


;;;; Xresources

(defun spaceink-export-xresources ()
  "Export spaceink theme colors to Xresources format."
  (let ((buffer (get-buffer-create "spaceink-theme.Xresources"))
        (spaceink-export-format-string "%s: %s\n"))
    (with-current-buffer buffer
      (erase-buffer)
      (insert
       (concat
        "! Spaceink\n"
        "! https://github.com/bcardoso/spaceink-theme\n\n"
        (spaceink-export-format "*.foreground" 'default)
        (spaceink-export-format "*.background" 'default :background)
        (spaceink-export-format "*.cursorColor" 'cursor :background)
        (spaceink-export-format "URxvt.cursorColor" 'cursor  :background)
        "\n! black\n"
        (spaceink-export-format "*.color0"  'ansi-color-black)
        (spaceink-export-format "*.color8"  'ansi-color-bright-black)
        "! red\n"
        (spaceink-export-format "*.color1"  'ansi-color-red)
        (spaceink-export-format "*.color9"  'ansi-color-bright-red)
        "! green\n"
        (spaceink-export-format "*.color2"  'ansi-color-green)
        (spaceink-export-format "*.color10" 'ansi-color-bright-green)
        "! yellow\n"
        (spaceink-export-format "*.color3"  'ansi-color-yellow)
        (spaceink-export-format "*.color11" 'ansi-color-bright-yellow)
        "! blue\n"
        (spaceink-export-format "*.color4"  'ansi-color-blue)
        (spaceink-export-format "*.color12" 'ansi-color-bright-blue)
        "! magenta\n"
        (spaceink-export-format "*.color5"  'ansi-color-magenta)
        (spaceink-export-format "*.color13" 'ansi-color-bright-magenta)
        "! cyan\n"
        (spaceink-export-format "*.color6"  'ansi-color-cyan)
        (spaceink-export-format "*.color14" 'ansi-color-bright-cyan)
        "! white\n"
        (spaceink-export-format "*.color7"  'ansi-color-white)
        (spaceink-export-format "*.color15" 'ansi-color-bright-white))))
    (pop-to-buffer buffer)))



;;; Provide

(provide 'spaceink-export)

;;; spaceink-export.el ends here
