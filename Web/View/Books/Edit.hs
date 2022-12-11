module Web.View.Books.Edit where
import Web.View.Prelude

data EditView = EditView { book :: Book }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Book</h1>
        {renderForm book}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Books" BooksAction
                , breadcrumbText "Edit Book"
                ]

renderForm :: Book -> Html
renderForm book = formFor book [hsx|
    {(textField #isbn)}
    {(textField #nPages)}
    {(textField #summary)}
    {(textField #price)}
    {(textField #title)}
    {(textField #releaseDate)}
    {(textField #inStock)}
    {(textField #publisherPercentage)}
    {(textField #publisherId)}
    {submitButton}

|]