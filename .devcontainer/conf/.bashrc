# atcoder-tools
alias at-clean='find /workspaces/cpp-environment/atcoder/ -mindepth 1 ! -name ".gitignore" | xargs rm -rf && cd /workspaces/cpp-environment/'
alias at="atcoder-tools"

at-gen () {
    at gen $1; at-open $1
}

at-open () {
    contest_directory=/workspaces/cpp-environment/atcoder/$1/
    first_problem=$(ls $contest_directory | sort | head -n 1)
    first_problem_path=${contest_directory}${first_problem}/
    cd $first_problem_path; code ${first_problem_path}main.cpp
}
