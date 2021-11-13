# atcoder-tools
alias at-clean='find /workspaces/cpp-environment/atcoder/ -mindepth 1 ! -name ".gitignore" | xargs rm -rf && cd /workspaces/cpp-environment/'
alias at="atcoder-tools"
at-gen () {
    at gen $1; at-open $1
}

at-open () {
    cd /workspaces/cpp-environment/atcoder/$1/A; code /workspaces/cpp-environment/atcoder/$1/A/main.cpp
}
