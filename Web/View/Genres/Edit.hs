module Web.View.Genres.Edit where
import Web.View.Prelude

data EditView = EditView { genre :: Genre }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Genre</h1>
        {renderForm genre}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Genres" GenresAction
                , breadcrumbText "Edit Genre"
                ]

renderForm :: Genre -> Html
renderForm genre = formFor genre [hsx|
    {(textField #name)}
    {(textField #description)}
    {submitButton}

|]