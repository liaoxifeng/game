#!/bin/bash

LOCAL_HOST=192.168.1.36
export NODE_NAME="erlang_test@$LOCAL_HOST"
export SETCOOKIE=erlang_test
export LISTEN_PORT=30000

# mysql
export MYSQL_HOST=localhost
export MYSQL_ACCOUNT=root
export MYSQL_PASSWORD=123456
export MYSQL_DB=test
export MYSQL_TOPIC=p1

# redis
export REDIS_HOST=localhost
export REDIS_PORT=6379
export REDIS_DB=0
export REDIS_PASSWORD=redis
export REDIS_TOPIC=foo

live(){
    SYS_CONFIG="config/sys.config"
    cp "config/sys.config.src" "$SYS_CONFIG"
    replace_os_vars "config/sys.config.src" "$SYS_CONFIG"

    VM_ARGS="config/vm.args"
    cp "config/vm.args.src" "$VM_ARGS"
    replace_os_vars "config/vm.args.src" "$VM_ARGS"

    ERL_FLAGS=" -args_file $VM_ARGS" rebar3 shell \
        --config "$SYS_CONFIG" \
        --name ${NODE_NAME} --setcookie ${SETCOOKIE} \
        --apps ssl,ranch,cowlib,mysql,crypto,cowboy,erlang,robot,mnesia
}

# Replace environment variables
replace_os_vars() {
    awk '{
        while(match($0,"[$]{[^}]*}")) {
            var=substr($0,RSTART+2,RLENGTH -3)
            gsub("[$]{"var"}",ENVIRON[var])
        }
    }1' < "$1" > "$2"
}

error(){
    echo "请正确输入"
}

# functions
func=$1

case "${func}" in
	live ) live;;
    * ) error;;
esac