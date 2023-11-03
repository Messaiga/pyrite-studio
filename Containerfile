FROM ghcr.io/ublue-os/arch-distrobox AS pyrite

# COPY system_files /

# Install audio subsystems, update mirrors
RUN pacman -Syu \
        pipewire \
        pipewire-jack \
        pipewire-pulse \
        pipewire-alsa \
        wireplumber \
        --noconfirm

# Install Audio Packages from Arch Repos

RUN pacman -S \

# DAW
        ardour \
        audacity \
        bespokesynth \
        carla \
        stochas \

# ---------------------------- #

# Plugin Packs
        calf \
        distrho-ports \
        gxplugins.lv2 \
        infamousplugins \
        lsp-plugins \
        x42-plugins \
        zam-plugins \

# ---------------------------- #

# B Plugs
        bchoppr \
        bsequencer \
        bslizr \

# ---------------------------- #

# Instruments
        cardinal \
        helm-synth \
        odin2-synthesizer \
        surge-xt \
        zynaddsubfx \

# Sound Fonts
        sfizz \
        fluidsynth \
        gmsynth.lv2 \

# Specialized
        sorcer \

# Drums
        geonkick \
        avldrums.lv2 \

# ---------------------------- #
      
# Reverb
        dragonfly-reverb \
        zita-convolver \

# Filtering
        noise-repellent \
        
# Distortion
        wolf-shaper \

        --noconfirm && \

# Create Build User
    useradd -m --shell=/bin/bash build && usermod -L build && \
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install Audio Packages from AUR

USER build
WORKDIR /home/build
RUN paru -S \ 

# DAW
        aur/raysession \

#       aur/zrythm \            Build error, needs override params, fix later

# ---------------------------- #

# Plugin Packs
        aur/airwindows-lv2-git \
        aur/swh-lv2-git \
        aur/tap-plugins-lv2-git \

#B Plugs
        aur/bjumblr.lv2-git \
        aur/boops.lv2-git \
        aur/bschaffl.lv2-git \

# Instruments
        # vital-synth \        Building without for now, try later

# Drums
        aur/chowkick-bin \

# ---------------------------- #

# Reverb
        aur/aether.lv2 \

# Filtering
#        aur/diopser-vst3-git \           Failed Build
        aur/chowphaser-bin \

# Distortion
        aur/chowtapemodel-bin \
        aur/chowcentaur-bin \
        aur/fire-vst3-bin \

# ---------------------------- #

# Other
        aur/sonobus \

--noconfirm
USER root
WORKDIR /
        


# Cleanup
RUN sed -i 's@#en_US.UTF-8@en_US.UTF-8@g' /etc/locale.gen && \
    userdel -r build && \
    rm -drf /home/build && \
    sed -i '/build ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers && \
    sed -i '/root ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers && \
    rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*
