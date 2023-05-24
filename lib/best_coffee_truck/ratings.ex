defmodule BestCoffeeTruck.Ratings do
  @moduledoc """
  The Ratings context.
  """

  import Ecto.Query, warn: false
  alias BestCoffeeTruck.Repo

  alias BestCoffeeTruck.Ratings.Rating

  @doc """
  Returns the list of ratings.

  ## Examples

      iex> list_ratings()
      [%Rating{}, ...]

  """
  def list_ratings do
    Repo.all(Rating)
  end

  @doc """
  Creates a rating.

  ## Examples

      iex> create_rating(%{field: value})
      {:ok, %Rating{}}

      iex> create_rating(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rating changes.

  ## Examples

      iex> change_rating(rating)
      %Ecto.Changeset{data: %Rating{}}

  """
  def change_rating(%Rating{} = rating, attrs \\ %{}) do
    Rating.changeset(rating, attrs)
  end

  @doc """
  Returns an map of the truck_id to the average rating and count of ratings.

  ## Examples

      iex> average_rating_by_truck_id()
      %{
        1 => %{average_rating: 3.5, ratings_count: 10},
        2 =>%{average_rating: 4.0, ratings_count: 40},...
      }

  """

  def average_rating_by_truck_id do
    query =
      from r in Rating,
        group_by: [r.truck_id],
        select:
          {r.truck_id, %{ratings_count: count(r.rating), average_rating: avg(r.rating) / 1.0}}

    Repo.all(query)
    |> Enum.into(%{})
  end
end
