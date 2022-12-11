module Web.View.Authors.New where
import Web.View.Prelude

data NewView = NewView { author :: Author }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Author</h1>
        {renderForm author}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Authors" BooksAction
                , breadcrumbText "New Author"
                ]

renderForm :: Author -> Html
renderForm author = formFor author [hsx|
    {(textField #bio)}
    {(textField #nationality)}
    {(textField #fname)}
    {(textField #lname)}
    {(textField #dob)}
    {submitButton}

|]
