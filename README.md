# Sistema Digital de Gerenciamento de Vagas de Estacionamento

# Objetivo do Projeto

Este repositório tem como objetivo centralizar a implementação, simulação e validação dos módulos Verilog desenvolvidos para o projeto de um sistema digital de gerenciamento de vagas de estacionamento.

O sistema deve auxiliar motoristas a localizar vagas disponíveis em um estacionamento dividido em dois blocos independentes, denominados **VE (Vagas Esquerda)** e **VD (Vagas Direita)**, contendo quatro vagas cada. A partir das informações fornecidas pelos sensores de ocupação e da preferência de bloco informada pelo usuário, o circuito determina:

- A quantidade total de vagas disponíveis;
- O bloco mais adequado para estacionamento;
- A vaga livre de menor índice dentro do bloco selecionado.

## Arquitetura do Sistema

O projeto completo é composto por diversos módulos independentes que serão desenvolvidos e testados separadamente antes da integração final.

```text
Sensores VE ─┐
             ├─► Codificador de Quantidade ─┐
Sensores VD ─┘                              │
                                            ├─► Somador ─► Quantidade Total (Q)
                                            │
Sensores VE ─┐                              │
             ├─► Seletor de Vaga ───────────┤
Sensores VD ─┘                              │
                                            │
Sensores VE ─┐                              │
             ├─► Detector de Vaga Livre ────┤
Sensores VD ─┘                              │
                                            ▼
Preferência do Usuário (P) ─► Seletor de Bloco ─► MUX ─► Vaga Selecionada (V)
                                               │
                                               └──► Bloco Selecionado (B)
```

## Componentes

### Codificador de Quantidade

Recebe os sinais dos sensores de um bloco e calcula quantas vagas estão livres.

**Entradas**
- Sensores das vagas

**Saídas**
- Quantidade de vagas livres do bloco

---

### Somador

Recebe a quantidade de vagas livres de cada bloco e calcula o total disponível no estacionamento.

**Entradas**
- Quantidade de vagas livres do bloco esquerdo
- Quantidade de vagas livres do bloco direito

**Saídas**
- Quantidade total de vagas livres

---

### Seletor de Vaga

Analisa os sensores de um bloco e identifica a vaga livre de menor índice.

**Entradas**
- Sensores das vagas

**Saídas**
- Índice da vaga recomendada

---

### Detector de Vaga Livre

Verifica se existe pelo menos uma vaga disponível em cada bloco.

**Entradas**
- Sensores das vagas

**Saídas**
- Indicador de disponibilidade do bloco

---

### Seletor de Bloco

Decide em qual bloco o motorista deve estacionar considerando:

- A preferência informada pelo usuário;
- A disponibilidade de vagas em cada bloco.

**Entradas**
- Preferência do usuário
- Disponibilidade dos blocos

**Saídas**
- Bloco selecionado

---

### Multiplexador (MUX)

Seleciona qual saída do Seletor de Vaga será encaminhada para o display final, de acordo com o bloco escolhido.

**Entradas**
- Vaga recomendada do bloco esquerdo
- Vaga recomendada do bloco direito
- Bloco selecionado

**Saídas**
- Número da vaga recomendada

## Fluxo de Dados

1. Os sensores monitoram a ocupação das vagas dos blocos VE e VD.
2. O Codificador de Quantidade calcula o número de vagas livres em cada bloco.
3. O Somador calcula a quantidade total de vagas disponíveis.
4. O Seletor de Vaga identifica a vaga livre de menor índice em cada bloco.
5. O Detector de Vaga Livre informa se cada bloco possui vagas disponíveis.
6. O Seletor de Bloco decide qual bloco deve ser utilizado com base na preferência do motorista e na disponibilidade de vagas.
7. O MUX seleciona a vaga correspondente ao bloco escolhido.
8. Os displays apresentam:
   - Quantidade total de vagas livres (Q);
   - Bloco selecionado (B);
   - Vaga recomendada (V).
