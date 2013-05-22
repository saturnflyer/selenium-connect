require 'selenium-connect'

describe "YAML" do

  it 'setting config_file returns a proper config object' do
    SeleniumConnect.configure do |c|
      c.config_file = "#{Dir.pwd}/spec/example.yaml"
    end
  end

end
