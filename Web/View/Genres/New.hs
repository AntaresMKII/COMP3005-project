module Web.View.Genres.New where
import Web.View.Prelude

data NewView = NewView { genre :: Genre }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Genre</h1>
        {renderForm genre}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Genres" GenresAction
                , breadcrumbText "New Genre"
                ]

renderForm :: Genre -> Html
renderForm genre = formFor genre [hsx|
    {(textField #name)}
    {(textField #description)}
    {submitButton}

|]