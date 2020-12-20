

all:
	@make -s xsess
	@make -s xres
	@make -s bspwm
	@make -s sxhk
	@make -s zsh

emacs:
	echo sym-linking .emacs.d/init.el
	mkdir -p ~/.emacs.d
	ln -fs `pwd`/init.el ~/.emacs.d/init.el
xres:
	echo sym-linking Xresources
	ln -fs `pwd`/Xresources ~/.Xresources

xsess:
	echo sym-linking xsession
	ln -fs `pwd`/xsession ~/.xinitrc

bspwm:
	echo sym-linking bspwmrc
	mkdir -p ~/.config/bspwm
	ln -fs `pwd`/bspwmrc ~/.config/bspwm/bspwmrc

sxhk:
	echo sym-linking sxhkd
	mkdir -p ~/.config/sxhkd
	ln -fs `pwd`/sxhkdrc ~/.config/sxhkd/sxhkdrc

zsh:
	echo sym-linking zshrc
	ln -fs `pwd`/zshrc ~/.zshrc
