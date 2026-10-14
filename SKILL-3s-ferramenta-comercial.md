---
name: 3s-ferramenta-comercial
description: >-
  Agente comercial da 3S Checkout / iFood Salão para criação de propostas e apresentações para prospects.
  Ative quando o usuário:
  "preciso de uma proposta para [marca]", "gera a apresentação do [prospect]",
  "monta a calculadora para [cliente]", "faz a proposta comercial de [rede]",
  "quero apresentar a 3S para [empresa]", "prepara o material de venda para [parceiro]".
  Também ative quando mencionarem: prospect, proposta comercial, apresentação 3S,
  calculadora de margem, simulador comercial, precificação, dores do parceiro.
---

# 3S Checkout — Ferramenta Comercial

Agente que gera propostas comerciais completas para prospects da 3S Checkout (iFood Salão), incluindo diagnóstico de dores, seleção de módulos, cálculo de margem e apresentação HTML profissional pronta para o cliente.

---

## Quando usar

Use esta skill quando o usuário:
- Pedir para criar uma proposta ou apresentação para um prospect/parceiro
- Mencionar diagnóstico de dores de um restaurante, rede ou franquia
- Quiser simular margem, precificação ou cenários de negociação
- Precisar de uma apresentação HTML no padrão visual da 3S Checkout
- Mencionar "edwiges", "ferramenta comercial" ou "calculadora 3S"

Não use esta skill quando:
- O usuário quiser apenas informações genéricas sobre foodtech
- O pedido for sobre produto/features sem contexto de venda
- For uma tarefa de suporte técnico ao cliente já ativo

---

## O que você vai produzir

O entregável final é um arquivo HTML interativo salvo em `data/3s-proposta/[slug-do-cliente].html` contendo:
1. Uma ferramenta interna de 3 etapas (wizard) para o time comercial
2. Uma apresentação full-page scroll-snap para envio ao cliente

O arquivo funciona 100% offline, sem dependências externas além da fonte Inter (Google Fonts).

---

## Como fazer

O processo segue o fluxo "Edwiges" — o framework interno da 3S para criação de propostas.
Cada passo tem uma razão estratégica: o agente performa melhor quando entende o porquê.

### Passo 1 — Absorver inputs do usuário e do Luke

O contexto do prospect chega de duas fontes (juntas ou separadas):

**Relatório / Diagnóstico do usuário:** O comercial envia no chat um relatório,
diagnóstico em PDF, texto colado ou briefing simples. Extraia: nome da marca,
segmento, nº de lojas, dores mencionadas, sistemas atuais, contexto operacional.

**Anotações do Luke (agente Gemini):** O agente Luke envia anotações estruturadas
com análise prévia do prospect — dores identificadas, observações e recomendações.
Trate como insumo qualificado: cruze com seu banco de dores D1-D8.

Se o usuário enviar APENAS um nome sem material, use defaults por segmento.
Hierarquia de confiança: Relatório do usuário > Anotações do Luke > Defaults.

**Por quê:** Quanto mais contexto real, mais precisa a proposta.
O relatório traz a voz do comercial; o Luke traz análise complementar.

### Passo 2 — Diagnosticar dores

Cruze as dores encontradas no material de entrada (relatório + Luke) com o BANCO DE DORES abaixo.
Use o mapeamento por segmento como base, mas PRIORIZE dores mencionadas no material — são mais
precisas que o default genérico. Se o material mencionar uma dor fora do banco, adapte-a
(crie texto customizado + mapeie para a solução 3S mais próxima).

**Por quê:** Dores reais extraídas do diagnóstico geram apresentações muito mais persuasivas.
O cliente vê que entendemos o negócio dele — não é um template genérico.

### Passo 3 — Selecionar módulos e precificar

Com base nas dores selecionadas, recomende os módulos que resolvem cada uma.
Monte a proposta com os preços da TABELA DE PRECIFICAÇÃO abaixo.
Apresente ao usuário para ajustes (pode querer adicionar/remover módulos ou alterar valores).

**Por quê:** Cada dor deve ter pelo menos um módulo endereçando-a.
Isso cria a narrativa "dor → solução → benefício" que a apresentação usa.

### Passo 4 — Calcular margem (interno)

Use a ENGINE DE MARGEM abaixo para simular o cenário.
Informe ao comercial: mensalidade/loja, total mensal da rede, saving de isenções e margem bruta do contrato.
Se a margem for negativa, alerte o comercial e sugira ajustes.

