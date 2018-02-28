#!/bin/bash

function ws() {
    local usage=$(cat <<- END
usage: ws <directory>
    -l          list all workspace directories
    -h|--help   print this message
END
)
    local help=$(cat <<- END
ws - change to a workspace directory

$usage
END
)

    if [ -z $WORKSPACES_DIR ]; then
        local WORKSPACES_DIR=$HOME/workspaces
    fi

    if [ $# -eq 0 ]; then
        cd $WORKSPACES_DIR
        return 0
    fi

    local args=()
    while [ $# -gt 0 ]
    do
        key="$1"
        case $key in
            -h|--help)
                echo $help
                return 0
                ;;
            -l)
                local workspaces=()
                ls -d $WORKSPACES_DIR/*/ | while read -r line ; do
                    printf "%-8s\n" "$(basename ${line})"
                done | column
                return 0
                ;;
            -*|--*)
                echo "ws: illegal option $key"
                echo $usage
                return 1
                ;;
            *)
                args+=("$key")
                shift
                ;;
        esac
    done

    cd $WORKSPACES_DIR/${args[@]}
}

