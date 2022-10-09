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
    # Example:
    # $ at-gen abc200 # For cpp
    # $ at-gen abc200 py # For python

    contest_id=`get_id_from_url $1`
    flags="--skip-existing-problems"

    if [ $2 == "py" ]; then
        flags+=' --lang=python --template=/workspaces/cpp-environment/template/template.py'
    fi

    at gen $flags $contest_id; at-open $contest_id $2
}

at-open () {
    # Example:
    # $ at-open abc200 # For cpp
    # $ at-open abc200 py # For python

    contest_id=`get_id_from_url $1`
    contest_directory=/workspaces/cpp-environment/atcoder/$contest_id/

    # Sort in lexicographical order and get the first one as a first problem to open.
    first_problem=$(ls $contest_directory | sort | head -n 1)
    first_problem_path=${contest_directory}${first_problem}/

    file_name=main.cpp
    if [ $2 == "py" ]; then
        file_name=main.py
    fi
    cd $first_problem_path; code ${first_problem_path}${file_name}
}

at-change () {
    # Example (should be in contest directory!):
    # $ at-change abc200 # For cpp
    # $ at-change abc200 py # For python

    if [ -d ../$1 ]; then
        cd ../$1
    else
        cd ./$1
    fi

    file_name=main.cpp
    if [ $2 == "py" ]; then
        file_name=main.py
    fi

    if [ $? -eq 0 ]; then
        code ./$file_name && echo Successfully opened $1/$file_name
    else
        echo Failed to open $1/$file_name
    fi
}

at-tmp () {
    # Example (should be in contest directory!):
    # $ at-tmp cpp # For cpp
    # $ at-tmp py # For python

    extension=$1

    file_to_copy=/workspaces/cpp-environment/template/template.$extension
    if [ ! -f $file_to_copy ] ; then
        echo $file_to_copy does not exit.
        echo 'Usage: "at-tmp cpp" or "at-tmp py"'
        return
    fi
    file_to_generate=/workspaces/cpp-environment/main.$extension

    \cp $file_to_copy $file_to_generate
    code $file_to_generate
}