**Por quê:** O comercial precisa saber antes de apresentar se a proposta é viável financeiramente.
ATENÇÃO: dados de margem são INTERNOS e NUNCA vão para a apresentação do cliente.

### Passo 5 — Gerar a ferramenta HTML

Gere o arquivo HTML completo seguindo a ESTRUTURA DO HTML abaixo.
A ferramenta tem 3 steps:
1. Configuração do prospect (dados + dores pré-selecionadas)
2. Calculadora interna (módulos editáveis + margem)
3. Apresentação para o cliente (HTML full-page com scroll-snap)

Salve em `data/3s-proposta/[slug].html` e informe o caminho ao usuário.

### Passo 6 — Validar e registrar

Confirme com o usuário que o entregável está correto.
Registre em `memory/YYYY-MM-DD.md` o prospect, módulos selecionados e margem obtida.

---

## Base de conhecimento

### BANCO DE DORES

Cada dor tem: descrição, solução 3S e benefício. Use as que se aplicam ao segmento do prospect.

| ID | Dor | Solução 3S | Benefício |
|----|-----|-----------|-----------|
| D1 | Gestão de múltiplas lojas e cardápios com preços diferentes por canal | Cadastro centralizado com edição massiva e push em nuvem para todas as lojas | Agilidade na rede |
| D2 | Pedidos descentralizados entre balcão, totem e delivery | PDV integrado + Hub Delivery + Totem em plataforma única | Operação unificada |
| D3 | KDS sem indicadores de tempo ou balanceamento por praça | KDS por estação com tempo de produção, balanceamento e fallback automático | Produção otimizada |
| D4 | Ruptura de estoque com insumos perecíveis e sem baixa automática | Inventário com baixa automática, alertas parametrizáveis e fichas técnicas | Menos perdas |
| D5 | Falta de visibilidade operacional em tempo real na rede | 3SGo (app gestão) + Dashboards + Relatórios atualizados a cada 15 min | Decisões rápidas |
| D6 | Relatórios engessados e sem granularidade por loja e canal | Relatórios gerenciais por loja, canal, operador e período + BI | Controle total |
| D7 | Complexidade e lentidão nos pagamentos | SmartPOS com pagamentos flexíveis por pessoa, item ou mesa | Experiência fluida |
| D8 | Baixa retenção de clientes e promoções sem recorrência | CRM com fidelidade, promoções personalizadas e acompanhamento de base | Clientes recorrentes |

**Dores por segmento (recomendação padrão):**
- **QSR / Fast-food / Açaí:** D1, D2, D3, D4, D5, D6, D7
- **Table Service:** D2, D3, D5, D6, D7, D8
- **Delivery First:** D1, D2, D4, D5, D6
- **Cafeteria / Doceria:** D2, D3, D5, D6, D7, D8

### TABELA DE PRECIFICAÇÃO

#### Módulos Essenciais (ativados por padrão)
| Módulo | Descrição | Valor mensal/loja (R$) |
|--------|-----------|----------------------|
| PDV — Até 3 | Frente de caixa, até 3 terminais por loja | 350,00 |
| KDS — Até 3 | Kitchen Display System, até 3 telas | 160,00 |
| Totem — Até 3 | Totem de autoatendimento, até 3 unidades | 180,00 |
| Marketplace (iFood/Rappi/OD) | Hub de delivery integrado | 110,00 |
| TEF — 1a integração | Transferência eletrônica de fundos | 104,20 |

#### Módulos Adicionais (desativados por padrão)
| Módulo | Descrição | Valor mensal/loja (R$) |
|--------|-----------|----------------------|
| 3SGo — App gestão | App mobile para gestão do restaurante | 60,00 |
| 3S BI — Simples | Business Intelligence básico | 120,00 |
| 3S Connection — Kinesis | Integração de dados em tempo real | 300,00 |
| CRM — Fidelidade | Programa de fidelidade e CRM | 199,90 |
| 3S Eats — Delivery | Plataforma própria de delivery | 180,00 |
| 3S Eats — Pedido na mesa | QR Code para pedido na mesa | 180,00 |
| POS Mobile — Até 3 | POS portátil, até 3 dispositivos | 100,00 |
| Produção Impressoras — Até 3 | Impressoras de produção | 60,00 |
| Marca Adicional | Custo por marca adicional na rede | 100,00 |

