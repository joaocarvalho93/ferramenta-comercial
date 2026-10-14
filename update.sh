#!/bin/bash

# Script de versionamento automático + git commit
# Uso: ./update.sh "Descrição da alteração"

set -e

# Verificar se passou mensagem
if [ -z "$1" ]; then
  echo "❌ Erro: Passe uma descrição"
  echo "Uso: ./update.sh \"Descrição da alteração\""
  exit 1
fi

DESCRIPTION="$1"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

echo "📦 Iniciando versionamento automático..."
echo "⏰ Timestamp: $TIMESTAMP"
echo "📝 Descrição: $DESCRIPTION"
echo ""

# 1. Backup do index.html atual
echo "💾 Criando backup..."
cp index.html "versions/index_${TIMESTAMP}.html"
echo "✅ Backup criado: versions/index_${TIMESTAMP}.html"
echo ""

# 2. Atualizar VERSION_LOG.md
echo "📋 Atualizando VERSION_LOG.md..."

# Ler o conteúdo atual
CURRENT_LOG=$(cat VERSION_LOG.md)

# Criar nova entrada
NEW_ENTRY="## v${TIMESTAMP} (Atualizado)
**Data:** $(date '+%d/%m/%Y %H:%M:%S')
**Arquivo:** \`versions/index_${TIMESTAMP}.html\`
**Status:** ✅ Funcional

**Mudanças:**
- $DESCRIPTION

---

"

# Inserir nova entrada no topo (logo após o título)
NEW_LOG="# 📋 Histórico de Versões — index.html

$NEW_ENTRY
$(tail -n +2 VERSION_LOG.md)"

# Salvar
echo "$NEW_LOG" > VERSION_LOG.md
echo "✅ VERSION_LOG.md atualizado"
echo ""

# 3. Git add
echo "📌 Adicionando arquivos ao git..."
git add index.html VERSION_LOG.md versions/
echo "✅ Arquivos staged"
echo ""

# 4. Git commit
echo "🔐 Fazendo commit..."
git commit -m "chore: $DESCRIPTION — v${TIMESTAMP}"
echo "✅ Commit realizado!"
echo ""

# 5. Mostrar log
echo "📜 Últimos commits:"
git log --oneline -5
echo ""

echo "🎉 Tudo pronto! (Local git, sem push)"
