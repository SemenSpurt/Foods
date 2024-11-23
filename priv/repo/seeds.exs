# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Foods.Repo.insert!(%Foods.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Foods.Food.Product
alias Foods.Repo

%Product{name: "Milk", prots: 2.2, fats: 2.2, hydro: 2.2} |> Repo.insert!
%Product{name: "Bread", prots: 1.1, fats: 2.1, hydro: 2.2} |> Repo.insert!
%Product{name: "Corn", prots: 2.2, fats: 2.2, hydro: 2.2} |> Repo.insert!
%Product{name: "Pop", prots: 1.1, fats: 2.1, hydro: 2.2} |> Repo.insert!
%Product{name: "Lock", prots: 2.2, fats: 2.2, hydro: 2.2} |> Repo.insert!
%Product{name: "Smoke", prots: 1.1, fats: 2.1, hydro: 2.2} |> Repo.insert!