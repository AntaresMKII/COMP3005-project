module Web.Controller.Books where

import Web.Controller.Prelude
import Web.View.Books.Index
import Web.View.Books.New
import Web.View.Books.Edit
import Web.View.Books.Show

import Application.BooksQuery

-- here the actions are located for the book 
instance Controller BooksController where
    action BooksAction = do
        -- the following line calls the function located in Application/BooksQuery.hs file
        booksWithAuthorName <- fetchBookWithAuthorName
        render IndexView { .. }

    action ShowBookAction { bookId } = do
        -- the following line calls the function located in Application/BooksQuery.hs file
        (book:_) <- fetchBookWithInfo (Only bookId)
        render ShowView { .. }
