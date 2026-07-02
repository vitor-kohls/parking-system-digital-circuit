package require ::quartus::project

# 1. Captura o nome do projeto enviado pelo Makefile
if { [llength $argv] > 0 } {
    set project_name [lindex $argv 0]
} else {
    post_message -type error "ERRO: Nenhum nome de projeto foi passado pelo Makefile!"
    exit 1
}

post_message -type info "--- INICIANDO SCRIPT: Criando $project_name ---"

# 2. Fecha qualquer projeto aberto para evitar conflitos
if {[is_project_open]} {
    project_close
}

# 3. CRIA O PROJETO USANDO O NOME RECEBIDO
project_new $project_name -overwrite

# 4. Configurações (Utilizando a variável $project_name)
set_global_assignment -name FAMILY "MAX 10"
set_global_assignment -name DEVICE "10M50DAF484C7G"
set_global_assignment -name TOP_LEVEL_ENTITY $project_name
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

# IMPORTANTE: Verifique se o seu arquivo .v tem o mesmo nome do projeto
# Se você mudar o PROJECT_NAME para 'inversorNovo', o arquivo deve ser 'src/inversorNovo.v'
set_global_assignment -name VERILOG_FILE src/$project_name.v

# Pinagem: Retire o comentário do pino desejado. Note que os nomes dos terminais já foram padronizados
# ==============================================================================
# CONFIGURAÇÕES GERAIS DE I/O
# ==============================================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to *

# ==============================================================================
# CLOCK (50 MHz)
# ==============================================================================
# Clock Interno 1
# set_location_assignment PIN_P11 -to MAX10_CLK1_50

# ==============================================================================
# CHAVES (Switches - SW0 a SW9)
# ==============================================================================
# SW0
 set_location_assignment PIN_C10 -to sw[0]
# SW1
 set_location_assignment PIN_C11 -to sw[1]
# SW2
 set_location_assignment PIN_D12 -to sw[2]
# SW3
 set_location_assignment PIN_C12 -to sw[3]
# SW4
 set_location_assignment PIN_A12 -to sw[4]
# SW5
 set_location_assignment PIN_B12 -to sw[5]
# SW6
 set_location_assignment PIN_A13 -to sw[6]
# SW7
 set_location_assignment PIN_A14 -to sw[7]
# SW8
 set_location_assignment PIN_B14 -to sw[8]
# SW9
# set_location_assignment PIN_F15 -to sw[9]

# ==============================================================================
# LEDs (LEDR0 a LEDR9)
# ==============================================================================
# LEDR0
 set_location_assignment PIN_A8  -to led[0]
# LEDR1
 set_location_assignment PIN_A9  -to led[1]
# LEDR2
 set_location_assignment PIN_A10 -to led[2]
# LEDR3
 set_location_assignment PIN_B10 -to led[3]
# LEDR4
 set_location_assignment PIN_D13 -to led[4]
# LEDR5
 set_location_assignment PIN_C13 -to led[5]
# LEDR6
 set_location_assignment PIN_E14 -to led[6]
# LEDR7
 set_location_assignment PIN_D14 -to led[7]
# LEDR8
# set_location_assignment PIN_A11 -to led[8]
# LEDR9
# set_location_assignment PIN_B11 -to led[9]

# ==============================================================================
# BOTÕES (Pushbuttons - KEY0 e KEY1)
# ==============================================================================
# KEY0 - 3.3 V SCHMITT TRIGGER
# set_location_assignment PIN_B8  -to key[0]
# set_instance_assignment -name IO_STANDARD "3.3 V SCHMITT TRIGGER" -to key[0]

# KEY1 - 3.3 V SCHMITT TRIGGER
# set_location_assignment PIN_A7  -to key[1]
# set_instance_assignment -name IO_STANDARD "3.3 V SCHMITT TRIGGER" -to key[1]

# ==============================================================================
# DISPLAYS DE 7-SEGMENTOS (HEX0 a HEX5)
# Ordem dos segmentos: a=0, b=1, c=2, d=3, e=4, f=5, g=6, dp=7
# ==============================================================================

# HEX0[0] (a)
 set_location_assignment PIN_C14 -to hex0[0]
# HEX0[1] (b)
 set_location_assignment PIN_E15 -to hex0[1]
