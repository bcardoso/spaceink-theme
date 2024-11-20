;;; spaceink-colors.el --- Color generator for Spaceink -*- lexical-binding: t -*-

;; Copyright (C) 2024 Bruno Cardoso

;; Author: Bruno Cardoso <cardoso.bc@gmail.com>
;; URL: https://github.com/bcardoso/spaceink-theme
;; Version: 0.1
;; Package-Requires: ((emacs "29.1"))

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

;; Color generator for `spaceink-theme'.

;; Examples and output comparison for `ct' and `pastel' commands
;; are provided as comments below each relevant function.


;;; Code:

(require 'map)
(require 'ct)
(require 'rainbow-mode)
(require 'spaceink-theme)


;;;; Variables

(defvar sic-buffer "*spaceink-colors*"
  "Buffer for the generated colors.")

(defvar sic-command 'pastel
  "Default command for color transformations (\\='ct or \\='pastel).")

(defvar sic-insert-label-padding "%-14s"
  "Formatting of the color definitions.")

(defvar sic-shades-mix-color-fg nil
  "Color to mix for \"-fg\" shade.")

(defvar sic-shades-mix-color-bg "#233137"
  "Color to mix for \"-bg\" shade.")

(defvar sic-shades-factor 5
  "Default value used in `sic-shades' for saturation multiplier.")


;;;; Get current Spaceink palette

(defun sic-get-palette ()
  "Return the main colors from `spaceink-theme-palette'."
  (seq-filter (lambda (color)
                (not (string-match-p
                      (rx (seq any (or "-" "+") (or digit "fg" "bg") eos))
                      (symbol-name (car color)))))
              spaceink-theme-palette))


;;;; Color transformations

(defun sic-format (color)
  "Return COLOR as a properly formatted hex string."
  (when color
    (if (or (symbolp color)
            (numberp color)
            (and (stringp color) (not (string-match "#" color))))
        (format "#%s" (if (eq color 0) "000" color))
      color)))

(defun sic-pastel-command (color &rest args)
  "Execute shell `pastel' command for COLOR with ARGS."
  (shell-command-to-string
   (format "pastel color \"%s\" %s %s"
           (sic-format color)
           (if-let (arg-list (--filter (and (not (eq nil (car it)))
                                            (not (eq nil (cdr it))))
                                       (map-pairs args)))
               (concat "| "
                       (mapconcat (lambda (action-value)
                                    (format "pastel %s \"%s\""
                                            (car action-value)
                                            (cdr action-value)))
                                  arg-list " | "))
             "")
           ;; NOTE: 'format hex' command does some calc rounding that may
           ;; accumulate in iterations and thus result in different values.
           ;; That's why we only format at the end of the string (by default,
           ;; 'pastel' returns colors in "hsl", which is fine for piping).
           ;; This might explain the different results from both commands.
           "| pastel format hex | tr -d \"\n\"")))


;;;;; Lighten

(cl-defun sic-ct-lighten (color value)
  "Lighten COLOR by VALUE."
  (if (or (not value) (eq value 0))
      color
    (ct-edit-hsl-l-inc (sic-format color) value)))

(cl-defun sic-pastel-lighten (color value)
  "Lighten COLOR by VALUE."
  (sic-pastel-command (sic-format color)
                      'lighten (abs (/ value 100.0))))

;; (sic-ct-lighten     "#123456" 10) => #1a4d90
;; (sic-pastel-lighten "#123456" 10) => #1b4e80


;;;;; Darken

(cl-defun sic-ct-darken (color value)
  "Darken COLOR by VALUE."
  (if (or (not value) (eq value 0))
      color
    (ct-edit-hsl-l-dec (sic-format color) value)))

(cl-defun sic-pastel-darken (color value)
  "Darken COLOR by VALUE."
  (sic-pastel-command (sic-format color)
                      'darken (abs (/ value 100.0))))

;; (sic-ct-darken     "#123456" 10) => #091a2b
;; (sic-pastel-darken "#123456" 10) => #091b2c


;;;;; Saturate

(cl-defun sic-ct-saturate (color value)
  "Saturate COLOR by VALUE."
  (if (or (not value) (eq value 0))
      color
    (ct-edit-hsl-s-inc (sic-format color) value)))

(cl-defun sic-pastel-saturate (color value)
  "Saturate COLOR by VALUE."
  (sic-pastel-command (sic-format color)
                      'saturate (abs (/ value 100.0))))

;; (sic-ct-saturate     "#123456" 10) => #0c335b
;; (sic-pastel-saturate "#123456" 10) => #0d345b


;;;;; Desaturate

(cl-defun sic-ct-desaturate (color value)
  "Desaturate COLOR by VALUE."
  (if (or (not value) (eq value 0))
      color
    (ct-edit-hsl-s-dec (sic-format color) value)))

(cl-defun sic-pastel-desaturate (color value)
  "Desaturate COLOR by VALUE."
  (sic-pastel-command (sic-format color)
                      'desaturate (abs (/ value 100.0))))

;; (sic-ct-desaturate     "#123456") => #143353
;; (sic-pastel-desaturate "#123456") => #153453


;;;;; Hue

(cl-defun sic-ct-hue (color value)
  "Rotate hue channel of COLOR by VALUE."
  (if (or (not value) (eq value 0))
      color
    (ct-edit-hsl-h-inc (sic-format color) value)))

(cl-defun sic-pastel-hue (color value)
  "Rotate hue channel of COLOR by VALUE."
  (sic-pastel-command (sic-format color)
                      'rotate (abs (+ 360 value))))

;; (sic-ct-hue     "#123456" -10) => #113f56
;; (sic-pastel-hue "#123456" -10) => #123f56
;; (sic-ct-hue     "#123456" 180) => #563411
;; (sic-pastel-hue "#123456" 180) => #563412


;;;;; Mix

(defun sic-ct-mix (&rest colors)
  "Mix COLORS."
  (ct-mix `,@(mapcar #'sic-format colors)))

(defun sic-pastel-mix (&rest colors)
  "Mix COLORS."
  (apply #'sic-pastel-command
         (car colors)
         (flatten-list (mapcar (lambda (c) `(mix ,(sic-format c)))
                               (cdr colors)))))

;; NOTE: While other 'ct' & 'pastel' functions' results are roughly the same,
;; "mixed" colors are very different. Also, for 'ct', order doesn't matter,
;; while for 'pastel' order *does* matter (its default fraction is 0.5)

;; (sic-pastel-mix "#0000ff" "#ff0000" "#00ff00") => #aba164
;; (sic-ct-mix     "#0000ff" "#ff0000" "#00ff00") => #3f7f3f
;; (sic-pastel-mix "#00ff00" "#ff0000" "#0000ff") => #ac6199
;; (sic-ct-mix     "#00ff00" "#ff0000" "#0000ff") => #3f7f3f


;;;; Helper functions

(defun sic-use-ct-commands ()
  "Set function aliases for `ct' commands."
  (interactive)
  (setq sic-command 'ct)
  (defalias 'sic-lighten 'sic-ct-lighten)
  (defalias 'sic-darken 'sic-ct-darken)
  (defalias 'sic-saturate 'sic-ct-saturate)
  (defalias 'sic-desaturate 'sic-ct-desaturate)
  (defalias 'sic-mix 'sic-ct-mix)
  (when (called-interactively-p 'any)
    (message "Aliases set for `ct' commands.")))

(defun sic-use-pastel-commands ()
  "Set function aliases for `pastel' commands."
  (interactive)
  (setq sic-command 'pastel)
  (defalias 'sic-lighten 'sic-pastel-lighten)
  (defalias 'sic-darken 'sic-pastel-darken)
  (defalias 'sic-saturate 'sic-pastel-saturate)
  (defalias 'sic-desaturate 'sic-pastel-desaturate)
  (defalias 'sic-mix 'sic-pastel-mix)
  (when (called-interactively-p 'any)
    (message "Aliases set for `pastel' commands.")))

;; NOTE: Default is 'pastel' so I can get the same results from shell.
;; (sic-use-ct-commands)
(sic-use-pastel-commands)

(defmacro sic-with-command (command &rest body)
  "Run BODY with aliases for COMMAND (\\='ct or \\='pastel)."
  (declare (indent defun))
  `(let ((current-command sic-command))
     (if (eq ,command 'ct)
         (sic-use-ct-commands)
       (sic-use-pastel-commands))
     (unwind-protect
         ,@body
       (if (eq current-command 'ct)
           (sic-use-ct-commands)
         (sic-use-pastel-commands)))))

(cl-defun sic-adjust (color &key h s l mix)
  "Return COLOR adjusted by H S L or mixed with color MIX."
  (if (eq sic-command 'ct)
      (let ((c (thread-first color
                             (sic-ct-hue h)
                             (sic-ct-saturate s)
                             (sic-ct-lighten l))))
        (if mix (sic-ct-mix c (sic-format mix)) c))
    (sic-pastel-command color
                        (when mix 'mix) (sic-format mix)

                        (when h 'rotate) (abs (+ 360 (or h 0)))

                        (when (and s (not (eq 0 s)))
                          (if (< s 0) 'desaturate 'saturate))
                        (when (and s (not (eq 0 s)))
                          (abs (/ s 100.0)))

                        (when (and l (not (eq 0 l)))
                          (if (< l 0) 'darken 'lighten))
                        (when (and l (not (eq 0 l)))
                          (abs (/ l 100.0))))))

;; (sic-with-command 'ct     (sic-adjust "#123456")) => #123456
;; (sic-with-command 'pastel (sic-adjust "#123456")) => #123456
;; (sic-with-command 'ct     (sic-adjust "#123456" :s 10 :l 5)) => #0e3f71
;; (sic-with-command 'pastel (sic-adjust "#123456" :s 10 :l 5)) => #104172
;; (sic-with-command 'ct     (sic-adjust "#123456" :s -5 :l 25)) => #2c72b9
;; (sic-with-command 'pastel (sic-adjust "#123456" :s -5 :l 25)) => #2e74ba


;;; Print '(label color) lists to buffer `sic-buffer'

(defmacro sic-with-buffer (&rest body)
  "Run BODY in `sic-buffer'."
  (declare (indent defun))
  `(let ((buf (get-buffer-create sic-buffer)))
     (with-current-buffer buf
       ,@body)))

(defun sic-insert (color-list &optional no-padding)
  "Insert formatted COLOR-LIST.
When NO-PADDING is non-nil, don't add spaces between labels and values."
  (mapc (lambda (label-value)
          (insert (format (concat "(" (if no-padding "%s"
                                        sic-insert-label-padding))
                          (car label-value)))
          (insert (format "\"%s\")\n" (cadr label-value))))
        color-list))

(defun sic-list-to-buffer (color-list &optional erase-buffer comment)
  "Insert COLOR-LIST in `sic-buffer'.
When ERASE-BUFFER is non-nil, erase `sic-buffer' contents before.
If COMMENT is a string, insert it as a comment on top of the buffer."
  (sic-with-buffer
    (if erase-buffer
        (erase-buffer)
      (goto-char (point-max)))
    (let ((pos (point)))
      (lisp-interaction-mode)
      (display-line-numbers-mode -1)
      (rainbow-mode +1)
      (when comment (insert (format ";; %s\n" comment)))
      (sic-insert color-list)
      ;; (insert "\n")
      (goto-char pos)
      (when (not (get-buffer-window buf))
        (pop-to-buffer buf)))))

(defun sic-view (color-or-list &optional label erase-buffer comment)
  "Insert COLOR-OR-LIST in `sic-buffer'.
If COLOR-OR-LIST is a color, use LABEL as its label.
ERASE-BUFFER and COMMENT are options for `sic-list-to-buffer', which see."
  (sic-list-to-buffer (if (listp color-or-list)
                          color-or-list
                        (list (list label color-or-list)))
                      erase-buffer
                      comment))

;; (sic-view (sic-adjust "#123456" :h 20) 'test t)


;;; Generate color shades

(cl-defun sic-shades (label color &optional (value sic-shades-factor))
  "Generate color shades for LABEL and COLOR.
VALUE is a factor for saturation and lightness, or `sic-shades-factor'."
  (let ((c (sic-format color)))
    (list
     (list (intern (format "%s-fg" label))
           (sic-adjust c :s (* 4 value) :l (* 2.5 value) :h 10
                       :mix sic-shades-mix-color-fg))
     (list (intern (format "%s+2" label))
           (sic-adjust c :s (* 1.5 value) :l (* 2 value)))
     (list (intern (format "%s+1" label))
           (sic-adjust c :s (* 1.0 value) :l (* 1 value)))
     (list label c)
     (list (intern (format "%s-1" label))
           (sic-adjust c :s (* 1.0 value) :l (* -1 value)))
     (list (intern (format "%s-2" label))
           (sic-adjust c :s (* 1.5 value) :l (* -2 value)))
     (list (intern (format "%s-bg" label))
           (sic-adjust c :s (* 3.5 value) :l (* -3 value)
                       :mix sic-shades-mix-color-bg)))))

;; (sic-shades 'blue "#123456" 6)


(cl-defun sic-shades-to-buffer
    (label color &key (value sic-shades-factor) erase-buffer comment)
  "Generate color shades for LABEL and COLOR.
VALUE is a factor for saturation and lightness, or `sic-shades-factor'.
ERASE-BUFFER and COMMENT are options for `sic-list-to-buffer', which see."
  (let* ((c (sic-format color))
         (comment-line
          (format "shades for \"%s\" with value %s by `%s'"
                  c value sic-command)))
    (sic-list-to-buffer (sic-shades label c value)
                        erase-buffer
                        (and comment
                             (if (stringp comment)
                                 comment
                               comment-line)))))

;; (sic-with-command 'ct
;;   (sic-shades-to-buffer 'test "#123456" :erase-buffer t :comment t))
;; (sic-with-command 'pastel
;;   (sic-shades-to-buffer 'test "#123456" :erase-buffer nil :comment t))


;;;; Commands

(defun sic-palette ()
  "Insert main color palette in `sic-buffer'."
  (interactive)
  (sic-with-buffer
    (erase-buffer)
    (insert ";; Spaceink palette\n"))
  (sic-list-to-buffer (sic-get-palette)))

(defun sic-shades-palette ()
  "Insert the shades palette in `sic-buffer'."
  (interactive)
  (sic-with-buffer
    (erase-buffer)
    (insert ";; Color shades for Spaceink palette\n"))
  (mapc (lambda (c)
          (sic-shades-to-buffer (car c) (cadr c)))
        (sic-get-palette)))


;;; Provide

(provide 'spaceink-colors)

;;; spaceink-colors.el ends here