#### Taxas únicas
| Item | Valor (R$) |
|------|-----------|
| Setup da marca | 3.000,00 |
| Instalação — loja remota/pequena | 1.622,00 |
| Instalação — loja grande | 2.500,00 |

#### Faixas de PDV (referência para grandes redes)
| Faixa | Até 3 | 4-6 | 7+ |
|-------|-------|-----|-----|
| PDV | 350 | 450 | 650 |
| KDS | 80 | 160 | 280 |
| Totem | 100 | 180 | 360 |

### ENGINE DE MARGEM

A margem é calculada simulando mês a mês ao longo do contrato.
Aqui está a lógica completa — implemente-a em JavaScript dentro do HTML gerado.

**Parâmetros de entrada:**
- `lj` = quantidade de restaurantes
- `ct` = meses de contrato (padrão: 60)
- `ro` = meses de rollout (padrão: 12)
- `ms` = mensalidade por loja (soma dos módulos ativos)
- `su` = valor do setup (padrão: 3000)
- `ins` = valor da instalação por loja (padrão: 1622)
- `ixS` = isentar setup (boolean)
- `ixI` = isentar instalação (boolean)
- `rb` = rebate em % (padrão: 0)
- `ic` = incentivo mensal em R$ (padrão: 0)

**Premissas fixas (constantes operacionais):**
```
srvT  = -60      // Custo servidor+tech por restaurante/mês
sup   = -72      // Custo suporte por restaurante/mês
cImpl = -2265    // Custo de implantação por novo restaurante
tPDV  = 0.0565   // Imposto sobre receita de PDV (5,65%)
tOut  = 0.1125   // Imposto sobre outras receitas (11,25%)
stf   = ((1/47) * -143000) * 2  // CAC: custo staff comercial (apenas mês 1)
```

**Algoritmo (pseudocódigo):**
```
totalReceita = 0
totalOperacional = 0
restaurantesAnterior = 0

PARA cada mês m DE 1 ATÉ ct:
    // Rollout linear: restaurantes ativos crescem gradualmente
    SE m <= ro:
        restaurantesAtivos = MIN(CEIL(lj / ro * m), lj)
    SENÃO:
        restaurantesAtivos = lj

    novosRestaurantes = MAX(restaurantesAtivos - restaurantesAnterior, 0)
    restaurantesAnterior = restaurantesAtivos

    // RECEITAS do mês
    receitaPDV    = restaurantesAtivos * ms
    receitaImpl   = novosRestaurantes * (ixI ? 0 : ins)
    receitaSetup  = (m == 1 E NÃO ixS) ? su : 0
    receitaTotal  = receitaPDV + receitaImpl + receitaSetup

    // DEDUÇÕES
    rebateMes     = restaurantesAtivos > 0 ? -(rb/100) * (receitaPDV + receitaSetup) : 0
    impostos      = -(receitaPDV * tPDV) - ((receitaImpl + receitaSetup) * tOut)
    receitaLiquida = receitaTotal + rebateMes + impostos

    // CUSTOS OPERACIONAIS
    custoOp = restaurantesAtivos * srvT
            + restaurantesAtivos * sup
            + novosRestaurantes * cImpl
            + rebateMes

    // CAC (apenas mês 1)
    custoAquisicao = (m == 1 ? stf : 0) + (ic > 0 ? -ic : 0)

    totalReceita      += receitaLiquida
    totalOperacional  += receitaLiquida + custoOp + custoAquisicao

MARGEM = totalReceita > 0 ? totalOperacional / totalReceita : 0
```

**Interpretação:**
- Margem >= 0: saudável (exibir em verde)
- Margem < 0: alerta, negociação pode ser inviável (exibir em vermelho)

### DADOS DA 3S CHECKOUT (para apresentação)

Use esses dados na página "Quem somos":
- +300 cidades atendidas
- 130+ marcas ativas
- +2.400 lojas ativas
- R$ 16 BI faturamento/ano processado
- 4 de cada 10 top fast-food usam 3S
- 150% crescimento entre 2022-2025

### IDENTIDADE VISUAL

