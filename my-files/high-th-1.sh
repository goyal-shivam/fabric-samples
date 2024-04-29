cd /home/shivam/go/src/github.com/goyal-shivam/fabric-samples/high-throughput/application-go
starttime=$(date +%s)
i=1
while [ "$i" -le 100 ]; do
    printf $i 

    go run app.go update myvar 100 +

    i=$(( i + 1 ))
done 

cat <<EOF

Total setup execution time : $(($(date +%s) - starttime)) secs ...

EOF