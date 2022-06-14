FROM jupyter/minimal-notebook:lab-3.4.3

USER root

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    # Common useful utilities
    vim \
    nano

# Switch back to jovyan to avoid accidental container runs as root
USER ${NB_UID}

RUN git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

RUN echo $'if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then \n\
    GIT_PROMPT_ONLY_IN_REPO=1 \n\
    source $HOME/.bash-git-prompt/gitprompt.sh \n\
fi' >> .bashrc
