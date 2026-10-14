# 📋 Histórico de Versões — index.html

## v2026-10-14_16-18-47 (Atualizado)
**Data:** 14/10/2026 16:18:47
**Arquivo:** `versions/index_2026-10-14_16-18-47.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: corrigir template literal e cálculo de msAdicionais para MA

---



## v2026-10-14_16-14-02 (Atualizado)
**Data:** 14/10/2026 16:14:02
**Arquivo:** `versions/index_2026-10-14_16-14-02.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: passar msAdicionais e msBase como parâmetros para renderPropostaBody

---



## v2026-10-14_16-11-47 (Atualizado)
**Data:** 14/10/2026 16:11:47
**Arquivo:** `versions/index_2026-10-14_16-11-47.html`
**Status:** ✅ Funcional

**Mudanças:**
- feat: adicionar discriminação de mensalidade base + adicionais no box final

---



## v2026-10-14_16-06-55 (Atualizado)
**Data:** 14/10/2026 16:06:55
**Arquivo:** `versions/index_2026-10-14_16-06-55.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: remover duplicação de modulosObj que causava repetição de módulos na proposta

---



## v2026-10-14_16-03-14 (Atualizado)
**Data:** 14/10/2026 16:03:14
**Arquivo:** `versions/index_2026-10-14_16-03-14.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: corrigir ordem dos blocos — serviços opcionais E produtos adicionais ANTES de instalação lojas novas

---



## v2026-10-14_15-58-47 (Atualizado)
**Data:** 14/10/2026 15:58:47
**Arquivo:** `versions/index_2026-10-14_15-58-47.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: 3 alterações na ferramenta — observações sem texto default, toolbar sticky no modal, produtos adicionais após serviços opcionais

---



## v2026-10-14_12-56-23 (Restaurado — Atual)
**Data:** 14/10/2026 12:56:23  
**Arquivo:** `versions/index_2026-10-14_12-56-23.html`  
**Status:** ✅ Funcional

**Mudanças:**
- ✅ Restaurado estado funcional SEM login
- ✅ Marketplace customizável (5 players: iFood, Rappi, 99, Keeta, Open Delivery)
- ✅ Implantação diferenciada (Própria vs Franquia)
- ✅ Observações na proposta
- ✅ Responsáveis padrão (11 emails)
- ✅ PDF generation funcionando
- 🔧 Corrigido erro: duplicata de `modulosObj` na linha 6299

**Notas:**  
Versão v25 do file-history (588KB, 8212 linhas). Estado antes de tentar adicionar login.

---

## Instruções para Uso

Quando você fizer **alterações importantes** no `index.html`:

1. **Antes de começar a editar**, execute:
   ```bash
   TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
   cp index.html "versions/index_${TIMESTAMP}.html"
   ```

2. **Faça suas mudanças** no `index.html`

3. **Atualize VERSION_LOG.md** com:
   - Nova entrada no topo (data/hora, o que mudou)
   - Mova a entrada anterior para baixo

4. **index.html sempre fica na raiz** — é a versão atual

---

## Estrutura
```
/projeto/
├── index.html              ← versão ATUAL (sempre aqui)
├── VERSION_LOG.md          ← este arquivo
└── versions/
    ├── index_20261014_125623.html
    ├── index_20261013_120000.html  (quando adicionar)
    └── ...
```
