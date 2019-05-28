#
# add composer to PATH
#
export PATH="$HOME/.composer/vendor/bin:$PATH"

#
# set PYSPARK_PYTHON
#
export PYSPARK_PYTHON=/usr/local/bin/python3.7

#
# Setup Homebrew Shell Completion a.k.a. bash-completion@2
#
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#
# Source a fancy display script for bash-git-prompt
#
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

#
# Initialize jEnv
#
if which jenv > /dev/null; then eval "$(jenv init -)"; fi