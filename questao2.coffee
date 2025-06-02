readline = require 'readline-sync'
yaml = require 'yaml'
md5 = require 'md5'
fs = require 'fs-jetpack'

arquivo = 'contas.yaml'

login = readline.question 'Digite o login: '
senha = readline.question 'Digite a senha: ', hideEchoBack: true

senha_hash = md5 senha

if fs.exists arquivo
  conteudo = fs.read arquivo
  contas = yaml.parse conteudo or []

  conta_valida = contas.some (conta) ->
    conta.login == login and conta.senha_hash == senha_hash

  if conta_valida
    console.log '✅ Login bem-sucedido!'
  else
    console.log '❌ Login ou senha inválidos.'
else
  console.log '❌ Nenhuma conta cadastrada ainda.'
