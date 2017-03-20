(setq web-mode-markup-indent-offset 2)

(add-hook 'web-mode-hook
          (lambda ()
            (emmet-mode)))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))

