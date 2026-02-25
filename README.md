# ⭐ Visão Geral do Projeto

### Este projeto é um downloader de músicas desenvolvido para funcionar com urls de músicas do youtube. O sistema apresenta uma interface simples e intuitiva

<div style="text-align: center;">
<img alt="tela" src="ui/images/example_readme.png"/>
</div>

# 🎯 Objetivo
### O objetivo principal deste projeto é aprendizado, principalmente com a construção de GUIs utilizando a linguagem python


# 🛠️ Tecnologias Utilizadas
![Python](https://img.shields.io/badge/Python-3.13-green?logo=Python&logoColor=green)
![Git](https://img.shields.io/badge/Git-2.47.1-orange?logo=Git&logoColor=orange)


# 💼 Dependências e explicações do uso
1. ### pyside6: Criação da interface
2. ### pytubefix: Utilizado para acessar e baixar os audios dos videos inseridos via url do youtube

# 📝 Versões das dependências
![pyside6](https://img.shields.io/badge/pyside6-6.10.2-green?logo=qt&logoColor=orange)
![pytubefix](https://img.shields.io/badge/pytubefix-10.3.8-red?logo=youtube&logoColor=red)


# 🚀 Execução do projeto
```bash
git clone https://github.com/GustavoProcopio27/Music_Downloader.git
cd music_downloader

# Utilizando pip e python
pip install -r requirements.txt
python main.py

# Utilizando uv
uv run main.py

```

# 🌳 Árvore do projeto 

```
music_downloader
├─ ui
│  ├─ images/ 
│  ├─ main.qml
│  ├─ MusicPage.qml
│  ├─ PlaylistPage.qml
│  └─ Toast.qml
│
├─ downloader
│  └─ core.py
│
├─ interface
│  └─ communication.py
│
├─ schemas
│  ├─ video_data.py
│  └─ video_model.py
│
├─ main.py
├─ README.md
├─ pyproject.toml
├─ ruff.toml
├─ .python-version
├─ requirements.txt
└─ uv.lock

```