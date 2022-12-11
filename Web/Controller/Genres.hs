module Web.Controller.Genres where

import Web.Controller.Prelude
import Web.View.Genres.Index
import Web.View.Genres.New
import Web.View.Genres.Edit
import Web.View.Genres.Show

instance Controller GenresController where
    action GenresAction = do
        genres <- query @Genre |> fetch
        render IndexView { .. }

    action NewGenreAction = do
        let genre = newRecord
        render NewView { .. }

    action ShowGenreAction { genreId } = do
        genre <- fetch genreId
        render ShowView { .. }

    action EditGenreAction { genreId } = do
        genre <- fetch genreId
        render EditView { .. }

    action UpdateGenreAction { genreId } = do
        genre <- fetch genreId
        genre
            |> buildGenre
            |> ifValid \case
                Left genre -> render EditView { .. }
                Right genre -> do
                    genre <- genre |> updateRecord
                    setSuccessMessage "Genre updated"
                    redirectTo EditGenreAction { .. }

    action CreateGenreAction = do
        let genre = newRecord @Genre
        genre
            |> buildGenre
            |> ifValid \case
                Left genre -> render NewView { .. } 
                Right genre -> do
                    genre <- genre |> createRecord
                    setSuccessMessage "Genre created"
                    redirectTo GenresAction

    action DeleteGenreAction { genreId } = do
        genre <- fetch genreId
        deleteRecord genre
        setSuccessMessage "Genre deleted"
        redirectTo GenresAction

buildGenre genre = genre
    |> fill @["name", "description"]
