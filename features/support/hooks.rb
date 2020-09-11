Before do 
    @app = App.new
end

After do |scenario|
    if scenario.failed?
        page.save_screenshot("screenshots/#{scenario.name}_screenshot.png")
    end
end