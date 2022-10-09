# atcoder-tools
alias at="atcoder-tools"

at-clean () {
    # Example:
    # $ at-clean
    # $ at-clean abc200

    # Prompt reference: https://qiita.com/na0AaooQ/items/f2759c9b2c49d2210265
    WORK_DIR=/workspaces/cpp-environment/
    atcoder_path=${WORK_DIR}atcoder/
    contest_id=$1

    error_msg="Please input 'y' or 'n'"
    if [ -z $contest_id ]; then
        # Clean all contest directories
        echo "Are you sure you want to delete all the directories and files in '$atcoder_path'?"
        echo "y/N:"
        read input
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
    else
        # One contest deletion
        contest_path=${atcoder_path}${contest_id}
        if [ ! -d $contest_path ]; then
            echo "Contest '$contest_id' does not exit"
            return
        fi

        echo "Are you sure you want to delete the contest directory '$contest_id'?"
        echo "y/N:"
        read input
        if [ -z $input ] || [ $input = 'no' ] || [ $input = 'NO' ] || [ $input = 'n' ] ; then
            echo "Canceled"
        elif [ $input = 'yes' ] || [ $input = 'YES' ] || [ $input = 'y' ] ; then
            echo "Deleting..."
            rm -rf $contest_path && cd $WORK_DIR
            echo "done."
        else
            echo $error_msg
            at-clean $1
        fi
    fi
}

get_id_from_url() {
    # parameter: "https://atcoder.jp/contests/abc226" or "abc226"
    # return: "abc226"
    contest_id=$(awk -F '/' '{print((NF==1) ? $1 : $5)}' <<< $1)
    echo $contest_id
}

at-gen () {
    contest_id=`get_id_from_url $1`
    at gen $contest_id; at-open $contest_id
}

at-open () {
    contest_id=`get_id_from_url $1`
    contest_directory=/workspaces/cpp-environment/atcoder/$contest_id/

    # Sort in lexicographical order and get the first one as a first problem to open.
    first_problem=$(ls $contest_directory | sort | head -n 1)
    first_problem_path=${contest_directory}${first_problem}/
    cd $first_problem_path; code ${first_problem_path}main.cpp
}

at-change () {
    if [ -d ../$1 ]; then
        cd ../$1
    else
        cd ./$1
    fi
    if [ $? -eq 0 ]; then
        code ./main.cpp && echo Successfully opened $1/main.cpp
    else
        echo Failed to open $1/main.cpp
    fi
}

at-tmp () {
    # Generate temporary main file
    file_to_copy=/workspaces/cpp-environment/template/template.cpp
    file_to_generate=/workspaces/cpp-environment/main.cpp
    \cp $file_to_copy $file_to_generate
    code $file_to_generate
}
