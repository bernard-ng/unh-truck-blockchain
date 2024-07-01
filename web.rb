# frozen_string_literal: true

require 'eth'

# Adresse du nœud Ganache
GANACHE_URL = 'http://192.168.122.1:7545'
CONTRACT_ABI = <<-ABI
[
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "newQuantity",
				"type": "uint256"
			}
		],
		"name": "QuantityUpdated",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_quantity",
				"type": "uint256"
			}
		],
		"name": "updateQuantity",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getTotalQuantity",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "totalQuantity",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
ABI
CONTRACT_ADDRESS = '0xa883cbdA2a0B984f3049084afF9883EF6fDc4cb5'

client = Eth::Client.create(GANACHE_URL)
contract = Eth::Contract.from_abi(name: 'MyContract', address: CONTRACT_ADDRESS, abi: CONTRACT_ABI)
result = client.call(contract, 'getTotalQuantity')

puts "Résultat de l'appel de la fonction 'get': #{result}"
