module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction 
    | SearchBookAction
    deriving (Eq, Show, Data)

data BooksController
    = BooksAction
    | ShowBookAction { bookId :: !(Id Book) }
    deriving (Eq, Show, Data)
