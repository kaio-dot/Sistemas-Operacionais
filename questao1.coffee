
readline = require 'readline-sync'
yaml = require 'yaml'
md5 = require 'md5'
fs = require 'fs-jetpack'

arquivo = 'contas.yaml'

login = readline.question 'Digite o login: '
senha = readline.question 'Digite a senha: ', hideEchoBack: true

senha_hash = md5 senha

nova_conta =
  login: login
  senha_hash: senha_hash

contas = []

if fs.exists arquivo
  conteudo = fs.read arquivo
  contas = yaml.parse conteudo or []

contas.push nova_conta

yaml_texto = yaml.stringify contas
fs.write arquivo, yaml_texto

console.log 'Conta criada com sucesso!'
