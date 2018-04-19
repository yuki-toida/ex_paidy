# ExPaidy
simple HTTP client for [Paidy](https://paidy.com/).

## Installation
```elixir
def deps do
  [
    {:ex_paidy, "~> 0.1.0"}
  ]
end
```

## Configuration
```elixir
use Mix.Config

config :paidy,
  secret_key: "YOUR SECRET KEY",
  version: "YOUR API VERSION"
```

version: default value is "2016-07-01".  
secret_key: you can use environment variables.

```bash
export PAIDY_SECRET_KEY="YOUR SECRET KEY"
```

## License
MIT