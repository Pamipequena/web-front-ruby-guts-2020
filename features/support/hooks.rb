Before do 
    @app = App.new
end

After do |scenario|
    if scenario.failed?
        page.save_screenshot("screenshots/#{scenario.name}#{Time.now}_screenshot.png")
    end
end