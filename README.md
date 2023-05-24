# BestCoffeeTruck

# Prerequisites
- Elixir 1.14.0
- postgres (PostgreSQL) 14.7

# Get Ready to Find Some Coffee
1. clone the repo
```
> git clone https://github.com/christie-ok/best-coffee-truck.git
```

2. move to the app folder
```
> cd best-coffee-truck
```

3. install and setup dependencies
```
> mix setup
```

4. start the server
```
> iex -S mix phx.server
```
then, in the shell:
```
iex(1)> Mix.Tasks.ImportTrucks.run([])
```

5. in the browser, navigate to [`localhost:4000/trucks`](http://localhost:4000/trucks)


Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more about Elixir and Phoenix

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