# HEX0[2] (c)
 set_location_assignment PIN_C15 -to hex0[2]
# HEX0[3] (d)
 set_location_assignment PIN_C16 -to hex0[3]
# HEX0[4] (e)
 set_location_assignment PIN_E16 -to hex0[4]
# HEX0[5] (f)
 set_location_assignment PIN_D17 -to hex0[5]
# HEX0[6] (g)
 set_location_assignment PIN_C17 -to hex0[6]
# HEX0[7] (dp)
# set_location_assignment PIN_D15 -to hex0[7]

# HEX1[0] (a)
 set_location_assignment PIN_C18 -to hex1[0]
# HEX1[1] (b)
 set_location_assignment PIN_D18 -to hex1[1]
# HEX1[2] (c)
 set_location_assignment PIN_E18 -to hex1[2]
# HEX1[3] (d)
 set_location_assignment PIN_B16 -to hex1[3]
# HEX1[4] (e)
 set_location_assignment PIN_A17 -to hex1[4]
# HEX1[5] (f)
 set_location_assignment PIN_A18 -to hex1[5]
# HEX1[6] (g)
 set_location_assignment PIN_B17 -to hex1[6]
# HEX1[7] (dp)
# set_location_assignment PIN_A16 -to hex1[7]

# HEX2[0] (a)
 set_location_assignment PIN_B20 -to hex2[0]
# HEX2[1] (b)
 set_location_assignment PIN_A20 -to hex2[1]
# HEX2[2] (c)
 set_location_assignment PIN_B19 -to hex2[2]
# HEX2[3] (d)
 set_location_assignment PIN_A21 -to hex2[3]
# HEX2[4] (e)
 set_location_assignment PIN_B21 -to hex2[4]
# HEX2[5] (f)
 set_location_assignment PIN_C22 -to hex2[5]
# HEX2[6] (g)
 set_location_assignment PIN_B22 -to hex2[6]
# HEX2[7] (dp)
# set_location_assignment PIN_A19 -to hex2[7]

# HEX3[0] (a)
# set_location_assignment PIN_F21 -to hex3[0]
# HEX3[1] (b)
# set_location_assignment PIN_E22 -to hex3[1]
# HEX3[2] (c)
# set_location_assignment PIN_E21 -to hex3[2]
# HEX3[3] (d)
# set_location_assignment PIN_C19 -to hex3[3]
# HEX3[4] (e)
# set_location_assignment PIN_C20 -to hex3[4]
# HEX3[5] (f)
# set_location_assignment PIN_D19 -to hex3[5]
# HEX3[6] (g)
# set_location_assignment PIN_E17 -to hex3[6]
# HEX3[7] (dp)
# set_location_assignment PIN_D22 -to hex3[7]

# HEX4[0] (a)
# set_location_assignment PIN_F18 -to hex4[0]
# HEX4[1] (b)
# set_location_assignment PIN_E20 -to hex4[1]
# HEX4[2] (c)
# set_location_assignment PIN_E19 -to hex4[2]
# HEX4[3] (d)
# set_location_assignment PIN_J18 -to hex4[3]
# HEX4[4] (e)
# set_location_assignment PIN_H19 -to hex4[4]
# HEX4[5] (f)
# set_location_assignment PIN_F19 -to hex4[5]
# HEX4[6] (g)
# set_location_assignment PIN_F20 -to hex4[6]
# HEX4[7] (dp)
# set_location_assignment PIN_F17 -to hex4[7]

# HEX5[0] (a)
# set_location_assignment PIN_J20 -to hex5[0]
# HEX5[1] (b)
# set_location_assignment PIN_K20 -to hex5[1]
# HEX5[2] (c)
# set_location_assignment PIN_L18 -to hex5[2]
# HEX5[3] (d)
# set_location_assignment PIN_N18 -to hex5[3]
# HEX5[4] (e)
# set_location_assignment PIN_M20 -to hex5[4]
# HEX5[5] (f)
# set_location_assignment PIN_N19 -to hex5[5]
# HEX5[6] (g)
# set_location_assignment PIN_N20 -to hex5[6]
# HEX5[7] (dp)
# set_location_assignment PIN_L19 -to hex5[7]

# 5. Salva e fecha
export_assignments
project_close

post_message -type info "--- SCRIPT FINALIZADO: $project_name criado com sucesso ---"
