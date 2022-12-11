module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data GenresController
    = GenresAction
    | NewGenreAction
    | ShowGenreAction { genreId :: !(Id Genre) }
    | CreateGenreAction
    | EditGenreAction { genreId :: !(Id Genre) }
    | UpdateGenreAction { genreId :: !(Id Genre) }
    | DeleteGenreAction { genreId :: !(Id Genre) }
    deriving (Eq, Show, Data)

data BooksController
    = BooksAction
    | NewBookAction
    | ShowBookAction { bookId :: !(Id Book) }
    | CreateBookAction
    | EditBookAction { bookId :: !(Id Book) }
    | UpdateBookAction { bookId :: !(Id Book) }
    | DeleteBookAction { bookId :: !(Id Book) }
    deriving (Eq, Show, Data)

data AuthorsController
    = NewAuthorAction
    | ShowAuthorAction { authorId :: !(Id Author) }
    | CreateAuthorAction
    | EditAuthorAction { authorId :: !(Id Author) }
    | UpdateAuthorAction { authorId :: !(Id Author) }
    | DeleteAuthorAction { authorId :: !(Id Author) }
    | GetAuthorNameAction { authorId :: !(Id Author) }
    deriving (Eq, Show, Data)
