(defun terminal-init-putty ()
  "Terminal initialization function for screen."
   ;; Use the xterm color initialization code.
   (xterm-register-default-colors)
   (tty-set-up-initial-frame-faces))

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
