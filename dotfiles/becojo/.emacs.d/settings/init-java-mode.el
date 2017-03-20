(add-hook 'java-mode-hook
              (lambda ()
                (define-key java-mode-map "\"" 'electric-pair)
                (define-key java-mode-map "\'" 'electric-pair)
                (define-key java-mode-map "(" 'electric-pair)
                (define-key java-mode-map "[" 'electric-pair)
                (define-key java-mode-map "{" 'electric-pair)))
