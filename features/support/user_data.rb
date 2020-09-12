require 'json'
require 'yaml'
require 'ostruct'


class UserData
    @UserData = JSON.parse(YAML.load(File.read('features/support/data/user_info.yml')).to_json, object_class: OpenStruct)

    def self.get(info)
        @UserData.send(info)
    end
end