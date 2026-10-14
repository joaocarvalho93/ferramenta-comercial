# Setup do Agente 3S Ferramenta Comercial no ToqanClaw

## Arquivos necessários

Suba os arquivos abaixo para o workspace do agente no ToqanClaw. A pasta de diagnósticos NÃO é necessária — os diagnósticos chegam via chat (enviados pelo usuário ou pelo agente Luke).

### Estrutura de arquivos

```
/
├── edwiges.txt                        ← Diretrizes do fluxo (o agente lê PRIMEIRO)
├── precificação_3s.xlsx               ← Tabela de preços (fonte de verdade)
├── simulador_3s.xlsx                  ← Modelo financeiro e premissas de margem
├── guia_3s.pdf                        ← Base de conhecimento do produto
├── pitch_v0.pdf                       ← Pitch comercial oficial
├── modelo_apresentação.pdf            ← Template visual de referência
├── 3S_Ferramenta_Comercial.html       ← Template HTML base (o agente copia e adapta)
├── SKILL-3s-ferramenta-comercial.md   ← Script/Skill com base de conhecimento embutida
├── PROMPT-3s-agente.md                ← System prompt (cole no campo de instructions)
└── data/3s-proposta/                  ← Pasta onde o agente salva as propostas geradas
```

### O que cada arquivo faz

| Arquivo | Papel | Quando o agente consulta |
|---------|-------|------------------------|
| `edwiges.txt` | Diretrizes do fluxo comercial | Início de toda proposta |
| `precificação_3s.xlsx` | Preços atualizados de todos os módulos | Ao montar proposta (confirmar valores) |
| `simulador_3s.xlsx` | Premissas da engine de margem | Ao calcular margem ou se questionado |
| `guia_3s.pdf` | Funcionalidades detalhadas dos módulos | Ao argumentar benefícios técnicos |
| `pitch_v0.pdf` | Narrativa de vendas e posicionamento | Ao escrever textos da apresentação |
| `modelo_apresentação.pdf` | Referência visual (layout, cores) | Ao gerar/ajustar visual do HTML |
| `3S_Ferramenta_Comercial.html` | Template HTML completo com 3 steps | Base para gerar cada nova proposta |
| `SKILL-3s-ferramenta-comercial.md` | Base de conhecimento consolidada | Referência rápida (dores, preços, engine) |

### De onde vêm os diagnósticos

Os diagnósticos NÃO ficam na pasta do agente. Eles chegam de duas formas:

1. **Relatório do usuário** — O comercial cola ou envia o diagnóstico/relatório do prospect diretamente no chat (PDF, texto, briefing).

2. **Anotações do Luke** — O agente Luke (Gemini) envia anotações estruturadas com análise do prospect no chat. O Edwiges absorve e cruza com seu banco de dores.

O Edwiges sabe trabalhar com ambas as fontes, juntas ou separadas. Se nenhum material chegar, ele usa defaults por segmento.

---

## Passo a passo de instalação

1. Acesse o ToqanClaw e crie um novo agente
2. No campo **Name**, use: `edwiges` (ou `3s-ferramenta-comercial`)
3. No campo **Description**, cole:
   > Agente comercial da 3S Checkout / iFood Salão. Recebe relatórios do usuário e anotações do agente Luke (Gemini) para gerar propostas completas em HTML: diagnóstico de dores, seleção de módulos, cálculo de margem e apresentação profissional.
4. No editor de **System Prompt / Instructions**, cole o conteúdo do arquivo `PROMPT-3s-agente.md` (o texto entre as marcações ```)
5. No campo de **Skill/Script**, cole o conteúdo do `SKILL-3s-ferramenta-comercial.md`
6. Na seção **Files / Data**, suba os arquivos listados acima (sem a pasta diagnósticos)
7. Crie a pasta `data/3s-proposta/` vazia para as propostas geradas
8. Teste com os cenários abaixo

---

## Testes recomendados

| # | Cenário | Comando | O que valida |
|---|---------|---------|-------------|
| 1 | Só nome | "Proposta para Oakberry, 200 lojas açaí" | Usa defaults QSR, gera HTML completo |
| 2 | Com relatório | [cola texto de diagnóstico] + "gera proposta" | Absorve dores do relatório, personaliza textos |
| 3 | Com Luke | "O Luke mandou: Pizza Express, 45 lojas, table service, precisam de CRM" | Absorve anotações do Luke, mapeia dores |
| 4 | Relatório + Luke | [envia PDF] + "Luke anotou que precisam de delivery próprio" | Combina as duas fontes, adiciona 3S Eats |
| 5 | Isenções | "Proposta com isenção total de setup e instalação" | Marca ISENTO, recalcula margem |
| 6 | Margem apertada | "Simula 30 lojas, 36 meses, rebate 10%, isenta tudo" | Alerta margem negativa, sugere ajustes |
| 7 | Ajuste | "Adiciona CRM e tira o totem" | Ajusta módulos, recalcula, regenera |

---

## Como o fluxo funciona na prática

```
                    ┌──────────────────┐
                    │   Comercial      │
                    │  (usuário)       │
                    └────────┬─────────┘
                             │
              ┌──────────────┼──────────────┐
              ▼              ▼              ▼
     ┌────────────┐  ┌────────────┐  ┌────────────┐
     │ Relatório  │  │ Anotações  │  │ Só o nome  │
     │ diagnóst.  │  │ do Luke    │  │ da marca   │
     └─────┬──────┘  └─────┬──────┘  └─────┬──────┘
           │               │               │
           └───────────────┼───────────────┘
                           ▼
                  ┌─────────────────┐
                  │    EDWIGES      │
                  │  (este agente)  │
                  ├─────────────────┤
                  │ 1. Absorve      │
                  │ 2. Diagnostica  │
                  │ 3. Precifica    │
                  │ 4. Calcula marg.│
                  │ 5. Gera HTML    │
                  │ 6. Entrega      │
                  └────────┬────────┘
                           ▼
              ┌────────────────────────┐
              │  data/3s-proposta/     │
              │  [slug].html           │
              │  (ferramenta + apres.) │
              └────────────────────────┘
```

---

## Manutenção

| O que mudou | Arquivo para atualizar |
|-------------|----------------------|
| Preços de módulos | `precificação_3s.xlsx` |
| Premissas de margem | `simulador_3s.xlsx` + constantes no `SKILL-3s-ferramenta-comercial.md` |
| Novo módulo | `precificação_3s.xlsx` + `SKILL-3s-ferramenta-comercial.md` |
| Nova dor catalogada | `SKILL-3s-ferramenta-comercial.md` (seção BANCO DE DORES) |
| Visual da marca | `modelo_apresentação.pdf` + `3S_Ferramenta_Comercial.html` |
| Fluxo de proposta | `edwiges.txt` |
| Comportamento do agente | `PROMPT-3s-agente.md` (system prompt) |
