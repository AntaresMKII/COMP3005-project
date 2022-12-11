module Web.View.Authors.Show where
import Web.View.Prelude

data ShowView = ShowView { author :: Author }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Author</h1>
        <p>{author}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Authors" BooksAction
                            , breadcrumbText "Show Author"
                            ]
