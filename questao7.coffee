{ readFileSync } = require 'fs'

dados = readFileSync('processos.yaml', 'utf8')
processos = require('yaml').parse dados

console.log "Processos I/O Bound:"
for proc in processos when proc.io_bound
  console.log "#{proc.name} (PID: #{proc.pid})"
