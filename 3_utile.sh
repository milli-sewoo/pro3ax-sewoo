#/bin/bash
while true
do
    echo -n "Are you sure to proceed? [y/n] :"
    read ANS

    if [ "${ANS}" = 'y' -o "${ANS}" = 'yes' ]; then
        break
    elif [ "${ANS}" = 'n' -o "${ANS}" = 'no' ]; then
        exit 1
    else
        continue 1
    fi
done

echo "finished"
