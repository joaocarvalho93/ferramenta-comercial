# 📋 Histórico de Versões — index.html

## v2026-10-15_16-04-01 (Atualizado)
**Data:** 15/10/2026 16:04:01
**Arquivo:** `versions/index_2026-10-15_16-04-01.html`
**Status:** ✅ Funcional

**Mudanças:**
- feat: adicionar login social Google, checkbox lembrar-me e usar email do usuário logado como responsável

---



## v2026-10-15_11-46-16 (Atualizado)
**Data:** 15/10/2026 11:46:16
**Arquivo:** `versions/index_2026-10-15_11-46-16.html`
**Status:** ✅ Funcional

**Mudanças:**
- feat: adicionar autenticação Firebase, logs e dashboard admin

---



## v2026-10-14_19-04-13 (Atualizado)
**Data:** 14/10/2026 19:04:13
**Arquivo:** `versions/index_2026-10-14_19-04-13.html`
**Status:** ✅ Funcional

**Mudanças:**
- teste commit git

---



## v2026-10-14_16-46-48 (Atualizado)
**Data:** 14/10/2026 16:46:49
**Arquivo:** `versions/index_2026-10-14_16-46-48.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: mostrar apenas mensalidade base na lista de propostas (sem adicionais)

---



## v2026-10-14_16-40-54 (Atualizado)
**Data:** 14/10/2026 16:40:54
**Arquivo:** `versions/index_2026-10-14_16-40-54.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: calcular opcTotal corretamente para adicionais fora da mensalidade

---



## v2026-10-14_16-34-56 (Atualizado)
**Data:** 14/10/2026 16:34:56
**Arquivo:** `versions/index_2026-10-14_16-34-56.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: reformular box para não duplicar valores e remover total da rede

---



## v2026-10-14_16-29-18 (Atualizado)
**Data:** 14/10/2026 16:29:18
**Arquivo:** `versions/index_2026-10-14_16-29-18.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: passar xsTotal como parâmetro para renderPropostaBody

---



## v2026-10-14_16-27-43 (Atualizado)
**Data:** 14/10/2026 16:27:43
**Arquivo:** `versions/index_2026-10-14_16-27-43.html`
**Status:** ✅ Funcional

**Mudanças:**
- feat: reformular box de mensalidade com hierarquia: Mensalidade / + Adicionais / + Outros Produtos

---



## v2026-10-14_16-22-48 (Atualizado)
**Data:** 14/10/2026 16:22:48
**Arquivo:** `versions/index_2026-10-14_16-22-48.html`
**Status:** ✅ Funcional

**Mudanças:**
- fix: usar 'modulos' em vez de 'modulosRender' para incluir adicionais na mensalidade

---



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
