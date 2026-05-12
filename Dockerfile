FROM openroad/orfs:latest 

RUN apt update && apt install -y \
    git \
    python3 \
    build-essential \
    cmake \
    tcl \
    tk \
    nano \
    xdot \
    gcc \
    g++ 

WORKDIR /
