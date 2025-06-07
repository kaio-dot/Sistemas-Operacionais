{ readFileSync } = require 'fs'

procData = readFileSync('processos.yaml', 'utf8')
userData = readFileSync('usuarios.yaml', 'utf8')

processos = require('yaml').parse procData
usuarios = require('yaml').parse userData

uidToLogin = {}
for user in usuarios
  uidToLogin[user.uid] = user.login

console.log "Processos e seus usuários:"
for proc in processos
  user = uidToLogin[proc.uid] or "Desconhecido"
  console.log "#{proc.name} (PID: #{proc.pid}) → Usuário: #{user}"

console.log "\nUsuários e processos iniciados:"
for user in usuarios
  login = user.login
  uid = user.uid
  procs = (p for p in processos when p.uid is uid)
  if procs.length > 0
    console.log "#{login}:"
    for p in procs
      console.log "  #{p.name} (PID: #{p.pid})"
  else
    console.log "#{login}: nenhum processo."
