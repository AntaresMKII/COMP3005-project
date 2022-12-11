module Web.Controller.Authors where

import Web.Controller.Prelude
import Web.View.Authors.Index
import Web.View.Authors.New
import Web.View.Authors.Edit
import Web.View.Authors.Show

instance Controller AuthorsController where
    action GetAuthorNameAction { authorId } = undefined

    action NewAuthorAction = do
        let author = newRecord
        render NewView { .. }

    action ShowAuthorAction { authorId } = do
        author <- fetch authorId
        render ShowView { .. }

    action EditAuthorAction { authorId } = do
        author <- fetch authorId
        render EditView { .. }

    action UpdateAuthorAction { authorId } = do
        author <- fetch authorId
        author
            |> buildAuthor
            |> ifValid \case
                Left author -> render EditView { .. }
                Right author -> do
                    author <- author |> updateRecord
                    setSuccessMessage "Author updated"
                    redirectTo EditAuthorAction { .. }

    action CreateAuthorAction = do
        let author = newRecord @Author
        author
            |> buildAuthor
            |> ifValid \case
                Left author -> render NewView { .. } 
                Right author -> do
                    author <- author |> createRecord
                    setSuccessMessage "Author created"

    action DeleteAuthorAction { authorId } = do
        author <- fetch authorId
        deleteRecord author
        setSuccessMessage "Author deleted"

buildAuthor author = author
    |> fill @["bio", "nationality", "fname", "lname", "dob"]
