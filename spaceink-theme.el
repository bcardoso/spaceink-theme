;;; spaceink-theme.el --- A cosmic dark theme -*- lexical-binding: t -*-

;; Copyright (C) 2020-2024 Bruno Cardoso

;; Author: Bruno Cardoso <cardoso.bc@gmail.com>
;; URL: http://github.com/bcardoso/spaceink-theme
;; Version: 0.4
;; Package-Requires: ((emacs "27.1"))
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

;; A cosmic dark theme

;;; Code:

(eval-and-compile

;;;###theme-autoload
  (deftheme spaceink
    "A cosmic dark theme."
    :background-mode 'dark
    :kind 'color-scheme)


;;;; Palette

  ;; NOTE: unused colors are commented out to silence the compiler

  (defconst spaceink-theme-palette
    '(

;;;;; Backgrounds

      (bg+1          "#181130")
      (bg            "#0f0b1c")
      (bg-1          "#05030a")

      (bg-slate-fg   "#434c94")
      ;; (bg-slate+2    "#353a60")
      (bg-slate+1    "#2a2e4c")
      (bg-slate      "#1f2238")
      (bg-slate-1    "#141624")
      (bg-slate-2    "#090a11")
      ;; (bg-slate-bg   "#000000")

      (bg-header+1   "#222136")
      (bg-header     "#161523")
      (bg-header-1   "#0a0a10")

      (bg-quote "#120f1d")

;;;;; Foregrounds

      ;; (fg-fg         "#f8f1e4")
      (fg+2          "#f2e8dd")
      (fg+1          "#ebdbcb")
      (fg            "#e1cebb")
      (fg-1          "#dcc1a6")
      (fg-2          "#d7b592")
      ;; (fg-bg         "#645a42")

      (fg-slate+2    "#a6aab8")
      (fg-slate+1    "#9599ab")
      (fg-slate      "#84899d")
      (fg-slate-1    "#73798f")
      (fg-slate-2    "#656a7f")
      (fg-slate-bg   "#1f2238")

;;;;; Special

      (border        "#292940")
      (comment       "#d09e83")
      (cursor        "#838dd3")
      (highlight     "#221e33")
      (region        "#34344e")

      (diff-add-1    "#132e24")
      (diff-add      "#193e32")
      (diff-add+1    "#17523a")
      (diff-add-fg   "#a4dfa7")
      (diff-del+1    "#7b2522")
      (diff-del      "#5c1e26")
      (diff-del-1    "#40151e")
      (diff-del-fg   "#f9bfbf")
      (diff-mod+1    "#6c5c24")
      (diff-mod      "#514425")
      (diff-mod-1    "#493526")
      (diff-mod-fg   "#ecdd94")

;;;;; Color shades

      (red-fg        "#ff8a80")
      (red+2         "#f9737f")
      (red+1         "#f55462")
      (red           "#eb3a49")
      (red-1         "#f11124")
      ;; (red-2         "#d5091a")
      (red-bg        "#4a1213")

      (orange-fg     "#ffd493")
      (orange+2      "#fbb886")
      (orange+1      "#f7a566")
      (orange        "#ee924b")
      ;; (orange-1      "#f37d22")
      ;; (orange-2      "#ea6a08")
      ;; (orange-bg     "#4b2c14")

      (yellow-fg     "#fff171")
      (yellow+2      "#fed461")
      (yellow+1      "#fac941")
      (yellow        "#f1ba26")
      ;; (yellow-1      "#edb006")
      ;; (yellow-2      "#ce9702")
      (yellow-bg     "#48380f")

      (green-fg      "#74e9c0")
      (green+2       "#74d6a4")
      (green+1       "#5cca92")
      (green         "#4ab980")
      (green-1       "#37a96e")
      (green-2       "#2b915c")
      (green-bg      "#0d3224")

      (blue-fg       "#a2bdeb")
      (blue+2        "#9fc0dc")
      (blue+1        "#88aed0")
      (blue          "#759dbf")
      (blue-1        "#548cbc")
      (blue-2        "#3f7aae")
      (blue-bg       "#162e3f")

      (cyan-fg       "#47cfea")
      (cyan+2        "#4ad5d5")
      (cyan+1        "#34c8c8")
      (cyan          "#34a4a4")
      ;; (cyan-1        "#258f8f")
      ;; (cyan-2        "#1b7676")
      ;; (cyan-bg       "#092527")

      (purple-fg     "#d698ef")
      (purple+2      "#be95e1")
      (purple+1      "#ad7cd6")
      (purple        "#9c68c6")
      ;; (purple-1      "#8b45c5")
      ;; (purple-2      "#7a33b3")
      (purple-bg     "#291844")

      (magenta-fg    "#eb727e")
      (magenta+2     "#d9728e")
      (magenta+1     "#ce5a79")
      (magenta       "#bd4766")
      ;; (magenta-1     "#ad3354")
      (magenta-2     "#952845")
      (magenta-bg    "#35111b")
      ))


;;;; Faces

  (defconst spaceink-theme-faces
    '(

;;;;; Basic
      `(bold ((,c :weight bold)))
      `(bold-italic ((,c :slant italic :weight bold)))
      `(border ((,c :background ,border)))
      `(cursor ((,c :background ,cursor :foreground ,bg-1)))
      `(default ((,c :foreground ,fg :background ,bg)))
      `(error ((,c :foreground ,red :weight bold)))
      `(italic ((,c :slant italic)))
      `(link ((,c :foreground ,blue+1 :underline ,fg-slate-2)))
      `(link-visited ((,c :inherit link :foreground ,purple+1)))
      `(shadow ((,c :foreground ,fg-slate-1)))
      `(success ((,c :foreground ,green-1)))
      `(underline ((,c :underline t)))
      `(warning ((,c :foreground ,orange+1)))
      `(widget-button ((,c :foreground ,purple+2)))
      `(widget-field ((,c :background ,bg-slate-1 :box (:line-width 1 :color ,bg-slate))))

;;;;; Builtin
      `(completions-annotations ((,c :inherit (italic shadow))))
      `(completions-common-part ((,c :foreground ,blue :weight bold)))
      `(completions-first-difference ((,c :foreground ,cyan :weight bold)))
      `(completions-group-title ((,c :foreground ,fg-slate+1 :weight bold)))
      `(fill-column-indicator ((,c :foreground ,bg+1)))
      `(fringe ((,c :background ,bg :foreground ,fg-slate-1)))
      `(gui-element ((,c :background ,bg+1 :foreground ,fg)))
      `(header-line ((,c :inherit mode-line :foreground ,fg-1 :background ,bg-header :box nil)))
      `(highlight ((,c :background ,highlight :distant-foreground ,fg+2)))
      `(lazy-highlight ((,c :background ,blue-bg :foreground ,blue-fg)))
      `(line-number ((,c :foreground ,fg-slate-2)))
      `(line-number-current-line ((,c :background ,bg-slate :foreground ,cyan-fg)))
      `(linum ((,c :background ,bg :foreground ,fg-slate-1)))
      `(match ((,c :background ,yellow-bg :foreground ,yellow-fg)))
      `(minibuffer-prompt ((,c :weight bold :foreground ,fg-slate)))
      `(package-name ((,c :foreground ,purple+2)))
      `(query-replace ((,c :background ,green-bg :foreground ,green-fg)))
      `(region ((,c :background ,region :foreground ,fg+1)))
      `(secondary-selection ((,c :background ,highlight :foreground ,fg+1)))
      `(tooltip ((,c :inherit fixed-pitch :background ,bg-1 :foreground ,fg-1)))
      `(vertical-border ((,c :foreground ,border)))
      `(window-divider ((,c :foreground ,border)))
      `(window-divider-first-pixel ((,c :inherit window-divider)))
      `(window-divider-last-pixel ((,c :inherit window-divider)))

;;;;; font-lock
      `(font-lock-builtin-face ((,c :foreground ,purple-fg)))
      `(font-lock-comment-delimiter-face ((,c :foreground ,comment)))
      `(font-lock-comment-face ((,c :foreground ,comment)))
      `(font-lock-constant-face ((,c :foreground ,green)))
      `(font-lock-doc-face ((,c :foreground ,fg-slate+2)))
      `(font-lock-doc-string-face ((,c :foreground ,yellow)))
      `(font-lock-function-name-face ((,c :foreground ,magenta-fg :weight semi-bold)))
      `(font-lock-keyword-face ((,c :foreground ,blue)))
      `(font-lock-negation-char-face ((,c :foreground ,yellow)))
      `(font-lock-preprocessor-face ((,c :foreground ,cyan+1)))
      `(font-lock-regexp-face ((,c :foreground ,cyan+2)))
      `(font-lock-regexp-grouping-backslash ((,c :foreground ,magenta+2)))
      `(font-lock-regexp-grouping-construct ((,c :foreground ,purple+1)))
      `(font-lock-string-face ((,c :foreground ,blue+1)))
      `(font-lock-type-face ((,c :foreground ,cyan)))
      `(font-lock-variable-name-face ((,c :foreground ,purple+2)))
      `(font-lock-warning-face ((,c :foreground ,orange)))

;;;;; ace-window
      `(aw-leading-char-face ((,c :height 1.5 :foreground ,magenta+1 :weight bold)))

;;;;; activities
      `(activities-tabs ((,c :foreground ,blue+2)))

;;;;; ansi-color
      `(ansi-color-bold ((,c :inherit bold)))
      `(ansi-color-black ((,c :background ,bg :foreground ,bg)))
      `(ansi-color-red ((,c :background ,red+1 :foreground ,red+1)))
      `(ansi-color-green ((,c :background ,green :foreground ,green)))
      `(ansi-color-yellow ((,c :background ,fg-1 :foreground ,fg-1)))
      `(ansi-color-blue ((,c :background ,blue :foreground ,blue)))
      `(ansi-color-magenta ((,c :background ,magenta+1 :foreground ,magenta+1)))
      `(ansi-color-cyan ((,c :background ,cyan :foreground ,cyan)))
      `(ansi-color-white ((,c :background ,fg-2 :foreground ,fg-2)))

      `(ansi-color-bright-black ((,c :background ,bg-slate-fg :foreground ,bg-slate-fg)))
      `(ansi-color-bright-red ((,c :background ,red+1 :foreground ,red+1)))
      `(ansi-color-bright-green ((,c :background ,green+1 :foreground ,green+1)))
      `(ansi-color-bright-yellow ((,c :background ,fg-1 :foreground ,fg-1)))
      `(ansi-color-bright-blue ((,c :background ,blue :foreground ,blue)))
      `(ansi-color-bright-magenta ((,c :background ,purple+1 :foreground ,purple+1)))
      `(ansi-color-bright-cyan ((,c :background ,cyan :foreground ,cyan)))
      `(ansi-color-bright-white ((,c :background ,fg+1 :foreground ,fg+1)))

;;;;; ansi-term
      `(term               ((,c :inherit default)))
      `(term-color-black   ((,c :inherit ansi-color-black)))
      `(term-color-red     ((,c :inherit ansi-color-red)))
      `(term-color-green   ((,c :inherit ansi-color-green)))
      `(term-color-yellow  ((,c :inherit ansi-color-yellow)))
      `(term-color-blue    ((,c :inherit ansi-color-blue)))
      `(term-color-magenta ((,c :inherit ansi-color-magenta)))
      `(term-color-cyan    ((,c :inherit ansi-color-cyan)))
      `(term-color-white   ((,c :inherit ansi-color-white)))
      `(term-color-bright-black   ((,c :inherit ansi-color-bright-black)))
      `(term-color-bright-red     ((,c :inherit ansi-color-bright-red)))
      `(term-color-bright-green   ((,c :inherit ansi-color-bright-green)))
      `(term-color-bright-yellow  ((,c :inherit ansi-color-bright-yellow)))
      `(term-color-bright-blue    ((,c :inherit ansi-color-bright-blue)))
      `(term-color-bright-magenta ((,c :inherit ansi-color-bright-magenta)))
      `(term-color-bright-cyan    ((,c :inherit ansi-color-bright-cyan)))
      `(term-color-bright-white   ((,c :inherit ansi-color-bright-white)))

;;;;; anzu
      `(anzu-mode-line ((,c :foreground ,orange)))
      `(anzu-replace-highlight ((,c :inherit isearch-lazy-highlight-face)))
      `(anzu-replace-to ((,c :inherit isearch)))

;;;;; avy
      `(avy-background-face ((,c :foreground ,fg-slate-bg)))
      `(avy-goto-char-timer-face ((,c :inherit lazy-highlight :weight bold)))
      `(avy-lead-face ((,c :foreground ,fg+2 :background ,green-bg :weight bold)))
      `(avy-lead-face-0 ((,c :foreground ,fg+2 :background ,magenta-bg :weight bold)))
      `(avy-lead-face-1 ((,c :foreground ,fg+2 :background ,green-bg :weight bold)))
      `(avy-lead-face-2 ((,c :foreground ,fg+2 :background ,magenta-bg :weight bold)))

;;;;; bookmark
      `(bookmark-face ((,c :background unspecified :foreground ,fg-slate-1)))

;;;;; clojure
      `(clojure-keyword ((,c :foreground ,yellow)))
      `(clojure-parens ((,c :foreground ,fg)))
      `(clojure-braces ((,c :foreground ,green)))
      `(clojure-brackets ((,c :foreground ,yellow)))
      `(clojure-double-quote ((,c :foreground ,cyan :background unspecified)))
      `(clojure-special ((,c :foreground ,blue)))
      `(clojure-java-call ((,c :foreground ,purple)))
      `(clojure-test-failure-face ((,c :background unspecified :inherit flymake-warning)))
      `(clojure-test-error-face ((,c :background unspecified :inherit flymake-error)))
      `(clojure-test-success-face ((,c :background unspecified :foreground unspecified :underline ,green)))

;;;;; coffee-mode
      `(coffee-mode-class-name ((,c :foreground ,orange :weight bold)))
      `(coffee-mode-function-param ((,c :foreground ,purple)))

;;;;; company
      `(company-preview ((,c :background unspecified :foreground ,fg-1)))
      `(company-preview-common ((,c :background unspecified :foreground ,green+1 :weight bold)))
      `(company-echo-common ((,c :foreground ,yellow)))
      `(company-tooltip ((,c :background ,bg+1 :foreground ,fg)))
      `(company-tooltip-selection ((,c :foreground ,blue+1 :weight bold :background ,highlight)))
      `(company-tooltip-annotation ((,c :foreground ,fg)))
      `(company-tooltip-common ((,c :foreground ,blue :weight bold)))
      `(company-scrollbar-bg ((,c :background ,bg-1)))
      `(company-scrollbar-fg ((,c :background ,region)))

;;;;; compilation
      `(compilation-column-number ((,c :foreground ,fg-slate+1)))
      `(compilation-line-number ((,c :foreground ,fg-slate+1)))
      `(compilation-message-face ((,c :foreground ,blue)))
      `(compilation-mode-line-exit ((,c :foreground ,green)))
      `(compilation-mode-line-fail ((,c :foreground ,red)))
      `(compilation-mode-line-run ((,c :foreground ,blue)))

;;;;; consult
      `(consult-file ((,c :foreground ,fg-slate+2)))
      `(consult-highlight-match ((,c :inherit lazy-highlight)))

;;;;; corfu
      `(corfu-default ((,c :background ,bg-1)))
      `(corfu-current ((,c :inherit highlight)))
      `(corfu-bar ((,c :background ,region)))
      `(corfu-border ((,c :background ,border)))
      `(corfu-indexed ((,c :background ,bg-slate-1 :foreground ,fg-1 :height 0.80)))
      `(corfu-quick1 ((,c :foreground ,fg+2 :background ,green-bg :weight bold)))
      `(corfu-quick2 ((,c ::foreground ,fg+2 :background ,magenta-bg :weight bold)))

;;;;; cus-edit
      `(custom-variable-tag ((,c :foreground ,cyan)))
      `(custom-group-tag ((,c :foreground ,blue)))
      `(custom-state ((,c :foreground ,green)))

;;;;; deft
      `(deft-title-face ((,c :foreground ,fg)))
      `(deft-summary-face ((,c :foreground ,fg-slate+1)))

;;;;; diff
      `(diff-added ((,c :background ,diff-add :foreground ,diff-add-fg)))
      `(diff-removed ((,c :background ,diff-del :foreground ,diff-del-fg)))
      `(diff-changed ((,c :background ,diff-mod :foreground ,diff-mod-fg :extend t)))
      `(diff-changed-unspecified ((,c :inherit diff-changed)))
      `(diff-header ((,c :background ,bg+1 :foreground ,cyan)))
      `(diff-file-header ((,c :background unspecified :foreground ,blue)))
      `(diff-hunk-header ((,c :background ,bg-slate+1 :foreground ,fg-slate+2)))
      `(diff-function ((,c :background ,bg-slate+1 :foreground ,fg-slate+1)))
      `(diff-refine-added ((,c :background ,diff-add+1 :foreground ,diff-add-fg)))
      `(diff-refine-changed ((,c :background ,diff-mod+1 :foreground ,diff-mod-fg)))
      `(diff-refine-removed ((,c :background ,diff-del+1 :foreground ,diff-del-fg)))
      `(diff-indicator-added ((,c :background ,diff-add :foreground ,green+2)))
      `(diff-indicator-changed ((,c :background ,diff-mod :foreground ,yellow+2)))
      `(diff-indicator-removed ((,c :background ,diff-del :foreground ,red+2)))

;;;;; diff-hl
      `(diff-hl-change ((,c :inherit diff-changed)))
      `(diff-hl-delete ((,c :inherit diff-removed)))
      `(diff-hl-insert ((,c :inherit diff-added)))

;;;;; dired
      `(dired-async-failures ((,c :inherit error)))
      `(dired-async-message ((,c :foreground ,blue)))
      `(dired-async-mode-message ((,c :inherit dired-async-message)))
      `(dired-directory ((,c :foreground ,blue-1 :weight bold)))
      `(dired-symlink ((,c :foreground ,purple+2)))
      `(dired-broken-symlink ((,c :foreground ,red-1)))

;;;;; dired+
      `(diredp-compressed-file-suffix ((,c :foreground ,blue)))
      `(diredp-deletion ((,c :inherit error :inverse-video t)))
      `(diredp-deletion-file-name ((,c :inherit error)))
      `(diredp-dir-heading ((,c :foreground ,green :weight bold)))
      `(diredp-dir-priv ((,c :foreground ,cyan :background unspecified)))
      `(diredp-exec-priv ((,c :foreground ,blue :background unspecified)))
      `(diredp-executable-tag ((,c :foreground ,red :background unspecified)))
      `(diredp-file-name ((,c :foreground ,yellow)))
      `(diredp-file-suffix ((,c :foreground ,green)))
      `(diredp-flag-mark ((,c :foreground ,green :inverse-video t)))
      `(diredp-flag-mark-line ((,c :background unspecified :inherit highlight)))
      `(diredp-ignored-file-name ((,c :foreground ,comment)))
      `(diredp-link-priv ((,c :background unspecified :foreground ,purple)))
      `(diredp-mode-line-flagged ((,c :foreground ,red)))
      `(diredp-mode-line-marked ((,c :foreground ,green)))
      `(diredp-no-priv ((,c :background unspecified)))
      `(diredp-number ((,c :foreground ,yellow)))
      `(diredp-other-priv ((,c :background unspecified :foreground ,purple)))
      `(diredp-rare-priv ((,c :foreground ,red :background unspecified)))
      `(diredp-read-priv ((,c :foreground ,green :background unspecified)))
      `(diredp-symlink ((,c :foreground ,purple)))
      `(diredp-write-priv ((,c :foreground ,yellow :background unspecified)))

;;;;; ediff
      `(ediff-even-diff-A ((,c :foreground ,fg :background unspecified)))
      `(ediff-even-diff-B ((,c :foreground ,fg :background unspecified)))
      `(ediff-odd-diff-A  ((,c :foreground ,comment :background unspecified)))
      `(ediff-odd-diff-B  ((,c :foreground ,comment :background unspecified)))

;;;;; EDTS
      `(edts-face-warning-line ((,c :background unspecified :inherit flymake-warning)))
      `(edts-face-warning-mode-line ((,c :background unspecified :foreground ,orange :weight bold)))
      `(edts-face-error-line ((,c :background unspecified :inherit flymake-error)))
      `(edts-face-error-mode-line ((,c :background unspecified :foreground ,red :weight bold)))

;;;;; eldoc
      `(eldoc-highlight-function-argument ((,c :inherit line-number-current-line :weight bold)))

;;;;; eldoc-box
      `(eldoc-box-body ((,c :inherit default :background ,bg-header)))
      `(eldoc-box-border ((,c :inherit border)))

;;;;; elfeed
      `(elfeed-log-debug-level-face ((,c :foreground ,blue)))
      `(elfeed-log-date-face ((,c :foreground ,fg-slate+2)))
      `(elfeed-log-error-level-face ((,c :foreground ,red-1)))
      `(elfeed-log-info-level-face ((,c :foreground ,purple)))
      `(elfeed-log-warn-level-face ((,c :foreground ,orange)))
      `(elfeed-search-date-face ((,c :foreground ,cyan :weight light)))
      `(elfeed-search-feed-face ((,c :foreground ,blue+1)))
      `(elfeed-search-tag-face ((,c :foreground ,fg-slate+1)))
      `(elfeed-search-title-face ((,c :foreground ,fg-1)))
      `(elfeed-search-unread-count-face ((,c :foreground ,yellow)))
      `(elfeed-search-unread-title-face ((,c :foreground ,fg :weight semi-bold)))

;;;;; embark
      `(embark-collect-group-title ((,c :inherit completions-group-title)))

;;;;; ement
      `(ement-room-list-favourite ((,c :foreground ,orange+1)))
      `(ement-room-list-invited ((,c :inherit italic)))
      `(ement-room-list-left ((,c :foreground ,fg-slate-1)))
      `(ement-room-list-low-priority ((,c :foreground ,fg-1)))
      `(ement-room-list-name ((,c :foreground ,fg-slate)))
      `(ement-room-list-recent ((,c :foreground ,fg-slate+1 :weight bold)))
      `(ement-room-list-space ((,c :inherit magit-section-heading :foreground ,fg)))
      `(ement-room-list-unread ((,c :foreground ,fg-slate+2 :weight bold)))
      `(ement-room-list-very-recent ((,c :foreground ,fg-slate+2 :weight bold)))
      `(ement-tabulated-room-list-favourite ((,c :inherit ement-room-list-favourite)))
      `(ement-tabulated-room-list-invited ((,c :inherit ement-room-list-invited)))
      `(ement-tabulated-room-list-left ((,c :inherit ement-room-list-left)))
      `(ement-tabulated-room-list-low-priority ((,c :inherit ement-room-list-low-priority)))
      `(ement-tabulated-room-list-name ((,c :inherit ement-room-list-name)))
      `(ement-tabulated-room-list-recent ((,c :inherit ement-room-list-recent)))
      `(ement-tabulated-room-list-unread ((,c :inherit ement-room-list-unread)))
      `(ement-tabulated-room-list-very-recent ((,c :inherit ement-room-list-very-recent)))
      `(ement-room-fully-read-marker ((,c :background ,region :foreground ,region)))
      `(ement-room-read-receipt-marker ((,c :background ,highlight :foreground ,highlight)))

;;;;; emms
      `(emms-browser-album-face ((,c :inherit font-lock-keyword-face)))
      `(emms-browser-artist-face ((,c :inherit font-lock-variable-name-face)))
      `(emms-browser-composer-face ((,c :inherit emms-browser-artist-face)))
      `(emms-browser-year/genre-face ((,c :foreground ,cyan)))
      `(emms-browser-performer-face ((,c :inherit emms-browser-artist-face)))
      `(emms-browser-track-face ((,c :foreground ,fg-slate+2)))
      `(emms-playlist-track-face ((,c :inherit emms-browser-track-face)))
      `(emms-playlist-selected-face ((,c :foreground ,orange+1)))

;;;;; erc
      `(erc-direct-msg-face ((,c :foreground ,orange)))
      `(erc-error-face ((,c :foreground ,red)))
      `(erc-header-face ((,c :foreground ,fg :background ,region)))
      `(erc-input-face ((,c :foreground ,green)))
      `(erc-keyword-face ((,c :foreground ,yellow)))
      `(erc-current-nick-face ((,c :foreground ,green)))
      `(erc-my-nick-face ((,c :foreground ,green)))
      `(erc-nick-default-face ((,c :weight normal :foreground ,purple)))
      `(erc-nick-msg-face ((,c :weight normal :foreground ,yellow)))
      `(erc-notice-face ((,c :foreground ,comment)))
      `(erc-pal-face ((,c :foreground ,orange)))
      `(erc-prompt-face ((,c :foreground ,blue)))
      `(erc-timestamp-face ((,c :foreground ,cyan)))
      `(erc-keyword-face ((,c :foreground ,green)))

;;;;; eshell
      `(eshell-ls-directory ((,c :inherit dired-directory)))
      `(eshell-prompt ((,c :inherit minibuffer-prompt)))

;;;;; eww
      `(eww-valid-certificate ((,c :foreground ,green+1)))
      `(eww-invalid-certificate ((,c :foreground ,red+1)))

;;;;; flycheck
      `(flycheck-error ((,c :underline (:style wave :color ,red+1))))
      `(flycheck-warning ((,c :underline (:style line :color ,orange+1))))

;;;;; flycheck-posframe
      `(flycheck-posframe-face ((,c :inherit default :height 0.95)))
      `(flycheck-posframe-info-face ((,c :inherit default :height 0.95)))
      `(flycheck-posframe-warning-face ((,c :foreground ,orange+1 :height 0.95)))
      `(flycheck-posframe-error-face ((,c :foreground ,red+1 :height 0.95)))
      `(flycheck-posframe-background-face ((,c :background ,bg-1)))
      `(flycheck-posframe-border-face ((,c :foreground ,border)))

;;;;; flymake
      `(flymake-note ((,c :underline (:style line :color ,green+1))))
      `(flymake-error ((,c :underline (:style wave :color ,red+1))))
      `(flymake-warning ((,c :underline (:style line :color ,orange+1))))

;;;;; flymake-popon
      `(flymake-popon ((,c :background ,bg-header-1)))
      `(flymake-popon-posframe-border ((,c :inherit border)))

;;;;; focus
      `(focus-unfocused ((,c :foreground ,fg-slate-1)))

;;;;; geiser
      `(geiser-font-lock-repl-output ((,c :foreground ,blue)))

;;;;; git-commit
      `(git-commit-comment-action ((,c :inherit font-lock-comment-face)))
      `(git-commit-keyword ((,c :foreground ,purple+1)))
      `(git-commit-nonempty-second-line ((,c :inherit error)))
      `(git-commit-overlong-summary ((,c :inherit warning)))
      `(git-commit-summary ((,c :foreground ,blue+2)))

;;;;; git-gutter
      `(git-gutter:modified ((,c :foreground ,orange-fg)))
      `(git-gutter:added ((,c :foreground ,green+2)))
      `(git-gutter:deleted ((,c :foreground ,red)))
      `(git-gutter:unchanged ((,c :inherit bold)))

;;;;; git-gutter-fringe
      `(git-gutter-fr:modified ((,c :foreground ,purple :weight bold)))
      `(git-gutter-fr:added ((,c :foreground ,green :weight bold)))
      `(git-gutter-fr:deleted ((,c :foreground ,red :weight bold)))

;;;;; gnus
      `(gnus-cite-1 ((,c :inherit outline-1 :foreground unspecified)))
      `(gnus-cite-2 ((,c :inherit outline-2 :foreground unspecified)))
      `(gnus-cite-3 ((,c :inherit outline-3 :foreground unspecified)))
      `(gnus-cite-4 ((,c :inherit outline-4 :foreground unspecified)))
      `(gnus-cite-5 ((,c :inherit outline-5 :foreground unspecified)))
      `(gnus-cite-6 ((,c :inherit outline-6 :foreground unspecified)))
      `(gnus-cite-7 ((,c :inherit outline-7 :foreground unspecified)))
      `(gnus-cite-8 ((,c :inherit outline-8 :foreground unspecified)))
      `(gnus-header-content ((,c :inherit message-header-other)))
      `(gnus-header-subject ((,c :inherit message-header-subject)))
      `(gnus-header-from ((,c :inherit message-header-other-face :weight bold :foreground ,orange)))
      `(gnus-header-name ((,c :inherit message-header-name)))
      `(gnus-button ((,c :inherit link :foreground unspecified)))
      `(gnus-signature ((,c :inherit font-lock-comment-face)))
      `(gnus-summary-normal-unread ((,c :foreground ,blue :weight normal)))
      `(gnus-summary-normal-read ((,c :foreground ,fg :weight normal)))
      `(gnus-summary-normal-ancient ((,c :foreground ,cyan :weight normal)))
      `(gnus-summary-normal-ticked ((,c :foreground ,orange :weight normal)))
      `(gnus-summary-low-unread ((,c :foreground ,comment :weight normal)))
      `(gnus-summary-low-read ((,c :foreground ,comment :weight normal)))
      `(gnus-summary-low-ancient ((,c :foreground ,comment :weight normal)))
      `(gnus-summary-high-unread ((,c :foreground ,yellow :weight normal)))
      `(gnus-summary-high-read ((,c :foreground ,green :weight normal)))
      `(gnus-summary-high-ancient ((,c :foreground ,green :weight normal)))
      `(gnus-summary-high-ticked ((,c :foreground ,orange :weight normal)))
      `(gnus-summary-cancelled ((,c :foreground ,red :background unspecified :weight normal)))
      `(gnus-group-mail-low ((,c :foreground ,comment)))
      `(gnus-group-mail-low-empty ((,c :foreground ,comment)))
      `(gnus-group-mail-1 ((,c :foreground unspecified :weight normal :inherit outline-1)))
      `(gnus-group-mail-2 ((,c :foreground unspecified :weight normal :inherit outline-2)))
      `(gnus-group-mail-3 ((,c :foreground unspecified :weight normal :inherit outline-3)))
      `(gnus-group-mail-4 ((,c :foreground unspecified :weight normal :inherit outline-4)))
      `(gnus-group-mail-5 ((,c :foreground unspecified :weight normal :inherit outline-5)))
      `(gnus-group-mail-6 ((,c :foreground unspecified :weight normal :inherit outline-6)))
      `(gnus-group-mail-1-empty ((,c :inherit gnus-group-mail-1 :foreground ,comment)))
      `(gnus-group-mail-2-empty ((,c :inherit gnus-group-mail-2 :foreground ,comment)))
      `(gnus-group-mail-3-empty ((,c :inherit gnus-group-mail-3 :foreground ,comment)))
      `(gnus-group-mail-4-empty ((,c :inherit gnus-group-mail-4 :foreground ,comment)))
      `(gnus-group-mail-5-empty ((,c :inherit gnus-group-mail-5 :foreground ,comment)))
      `(gnus-group-mail-6-empty ((,c :inherit gnus-group-mail-6 :foreground ,comment)))
      `(gnus-group-news-1 ((,c :foreground unspecified :weight normal :inherit outline-5)))
      `(gnus-group-news-2 ((,c :foreground unspecified :weight normal :inherit outline-6)))
      `(gnus-group-news-3 ((,c :foreground unspecified :weight normal :inherit outline-7)))
      `(gnus-group-news-4 ((,c :foreground unspecified :weight normal :inherit outline-8)))
      `(gnus-group-news-5 ((,c :foreground unspecified :weight normal :inherit outline-1)))
      `(gnus-group-news-6 ((,c :foreground unspecified :weight normal :inherit outline-2)))
      `(gnus-group-news-1-empty ((,c :inherit gnus-group-news-1 :foreground ,comment)))
      `(gnus-group-news-2-empty ((,c :inherit gnus-group-news-2 :foreground ,comment)))
      `(gnus-group-news-3-empty ((,c :inherit gnus-group-news-3 :foreground ,comment)))
      `(gnus-group-news-4-empty ((,c :inherit gnus-group-news-4 :foreground ,comment)))
      `(gnus-group-news-5-empty ((,c :inherit gnus-group-news-5 :foreground ,comment)))
      `(gnus-group-news-6-empty ((,c :inherit gnus-group-news-6 :foreground ,comment)))

;;;;; grep
      `(grep-context-face ((,c :foreground ,comment)))
      `(grep-error-face ((,c :foreground ,red :weight bold :underline t)))
      `(grep-hit-face ((,c :foreground ,blue)))
      `(grep-match-face ((,c :foreground unspecified :background unspecified :inherit match)))

;;;;; frog-jump-buffer
      `(frog-menu-border ((,c :background ,border)))
      `(frog-menu-posframe-background-face ((,c :background ,bg-1)))

;;;;; helm
      `(helm-M-x-key ((,c :inherit help-key-binding)))
      `(helm-M-x-short-doc ((,c :inherit helm-completions-detailed)))
      `(helm-action ((,c :foreground ,fg-slate+2)))
      `(helm-buffer-directory ((,c :inherit dired-directory)))
      `(helm-buffer-file ((,c :foreground ,fg)))
      `(helm-buffer-modified ((,c :foreground ,magenta+2)))
      `(helm-buffer-not-saved ((,c :foreground ,yellow+2)))
      `(helm-buffer-process ((,c :foreground ,fg-slate)))
      `(helm-buffer-saved-out ((,c :inherit warning)))
      `(helm-buffer-size ((,c :foreground ,orange+1)))
      `(helm-candidate-number ((,c :background ,bg-1 :foreground ,fg-1)))
      `(helm-command-active-mode ((,c :foreground ,magenta+2 :weight semi-bold)))
      `(helm-completions-detailed ((,c :foreground ,fg-slate+1)))
      `(helm-delete-async-message ((,c :inherit dired-async-message)))
      `(helm-fd-finish ((,c :inherit helm-locate-finish)))
      `(helm-ff-directory ((,c :inherit dired-directory)))
      `(helm-ff-dotted-directory ((,c :background unspecified :foreground ,fg-slate+1)))
      `(helm-ff-executable ((,c :foreground ,green)))
      `(helm-ff-file ((,c :foreground ,fg)))
      `(helm-ff-file-extension ((,c :foreground ,purple-fg)))
      `(helm-ff-invalid-symlink ((,c :inherit dired-broken-symlink)))
      `(helm-ff-symlink ((,c :inherit dired-symlink)))
      `(helm-grep-file ((,c :foreground ,fg-slate)))
      `(helm-grep-finish ((,c :foreground ,green)))
      `(helm-grep-lineno ((,c :inherit compilation-line-number)))
      `(helm-grep-match ((,c :inherit helm-match)))
      `(helm-locate-finish ((,c :foreground ,green)))
      `(helm-mark-prefix ((,c :inherit dired-mark)))
      `(helm-match ((,c :inherit completions-common-part)))
      `(helm-match-item ((,c :inherit helm-match)))
      `(helm-moccur-buffer ((,c :foreground ,cyan)))
      `(helm-non-file-buffer ((,c :foreground ,fg-slate+2)))
      `(helm-selection ((,c :inherit highlight)))
      `(helm-separator ((,c :foreground ,purple+1)))
      `(helm-source-header ((,c :background ,bg-quote :foreground ,fg-slate :weight bold)))
      `(helm-visible-mark ((,c :inherit dired-marked)))

;;;;; helm-descbinds
      `(helm-descbinds-binding ((,c :inherit default)))
      `(helm-descbinds-key ((,c :inherit help-key-binding)))

;;;;; helm-ls-git
      `(helm-ls-git-added-copied-face ((,c :foreground ,green)))
      `(helm-ls-git-added-modified-face ((,c :foreground ,cyan)))
      `(helm-ls-git-branches-current ((,c :foreground ,yellow)))
      `(helm-ls-git-branches-name ((,c :foreground ,magenta)))
      `(helm-ls-git-branches-name-current ((,c :foreground ,purple+1)))
      `(helm-ls-git-conflict-face ((,c :foreground ,red+2)))
      `(helm-ls-git-deleted-and-staged-face ((,c :foreground ,fg-slate)))
      `(helm-ls-git-deleted-not-staged-face ((,c :foreground ,orange)))
      `(helm-ls-git-modified-and-staged-face ((,c :foreground ,blue+2)))
      `(helm-ls-git-modified-not-staged-face ((,c :foreground ,yellow+2)))
      `(helm-ls-git-renamed-modified-face ((,c :foreground ,orange)))
      `(helm-ls-git-untracked-face ((,c :foreground ,red+2)))

;;;;; helm-rg
      `(helm-rg-error-message ((,c :foreground ,red+1)))
      `(helm-rg-file-match-face ((,c :inherit helm-source-header :extend t)))
      `(helm-rg-match-text-face ((,c :inherit helm-match)))
      `(helm-rg-active-arg-face ((,c :foreground ,green+1)))
      `(helm-rg-extra-arg-face  ((,c :foreground ,orange+2)))
      `(helm-rg-line-number-match-face ((,c :inherit helm-grep-lineno)))

;;;;; helm-swoop
      `(helm-swoop-line-number-face ((,c :inherit line-number)))
      `(helm-swoop-target-line-face ((,c :inherit highlight)))
      `(helm-swoop-target-word-face ((,c :inherit helm-match)))

;;;;; help
      `(help-key-binding ((,c :foreground ,purple :weight bold)))
      `(help-argument-name ((,c :foreground ,green+2)))
      `(describe-variable-value ((,c :foreground ,cyan+2 :weight bold)))

;;;;; hi-lock-mode
      `(hi-yellow ((,c :background ,yellow-bg :foreground ,yellow-fg)))

;;;;; highlight-thing
      `(highlight-thing ((,c :background ,highlight :foreground unspecified)))

;;;;; highlight-symbol
      `(highlight-symbol-face ((,c :background ,purple-bg)))

;;;;; hydra
      `(hydra-face-red ((,c :weight bold :foreground ,red+1)))
      `(hydra-face-blue ((,c :weight bold :foreground ,blue+1)))
      `(hydra-face-pink ((,c :weight bold :foreground ,magenta+1)))
      `(hydra-face-teal ((,c :weight bold :foreground ,cyan+1)))
      `(hydra-face-amaranth ((,c :weight bold :foreground ,cyan+2)))

;;;;; ibuffer
      `(ibuffer-deletion-face ((,c :background ,red+2 :foreground ,fg-slate-1)))
      `(ibuffer-filter-group-name-face  ((,c :weight bold :foreground ,blue+1)))
      `(ibuffer-marked-face ((,c :background ,region :foreground ,orange+1)))
      `(ibuffer-title-face ((,c :weight bold :foreground ,fg)))

;;;;; ido
      `(ido-subdir ((,c :foreground ,purple)))
      `(ido-first-match ((,c :foreground ,orange)))
      `(ido-only-match ((,c :foreground ,green)))
      `(ido-indicator ((,c :foreground ,red :background ,bg)))
      `(ido-virtual ((,c :foreground ,comment)))

;;;;; iedit-mode
      `(iedit-occurrence ((,c :inherit lazy-highlight)))

;;;;; info
      `(Info-quoted ((,c :foreground ,fg-slate+2)))

;;;;; isearch
      `(isearch ((,c :inherit match)))
      `(isearch-lazy-highlight-face ((,c :inherit lazy-highlight :weight bold)))
      `(isearch-fail ((,c :background ,red-bg :foreground ,red-fg :weight bold)))

;;;;; isearch-light
      `(isl-on ((,c :inherit match)))
      `(isl-match ((,c :inherit lazy-highlight)))
      `(isl-match-number ((,c :foreground ,magenta+1 :background ,highlight)))
      `(isl-line ((,c :inherit highlight)))
      `(isl-number ((,c :foreground ,green)))
      `(isl-case-fold ((,c :foreground ,yellow+1)))
      `(isl-string ((,c :foreground ,red+2 :weight bold)))

;;;;; ivy
      `(ivy-confirm-face ((,c :foreground ,green)))
      `(ivy-cursor ((,c :foreground ,cursor)))
      `(ivy-match-required-face ((,c :foreground ,red)))
      `(ivy-remote ((,c :foreground ,blue)))
      `(ivy-subdir ((,c :foreground ,blue-1)))
      `(ivy-current-match ((,c :inherit highlight :weight bold)))
      `(ivy-minibuffer-match-face-1 ((,c :foreground ,orange+1)))
      `(ivy-minibuffer-match-face-2 ((,c :foreground ,blue+1)))
      `(ivy-minibuffer-match-face-3 ((,c :foreground ,cyan)))
      `(ivy-minibuffer-match-face-4 ((,c :foreground ,yellow)))

;;;;; ivy-swiper
      `(swiper-match-face-1 ((,c :inherit ivy-minibuffer-match-face-1)))
      `(swiper-match-face-2 ((,c :inherit ivy-minibuffer-match-face-2)))
      `(swiper-match-face-3 ((,c :inherit ivy-minibuffer-match-face-3)))
      `(swiper-match-face-4 ((,c :inherit ivy-minibuffer-match-face-4)))
      `(swiper-background-match-face-1 ((,c :inherit ivy-minibuffer-match-face-1)))
      `(swiper-background-match-face-2 ((,c :inherit ivy-minibuffer-match-face-2)))
      `(swiper-background-match-face-3 ((,c :inherit ivy-minibuffer-match-face-3)))
      `(swiper-background-match-face-4 ((,c :inherit ivy-minibuffer-match-face-4)))
      `(swiper-line-face ((,c :inherit highlight)))

;;;;; jabber
      `(jabber-chat-prompt-local ((,c :foreground ,yellow)))
      `(jabber-chat-prompt-foreign ((,c :foreground ,orange)))
      `(jabber-chat-prompt-system ((,c :foreground ,yellow :weight bold)))
      `(jabber-chat-text-local ((,c :foreground ,yellow)))
      `(jabber-chat-text-foreign ((,c :foreground ,orange)))
      `(jabber-chat-text-error ((,c :foreground ,red)))
      `(jabber-roster-user-online ((,c :foreground ,green)))
      `(jabber-roster-user-xa ((,c :foreground ,comment)))
      `(jabber-roster-user-dnd ((,c :foreground ,yellow)))
      `(jabber-roster-user-away ((,c :foreground ,orange)))
      `(jabber-roster-user-chatty ((,c :foreground ,purple)))
      `(jabber-roster-user-error ((,c :foreground ,red)))
      `(jabber-roster-user-offline ((,c :foreground ,comment)))
      `(jabber-rare-time-face ((,c :foreground ,comment)))
      `(jabber-activity-face ((,c :foreground ,purple)))
      `(jabber-activity-personal-face ((,c :foreground ,cyan)))

;;;;; js2-mode
      `(js2-warning ((,c :underline ,orange+1)))
      `(js2-error ((,c :underline ,red)))
      `(js2-external-variable ((,c :foreground ,purple)))
      `(js2-function-param ((,c :foreground ,blue)))
      `(js2-instance-member ((,c :foreground ,blue)))
      `(js2-private-function-call ((,c :foreground ,red)))

;;;;; js3-mode
      `(js3-warning-face ((,c :underline ,orange)))
      `(js3-error-face ((,c :foreground unspecified :underline ,red)))
      `(js3-external-variable-face ((,c :foreground ,purple)))
      `(js3-function-param-face ((,c :foreground ,blue)))
      `(js3-jsdoc-tag-face ((,c :foreground ,orange)))
      `(js3-jsdoc-type-face ((,c :foreground ,cyan)))
      `(js3-jsdoc-value-face ((,c :foreground ,yellow)))
      `(js3-jsdoc-html-tag-name-face ((,c :foreground ,blue)))
      `(js3-jsdoc-html-tag-delimiter-face ((,c :foreground ,green)))
      `(js3-instance-member-face ((,c :foreground ,blue)))
      `(js3-private-function-call-face ((,c :foreground ,red)))

;;;;; ledger-mode
      `(ledger-font-comment-face ((,c :inherit font-lock-comment-face)))
      `(ledger-font-occur-narrowed-face ((,c :inherit font-lock-comment-face :invisible t)))
      `(ledger-font-occur-xact-face ((,c :inherit highlight)))
      `(ledger-font-payee-cleared-face ((,c :foreground ,green)))
      `(ledger-font-payee-uncleared-face ((,c :foreground ,fg)))
      `(ledger-font-posting-account-cleared-face ((,c :foreground ,blue)))
      `(ledger-font-posting-account-face ((,c :foreground ,fg-slate+1)))
      `(ledger-font-posting-account-pending-face ((,c :foreground ,yellow)))
      `(ledger-font-posting-date-face ((,c :foreground ,cyan)))
      `(ledger-font-price-date-face ((,c :foreground ,cyan)))
      `(ledger-font-xact-highlight-face ((,c :inherit highlight)))
      `(ledger-occur-narrowed-face ((,c :inherit font-lock-comment-face :invisible t)))
      `(ledger-occur-xact-face ((,c :inherit highlight)))
      `(ledger-font-report-clickable-face ((,c :foreground ,orange)))

;;;;; lsp
      `(lsp-headerline-breadcrumb-path-error-face ((,c :underline (:style line :color ,red+1))))
      `(lsp-headerline-breadcrumb-symbols-error-face ((,c :underline (:style line :color ,red+1))))

;;;;; magit
      `(magit-branch ((,c :foreground ,green)))
      `(magit-diff-added ((,c :background ,diff-add-1 :foreground ,diff-add-fg)))
      `(magit-diff-added-highlight ((,c :inherit diff-added)))
      `(magit-diff-removed ((,c :background ,diff-del-1 :foreground ,diff-del-fg)))
      `(magit-diff-removed-highlight ((,c :inherit diff-removed)))
      `(magit-diff-context ((,c :foreground ,fg-slate-1)))
      `(magit-diff-context-highlight ((,c :background ,highlight :foreground ,fg)))
      `(magit-diff-hunk-heading ((,c :background ,bg-slate :foreground ,fg-slate+1)))
      `(magit-diff-hunk-heading-highlight ((,c :background ,bg-slate+1 :foreground ,fg-slate+2 :weight bold)))
      `(magit-diff-base ((,c :inherit diff-changed)))
      `(magit-diff-base-highlight ((,c :inherit diff-refine-changed)))
      `(magit-diff-file-heading ((,c :inherit bold :foreground ,fg)))
      `(magit-diff-file-heading-highlight ((,c :inherit magit-diff-file-heading :background ,bg-slate)))
      `(magit-diff-file-heading-selection ((,c :inherit bold :background ,bg-slate+1 :foreground ,fg)))
      `(magit-filename ((,c :foreground ,fg)))
      `(magit-hash ((,c :foreground ,purple+2)))
      `(magit-log-author ((,c :foreground ,cyan)))
      `(magit-log-graph ((,c :foreground ,comment)))
      `(magit-log-head-label-bisect-bad ((,c :foreground ,red)))
      `(magit-log-head-label-bisect-good ((,c :foreground ,green)))
      `(magit-log-head-label-default ((,c :foreground ,orange :box nil :weight bold)))
      `(magit-log-head-label-local ((,c :foreground ,purple :box nil :weight bold)))
      `(magit-log-head-label-remote ((,c :foreground ,purple :box nil :weight bold)))
      `(magit-log-head-label-tags ((,c :foreground ,cyan :box nil :weight bold)))
      `(magit-log-sha1 ((,c :foreground ,yellow)))
      `(magit-section-title ((,c :foreground ,blue :weight bold)))
      `(magit-section-heading ((,c :foreground ,fg-slate+2 :weight bold)))
      `(magit-section-highlight ((,c :inherit highlight :weight bold)))
      `(magit-tag ((,c :foreground ,yellow)))

;;;;; macrostep
      `(macrostep-expansion-highlight-face ((,c :inherit highlight :foreground unspecified)))

;;;;; marginalia
      `(marginalia-documentation ((,c :foreground ,fg-slate :slant normal)))

;;;;; mark-multiple
      `(mm/master-face ((,c :inherit region :foreground unspecified :background unspecified)))
      `(mm/mirror-face ((,c :inherit region :foreground unspecified :background unspecified)))

;;;;; markdown
      `(markdown-url-face ((,c :inherit link)))
      `(markdown-link-face ((,c :foreground ,blue :underline t)))

;;;;; mpdel
      `(mpdel-browser-directory-face ((,c :inherit dired-directory)))
      `(mpdel-playlist-current-song-face ((,c :inherit font-lock-keyword-face :weight bold)))
      `(mpdel-tablist-album-face ((,c :foreground ,cyan)))
      `(mpdel-tablist-artist-face ((,c :inherit default)))
      `(mpdel-tablist-date-face ((,c :inherit default)))
      `(mpdel-tablist-disk-face ((,c :inherit shadow)))
      `(mpdel-tablist-song-name-face ((,c :inherit default)))
      `(mpdel-tablist-track-face ((,c :inherit font-lock-comment-face)))

;;;;; mmm-mode
      `(mmm-code-submode-face ((,c :background ,bg+1)))
      `(mmm-comment-submode-face ((,c :inherit font-lock-comment-face)))
      `(mmm-output-submode-face ((,c :background ,bg+1)))

;;;;; message-mode
      `(message-cited-text ((,c :foreground ,fg-slate)))
      `(message-cited-text-1 ((,c :foreground ,fg-slate)))
      `(message-cited-text-2 ((,c :foreground ,fg-2)))
      `(message-cited-text-3 ((,c :foreground ,magenta-fg)))
      `(message-cited-text-4 ((,c :foreground ,purple-fg)))
      `(message-header-other ((,c :foreground ,cyan+1 :weight normal)))
      `(message-header-subject ((,c :foreground ,magenta+2 :weight bold)))
      `(message-header-to ((,c :foreground ,blue+2 :weight bold)))
      `(message-header-cc ((,c :inherit message-header-to :weight normal)))
      `(message-header-name ((,c :background unspecified :foreground ,blue)))
      `(message-header-newsgroups ((,c :foreground ,cyan :slant normal)))
      `(message-mml ((,c :foreground ,green-1)))
      `(message-separator ((,c :foreground ,purple)))

;;;;; mode-line
      `(mode-line ((,c :foreground ,fg+1 :background ,bg-slate :box (:line-width 1 :color ,bg-slate+1))))
      `(mode-line-active ((,c :inherit mode-line)))
      `(mode-line-inactive ((,c :weight normal :foreground ,fg-slate-1 :background ,bg-slate-1 :box (:line-width 1 :color ,bg-slate-1))))
      `(mode-line-buffer-id ((,c :inherit bold)))
      `(mode-line-emphasis ((,c :foreground ,fg+1 :slant italic)))
      `(mode-line-highlight ((,c :foreground ,orange+1 :background unspecified :box nil)))

;;;;; mu4e
      `(mu4e-header-highlight-face ((,c :underline nil :inherit region)))
      `(mu4e-header-marks-face ((,c :underline nil :foreground ,yellow)))
      `(mu4e-header-face ((,c :foreground ,fg-2)))
      `(mu4e-flagged-face ((,c :foreground ,yellow)))
      `(mu4e-replied-face ((,c :foreground ,blue)))
      `(mu4e-unread-face ((,c :foreground ,fg :weight semi-bold)))
      `(mu4e-cited-1-face ((,c :inherit outline-1 :slant normal)))
      `(mu4e-cited-2-face ((,c :inherit outline-2 :slant normal)))
      `(mu4e-cited-3-face ((,c :inherit outline-3 :slant normal)))
      `(mu4e-cited-4-face ((,c :inherit outline-4 :slant normal)))
      `(mu4e-cited-5-face ((,c :inherit outline-5 :slant normal)))
      `(mu4e-cited-6-face ((,c :inherit outline-6 :slant normal)))
      `(mu4e-cited-7-face ((,c :inherit outline-7 :slant normal)))
      `(mu4e-ok-face ((,c :foreground ,green)))
      `(mu4e-view-contact-face ((,c :inherit nil :foreground ,yellow)))
      `(mu4e-view-link-face ((,c :inherit link :foreground ,blue)))
      `(mu4e-view-url-number-face ((,c :inherit nil :foreground ,cyan)))
      `(mu4e-view-attach-number-face ((,c :inherit nil :foreground ,orange)))
      `(mu4e-highlight-face ((,c :weight bold :foreground ,purple)))
      `(mu4e-title-face ((,c :inherit nil :foreground ,green)))

;;;;; notmuch
      `(notmuch-crypto-decryption ((,c :background ,purple-bg)))
      `(notmuch-crypto-part-header ((,c :foreground ,purple+2)))
      `(notmuch-crypto-signature-bad ((,c :foreground ,red+1)))
      `(notmuch-crypto-signature-good ((,c :foreground ,green+1)))
      `(notmuch-crypto-signature-good-key ((,c :foreground ,cyan+1)))
      `(notmuch-crypto-signature-unknown ((,c :foreground ,orange+1)))
      `(notmuch-message-summary-face ((,c :weight semi-bold :background ,bg-slate)))
      `(notmuch-search-count ((,c :foreground ,fg-slate)))
      `(notmuch-search-date ((,c :foreground ,cyan :weight light)))
      `(notmuch-search-flagged-face ((,c :foreground ,orange+2)))
      `(notmuch-search-matching-authors ((,c :foreground ,blue+1)))
      `(notmuch-search-non-matching-authors ((,c :foreground ,fg-slate-1)))
      `(notmuch-search-subject ((,c :foreground ,fg)))
      `(notmuch-search-unread-face ((,c :weight semi-bold)))
      `(notmuch-tag-added ((,c :foreground ,green :weight bold)))
      `(notmuch-tag-deleted ((,c :foreground ,fg-1 :strike-through ,red)))
      `(notmuch-tag-face ((,c :foreground ,fg-slate+1)))
      `(notmuch-tag-unread ((,c :foreground ,magenta+2 :weight bold)))
      `(notmuch-wash-toggle-button ((,c :background ,bg-slate-1 :foreground ,fg-slate+1)))

;;;;; nxml
      `(nxml-name-face ((,c :foreground unspecified :inherit font-lock-constant-face)))
      `(nxml-attribute-local-name-face ((,c :foreground unspecified :inherit font-lock-variable-name-face)))
      `(nxml-ref-face ((,c :foreground unspecified :inherit font-lock-preprocessor-face)))
      `(nxml-delimiter-face ((,c :foreground unspecified :inherit font-lock-keyword-face)))
      `(nxml-delimited-data-face ((,c :foreground unspecified :inherit font-lock-string-face)))
      `(rng-error-face ((,c :underline ,red)))

;;;;; orderless
      `(orderless-match-face-0 ((,c :foreground ,blue :weight bold)))
      `(orderless-match-face-1 ((,c :foreground ,purple+1 :weight bold)))
      `(orderless-match-face-2 ((,c :foreground ,green+1 :weight bold)))
      `(orderless-match-face-3 ((,c :foreground ,yellow+1 :weight bold)))

;;;;; org-mode
      `(org-agenda-date ((,c :foreground ,blue :underline nil)))
      `(org-agenda-date-today ((,c :weight bold :underline nil :foreground ,blue+1)))
      `(org-agenda-dimmed-todo-face ((,c :foreground ,comment)))
      `(org-agenda-done ((,c :foreground ,green)))
      `(org-agenda-structure ((,c :foreground ,purple :height 1.1)))
      `(org-block ((,c :background ,bg-quote :foreground ,fg-slate+2 :extend t)))
      `(org-block-begin-line ((,c :foreground ,fg-slate-1 :background ,bg-header :extend t)))
      `(org-block-end-line ((,c :inherit org-block-begin-line)))
      `(org-checkbox ((,c :foreground ,orange+1)))
      `(org-checkbox-statistics-done ((,c :foreground ,green-1 :weight bold)))
      `(org-checkbox-statistics-todo ((,c :foreground ,magenta+1 :weight bold)))
      `(org-cite ((,c :foreground ,fg-slate+2)))
      `(org-cite-key ((,c :foreground ,green+1 :slant normal)))
      `(org-code ((,c :foreground ,green-fg)))
      `(org-column ((,c :background ,highlight :foreground ,fg)))
      `(org-column-title ((,c :inherit org-column :weight bold :underline t)))
      `(org-date ((,c :foreground ,cyan+1)))
      `(org-date-selected ((,c :background ,cyan+2 :foreground ,bg :weight bold)))
      `(org-document-info ((,c :foreground ,cyan+1)))
      `(org-document-info-keyword ((,c :foreground ,purple+1)))
      `(org-document-title ((,c :weight bold :foreground ,blue+1)))
      `(org-done ((,c :foreground ,green)))
      `(org-drawer ((,c :foreground ,fg-slate-1)))
      `(org-ellipsis ((,c :foreground unspecified)))
      `(org-footnote ((,c :foreground ,cyan)))
      `(org-formula ((,c :foreground ,red)))
      `(org-headline-done ((,c :foreground ,fg-slate+1 :weight normal)))
      `(org-hide ((,c :foreground ,bg :background ,bg)))
      `(org-imminent-deadline ((,c :foreground ,magenta-fg)))
      `(org-level-1 ((,c :weight semi-bold :foreground ,blue)))
      `(org-level-2 ((,c :weight semi-bold :foreground ,cyan)))
      `(org-level-3 ((,c :weight semi-bold :foreground ,purple+1)))
      `(org-level-4 ((,c :weight semi-bold :foreground ,orange+1)))
      `(org-level-5 ((,c :weight semi-bold :foreground ,magenta+2)))
      `(org-level-6 ((,c :weight semi-bold :foreground ,yellow+1)))
      `(org-level-7 ((,c :weight semi-bold :foreground ,green+1)))
      `(org-level-8 ((,c :weight semi-bold :foreground ,red+2)))
      `(org-link ((,c :inherit link)))
      `(org-meta-line ((,c :foreground ,fg-slate)))
      `(org-mode-line-clock ((,c :inherit mode-line)))
      `(org-mode-line-clock-overrun ((,c :inherit mode-line :foreground ,red+1 :weight bold)))
      `(org-ref-cite-face ((,c :slant italic :foreground ,cyan+1)))
      `(org-scheduled ((,c :foreground ,fg-slate+2)))
      `(org-scheduled-previously ((,c :foreground ,orange+2)))
      `(org-scheduled-today ((,c :foreground ,orange-fg)))
      `(org-special-keyword ((,c :inherit org-drawer)))
      `(org-super-agenda-header ((,c :inherit org-agenda-structure :weight bold :foreground ,fg-slate)))
      `(org-table ((,c :foreground ,blue)))
      `(org-tag ((,c :weight semi-bold :foreground ,fg-slate+1)))
      `(org-todo ((,c :weight bold :foreground ,red)))
      `(org-upcoming-deadline ((,c :foreground ,purple+2)))
      `(org-verbatim ((,c :foreground ,green+1)))
      `(org-warning ((,c :slant italic :foreground ,red+1)))

;;;;; org-habit
      `(org-habit-alert-face ((,c :background ,yellow :foreground ,bg)))
      `(org-habit-alert-future-face ((,c :background ,orange+1 :foreground ,fg+2)))
      `(org-habit-clear-face ((,c :background ,green :foreground ,bg)))
      `(org-habit-clear-future-face ((,c :background ,green+1 :foreground ,bg)))
      `(org-habit-overdue-face ((,c :background ,magenta-2 :foreground ,fg+1)))
      `(org-habit-overdue-future-face ((,c :background ,magenta :foreground ,fg+2)))
      `(org-habit-ready-face ((,c :background ,green-1 :foreground ,bg)))
      `(org-habit-ready-future-face ((,c :background ,green-2 :foreground ,bg)))

;;;;; org-ref
      `(org-ref-ref-face ((,c :inherit nil :foreground ,cyan+2)))

;;;;; org-transclusion
      `(org-transclusion-fringe ((,c :background ,green-2 :foreground ,green-2)))
      `(org-transclusion-source-fringe ((,c :background ,fg-slate :foreground ,fg-slate)))

;;;;; outline
      `(outline-1 ((,c :inherit nil :foreground ,blue)))
      `(outline-2 ((,c :inherit nil :foreground ,cyan)))
      `(outline-3 ((,c :inherit nil :foreground ,purple+1)))
      `(outline-4 ((,c :inherit nil :foreground ,orange+1)))
      `(outline-5 ((,c :inherit nil :foreground ,magenta+2)))
      `(outline-6 ((,c :inherit nil :foreground ,yellow+1)))
      `(outline-7 ((,c :inherit nil :foreground ,green+1)))
      `(outline-8 ((,c :inherit nil :foreground ,red+1)))
      `(outline-9 ((,c :inherit nil :foreground ,blue+1)))

;;;;; parenface
      `(paren-face ((,c :foreground ,comment :background unspecified)))
      `(paren-face-match ((,c :inherit show-paren-match)))
      `(paren-face-mismatch ((,c :inherit show-paren-mismatch)))
      `(paren-face-no-match ((,c :inherit show-paren-mismatch)))

;;;;; perspective.el
      `(persp-selected-face ((,c :weight bold :foreground ,blue)))

;;;;; popup
      `(popup-face ((,c :inherit default :foreground ,fg+1 :background ,bg-slate :height 0.9)))
      `(popup-summary-face ((,c :inherit popup-face :foreground ,fg-slate+1)))
      `(popup-scroll-bar-foreground-face ((,c :background ,bg-1)))
      `(popup-tip-face ((,c :inherit popup-face :foreground ,fg-slate+2 :height 0.95)))
      `(popup-isearch-match ((,c :inherit (popup-face isearch-lazy-highlight-face))))
      `(popup-scroll-bar-background-face ((,c :background ,fg-1)))

;;;;; powerline
      `(powerline-active1 ((,c :foreground ,fg :background ,bg+1)))
      `(powerline-inactive1 ((,c :foreground ,fg-1 :background ,bg+1)))
      `(powerline-active2 ((,c :foreground ,fg-slate :background ,bg)))
      `(powerline-inactive2 ((,c :foreground ,fg-slate-1 :background ,bg-1)))

;;;;; pulse
      `(pulse-highlight-start-face ((,c :background ,blue-bg :extend t)))

;;;;; rainbow-delimiters
      `(rainbow-delimiters-depth-1-face ((,c :foreground ,fg)))
      `(rainbow-delimiters-depth-2-face ((,c :foreground ,blue+1)))
      `(rainbow-delimiters-depth-3-face ((,c :foreground ,orange+1)))
      `(rainbow-delimiters-depth-4-face ((,c :foreground ,cyan+1)))
      `(rainbow-delimiters-depth-5-face ((,c :foreground ,purple+1)))
      `(rainbow-delimiters-depth-6-face ((,c :foreground ,green+1)))
      `(rainbow-delimiters-depth-7-face ((,c :foreground ,yellow-fg)))
      `(rainbow-delimiters-depth-8-face ((,c :foreground ,fg-slate+2)))
      `(rainbow-delimiters-depth-9-face ((,c :foreground ,magenta+2)))
      `(rainbow-delimiters-unmatched-face ((,c :background ,red-bg :foreground ,red-fg)))

;;;;; re-builder
      `(reb-match-0 ((,c :foreground ,fg+2 :background ,fg-slate-2)))
      `(reb-match-1 ((,c :foreground ,fg+2 :background ,blue-2)))
      `(reb-match-2 ((,c :foreground ,fg+2 :background ,green-2)))
      `(reb-match-3 ((,c :foreground ,fg+2 :background ,magenta-2)))

;;;;; rg
      `(rg-match-face ((,c :foreground ,blue+1)))

;;;;; RHTML
      `(erb-delim-face ((,c :background ,bg+1)))
      `(erb-exec-face ((,c :background ,bg+1 :weight bold)))
      `(erb-exec-delim-face ((,c :background ,bg+1)))
      `(erb-out-face ((,c :background ,bg+1 :weight bold)))
      `(erb-out-delim-face ((,c :background ,bg+1)))
      `(erb-comment-face ((,c :background ,bg+1 :weight bold :slant italic)))
      `(erb-comment-delim-face ((,c :background ,bg+1)))

;;;;; selectrum
      `(selectrum-completion-docsig ((,c :foreground ,fg-1 :slant normal)))
      `(selectrum-current-candidate ((,c :inherit highlight)))
      `(selectrum-primary-highlight ((,c :inherit match :weight bold)))
      `(selectrum-secondary-highlight ((,c :foreground ,cyan :weight bold)))
      `(selectrum-completion-annotation ((,c :foreground ,fg-1 :slant normal)))

;;;;; sh-script
      `(sh-heredoc ((,c :foreground unspecified :inherit font-lock-string-face :weight normal)))
      `(sh-quoted-exec ((,c :foreground unspecified :inherit font-lock-preprocessor-face)))

;;;;; shortdoc
      `(shortdoc-heading ((,c :inherit fixed-pitch :weight bold)))
      `(shortdoc-section ((,c :inherit fixed-pitch)))

;;;;; show-paren
      `(show-paren-match ((,c :background ,diff-mod-1 :foreground ,diff-mod-fg)))
      `(show-paren-mismatch ((,c :background ,red-bg :foreground ,red-fg)))

;;;;; shr
      `(shr-selected-link ((,c :background ,purple-bg)))

;;;;; slime
      `(slime-highlight-edits-face ((,c :weight bold)))
      `(slime-repl-input-face ((,c :weight normal :underline nil)))
      `(slime-repl-prompt-face ((,c :underline nil :weight bold :foreground ,purple)))
      `(slime-repl-result-face ((,c :foreground ,green)))
      `(slime-repl-output-face ((,c :foreground ,blue :background ,bg)))

;;;;; smartparens
      `(sp-show-pair-match-face ((,c :inherit show-paren-match)))
      `(sp-show-pair-mismatch-face ((,c :inherit show-paren-mismatch)))
      `(sp-pair-overlay-face ((,c :background ,bg+1)))

;;;;; stripe-buffer
      `(stripe-highlight ((,c :background ,bg+1)))
      `(stripe-hl-line ((,c :background ,region :foreground ,fg)))

;;;;; symbol-overlay
      `(symbol-overlay-default-face ((,c :background ,purple-bg)))

;;;;; tab-bar-mode
      `(tab-bar ((,c :background ,bg-slate-2 :foreground ,fg)))
      `(tab-bar-tab-group-current ((,c :box (:line-width -4 :color ,bg) :background ,bg :foreground ,fg :weight bold)))
      `(tab-bar-tab-group-inactive ((,c :box (:line-width -4 :color ,bg-header+1) :background ,bg-header+1 :foreground ,fg-1)))
      `(tab-bar-tab ((,c :box (:line-width -4 :color ,bg) :background ,bg :foreground ,fg+2 :weight bold)))
      `(tab-bar-tab-inactive ((,c :box (:line-width -4 :color ,bg-header+1) :background ,bg-header+1 :foreground ,fg-slate)))
      `(tab-bar-tab-ungrouped ((,c :box (:line-width -4 :color ,bg-header+1) :background ,bg-header+1 :foreground ,fg)))

;;;;; tab-line-mode
      `(tab-line ((,c :background ,bg-header :foreground ,fg)))
      `(tab-line-close-highlight ((,c :inherit error)))
      `(tab-line-highlight ((,c :inherit highlight)))
      `(tab-line-tab ((,c :inherit tab-bar-tab)))
      `(tab-line-tab-current ((,c :inherit bold :box (:line-width -4 :color ,bg) :background ,bg)))
      `(tab-line-tab-inactive ((,c :box (:line-width -4 :color ,bg-header+1) :background ,bg-header+1)))
      `(tab-line-tab-inactive-alternate ((,c :inherit tab-line-tab-inactive :foreground ,fg-slate)))
      `(tab-line-tab-modified ((,c :inherit warning)))

;;;;; textsec
      `(textsec-suspicious ((,c :background ,red-bg)))

;;;;; twittering-mode
      `(twittering-username-face ((,c :inherit erc-pal-face)))
      `(twittering-uri-face ((,c :foreground ,blue :inherit link)))
      `(twittering-timeline-header-face ((,c :foreground ,green :weight bold)))
      `(twittering-timeline-footer-face ((,c :inherit twittering-timeline-header-face)))

;;;;; undo-tree
      `(undo-tree-visualizer-default-face ((,c :foreground ,fg)))
      `(undo-tree-visualizer-current-face ((,c :foreground ,green :weight bold)))
      `(undo-tree-visualizer-active-branch-face ((,c :foreground ,red)))
      `(undo-tree-visualizer-register-face ((,c :foreground ,yellow)))

;;;;; vertico
      `(vertico-group-title ((,c :inherit completions-group-title)))
      `(vertico-quick1 ((,c :foreground ,fg+2 :background ,green-bg :weight bold)))
      `(vertico-quick2 ((,c :foreground ,fg+2 :background ,magenta-bg :weight bold)))

;;;;; vundo
      `(vundo-default ((,c :inherit default)))
      `(vundo-node ((,c :inherit vundo-default)))
      `(vundo-stem ((,c :foreground ,fg-1)))
      `(vundo-highlight ((,c :foreground ,yellow :weight bold)))
      `(vundo-saved ((,c :foreground ,blue+1 :weight bold)))
      `(vundo-last-saved ((,c :foreground ,cyan+1 :weight bold)))

;;;;; vtable
      `(vtable ((,c :inherit bold)))

;;;;; web-mode
      `(web-mode-html-tag-bracket-face ((,c :foreground ,blue)))

;;;;; wgrep
      `(wgrep-face ((,c :background ,highlight :foreground ,orange+2)))
      `(wgrep-file-face ((,c :background ,highlight :foreground ,cyan+2)))

;;;;; which-function
      `(which-func ((,c :foreground ,blue+1 :background unspecified)))

;;;;; which-key
      `(which-key-command-description-face ((,c :foreground ,fg)))
      `(which-key-group-description-face ((,c :foreground ,orange)))
      `(which-key-highlighted-command-face ((,c :inherit warning :underline t)))
      `(which-key-key-face ((,c :inherit help-key-binding)))
      `(which-key-local-map-description-face ((,c :foreground ,fg)))
      `(which-key-note-face ((,c :inherit shadow)))
      `(which-key-separator-face ((,c :inherit shadow)))
      `(which-key-special-key-face ((,c :inherit error)))

;;;;; whitespace
      `(trailing-whitespace ((,c :foreground ,red :inverse-video t :underline nil)))
      `(whitespace-trailing ((,c :foreground ,red :inverse-video t :underline nil)))
      `(whitespace-space-after-tab ((,c :foreground ,red :inverse-video t :underline nil)))
      `(whitespace-space-before-tab ((,c :foreground ,red :inverse-video t :underline nil)))
      `(whitespace-empty ((,c :foreground ,red :inverse-video t :underline nil)))
      `(whitespace-line ((,c :background unspecified :foreground ,red)))
      `(whitespace-indentation ((,c :background unspecified :foreground ,cyan)))
      `(whitespace-space ((,c :background unspecified :foreground ,region)))
      `(whitespace-newline ((,c :background unspecified :foreground ,region)))
      `(whitespace-tab ((,c :background unspecified :foreground ,region)))
      `(whitespace-hspace ((,c :background unspecified :foreground ,region)))

;;;;; xref
      `(xref-match ((,c :inherit match)))))


;;;; Setup theme faces

  (defconst spaceink-theme-custom-variables nil
    "Custom variables for spaceink-theme.")

;;;###autoload
  (defmacro spaceink-theme-with-colors (&rest body)
    "Evaluate BODY with theme colors."
    (declare (indent defun))
    `(let* ((c '((class color) (min-colors 256)))
            ,@(mapcar
               (lambda (color-name)
                 (list color-name
                       (car (alist-get color-name spaceink-theme-palette))))
               (mapcar #'car spaceink-theme-palette)))
       ,@body))

  (defmacro spaceink-theme-set-faces ()
    "Set theme faces."
    (declare (indent defun))
    `(spaceink-theme-with-colors
       (custom-theme-set-faces
        'spaceink ,@spaceink-theme-faces)
       (custom-theme-set-variables
        'spaceink ,@spaceink-theme-custom-variables)))

  (spaceink-theme-set-faces)


;;;; Faces attributes

  (defmacro spaceink-theme-faces ()
    "Return the list of faces defined by `spaceink-theme'."
    (declare (indent defun))
    `(spaceink-theme-with-colors
       (mapcar (lambda (f)
                 (cons (car f) (cdar (nth 1 f))))
               (list ,@spaceink-theme-faces))))

  (defun spaceink-theme-face-attr (face &optional attribute)
    "Get the attributes for FACE or an specific ATTRIBUTE value."
    (let ((face-attr (alist-get face (spaceink-theme-faces))))
      (if attribute
          (plist-get face-attr attribute)
        face-attr)))


;;;; Add to theme load path

;;;###autoload
  (when (and (boundp 'custom-theme-load-path) load-file-name)
    (add-to-list
     'custom-theme-load-path
     (file-name-as-directory (file-name-directory load-file-name))))


  (provide-theme 'spaceink))

;;; spaceink-theme.el ends here
