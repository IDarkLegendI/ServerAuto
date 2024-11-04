const text = `
Добрый день, высылаю вам документы
111223 от 02/03/2024 и АК-432 от 15.08.23
`;

const regex = /(\w+-?\w*)\sот\s(\d{2}[\/.]\d{2}[\/.]\d{2,4})/g;
const matches = [];
let match;

while ((match = regex.exec(text)) !== null) {
    matches.push({ document: match[1], date: match[2] });
}

console.log(matches);
