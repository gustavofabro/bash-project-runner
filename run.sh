# #!/bin/bash

PROJECT_COMMAND="node"

options=()
options_count=$(ls -l . | grep -c ^d)
message='Choose projects to run'
# branch name $(git rev-parse --abbrev-ref HEAD)

function openTab {
    tab_title=${1::-1}

    gnome-terminal --tab --working-directory="$PWD/$1" -t $tab_title -- sh -c "$PROJECT_COMMAND; bash"
} 

for folder in */ ; do
    options+=("$folder")
    options+=("")
    options+=("OFF")
done

to_run=$(whiptail --checklist --separate-output --title "Folder projects" "$message" 20 78 $options_count -- "${options[@]}" 3>&1 1>&2 2>&3)


for project in ${to_run[@]} ; do
    openTab $project
done
