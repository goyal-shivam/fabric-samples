/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/network.sh down
printf "\n\n>>>>>>>>>>NETWORK DOWN>>>>>>>>>>>>>>>>\n\n"
/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/network.sh up createChannel
printf "\n\n>>>>>>>>>>CHANNEL CREATED>>>>>>>>>>>>>>>>\n\n"
/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-go -ccl go
printf "\n\n>>>>>>>>>>SMART CONTRACT DEPLOYED>>>>>>>>>>>>>>>>\n\n"

# For peer 1
export PATH=/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/bin:$PATH
export FABRIC_CFG_PATH=/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051

peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}'

printf "\n\n>>>>>>>>>>1st COMMAND>>>>>>>>>>>>>>>>\n\n"

peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'

printf "\n\n>>>>>>>>>>2nd COMMAND>>>>>>>>>>>>>>>>\n\n"

sleep 2.5

peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"MakeItem","Args":["wheels", "wheels", "4"]}'

printf "\n\n>>>>>>>>>>Get All assets output>>>>>>>>>>>>>>>>\n\n"

sleep 2.5

peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'

printf "\n\n>>>>>>>>>>NEXT COMMAND>>>>>>>>>>>>>>>>\n\n"

peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"MakeItem","Args":["chassis", "abcd", "1"]}'

printf "\n\n>>>>>>>>>>Get All assets output>>>>>>>>>>>>>>>>\n\n"

sleep 2.5

peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'

printf "\n\n>>>>>>>>>>NEXT COMMAND>>>>>>>>>>>>>>>>\n\n"

peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"MakeItem","Args":["engine", "efgh", "1"]}'

printf "\n\n>>>>>>>>>>Get All assets output>>>>>>>>>>>>>>>>\n\n"

sleep 2.5

peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'

printf "\n\n>>>>>>>>>>NEXT COMMAND>>>>>>>>>>>>>>>>\n\n"

peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "/home/shivam/go/src/github.com/goyal-shivam/fabric-samples/test-network/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"MakeItem","Args":["body", "body", "1"]}'

printf "\n\n>>>>>>>>>>Get All assets output>>>>>>>>>>>>>>>>\n\n"

sleep 2.5

peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'

# printf "\n\n>>>>>>>>>>NEXT COMMAND>>>>>>>>>>>>>>>>\n\n"


printf "\n\n>>>>>>>>>>ENDING>>>>>>>>>>>>>>>>\n\n"