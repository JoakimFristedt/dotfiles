#!/bin/bash

base_url="https://download.jetbrains.com/idea"
idea_version="ideaIC-2018.1.3"
extension="tar.gz"
install_dir="/opt"

install() {
    idea_tar_file="$install_dir/$idea_version.$extension"
    if [ ! -f "$idea_tar_file" ]; then
        echo "Downloading $idea_version to $idea_tar_file"
        wget --quiet -c -P $install_dir $base_url/$idea_version.$extension
    else
        echo "$install_dir/$idea_version.$extension already exists, not downloading"
    fi

    idea_dir_name="$(tar -tf $idea_tar_file | grep -o '^[^/]\+' | sort -u)"
    idea_full_install_path="$install_dir/$idea_dir_name"

    if [ ! -d "$idea_full_install_path" ]; then
        tar -xf $idea_tar_file -C $install_dir
        echo "Extracted $idea_tar_file to $idea_full_install_path"
    else
        echo "Not extracting $idea_tar_file since $idea_full_install_path exists"
    fi

    symlink_idea_tar_file="$install_dir/idea"
    ln -sf $install_dir/$idea_dir_name $symlink_idea_tar_file
    echo "symlink_idea_tar_file $symlink_idea_tar_file created for $install_dir/$idea_dir_name"
}

install
