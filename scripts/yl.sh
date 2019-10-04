#!/bin/bash

SEEQUENT_PACKAGES=("xyz" "conductor" "blocktree")
PLATFORM_PACKAGES=("shim")

_element_in() {
    local e match="$1"
    shift
    for e; do [[ "$e" == "$match" ]] && return 0; done
    return 1
}

_get_package() {
    local package="$1"
    if _element_in "$package" "${SEEQUENT_PACKAGES[@]}"; then
        package=@seequent/$package
    fi

    if _element_in "$package" "${PLATFORM_PACKAGES[@]}"; then
        package=@seequent/cloud-platform-$package
    fi
    echo "$package"
    return 0
}

_yarn_link() {
    local package=$(_get_package $1)
    echo "Linking $package"
    yarn link $package
    return 0
}

_yarn_unlink() {
    local package=$(_get_package $1)
    echo "Unlinking $package"
    yarn unlink $package
    return 0
}

_unlink_all() {
    for i in "${SEEQUENT_PACKAGES[@]}"
    do
        _yarn_unlink $i
    done
    for i in "${PLATFORM_PACKAGES[@]}"
    do
        _yarn_unlink $i
    done
}

_link_all() {
    for i in "${SEEQUENT_PACKAGES[@]}"
    do
        _yarn_link $i
    done
    for i in "${PLATFORM_PACKAGES[@]}"
    do
        _yarn_link $i
    done
}

_link_package() {
    local key="$1"
    case $key in
        "spatialjs")
            _link_all
            ;;
        "xyz")
            _yarn_link "conductor"
            _yarn_link "blocktree"
            ;;
        "counterpoint")
            _yarn_link "conductor"
            _yarn_link "blocktree"
            ;;
        *)
            echo "Unknown project: $key"
            exit 2
            ;;
        esac
}

if [[ $# -eq 0 ]]
then
    echo "Linking"
    yarn link
elif [[ $# -eq 1 ]]
then
    key="$1"
    case $key in
        -u)
            _unlink_all
            ;;
        -a)
            _link_all
            ;;
        *)
            _yarn_link $1
            ;;
        esac
    exit 0
elif [[ $# -eq 2 ]]
then
    key="$1"
    case $key in
        -u)
            _yarn_unlink $2
            exit 0
            ;;
        -p)
            _link_package $2
            exit 0
            ;;
        *)
            echo "Unknown argument: $1"
            exit 2
            ;;
        esac
else
    echo "yl [OPTIONS] [package]"
    echo "  -a  link all"
    echo "  -u  unlink all"
    exit 1
fi
