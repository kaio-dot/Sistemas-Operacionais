readline = require 'readline-sync'
yaml = require 'yaml'
fs = require 'fs'

arquivo_yaml = 'hd.yaml'

if fs.existsSync arquivo_yaml
  conteudo = fs.readFileSync arquivo_yaml, 'utf8'

  try
    entradas = yaml.parse(conteudo) or []
  catch err
    console.error '❌ Erro ao ler o arquivo YAML:', err.message
    process.exit 1

  usuario = readline.question 'Digite o nome do usuário: '

  arquivos_usuario = entradas.filter (item) -> item.usuario == usuario

  if arquivos_usuario.length > 0
    console.log "\nArquivos de #{usuario}:"
    total = 0
    for entrada in arquivos_usuario
      console.log "- #{entrada.arquivo} (#{entrada.tamanho} MB)"
      total += entrada.tamanho

    console.log "\n📦 Total ocupado por '#{usuario}': #{total} MB"
  else
    console.log "⚠️ Nenhum arquivo encontrado para o usuário '#{usuario}'."
else
  console.log '❌ Arquivo hd.yaml não encontrado.'
