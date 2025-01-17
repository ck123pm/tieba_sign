set -e

print_usage () {
    echo ""
    echo "------------------USAGE------------------------"
    echo "COMMAND:"
    echo "./run_from_local.sh mode"
    echo ""
    echo "PARAMS:"
    echo "mode: 0=minimize, 1=full_funtion"
    echo "------------------USAGE------------------------"
    exit -1
}

if [ $# -lt 1 ]; then
    print_usage
fi

if [ ${1} -eq 0 ]
then
    check_results=`docker run -it --restart=always -d --name tieba_sign_min tieba_sign_min:latest`
    docker logs -f $check_results
elif [ ${1} -eq 1 ]
then
    docker run -it --restart=always --name tieba_sign_full tieba_sign_full:latest /bin/bash
else
    echo "invalid mode: ${1}"
    exit -1
fi
