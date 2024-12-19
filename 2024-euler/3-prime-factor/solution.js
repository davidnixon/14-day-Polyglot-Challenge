process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

function main() {
    const t = parseInt(readLine());
    for(let a0 = 0; a0 < t; a0++){
        let n = parseInt(readLine());
        let d = 2
        while (n > 1) {
            if (n % d === 0) {
                n = Math.floor(n / d)
            }
            else if (d > Math.sqrt(n)) {
                d = n;
                break;
            }
            else d += 1
        }
        console.log(d)
    }
}