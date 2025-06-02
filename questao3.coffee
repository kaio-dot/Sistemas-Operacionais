yaml = require 'yaml'
fs = require 'fs-jetpack'

arquivo = 'contas.yaml'

if fs.exists arquivo
  conteudo = fs.read arquivo
  contas = yaml.parse conteudo or []

  if contas.length > 0
    indice = Math.floor Math.random() * contas.length
    sorteado = contas[indice]
    console.log "🎲 Usuário sorteado: #{sorteado.login}"
  else
    console.log '⚠️ Nenhum usuário cadastrado no arquivo.'
else
  console.log '❌ Arquivo contas.yaml não encontrado.'
