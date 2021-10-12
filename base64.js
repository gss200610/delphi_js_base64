const fs = require('fs');

function base64_encode(file) {
    // read binary data
    var bitmap = fs.readFileSync(file);
    // convert binary data to base64 encoded string
    return Buffer.from(bitmap).toString('base64');
}

const file = 'C:/Users/Administrador/Pictures/Anotação 2021-10-01 064405.png';

const fileBase64 = base64_encode(file);
console.log(fileBase64);

fs.writeFileSync('filebase.txt', fileBase64);