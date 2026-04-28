# Noite da Fogueira

**Noite da Fogueira** é um jogo de sobrevivência e coleta com visão Top-Down desenvolvido no motor Godot 4.2.

## Sobre o Jogo
O jogador assume o papel de Leo, um escoteiro que precisa manter sua fogueira acesa durante a noite em uma floresta misteriosa. Para sobreviver, ele deve coletar gravetos e troncos enquanto desvia de animais selvagens como guaxinins e ursos.

## Mecânicas Implementadas (30% do Projeto)
- **Sistema de Splash Screen:** Tela de carregamento inicial.
- **Menu Principal:** Com opções de iniciar jogo, sair e ajuste de volume global.
- **HUD Completa:** Barra de fogo (fome da fogueira), contador de vidas, score e relógio digital.
- **Movimentação do Jogador:** Sistema de caminhada e corrida (Stamina).
- **Sistema de Coleta:** Gravetos (+fogo), Troncos (++fogo) e Marshmallows (+vida).
- **Inimigos Básicos:** Guaxinins e Ursos com IA de perseguição simples.
- **Sistema de Pause:** Menu de pausa funcional durante a gameplay.
- **Tela de Game Over:** Exibição de pontuação final e opção de reiniciar.
- **Gerenciamento de Áudio:** Controle de volume integrado ao AudioServer do Godot.


## Controles
- **WASD / Setas:** Movimentação
- **Shift:** Correr (Consome Stamina)
- **E:** Interagir (Automático ao tocar em itens)
- **ESC:** Pausar o jogo

## Como Executar
1. Baixe e instale o [Godot Engine 4.2](https://godotengine.org/).
2. Importe o arquivo `project.godot` localizado na pasta raiz deste repositório.
3. Pressione F5 para rodar o projeto.

---
*Desenvolvido como parte do projeto acadêmico de Desenvolvimento de Jogos.*
