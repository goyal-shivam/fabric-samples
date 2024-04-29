# for((i=1;i<=100;i++))
# do
#     printf $i
# done



# i=80
# while [ "$i" -le 101 ]; do
#     amixer cset numid=1 "$i%"
#     sleep 60
#     i=$(( i + 1 ))
# done 


export PATH=/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/bin:$PATH
export FABRIC_CFG_PATH=/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051


# peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}'

# peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'





i=1
while [ "$i" -le 6 ]; do
    # amixer cset numid=1 "$i%"
    printf $i
    printf " - Next execution of MakeDoor Smart Contract\n"

    peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"MakeDoor","Args":[]}'

    sleep 2.5

    printf "\n\nOutput of GetAllAssets - "

    peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'
    printf "\nEnded this loop execution\n\n"
    i=$(( i + 1 ))
done 


