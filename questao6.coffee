{ readFileSync } = require 'fs'

dados = readFileSync('processos.yaml', 'utf8')
processos = require('yaml').parse dados

ready = []
running = []
blocked = []

for proc in processos
  switch proc.state
    when "ready" then ready.push proc
    when "running" then running.push proc
    when "blocked" then blocked.push proc

console.log "Processos READY:"
console.log ready

console.log "\nProcessos RUNNING:"
console.log running

console.log "\nProcessos BLOCKED:"
console.log blocked
