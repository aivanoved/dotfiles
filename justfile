set shell := ["zsh", "-uc"]

set allow-duplicate-recipes
set dotenv-load
set positional-arguments

default:
  just --list
