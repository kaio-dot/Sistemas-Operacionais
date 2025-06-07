{ readFileSync } = require 'fs'

idiomas =
  pt: "Oi, tudo bem?"
  en: "Hi, how are you?"
  es: "Hola, ¿todo bien?"
  fr: "Salut, ça va?"
  de: "Hallo, alles gut?"

codigo = readFileSync('lang.config', 'utf8').trim()

msg = idiomas[codigo] or "Idioma não suportado."
console.log msg
