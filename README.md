Wish You Were Tree
==================

My very own puppet tree, used for desktop/laptop.

## Usage

* Copy `scripts/config.rb.dist` to `scripts/config.rb` and fill in configuration
  such as `root_password_hash`, etc..
* Run `./scripts/build_hiera.sh`
* Run `./scripts/setup_puppet`
* Run `./scripts/run_puppet`
