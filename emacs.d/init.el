(if (boundp 'image-types)
    nil
    (defvar image-types nil))
(load "~/.emacs.d/nxhtml/autostart.el")
(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(require 'color-theme)
(require 'color-theme-solarized)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized-dark)))
(menu-bar-mode -1) 