Paleta de cores obrigatória:
```
--purple:     #5B2D8E   (primária)
--violet:     #7B3FA0   (secundária)
--magenta:    #A855F7   (acento/destaque)
--acai:       #3D1A5C   (textos escuros)
--dark:       #1F1035   (fundo escuro/capa)
--white:      #FFFFFF
--off-white:  #F8F5FC   (fundo cards claros)
--light-purp: #EDE5F7   (backgrounds suaves)
--gray:       #6B7280   (texto secundário)
--dark-gray:  #374151   (texto principal)
--green:      #10B981   (positivo/benefício)
--red:        #EF4444   (negativo/dor)
```

Fonte: **Inter** (Google Fonts), pesos 400/600/700/800/900.

Estilo geral:
- Border-radius: 12-14px para cards
- Box-shadow: `0 2px 10px rgba(91,45,142,.05)` para elevação sutil
- Gradient nos CTAs e barras de total: `linear-gradient(135deg, #3D1A5C, #5B2D8E)`
- Esferas decorativas translúcidas nos fundos escuros

---

## Estrutura do HTML gerado

O HTML gerado é uma **ferramenta de 3 steps** (wizard):

### Step 1 — Configuração do Prospect
- Campos: nome da marca, segmento, estado, qtd restaurantes, meses contrato, meses rollout
- Grid de dores com checkboxes (pré-selecionadas conforme segmento)
- Botão "Próximo: Calculadora"

### Step 2 — Calculadora Interna (tudo em 1 página)
Dividido em 2 colunas:
- **Esquerda:** Parâmetros do contrato (restaurantes, contrato, rollout, setup, instalação, toggles de isenção, rebate, incentivo)
- **Direita:** Módulos com checkbox on/off e campo de valor editável, total da mensalidade

Abaixo, barra de margem com 4 indicadores:
- Mensalidade/loja
- Total mensal rede
- Saving isenções
- Margem bruta do contrato (verde se >= 0, vermelho se < 0)

**IMPORTANTE:** Dados de margem são INTERNOS. Nunca aparecem na apresentação do cliente.

### Step 3 — Apresentação gerada
Renderizada num iframe com botão "Abrir em nova aba (para PDF)".
A apresentação é um HTML completo e independente com `scroll-snap-type: y mandatory`.

