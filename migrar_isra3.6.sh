#!/bin/bash
# Script: migrar_isra3.6.sh
# Descripción: Copia el cubo IR3.6 al repo, configura Git y prepara ejecución en Termux

CUBO_SRC=~/IR3.6-cubo
REPO_DIR=~/Israel-3.6

mkdir -p $CUBO_SRC

# Genera arc#!/bin/bash
# Script: migrar_isra3.6.sh
# Descripción: Copia el cubo IR3.6 al repo, configura Git y prepara ejecución en Termux

CUBO_SRC=~/IR3.6-cubo
REPO_DIR=~/Israel-3.6

# 1️⃣ Crear carpeta del cubo si no existe
mkdir -p $CUBO_SRC

# 2️⃣ Crear archivos placeholder (reemplaza con tu cubo real después)
echo "# README de IR3.6" > $CUBO_SRC/README.md
echo "# Script principal" > $CUBO_SRC/main.py
echo "#!/bin/bash" > $CUBO_SRC/run.sh
mkdir -p $CUBO_SRC/data $CUBO_SRC/modules $CUBO_SRC/config $CUBO_SRC/logs
echo "numpy\npandas" > $CUBO_SRC/requirements.txt

# 3️⃣ Copiar cubo al repo
cp -r $CUBO_SRC/* $REPO_DIR/

# 4️⃣ Crear/actualizar .gitignore
cat > $REPO_DIR/.gitignore <<EOL
# Archivos sensibles
.ssh/
.gitconfig
.lesshst
.wget-hsts

# Configs locales
.config/termux/

# Sistema
.DS_Store
EOL

# 5️⃣ Commit y push
cd $REPO_DIR
git add .
git commit -m "Migrated full IR3.6 cube from ChatGPT environment to Termux"
git branch -M main
git push -u origin main

# 6️⃣ Instalar dependencias
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

# 7️⃣ Dar permisos a scripts
chmod +x *.sh

# 8️⃣ Ejecutar cubo
if [ -f run.sh ]; then
    ./run.sh
elif [ -f main.py ]; then
    python main.py
fi

# 9️⃣ Mostrar logs si existen
if [ -d logs ]; then
    tail -f logs/isra3.6.log
fi
echo "# README de IR3.6" > $CUBO_SRC/README.md
echo "# Script principal" > $CUBO_SRC/main.py
echo "#!/bin/bash" > $CUBO_SRC/run.sh
mkdir -p $CUBO_SRC/data
mkdir -p $CUBO_SRC/modules
mkdir -p $CUBO_SRC/config
mkdir -p $CUBO_SRC/logs
echo "numpy\npandas" > $CUBO_SRC/requirements.txt

# Copia cubo al repo
cp -r $CUBO_SRC/* $REPO_DIR/

# .gitignore
cat > $REPO_DIR/.gitignore <<EOL
# Archivos sensibles
.ssh/
.gitconfig
.lesshst
.wget-hsts

# Configs locales
.config/termux/

# Sistema
.DS_Store
EOL

# Commit y push
cd $REPO_DIR
git add .
git commit -m "Migrated full IR3.6 cube from ChatGPT environment to Termux"
git branch -M main
git push -u origin main

# Dependencias
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

# Permisos
chmod +x *.sh

# Ejecutar
if [ -f run.sh ]; then
    ./run.sh
elif [ -f main.py ]; then
    python main.py
fi

# Logs
if [ -d logs ]; then
    tail -f logs/isra3.6.log
fi
