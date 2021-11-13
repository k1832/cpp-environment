# atcoder-tools
alias at-clean="ls /workspaces/cpp-environment/atcoder | grep -v .gitignore | xargs rm -rf"
alias at="atcoder-tools"
at-gen () {
    at gen $1 && cd /workspaces/cpp-environment/atcoder/$1
}
