# Modelo HTML de Referência — 3S Ferramenta Comercial

Este arquivo é um **insumo auxiliar** para o agente ToqanClaw.
Contém o código HTML completo da ferramenta comercial que deve ser usado como modelo-base para gerar propostas de novos prospects.

O agente deve **copiar esta estrutura** e substituir apenas os dados dinâmicos:
- Nome do cliente
- Dores selecionadas (e suas soluções)
- Módulos ativos e valores
- Parâmetros do contrato
- Dados de margem na calculadora interna

---

## Pontos de personalização

Ao gerar uma nova proposta, o agente deve alterar **apenas** estes trechos:

### No Step 1 (Configuração)
- `value="Oakberry"` → nome do novo prospect
- `value="200"` → quantidade de restaurantes
- `value="60"` → meses de contrato
- `value="12"` → meses de rollout
- `<option value="qsr" selected>` → segmento correto
- Array `DORES` → manter todos, mas marcar `on:true/false` conforme diagnóstico

### No Step 2 (Calculadora)
- Arrays `ME` e `MA` → manter catálogo completo, ajustar `on:true/false` e `v:` conforme proposta
- Valores de setup e instalação → ajustar se necessário
- Checkboxes de isenção → marcar se negociado

### No Step 3 (Apresentação)
- Títulos e textos personalizados com nome do prospect
- Cards de "Operação" → adaptar ao segmento (ex: "Table Service" em vez de "Quick Service")
- Stats da 3S → manter fixos (dados corporativos)

### Variáveis que NUNCA mudam
- Paleta de cores
- Fonte Inter
- Engine de margem (constantes `PR`)
- Layout scroll-snap
- Estrutura de navegação por bolhas

---

## Código HTML completo de referência

O arquivo `3S_Ferramenta_Comercial.html` na mesma pasta contém o código-fonte funcional e atualizado. O agente deve lê-lo diretamente quando precisar do modelo HTML.

Instrução para o agente: **Leia o arquivo `3S_Ferramenta_Comercial.html` da pasta para obter o template HTML atualizado.** Não use versões hardcoded — sempre pegue a versão mais recente do arquivo.
