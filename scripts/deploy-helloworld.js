require("@nomiclabs/hardhat-ethers");

const {ethers} = require("hardhat");

const deployHelloWorld = async () => {
    const HelloWorld = await ethers.getContractFactory("HelloWorld");
    const name = await HelloWorld.deploy("Hello World");
    await name.deployed();

    return name;
}

deployHelloWorld().then(value => console.log(value.address)).catch((error) => {
  console.error(error);
  //process.exitCode = 1;
});

// const printName = async (name) => {
//     console.log(await name.sayMyName());
// }

//deploy().then(printName);