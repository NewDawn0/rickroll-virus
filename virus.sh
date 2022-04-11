file=$1
awk -i inplace 'BEGINFILE{print"#!/bin/sh"}{print}' $file
awk -i inplace 'BEGINFILE{print"eval $(echo \"cHl0aG9uIC1jICJpbXBvcnQgd2ViYnJvd3Nlcjsgd2ViYnJvd3Nlci5vcGVuKFwiaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1kUXc0dzlXZ1hjUVwiKSIK\" | base64 -d)"}{print}' $file
awk -i inplace 'BEGINFILE{print""}{print}' $file

