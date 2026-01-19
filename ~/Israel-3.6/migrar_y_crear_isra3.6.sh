#!/bin/bash
# Script maestro: crea y migra el cubo Isra3.6 en Termux, instala dependencias y prepara logs

# 1️⃣ Directorio del cubo (físico)
CUBO_SRC=~/Isra3.6

echo "🔹 Creando cubo físico..."
mkdir -p $CUBO_SRC/{data,modules,config,logs}

# 2️⃣ Archivos principales
echo "# README de IR3.6" > $CUBO_SRC/README.md
echo "# Script principal" > $CUBO_SRC/main.py
echo "#!/bin/bash" > $CUBO_SRC/run.sh
echo -e "numpy\npandas" > $CUBO_SRC/requirements.txt

# 3️⃣ Directorio del repo
REPO_DIR=~/Israel-3.6
mkdir -p $REPO_DIR

# 4️⃣ Copiar cubo al repo
cp -r $CUBO_SRC/* $REPO_DIR/

# 5️⃣ Crear/actualizar .gitignore
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

# 6️⃣ Commit y push
cd $REPO_DIR
git add .
git commit -m "Created and migrated full Isra3.6 cube from ChatGPT environment"
git branch -M main
git push -u origin main

# 7️⃣ Instalar dependencias
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi

# 8️⃣ Dar permisos de ejecución a scripts
chmod +x *.sh

# 9️⃣ Ejecutar cubo
if [ -f run.sh ]; then
    ./run.sh
elif [ -f main.py ]; then
    python main.py
fi

# 🔟 Crear log si no existe y mostrarlo
LOG_FILE=$REPO_DIR/logs/isra3.6.log
mkdir -p $(dirname "$LOG_FILE")
touch $LOG_FILE
echo "Cubo Isra3.6 ejecutado (placeholder)" >> $LOG_FILE
tail -f $LOG_FILE