require '../server.rb'
require 'rspec'


RSpec.describe Blog do 
  before(:each) do 
    @blog = Blog.new
  end

  describe "#home" do
    it "should load the home page" do
      get "/"
      expect(last_response).to be_ok
    end
  end

  describe "" do
    it "#posts returns list of posts" do
      expect(@blog.container[0].title).to eq("Wine and Cheese")
    end
  end
end