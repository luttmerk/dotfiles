export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ls='ls -alGH'
ulimit -n 2560

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo "%F{128}$branch"
  fi
}

export PS1="%F{128}%m%f:%F{99}%0~%f \$ "
export RPROMPT="$(git_branch_name)"

autoload -Uz compinit && compinit
