class MinhaContaPage < SitePrism::Page
    set_url '?controller=my-account'

    element :page_title, '.page-heading'
    element :account_name, '[title="View my customer account"]'

end