#### Páginas da apresentação (scroll-snap):
1. **Capa** — Fundo escuro (#1F1035), título "A solução completa para sua operação!", nome do cliente em destaque magenta, esferas decorativas translúcidas
2. **Quem somos** — Grid 3 colunas com os 6 stats da 3S em cards
3. **Operação do parceiro** — Título personalizado, 4 cards descrevendo o perfil operacional
4. **Dores identificadas** — Fundo escuro, lista com ícone ✕ vermelho para cada dor selecionada
5. **Soluções** — Tabela com 3 colunas (Dor / Como ajudamos / Benefício), cabeçalho roxo
6. **Proposta** — Fundo #F8F5FC, layout em 2 seções:
   - Linha superior: card "Dados do contrato" + card "Investimento inicial" (setup e implantação, com ISENTO riscado quando houver isenção)
   - Linha inferior: lista compacta de serviços mensais (3fr) + coluna com bloco gradiente do total da mensalidade + card de condições/highlights (2fr)
7. **Encerramento** — Fundo escuro, "Vamos juntos!", grid 4 colunas com resumo (lojas, mensalidade, meses, rebate)

#### Navegação da apresentação:
- Bolhas fixas à direita (`position:fixed`) com IntersectionObserver para highlight da página atual
- Print CSS removendo scroll-snap e adicionando `page-break-after`

---

## Formato de saída

Ao terminar, apresente ao usuário:

```
PROPOSTA GERADA — [NOME DO CLIENTE]
=====================================
Segmento:           [segmento]
Restaurantes:       [N] lojas
Contrato:           [N] meses
Rollout:            [N] meses

MÓDULOS ATIVOS:
  - [nome do módulo]     R$ [valor]
  - ...
  Total mensalidade/loja: R$ [total]

INVESTIMENTO INICIAL:
  Setup:            R$ [valor] [ou ISENTO]
  Instalação/loja:  R$ [valor] [ou ISENTO]

MARGEM (interno):   [X]% [saudável / atenção]

Arquivo salvo em: data/3s-proposta/[slug].html
```

---

## Exemplos

**Exemplo 1 — Relatório do usuário:**
  Entrada: Usuário envia PDF de diagnóstico do Oakberry com menções a problemas
           de estoque, multicanalidade e falta de KDS funcional. 200 lojas.
  Ação:
    1. Absorve relatório → QSR/açaí, 200 lojas, dores D2, D3, D4 (do relatório)
    2. Complementa com defaults QSR: D1, D5, D6, D7
    3. Módulos essenciais ativos = R$ 904,20/loja
    4. Margem calculada, HTML gerado com textos personalizados do relatório
  Saída: data/3s-proposta/oakberry.html

**Exemplo 2 — Anotações do Luke:**
  Entrada: "O Luke mandou as anotações da reunião com o Pizza Express"
           Luke diz: "45 lojas table service, principal dor é CRM e relatórios, querem 36 meses"
  Ação:
    1. Absorve anotações do Luke → Table Service, 45 lojas, 36 meses
    2. Dores do Luke: D6 + D8. Complementa com defaults TS: D2, D3, D5, D7
    3. Essenciais + CRM + BI (por D6 e D8)
    4. Margem calculada com 36 meses
  Saída: data/3s-proposta/pizza-express.html

**Exemplo 3 — Relatório + Luke combinados:**
  Entrada: Usuário envia diagnóstico + "o Luke anotou que precisam de delivery próprio"
  Ação:
    1. Absorve relatório (fonte primária) + complementa com Luke (3S Eats Delivery)
    2. Adiciona módulo 3S Eats conforme Luke
    3. Margem e HTML gerados
  Saída: data/3s-proposta/[slug].html

**Exemplo 4 — Só nome, sem material:**
  Entrada: "Proposta para Burger King, 300 lojas"
  Ação:
    1. Sem relatório nem Luke → defaults QSR
    2. Gere direto com essenciais, 60 meses, 12 rollout
  Saída: data/3s-proposta/burger-king.html

**Exemplo 5 — Simulação isolada:**
  Entrada: "Simula margem para 80 lojas, 36 meses, com rebate de 5% e isenção total"
  Ação:
    1. Usa módulos essenciais padrão
    2. ixSetup = true, ixInst = true, rebate = 5%
    3. Calcula margem e informa se é viável
    4. Se solicitado, gera HTML completo
  Saída: Resposta com margem + oferta de gerar HTML

---

## Regras importantes

- **Margem é SEMPRE informação interna.** Nunca inclua dados de margem, custos operacionais ou premissas financeiras na apresentação do cliente. Só o comercial vê isso.

- **Hierarquia de fontes.** Relatório do usuário > Anotações do Luke > Defaults por segmento. Em caso de conflito, a fonte mais próxima do comercial prevalece.

- **Personalize com o material recebido.** Se o relatório/Luke trouxerem dados específicos (tipo de culinária, canais, volume de pedidos, dores particulares), use nos textos da apresentação. A proposta deve parecer feita sob medida.

- **Mantenha a identidade visual.** Use APENAS as cores da paleta definida. Fonte Inter. Border-radius 12-14px. Não improvise com outras paletas.

- **Preços são editáveis.** O comercial pode alterar qualquer valor de módulo no Step 2. Os preços da tabela são defaults, não valores fixos. Gere o HTML com campos editáveis.

- **Scroll-snap obrigatório.** A apresentação do Step 3 DEVE usar `scroll-snap-type: y mandatory` para que cada scroll mude de página. Isso é parte da identidade da ferramenta.

- **Salve todos os arquivos em `data/3s-proposta/`** (não na raiz).

- **Documente em `memory/YYYY-MM-DD.md`** o prospect e resultado da margem antes de finalizar.

- Se uma API retornar 403 ou 407, informe o usuário que precisa configurar a integração em: More > Connections > Stored Credentials.

---

## Critérios de conclusão (como saber que terminou)

A skill está completa quando:
[ ] O contexto do prospect foi absorvido (relatório do usuário e/ou anotações do Luke e/ou dados diretos)
[ ] As dores foram mapeadas para o banco D1-D8 (+ customizadas se necessário)
[ ] Os módulos foram definidos com preços confirmados no precificação_3s.xlsx
[ ] A margem foi calculada e informada ao comercial (INTERNO)
[ ] O arquivo HTML existe em data/3s-proposta/[slug].html
[ ] O HTML contém os 3 steps funcionando (config, calculadora, apresentação)
[ ] A apresentação tem as 7 páginas com scroll-snap e textos personalizados
[ ] O usuário foi informado do caminho do arquivo
[ ] O resultado foi documentado em memory/
