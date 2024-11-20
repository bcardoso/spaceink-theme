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
(require 'cl-macs)


;;;; Xresources

(defun spaceink-export-xresources ()
  "Export spaceink theme colors to Xresources format."
  (cl-flet ((face-attr (str face &optional attr)
              (format "%s: %s\n"
                      str
                      (spaceink-theme-face-attr face
                                                (or attr :background)))))
    (with-current-buffer (get-buffer-create "spaceink.Xresources")
      (erase-buffer)
      (insert
       (concat
        "! Spaceink\n"
        "! https://github.com/bcardoso/spaceink-theme\n\n"
        (face-attr "*.foreground"  'default :foreground)
        (face-attr "*.background"  'default)
        (face-attr "*.cursorColor" 'cursor)
        (face-attr "URxvt.cursorColor" 'cursor)
        "\n! black\n"
        (face-attr "*.color0"  'ansi-color-black)
        (face-attr "*.color8"  'ansi-color-bright-black)
        "! red\n"
        (face-attr "*.color1"  'ansi-color-red)
        (face-attr "*.color9"  'ansi-color-bright-red)
        "! green\n"
        (face-attr "*.color2"  'ansi-color-green)
        (face-attr "*.color10" 'ansi-color-bright-green)
        "! yellow\n"
        (face-attr "*.color3"  'ansi-color-yellow)
        (face-attr "*.color11" 'ansi-color-bright-yellow)
        "! blue\n"
        (face-attr "*.color4"  'ansi-color-blue)
        (face-attr "*.color12" 'ansi-color-bright-blue)
        "! magenta\n"
        (face-attr "*.color5"  'ansi-color-magenta)
        (face-attr "*.color13" 'ansi-color-bright-magenta)
        "! cyan\n"
        (face-attr "*.color6"  'ansi-color-cyan)
        (face-attr "*.color14" 'ansi-color-bright-cyan)
        "! white\n"
        (face-attr "*.color7"  'ansi-color-white)
        (face-attr "*.color15" 'ansi-color-bright-white))))))


;;; Provide

(provide 'spaceink-export)

;;; spaceink-export.el ends here
