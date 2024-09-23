# COLORS
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'

# VERSIONS
JAVA_VERSION=11
CLOJURE_VERSION=latest
NODE_VERSION=20
NVM_VERSION=v0.39.7

# PREPARE
apt-get update

# INSTALL JAVA
echo -e "${ORANGE}---------- install java${NC}"
sudo apt-get install "openjdk-$JAVA_VERSION-jdk"
echo -e "${GREEN}---------- java version $(java --version) installed${NC}"

# INSTALL CLOJURE
echo -e "${ORANGE}---------- install clojure${NC}"
curl -L -O "https://github.com/clojure/brew-install/releases/$CLOJURE_VERSION/download/linux-install.sh"
chmod +x linux-install.sh
sudo ./linux-install.sh
echo -e "${GREEN}---------- clojure vesion $(clojure --version) installed${NC}"

# INSTALL NVM
echo -e "${ORANGE}---------- install nvm${NC}"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash
source ~/.nvm/nvm.sh
echo -e "${GREEN}---------- nvm version $(nvm -v) installed${NC}"

# INSTALL NODE
echo -e "${ORANGE}---------- install node${NC}"
nvm install "$NODE_VERSION"
echo -e "${GREEN}---------- node version $(node -v) installed${NC}"

# INSTALL YARN
echo -e "${ORANGE}---------- install yarn${NC}"
npm install -g yarn
echo -e "${GREEN}---------- yarn version $(yarn -v) installed${NC}"

# RELOAD SHELL
exec "$SHELL"