module Web.View.Genres.Show where
import Web.View.Prelude

data ShowView = ShowView { genre :: Genre }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Genre</h1>
        <p>{genre}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Genres" GenresAction
                            , breadcrumbText "Show Genre"
                            ]