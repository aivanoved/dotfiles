if [ ! command -v pixi &> /dev/null ]; then
    return
fi

if [ -d "$HOME/.pixi" ]; then
  export PIXI_HOME="$HOME/.pixi"
  export PATH="$PIXI_HOME/bin:$PATH"
fi
