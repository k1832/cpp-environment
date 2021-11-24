# atcoder-tools
alias at="atcoder-tools"

at-clean () {
    # Reference: https://qiita.com/na0AaooQ/items/f2759c9b2c49d2210265
    WORK_DIR=/workspaces/cpp-environment/
    atcoder_path=${WORK_DIR}atcoder/
    echo "Are you sure you want to delete all the directories and files in '$atcoder_path'?"
    echo "Input 'y' to confirm or 'n' to cancel."
    read input
    error_msg="Please input 'y' or 'n'"
    if [ -z $input ] || [ $input = 'no' ] || [ $input = 'NO' ] || [ $input = 'n' ] ; then
        echo "Canceled"
    elif [ $input = 'yes' ] || [ $input = 'YES' ] || [ $input = 'y' ] ; then
        echo "Deleting..."
        find $atcoder_path -mindepth 1 ! -name ".gitignore" | xargs rm -rf && cd $WORK_DIR
        echo "done."
    else
        echo $error_msg
        at-clean
    fi
}

at-gen () {
    at gen $1; at-open $1
}

at-open () {
    contest_directory=/workspaces/cpp-environment/atcoder/$1/
    first_problem=$(ls $contest_directory | sort | head -n 1)
    first_problem_path=${contest_directory}${first_problem}/
    cd $first_problem_path; code ${first_problem_path}main.cpp
}
