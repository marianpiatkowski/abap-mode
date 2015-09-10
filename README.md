#ABAP Mode

ABAP Mode for Emacs

* Syntax Highlight for ABAP Code in Emacs

## Install

Move `abap-mode.el` to a directory in your emacs path.

You can add a directory to your emacs path adding this Emacs Lisp code
to your `~/.emacs` file:

```elisp
(add-to-list 'load-path "~/.emacs.d/lisp/")
```

You can add the following code to automatically load `abap-mode` when
you open files with `.abap` extension:

```elisp
(add-to-list 'auto-mode-alist '("\\.abap\\'" . abap-mode))
```



