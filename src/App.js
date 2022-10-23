import logo from './logo.svg';
import './App.css';
import {useState, useEffect} from "react";
import {ethers} from "ethers";
import  HelloWorld from "./srctifacts/contracts/HelloWorld.sol/HelloWorld.json";

const contractAddress = "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512";

function App() {

  const connectToWallet = async () => {
    await window.ethereum.request({method: 'eth_requestAccounts'})
  }

  // useEffect(() => {
  //   connectToWallet();
  // })

  return (
    <div className="App">
      <header className="App-header" style={{textAlign:"center"}}>
        <h1>First Dapp</h1>
        <p><strong>Contract Address: </strong> {contractAddress}</p>
      </header>
    </div>
  );
}

export default App;
