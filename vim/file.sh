#!/bin/bash
whotest[0]='test' || (echo 'Failure: arrays not supported in this version of
bash.' && exit 2)

FILE=(
bundle/vim-fugitive
bundle/vim-airline
bundle/ctrlp.vim
bundle/vim-sensible
bundle/vim-ansible-yaml
bundle/solarized-powerlines.git
bundle/vim-puppet
bundle/vim-surround
bundle/nerdtree.vim
bundle/ack.vim
bundle/python-mode
bundle/vim-ansible
bundle/ultisnips
bundle/vim-snippets
bundle/vim-snipmate
bundle/vim-addon-mw-utils
bundle/tlib_vim
bundle/vim-chef
bundle/vim-go
bundle/vim-ruby-minitest
bundle/vim-ruby-runner
)

LINK=(
https://github.com/tpope/vim-fugitive.git
https://github.com/bling/vim-airline.git
https://github.com/kien/ctrlp.vim.git
https://github.com/tpope/vim-sensible.git
https://github.com//chase/vim-ansible-yaml.git
https://github.com/pearofducks/solarized-powerlines.git
https://github.com/rodjek/vim-puppet.git
https://github.com/tpope/vim-surround.git
https://github.com/wycats/nerdtree.git
https://github.com/mileszs/ack.vim.git
https://github.com/klen/python-mode.git
https://github.com/chase/vim-ansible-yaml.git
https://github.com/SirVer/ultisnips.git
https://github.com/honza/vim-snippets.git
https://github.com/garbas/vim-snipmate.git
https://github.com/MarcWeber/vim-addon-mw-utils.git
https://github.com/tomtom/tlib_vim.git
https://github.com/vadv/vim-chef
https://github.com/fatih/vim-go.git
https://github.com/sunaku/vim-ruby-minitest.git
https://github.com/henrik/vim-ruby-runner.git
)


count=0
while [ "x${FILE[count]}" != "x" ]
do
   count=$(( $count + 1 ))
   git submodule add ${LINK[$count]} ${FILE[$count]}
   git add .
   git commit -m "Install ${FILE[$count]} as a submodule."
   echo ${FILE[$count]}
   echo ${LINK[$count]}
done
