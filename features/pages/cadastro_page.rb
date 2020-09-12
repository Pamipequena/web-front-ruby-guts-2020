class CadastroPage < SitePrism::Page
    set_url '?controller=authentication&back=my-account'
    element :email_create_account_field, '#email_create'
    element :create_account_btn, '#SubmitCreate'
    element :title_fem_rd, '#id_gender2'
    element :title_masc_rd, '#id_gender1'
    element :first_name_field,  '#customer_firstname'
    element :last_name_field, '#customer_lastname'
    element :password_field, '#passwd'
    element :day_select, '#uniform-days'
    element :month_select, '#uniform-months'
    element :year_select, '#uniform-years'
    element :newsletter_checkbox, '#uniform-newsletter'
    element :address_field, '#address1'
    element :city_field, '#city'
    element :state_select, '#uniform-id_state'
    elements :state_options, '#uniform-id_state option'
    element :zip_code_field, '#postcode'
    element :mobile_phone_field, '#phone_mobile'
    element :address_alias_field, '#alias'
    element :register_btn, '#submitAccount'

    #@ = instância (ao terminar a execução do seu escopo ea deixa de existir)
    #@@ = classe (no ciclo de vida da classe)
    #$ = global

    def iniciar_criacao_conta(email)
        case email
        when 'aleatorios'
            @email = Faker::Internet.email(domain: 'guts')
        when 'padrao'
            @email = UserData.get(email)
        else
            @email = email
        end
        email_create_account_field.set @email
        create_account_btn.click
    end

    def preencher_form_com_dados_fixos
        title_fem_rd.set true
        @@first_name = 'Joana'
        first_name_field.set @@first_name
        @@last_name = 'Silva'
        last_name_field.set @@last_name
        password_field.set '12345'
        day_select.select '10'
        month_select.select 'September'
        year_select.select '1990'
        newsletter_checkbox.click
        address_field.set 'Rua A, 15'
        city_field.set 'Porto Alegre'
        state_select.click 
        option = state_options.find {|option| option.text.include?("Iowa")}
        option.click
        zip_code_field.set '00000'
        mobile_phone_field.set '5551988776655'
        address_alias_field.set 'Casa'
    end

    def preencher_form_com_dados_aleatorios
        title_fem_rd.set true
        @@first_name = Faker::Name.first_name
        first_name_field.set @@first_name
        @@last_name = Faker::Name.last_name
        last_name_field.set @@last_name
        password_field.set Faker::Internet.password(min_length: 5, max_length: 10, mix_case: true, special_characters: true)
        day_select.select '10'
        month_select.select 'September'
        year_select.select '1990'
        newsletter_checkbox.click
        address_field.set 'Rua A, 15'
        city_field.set 'Porto Alegre'
        state_select.click 
        option = state_options.find {|option| option.text.include?("Iowa")}
        option.click
        zip_code_field.set '00000'
        mobile_phone_field.set Faker::PhoneNumber.cell_phone_in_e164
        address_alias_field.set 'Casa'
    end

    def preencher_form_com_dados_de_exemplos(gender, first_name, last_name, password, day, month, year, newsletter, address, city, zipcode, state, phone, address_name)  
        gender.eql?('fem') ? title_fem_rd.set(true) : title_masc_rd.set(true)
        @@first_name = first_name
        first_name_field.set @@first_name
        @@last_name = last_name
        last_name_field.set @@last_name
        password_field.set password
        day_select.select day
        month_select.select month
        year_select.select year
        unless newsletter.eql?('no')
            newsletter_checkbox.click
        end
        address_field.set address
        city_field.set city
        state_select.click 
        option = state_options.find {|option| option.text.include?(state)}
        option.click
        zip_code_field.set zipcode
        mobile_phone_field.set phone
        address_alias_field.set address_name
    end

    def preencher_form_com_dados_datafile
        UserData.get('gender').eql?('fem') ? title_fem_rd.set(true) : title_masc_rd.set(true)
        @@first_name = UserData.get('first_name')
        first_name_field.set @@first_name
        @@last_name = UserData.get('last_name')
        last_name_field.set @@last_name
        password_field.set UserData.get('password')
        day_select.select UserData.get('day')
        month_select.select UserData.get('month')
        year_select.select UserData.get('year')
        unless newsletter.eql?('no')
            newsletter_checkbox.click
        end
        address_field.set UserData.get('address')
        city_field.set UserData.get('city')
        state_select.click 
        option = state_options.find {|option| option.text.include?('state')}
        option.click
        zip_code_field.set UserData.get('zipcode')
        mobile_phone_field.set UserData.get('phone')
        address_alias_field.set UserData.get('address_name')
    end

    def confirmar_cadastro
        register_btn.click
    end

    def account_full_name
        "#{@@first_name} #{@@last_name}"
    end
end