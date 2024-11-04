async function main() {
    await new Promise(resolve => fA(resolve));
    await new Promise(resolve => fB(resolve));
    await new Promise(resolve => fC(resolve));
}

function fA(callback) {
    setTimeout(() => { console.log("A"); callback(); }, Math.random() * 1000);
}
function fB(callback) {
    setTimeout(() => { console.log("B"); callback(); }, Math.random() * 1000);
}
function fC(callback) {
    setTimeout(() => { console.log("C"); callback(); }, Math.random() * 1000);
}
