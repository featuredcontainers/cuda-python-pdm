FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04
RUN apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y install software-properties-common wget curl python3-dev python3-pip python3-wheel python3-setuptools -y && \
  apt-get -y install python-is-python3 git git-lfs build-essential ffmpeg --no-install-recommends && \
  git lfs install && \
  python3 -m pip install --upgrade pip && \
  pip install pdm && \
  pdm config python.use_venv true && \
  apt-get -y install zlib1g g++ freeglut3-dev libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev libfreeimage-dev \
    zsh gdb openssh-client && \
  curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | grep -v 'env zsh' | bash && \
  sed -i 's/^ZSH_THEME=.*$/ZSH_THEME=ys/g' ~/.zshrc && \
  sed -i '/oh-my-zsh.sh/i DISABLE_AUTO_UPDATE=true' ~/.zshrc && \
  pip3 cache purge && \
  apt-get -y autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/*
