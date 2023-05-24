# BestCoffeeTruck
"The coldest winter I ever spent was a summer in San Francisco" is a quote attributed to Mark Twain. It's actually uncertain if he ever said that, but the sentiment remains - Bay Area natives know that May, June, and July tend to be gray, foggy, and chilly in San Francisco. 

So as summer approaches, this is a little app to help you keep warm until Bay Area summer actually starts (probably not until early September) by showing you what food trucks are serving up the best hot coffee and inviting you to give your input to help others find new great spots.

# Visit the deployed app
[`Best Coffee Truck`](https://best-coffee-truck.fly.dev/trucks)

# Run the app locally
## Prerequisites
- Elixir 1.14.0
- postgres (PostgreSQL) 14.7

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

4. start the server (during initial setup, please run the server with the shell open - in the future, you can run with just `mix phx.server`)
```
> iex -S mix phx.server
```
then, in the shell:
```
iex(1)> Mix.Tasks.ImportTrucks.run([])
```

5. in the browser, navigate to [`localhost:4000/trucks`](http://localhost:4000/trucks)

* please feel free to reach out to me to troubleshoot any local setup issues: christie.ok@gmail.com

# If only I had more time...
- My focus with this project was to create something useful, clear, and well tested within the timeframe. This project has a very light weight frontend and database structure. For a more detailed example of a full stack Elixir application I am developing, please take a look at my Babysitting Co-Op app (https://github.com/christie-ok/babysitting). It's still under contruction.
- If I had more time to work on this, I would love to put in a library like [`flop`](https://hexdocs.pm/flop_phoenix/readme.html) to allow sorting and filtering of the list of food trucks.
- I would also love to take the time to add more CRUD functionality. In this MPV, trucks cannot be created/updated/deleted. Same with ratings - users can only add ratings and view an average rating - I'd love to put in functionality to update/delete a rating you input, and see a list of past ratings given to a certain truck.
- Similarly, this app uses a static list of food trucks. It would be cool to build in a regular update feature that calls the city's foodtruck API reguarly to update the db.
- Funcationality could be added to the db by adding things like a `has_many` association from each truck to all their ratings.
- Right now, the list of food trucks is less than 500, so for this MVP I determined it was okay to insert each truck one at a time. However, if the list got longer or if the app expanded to more cities, it would probably we worth it to do an `insert_all`.
- Since there is only one API call right now and it is invoked by a developer, I did not get a chance to write tests on it. I would like to add tests if I had more time and certainly if there were any more API calls built in that were not actively managed. I traded that time for adding tests around the business logic and UI interactions since I think the one GET request is fairly reliable.
- Finally, there's a bit of cleanup that would be nice to do such as removing unused dependancies like Floki. 

## Learn more about Elixir and Phoenix

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
