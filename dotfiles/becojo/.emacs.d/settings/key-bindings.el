;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "C-'") 'er/expand-region)
(global-set-key (kbd "C-\"") 'er/contract-region)

(global-set-key (kbd "C-c C-e") 'eval-and-replace)

(global-set-key (kbd "C-c b e") 'base64-encode-region)
(global-set-key (kbd "C-c b d") 'base64-decode-region)
(global-set-key (kbd "C-c u d") 'urlenc:decode-region)
(global-set-key (kbd "C-c u e") 'urlenc:encode-region)


(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-c e g") 'elpy-goto-definition)

(provide 'key-bindings)
