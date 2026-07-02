SHELL := /bin/sh
# --- Variáveis de Projeto ---
PROJECT_NAME = mux22a #nome do módulo a ser executado
TCL_SCRIPT   = novo_setup_project.tcl
SRC_DIR      = src
SIM_DIR      = sim
OUTPUT_DIR   = .outputs

# Usar strip remove espaços acidentais no início ou fim
TOP_MODULE   = $(strip $(PROJECT_NAME))
TB_MODULE    = $(strip $(PROJECT_NAME))_tb

# Se o PROJECT_NAME vier de outro lugar, garanta que ele também esteja limpo
#PROJECT_NAME = inversor

# --- Binários ---
# O CURDIR captura o caminho absoluto da pasta atual
PWD          = $(CURDIR)
QUARTUS_SH   = quartus_sh
QUARTUS_MAP  = quartus_map
QUARTUS_FIT  = quartus_fit
QUARTUS_ASM  = quartus_asm
QUARTUS_STA  = quartus_sta
QUARTUS_PGM  = quartus_pgm

.DEFAULT_GOAL := help

# --- LÓGICA DE DESCOBERTA DE ARQUIVOS ---
# Extrai os nomes dos arquivos do sources.f (removendo espaços e comentários)
#SRC_FILES = $(shell grep -v '^//' $(SRC_DIR)/sources.f | sed 's/[[:space:]]//g' | tr '\n' ' ')
SRC_FILES = $(shell grep -v '^//' $(SRC_DIR)/sources.f | sed 's/[[:space:]]//g')

## help: Exibe esta mensagem de ajuda.
help:
	@echo "Comandos de Simulação: make compile | make simulate | make view"
	@echo "Comandos de Hardware:  make project | make synth    | make pgm"
	@echo "Limpeza:               make clean"

# --- FLUXO DE SIMULAÇÃO (Icarus Verilog) ---

compile:
	@mkdir -p $(OUTPUT_DIR) $(SIM_DIR)
	iverilog -o $(OUTPUT_DIR)/simulacao.vvp -f $(SRC_DIR)/sources.f $(SRC_DIR)/$(strip $(TB_MODULE)).v

simulate: compile
	vvp -n $(OUTPUT_DIR)/simulacao.vvp

view: simulate
	gtkwave $(SIM_DIR)/$(TB_MODULE).vcd &

# --- FLUXO DE HARDWARE (Quartus) ---

## project: Cria o projeto Quartus forçando o caminho absoluto do script.
project:
	@echo "==> Removendo arquivos de projeto antigos..."
	rm -f $(PROJECT_NAME).qpf $(PROJECT_NAME).qsf
	@echo "==> Criando projeto base via TCL..."
	$(QUARTUS_SH) -t "$(PWD)/$(TCL_SCRIPT)" $(PROJECT_NAME)
	@echo "==> Gerando script de inclusão de arquivos..."
	@echo "project_open $(PROJECT_NAME)" > add_files.tcl
	@# Removido o $(SRC_DIR)/ antes do $$file pois seu sources.f já tem o caminho
	@for file in $(SRC_FILES); do \
		echo "set_global_assignment -name VERILOG_FILE $$file" >> add_files.tcl; \
	done
	@echo "set_global_assignment -name TOP_LEVEL_ENTITY $(TOP_MODULE)" >> add_files.tcl
	@echo "project_close" >> add_files.tcl
	@echo "==> Executando inclusão no Quartus..."
	$(QUARTUS_SH) -t add_files.tcl
	@rm -f add_files.tcl
	@echo "==> Projeto $(PROJECT_NAME) configurado com sucesso!"

## synth: Executa o fluxo completo de compilação.
synth: project
	@echo "==> Iniciando Síntese e Implementação..."
	$(QUARTUS_MAP) $(PROJECT_NAME)
	$(QUARTUS_FIT) $(PROJECT_NAME)
	$(QUARTUS_ASM) $(PROJECT_NAME)
	$(QUARTUS_STA) $(PROJECT_NAME)
	@echo "==> Fluxo concluído! Arquivo .sof gerado em output_files/"

## pgm: Programa a placa via USB-Blaster.
pgm:
	$(QUARTUS_PGM) -m jtag -o "p;output_files/$(strip $(PROJECT_NAME)).sof"

## clean: Remove arquivos de simulação e lixo do Quartus.
clean:
	@echo "==> Limpando tudo..."
	rm -rf $(SIM_DIR) $(OUTPUT_DIR) db incremental_db output_files
	rm -f *.qpf *.qsf *.qws *.smsg *.summary *.done *.jdi *.pin *.sof

.PHONY: all compile simulate view clean help project synth pgm
